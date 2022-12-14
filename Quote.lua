function Initialize()

   path = SKIN:GetVariable('CURRENTPATH')
   json = dofile(path..'dkjson.lua')
   html = dofile(path..'htmlEntities/src/htmlEntities.lua')
   
end -->Initialize

function Update()
   now = os.date('%H_%M.json')
   hour= os.date('%H/')
   file = io.open(path..'times/'..hour..now, "rb")

   if file then
      content = file:read "*a"
      file:close()
      info = json.decode(content)

      repeat
         rand = math.random(1, #info)
      until(info[rand]["sfw"] == "yes")
      
      quote_time_case = info[rand]["quote_time_case"]
      quote = info[rand]["quote_first"]..info[rand]["quote_time_case"]..info[rand]["quote_last"]
      author = info[rand]["title"]..", "..info[rand]["author"]
      
      quote = html.decode(quote)

   else
      quote_time_case = os.date('%H:%M')
      quote = quote_time_case
      author = ""
   end

   SKIN:Bang('!SetVariable', 'Time_Case', quote_time_case)
   SKIN:Bang('!SetOption', 'MeterQuote', 'Text', quote)
   SKIN:Bang('!SetOption', 'MeterAuthor', 'Text', author)
   
   return
   
end -->Update