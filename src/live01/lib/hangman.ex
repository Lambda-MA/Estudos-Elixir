defmodule Game do
  defstruct answer: "", hints: nil, attempts: 0
end

defmodule Hangman do
  @moduledoc """
  Documentation for Hangman.
     User enters a word
     Another users has to guess the word
  """

  @doc """
  ...
  """
  def main do
    IO.puts "Bem vindo ao jogo de adivinhação"

    set_game_variables()
    |> game_loop() 
  end

  def set_game_variables() do
    IO.puts "Digite a resposta"
    answer = normalize_input()

    IO.puts "Digite as dicas"
    hints = get_hints()

    %Game{answer: answer, hints: hints, attempts: 1}
  end

  def normalize_input() do
    IO.gets(">")
    |> String.trim()
    |> String.downcase()
  end

  def get_hints(hints \\ []) do
    case normalize_input() do
      "" -> hints
      hint -> get_hints([hint | hints]) 
    end
  end

  def game_loop(%Game{answer: a, hints: h, attempts: k}) do
    IO.puts Enum.random h
    case normalize_input() do
      ^a -> :win
      _ -> game_loop(%Game{answer: a, hints: h, attempts: k+1})
    end
  end
end