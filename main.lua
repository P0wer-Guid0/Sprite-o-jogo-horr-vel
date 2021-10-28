function love.load()
	love.window.setMode(2160,1080 , {resizable = true})
	 x = 300
	 speed = 10
	image_link = love.graphics.newImage("joaomanjarola.png")
	image_height = image_link:getHeight()
	image_width = image_link:getWidth()
	y = 1800
	timer = 140
	z =0
	a=255
	c=60
	p=990
	u = 800
	t = 100
	m =100
	life = 3
	sentido = 0
	colided = "nao"
	pulo = 3 
	dificuldade = 0
	velociade_y  = 0
	trololo = u - 50
	iniciar = 0 
	zuka = 0 
	zika = 0
	zinb = 0

	musica = love.audio.newSource('ugabuga.mp3', 'static')
end


 function love.draw()
 	love.graphics.setColor( z, a , c)
 	love.graphics.rectangle("fill", 0 , 0, 2160 , 1080)
 	love.graphics.setColor(255, 255, 255)
 	love.graphics.circle("fill", x, u-50, t, m)
 	love.graphics.setColor(255, 255, 255)
 	love.graphics.draw(image_link , y, p ,math.pi*(sentido)/30 , 0.5, 0.5, image_width/2, image_height/2)
 	love.graphics.setColor(zuka,zika,zinb)
 	love.graphics.print(math.floor(timer) , 10, 10 , 0 , 2 , 2)
 	love.graphics.setColor(0, 240,0 )
 	love.graphics.rectangle("fill", 0, 950 - image_height/2, 2160, 300)
 	love.graphics.setColor(255 , 0, 0)
    if timer > 150 then love.graphics.print	("O MUNDO VAI ACABAR", 500 , 100 , 0 , 5 , 5)
   	end

   love.graphics.setColor(zuka , zika , zinb)
	love.graphics.print(tostring(pulo), 10, 60 , 0, 2, 2) 	
 end 

function love.keypressed(key)
		if key == "d" then 
			y = y + 10
		end
end
 function love.keypressed(key)
 	if key == "w" then
 		iniciar = iniciar - 1 
 		if pulo > 0 then
 			velociade_y = -10 
 			if p >= 660 then 
 				p = 659

 			end 
 			pulo = pulo - 1
 		end
 	end 	
end

function gravidade()
	if p < 660 then
		velociade_y = velociade_y + 0.1 
	else
		velociade_y = 0 
	end
end



 


 	
function love.update(dt)
	--if colided == "sim" then
	 --	y =1800
	 --	p = 990
	 --	timer =  0 
	--end  

	if timer > 100 then 
		zika = 255
		zinb = 255
		zuka = 255
	end 	
   if timer > 141 then 
   	love.audio.play(musica)
   end 
	
	if timer > 150 then u = trololo
	end

	x = x + speed

	if x > 2160 then 
		speed = -10
	end
	if x < 0 then 
		speed = 10	
	end

	if love.keyboard.isDown("d") then
		y = y + 10
	end 
	if iniciar < 0 then timer = timer + dt
		end  
	
	if timer > 40 then 
		a = 255 
		z = 50 
		c = 0
	end
	if p >= 660 then 
		pulo = 3 
	end
	
	if timer > 10 then
		if x > 2160 then speed = -15 
		end 
		if x < 0 then speed = 15 
		end
	if timer > 20 then 
		if x > 2160 then speed = -20
		end 
		if x < 0 then speed = 20 end 
	end 
	if timer > 30 then 
		if x > 2160 then speed = -30
		end
		if x < 0 then speed = 30
		end 
	end 
		if timer > 50 then 
		if x > 2160 then speed = -31
		end
		if x < 0 then speed = 31
		end 
	end 
		if timer > 100 then 
		if x > 2160 then speed = -35
		end
		if x < 0 then speed = 35
		end 
	end
	if timer > 120 then 
		if x > 2160 then speed = -60
	   	 end 
	    if x < 0 then speed = 60
	   	 end 
      end 
end 



	if timer > 80 then 
		a = 0 
		z = 255 
		c = 0
	end
	if love.keyboard.isDown("a") then
		y = y - 10
	end 

	if timer > 100 then
	 z= 0 a=0 c=0
	end

	if colidido(y, image_width*0.25 , x-t , t*2 , p , image_height*0.25 ,u-m , t*2 ) == true then
		colided = "sim"
	else
		colided = "nao"
	end

	gravidade()
	p = p + velociade_y

end
	function colidido(x1, width1, x2, width2, y1, height1, y2, height2)
	-- checa se está colidindo em x (horizontalmente)
	if ( (x1 <= x2 + width2) and (x1 >= x2) ) or ( (x2  <= x1 + width1) and (x2 >= x1) ) then 
		print("colidiu em x") 
		-- checa se está colidindo em y (verticalmente)
		if ( ( y1 <= y2 + height2) and (y1 >= y2) ) or ( (y2 <= y1 + height1) and (y2 >= y1) ) then 
			print("colidiu em x e y") 
			return true 
		end
	end

	-- caso não entre em ambos os ifs, retorna falso, ou seja, não está colidindo
	return false
end 
