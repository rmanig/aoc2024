defmodule Day01 do

  def parse(path) do
    {_, file} = File.read(path)
    values = String.split(file)
             |> Enum.map(fn x -> String.to_integer(x) end)
    {Enum.slice(values, 0..-1//2) |> Enum.sort(), Enum.slice(values, 1..-1//2) |> Enum.sort()}
  end

  def part_one({left, right}) do
    Enum.zip([left, right])
    |> Enum.map(fn { a,b } -> Kernel.abs(a - b) end)
    |> Enum.reduce(0, fn x, acc -> x + acc end)
  end

  def part_two({left, right}) do
    frequencies = right |> Enum.frequencies_by(& &1)
    left |> Enum.map(fn a -> a * Map.get(frequencies, a, 0) end)
    |> Enum.sum()
  end

end

input = Day01.parse("input.txt")
IO.puts("part one: #{Day01.part_one(input)}")
IO.puts("part two: #{Day01.part_two(input)}")