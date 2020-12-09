#I developed this app for humourless people like me to save jokes from 4chan and repost it elsewhere. 
Add-Type -AssemblyName WindowsBase
Add-Type -AssemblyName PresentationCore


$pathName = Read-Host -Prompt 'Insert path'
$uri = Read-Host -Prompt 'Insert URL of Thread'
cd $pathName

$elem = (Invoke-WebRequest -Uri $uri).AllElements|where {$_.tagName -eq 'blockquote'}

Write-Host 'Press either SHIFT button to ABORT'

Start-Sleep -Seconds 2
$isDown = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::RightShift)
$isDownLeft = [Windows.Input.Keyboard]::IsKeyDown([System.Windows.Input.Key]::LeftShift)

if($isDown){
Write-Warning "ABORTED!!!"
break
}
elseif($isDownLeft){
Write-Warning "ABORTED!!!"
break
}
else{
$uriName = $uri |Split-Path -Leaf
new-item ($uriName + 'thread.txt') 
$pathSet = $uriName + 'thread.txt'
Set-Content ('./' + $pathSet) -Value $elem.outerText
}

Write-Warning 'All Done!
