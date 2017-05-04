; #FUNCTION# ====================================================================================================================
; Name ..........: MBR GUI Design
; Description ...: This file creates the "Options" tab under the "Bot" tab
; Syntax ........:
; Parameters ....: None
; Return values .: None
; Author ........:
; Modified ......: CodeSlinger69 (01-2017)
; Remarks .......: This file is part of MyBot, previously known as ClashGameBot. Copyright 2015-2017
;                  MyBot is distributed under the terms of the GNU GPL
; Related .......:
; Link ..........: https://github.com/MyBotRun/MyBot/wiki
; Example .......: No
; ===============================================================================================================================
#include-once

;$hGUI_BotOptions = _GUICreate("", $g_iSizeWGrpTab2, $g_iSizeHGrpTab2, 5, 25, BitOR($WS_CHILD, $WS_TABSTOP), -1, $g_hGUI_BOT)
;GUISwitch($hGUI_BotOptions)

Global $g_hCmbGUILanguage = 0
Global $g_hChkDisableSplash = 0, $g_hChkForMBRUpdates = 0, $g_hChkDeleteLogs = 0, $g_hTxtDeleteLogsDays = 0, $g_hChkDeleteTemp = 0, $g_hTxtDeleteTempDays = 0, _
	   $g_hChkDeleteLoots = 0, $g_hTxtDeleteLootsDays = 0
Global $g_hChkAutostart = 0, $g_hTxtAutostartDelay = 0, $g_hChkCheckGameLanguage = 0, $g_hChkAutoAlign = 0, $g_hTxtAlignOffsetX = 0, $g_hTxtAlignOffsetY = 0, _
	   $g_hCmbAlignmentOptions = 0
;Global $g_hChkUpdatingWhenMinimized = 0
Global $g_hChkBotCustomTitleBarClick = 0, $g_hChkBotAutoSlideClick = 0, $g_hChkHideWhenMinimized = 0, $g_hChkUseRandomClick = 0, $g_hChkScreenshotType = 0, _
	   $g_hChkScreenshotHideName = 0, $g_hTxtTimeAnotherDevice = 0
Global $g_hChkSinglePBTForced = 0, $g_hTxtSinglePBTimeForced = 0, $g_hTxtPBTimeForcedExit = 0, $g_hChkFixClanCastle = 0, $g_hChkAutoResume = 0, $g_hTxtAutoResumeTime = 0
Global $g_hChkAutohide = 0, $g_hTxtAutohideDelay = 0 ; Auto Hide - Added By NguyenAnhHD

Func CreateBotOptions()
$1 = GUICtrlCreatePic(@ScriptDir & '\COCBot\MOD_Team++AIO\Images\1.jpg', 2, 23, 442, 410, $WS_CLIPCHILDREN)
   Local $sTxtTip = ""
   Local $x = 25, $y = 45
   GUICtrlCreateGroup(GetTranslated(636,83, "GUI Language"), $x - 20, $y - 20, 210, 47)
	   $y -=2
	   $g_hCmbGUILanguage = _GUICtrlComboBoxEx_Create($g_hGUI_BOT,"",$x - 8, $y, 185, -1, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
	   _GUICtrlSetTip(_GUICtrlComboBoxEx_GetComboControl($g_hCmbGUILanguage), GetTranslated(636,84, "Use this to switch to a different GUI language"), Default, Default, Default, False)

	   LoadLanguagesComboBox() ; full combo box languages reading from languages folders

   GUICtrlCreateGroup("", -99, -99, 1, 1)

   $y += 54
   GUICtrlCreateGroup(GetTranslated(636,2, "When Bot Loads"), $x - 20, $y - 20, 210, 120)
	   $y -= 4
	   $g_hChkDisableSplash = _GUICtrlCreateCheckbox(GetTranslated(636,100, "Disable Splash Screen"), $x, $y, -1, -1)
		   _GUICtrlSetTip(-1, GetTranslated(636,101, "Disables the splash screen on startup."))
		   GUICtrlSetState(-1, $GUI_UNCHECKED)

	   $y += 20
	   $g_hChkForMBRUpdates = _GUICtrlCreateCheckbox(GetTranslated(636,3, "Check for Updates"), $x, $y, -1, -1)
		   _GUICtrlSetTip(-1, GetTranslated(636,4, "Check if you are running the latest version of the bot."))
		   GUICtrlSetState(-1, $GUI_CHECKED)

	   $y += 20
	   $g_hChkDeleteLogs = _GUICtrlCreateCheckbox(GetTranslated(636,5, "Delete Log Files")& ":", $x, $y, -1, -1)
		   $sTxtTip = GetTranslated(636,6, "Delete log files older than this specified No. of days.")
		   GUICtrlSetState(-1, $GUI_CHECKED)
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetOnEvent(-1, "chkDeleteLogs")
	   $g_hTxtDeleteLogsDays = GUICtrlCreateInput("2", $x + 120, $y + 2, 25, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetLimit(-1, 2)
		   GUICtrlSetFont(-1, 8)
	   GUICtrlCreateLabel(GetTranslated(636,7, "days"), $x + 150, $y + 4, 27, 15)

	   $y += 20
	   $g_hChkDeleteTemp = _GUICtrlCreateCheckbox(GetTranslated(636,8, "Delete Temp Files") & ":", $x, $y, -1, -1)
		   GUICtrlSetState(-1, $GUI_CHECKED)
		   _GUICtrlSetTip(-1, GetTranslated(636,9, "Delete temp files older than this specified No. of days."))
		   GUICtrlSetOnEvent(-1, "chkDeleteTemp")
	   $g_hTxtDeleteTempDays = GUICtrlCreateInput("5", $x + 120, $y + 2, 25, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetLimit(-1, 2)
		   GUICtrlSetFont(-1, 8)
	   GUICtrlCreateLabel(GetTranslated(636,7, "days"), $x + 150, $y + 4, 27, 15)

	   $y += 20
	   $g_hChkDeleteLoots = _GUICtrlCreateCheckbox(GetTranslated(636,10, "Delete Loot Images"), $x, $y, -1, -1)
		   $sTxtTip = GetTranslated(636,11, "Delete loot image files older than this specified No. of days.")
		   GUICtrlSetState(-1, $GUI_CHECKED)
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetOnEvent(-1, "chkDeleteLoots")
	   $g_hTxtDeleteLootsDays = GUICtrlCreateInput("2", $x + 120, $y + 2, 25, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetLimit(-1, 2)
		   GUICtrlSetFont(-1, 8)
	   GUICtrlCreateLabel(GetTranslated(636,7, "days"), $x + 150, $y + 4, 27, 15)
   GUICtrlCreateGroup("", -99, -99, 1, 1)

   $y += 48
   GUICtrlCreateGroup(GetTranslated(636,12, "When Bot Starts"), $x - 20, $y - 20, 210, 135)
	   $y -= 5
	   $g_hChkAutostart = _GUICtrlCreateCheckbox(GetTranslated(636,13, "Auto START after") & ":", $x, $y, -1, -1)
		   _GUICtrlSetTip(-1, GetTranslated(636,58, "Auto START the Bot after this No. of seconds."))
		   GUICtrlSetOnEvent(-1, "chkAutostart")
	   $g_hTxtAutostartDelay = GUICtrlCreateInput("10", $x + 120, $y + 2, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		   GUICtrlSetFont(-1, 8)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   GUICtrlCreateLabel(GetTranslated(603,6, "sec."), $x + 150, $y + 4, 27, 18)

	   $y += 22
	   $g_hChkAutohide = _GUICtrlCreateCheckbox(GetTranslated(636,202, "Auto HIDE after") & ":", $x, $y, -1, -1)
		   _GUICtrlSetTip(-1, GetTranslated(636,203, "Auto HIDE the Bot after this No. of seconds."))
		   GUICtrlSetOnEvent(-1, "chkAutohide")
	   $g_hTxtAutohideDelay = GUICtrlCreateInput("10", $x + 120, $y + 2, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		   GUICtrlSetFont(-1, 8)
		   GUICtrlSetState(-1, $GUI_DISABLE)
	   GUICtrlCreateLabel(GetTranslated(603,6, "sec."), $x + 150, $y + 4, 27, 18)

	   $y += 22
	   $g_hChkCheckGameLanguage = _GUICtrlCreateCheckbox(GetTranslated(636,15, "Check Game Language (EN)"), $x, $y, -1, -1)
		   _GUICtrlSetTip(-1, GetTranslated(636,16, "Check if the Game is set to the correct language (Must be set to English)."))
		   GUICtrlSetState(-1, $GUI_CHECKED)

	   $y += 22
	   $g_hChkAutoAlign = _GUICtrlCreateCheckbox(GetTranslated(636,17, "Auto Align"), $x, $y, -1, -1)
		   $sTxtTip = GetTranslated(636,18, "Reposition/Align Android Emulator and BOT windows on the screen.")
		   GUICtrlSetOnEvent(-1, "chkDisposeWindows")
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetLimit(-1, 2)
	   GUICtrlCreateLabel(GetTranslated(636,19, "Offset") & ":", $x + 85, $y + 4, -1, -1)
	   $g_hTxtAlignOffsetX = GUICtrlCreateInput("10", $x + 120, $y + 2, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		   $sTxtTip = GetTranslated(636,20, "Offset horizontal pixels between Android Emulator and BOT windows.")
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetLimit(-1, 2)
		   GUICtrlSetFont(-1, 8)
	   $g_hTxtAlignOffsetY= GUICtrlCreateInput("0", $x + 150, $y + 2, 25, 18, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		   $sTxtTip = GetTranslated(636,21, "Offset vertical pixels between Android Emulator and BOT windows.")
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetLimit(-1, 2)
		   GUICtrlSetFont(-1, 8)

	   $y += 23
	   $g_hCmbAlignmentOptions = GUICtrlCreateCombo("", $x, $y, 175, 20, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		   GUICtrlSetData(-1, GetTranslated(636,22, "0,0: Android Emulator-Bot") & "|" & _
							  GetTranslated(636,23, "0,0: Bot-Android Emulator") & "|" & _
							  GetTranslated(636,24, "SNAP: Bot TopRight to Android") &"|" & _
							  GetTranslated(636,25, "SNAP: Bot TopLeft to Android") & "|" & _
							  GetTranslated(636,26, "SNAP: Bot BottomRight to Android") & "|" & _
							  GetTranslated(636,27, "SNAP: Bot BottomLeft to Android") & "|" & _
							  GetTranslated(636,95, "DOCK: Android into Bot"), _
							  GetTranslated(636,24, "SNAP: Bot TopRight to Android"))
		   _GUICtrlSetTip(-1, GetTranslated(636,28, "0,0: Reposition Android Emulator screen to position 0,0 on windows desktop and align Bot window right or left to it.") & @CRLF & _
							  GetTranslated(636,29, "SNAP: Only reorder windows, Align Bot window to Android Emulator window at Top Right, Top Left, Bottom Right or Bottom Left.\r\n" & _
												    "DOCK: Integrate Android Screen into bot window."))
		   GUICtrlSetState(-1, $GUI_DISABLE)
   GUICtrlCreateGroup("", -99, -99, 1, 1)
;++++++++ Modified Kychera	+++++++++++
	$y += 49
	GUICtrlCreateGroup(GetTranslated(636,129, "Decor"), $x - 20, $y - 20, 210, 90)
	$y += -5
		$chkPic = GUICtrlCreateCheckbox("", $x, $y + 2, 13, 13)
        $sTxtTip = GetTranslated(636,130, "Enable Background.")
        GUICtrlSetTip(-1, $sTxtTip)
        GUICtrlSetState(-1, $GUI_CHECKED)
		GUICtrlSetOnEvent(-1, "chkPic")
		GUICtrlCreateLabel(GetTranslated(636,130, "Enable Backgroung"), $x + 17, $y + 2, -1, -1)
		;$y += 25
		$x += 120
	    $BackGr = GUICtrlCreateCombo("", $x, $y, 60, 45, BitOR($CBS_DROPDOWNLIST, $CBS_AUTOHSCROLL))
		GUICtrlSetData(-1, GetTranslated(1000,101, "Key1") & "|" & _
		                   GetTranslated(1000,102, "Key2") & "|" & _
						   GetTranslated(1000,103, "Key3") & "|" & _
						   GetTranslated(1000,104, "Key4") & "|" & _
						   GetTranslated(1000,105, "Key5") & "|" & _
						   GetTranslated(1000,106, "Key6") & "|" & _
						   GetTranslated(1000,107, "Key7") & "|" & _
						   GetTranslated(1000,108, "Key8"), _
						   GetTranslated(1000,101, "Key1"))
		GUICtrlSetOnEvent(-1,"BackGr")
	  $y += 40
	    GUICtrlCreateLabel(GetTranslated(636, 128, "Transperent GUI"), $x - 120, $y - 5, 100, 16)
       $SldTransLevel = GUICtrlCreateSlider($x - 120, $y + 10, 125, 15, BitOR($TBS_TOOLTIPS, $TBS_AUTOTICKS))
		GUICtrlSetLimit($SldTransLevel, 8, 0)
		GUICtrlSetData(-1, 0)
		GUICtrlSetOnEvent(-1, "Slider")
;+++++++++++++++++++++++++++++++++++++++
GUICtrlCreateGroup("", -99, -99, 1, 1)
   Local $x = 240, $y = 45, $yGroup = $y
   Local $hGroup = GUICtrlCreateGroup(GetTranslated(636,93, "Advanced"), $x - 20, $y - 20, 0, 0)
	   #cs
	   $g_hChkUpdatingWhenMinimized = _GUICtrlCreateCheckbox(GetTranslated(636,96, "Updating when minimized"), $x, $y, -1, -1)
		   GUICtrlSetState(-1, $GUI_DISABLE) ; must be always enabled
		   GUICtrlSetOnEvent(-1, "chkUpdatingWhenMinimized")
		   _GUICtrlSetTip(-1, GetTranslated(636,97, "Enable different minimize routine for bot window.\r\nWhen bot is minimized, screen updates are shown in taskbar preview."))
	   $y += 19
	   #ce
	   $g_hChkBotCustomTitleBarClick = _GUICtrlCreateCheckbox(GetTranslated(636,124, "My Bot design Title Bar"), $x, $y, -1, -1)
		   If BitAND($g_iBotDesignFlags, 1) Then GUICtrlSetState(-1, $GUI_CHECKED)
		   GUICtrlSetOnEvent(-1, "chkBotCustomTitleBarClick")
		   _GUICtrlSetTip(-1, GetTranslated(636,125, "Enable optimized My Bot Window Title Bar and\r\nthin Window Border (restart of bot is required)"))
	   $y += 19
	   $g_hChkBotAutoSlideClick = _GUICtrlCreateCheckbox(GetTranslated(636,126, "Auto Slide when docked"), $x, $y, -1, -1)
		   If BitAND($g_iBotDesignFlags, 1) = 0 Then GUICtrlSetState(-1, $GUI_DISABLE)
		   If BitAND($g_iBotDesignFlags, 2) Then GUICtrlSetState(-1, $GUI_CHECKED)
		   GUICtrlSetOnEvent(-1, "chkBotAutoSlideClick")
		   _GUICtrlSetTip(-1, GetTranslated(636,127, "Enable auto sliding when Android is docked\r\non bot window activation/deactivation"))
	   $y += 19
	   $g_hChkHideWhenMinimized = _GUICtrlCreateCheckbox(GetTranslated(636,98, "Hide when minimized"), $x, $y, -1, -1)
		   GUICtrlSetOnEvent(-1, "chkHideWhenMinimized")
		   _GUICtrlSetTip(-1, GetTranslated(636,99, "Hide bot window in taskbar when minimized.\r\nUse trayicon 'Show bot' to display bot window again."))
		$y += 19
		$g_hChkAutoResume = _GUICtrlCreateCheckbox(GetTranslated(636, 122, "Auto resume Bot after"), $x, $y + 2, -1, -1)
			_GUICtrlSetTip(-1,GetTranslated(636, 123, "This will auto resume your bot after x minutes"))
			GUICtrlSetOnEvent(-1, "chkAutoResume")
		$g_hTxtAutoResumeTime = GUICtrlCreateInput("5",$x + 132, $y + 5, 30, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		GUICtrlCreateLabel( GetTranslated(603,10, -1), $x + 167, $y + 6, 27, 15)
		$y += 23
	   $g_hChkUseRandomClick = _GUICtrlCreateCheckbox(GetTranslated(636,94, "Random Click"), $x, $y, -1, -1)
		   GUICtrlSetOnEvent(-1, "chkUseRandomClick")
		$y += 19
	  $ChkLaunchWatchdog = _GUICtrlCreateCheckbox(GetTranslated(2000,1, "Disabled Watchdog"), $x, $y + 2, -1, -1)
          GUICtrlSetState(-1, $GUI_UNCHECKED)
	     GUICtrlSetOnEvent(-1, "chkLaunchWatchdog")
		$y += 19
   GUICtrlSetPos($hGroup, $x - 20, $yGroup - 20, 255, (($y - $yGroup) / 19) * 25)
   GUICtrlCreateGroup("", -99, -99, 1, 1)

   $y += 30
   GUICtrlCreateGroup(GetTranslated(636,55, "Photo Screenshot Options"), $x - 20, $y - 17, 225, 60)
	   $g_hChkScreenshotType = _GUICtrlCreateCheckbox(GetTranslated(636,56, "Make in PNG format"), $x, $y, -1, -1)
		   GUICtrlSetState(-1, $GUI_CHECKED)
		   GUICtrlSetOnEvent(-1, "chkScreenshotType")
	   $y += 19
	   $g_hChkScreenshotHideName = _GUICtrlCreateCheckbox(GetTranslated(636,57, "Hide Village and Clan Castle Name"), $x, $y, -1, -1)
		   GUICtrlSetState(-1, $GUI_CHECKED)
		   GUICtrlSetOnEvent(-1, "chkScreenshotHideName")
   GUICtrlCreateGroup("", -99, -99, 1, 1)

   $y +=48
   GUICtrlCreateGroup(GetTranslated(636,85, "Remote Device"), $x - 20, $y - 20 , 225, 42)
	   $y -= 5
	   GUICtrlCreateLabel(GetTranslated(636,86, "When 'Another Device' wait") & ":", $x - 10, $y + 2, -1, -1)
	   $sTxtTip = GetTranslated(636,87, "Enter the time to wait (in Minutes) before the Bot reconnects when another device took control.")
		   _GUICtrlSetTip(-1, $sTxtTip)
	   $g_hTxtTimeAnotherDevice = GUICtrlCreateInput("2", $x + 132, $y + 1, 30, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		   _GUICtrlSetTip(-1, $sTxtTip)
		   GUICtrlSetLimit(-1, 3)
	   GUICtrlCreateLabel(GetTranslated(603,10, "min."), $x + 167, $y + 2, -1, -1)
   GUICtrlCreateGroup("", -99, -99, 1, 1)

   $y+= 51
   GUICtrlCreateGroup(GetTranslated(636,45, "Other Options"), $x - 20, $y - 20, 225, 85)
	  $g_hChkSinglePBTForced = _GUICtrlCreateCheckbox(GetTranslated(636,61, "Force Single PB logoff"), $x-5, $y, -1, -1)
		  GUICtrlSetOnEvent(-1, "chkSinglePBTForced")
		  _GUICtrlSetTip(-1, GetTranslated(636,62, "This forces bot to exit CoC only one time prior to normal start of PB"))
	  $g_hTxtSinglePBTimeForced = GUICtrlCreateInput("18", $x + 130, $y-1, 30, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		  _GUICtrlSetTip(-1, GetTranslated(636,63, "Type in number of minutes to keep CoC closed. Set to 15 minimum to reset PB timer!"))
		  GUICtrlSetOnEvent(-1, "txtSinglePBTimeForced")
		  GUICtrlSetLimit(-1, 3)
		  GUICtrlSetState(-1, $GUI_DISABLE)
	  GUICtrlCreateLabel( GetTranslated(603,10, -1), $x+162, $y+2, 27, 15)

	  $y += 20
	  GUICtrlCreateLabel( GetTranslated(636,65, "Subtract time for early PB exit"), $x-10, $y+3)
		  $sTxtTip = GetTranslated(636,66, "Type in number of minutes to quit CoC early! Setting below 10 minutes may not function!")
		  _GUICtrlSetTip(-1, $sTxtTip)
	  $g_hTxtPBTimeForcedExit = GUICtrlCreateInput("16", $x + 130, $y, 30, 16, BitOR($GUI_SS_DEFAULT_INPUT, $ES_CENTER, $ES_NUMBER))
		  _GUICtrlSetTip(-1, $sTxtTip)
		  GUICtrlSetOnEvent(-1, "txtSinglePBTimeForced")
		  GUICtrlSetLimit(-1, 3)
		  GUICtrlSetState(-1, $GUI_DISABLE)
	  GUICtrlCreateLabel( GetTranslated(603,10, -1), $x+162, $y+1, 27, 15)

	  $y +=20
	  $g_hChkFixClanCastle = _GUICtrlCreateCheckbox(GetTranslated(636,104, "Force Clan Castle Detection"), $x-5, $y + 2, -1, -1)
		  _GUICtrlSetTip(-1, GetTranslated(636,105, "If clan Castle it is undetected and it is NOT placed in the last slot, force bot to consider the undetected slot as Clan Castle"))
		  GUICtrlSetState(-1, $GUI_UNCHECKED)

   GUICtrlCreateGroup("", -99, -99, 1, 1)
EndFunc
