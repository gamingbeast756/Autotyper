@if (@CodeSection == @Batch) @then
@echo off
set SendKeys=CScript //nologo //E:JScript "%~F0"
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
mode con:cols=35 lines=7
@echo Press 1 for custom colors
@echo Press 2 for list of colors
@echo Press 3 for list of characters
@echo Press 4 for Credits
@echo Press 5 for Autotyper
@echo Press 6 to exit
choice /c 123456 /n
if %errorlevel%==1 goto Colors
if %errorlevel%==2 goto Colorslist
if %errorlevel%==3 goto Characters
if %errorlevel%==4 goto Credits
if %errorlevel%==5 goto Autotyper
if %errorlevel%==6 exit

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
set /a Times=1+%Times%
%Sendkeys% "%string%{%command%}"
timeout /t %delay% >nul
goto loop
@end
var WshShell = WScript.CreateObject("WScript.Shell");
WshShell.SendKeys(WScript.Arguments(0));