--神の進化
--Divine Evolution
--updated by Larry126
function c513000065.initial_effect(c)
	aux.CallToken(421)
	--Activate
	local e1=Effect.CreateEffect(c)
	e1:SetType(EFFECT_TYPE_ACTIVATE)
	e1:SetCode(EVENT_FREE_CHAIN)
	e1:SetProperty(EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_IGNORE_IMMUNE)
	e1:SetTarget(c513000065.target)
	e1:SetOperation(c513000065.activate)
	c:RegisterEffect(e1)
end
function c513000065.filter(c)
	return c:IsFaceup() and c:GetFlagEffect(513000065)>0 and c:GetFlagEffect(5130000650)==0
end
function c513000065.target(e,tp,eg,ep,ev,re,r,rp,chk)
	if chk==0 then return Duel.IsExistingMatchingCard(c513000065.filter,tp,LOCATION_MZONE,0,1,nil) end
end
function c513000065.activate(e,tp,eg,ep,ev,re,r,rp)
	local c=e:GetHandler()
	local g=Duel.GetMatchingGroup(c513000065.filter,tp,LOCATION_MZONE,0,nil)
	for tc in aux.Next(g) do
		local hr=tc:GetFlagEffectLabel(513000065)+1
		tc:ResetFlagEffect(513000065)
		tc:RegisterFlagEffect(513000065,RESET_EVENT+0x1fe0000,0,1,hr)
		--Atk/Def up
		local e1=Effect.CreateEffect(c)
		e1:SetDescription(aux.Stringid(4010,7))
		e1:SetType(EFFECT_TYPE_SINGLE)
		e1:SetCode(EFFECT_UPDATE_ATTACK)
		e1:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_IGNORE_IMMUNE+EFFECT_FLAG_CLIENT_HINT)
		e1:SetValue(1000)
		e1:SetReset(RESET_EVENT+0x1fe0000)
		tc:RegisterEffect(e1)
		local e2=e1:Clone()
		e2:SetCode(EFFECT_UPDATE_DEFENSE)
		tc:RegisterEffect(e2)
		local code1,code2=tc:GetOriginalCodeRule()
		if code1==10000000 or code2==10000000 then
			--change name
			local e3=Effect.CreateEffect(c)
			e3:SetType(EFFECT_TYPE_SINGLE)
			e3:SetProperty(EFFECT_FLAG_UNCOPYABLE+EFFECT_FLAG_CANNOT_DISABLE+EFFECT_FLAG_IGNORE_IMMUNE)
			e3:SetCode(EFFECT_CHANGE_CODE)
			e3:SetValue(511600030)
			tc:RegisterEffect(e3)
		end
		tc:RegisterFlagEffect(5130000650,RESET_EVENT+0x1fe0000,0,1)
	end
end