#tag Class
Protected Class jsonConfig
	#tag Method, Flags = &h0
		Function getPath() As boolean
		  // defines config file absolute path as string
		  
		  Dim root As FolderItem
		  
		  Dim eName As String
		  
		  // parse application name
		  
		  If App.ExecutableFile <> Nil Then
		    
		    eName = App.ExecutableFile.Name.NthField(".",1)
		    
		    #If Debugbuild Then
		      
		      eName = eName.Replace("Debug","")
		      
		    #EndIf
		    
		  Else
		    
		    System.Log(System.LogLevelError, "Failed to get executable file name.")
		    
		  End
		  
		  // create folder paths
		  
		  If isGlobal Then
		    
		    root = SpecialFolder.SharedPreferences
		    
		  Else
		    
		    root = SpecialFolder.Preferences
		    
		  End
		  
		  If isCopyright Then
		    root = root.Child(App.Copyright)
		  Else
		    root = root.Child(eName)
		  End
		  
		  If Not root.Exists Then
		    
		    root.CreateFolder
		    
		  End
		  
		  If root <>Nil Then
		    
		    folderPath = root.AbsolutePath
		    
		    root = root.Child(eName + ".config")
		    
		    If root<>Nil Then
		      
		      configPath = root.AbsolutePath
		      
		    Else 
		      System.Log(System.LogLevelError, "Failed to open path to config file.")
		    End
		    
		  Else
		    
		    System.Log(System.LogLevelError, "Failed to open path to config file.")
		    
		  End
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function init(CopyrightFolder as Boolean, GlobalConfig as Boolean) As Boolean
		  // do initial tasks, run once
		  
		  isCopyright = CopyrightFolder
		  isGlobal = GlobalConfig
		  
		  Do
		  loop until getPath
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function read() As boolean
		  
		  
		  Return True
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function write() As Boolean
		  
		End Function
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event isChanged(changed as boolean)
	#tag EndHook


	#tag Note, Name = readme
		INITIAL SETTINGS:
		
		jsonConfig.isGlobal (BOOLEAN)
		Defines whether the config is user specific or for all the users
		
		jsonConfig.isCopyright (BOOLEAN)
		Use contents of the Copyright field instead of executable name in folder definition
		
	#tag EndNote


	#tag Property, Flags = &h0
		configPath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		folderPath As String
	#tag EndProperty

	#tag Property, Flags = &h0
		isCopyright As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		isGlobal As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		values As Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="configPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="folderPath"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
