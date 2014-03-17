# A List class that should be implemented as
# a doubly linked list.  Also, it is important
# to keep track of a head and tail pointer
# for this lab.

# The following methods are the most important
# to implement and should be done first:

# new, push, pop, and length

# The following methods are nice to have and should
# be implemented next:

# [], []=, insert, shift, unshift, first, last

# The following methods are bonus and should only be tackled
# after the previous methods are implemented:

# reverse, max, min, reduce, each, flatten
require "./node"

class List
  attr_reader :length
  attr_accessor :head, :tail

  def initialize
    @head = nil
    @tail = nil
    @length = 0
  end

  # Adds a new value to the end of the list.
  def push(value)
    node = Node.new(value)
    if @head.nil?
      @head = node
      @tail = node
    else
      node.previous = @tail
      @tail.next = node
      @tail = node
    end
    @length += 1
    return self
  end

  # Returns the value that is popped off
  # or nil if none exists
  def pop
    if @tail.nil?
      return nil
    elsif @tail == @head
      node = @tail
      @head = nil
      @tail = nil
      @length -= 1
      return node.value
    else
      @length -= 1
      node = @tail
      @tail = node.previous
      @tail.next = nil
      return node.value
    end
  end

  def insert(index, value)
    count = 0
    node = @head
    while count < index - 1
      node = node.next
      count += 1
    end
    @length += 1
    new_node = Node.new(value)
    new_node.next = node.next
    new_node.previous = node
    node.next = new_node

  end

  # Given an index, returns the value at that index
  def [](index)
    count = 0
    node = @head
    while count < index
      node = node.next
      count += 1
    end

    return nil if node.nil?
    return node.value
  end

  # Sets a value at the given index.  Returns the value that
  # was assigned
  def []=(index, value)
    count = 0
    node = @head
    while count < index
      node = node.next
      count += 1
    end

    return nil if node.nil?
    return node.value = value
  end

  # Returns the first value that was removed from the list and
  # shifts all items down by 1
  def shift
    if @head == @tail && @length == 1
      node = @head
      @head = @tail = nil
      @length -= 1
      return node.value
    elsif @length > 1
      @length -= 1
      node = @head
      @head = node.next
      @head.previous = nil
      return node.value
    else
      return nil
    end
  end

  # Adds a new value to the front of the list
  def unshift(value)
    node = Node.new(value)
    if @head.nil?
      @head = @tail = node
    else
      old_head = @head
      @head = node
      @head.next = old_head
      old_head.previous = @head
    end
    @length += 1
  end

  def first
    return @head.value unless @head.nil?
  end

  def last
    return @tail.value unless @tail.nil?
  end
end
