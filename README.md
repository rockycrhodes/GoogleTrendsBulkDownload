# GoogleTrendsBulkDownload
Download google trends search insights data in bulk using an R script.

This is a script developed by Rocky Rhodes and Jennie Qu-Lee for downloading search insights data from Google Trends in bulk (more than the 5 keyword limit provided in the web UI). Credit also goes to Ruben Vezzoli who originally published a prior version of this script: https://www.rubenvezzoli.online/bulk-download-data-google-trends-r/

Some things to note: 
- You will need to use dates for which there is FULL data in Google Trends (partial data does not seem to pull using this script). 
- Keep your list of keywords to a minimum (< 1,000 keywords per day). 
