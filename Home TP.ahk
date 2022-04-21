#NoEnv
SetBatchLines -1
SetTitleMatchMode 2
#SingleInstance Force
SetWorkingDir %A_ScriptDir%

SetKeyDelay, 10, 10

DEBUG := False
targetwinclass := "GLFW30"
targettitle := ""
id := 0

warp := []
temp := ""
inFileLine := 2

ProgState = 0
; 0: Start			  - Program called for first time and setting default state.
; 1: Selected		  - User has selected the target window to send key/mouse activity to
; 2: Ready 			  - The warps have been loaded in the program

#!l::
{
	; Get mouse pos on screen and grab details of program
	MouseGetPos, , , id, control
	WinGetTitle, targettitle, ahk_id %id%
	WinGetClass, targetclass, ahk_id %id%

	; Check if the class of the program is a Minecraft Java Class
	If (!InStr(targetclass, targetwinclass))
	{
		; Class of target program not a match so give a warning message
		ErrorTitle := "Warning"
		ErrorMsg := "The window which you have selected is not Minecraft! It might be unsafe to use this program on anything other than Minecraft if you don't know what you're doing. Do you wish to continue?"
		MsgBox, 0x31, %ErrorTitle%, %ErrorMsg%
		IfMsgBox, Cancel
			ExitApp, 0
	}

	; Target window found, swap to next screen
	ProgState = 1
	MsgBox, 0, Home TP, The Minecraft window was found! One more step left.

	ControlClick, , ahk_id %id%, , Right, , NAU
	ControlClick, , ahk_id %id%, , Left, , NAU

	Sleep 100
	Return
}

#!x::

	; Checks if the target window was found
	if (ProgState != 1)
	{
		Return
	}
	
	; Loads the warps in the warp array
	Loop, 10{
		FileReadLine, temp, warps.txt, %inFileLine%
		Sleep 20
		IfEqual, temp, % warp[inFileLine - 1], {
			Loop, 12 - %inFileLine%{
				warp.Push(" ")
			}
			break
		}
		warp.Push(temp)
		inFileLine++
	}

	; All the initialization was completed
	ProgState = 2
	MsgBox, 0, Home TP, Your home warps were successfully loaded in the program. Have fun!

Return

Numpad0::
	
	; Checks if the warps are loaded
	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSendRaw, ,% warp[1], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return

Numpad1::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, ,% warp[2], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return

Numpad2::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, ,% warp[3], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return
	
Numpad3::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, ,% warp[4], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return

Numpad4::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, ,% warp[5], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return

Numpad5::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, ,% warp[6], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return

Numpad6::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, ,% warp[7], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return

Numpad7::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, ,% warp[8], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return

Numpad8::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, ,% warp[9], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return

Numpad9::

	if (ProgState != 2)
	{
		Return
	}

	ControlSendRaw, , /, ahk_id %id%
	Sleep, 10
	ControlSend, , % warp[10], ahk_id %id%
	Sleep, 10
	ControlSend, ,{Enter}, ahk_id %id%
Return