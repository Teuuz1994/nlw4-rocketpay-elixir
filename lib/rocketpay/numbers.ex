defmodule Rocketpay.Numbers do
  # Essa barra reta e sinal de maior, é um pip operator.
  # pip operator serve para injetar (e passar como argumento)
  # o primeiro parâmetro a função.
  # neste caso a função File.read() na verdade recebe File.read("#{filename}.csv")
  # e assim por diante.
  def sum_from_file(filename) do
    "#{filename}.csv"
    |> File.read()
    |> handle_file()
  end

  # o móduto Stream guarda todos os métodos de dentro do móduto Enum
  # entretanto, o módulo Stram é um operador "preguiçoso" onde conseguimos
  # encapsular várias operações dentro dos métodos do Enum e por final
  # retornar somente um valor absoluto mas calculado e processado de maneira inteligente
  # reduzindo o uso de memória, aumentando a performance e garantindo que a execução
  # do código seja feita apenas uma única vez.
  defp handle_file({:ok, result}) do
    result =
      result
      |> String.split(",")
      |> Stream.map(fn number -> String.to_integer(number) end)
      |> Enum.sum()

    {:ok, %{result: result}}
  end

  defp handle_file({:error, _reason}), do: {:error, %{message: "Invalid file!"}}
end
