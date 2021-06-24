extends KinematicBody2D

export (int) var speed = 120
export (int) var jump_speed = -180
export (int) var gravity = 400

var velocity = Vector2.ZERO

export (float,0,1.0) var friction = 0.1
export (float,0,1.0) var acceleration = 0.25

enum state {CLINGIDLE, CROUCHIDLE, CROUCHWALK, FALL, FLIPJUMP, HANDSTRONGATTACK, HANDWEAKATTACK, IDLE, JUMP, KICK, RUNNING, SLIDE, SPRINT, SWORDSTRONGATTACK, SWORDWEAKATTACK}

var player_state = state.IDLE

func get_input():
	var dir = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	if dir != 0:
		velocity.x = lerp(velocity.x, dir * speed, acceleration)
	else:
		velocity.x = lerp(velocity.x, 0, friction)
		
func _physics_process(delta):
	if player_state != state.ROLLING and player_state != state.HANDSTRONGATTACK and player_state != state.HANDWEAKATTACK and player_state != state.SWORDSTRONGATTACKand player_state != state.SWORDWEAKATTACK and player_state != state.KICK:
		get_input()
		print(velocity)
		
		if velocity.x == 0:
			player.state = state.IDLE
		elif velocity.x != 0 and Input.is_action_just_pressed("ui_down")
			player_state = state.ROLLING
		elif velocity.x != 0:
			player_state = state.RUNNING
			
			 
		
		
		
		
