extends HBoxContainer

func _ready():
	update_chairs("res://sprites/cadeiraa.png")

func update_chairs(texture_path):
	for x in [$cadeira1, $cadeira2, $cadeira3, $cadeira4]:
		x.texture = load(texture_path)

