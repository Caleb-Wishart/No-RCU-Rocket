local rrec = data.raw.recipe["rocket-part"]

-- Add processing units to rocket part recipe
table.insert(rrec.ingredients, {type="item", name="processing-unit", amount=10})

-- Remove rocket control units from rocket part recipe
for i = #rrec.ingredients, 1, -1 do
  if rrec.ingredients[i] then
    for _, value in pairs(rrec.ingredients[i]) do
      if value == "rocket-control-unit" then
        table.remove(rrec.ingredients, i)
      end
    end
  end
end

-- Remove rocket control units from rocket silo technology requirements

local stech = data.raw.technology["rocket-silo"]

for i = #stech.prerequisites, 1, -1 do
  if stech.prerequisites[i] == "rocket-control-unit" then
    table.remove(stech.prerequisites, i)
  end
end

