defmodule ListFilter do
  def call(list) do
    filter(list)
  end

  defp filter(list) do
    list
    |> Enum.map(&convert_numbers/1)
    |> Enum.filter(fn number -> number !== nil and rem(number, 2) == 1 end)
  end

  defp convert_numbers(number) do
    number
    |> Integer.parse()
    |> evaluate_numbers()
  end

  defp evaluate_numbers({number, _param}), do: number

  defp evaluate_numbers(:error), do: nil
end
