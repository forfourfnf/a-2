-- variables
local lesgo = false
local okaythen = false

-- pre-written functions
function arrowDefault(id) -- Thanks BMV277~!!
	_G['defaultStrum'..id..'X'] = getActorX(id)
end

function EnemyTurn() -- Thanks BMV277~!!
    for i=0,3 do
	tweenFadeIn(i,1,0.5)
	tweenPos(i, _G['defaultStrum'..i..'X'] + 375,getActorY(i),0.5)
    end
    for i = 4, 7 do
	tweenFadeIn(i,0,0.5)
    end
end

function ProtagTurn() -- Thanks BMV277~!!
    for i=0,3 do
	tweenFadeIn(i,0,0.5)
	tweenPos(i, _G['defaultStrum'..i..'X'] - 275,getActorY(i),0.5)
    end
    for i = 4, 7 do
	tweenFadeIn(i,1,0.5)
	tweenPos(i, _G['defaultStrum'..i..'X'] - 275,getActorY(i),0.5)
    end
end

function Regular() -- Thanks BMV277~!!
    for i=0,7 do
		tweenFadeIn(i,1,0.5)
		tweenPos(i, _G['defaultStrum'..i..'X'],getActorY(i),0.5)
    end
end

-----------------------------------------------------------------------------------------------------

function start(song)

end

function update(elapsed)

---------------------------------------------------------------------
	local currentBeat = (songPos / 1000)*(bpm/30)
	local currentBeat2 = (songPos / 1000)+(bpm/40)
	local valuezoom = math.sin(currentBeat2 * math.pi) /5.75
---------------------------------------------------------------------
	if lesgo then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 30 * math.sin((currentBeat + i*0.120) * math.pi), i)
			setActorY(_G['defaultStrum'..i..'Y'] - 5 * math.cos((currentBeat - i*0.20) * math.pi), i)
		end
	end
---------------------------------------------------------------------
	if okaythen then
		for i=0,7 do
			setActorX(_G['defaultStrum'..i..'X'] + 5 * math.sin((currentBeat - i*5)) - 5, i)
			setActorY(_G['defaultStrum'..i..'Y'] - 5 * math.cos((currentBeat + i*5)) + 5, i)
		end
	end
---------------------------------------------------------------------
	if curStep >= 8 and curStep < 12 then
		tweenCameraZoom(1,(crochet * 4) / 1000)
	end
---------------------------------------------------------------------
	if curStep >= 136 and curStep < 139 then
		tweenCameraZoom(1,(crochet * 4) / 1000)
	end
---------------------------------------------------------------------
	if curStep >= 144 and curStep < 567 then
		lesgo = true
	end
---------------------------------------------------------------------
	if curStep >= 567 and curStep < 568 then
		lesgo = false
		Regular()
	end
---------------------------------------------------------------------
	if curStep >= 575 and curStep < 622 then
		for i=0,7 do
            tweenFadeOut(i,0,0.5)
        end
	end
---------------------------------------------------------------------
	if curStep >= 622 and curStep < 933 then
		for i=0,7 do
            tweenFadeOut(i,1,0.5)
        end
		setHudZoom(valuezoom + 1)
		setCamZoom(1 - valuezoom)
		okaythen = true
	end
---------------------------------------------------------------------
	if curStep >= 933 and curStep < 934 then
		okaythen = false
		Regular()
	end
---------------------------------------------------------------------

end

function beatHit(beat)

end

function stepHit(step)

end

function playerTwoTurn()

end

function playerOneTurn()

end

function keyPressed(key)

end

function songStart()

end