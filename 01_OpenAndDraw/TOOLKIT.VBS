'-------------------------------------------------------------------------------
'-- VBS script file
'-- Created on 11/14/2016 13:10:00
'-- Author: 
'-- Comment: 
'-------------------------------------------------------------------------------
Option Explicit  'Forces the explicit declaration of all the variables in a script.
'Dim sPathDocuments
'sPathDocuments = ProgramDrv & "Examples\Documents"
'Call ScriptInclude(sPathDocuments & "\REPORT_Library")
'Call CheckAndCopyIconFiles(sPathDocuments)
Dim sSourcePath : sSourcePath = ScriptReadPath & "\resource\"
Dim sTargetPath : sTargetPath = BarManager.ResourcePath
'msgbox sTargetPath
If Not FileX(sTargetPath & "ToolKit.ICO")           then call FileCopy(sSourcePath & "ToolKit.ICO",          sTargetPath & "ToolKit.ICO")
If Not FileX(sTargetPath & "DelToolKit.ICO")           then call FileCopy(sSourcePath & "DelToolKit.ICO",          sTargetPath & "DelToolKit.ICO")
If Not FileX(sTargetPath & "OpenAndDraw.ICO")           then call FileCopy(sSourcePath & "OpenAndDraw.ICO",          sTargetPath & "OpenAndDraw.ICO")
If Not FileX(ScriptLibrPath & "OpenAndDraw.SUD")           then call FileCopy(sSourcePath & "OpenAndDraw.SUD",          ScriptLibrPath & "OpenAndDraw.SUD")
If Not FileX(ScriptLibrPath & "\library\" & "ArrayListForNode.VBS")           then call FileCopy(sSourcePath & "\library\" & "ArrayListForNode.VBS",          ScriptLibrPath & "\library\" & "ArrayListForNode.VBS")
Dim oMyBar
If not BarManager.Bars.Exists("MyBar") Then
	Set oMyBar = BarManager.Bars.Add("MyBar")
Else
	Set oMyBar = BarManager.Bars("MyBar")
	Call oMyBar.UsedActionObjs.RemoveAll
End If
oMyBar.Style=eBarStyleIconCaptionBelow
Dim oButton
If not BarManager.ActionObjs.Exists("MyButton_1") Then
	Set oButton = BarManager.ActionObjs.Add("MyButton_1","CustomButton")
	oButton.Picture = "OpenAndDraw.ICO"
	oButton.Caption = "DRAW"
	oButton.Tooltip = "Open and draw"
	oButton.OnClickCode.Code = "Call SudDlgShow(""Dlg1"",ScriptLibrPath & ""OpenAndDraw.sud"")"'"Call MsgBoxDisp(""User Function"")"
Else
	Set oButton = BarManager.ActionObjs("MyButton_1")
End If
Call oMyBar.UsedActionObjs.Add(oButton)
If not BarManager.ActionObjs.Exists("MyButton_2") Then
	Set oButton = BarManager.ActionObjs.Add("MyButton_2","CustomButton")
	oButton.Picture = "DelToolKit.ICO"
	oButton.Caption = "DELETE"
	oButton.Tooltip = "Deletes Bar"
	oButton.OnClickCode.Code = "Call BarManager.Reset"
Else
	Set oButton = BarManager.ActionObjs("MyButton_2")
End If

Call oMyBar.UsedActionObjs.Add(oButton)
Dim oPopup
If not BarManager.ActionObjs.Exists("MyPopup") Then
	Set oPopup = BarManager.ActionObjs.Add("MyPopup","CustomPopup")
	oPopup.Picture = "ToolKit.ICO"
	oPopup.Caption = "TOOLKIT"
	oPopup.Tooltip = "ToolKit from wustudent"
	oPopup.BarId = oMyBar.Id
Else
	Set oPopup = BarManager.ActionObjs("MyPopup")
End If
If not BarManager.Bars("DIAPanels").UsedActionObjs.Exists(oPopup) Then
	Call BarManager.Bars("DIAPanels").UsedActionObjs.Add(oPopup)
End If
