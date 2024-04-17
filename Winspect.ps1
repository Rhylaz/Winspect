# Winspect
$OS = $env:computername
$OS_VERS = [environment]::OSVersion.Version

# Constants
$dash = "-" * 32

# Variables
$options = "..."

Clear-Host

Write-Host "
   _             
  / \      _-/\
_/|  \-''-_-  /
__-'         '-\
/  ___     ___ \
/---[!@!'_'!@!]'} 
|  /         \ ;
\   /_   ',-, ;
\_    \    __\
  ''-_ {VxxV}/
    /;'-____'
   /'
 _';
_-'
 _        __ ___  _   _  ____   ____   _____  ____  _____ 
\ \      / /|_ _|| \ | |/ ___| |  _ \ | ____|/ ___||_   _|
 \ \ /\ / /  | | |  \| |\___ \ | |_) ||  _| | |      | |  
  \ V  V /   | | | |\  | ___) ||  __/ | |___| |___   | |  
   \_/\_/   |___||_| \_||____/ |_|    |_____|\____|  |_|  "

# Retrieves the current date on the device.
Get-Date
Start-Sleep -Seconds 1.25

$dash
# View current user permissions.
Write-Host "Current Execution Policy:"
Get-ExecutionPolicy
$dash
# Write-Host "`nAdjust Execution Policy:"
# $dash
# Write-Host "`nSet Current Execution Policy:"
# Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy Unrestricted
# $dash
Write-Host "Device: ${OS}, WIN - ${OS_VERS}"
# Identify which Drive is being primarily used on the system.
Write-Host "Current Drive(s) on ${OS}:"
Get-WmiObject -Class win32_logicaldisk | Format-Table DeviceId, MediaType, @{n="Size in GB";e={[math]::Round($_.Size/1GB,2)}},@{n="FreeSpace";e={[math]::Round($_.FreeSpace/1GB,2)}}
# $drive
# Get-PSDrive
# Write-Host "Volume size of Drive(s) on ${OS}:"
# $volumeSize
# Start-Process -FilePath Drive:\Folder\netsh.exe -ArgumentList "interface show interface"

# U
# Get-NetAdapter
# Get-NetIPInterface

# Run loop to retrieve all ifAlias names on Adapter, including computer name. Mac Address, IPFamily, 
# InterfaceAlias, and DHCP.
# 
# Output .txt file containing all processes running on Windows.
Get-Process | Format-Table -View StartTime | Out-File -FilePath .\Process.txt
