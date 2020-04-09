extends RigidBody2D

export (int) var MIN_SPEED
export (int) var MAX_SPEED
var mob_type = ["fly", "swim", "walk"]

func _ready() -> void:
	$AnimatedSprite.animation = mob_type[randi() % mob_type.size()]


func _on_VisibilityNotifier2D_screen_exited() -> void:
	queue_free()



#func _on_Mob_body_shape_entered(body) -> void:
#	print("fuck")
#	if body.get_name() == "Player":
#		body.hit_by_enemy()
