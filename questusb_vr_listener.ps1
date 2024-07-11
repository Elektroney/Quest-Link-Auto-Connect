
$adbCommand = 'adb shell am start -S com.oculus.xrstreamingclient/.MainActivity'

function OnUsbInserted {
    echo "USB device inserted. Connecting QuestLink..."
    Start-Process -FilePath "adb" -ArgumentList "shell am start -S com.oculus.xrstreamingclient/.MainActivity"
}

Write-Output "Registering USB insertion event..."
$usbEvent = Register-WmiEvent -Query "SELECT * FROM __InstanceCreationEvent WITHIN 2 WHERE TargetInstance ISA 'Win32_USBHub'" -Action {
    OnUsbInserted
}


Write-Output "Listening for USB insertions. Press Ctrl+C to exit."
while ($true) {
    Start-Sleep -Seconds 5
}
