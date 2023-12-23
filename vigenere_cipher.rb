# frozen_string_literal: true

# Clase para crear el cifrado
class VigenereCipher
  ALPHABET_SIZE = 27
  BASE = 'A'.ord

  # Inicializar con clave
  def initialize(key)
    @key = key.upcase
  end

  # Cifrar el texto dado
  def encrypt(text)
    process(text, :encrypt)
  end

  # Descifrar el texto dado
  def decrypt(text)
    process(text, :decrypt)
  end

  private

  # Metodo generico para cifrar o descifrar el texto
  def process(text, mode)
    key_index = 0
    text.upcase.chars.map do |char|
      if letter?(char)
        process_char(char, key_index, mode).tap { key_index = (key_index + 1) % @key.length }
      else
        char
      end
    end.join
  end

  # Metodo para procesar un caracter individual
  def process_char(char, key_index, mode)
    shift = shift_for_letter(@key[key_index])
    shift = -shift if mode == :decrypt
    shift_letter(char, shift)
  end

  # Desplazar la letra por el numero dado
  def shift_letter(letter, number)
    ((letter.ord - BASE + number) % ALPHABET_SIZE + BASE).chr
  end

  # Determinar el desplazamiento para una letra dada
  def shift_for_letter(letter)
    letter.ord - BASE
  end

  # Comprobar si un caracter es una letra
  def letter?(char)
    char >= 'A' && char <= 'Z'
  end
end
