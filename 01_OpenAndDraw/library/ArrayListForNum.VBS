'-------------------------------------------------------------------------------
'-- VBS script file
'-- Created on 11/07/2016 20:32:49
'-- Author: 
'-- Comment: 
'-------------------------------------------------------------------------------
Option Explicit  'Forces the explicit declaration of all the variables in a script.
Class ArrayListForNum
	Private arr()
	Private count
	'---------Constructer
	Private Sub Class_Initialize
		count = 0
		ReDim arr(1)
	End Sub
	'---------Destructor
	Private Sub Class_Terminate
		'arr = null
	End Sub
	'---------Public Property Item [Get,Let]
	Public Property Get Item(index)
		Item = arr(index)
	End Property
	Public Property Let Item(index, vObject)
		arr(index) = vObject
	End Property
	'---------Public Property Length [Get]
	Public Property Get Length
		Length = count
	End Property
	'---------Private Property Volume [Get,Let]
	Private Property Get Volume()
		Volume = Ubound(arr)
	End Property
	Private Property Let Volume(value)
		If (value <> Ubound(arr)) Then
			If (value < count) Then Err.Rise 6
			If (value > 0) Then
				ReDim Preserve arr(value)
			Else
				ReDim Preserve arr(3)
			End If
		End If
	End Property
	'---------Public Function Append [return count]
	Public Function Append(ByVal value)
		If (count = Ubound(arr)) Then Extend((count + 1))
		arr(count) = value
		count = count + 1
		Append = count
	End Function
	'---------Public Function Delete [return count]
	Public Function Delete(ByVal value)
		Dim i, j, flag
		flag = false
		For i = 0 To (count - 1)
			'If value.CompareTo(Item(i)) = 0 Then 
			If Item(i) = value Then 
				flag = true
				Exit For
			End If
		Next
		If flag = true Then
			For j = i To (count - 2)
				Item(j) = Item(j+1)
			Next
			count = count - 1
			Volume = count
		End If 
		Delete = count
	End Function
	'---------Private Sub Extend(new length)
	Private Sub Extend(ByVal min)
		If (Ubound(arr) < min) Then
			Dim num1 : num1 = IIf((Ubound(arr) = 0), 4, (Ubound(arr) * 2))
			If (num1 < min) Then num1 = min
			Volume = num1
		End If
	End Sub
	Private Function IIf(j, r1, r2)	'When true r1,else r2
		If (j) Then
			IIf = r1
		Else
			IIf = r2
		End If
	End Function
End Class

Class Node
	Private arr(1)
	Public name
	Public Default Function Construtor(strName) 
		name = strName
		Set Construtor = Me 
	End Function 
	Public Property Get X()
		X = arr(0)
	End Property
	Public Property Let X(strXName)
		arr(0) = strXName
	End Property
	Public Property Get Y()
		Y = arr(1)
	End Property
	Public Property Let Y(strYName)
		arr(1) = strXName
	End Property
	Public Function CompareTo(ByRef obj)
		CompareTo = strComp(name,obj.name)
	End Function
End Class

Dim al : Set al = new ArrayListForNum
al.Append(1)
al.Append(2)
al.Append(3)
al.Append(4)
al.Append(5)
al.Append(6)
al.Append(7)
al.Append(8)
al.Append(9)
al.Append(10)
Dim i,strs
strs=""
For i = 0 To al.Length-1
	strs = strs & al.Item(i) & " "
Next
msgbox strs
al.Delete(1)
al.Delete(10)
strs=""
For i = 0 To al.Length-1
	strs = strs & al.Item(i) & " "
Next
msgbox strs



