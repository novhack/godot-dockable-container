extends Node
class_name DockableContainerSplit

enum Split {
	HORIZONTAL,
	VERTICAL,
}

export(Split) var split = Split.HORIZONTAL setget set_split, get_split
export(float, 0, 1) var percent = 0.5

var _split = Split.HORIZONTAL
var _percent = 0.5


func set_split(value: int) -> void:
	_split = value


func get_split() -> int:
	return _split


func set_percent(value: float) -> void:
	_percent = clamp(value, 0, 1)


func get_percent() -> float:
	return _percent


static func first_rect(rect: Rect2, split: int, percent: float) -> Rect2:
	if split == Split.HORIZONTAL:
		return rect.grow_margin(MARGIN_RIGHT, -rect.size.x * (1.0 - percent))
	else:
		return rect.grow_margin(MARGIN_TOP, -rect.size.y * (1.0 - percent))


static func second_rect(rect: Rect2, split: int, percent: float) -> Rect2:
	if split == Split.HORIZONTAL:
		return rect.grow_margin(MARGIN_LEFT, -rect.size.x * percent)
	else:
		return rect.grow_margin(MARGIN_TOP, -rect.size.y * percent)
