Function KillThatProcess
{
    Param (
        [string] $processname
    )

    $ErrorActionPreference = "SilentlyContinue"
    
    $processlist = Get-Process $processname

    $numprocesses = (Get-Process $processname).count

    if ($numprocesses -eq 0)
    {
        Write-Host -BackgroundColor Black -ForegroundColor Yellow "Sorry, there are no processes with the name $processname."
    }
    else
    {
        $decision = Read-Host "There are $numprocesses processes with the name $processname, proceed? Y/N"

        if ($decision -ne "Y" -or $decision -ne "y")
        {
            Write-Host -BackgroundColor Black -ForegroundColor Yellow "You have cancelled the operation. Goodbye."
        }
        else
        {
            $processlist | kill
        }
    }
}

Function Bamboozle
{
    Param (
        [string] $path = (Get-Location)
    )

    $ErrorActionPreference = "SilentlyContinue"
    
    [int] $randomnum = Get-Random (65..90)

    $randomletter = [char] $randomnum

    Write-Host -BackgroundColor Black -ForegroundColor Yellow "Holy smokes, Batman - the random letter is $randomletter."

    $files = Get-ChildItem $path | Where-Object {$_ -is [System.IO.FileInfo]} | Where-Object {$_ -like "*$randomletter*"}

    if ($files -eq $null)
    {
        Write-Host -BackgroundColor Black -ForegroundColor Yellow "Sorry, there are no files containing the letter $randomletter."
    }
    else
    {
        foreach ($_ in $files)
        {
            $_ | Remove-Item -WhatIf
        }
    }
}