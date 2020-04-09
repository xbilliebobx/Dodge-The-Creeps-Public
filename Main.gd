extends Node2D

export (PackedScene) var Mob
export (PackedScene) var Sale
var score

func _ready() -> void:
	randomize()

func new_game():
	score = 0
	$Player.start($StartPosition.position)
	$StartTimer.start()
	$HUD.show_message("Get Ready")
	$HUD.update_score(score)
	$ThemeSong.play()

func game_over() -> void:
	$ScoreTimer.stop()
	$MobTimer.stop()
	$SaleTimer.stop()
	$HUD.game_over()
	$DeathSound.play()
	$ThemeSong.stop()

func _on_StartTimer_timeout() -> void:
	$MobTimer.start()
	$ScoreTimer.start()
	$SaleTimer.start()

func _on_ScoreTimer_timeout() -> void:
	score += 1
	$HUD.update_score(score)

func _on_MobTimer_timeout() -> void:
	$MobPath/MobSpawnLocation.set_offset(randi())
	var mob = Mob.instance()
	add_child(mob)
	var direction = $MobPath/MobSpawnLocation.rotation
	mob.position = $MobPath/MobSpawnLocation.position
	direction += rand_range(PI/4, PI*3/4)
	mob.rotation = direction
	mob.set_linear_velocity(Vector2(rand_range(mob.MIN_SPEED, mob.MAX_SPEED),0).rotated(direction))

func _on_SaleTimer_timeout() -> void:
	$MobPath/MobSpawnLocation.set_offset(randi())
	var sale = Sale.instance()
	add_child(sale)
	var directionsale = $MobPath/MobSpawnLocation.rotation
	sale.position = $MobPath/MobSpawnLocation.position
	directionsale += rand_range(PI*1/8, PI*7/8)
	sale.rotation = directionsale
	sale.set_linear_velocity(Vector2(rand_range(sale.MIN_SPEED, sale.MAX_SPEED), 0).rotated(directionsale))
