@echo off

cd.> codeinput.txt
cd.> decodeinput.txt
setlocal enabledelayedexpansion

FOR /R .\Sourcepicture %%i in (*.jpg) do @echo %%i>>input1.txt
FOR /R .\Sourcepicture %%i in (*.png) do @echo %%i>>input1.txt

FOR /R .\Hidepicture %%i in (*.jpg) do @echo %%i>>input2.txt
FOR /R .\Hidepicture %%i in (*.png) do @echo %%i>>input2.txt

set /a num1=0
FOR /F "tokens=1*" %%i in (input1.txt) do (
	set /a num1=!num1!+1

	set /a num2 =0
	FOR /F "tokens=1*" %%x in (input2.txt) do (
	set /a num2=!num2!+1
	if !num1! equ !num2! (echo %%i %%x >>codeinput.txt)
) 
)

del .\input1.txt
del .\input2.txt

FOR /F "tokens=1,2*" %%i in (codeinput.txt) do (
	start "Program" HidePicture.exe %%i %%j
)
pause 