# prep data + environment -------------------------------------------------

# Install and load the readr gtrendsR & purrr packages
library(readr)
library(gtrendsR)
library(purrr)
library(dplyr)
library(readxl)

# load data & extract keywords list
PDKeywords <- read_excel(PrimeDayKeywords$Keyword)
# manual inspection of dataframe
View(PDKeywords)


# bulk trend function -----------------------------------------------------

# The function wrap all the arguments of the gtrendR::trends function and return only the interest_over_time (you can change that)
googleTrendsData <- function (keywords) {
  # Set the geographic region, time span, Google product,...
  # for more information read the official documentation https://cran.r-project.org/web/packages/gtrendsR/gtrendsR.pdf
  country <- c('US')
  time <- ("2016-09-04 2021-08-21")
  channel <- 'web'
  
  trends <- gtrends(keywords,
                    gprop = channel,
                    geo = country,
                    time = time)
  
  results <- trends$interest_over_time
}


# loop for all keywords and data export -----------------------------------

# for loop to try googleTrendsData function
# and return error message in console when encountered
output <- data.frame()
# change 1 to whichever number when daily quota has been reached
for (i in c(1:length(PDKeywords))) {
  try({
    output_new = map_dfr(.x = PDKeywords[i],
                         .f = googleTrendsData) %>%
      data.frame()
    output <- rbind(output, output_new)
  })
  # export dataframe as csv file in the working directory
  write.csv(output, 'PrimeDay KWs Trends Past 5 Years.csv')
}
