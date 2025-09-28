extends CharacterBody2D


var speed = 300
var jump_power = -300
var gravity = 800

func _physics_process(delta):
	
	velocity.y += gravity * delta
	
	
	if Input.is_key_pressed(KEY_SPACE) and is_on_floor():
		velocity.y = jump_power
	
	
	if Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT):
		velocity.x = -speed
	elif Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT):
		velocity.x = speed
	else:
		velocity.x = 0
	
	move_and_slide()
func _input(event):
	
	if event.is_action_pressed("pause"):
		
		var pause_menu = get_tree().get_first_node_in_group("pause_menu")
		if pause_menu:
			pause_menu.toggle_pause()
