"
Implements a command to open a terminal in the host Operating System, from the File Browser.
"
Class {
	#name : 'StFileBrowserOpenTerminalCommand',
	#superclass : 'StFileBrowserCommand',
	#category : 'NewTools-FileBrowser-Commands',
	#package : 'NewTools-FileBrowser',
	#tag : 'Commands'
}

{ #category : 'converting' }
StFileBrowserOpenTerminalCommand >> asSpecCommand [

	^ super asSpecCommand
		iconProvider: self iconProvider;
		iconName: #terminalIcon;
		shortcutKey: $n meta;		
		yourself
]

{ #category : 'executing' }
StFileBrowserOpenTerminalCommand >> execute [
	"Execute the actions that should be done by the command.
	 This method expect that the context has been put in #context inst. var. if any context is relevant."

	self terminalInterface openTerminalOn: self context currentDirectory
]

{ #category : 'initialization' }
StFileBrowserOpenTerminalCommand >> initialize [

	super initialize.
	self
		name: 'Open terminal here';
		description: 'Open an OS terminal in this directory.'
]

{ #category : 'initialization' }
StFileBrowserOpenTerminalCommand >> terminalInterface [

	^ StTerminalInterface default 
]
