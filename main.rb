# frozen_string_literal: true

require_relative 'vigenere_cipher'

def self.run
  cipher = VigenereCipher.new(key_from_user)

  case mode_from_user
  when '1'
    puts "Texto cifrado: #{cipher.encrypt(text_from_user)}"
  when '2'
    puts "Texto descifrado: #{cipher.decrypt(text_from_user)}"
  else
    puts 'Opción no válida.'
  end
end

private

# Metodo para obtener la clave del usuario
def self.key_from_user
  print 'Introduce la clave: '
  gets.chomp
end

# Metodo para obtener el modo (cifrar/descifrar) del usuario
def self.mode_from_user
  puts 'Elige una opción:'
  puts '1. Cifrar'
  puts '2. Descifrar'
  print 'Opción: '
  gets.chomp
end

# Metodo para obtener el texto del usuario
def self.text_from_user
  print 'Introduce el texto: '
  gets.chomp
end

run
