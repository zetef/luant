require("util")

-- TODO: treat screen as cell grid

dir 		= {}		-- direction vector
ant 		= {} 		-- ant position
pnts 		= {}		-- points to draw

size		= 1
YDIR, XDIR 	= 1,2		-- names for y and x dirs for dir vector
U,R,D,L 	= 1,2,3,4	-- directions
ON,OFF  	= 1,0		-- cell state

love.load = function()
	width, height = love.graphics.getDimensions()

	for i=1,4 do dir[i] = {0,0} end

	dir[U] = {-1,0}
	dir[R] = {0,1}
	dir[D] = {1,0}
	dir[L] = {0,-1}

	ant.x = width/2 or 400
	ant.y = height/2 or 300
	ant.dir = U			-- initial dir

	pnts[ant.y] = {[ant.x]=OFF}

	--print(dir[ant.dir][YDIR], dir[ant.dir][XDIR])
end

love.update = function(dt)
--	print(ant.x, ant.y)

	if pnts[ant.y] then
		if pnts[ant.y][ant.x]==ON then
		--	print("point is on")
			ant.dir = clamp(ant.dir-1, U,L)
			pnts[ant.y][ant.x]=OFF
			ant.x = boundx(ant.x + dir[ant.dir][XDIR]*size, width)
			ant.y = boundy(ant.y + dir[ant.dir][YDIR]*size, height)
		--	if not pnts[ant.y] == nil then pnts[ant.y] = {[ant.x]=OFF} end
		elseif pnts[ant.y][ant.x]==OFF then
		--	print("point is off")
			ant.dir = clamp(ant.dir+1, U,L)
			pnts[ant.y][ant.x]=ON
			ant.x = boundx(ant.x + dir[ant.dir][XDIR]*size, width)
			ant.y = boundy(ant.y + dir[ant.dir][YDIR]*size, height)
	--		if pnts[ant.y] == nil then pnts[ant.y] = {[ant.x]=OFF} end
		else
			pnts[ant.y][ant.x] = OFF
		end
	else
		pnts[ant.y] = {[ant.x] = OFF}
--		print("point doesn't exist")
	end

--	love.timer.sleep(0.2)
end

love.draw = function() 
	for ky, vy in pairs(pnts) do
		for kx, vx in pairs(vy) do
	--		if vx==ON then love.graphics.print("*", kx, ky) end
			if vx==ON then love.graphics.points(kx,ky) end
		end
	end
	love.graphics.print({{1,0,0}, "*"}, ant.x, ant.y)
end

love.quit = function()
	print("Happy anting!")
end

love.keypressed = function(key, code, isrepeat)
	if key == "q" then
		love.event.quit()
	end
end

love.mousemoved = function(x, y, dx, dy)

end

love.mousepressed = function(x, y, button)
	
end

love.mousereleased = function(x, y, button)

end

love.wheelmoved = function(dx, dy)

end
