defmodule Betpap.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      BetpapWeb.Telemetry,
      # Start the Ecto repository
      Betpap.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Betpap.PubSub},
      # Start Finch
      {Finch, name: Betpap.Finch},
      # Start the Endpoint (http/https)
      BetpapWeb.Endpoint
      # Start a worker by calling: Betpap.Worker.start_link(arg)
      # {Betpap.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Betpap.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BetpapWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
