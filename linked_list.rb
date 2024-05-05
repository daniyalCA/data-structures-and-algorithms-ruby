class LinkedList
  attr_accessor :head
  attr_reader :node_count

  def initialize
    @head = nil
    @node_count = 0
  end

  def append(value)
    new_node = Node.new(value)

    if @head
      tail = traverse
      tail.next = new_node
    else
      @head = new_node
    end
    @node_count += 1
  end

  def traverse(display_values: false)
    current_node = @head
    values = [current_node.value]

    while current_node.next
      current_node = current_node.next
      values.push(current_node.value)
    end

    return display_values ? values : current_node
  end

  def find(value)
    current_node = @head
    node_found = nil

    node_found = current_node if current_node.value == value

    while current_node.next
      current_node = current_node.next
      node_found = current_node if current_node.value == value
    end

    return node_found
  end

  def delete(value)
    node = find(value)
    node.value = node.next.value
    node.next = node.next.next
    @node_count -= 1
  end

  def reverse
    current_node = previous_node = @head

    while current_node.next
      next_node = current_node.next

      current_node.next = previous_node
      previous_node = current_node

      current_node = next_node
    end

    current_node.next = previous_node

    @head.next = nil # Set current head to nil
    @head = current_node # The last node of the linked list is now the new head
  end
end

class Node
  attr_accessor :next, :value

  def initialize(value)
    @value = value
    @next = nil
  end
end

linked_list = LinkedList.new

linked_list.append(10)
linked_list.append(2)
linked_list.append(7)
linked_list.append(5)

linked_list.delete(2)
puts "New node count after deletion: #{linked_list.node_count}"

linked_list.reverse
print "Reversed list: #{linked_list.traverse(display_values: true)}"
