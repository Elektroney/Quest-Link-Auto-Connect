# ADB command to be executed
$adbCommand = 'adb shell am start -S com.oculus.xrstreamingclient/.MainActivity'

# Register WMI event to listen for USB device insertions
Register-WmiEvent -Query "SELECT * FROM __InstanceCreationEvent WITHIN 2 WHERE TargetInstance ISA 'Win32_USBHub'" -Action {
    Start-Process -FilePath "adb" -ArgumentList "shell am start -S com.oculus.xrstreamingclient/.MainActivity"
}

# Keep the script running to listen for events
while ($true) {
    Start-Sleep -Seconds 5
}
