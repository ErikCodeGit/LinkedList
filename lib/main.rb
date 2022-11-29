require_relative 'linkedlist'

list = LinkedList.new

list.append('a')
list.append('b')
list.append('c')
list.prepend('d')

puts list