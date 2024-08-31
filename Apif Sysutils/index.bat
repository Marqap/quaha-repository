::[Bat To Exe Converter]
::
::YAwzoRdxOk+EWAjk
::fBw5plQjdCyDJGyX8VAjFCtRXheNMmq2OpET/+b34OuDsXEoWvY2bIPe3vqHI+9z
::YAwzuBVtJxjWCl3EqQJgSA==
::ZR4luwNxJguZRRnk
::Yhs/ulQjdF+5
::cxAkpRVqdFKZSjk=
::cBs/ulQjdF+5
::ZR41oxFsdFKZSDk=
::eBoioBt6dFKZSDk=
::cRo6pxp7LAbNWATEpCI=
::egkzugNsPRvcWATEpCI=
::dAsiuh18IRvcCxnZtBJQ
::cRYluBh/LU+EWAnk
::YxY4rhs+aU+IeA==
::cxY6rQJ7JhzQF1fEqQJhZksaHUrSXA==
::ZQ05rAF9IBncCkqN+0xwdVsFAlTMbQs=
::ZQ05rAF9IAHYFVzEqQIROBJSDDebL36uD7kPiA==
::eg0/rx1wNQPfEVWB+kM9LVsJDAWSNW2FFawP/fzy4/nJsUETNA==
::fBEirQZwNQPfEVWB+kM9LVsJDAWSNW33Fbsd4eS2/e+Lp0wOUYI=
::cRolqwZ3JBvQF1fEqQJhZksaHUSNLiuXB6MZ+uH45PnL4kQJFOA6e4DW36fOJvIc5wXle9Yozn8ajMRMDVsWfBO/Dg==
::dhA7uBVwLU+EWG2B9U9wCQtdSmQ=
::YQ03rBFzNR3SWATElA==
::dhAmsQZ3MwfNWATEphJifHs=
::ZQ0/vhVqMQ3MEVWAtB9wSA==
::Zg8zqx1/OA3MEVWAtB9wSA==
::dhA7pRFwIByZRRnk
::Zh4grVQjdCyDJGyX8VAjFCtRXheNMmq2OpET/+b34OuDsXE8ROs5OLzCyaGaKewApED8cPY=
::YB416Ek+ZW8=
::
::
::978f952a14a936cc963da21a135fa983
@echo off
setlocal enabledelayedexpansion
call :MainMenu
:ErrScreen
color 47
title Apif Sysutils - An exception occurred
echo An error occurred with Apif SysUtils
echo Code %code%
echo Press Enter to Retry.
pause
goto MainMenu
:MainMenu
title Apif Sysutils -Main Menu
color 0F
cls
set code=0
echo ===========================
echo      SYSTEM UTILITIES
echo ===========================
echo 1. View System Information
echo 2. Clean Temporary Files
echo 3. Shutdown Computer
echo 4. Check Disk Space
echo 5. List Running Processes
echo 6. Kill a Process
echo 7. Start a Service
echo 8. Stop a Service
echo 9. Restart Computer
echo 10. Open Command Prompt
echo 11. View System Log
echo 12. Check Network Configuration
echo 13. Ping a Website
echo 14. Flush DNS Cache
echo 15. Check for Windows Updates
echo 16. View IP Configuration
echo 17. List Installed Programs
echo 18. Exit
echo 19. Crash this instance
echo 20. Crash with a custom code
echo ===========================
set /p choice="Choose an option (1-20): "

if "%choice%"=="1" (
    call :ViewSystemInfo
) else if "%choice%"=="2" (
    call :CleanTempFiles
) else if "%choice%"=="3" (
    call :ShutdownComputer
) else if "%choice%"=="4" (
    call :CheckDiskSpace
) else if "%choice%"=="5" (
    call :ListProcesses
) else if "%choice%"=="6" (
    call :KillProcess
) else if "%choice%"=="7" (
    call :StartService
) else if "%choice%"=="8" (
    call :StopService
) else if "%choice%"=="9" (
    call :RestartComputer
) else if "%choice%"=="10" (
    call :OpenCmd
) else if "%choice%"=="11" (
    call :ViewSystemLog
) else if "%choice%"=="12" (
    call :CheckNetworkConfiguration
) else if "%choice%"=="13" (
    call :PingWebsite
) else if "%choice%"=="14" (
    call :FlushDNSCache
) else if "%choice%"=="15" (
    call :CheckWindowsUpdates
) else if "%choice%"=="16" (
    call :ViewIPConfiguration
) else if "%choice%"=="17" (
    call :ListInstalledPrograms
) else if "%choice%"=="18" (
    exit
) else if "%choice%"=="19" (
    cls
    call :ErrScreen
) else if "%choice%"=="20" (
    cls
    set /p code=Enter crash code:
    cls
    call :ErrScreen
) else (
    echo Invalid choice. Please try again.
    pause
    goto MainMenu
)

goto MainMenu

:ViewSystemInfo
echo Viewing System Information...
powershell -command "Get-ComputerInfo | Format-List"
pause
goto MainMenu

:CleanTempFiles
echo Cleaning temporary files...
del /q /s "%TEMP%\*.*" 2>nul
echo Temporary files cleaned!
pause
goto MainMenu

:ShutdownComputer
echo Are you sure you want to shutdown your computer? (Y/N)
set /p confirm="Enter your choice: "
if /I "%confirm%"=="Y" (
    shutdown /s /t 0
) else (
    echo Shutdown canceled.
    pause
)
goto MainMenu

:CheckDiskSpace
echo Checking disk space...
powershell -command "Get-PSDrive -PSProvider FileSystem"
pause
goto MainMenu

:ListProcesses
echo Listing running processes...
tasklist
pause
goto MainMenu

:KillProcess
set /p processName="Enter the name of the process to kill (e.g., notepad.exe): "
echo Attempting to kill process: %processName%
taskkill /IM "%processName%" /F
if %errorlevel%==0 (
    echo Process %processName% killed successfully.
) else (
    echo Failed to kill process. It may not exist.
)
pause
goto MainMenu

:StartService
set /p serviceName="Enter the name of the service to start: "
echo Attempting to start service: %serviceName%
net start "%serviceName%"
if %errorlevel%==0 (
    echo Service %serviceName% started successfully.
) else (
    echo Failed to start service. It may not exist or is already running.
)
pause
goto MainMenu

:StopService
set /p serviceName="Enter the name of the service to stop: "
echo Attempting to stop service: %serviceName%
net stop "%serviceName%"
if %errorlevel%==0 (
    echo Service %serviceName% stopped successfully.
) else (
    echo Failed to stop service. It may not exist or is already stopped.
)
pause
goto MainMenu

:RestartComputer
echo Are you sure you want to restart your computer? (Y/N)
set /p confirm="Enter your choice: "
if /I "%confirm%"=="Y" (
    shutdown /r /t 0
) else (
    echo Restart canceled.
    pause
)
goto MainMenu

:OpenCmd
echo Opening Command Prompt...
start cmd
goto MainMenu

:ViewSystemLog
echo Viewing system log...
powershell -command "Get-EventLog -LogName System -Newest 10"
pause
goto MainMenu

:CheckNetworkConfiguration
echo Checking network configuration...
ipconfig
pause
goto MainMenu

:PingWebsite
set /p website="Enter the website to ping (e.g., google.com): "
echo Pinging %website%...
ping %website%
pause
goto MainMenu

:FlushDNSCache
echo Flushing DNS cache...
ipconfig /flushdns
echo DNS cache flushed!
pause
goto MainMenu

:CheckWindowsUpdates
echo Checking for Windows updates...
powershell -command "Get-WindowsUpdate"
pause
goto MainMenu

:ViewIPConfiguration
echo Viewing IP configuration...
ipconfig /all
pause
goto MainMenu

:ListInstalledPrograms
echo Listing installed programs...
wmic product get name, version
pause
goto MainMenu