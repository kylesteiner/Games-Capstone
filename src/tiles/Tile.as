// Tile.as
// Base class for empty tiles. Special tiles will extend this class.
package tiles {
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Sprite;
	import starling.events.*;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.utils.Color;

	public class Tile extends Sprite {
		public var grid_x:int;
		public var grid_y:int;
		public var north:Boolean;
		public var south:Boolean;
		public var east:Boolean;
		public var west:Boolean;

		public var image:Image;
		public var infoWidth:int;
		public var infoHeight:int;
		public var cost:int;
		public var deletable:Boolean; // true if placed by buildHud

		// Create a new Tile object at position (g_x,g_y) of the grid.
		// If n, s, e, or w is true, that edge of the tile will be passable.
		// texture will be the image used for this tile.
		public function Tile(g_x:int,
							 g_y:int,
							 n:Boolean,
							 s:Boolean,
							 e:Boolean,
							 w:Boolean,
							 texture:Texture) {
			super();
			grid_x = g_x;
			grid_y = g_y;
			north = n;
			south = s;
			east = e;
			west = w;
			infoWidth = 125;
			infoHeight = 125;

			image = new Image(texture);
			addChild(image);

			x = Util.grid_to_real(g_x);
			y = Util.grid_to_real(g_y);
		}

		// Called when the player moves into this tile. Override this function
		// to define interactions between tiles and characters.
		public function handleChar(c:Character):void {}

		// When the floor is reset, this function will be called on every tile.
		// Override this function if the tile's state changes during gameplay.
		public function reset():void {}
	}
}
