function Add-ToHosts {
    param ($hostName)
    sv hostsLocation -value $env:systemroot\system32\drivers\etc\hosts
    $pattern = [regex] "(?<ip>[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3}.[0-9]{1,3})\t{1,4}(?<url>.*)"
    
    $contents = Get-Content $hostsLocation
    
    $matches = $pattern.Matches($contents, $multiline)
    $matches.count
    # $pattern.Matches($contents) | fl { $($_.Value.ip) }
    # Add line to Hosts file
    
}

function Remove-FromHosts {

}

function Refresh-Dns {

}

function Add-Website {
    param($hostName, $folder)
    
    sv APPCMD -value $env:systemroot\system32\inetsrv\AppCmd.exe
    Invoke-Expression "$APPCMD add site /name:$hostName /bindings:""http/*:80:$hostName"" /physicalPath:""$folder"""
    

}

function Remove-Website {
    param($hostName)
    
    sv APPCMD -value $env:systemroot\system32\inetsrv\AppCmd.exe
    Invoke-Expression "$APPCMD delete site $hostName"
}
