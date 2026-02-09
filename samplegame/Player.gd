extends KinematicBody2D

export var speed := 250
var motion := Vector2.ZERO

onready var anim := $AnimatedSprite

func _physics_process(delta):
	motion = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		motion.x += 1
		anim.flip_h = false
		anim.play("walk_side")
	elif Input.is_action_pressed("ui_left"):
		motion.x -= 1
		anim.flip_h = true
		anim.play("walk_side")
	elif Input.is_action_pressed("ui_down"):
		motion.y += 1
		anim.play("walk_down")
	elif Input.is_action_pressed("ui_up"):
		motion.y -= 1
		anim.play("walk_up")
	else:
		anim.play("idle")

	motion = motion.normalized() * speed
	move_and_slide(motion)
