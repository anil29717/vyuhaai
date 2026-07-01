$HtmlPath = Join-Path -Path $PSScriptRoot -ChildPath "email_template.html"

if (-not (Test-Path $HtmlPath)) {
    Write-Host "Could not find email_template.html in the same folder." -ForegroundColor Red
    Exit
}

$HtmlBody = Get-Content $HtmlPath -Raw

try {
    $Outlook = New-Object -ComObject Outlook.Application
    $Mail = $Outlook.CreateItem(0)
    $Mail.Subject = "Vyuha.ai — Intelligence That Operates"
    $Mail.HTMLBody = $HtmlBody
    $Mail.Display()
    Write-Host "Outlook window opened successfully!" -ForegroundColor Green
}
catch {
    Write-Host "Failed to open Outlook. Make sure Outlook Desktop is installed and running." -ForegroundColor Red
    Write-Host $_.Exception.Message
}
