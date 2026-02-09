// gravity
yVelocity += 0.2

// friction and residual speed
if place_meeting(x,y+1, oSolid) {
		xVelocity = 0
} else {
	if xVelocity > 0 {
		xVelocity -= 0.05
	} if xVelocity < 0 {
		xVelocity += 0.05
	}
}


// go left
if keyboard_check(vk_left) {
	if xVelocity > -4 and not place_meeting(x,y+1, oSolid) {
		xVelocity -= 0.2
	} else {
		xVelocity=-4
	}
}


// go right
if keyboard_check(vk_right) {
	if xVelocity < 4 and not place_meeting(x,y+1, oSolid) {
		xVelocity += 0.2
	} else {
		xVelocity=+4
	}
}

// grounded gravity and jumping
if place_meeting(x,y+1, oSolid) {
	yVelocity =  0
	if keyboard_check(vk_up) {
		yVelocity = -8.5
	}
}

// wizardly magic
move_and_collide(xVelocity, yVelocity, oSolid)

// win condition
if place_meeting(x,y,oFlag) {
	room_goto_next()
}

// lose condition
if place_meeting(x,y,oSpike) {
	room_restart()
}