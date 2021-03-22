@echo off
COLOR A
TITLE Select Steam account

taskkill.exe /F /IM steam.exe

cls
echo(
echo(
echo(
echo                                      Select your account
echo                            =======================================
echo(
echo 1) "SteamUsername1"
echo 2) "SteamUsername2"
echo 3) "SteamUsername3"
echo 4) "SteamUsername4"
echo(

CHOICE /M Select /C 1234

If Errorlevel 4 Goto 4
If Errorlevel 3 Goto 3
If Errorlevel 2 Goto 2
If Errorlevel 1 Goto 1

:4
set username="SteamUsername4"
Goto end
:3
set username="SteamUsername3"
Goto end
:2
set username="SteamUsername2"
Goto end
:1
set username="SteamUsername1"
Goto end

:end

reg add "HKCU\Software\Valve\Steam" /v AutoLoginUser /t REG_SZ /d %username% /f
reg add "HKCU\Software\Valve\Steam" /v RememberPassword /t REG_DWORD /d 1 /f
start steam://open/main

exit