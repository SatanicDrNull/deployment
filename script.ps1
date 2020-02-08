$user = "art-admin"

function Disable-OOBE {
    $p = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OOBE"
    $n = "DisablePrivacyExperience"
    New-Item -Path $p -Force
    New-ItemProperty -Path $p -Name $n -Value 1 -Type DWORD -Force
}

function Add-DesktopShortCutsToDefaultProfile {

Copy-Item "C:\Users\$user\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\System Tools\Command Prompt.lnk" "C:\Users\Default\Desktop\Command Prompt.lnk"
Copy-Item "C:\Users\$user\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Windows PowerShell\Windows PowerShell.lnk" "C:\Users\Default\Desktop\Window PowerShell.lnk"

}

Disable-OOBE
Add-DesktopShortCutsToDefaultProfile