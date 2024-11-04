
extends CharacterBody3D

@export var speed = 5.0
@export var jump_speed = -10.0
@export var gravity = -30.0


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
# Получаем входные данные от пользователя
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	# Преобразуем вектор ввода в глобальное пространство
	var direction = (transform.basis * Vector3(input_vector.x, 0, input_vector.y)).normalized()
	
	# Обновляем скорость
	velocity.x = direction.x * speed
	velocity.z = direction.z * speed
	
	# Применяем гравитацию
	velocity.y += gravity * delta
	
	# Проверяем возможность прыжка
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = jump_speed
	
	# Применяем движение
	move_and_slide()
