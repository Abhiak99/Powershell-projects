(netsh wlan show profiles) | Select-String "All User Profile" | ForEach-Object {
$profile = ($_ -split ":")[1].Trim();
$password = (netsh wlan show profile name="$profile" key=clear | Select-String "Key Content").ToString().Split(":")[1].Trim();
$bssid = (netsh wlan show interfaces | Select-String "BSSID").ToString().Split(":")[1].Trim();
 Write-Output "Profile: $profile, BSSID: $bssid, Password: $password"
}
