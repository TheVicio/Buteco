extends Control

const GroupShop = preload("res://classes/GroupShop.gd")
const Wallpaper = preload("res://classes/WallpaperItemShop.gd")
const Chair = preload("res://classes/ChairItemShop.gd")
const Cabinet = preload("res://classes/CabinetItemShop.gd")
var groups = {}

func _ready():
	add_group(GroupShop.new("wallpapers"))
	add_group(GroupShop.new("chairs"))
	add_group(GroupShop.new("cabinets"))
	groups["wallpapers"].add_child(Wallpaper.new("000000", 1, "black"))
	groups["wallpapers"].add_child(Wallpaper.new("ffffff", 2, "white"))
	groups["wallpapers"].add_child(Wallpaper.new("bc6500", 3, "orange"))
	groups["wallpapers"].add_child(Wallpaper.new("207800", 4, "green"))
	groups["wallpapers"].add_child(Wallpaper.new("000637", 5, "blue"))
	groups["wallpapers"].add_child(Wallpaper.new("530000", 6, "red"))
	groups["wallpapers"].add_child(Wallpaper.new("e1be04", 7, "yellow"))
	groups["wallpapers"].add_child(Wallpaper.new("250026", 8, "purple"))
	groups["wallpapers"].add_child(Wallpaper.new("452b12", 9, "brown"))
	groups["wallpapers"].add_child(Wallpaper.new("565554", 10, "grey"))
	groups["chairs"].add_child(Chair.new(1))
	groups["chairs"].add_child(Chair.new(2))
	groups["chairs"].add_child(Chair.new(3))
	groups["chairs"].add_child(Chair.new(4))
	groups["chairs"].add_child(Chair.new(5))
	groups["chairs"].add_child(Chair.new(6))
	groups["chairs"].add_child(Chair.new(7))
	groups["chairs"].add_child(Chair.new(8))
	groups["chairs"].add_child(Chair.new(9))
	groups["chairs"].add_child(Chair.new(10))
	groups["cabinets"].add_child(Cabinet.new(1))
	groups["cabinets"].add_child(Cabinet.new(2))
	groups["cabinets"].add_child(Cabinet.new(3))
	groups["cabinets"].add_child(Cabinet.new(4))
	groups["cabinets"].add_child(Cabinet.new(5))
	groups["cabinets"].add_child(Cabinet.new(6))

func _on_quit_pressed():
	visible = false
	get_tree().paused = false

func add_group(group: GroupShop):
	groups[group.type] = group
	var button = Button.new()
	button.text = Options.lang_content[group.type]
	button.connect("button_down", self, "on_button_group_pressed", [group])
	$HBoxContainer/HBoxContainer.add_child(button)
	var child_count = $CenterContainer.get_child_count()
	if child_count:
		$CenterContainer.get_child(child_count - 1).visible = false
	$CenterContainer.add_child(group)

func on_button_group_pressed(widget):
	for value in groups.values():
		if value == widget:
			value.visible = true
		else:
			value.visible = false


func _on_message_error_timeout():
	$"mensagem de erro".visible = false