package skins
{
	import assets.fxg.WhiteSquare;
	
	import spark.skins.mobile.ButtonSkin;
	
	public class TimerButtonSkin extends ButtonSkin
	{
		private var colorized:Boolean = false;
		private const DISABLED_ALPHA:Number = 0.3
		
		public function TimerButtonSkin()
		{
			super();
			upBorderSkin = WhiteSquare;
			downBorderSkin = WhiteSquare;
		}
		
		override protected function drawBackground(unscaledWidth:Number, unscaledHeight:Number):void
		{
			// omit call to super.drawBackground() to apply tint instead and don't draw fill
			var chromeColor:uint = getStyle("chromeColor");
			
			if (colorized || (chromeColor != 0xDDDDDD))
			{
				// apply tint instead of fill
				applyColorTransform(border, 0xDDDDDD, chromeColor);
				
				// if we restore to original color, unset colorized
				colorized = (chromeColor != 0xDDDDDD);
			}
		}
		
		
		/**
		 *  Commit alpha values for the skin when in a disabled state.
		 *
		 *  @see mx.core.UIComponent#enabled
		 *
		 *  @langversion 3.0
		 *  @playerversion Flash 10
		 *  @playerversion AIR 2.5
		 *  @productversion Flex 4.5
		 */
		override protected function commitDisabled():void
		{
			alpha = hostComponent.enabled ? 1 : DISABLED_ALPHA;
		}
	}
}