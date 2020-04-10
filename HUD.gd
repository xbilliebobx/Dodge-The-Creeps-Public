extends CanvasLayer

signal start_game

func _ready() -> void:
	$ScoreLabel.hide()

func show_label():
	$ScoreLabel.show()

func show_message(text):
	$MessageLabel.text = text
	$MessageLabel.show()
	$MessageTimer.start()

func game_over():
	show_message("You lost\nyour mental")
	yield($MessageTimer, "timeout")
	$StartButton.show()
	$MessageLabel.text = "Morning\nmeeting\nis over!"
	$MessageLabel.show()

func update_score(score):
	$ScoreLabel.text = str(score)

func update_mobscore(mobscore):
	$MobLabel.text = str(mobscore)

func _on_MessageTimer_timeout():
	$MessageLabel.hide()

func _on_StartButton_pressed() -> void:
	$StartButton.hide()
	emit_signal("start_game")
