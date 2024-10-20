# Connect Car Scanner app with OBDLink LX and have recording active.
# Record 5-10 seconds while car is on. It needs to gather all the data over some time.
# Turn off car, disconnect.
# Export recording as CSV #1 and place file in this folder
# Run code below


# Import, disregard time property, find unique values by PID, export as csv
$data = Import-Csv -Path './2024-10-20 19-09-27.csv' -Delimiter ';' | 
Select-Object PID,VALUE,UNITS |
Sort-Object -Unique -Property PID

# Export in multiple formats
$data | Export-Csv -Path './report.csv' -Delimiter ';'
$data | Format-MarkdownTableTableStyle -HideStandardOutput -ShowMarkdown -DoNotCopyToClipboard -Property PID,VALUE,UNITS | Out-File -FilePath ./report.md
