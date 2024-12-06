defmodule Day1 do
  def compare_columns(file_path) do
    {left_list, right_list} =
      file_path
      |> File.stream!()
      |> Stream.map(&String.split/1)
      |> Stream.map(fn [left, right] -> {String.to_integer(left), String.to_integer(right)} end)
      |> Enum.unzip()

    result_1 = Enum.zip(
      Enum.sort(left_list),
      Enum.sort(right_list)
    )
    |> Enum.map(fn {left, right} -> abs(left - right) end)
    |> Enum.sum()

    IO.puts("difference score:  #{result_1}")

    frequencies = Enum.frequencies(right_list)

    result_2 = Enum.reduce(left_list, 0, fn number, acc -> acc + number * Map.get(frequencies, number, 0) end)

    IO.puts("simmilarity score: #{result_2}")
  end
end

Day1.compare_columns("./inputs/day1.txt")
