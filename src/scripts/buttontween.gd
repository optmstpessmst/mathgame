extends Control

@export var tween_intensity: float
@export var tween_duration: float
@onready var play: Button = $Play
@onready var exit: Button = $Exit

func _process(_delta: float) -> void:
	btn_hovered(play)
	btn_hovered(exit)

func btn_hovered(button: Button):
	button.pivot_offset = button.size / 2
	if button.is_hovered():
		start_tween(button, "scale", Vector2.ONE * tween_intensity, tween_duration)
	else:
		start_tween(button, "scale", Vector2.ONE, tween_duration)

func start_tween(object: Object, property: String, final_var: Variant, duration: float):
	var tween = create_tween()
	tween.tween_property(object, property, final_var, duration)
