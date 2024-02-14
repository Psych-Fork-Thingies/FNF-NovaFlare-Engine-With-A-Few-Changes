package options;

import lime.app.Application;
import backend.MusicBeatState;

import flixel.addons.transition.FlxTransitionableState;

import options.OptionsHelpers;
import options.base.ControlsSubState;
import mobile.substates.MobileControlSelectSubState;

import shaders.ColorblindFilter;

class Option
{
	public function new()
	{
	    disable_O = OptionsName.funcDisable();
	    enable_O = OptionsName.funcEnable();
	    MS_O = OptionsName.funcMS();
	    grid_O = OptionsName.funcGrid();
		display = updateDisplay();
	}

	private var description:String = "";
	private var display:String;
	
	private var acceptValues = false;
	
	private var disable_O:String = '';
	private var enable_O:String = '';
	private var MS_O:String = '';
	private var grid_O:String = '';
    
    //public var onChange:Void->Void = null;
    
	public var acceptType = false;

	public var waitingType = false;
	
	public function change():Void
	{
	    //nothing
	}

	public final function getDisplay():String
	{
		return display;
	}

	public final function getAccept()
	{
		return acceptValues;
	}

	public final function getDescription():String
	{
		return description;
	}

	public function getValue():String
	{
		return updateDisplay();
	};

	public function onType(text:String)
	{
	
	}

	// Returns whether the label is to be updated.
	public function press()
	{
	
     }
	
	public function left()
	{
		return false;
	}

	public function right()
	{
		return false;
	}
	
	private function updateDisplay():String
	{
		return "";
	}
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类1
class Downscroll extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.downScroll = !ClientPrefs.data.downScroll;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "DownScroll" + ": " + (ClientPrefs.data.downScroll ? enable_O : disable_O);
	}
}

class MiddleScroll extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.middleScroll = !ClientPrefs.data.middleScroll;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Middle Scroll: " + (ClientPrefs.data.middleScroll ? enable_O : disable_O);
	}
}

class FilpChart extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.filpChart = !ClientPrefs.data.filpChart;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Filp Chart: " + (ClientPrefs.data.filpChart ? enable_O : disable_O);
	}
}

class GuitarHeroSustains extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{
		ClientPrefs.data.guitarHeroSustains = !ClientPrefs.data.guitarHeroSustains;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Sustains Note Input: < " + (ClientPrefs.data.guitarHeroSustains ? 'New' : 'Classic');
	}
}

class FixLNL extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
		acceptType = true;
	}

	public override function left()
	{
		ClientPrefs.data.fixLNL--;
		if (ClientPrefs.data.fixLNL < 0)
			ClientPrefs.data.fixLNL = 0;
		display = updateDisplay();
    }

	public override function right()
	{
		ClientPrefs.data.fixLNL++;
		if (ClientPrefs.data.fixLNL > 2)
			ClientPrefs.data.fixLNL = 2;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Long Note Length Reduce: < " + ClientPrefs.data.fixLNL + " >";
	}
}

class GhostTap extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.ghostTapping = !ClientPrefs.data.ghostTapping;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Ghost Tapping: " + (ClientPrefs.data.ghostTapping ? enable_O : disable_O);
	}
}

class NoReset extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.noReset = !ClientPrefs.data.noReset;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Reset Button: " + (!ClientPrefs.data.noReset ? enable_O : disable_O);
	}
}

class ResultsScreen extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.ResultsScreen = !ClientPrefs.data.ResultsScreen;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "ResultsScreen: < " + (ClientPrefs.data.ResultsScreen ? enable_O : disable_O);
	}
}

class Judgement extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
		acceptValues = true;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
							
		var num:Int = 8;	
		OptionsState.instance.selectedCatIndex = num;
		OptionsState.instance.switchCat(OptionsState.instance.options[num], false);
		
    }

	private override function updateDisplay():String
	{
		return "Edit Judgements";
	}
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类2
class NoteSkin extends Option
{
    public static var chooseNum:Int;
    
	public function new(desc:String)
	{
		super();
		chooseNum = 0;
		OptionsHelpers.setNoteSkin();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function left()
	{
		if (OptionsState.onPlayState)
			return false;
		chooseNum--;
		
     	OptionsHelpers.changeNoteSkin();
		display = updateDisplay();
    }

	public override function right()
	{
		if (OptionsState.onPlayState)
			return false;
		chooseNum++;
		
        OptionsHelpers.changeNoteSkin();
		display = updateDisplay();
    }

	public override function getValue():String
	{
		return "Current Noteskin: < " + ClientPrefs.data.noteSkin + " >";
	}
}

class NoteRGB extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.noteRGB = !ClientPrefs.data.noteRGB;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Note RGB: < " + (ClientPrefs.data.noteRGB ? enable_O : disable_O);
	}
}

class SplashSkin extends Option
{
    public static var chooseNum:Int;
    
	public function new(desc:String)
	{
		super();
		chooseNum = 0;
		OptionsHelpers.setSplashSkin();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function left()
	{
		if (OptionsState.onPlayState)
			return false;
		chooseNum--;
		
     	OptionsHelpers.changeSplashSkin();
		display = updateDisplay();
    }

	public override function right()
	{
		if (OptionsState.onPlayState)
			return false;
		chooseNum++;
		
        OptionsHelpers.changeSplashSkin();
		display = updateDisplay();
    }

	public override function getValue():String
	{
		return "Current SplashSkin: < " + ClientPrefs.data.splashSkin + " >";
	}
}

class SplashRGB extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.splashRGB = !ClientPrefs.data.splashRGB;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Splash RGB: < " + (ClientPrefs.data.splashRGB ? enable_O : disable_O);
	}
}

class HitSound extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
		acceptValues = true;
	}

	private override function updateDisplay():String
	{
		return "HitSound volume: < " + ClientPrefs.data.hitsoundVolume + " >";
	}

	override function right()
	{
		ClientPrefs.data.hitsoundVolume += 0.1;
		if (ClientPrefs.data.hitsoundVolume > 1)
			ClientPrefs.data.hitsoundVolume = 1;
                FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.data.hitsoundVolume);
		

	}

	override function left()
	{
		ClientPrefs.data.hitsoundVolume -= 0.1;
		if (ClientPrefs.data.hitsoundVolume < 0)
			ClientPrefs.data.hitsoundVolume = 0;
                FlxG.sound.play(Paths.sound('hitsound'), ClientPrefs.data.hitsoundVolume);
    }
}

class CamZoom extends Option
{
	public function new(desc:String)
	{
		super();
        description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.camZooms = !ClientPrefs.data.camZooms;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Camera Zooming: < " + (ClientPrefs.data.camZooms ? enable_O : disable_O);
	}
}

class ScoreZoom extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.scoreZoom = !ClientPrefs.data.scoreZoom;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Score zomming in beats: < " + (ClientPrefs.data.scoreZoom ? enable_O : disable_O);
	}
}

class JudgementCounter extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.judgementCounter = !ClientPrefs.data.judgementCounter;
        /*
		if (Type.getClass(FlxG.state) == PlayState){
		if(ClientPrefs.data.showJudgement) 
			//PlayState.instance.judgementCounter.visible = (!ClientPrefs.data.hideHud && !PlayState.instance.cpuControlled);
		else
			//PlayState.instance.judgementCounter.visible = false;
	     }
        */
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Judgement Counter: < " + (ClientPrefs.data.judgementCounter ? enable_O : disable_O);
	}
}

class HideHud extends Option
{
	public function new(desc:String)
	{
		super();
        //if (OptionsState.onPlayState)
		//	description = "This option cannot be toggled in the pause menu.";
		//else
			description = desc;

	}

	public override function press()
	{
        //if (OptionsState.onPlayState)
		//	return false;
		ClientPrefs.data.hideHud = !ClientPrefs.data.hideHud;

		if (Type.getClass(FlxG.state) == PlayState){

		/*PlayState.instance.healthBarBG.visible = !ClientPrefs.data.hideHud;
		PlayState.instance.healthBar.visible = !ClientPrefs.data.hideHud;
		PlayState.instance.healthBarWN.visible = !ClientPrefs.data.hideHud;
		PlayState.instance.healthStrips.visible  = !ClientPrefs.data.hideHud;
		PlayState.instance.iconP1.visible = !ClientPrefs.data.hideHud;
		PlayState.instance.iconP2.visible = !ClientPrefs.data.hideHud;
		PlayState.instance.songTxt.visible = !(ClientPrefs.data.hideHud || !ClientPrefs.data.songNameDisplay);
		PlayState.instance.scoreTxt.visible = (!ClientPrefs.data.hideHud && !PlayState.instance.cpuControlled);

		PlayState.instance.judgementCounter.visible = (ClientPrefs.data.showJudgement && !ClientPrefs.data.hideHud && !PlayState.instance.cpuControlled);

		if(!ClientPrefs.data.hideHud)
			for (helem in [PlayState.instance.healthBar, PlayState.instance.iconP1, PlayState.instance.iconP2, PlayState.instance.healthBarWN, PlayState.instance.healthBarBG, PlayState.instance.healthStrips]) {
				if (helem != null) {
					helem.visible = ClientPrefs.data.visibleHealthbar;
			}  
		}*/

	     }
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "HUD: < " + (!ClientPrefs.data.hideHud ? enable_O : disable_O);
	}
}

class HideOppStrums extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.opponentStrums = !ClientPrefs.data.opponentStrums;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Opponent Strums: < " + (!ClientPrefs.data.opponentStrums ? 'Hide' : 'Show');
	}
}

class ShowComboNum extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.showComboNum = !ClientPrefs.data.showComboNum;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Combo Sprite: < " + (ClientPrefs.data.showComboNum ? enable_O : disable_O);
	}
}

class ComboColor extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
		acceptValues = true;
	}

	private override function updateDisplay():String
	{
		return "Combe Color: < " + ClientPrefs.data.comboColor;
	}

	override function right()
	{
		ClientPrefs.data.comboColor = !ClientPrefs.data.comboColor;
		display = updateDisplay();
		

	}

	override function press()
	{
		right();
    }
}

class ShowRating extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.showRating = !ClientPrefs.data.showRating;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Rating Sprite: < " + (ClientPrefs.data.showRating ? enable_O : disable_O);
	}
}

class ShowSplashes extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
        ClientPrefs.data.showSplash = !ClientPrefs.data.showSplash;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "showSplash: < " + (ClientPrefs.data.showSplash ? enable_O : disable_O);
	} 
}

class SplashAlpha extends Option
{
	public function new(desc:String)
	{
		super();

		description = desc;
		acceptValues = true;
	}

	override function right()
	{
		ClientPrefs.data.splashAlpha += 0.1;
		if (ClientPrefs.data.splashAlpha > 1)
			ClientPrefs.data.splashAlpha = 1;
			
    }

	override function left()
	{
		ClientPrefs.data.splashAlpha -= 0.1;

		if (ClientPrefs.data.splashAlpha < 0)
			ClientPrefs.data.splashAlpha = 0;
			
    }

	private override function updateDisplay():String
		{
			return "Splash Alpha: < " + ClientPrefs.data.splashAlpha + " >";
		}
}

class HealthBarAlpha extends Option
{
	public function new(desc:String)
	{
		super();

		description = desc;
		acceptValues = true;
	}

	override function right()
	{
		ClientPrefs.data.healthBarAlpha += 0.1;
		if (ClientPrefs.data.healthBarAlpha > 1)
			ClientPrefs.data.healthBarAlpha = 1;
		if (Type.getClass(FlxG.state) == PlayState){
		/*PlayState.instance.healthBarBG.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.healthBar.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.healthBarWN.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.healthStrips.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.iconP1.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.iconP2.alpha = ClientPrefs.data.healthBarAlpha;*/
		}
    }

	override function left()
	{
		ClientPrefs.data.healthBarAlpha -= 0.1;

		if (ClientPrefs.data.healthBarAlpha < 0)
			ClientPrefs.data.healthBarAlpha = 0;
		if (Type.getClass(FlxG.state) == PlayState){
		/*PlayState.instance.healthBarBG.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.healthBar.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.healthBarWN.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.healthStrips.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.iconP1.alpha = ClientPrefs.data.healthBarAlpha;
		PlayState.instance.iconP2.alpha = ClientPrefs.data.healthBarAlpha;*/
		}
    }

	private override function updateDisplay():String
		{
			return "Healthbar Alpha: < " + ClientPrefs.data.healthBarAlpha + " >";
		}
}

class TimeBarType extends Option
{
	public function new(desc:String)
	{
		super();
        description = desc;
	}

	public override function left()
	{
		ClientPrefs.data.timeBarTypeNum--;
		if (ClientPrefs.data.timeBarTypeNum < 0)
			ClientPrefs.data.timeBarTypeNum = OptionsHelpers.TimeBarArray.length - 3;
     	OptionsHelpers.ChangeTimeBar(ClientPrefs.data.timeBarTypeNum);
		display = updateDisplay();
		if (Type.getClass(FlxG.state) == PlayState){
		PlayState.instance.timeBarBG.visible = (ClientPrefs.data.timeBarType != 'Disabled');
		PlayState.instance.timeBar.visible = (ClientPrefs.data.timeBarType != 'Disabled');
		PlayState.instance.timeTxt.visible = (ClientPrefs.data.timeBarType != 'Disabled');
		}
    }

	public override function right()
	{
        ClientPrefs.data.timeBarTypeNum++;
		if (ClientPrefs.data.timeBarTypeNum > OptionsHelpers.TimeBarArray.length - 1)
			ClientPrefs.data.timeBarTypeNum = OptionsHelpers.TimeBarArray.length - 1;
        OptionsHelpers.ChangeTimeBar(ClientPrefs.data.timeBarTypeNum);
		display = updateDisplay();
		if (Type.getClass(FlxG.state) == PlayState){
		PlayState.instance.timeBarBG.visible = (ClientPrefs.data.timeBarType != 'Disabled');
		PlayState.instance.timeBar.visible = (ClientPrefs.data.timeBarType != 'Disabled');
		PlayState.instance.timeTxt.visible = (ClientPrefs.data.timeBarType != 'Disabled');
		}
    }

	public override function getValue():String
	{
		return "Time bar type: < " + OptionsHelpers.getTimeBarByID(ClientPrefs.data.timeBarTypeNum) + " >";
	}
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类3
class PauseMusic extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left()
	{
    }

	public override function right()
	{
    }

	private override function updateDisplay():String
	{
		return "Pause Music: < " + ClientPrefs.data.pauseMusic + " >";
	}
}

#if CHECK_FOR_UPDATES
class CheckForUpdates extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{
		ClientPrefs.data.checkForUpdates = !ClientPrefs.data.checkForUpdates;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Check for Updates: " + (ClientPrefs.data.checkForUpdates ? enable_O : disable_O);
	}
}
#end

#if desktop
class DiscordRPC extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.discordRPC = !ClientPrefs.data.discordRPC;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Discord Rich Presence: " + (ClientPrefs.data.discordRPC ? enable_O : disable_O);
	}
}
#end

class GameOverVibration extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.gameOverVibration = !ClientPrefs.data.gameOverVibration;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Game Over Vibration: " + (ClientPrefs.data.gameOverVibration ? enable_O : disable_O);
	}
}

class ScreenSaver extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.screensaver = !ClientPrefs.data.screensaver;
		display = updateDisplay();
    }
	
	public override function change()
	{
	    lime.system.System.allowScreenTimeout = ClientPrefs.data.screensaver;
	}

	private override function updateDisplay():String
	{
		return "Screen Saver: " + (ClientPrefs.data.gameOverVibration ? enable_O : disable_O);
	}
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类4
class PlayOpponent extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.playOpponent = !ClientPrefs.data.playOpponent;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Play Opponent: " + (ClientPrefs.data.playOpponent ? enable_O : disable_O);
	}
}

class OpponentCodeFix extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.opponentCodeFix = !ClientPrefs.data.opponentCodeFix;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Opponent Code Fix: " + (ClientPrefs.data.opponentCodeFix ? enable_O : disable_O);
	}
}

class BotOpponentFix extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{
		ClientPrefs.data.botOpponentFix = !ClientPrefs.data.botOpponentFix;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Bot Opponent Fix: " + (ClientPrefs.data.botOpponentFix ? enable_O : disable_O);
	}

}

class HealthDrainOPPO extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{
		ClientPrefs.data.HealthDrainOPPO = !ClientPrefs.data.HealthDrainOPPO;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Health Drain: " + (ClientPrefs.data.HealthDrainOPPO ? enable_O : disable_O);
	}
}

class HealthDrainOPPOMult extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function left()
	{
		ClientPrefs.data.HealthDrainOPPOMult += 0.1;
		display = updateDisplay();
     }

	public override function right()
	{
		ClientPrefs.data.HealthDrainOPPOMult -= 0.1;
		display = updateDisplay();
     }

	private override function updateDisplay():String
	{
		return "Health Drain multipler: < " + ClientPrefs.data.HealthDrainOPPOMult + " >";
	}
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类5
class CustomFadeType extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left()
	{
	    if (ClientPrefs.data.CustomFade == 'Move')
		    ClientPrefs.data.CustomFade = 'Alpha';
		else ClientPrefs.data.CustomFade = 'Move';
		display = updateDisplay();
     }

	public override function right()
	{
	    left();
	}

	private override function updateDisplay():String
	{
		return "Custom Fade Type: < " + ClientPrefs.data.CustomFade + " >";
	}
}


class CustomFadeSound extends Option
{
	public function new(desc:String)
	{
		super();

		description = desc;
		acceptValues = true;
	}

	override function right()
	{
		ClientPrefs.data.CustomFadeSound += 0.1;
		if (ClientPrefs.data.CustomFadeSound > 1)
			ClientPrefs.data.CustomFadeSound = 1;
		display = updateDisplay();
    }

	override function left()
	{
		ClientPrefs.data.CustomFadeSound -= 0.1;

		if (ClientPrefs.data.CustomFadeSound < 0)
			ClientPrefs.data.CustomFadeSound = 0;
		display = updateDisplay();	
    }

	private override function updateDisplay():String
		{
		    var data = ClientPrefs.data.CustomFadeSound * 100;
			return "CustomFadeSound: < " + data + "% >";
		}
}

class CustomFadeText extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
	    ClientPrefs.data.CustomFadeText = !ClientPrefs.data.CustomFadeText;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Custom Fade Text: " + ClientPrefs.data.CustomFadeText;
	}
}

class SkipTitleVideo extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{
		ClientPrefs.data.skipTitleVideo = !ClientPrefs.data.skipTitleVideo;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Skip Intro Video: " + (ClientPrefs.data.skipTitleVideo ? enable_O : disable_O);
	}

}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类6
/*
class ControllerMode extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{		
		OptionsState.openSub(options.base.ControlsSubState());		
     }
}
*/

class KeyboardControls extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{	
	    OptionsState.openSub();	
	    OptionsState.openSubState(new ControlsSubState());				
    }
}

class AndroidControls extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{		
		OptionsState.openSub();	
	    OptionsState.openSubState(new MobileControlSelectSubState());					
     }
}

class ExtraControls extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{		
		//OptionsState.openSub(mobile.substates.MobileControlSelectSubState());		
     }
}

class ExtraControlsNum extends Option
{
	public function new(desc:String)
	{
		super();

		description = desc;
		acceptValues = true;
	}

	override function right()
	{
		ClientPrefs.data.extraKey += 1;
		if (ClientPrefs.data.extraKey > 4)
			ClientPrefs.data.extraKey = 4;
		display = updateDisplay();
     }

	override function left()
	{
		ClientPrefs.data.extraKey -= 1;

		if (ClientPrefs.data.extraKey < 0)
			ClientPrefs.data.extraKey = 0;
		display = updateDisplay();	
     }

	private override function updateDisplay():String
	{
		return "Android Extra Controls: < " + ClientPrefs.data.extraKey + "key >";
	}	
}

class ControlsAlpha extends Option
{
	public function new(desc:String)
	{
		super();

		description = desc;
		acceptValues = true;
	}

	override function right()
	{
		ClientPrefs.data.controlsAlpha += 0.1;
		if (ClientPrefs.data.controlsAlpha > 1)
			ClientPrefs.data.controlsAlpha = 1;
		display = updateDisplay();
     }

	override function left()
	{
		ClientPrefs.data.controlsAlpha -= 0.1;

		if (ClientPrefs.data.controlsAlpha < 0)
			ClientPrefs.data.controlsAlpha = 0;
		display = updateDisplay();	
     }

	private override function updateDisplay():String
	{
		return "Android Controls Alpha: < " + ClientPrefs.data.controlsAlpha + " >";
	}
}

class PlayControlsAlpha extends Option
{
	public function new(desc:String)
	{
		super();

		description = desc;
		acceptValues = true;
	}

	override function right()
	{
		ClientPrefs.data.playControlsAlpha += 0.1;
		if (ClientPrefs.data.playControlsAlpha > 1)
			ClientPrefs.data.playControlsAlpha = 1;
		display = updateDisplay();
     }

	override function left()
	{
		ClientPrefs.data.playControlsAlpha -= 0.1;

		if (ClientPrefs.data.playControlsAlpha < 0)
			ClientPrefs.data.playControlsAlpha = 0;
		display = updateDisplay();	
     }

	private override function updateDisplay():String
	{
		return "Android Play Controls Alpha: < " + ClientPrefs.data.playControlsAlpha + " >";
	}
}

class HitboxLocation extends Option
{
	public function new(desc:String)
	{
		super();

		description = desc;
		acceptValues = true;
	}

	override function left()
	{
		if (ClientPrefs.data.hitboxLocation == 'Bottom')
		    ClientPrefs.data.hitboxLocation = 'Top';
		else ClientPrefs.data.hitboxLocation = 'Bottom';
		display = updateDisplay();
     }

	override function right()
	{
		left();
     }       

	private override function updateDisplay():String
	{
		return "Hitbox Extra Controls Location: < " + ClientPrefs.data.hitboxLocation + " >";
	}
}

class HitboxSkin extends Option
{
	public function new(desc:String)
	{
		super();

		description = desc;
		acceptValues = true;
	}

	override function left()
	{
		if (ClientPrefs.data.hitboxSkin == 'Classic')
		    ClientPrefs.data.hitboxSkin = 'New';
		else ClientPrefs.data.hitboxSkin = 'Classic';
		display = updateDisplay();
     }

	override function right()
	{
		left();
     }       

	private override function updateDisplay():String
	{
		return "Hitbox Skin: < " + ClientPrefs.data.hitboxSkin + " >";
	}
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类7
/*
class Language extends Option
{
    
	public function new(desc:String)
	{
		super();
		description = desc;
	}		

	public override function left()
	{
		ClientPrefs.data.language--;
		if (ClientPrefs.data.language < 0)
		ClientPrefs.data.language = OptionsHelpers.languageArray.length -1;
		
		FlxTransitionableState.skipNextTransIn = true;
		MusicBeatState.switchState(new options.OptionsState()); //reset substate for real
		
    }

	public override function right()
	{
		ClientPrefs.data.language++;
		if (ClientPrefs.data.language > OptionsHelpers.languageArray.length -1)
		ClientPrefs.data.language = 0;
		
		FlxTransitionableState.skipNextTransIn = true;
		MusicBeatState.switchState(new options.OptionsState());	//reset substate for real		
		        
    }

	private override function updateDisplay():String
	{
		return "Language: < " + OptionsHelpers.languageArray[ClientPrefs.data.language] + " >";
	}
}
*/

class FPSCap extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
		acceptValues = true;
	}
	
	override function left()
	{
		if (ClientPrefs.data.framerate <= 24)
			ClientPrefs.data.framerate = 24;
		else
			ClientPrefs.data.framerate = ClientPrefs.data.framerate - 1;
    }
    
    override function right()
	{
		if (ClientPrefs.data.framerate >= 290)
		{
			ClientPrefs.data.framerate = 290;            
		}
		else
			ClientPrefs.data.framerate = ClientPrefs.data.framerate + 1;		  
    }

    override function change()
	{
		if(ClientPrefs.data.framerate > FlxG.drawFramerate)
		{
			FlxG.updateFramerate = ClientPrefs.data.framerate;
			FlxG.drawFramerate = ClientPrefs.data.framerate;
		}
		else
		{
			FlxG.drawFramerate = ClientPrefs.data.framerate;
			FlxG.updateFramerate = ClientPrefs.data.framerate;
		}
	}
	
	private override function updateDisplay():String
	{
		return "FPS Cap: < " + ClientPrefs.data.framerate + " >";
	}
}

class ColorblindMode extends Option
{
    
	public function new(desc:String)
	{
		super();
		description = desc;
	}		

	public override function left()
	{
		ClientPrefs.data.colorblindMode--;
		if (ClientPrefs.data.colorblindMode < 0)
		ClientPrefs.data.colorblindMode = OptionsHelpers.colorblindFilterArray.length -1;		
		ColorblindFilter.UpdateColors();
    }

	public override function right()
	{
		ClientPrefs.data.colorblindMode++;
		if (ClientPrefs.data.colorblindMode > OptionsHelpers.colorblindFilterArray.length -1)
		ClientPrefs.data.colorblindMode = 0;
	    ColorblindFilter.UpdateColors();
    }	
	
	public override function change()
	{
	    ColorblindFilter.UpdateColors();
	}

	private override function updateDisplay():String
	{
		return "ColorblindFilter: < " + OptionsHelpers.colorblindFilterArray[ClientPrefs.data.colorblindMode] + " >";
	}
}

class Shaders extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.shaders = !ClientPrefs.data.shaders;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Shaders: < " + (ClientPrefs.data.shaders ? enable_O : disable_O);
	}
}

class GPUcache extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.cacheOnGPU = !ClientPrefs.data.cacheOnGPU;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "GPU Cache: < " + (ClientPrefs.data.cacheOnGPU ? enable_O : disable_O);
	}
}

class ImagePersist extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
		acceptValues = true;
	}	

	override function right()
	{
		ClientPrefs.data.imagePersist = !ClientPrefs.data.imagePersist;
		display = updateDisplay();
		

	}

	override function press()
	{
		right();
    }
	
	private override function updateDisplay():String
	{
		return "ImagePersist: < " + ClientPrefs.data.imagePersist;
	}
}

class FlashingLights extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.flashing = !ClientPrefs.data.flashing;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Flashing Lights: < " + (ClientPrefs.data.flashing ? enable_O : disable_O);
	}
}

class QualityLow extends Option
{
	public function new(desc:String)
	{
		super();
              if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
             		if (OptionsState.onPlayState)
			return false;
        ClientPrefs.data.lowQuality = !ClientPrefs.data.lowQuality;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Low Quality: < " + (ClientPrefs.data.lowQuality ? enable_O : disable_O);
	} 
}

class Antialiasing extends Option
{
	public function new(desc:String)
	{
		super();
		if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
		if (OptionsState.onPlayState)
			return false;
		ClientPrefs.data.antialiasing = !ClientPrefs.data.antialiasing;
            
		display = updateDisplay();
    }	

    public override function change()
	{
	
	}
	
	private override function updateDisplay():String
	{
		return "Antialiasing: < " + (ClientPrefs.data.antialiasing ? enable_O : disable_O);
	}
}

class AutoPause extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
		ClientPrefs.data.autoPause = !ClientPrefs.data.autoPause;
        FlxG.autoPause = ClientPrefs.data.autoPause;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "AutoPause: < " + (ClientPrefs.data.autoPause ? enable_O : disable_O);
	} 
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类8
class FPSOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{	
		ClientPrefs.data.showFPS = !ClientPrefs.data.showFPS;
		
		if(Main.fpsVar != null)
		Main.fpsVar.visible = ClientPrefs.data.showFPS;
			
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "FPS Counter: < " + (ClientPrefs.data.showFPS ? enable_O : disable_O);
	} 
}

class FPSRainbowOption extends Option
{
	public function new(desc:String)
	{
		super();
              if (OptionsState.onPlayState)
			description = "This option cannot be toggled in the pause menu.";
		else
			description = desc;
	}

	public override function press()
	{
        if (OptionsState.onPlayState)
			return false;
        ClientPrefs.data.rainbowFPS = !ClientPrefs.data.rainbowFPS;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "FPS Rainbow: < " + (ClientPrefs.data.rainbowFPS ? enable_O : disable_O);
	} 
}

class MEMOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
	    ClientPrefs.data.showMEM = !ClientPrefs.data.showMEM;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Memory Counter: < " + (ClientPrefs.data.showMEM ? enable_O : disable_O);
	} 
}

class MEMType extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function left()
	{
	    ClientPrefs.data.memoryType--;
	    if (ClientPrefs.data.memoryType < 0) ClientPrefs.data.memoryType = OptionsHelpers.memoryTypeArray.length - 1;
		display = updateDisplay();
    }

	public override function right()
	{
		ClientPrefs.data.memoryType++;
		if (ClientPrefs.data.memoryType > OptionsHelpers.memoryTypeArray.length - 1) ClientPrefs.data.memoryType = 0;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Memory Data: < " + OptionsHelpers.memoryTypeArray[ClientPrefs.data.memoryType] + " >";
	} 
}

class DelayOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{
	    ClientPrefs.data.showMS = !ClientPrefs.data.showMS;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Update time Counter: < " + (ClientPrefs.data.showMS ? enable_O : disable_O);
	} 
}

class WaterMarkOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
	}

	public override function press()
	{	
		ClientPrefs.data.showWatermark = !ClientPrefs.data.showWatermark;
		
		if(Main.watermark != null)
		Main.watermark.visible = ClientPrefs.data.showWatermark;
					
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Watermark: < " + (ClientPrefs.data.showWaterMark ? 'Show' : 'Hide');
	} 
}

//----------------------------------------------------------------
//----------------------------------------------------------------
//----------------------------------------------------------------
//大类9
class FrameOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc + " (Press R to reset)";
		acceptType = true;
	}

	public override function left()
	{
		ClientPrefs.data.safeFrames -= 0.1 ;
		if (ClientPrefs.data.safeFrames < 0)
			ClientPrefs.data.safeFrames = 0;
		display = updateDisplay();
    }

	public override function right()
	{
		ClientPrefs.data.safeFrames += 0.1;
		if (ClientPrefs.data.safeFrames > 10)
			ClientPrefs.data.safeFrames = 10;
		display = updateDisplay();
    }

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			ClientPrefs.data.safeFrames = 10;
	}

	private override function updateDisplay():String
	{
		return "safeFrames: < " + ClientPrefs.data.safeFrames + " >";
	}
}

class RatingOffset extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc + " (Press R to reset)";
		acceptType = true;
	}

	public override function left()
	{
		ClientPrefs.data.ratingOffset--;
		if (ClientPrefs.data.ratingOffset < -30)
			ClientPrefs.data.ratingOffset = -30;
		display = updateDisplay();
    }

	public override function right()
	{
		ClientPrefs.data.ratingOffset++;
		if (ClientPrefs.data.ratingOffset > 30)
			ClientPrefs.data.ratingOffset = 30;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Rating Offset: < " + ClientPrefs.data.ratingOffset + " >";
	}
}

class MarvelousMsOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc;
		acceptType = true;
	}

	public override function left()
	{
		ClientPrefs.data.marvelousWindow--;
		if (ClientPrefs.data.marvelousWindow < 0)
			ClientPrefs.data.marvelousWindow = 0;
		display = updateDisplay();
    }

	public override function right()
	{
		ClientPrefs.data.marvelousWindow++;
		if (ClientPrefs.data.marvelousWindow > 166)
			ClientPrefs.data.marvelousWindow = 166;
		display = updateDisplay();
    }

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			ClientPrefs.data.marvelousWindow = 45;
	}

	private override function updateDisplay():String
	{
		return "Marvelous Hit Window: < " + ClientPrefs.data.marvelousWindow + MS_O + " >";
	}
}

class SickMsOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc + " (Press R to reset)";
		acceptType = true;
	}

	public override function left()
	{
		ClientPrefs.data.sickWindow--;
		if (ClientPrefs.data.sickWindow < 0)
			ClientPrefs.data.sickWindow = 166;
		display = updateDisplay();
    }

	public override function right()
	{
		ClientPrefs.data.sickWindow++;
		if (ClientPrefs.data.sickWindow > 166)
			ClientPrefs.data.sickWindow = 166;
		display = updateDisplay();
    }

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			ClientPrefs.data.sickWindow = 45;
	}

	private override function updateDisplay():String
	{
		return "Sick Hit Window: < " + ClientPrefs.data.sickWindow + MS_O + " >";
	}
}

class GoodMsOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc + " (Press R to reset)";
		acceptType = true;
	}

	public override function left()
	{
		ClientPrefs.data.goodWindow--;
		if (ClientPrefs.data.goodWindow < 0)
			ClientPrefs.data.goodWindow = 0;
		display = updateDisplay();
    }

	public override function right()
	{
		ClientPrefs.data.goodWindow++;
		if (ClientPrefs.data.goodWindow > 166)
			ClientPrefs.data.goodWindow = 166;
		display = updateDisplay();
    }

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			ClientPrefs.data.goodWindow = 90;
	}

	private override function updateDisplay():String
	{
		return "Good Hit Window: < " + ClientPrefs.data.goodWindow + MS_O + " >";
	}
}

class BadMsOption extends Option
{
	public function new(desc:String)
	{
		super();
		description = desc + " (Press R to reset)";
		acceptType = true;
	}

	public override function left()
	{
		ClientPrefs.data.badWindow--;
		if (ClientPrefs.data.badWindow < 0)
			ClientPrefs.data.badWindow = 0;
		display = updateDisplay();
    }

	public override function right()
	{
		ClientPrefs.data.badWindow++;
		if (ClientPrefs.data.badWindow > 166)
			ClientPrefs.data.badWindow = 166;
		display = updateDisplay();
    }

	public override function onType(char:String)
	{
		if (char.toLowerCase() == "r")
			ClientPrefs.data.badWindow = 135;
	}

	private override function updateDisplay():String
	{
		return "Bad Hit Window: < " + ClientPrefs.data.badWindow + MS_O + " >";
	}
}

class MarvelousRating extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{
		ClientPrefs.data.marvelousRating = !ClientPrefs.data.marvelousRating;
		display = updateDisplay();
    }

	private override function updateDisplay():String
	{
		return "Marvelous Rating: < " + (ClientPrefs.data.marvelousRating ? enable_O : disable_O);
	}
}

class MarvelousSprite extends Option
{
	public function new(desc:String)
	{
		super();
	}

	public override function press()
	{
		ClientPrefs.data.marvelousSprite = !ClientPrefs.data.marvelousSprite;
		display = updateDisplay();
     }

	private override function updateDisplay():String
	{
		return "Marvelous Sprite: < " + (ClientPrefs.data.marvelousSprite ? enable_O : disable_O);
	}
}
