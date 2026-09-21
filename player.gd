extends CharacterBody2D


const SPEED = 900.0
const JUMP_VELOCITY = -900.0
const GRAVITY_MULTIPLIER = 2.0  # Increases gravity strength (2x default)


func _physics_process(delta: float) -> void:
	# Add the increased gravity.
	if not is_on_floor():
		velocity += (get_gravity() * GRAVITY_MULTIPLIER) * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
