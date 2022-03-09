param ($buildnumber)
write-host $buildnumber


Get-ChildItem -Path .\build$buildnumber\ -Filter *.apk -Recurse -File -Name | ForEach-Object {
	$file = Resolve-Path .\build$buildnumber\$_
	$cmd = "adb install -r -g -d  ""$file"""
	write-host $cmd
    Invoke-Expression $cmd
}