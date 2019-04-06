title v1.2.0.0

:main
@echo off
mode con cols=41 lines=6
cls

timeout 1 /nobreak > nul

echo.
call :c 00 "             "
call :c 40 " "
call :c 1F " 1> Encrypt  "
call :c 40 " "
echo.
call :c 00 "             "
call :c 40 " "
call :c 1F " 2> Decrypt  "
call :c 40 " "
echo.
call :c 00 "             "
call :c 10 " "
call :c 4F " 3> Firewall "
call :c 10 " "
echo.
call :c 00 "             "
call :c 10 " "
call :c 4F " 4>   SMB    "
call :c 10 " "
echo.
call :c 00 "             "

choice /c:1234c > nul
if %errorlevel% equ 1 goto encrypt
if %errorlevel% equ 2 goto decrypt
if %errorlevel% equ 3 goto FW
if %errorlevel% equ 4 goto SMB
if %errorlevel% equ 5 goto hidden

goto main

:FW
cls
mode con cols=500 lines=500
netsh advfirewall firewall add rule name="RANSOMEWARE PORT BLOCK TCP" dir=in action=Block protocol=TCP localport=137-139,445
netsh advfirewall firewall add rule name="RANSOMEWARE PORT BLOCK UDP" dir=in action=Block protocol=UDP localport=137-139,445
pause





:encrypt
REM root path check
cd > %tmp%\cd_tmp
set /p cd_tmp=<%tmp%\cd_tmp

for /L %%C in (0x41,1,0x5A) do (
    cmd /C exit %%C
    for /F %%D in ('
        forfiles /P "%~dp0." /M "%~nx0" /C "cmd /C echo 0x%%=ExitCode:~-2%%"
    ') do if "%cd_tmp%"=="%%D:\" goto WARNING
)

REM Encrypt
mode con cols=40 lines=1

ren tmp\Encrypt.dll Encrypt.bat
ren %tmp%\encrypt_list.dll encrypt_list.bat

cmd /c tmp\Encrypt.bat
cmd /c %tmp%\encrypt_list.bat

del %tmp%\encrypt_list.bat
del %tmp%\encrypt_list.db

exit /b

:decrypt
REM Decrypt
mode con cols=40 lines=1

ren tmp\Decrypt.dll Decrypt.bat
ren %tmp%\decrypt_list.dll decrypt_list.bat

cmd /c  tmp\Decrypt.bat
cmd /c  %tmp%\decrypt_list.bat

del %tmp%\decrypt_list.bat
del %tmp%\decrypt_list.db

exit /b

:WARNING
REM root path check
del %tmp%\cd_tmp
mode con cols=85 lines=10
cls

color F
echo.
call :c 00 "                                     "
call :c CF "  WARNING.  "
echo.
echo.
call :c 00 "          "
echo.
call :c 00 "          "
call :c CF "     ��ΰ� ����̺� �ֻ��� �Դϴ�. ������ ����Ͻðڽ��ϱ�?    "
echo.
call :c 00 "          "
call :c CF " The path is at the root of the drive. Do you want to continue? "
echo.
call :c 00 "          "
call :c CF "        �ѫ����ɫ髤�֪���߾�ȪǪ����۪�Ȫ��˪��ު���?         "
echo.
call :c 00 "          "
echo.
call :c 00 "                                        "
call :c CF " Y��N "
choice /c:yn > nul
if %errorlevel% equ 1 goto RE_WARNING
if %errorlevel% equ 2 goto main
goto main

:RE_WARNING
REM root path recheck
del %tmp%\cd_tmp
mode con cols=88 lines=10
cls

color F
echo.
call :c 00 "                                     "
call :c CF "  WARNING.  "
echo.
echo.
call :c 00 "          "
echo.
call :c 00 "          "
call :c CF "    ��� å���� ���ο��� �ֽ��ϴ�. �����Ͻø� Y�� �����ּ���.   "
echo.
call :c 00 "          "
call :c CF "     All responsibilities are to you. If agree, press the Y.    "
echo.
call :c 00 "          "
call :c CF "    ��ƪ���������Ѫ˪���ު������򪷪���Y���㪷�ƪ���������   "
echo.
call :c 00 "          "
echo.
call :c 00 "                                        "
call :c CF " Y��N "

choice /c:yn > nul
if %errorlevel% equ 1 goto hidden
if %errorlevel% equ 2 goto main

exit /b

:hidden
mode con cols=59 lines=7
color F
cls

REM SGlkZGVuIENvbW1hbmQ= => Hidden Command
REM cGx6IHByZXNzIHRoZSBE => plz press the D
REM S29uYW1pIGNvZGU=       => Konami code

call :c 10 " "
call :c F0 " 01897259520B03D6D90AF3357655C1DFD2DC91F9 "
call :c 60 " "
echo.
call :c 20 " "
call :c F0 " F7B09C8E1D979003B2C67E44CE84CB211E8DF95C "
call :c 50 " "
echo.
call :c 30 " "
call :c F0 " 265516849"
call :c F1 "[SGlkZGVuIENvbW1hbmQ=]"
call :c F0 "0D3EB4907 "
call :c 40 " "
echo.
call :c 40 " "
call :c F0 " CE5B11105"
call :c F4 "[cGx6IHByZXNzIHRoZSBE]"
call :c F0 "29052448F "
call :c 30 " "
echo.
call :c 50 " "
call :c F0 " D3F752B749CA4259FFB5C2FC01B3A524BAA335EF "
call :c 20 " "
echo.
call :c 60 " "
call :c F0 " 376F3ED323FC2A253DDC2834BFC9F59C753170C0 "
call :c 10 " "
echo.

choice /c:d > nul
if %errorlevel% equ 1 goto hidden_konami
goto main

:hidden_konami
cls
call :c 10 " "
call :c F0 " 01897259520B03D6D90AF3357655C1DFD2DC91F9 "
call :c 60 " "
echo.
call :c 20 " "
call :c F0 " F7B09C8E1D979003B2C67E44CE84CB211E8DF95C "
call :c 50 " "
echo.
call :c 30 " "
call :c F0 " 265516849"
call :c F1 "[SGlkZGVuIENvbW1hbmQ=]"
call :c F0 "0D3EB4907 "
call :c 40 " "
echo.
call :c 40 " "
call :c F0 " CE5B1110536"
call :c F4 "[S29uYW1pIGNvZGU=]"
call :c F0 "29052448F63 "
call :c 30 " "
echo.
call :c 50 " "
call :c F0 " D3F752B749CA4259FFB5C2FC01B3A524BAA335EF "
call :c 20 " "
echo.
call :c 60 " "
call :c F0 " 376F3ED323FC2A253DDC2834BFC9F59C753170C0 "
call :c 10 " "
echo.

set /p command=��
if "%command%"=="88224646ba" goto konami
if "%command%"=="88224646BA" goto konami
goto hidden_konami

:konami
mode con cols=51 lines=4
cls

echo.
call :c 00 "                 "
call :c FC "C"
call :c F2 "O"
call :c F3 "N"
call :c F4 "G"
call :c F5 "R"
call :c F6 "A"
call :c F7 "T"
call :c F8 "U"
call :c F9 "L"
call :c FA "A"
call :c FB "T"
call :c FC "I"
call :c FD "O"
call :c F1 "N"
call :c F0 "S"
call :c FC "��"
echo.

timeout /t 2 /nobreak > nul

call :c 00 "              "
call :c 4F "Exit to press a key��"
pause>nul
exit




REM color code

:c
setlocal enableDelayedExpansion

:cp
setlocal
set "s=%~2"
call :cpv %1 s %3
exit /b

:cpv
if not defined DEL call :icp
setlocal enableDelayedExpansion
pushd .
':
cd \
set "s=!%~2!"
for %%n in (^"^

^") do (
  set "s=!s:\=%%~n\%%~n!"
  set "s=!s:/=%%~n/%%~n!"
  set "s=!s::=%%~n:%%~n!"
)
for /f delims^=^ eol^= %%s in ("!s!") do (
  if "!" equ "" setlocal disableDelayedExpansion
  if %%s==\ (
    findstr /a:%~1 "." "\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%"
  ) else if %%s==/ (
    findstr /a:%~1 "." "/.\'" nul
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%"
  ) else (
    >colorPrint.txt (echo %%s\..\')
    findstr /a:%~1 /f:colorPrint.txt "."
    <nul set /p "=%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%%DEL%"
  )
)
if /i "%~3"=="/n" echo(
popd
exit /b

:icp
for /f %%A in ('"prompt $H&for %%B in (1) do rem"') do set "DEL=%%A %%A"
<nul >"%temp%\'" set /p "=."
subst ': "%temp%" >nul
exit /b

:ccp
2>nul del "%temp%\'"
2>nul del "%temp%\colorPrint.txt"
>nul subst ': /d
exit /b
