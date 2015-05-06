$remoteDesktopsSubDir = "RemoteDesktops"

$computerName = Read-Host -Prompt "Computer Name"
$isInDomain = Read-Host -Prompt "Is in domain (y/n)"

if ($isInDomain -eq "y")
{
    $domainName = Read-Host -Prompt "Domain Name"
}
else
{
    $domainName = $computerName
}

$userName = Read-Host -Prompt "User Name"

$content = Get-Content TEMPLATE.rdp
$content = $content.Replace("%ComputerName%", $computerName)
$content = $content.Replace("%DomainName%", $domainName)
$content = $content.Replace("%UserName%", $userName)

if (-not (Test-Path $remoteDesktopsSubDir))
{
    New-Item $remoteDesktopsSubDir -ItemType directory | Out-Null
}

Set-Content "$remoteDesktopsSubDir\$computerName.rdp" -Value $content

$shell = New-Object -ComObject WScript.Shell
$shortcut = $shell.CreateShortcut("$remoteDesktopsSubDir\$computerName.lnk")
$shortcut.TargetPath = "C:\Windows\system32\mstsc.exe"
$shortcut.Arguments = "$PSScriptRoot\$remoteDesktopsSubDir\$computerName.rdp"
$shortcut.Save()