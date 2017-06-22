function Git-Status-All{
    $dirs = Get-ChildItem -Path . | ?{ $_.PSIsContainer }
    $back = pwd

    foreach ($dir in $dirs)
    {
        cd $dir.FullName
        echo "`n"
        echo "-------------------------------------------------------------------------------"
        echo $dir.FullName
        git status
    }   

    cd $back.Path
}
Set-Alias gstatus Git-Status-All


function Git-Pull-All{
    $dirs = Get-ChildItem -Path . | ?{ $_.PSIsContainer }
    $back = pwd

    foreach ($dir in $dirs)
    {
        cd $dir.FullName
        echo "`n"
        echo "-------------------------------------------------------------------------------"
        echo $dir.FullName
        git status
    }   

    cd $back.Path
}
Set-Alias gpull Git-Pull-All