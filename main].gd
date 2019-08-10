extends Node

var num = 0
var run = false

func _ready():
	ssln(num)
	pass

func _physics_process(delta):
	if run:
		ssln(num)
		num += 1

func ssln(n : int):
	var number = []
	var r_number = []
	var result = 0
	var a_result = []
	
	for c in range( str(n).length() ):
		number.push_back( PoolByteArray( [str(n).ord_at(c)] ).get_string_from_ascii() )
		r_number.push_front( PoolByteArray( [str(n).ord_at(c)] ).get_string_from_ascii() )
	
	for i in range( number.size() ):
#		print(result)
		a_result.push_back( pow( int(number[i]) , int(r_number[i] ) )  )
		result += pow( int(number[i]) , int(r_number[i] ) )
	
	$Margin/VBoxContainer/PC/M/Info.text = str("Sums: \n" , a_result , 
	"\nN:", n , " | Result: " , result ) 
	
	if n == result:
		$Margin/VBoxContainer/Text.text += str(
		"_______________________________________________\n" , "Sums: \n" , a_result , 
		"\nN:", n , " | Result: " , result , 
		"\n____________________________________________________________\n" , n) 
	
	pass

func _on_Button_pressed():
	run = !run
	if run:
		$Margin/VBoxContainer/Button.text = "STOP"
	else:
		$Margin/VBoxContainer/Button.text = "START"
