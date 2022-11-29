require_relative 'node'

class LinkedList
  def initialize
    @head = Node.new
  end

  def append(value)
    if @head.value.nil?
      @head = Node.new(value)
    else
      tail.next_node = Node.new(value)
    end
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size

    current_node = @head
    size = 0
    until current_node.nil?
      size += 1
      current_node = current_node.next_node
    end
    size
  end

  def tail
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.nil?
    current_node
  end

  attr_reader :head

  def at(index)
    current_node = @head
    idx = 0
    until idx == index
      current_node = current_node.next_node
      idx += 1
    end
    current_node
  end

  def pop
    current_node = @head
    current_node = current_node.next_node until current_node.next_node.next_node.nil?
    popped_node = current_node.next_node
    current_node.next_node = nil
    popped_node
  end

  def contains?(value)
    current_node = @head
    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end
    false
  end

  def find(value)
    current_node = @head
    until current_node.nil?
      return current_node if current_node.value == value

      current_node = current_node.next_node
    end
  end

  def to_s
    string = ''
    current_node = @head
    until current_node.nil?
      string << "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end
    string << 'nil'
  end
end
