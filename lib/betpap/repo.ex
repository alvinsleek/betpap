defmodule Betpap.Repo do
  use Ecto.Repo,
    otp_app: :betpap,
    adapter: Ecto.Adapters.Postgres
end
