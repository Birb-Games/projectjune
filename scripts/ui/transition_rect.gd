extends ColorRect

var time_passed: float = 0.0

func _ready() -> void:
	start_animation()

func _process(delta: float) -> void:
	if color.a <= 0.02:
		hide()
		return
	time_passed += delta
	color.a = clamp(1.0 - time_passed * time_passed * 0.25, 0.0, 1.0)

	var t = max(time_passed - 1.0, 0.0)
	$Label.modulate.a = clamp(1.0 - t * t, 0.0, 1.0)

func start_animation():
	$Label.modulate = Color.WHITE
	$Label.text = "Day %d" % $/root/Main.current_day
	time_passed = 0.0
	show()
	color.a = 1.0
