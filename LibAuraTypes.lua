--[================[
LibAuraTypes-1.0
Author: d87
Description: Provides aura classification and priority
--]================]


local MAJOR, MINOR = "LibAuraTypes", 1.0
local lib = LibStub:NewLibrary(MAJOR, MINOR)
if not lib then return end


local CROWD_CONTROL = "CROWD_CONTROL"
local STUN = "STUN"
local INCAP = "INCAP"
local FROZEN = "FROZEN"
local SILENCE = "SILENCE"
local ROOT = "ROOT"
local SLOW = "SLOW"
local SPEED_BOOST = "SPEED_BOOST"
local IMMUNITY = "IMMUNITY"
local DAMAGE_REDUCTION = "DAMAGE_REDUCTION"
local DAMAGE_ABSORB = "DAMAGE_ABSORB"
local DAMAGE_VULNERABILITY = "DAMAGE_VULNERABILITY"
local DAMAGE_INCREASE = "DAMAGE_INCREASE"
local DAMAGE_DECREASE = "DAMAGE_DECREASE"
local TRASH = "TRASH"
local EFFECT_IMMUNITY = "EFFECT_IMMUNITY"
local HEALING_REDUCTION = "HEALING_REDUCTION"
local ATTENTION = "ATTENTION"

lib.priority = lib.priority or {
    ATTENTION = 21,
    IMMUNITY = 20,
	EFFECT_IMMUNITY = 17,
	STUN = 15,
    CROWD_CONTROL = 14,
    INCAP = 13,
    FROZEN = 13,
    SILENCE = 10,
    ROOT = 9,

	SLOW = 8,
    DAMAGE_REDUCTION = 6,
    DAMAGE_ABSORB = 5.7,
    DAMAGE_VULNERABILITY = 5.5,

    DAMAGE_INCREASE = 6,
    DAMAGE_DECREASE = 5.5,

    SLOW = 3,
    SPEED_BOOST = 2.8,
    HEALING_REDUCTION = 2,
    TRASH = -1,
}
local priority = lib.priority
local data

lib.data = lib.data or {}
data = lib.data

local function A( id, opts )
	if type(id) == "table" then
		for i, spellID in ipairs(id) do
			data[spellID] = opts
		end
		if #id > 2 then
			opts.originalID = id[1]
		end
	else
		data[id] = opts
	end
end

-- RACIALS
A( 23230 ,{ type = HEALING_REDUCTION }) -- Blood Fury Debuff
A( 20594 ,{ type = EFFECT_IMMUNITY }) -- Stoneform, Immune to Bleed, Poison, and Disease.
A( 20549 ,{ type = STUN }) -- War Stomp
A( 7744 ,{ type = EFFECT_IMMUNITY }) -- Will of the Forsaken, Immune to Charm, Fear, and Sleep.
A({ 9035, 19281, 19282, 19283, 19284, 19285 }, { type = HEALING_REDUCTION }) -- Hex of Weakness



-- WARLOCK

A( 24259 ,{ type = SILENCE }) -- Spell Lock Silence
A( 6358, { type = CROWD_CONTROL }) -- Seduction
A({ 5782, 6213, 6215 }, { type = CROWD_CONTROL }) -- Fear
A({ 5484, 17928 }, { type = CROWD_CONTROL }) -- Howl of Terror
-- A({ 710, 18647 }, { name = "Banish"
A({ 6789, 17925, 17926 }, { type = CROWD_CONTROL }) -- Death Coil
A( 18223 ,{ type = SLOW }) -- Curse of Exhaustion
A( 18118 ,{ type = SLOW }) -- Aftermath (Destruction Talent)
A({ 1714, 11719 }, { type = DAMAGE_DECREASE }) -- Curse of Tongues
-- A({ 6229, 11739, 11740, 28610 } ,{ type = DAMAGE_ABSORB }) -- Shadow Ward
A({ 7812, 19438, 19440, 19441, 19442, 19443 } ,{ type = DAMAGE_ABSORB }) -- Sacrifice


-- SHAMAN

A({ 8056, 8058, 10472, 10473 }, { type = SLOW }) -- Frost Shock
A( 3600 ,{ type = SLOW }) -- Earthbind
A({ 8034, 8037, 10458, 16352, 16353  }, { type = SLOW }) -- Frostbrand Attack
-- Lightning shield??

-- PALADIN

A({ 1022, 5599, 10278 }, { type = IMMUNITY }) -- Blessing of Protection
A({ 498, 5573, 642, 1020 }, { type = IMMUNITY }) -- Divine Shield
A({ 853, 5588, 5589, 10308 }, { type = STUN }) -- Hammer of Justice
A( 1044 ,{ type = SPEED_BOOST }) -- Blessing of Freedom
A( 20066 ,{ type = INCAP }) -- Repentance
A( 20170 ,{ type = STUN }) -- Seal of Justice stun

-- HUNTER


A( 13159 ,{ type = SPEED_BOOST }) -- Aspect of the Pack
A( 5118 ,{ type = SPEED_BOOST }) -- Aspect of the Cheetah
A( 15571 ,{ type = SLOW }) -- Daze from Aspect of Cheetah/Pack
A({ 1513, 14326, 14327 }, { type = CROWD_CONTROL }) -- Scare Beast
A( 5116 ,{ type = SLOW }) -- Concussive Shot
A( 19410 ,{ type = STUN }) -- Concussive Shot Stun
A({ 1130, 14323, 14324, 14325 }, { type = DAMAGE_VULNERABILITY }) -- Hunter's Mark
A( 3045 ,{ type = DAMAGE_INCREASE }) -- Rapid Fire
-- A( 19574 ,{ type = DAMAGE_INCREASE }) -- Bestial Wrath
A( 19263 ,{ type = DAMAGE_REDUCTION }) -- Deterrence
A( 13810 ,{ type = SLOW }) -- Frost Trap Aura
A({ 3355, 14308, 14309 }, { type = FROZEN }) -- Freezing Trap
A({ 2974, 14267, 14268 }, { type = SLOW }) -- Wing Clip
A( 19229, { type = ROOT }) -- Wing Clip Root
A({ 19306, 20909, 20910 }, { type = ROOT }) -- Counterattack Root
A( 24394 ,{ type = STUN }) -- Intimidation

-- DRUID

A( 22812 ,{ type = DAMAGE_REDUCTION }) -- Barkskin
A({ 339, 1062, 5195, 5196, 9852, 9853 }, { type = ROOT })-- Entangling Roots
A({ 770, 778, 9749, 9907, 17390, 17391, 17392 }, { type = DAMAGE_VULNERABILITY }) -- Faerie Fire
A({ 2637, 18657, 18658 }, { type = CROWD_CONTROL })-- Hibernate
-- thorns?
-- innervate?
A({ 9005, 9823, 9827 }, { type = STUN }) -- Pounce Stun
A( 16922, { type = STUN }) -- Starfire Stun
-- A({ 5217, 6793, 9845, 9846 }, { type = DAMAGE_INCREASE })-- Tiger's Fury

-- MAGE

A( 18469 ,{ type = SILENCE }) -- Improved Counterspell
A({ 118, 12824, 12825, 12826, 28270, 28271, 28272 }, { type = CROWD_CONTROL }) -- Polymorph
A({ 11426, 13031, 13032, 13033 }, { type = DAMAGE_ABSORB }) -- Ice Barrier
-- Frost/Fire Ward?
A( 12355 ,{ type = STUN }) -- Impact
A( 22959 ,{ type = TRASH }) -- Fire Vulnerability
A({ 11113, 13018, 13019, 13020, 13021 }, { type = SLOW }) -- Blast Wave
A({ 120, 8492, 10159, 10160, 10161 }, { type = SLOW }) -- Cone of Cold
A({ 12484, 12485, 12486 }, { type = SLOW }) -- Improved Blizzard
A( 6136 , { type = SLOW }) -- Frost Armor Chill
A({ 116, 205, 837, 7322, 8406, 8407, 8408, 10179, 10180, 10181, 25304 }, { type = SLOW }) -- Frostbolt
A( 12494 ,{ type = FROZEN }) -- Frostbite
A({ 122, 865, 6131, 10230 }, { type = FROZEN }) -- Frost Nova
A( 12042 ,{ type = DAMAGE_INCREASE }) -- Arcane Power
A( 11958 ,{ type = IMMUNITY }) -- Ice Block
A( 12579 ,{ type = TRASH }) -- Winter's Chill
A({ 133, 143, 145, 3140, 8400, 8401, 8402, 10148, 10149, 10150, 10151, 25306 }, { type = TRASH }) -- Fireball dot
A({ 11366, 12505, 12522, 12523, 12524, 12525, 12526, 18809 }, { type = TRASH }) -- Pyroblast dot

-- PRIEST

A( 15487, { type = SILENCE }) -- Silence
A( 10060, { type = DAMAGE_INCREASE }) -- Power Infusion
A({ 17, 592, 600, 3747, 6065, 6066, 10898, 10899, 10900, 10901 }, { type = DAMAGE_ABSORB }) -- Power Word: Shield
A({ 8122, 8124, 10888, 10890 }, { type = CROWD_CONTROL }) -- Psychic Scream
A( 15269 ,{ type = STUN }) -- Blackout
A({ 15407, 17311, 17312, 17313, 17314, 18807 }, { type = SLOW }) -- Mind Flay
A( 15258 ,{ type = TRASH }) -- Shadow Vulnerability

-- ROGUE

A( 18425 ,{ type = SILENCE }) -- Improved Kick
A( 13750 ,{ type = DAMAGE_INCREASE }) -- Adrenaline Rush
A( 13877 ,{ type = DAMAGE_INCREASE }) -- Blade Flurry
A( 1833 , { type = STUN }) -- Cheap Shot
A({ 408, 8643 }, { type = STUN }) -- Kidney Shot
A({ 2070, 6770, 11297 }, { type = INCAP }) -- Sap
A( 2094 , { type = CROWD_CONTROL }) -- Blind
-- A({ 8647, 8649, 8650, 11197, 11198 }, { type = DAMAGE_VULNERABILITY }) -- Expose Armor
A({ 2983, 8696, 11305 }, { type = SPEED_BOOST }) -- Sprint
A( 5277 ,{ type = DAMAGE_REDUCTION }) -- Evasion
A({ 1776, 1777, 8629, 11285, 11286 }, { type = INCAP }) -- Gouge
A({ 3409, 11201 }, { type = SLOW }) -- Crippling Poison

-- WARRIOR

A( 18498 ,{ type = SILENCE }) -- Improved Shield Bash
A( 20230 ,{ type = IMMUNITY }) -- Retaliation
A( 1719 ,{ type = DAMAGE_INCREASE }) -- Recklessness
A( 871, { type = DAMAGE_REDUCTION }) -- Shield Wall
A( 12328, { type = DAMAGE_INCREASE }) -- Death Wish
A({ 1715, 7372, 7373 }, { type = SLOW }) -- Hamstring
A( 23694 , { type = ROOT }) -- Improved Hamstring
A( 12323, { type = SLOW }) -- Piercing Howl
-- Thunder Clap?
A( 18499, { type = IMMUNITY }) -- Berserker Rage
A({ 20253, 20614, 20615 }, { type = STUN }) -- Intercept Stun
A( 5246 ,{ type = CROWD_CONTROL }) -- Intimidating Shout
A( 676 ,{ type = DAMAGE_DECREASE }) -- Disarm
A( 12798 , { type = STUN }) -- Revenge Stun
A( 12809 ,{ type = STUN }) -- Concussion Blow
A({ 16488, 16490, 16491 }, { type = TRASH }) -- Blood Craze



function lib.GetDebuffInfo(spellID)
    if data[spellID] then
        local spellData = data[spellID]
        local spellType = spellData.type
        if spellData.originalID then spellID = spellData.originalID end
        local prio = priority[spellType]
        return spellID, spellType, prio
    end
end

function lib.GetDebuffTypePriority(dType)
    return priority[dType]
end