defmodule Docster.Template do
  def create(template, fields) do
    keys = Map.keys(fields)
    key = Enum.at(keys, 0)
    value = extract_value(fields, key)

    content = String.replace(read(template), "{#{parse_string(key)}}",value)

    {:ok, content}
  end

  def parse_string(key) do
    key |> to_string()
  end

  def extract_value(fields, key) do
    Map.get(fields, key)
  end

  def read(template_name) do
    file_path = "lib/templates/" <> template_name

    try do
      File.read!(file_path)
    rescue
      File.Error ->
        {:error, "Erro ao ler o arquivo: #{file_path}"}
    end
  end
end
