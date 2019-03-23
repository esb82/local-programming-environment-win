# check Is Principal / Administrator
$identity = [Security.Principal.WindowsIdentity]::GetCurrent()
$principal = new-object Security.Principal.WindowsPrincipal $identity
if ($principal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator) -eq $false) {
	$psArgs = '-noprofile -nologo -executionpolicy bypass -file "{0}"' -f $MyInvocation.MyCommand.Path
	Start-Process -FilePath 'powershell.exe' -ArgumentList $psArgs -Verb RunAs
	exit
}
	
	
Get-ComputerInfo -Property Windows*


# 

# Set up tab completion in PowerShell
Install-Module posh-docker
Import-Module posh-docker
