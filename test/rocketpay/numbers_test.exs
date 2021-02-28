defmodule Rocketpay.NumbersTest do
  use ExUnit.Case

  alias Rocketpay.Numbers

  describe "sum_from_file/1" do
    test "It should be able to return the sum of numbers" do
      response = Numbers.sum_from_file("numbers")

      expect = {:ok, %{result: 37}}

      assert response == expect
    end

    test "It should not be able to return the sum of numbers" do
      response = Numbers.sum_from_file("NaN")

      expect = {:error, %{message: "Invalid file!"}}

      assert response == expect
    end
  end
end
