"
I am a simple tool that allows you to load or delete any of the custom rewrite rules that are saved. I open the saved rule on a RewriteBasicEditorPresenter.

To open me: `RewriteRuleLoaderPresenter open`
"
Class {
	#name : 'StRewriterRuleLoaderPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'openInBasicEditorButton',
		'matchToolButton',
		'rulesTableSelector'
	],
	#category : 'NewTools-RewriterTools-Loader',
	#package : 'NewTools-RewriterTools',
	#tag : 'Loader'
}

{ #category : 'specs' }
StRewriterRuleLoaderPresenter class >> defaultPreferredExtent [

	^ 700 @ 450
]

{ #category : 'accessing' }
StRewriterRuleLoaderPresenter class >> descriptionText [

	^ 'Loads and deletes custom rewrite rules'
]

{ #category : 'accessing' }
StRewriterRuleLoaderPresenter class >> icon [

	^ self iconNamed: self iconName
]

{ #category : 'accessing' }
StRewriterRuleLoaderPresenter class >> iconName [

	^ #smallLoadProject
]

{ #category : 'layout' }
StRewriterRuleLoaderPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: rulesTableSelector;
		add: (SpBoxLayout newLeftToRight
			addLast: openInBasicEditorButton;
			addLast: matchToolButton;
			yourself)
		expand: false;
		yourself
]

{ #category : 'initialization' }
StRewriterRuleLoaderPresenter >> initializeButtons [

	openInBasicEditorButton := self instantiate: (StRewriterOpenRuleEditorCommand forSpecContext: self) asButtonPresenter.
	matchToolButton := self instantiate: (StRewriterOpenMatchToolCommand forSpecContext: self) asButtonPresenter
]

{ #category : 'initialization' }
StRewriterRuleLoaderPresenter >> initializePresenters [

	self initializeTableSelector.
	self initializeButtons
]

{ #category : 'initialization' }
StRewriterRuleLoaderPresenter >> initializeTableSelector [

	rulesTableSelector := self instantiate: StRewriterRulesTableSelectorPresenter
]

{ #category : 'initialization' }
StRewriterRuleLoaderPresenter >> initializeWindow: aWindowPresenter [

	super initializeWindow: aWindowPresenter.
	aWindowPresenter
		askOkToClose: false;
		aboutText: self class descriptionText
]

{ #category : 'accessing' }
StRewriterRuleLoaderPresenter >> lhs [

	^ rulesTableSelector lhs
]

{ #category : 'accessing' }
StRewriterRuleLoaderPresenter >> rhs [

	^ rulesTableSelector rhs
]

{ #category : 'initialization' }
StRewriterRuleLoaderPresenter >> windowIcon [ 

	^ self class iconName
]

{ #category : 'initialization' }
StRewriterRuleLoaderPresenter >> windowTitle [ 

	^ 'Rewrite rule loader'
]
