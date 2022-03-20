clamp = function(v, a, b)
	if v>=a and v<=b    then return v
	elseif v%(b-a+1)==0 then return b-a+1
	else		         return v%(b-a+1)
	end
end

boundx = function(x, w)
	if x < 0 then 	  return w-1
	elseif x>w-1 then return 0
	else 		  return x
	end
end

boundy = function(y, h)
	if y < 0 then 	  return h-1
	elseif y>h-1 then return 0
	else		  return y
	end
end
