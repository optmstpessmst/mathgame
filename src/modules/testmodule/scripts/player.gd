extends CharacterBody2D


const SPEED = 400.0
const JUMP_VELOCITY = -550.0
const DROP_VELOCITY = 5000.0

const scrunkleskin = preload("res://modules/testmodule/assets/scrunkle.png")
const evilscrunkleskin = preload("res://modules/testmodule/assets/evilscrunkle.png")

func _physics_process(delta: float) -> void:
	var evil = false
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("ui_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("ui_down") and not is_on_floor():
		velocity.y = DROP_VELOCITY
	
	##  if Input.is_action_just_pressed("evilscrunkle"):
	##  	if evil == false:
	##  		texture = load(evilscrunkleskin)
	##  	else:
	##  		texture = load(scrunkleskin)
	
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
	
	if is_on_floor():
		var normal: Vector2 = get_floor_normal()
		rotation = normal.angle() + deg_to_rad(90)
