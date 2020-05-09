extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var id = null
var input_vector = Vector2.ZERO
var enable = false
var new_pos = Vector2.ZERO

# Called when the node enters the scene tree for the first time.
func _ready():
	pass
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _physics_process(delta):
	
	if enable:
		if Input.get_action_strength("ui_right"):
			input_vector.x += 5;
		elif Input.get_action_strength("ui_left"):
			input_vector.x -= 5;
		elif Input.get_action_strength("ui_up"):
			input_vector.y -= 5;
		elif Input.get_action_strength("ui_down"):
			input_vector.y += 5;	
		
	move_and_slide(input_vector)

func passPlayerInformationToServer(): #just work to enable Player
	return '{"id":"{0}","pos_x":{1},"pos_y":{2}}'.format([id,position.x, position.y]) 
	
func processOtherPlayersInfo(data):
	position.x=data.pos_x
	position.y=data.pos_y
	
