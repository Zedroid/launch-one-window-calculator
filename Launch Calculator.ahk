; Lorin's single instance Calculator launcher
; Replaces default calculator key functionality on keyboard
; https://github.com/alystair/my-productivity-stack
run script as admin (reload if not as admin) if not A_IsAdmin { Run *RunAs "%A_ScriptFullPath%" ExitApp }
FileCreateShortcut, %A_ScriptFullPath%, %A_Startup%\shortcutname.lnk
Menu, Tray, Icon , calc.exe, 1, 1
Menu, Tray, Tip, Single calculator
Menu, Tray, NoStandard
Menu, Tray, Add, &Calculator, Launch_App2
Menu, Tray, Add
Menu, Tray, Add, Exit, Exit
Menu, Tray, Default, &Calculator

Launch_App2::
IfWinNotExist Calculator
{
	Run calc.exe
	Winwait Calculator
	Winset, Alwaysontop, On, Calculator
	WinActivate Calculator
}
Else WinActivate Calculator
return

Exit:
ExitApp
