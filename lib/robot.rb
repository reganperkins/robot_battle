class Robot

  attr_accessor :position
  attr_accessor :items
  attr_accessor :health
  attr_accessor :equipped_weapon

  def initialize
    @position = [0, 0]
    @items = []
    @health = 100
  end

  def pick_up(item)
    false if item.weight + items_weight > 250
    item.feed(self) if item.is_a?(BoxOfBolts) && @health <= 80
    @items << item
    @equipped_weapon = item if item.is_a?(Weapon)
    true
  end

  def wound(amount)
    @health -= amount
    @health = 0 if @health < 0
  end

  def heal(amount)
    @health += amount
    @health = 100 if @health > 100
  end

  def in_range?(robot, max_range)
    # position[0] - robot.position[0]).abs <= max_range || (position[1] - robot.position[1]).abs <= max_range)

    x_in_range = (position[0] - robot.position[0]).abs <= max_range 
    y_in_range = (position[1] - robot.position[1]).abs <= max_range
        # puts (position[0] - robot.position[0])
        # puts (position[1] - robot.position[1])

    if x_in_range && y_in_range
      true
    else
      false
    end
  end

  def attack(robot)
    if @equipped_weapon.is_a?(Grenade) && in_range?(robot, 2)
      @equipped_weapon.hit(robot)
      @equipped_weapon = nil
    elsif in_range?(robot, 1)
      if @equipped_weapon
        @equipped_weapon.hit(robot)
      else
        robot.wound(5)
      end
    end
  end

  def items_weight
    @items.inject(0) {|sum, i| sum += i.weight }
  end

  def move_left
    @position[0] -= 1
  end

  def move_right
    @position[0] += 1
  end

  def move_up
    @position[1] += 1
  end

  def move_down
    @position[1] -= 1
  end

end