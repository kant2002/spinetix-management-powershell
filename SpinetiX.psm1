<# 
 .Synopsis
  Displays a visual representation of a calendar.

 .Description
  Gets log from the SpinetiX controller

 .Parameter Address
  Network address of the SpinetiX controller

 .Parameter UserName
  Login to access SpinetiX instance 

 .Parameter Password
  Password to access SpinetiX instance

 .Parameter LogFile
  Name of the log file to get
  

 .Example
   # Show a default display of this month.
   Get-SpinetiX-Log -Address 192.168.1.100 -LogFile player.log

#>
function Get-SpinetiX-Log {
param(
    [Parameter(Mandatory=$True)]
	[string] $Address,
    
    [Parameter(Mandatory=$False)]
	[string] $UserName = "",
    
    [Parameter(Mandatory=$False)]
	[string] $Password = "",
    
    [Parameter(Mandatory=$True)]
	[string] $LogFile
)
    $url = "http://" + $Address + "/log/" + $LogFile 
    $WebClient = New-Object System.Net.WebClient
    $WebClient.Credentials = New-Object System.Net.Networkcredential($UserName, $Password)
	$WebClient.DownloadFile($url, $LogFile)
}

Export-ModuleMember -Function Get-SpinetiX-Log 
