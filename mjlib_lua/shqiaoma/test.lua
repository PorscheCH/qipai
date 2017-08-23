local mjlib = require "mjlib"
local utils = require "utils"
local tips_lib = require "tipslib"

function test_fail()
    local cards = {
        1,1,1,0,0,0,2,0,0,
        0,0,0,0,2,0,0,0,0,
        0,0,0,0,1,2,2,1,0,
        0,0,0,0,0,0,0
    }

    local result = true
    if mjlib._check_hu(cards) == result then
        print("test_fail 测试成功")
    else
        print("test_fail 测试失败")
    end
end

function test_success()
    local cards = {
        1,1,1,0,0,0,2,0,0,
        0,0,0,0,3,0,0,0,0,
        0,0,0,0,1,2,2,1,0,
        0,0,0,0,0,0,0
    }

    local result = true
    if mjlib.check_hu(cards) == result then
        print("test_success 测试成功")
    else
        print("test_success 测试失败")
    end
end

function test_time()
    local count = 100*10000
    local cards = {
        1,1,1,0,0,0,2,0,0,
        0,0,0,0,3,0,0,0,0,
        0,0,0,0,1,2,2,1,0,
        0,0,0,0,0,0,0
    }

    local start = os.time()
    for i=1,count do
        mjlib.check_normal(cards)
    end
    print("测试",count,"次,耗时",os.time()-start,"秒")
end

function test_tips_time(count)
    local cards = {
        0,0,0,1,3,1,1,1,0,
        0,0,0,0,3,1,1,1,0,
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0
    }

    local start = os.time()
    for i=1,count do
        local tips_cards = tips_lib.get_tips(cards)
    end
    print("测试",count,"次，耗时",os.time()-start,"秒")
end

function test_tips()
    local cards = {
        1,1,1,1,1,1,1,1,0,
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,3,2
    }

    local tips_cards = tips_lib.get_tips(cards)
    print("需要展示的牌")
    utils.print(tips_cards)
end

function test_tings()
    local cards = {
        0,0,0,0,0,0,0,0,0,
        1,2,1,0,0,0,3,3,3,
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0
    }
    local  tingcards = {}
    local ting_cards = tips_lib.get_ting_cards(cards)
    for k,v in pairs(ting_cards) do
        table.insert(tingcards,k)
    end
    print("需要听的牌")
    utils.print(tingcards)
    -- utils.print(mjlib.HU_TYPE)
end

function test_ting_type()
    -- this is a hu pai        need to check or not?
    -- handscards
    local cards_in_hand = {
        0,0,0,0,0,0,0,0,0,
        1,3,1,0,0,0,3,3,3,
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,
        0,0,0,0,0,0,0,0,0,0,0
    }
    --cards in library
    local cards_in_lib = {
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,0,0,0,0,0,
        0,0,0,0,
        0,3,2,0,0,0,0,0,0,0,0
    }
    local cards = {}
    for i,v in pairs(cards_in_hand) do
        cards[i]= cards_in_hand[i]+cards_in_lib[i]
    end
     local hu_types = tips_lib.get_hu_type(cards,cards_in_hand,cards_in_lib)
     print('===============hu_types==========================')
    utils.print(hu_types)
end
test_ting_type()

-- test_tips_time(10000)
