@echo off

FOR /F "tokens=1,2,3,4*" %%i in (decodeinput.txt) do (
	start "Program" HidePicture.exe %%i %%j %%k %%l
)
pause