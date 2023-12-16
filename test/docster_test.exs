defmodule DocsterTest do
  use ExUnit.Case
  doctest Docster

  test "greets the world" do
    assert Docster.hello() == :world
  end
end
