/**
 * @author 		Michael Archbold (https://github.com/marchbold)
 * @created		10/09/2026
 */
package com.distriqt.test.applifecycle
{
	import com.distriqt.extension.applifecycle.AppLifecycle;
	import com.distriqt.extension.applifecycle.events.AppLifecycleEvent;

	import starling.display.Sprite;

	/**
	 */
	public class AppLifecycleTests extends Sprite
	{
		public static const TAG:String = "";

		private var _l:ILogger;

		private function log( log:String ):void
		{
			_l.log( TAG, log );
		}


		////////////////////////////////////////////////////////
		//	FUNCTIONALITY
		//

		public function AppLifecycleTests( logger:ILogger )
		{
			_l = logger;
			try
			{
				log( "AppLifecycle Supported: " + AppLifecycle.isSupported );
				if (AppLifecycle.isSupported)
				{
					log( "AppLifecycle Version:   " + AppLifecycle.service.version );


					AppLifecycle.service.addEventListener( AppLifecycleEvent.ACTIVATE, onActivate );
					AppLifecycle.service.addEventListener( AppLifecycleEvent.DEACTIVATE, onDeactivate );
					AppLifecycle.service.addEventListener( AppLifecycleEvent.FOREGROUND, onForeground );
					AppLifecycle.service.addEventListener( AppLifecycleEvent.BACKGROUND, onBackground );
				}

			}
			catch (e:Error)
			{
				trace( e );
			}
		}


		////////////////////////////////////////////////////////
		//  
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
