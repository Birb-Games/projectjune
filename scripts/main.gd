extends Node2D

func update_hud():
	if $Player.in_lawnmower_range() and $Lawnmower.is_stuck():
		$HUD.update_info_text("Lawn mower is stuck!")
	else:
		$HUD.update_info_text("")
	
	$HUD.update_progress_bar($Lawn.get_perc_cut())

func _process(_delta: float) -> void:
	update_hud()
