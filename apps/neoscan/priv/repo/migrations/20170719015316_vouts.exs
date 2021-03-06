defmodule Neoscan.Repo.Migrations.Vouts do
  use Ecto.Migration

  def change do
    create table(:vouts) do
      add :asset, :string
      add :address_hash, :string
      add :n, :integer
      add :value, :float
      add :txid, :string

      add :query, :string

      add :transaction_id, references(:transactions, on_delete: :delete_all)
      add :address_id, references(:addresses, on_delete: :delete_all)

      timestamps()
    end


    create unique_index(:vouts, [:query])
    create index(:vouts, [:transaction_id])

  end
end
