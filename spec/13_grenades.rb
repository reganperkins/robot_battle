require './spec_helper'

# Introduce the concept of a ranged weapon: Grenades!
# Weapons now generally have a default range of 1 but grenades have a range of 2

describe Grenade do
  before :each do
    @grenade = Grenade.new
  end

  it "should be a Weapon" do
    expect(@grenade).to be_a(Weapon)
  end

  it "should have the name Grenade" do
    expect(@grenade.name).to eq "Grenade"
  end

  it "should have a weight of 40" do
    expect(@grenade.weight).to eq 40
  end

  it "should deal 15 damage" do
    expect(@grenade.damage).to eq 15
  end

  it "should have a range of 2" do
    expect(@grenade.range).to eq 2
  end
end

describe Laser do

  it "Should have a range of 1" do
    laser = Laser.new
    expect(laser.range).to eq 1
  end
end

