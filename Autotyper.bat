ADD DOWNLOAD UPDATE
@if (@CodeSection == @Batch) @then
@echo off
set SendKeys=CScript //nologo //E:JScript "%~F0"
IF EXIST Recources\type (
goto exists
) ELSE (
(
  echo 0
) > Recources\type
goto exists
)
:exists
< Recources\type (
  set /p Type=
)
< Recources\bg (
  set /p bg=
)
< Recources\txt (
  set /p txt=
)
set Times=0
:setup
color %bg%%txt%
Title Setup
cls
mode con:cols=35 lines=4
@echo Press 1 for Autotyper
@echo Press 2 for Settings
@echo Press 3 to exit
choice /c 123456 /n
if %errorlevel%==1 goto Autotyper
if %errorlevel%==2 goto Settings
if %errorlevel%==3 exit

:Settings
mode con:cols=35 lines=7
title settings
@echo Press 1 for custom colors
@echo Press 2 for list of colors
@echo Press 3 for list of characters
@echo Press 4 for statistics
@echo Press 5 to check for updates
@echo Press 6 to exit settings
choice /c 123456 /n
if %errorlevel%==1 goto Colors
if %errorlevel%==2 goto colorslist
if %errorlevel%==3 goto Characters
if %errorlevel%==4 goto Statistics
if %errorlevel%==5 goto Updates
if %errorlevel%==6 goto setup

:Colors
cls
mode con:cols=60 lines=10
Set /p bg="What color do you want the background color to be? "
Set /p txt="What color do you want the text to be? "
(
  echo %bg%
) > Recources\bg
(
  echo %txt%
) > Recources\txt
goto setup

:colorslist
mode con:cols=75 lines=30
cls
color /?
goto setup

:characters
mode con:cols=70 lines=9
cls
@echo characters that can be used: a-z, A-Z, 0-9, -_().?/\
@echo commands that can be typed are LEFT, RIGHT, UP, DOWN,
@echo ENTER, DELETE, PGUP, PGDN, SCROLLLOCK, TAB, F1-F16,
@echo INSERT, ESC, CAPSLOCK, BACKSPACE.
@echo you can also type (command/onenumber/oneletter) (number)
@echo to signify pressing that key a number of times.
@echo for example if you set the command to "BACKSPACE 5"
@echo it would be like pressing left arrow 5 times
pause
goto setup

:credits
mode con:cols=35 lines=5
cls
title credits
color %bg%%txt%
@echo made by Gaming_beast756
@echo https://github.com/gamingbeast756
pause
goto setup

:Statistics
cls
mode con:cols=60 lines=5
@echo You have used this autoclicker to type %Type% things
pause
goto setup

:updates
mode con:cols=100 lines=20
@echo off
FOR /F "Tokens=* USEBACKQ" %%F IN (`curl https://raw.githubusercontent.com/gamingbeast756/Autotyper/main/Autotyper%%20v1.5.bat -L`) DO (
SET availvers=%%F
)
FOR /F "Tokens=* USEBACKQ" %%B IN (`findstr "v1.6 v.1.7 v1.8 v1.9 v2 v2.1 v2.2 v2.3 v2.4 v2.5 v2.6" "%USERPROFILE%\Desktop\Autotyper\Autotyper.bat"`) DO ( 
SET currentvers=%%B
)
IF %availvers%==%currentvers% (
goto noupdate
) ELSE (
goto update
)
:noupdate
@echo There is no update available
pause
goto setup
:update
@echo There is an update available
@echo Press 1 to skip update
@echo Press 2 to open github
@echo Press 3 to automatically update
choice /c 123 /n
if %errorlevel%==1 goto setup
if %errorlevel%==2 Start https://github.com/gamingbeast756/Autotyper
if %errorlevel%==3 curl https://raw.githubusercontent.com/gamingbeast756/Autotyper/main/Autotyper%%20v1.5.bat -L -o "%CD%\Autotyper.bat"

:Autotyper
mode con:cols=90 lines=20
color %bg%%txt%
cls
Title autotyper
@echo INFO-------------------------------------------------------------------------------
@echo Leaving a command blank will produce an error on the cmd window but just ignore it
@echo string will not type a "
@echo do not close cmd window or else it will stop
@echo STRING/DELAY-----------------------------------------------------------------------
set /p string="Type string here. "
set /p delay="Type time delay in seconds here (type 0 for no delay) "
set /p command="What command do you want after it is typed? "
:loop
cls
@echo currently typing "%string%" with a delay of %delay% seconds
@echo You have typed "%string%" %Times% times
(
  echo %Type%
) > Recources\type
%Sendkeys% "%string%{%command%}"
set /a Times=1+%Times%
set /a Type=1+%Type%
timeout /t %delay% >nul
goto loop
@end
var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));
v1.6