extends CharacterBody2D

extends Area2D

@export var dialogue_lines: Array[String] = [
	"Привет, путник!",
	"Сегодня отличный день для приключений.",
    "Удачи на твоём пути!"
]

var current_line := 0
var player_in_range := false

func _input(event: InputEvent) -> void:
	if player_in_range and event.is_action_pressed("ui_accept"):
		show_next_line()

func show_next_line():
	if current_line < dialogue_lines.size():
		get_node("Label").text = dialogue_lines[current_line]
		current_line += 1
	else:
		get_node("Label").text = ""
		current_line = 0

func _on_body_entered(body: Node) -> void:
	if body.name == "Player":
		player_in_range = true

func _on_body_exited(body: Node) -> void:
	if body.name == "Player":
		player_in_range = false
		get_node("Label").text = ""
		current_line = 0
