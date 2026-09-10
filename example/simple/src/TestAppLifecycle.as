/**
 * This is a test application for the distriqt extension
 * 
 * @author 		Michael Archbold (https://github.com/marchbold)
 * @created		10/09/2026
 * 	
 */
package
{
	import com.distriqt.extension.applifecycle.AppLifecycle;
	import com.distriqt.extension.applifecycle.events.AppLifecycleEvent;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.text.TextField;
	import flash.text.TextFormat;
	
	
	/**	
	 * Sample application for using the AppLifecycle Native Extension
	 */
	public class TestAppLifecycle extends Sprite
	{
		
		//
		//	VARIABLES
		//
		
		
		private var _text		: TextField;
		
		
		/**
		 * Class constructor
		 */
		public function TestAppLifecycle()
		{
			super();
			create();
			init();
		}
		
		
		
		//
		//	INITIALISATION
		//	
		
		private function create( ):void
		{
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			_text = new TextField();
			_text.defaultTextFormat = new TextFormat( "_typewriter", 18 );
			addChild( _text );

			stage.addEventListener( Event.RESIZE, stage_resizeHandler, false, 0, true );
			stage.addEventListener( MouseEvent.CLICK, mouseClickHandler, false, 0, true );
			
			addEventListener( Event.ACTIVATE, activateHandler, false, 0, true );
			addEventListener( Event.DEACTIVATE, deactivateHandler, false, 0, true );
		}
		
		
		private function init( ):void
		{
			try
			{
				log( "AppLifecycle Supported: " + AppLifecycle.isSupported );
				log( "AppLifecycle Version:   " + AppLifecycle.service.version );
				
				//
				//	Add test inits here
				//

				AppLifecycle.service.addEventListener( AppLifecycleEvent.ACTIVATE, onActivate );
				AppLifecycle.service.addEventListener( AppLifecycleEvent.DEACTIVATE, onDeactivate );
				AppLifecycle.service.addEventListener( AppLifecycleEvent.FOREGROUND, onForeground );
				AppLifecycle.service.addEventListener( AppLifecycleEvent.BACKGROUND, onBackground );
			}
			catch (e:Error)
			{
				log( "ERROR::"+e.message );
			}
		}
		
		
		//
		//	FUNCTIONALITY
		//
		
		private function log( str:String ):void
		{
			trace( str );
			_text.appendText(str+"\n");
		}
		
		
		//
		//	EVENT HANDLERS
		//
		
		private function stage_resizeHandler( event:Event ):void
		{
			_text.width  = stage.stageWidth;
			_text.height = stage.stageHeight - 100;
		}
		
		
		private function mouseClickHandler( event:MouseEvent ):void
		{
			//
			//	Do something when user clicks screen?
			//	
		}
		
		
		private function activateHandler( event:Event ):void
		{
		}
		
		private function deactivateHandler( event:Event ):void
		{
		}

		
		//
		//	EXTENSION HANDLERS
		//


		public function onActivate( event:AppLifecycleEvent ):void
		{
			log( "onActivate::" + event.code );
		}

		public function onDeactivate( event:AppLifecycleEvent ):void
		{
			log( "onDeactivate::" + event.code );
		}

		public function onForeground( event:AppLifecycleEvent ):void
		{
			log( "onForeground::" + event.code );
		}

		public function onBackground( event:AppLifecycleEvent ):void
		{
			log( "onBackground::" + event.code );
		}

		
	}
}

