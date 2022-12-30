local module = {}

function module.decrypt(msg,code)

	local nstr = ''
	local ncode = ''

	for _,v in pairs( string.split(code,'') ) do
		ncode = ncode.. string.byte(v)
	end



	for i,v in pairs( string.split(msg,'\\') ) do

		pcall(function()



			v -= math.cos( tonumber(string.sub(ncode,4,4) )/ncode^.5 )
			v /= math.sin( tonumber(string.sub(ncode,1,1) )/ncode^.5 )*(tonumber(string.sub(ncode,2,2) )/2)
			v = math.round(tonumber(v)/i)

			nstr = nstr.. string.char(v)
		end)

	end

	return(nstr)

end

return module

