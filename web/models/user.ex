defmodule OpenPantry.User do
  use OpenPantry.Web, :model

  schema "users" do
    field :email, :string
    field :name, :string
    field :phone, :string
    field :ok_to_text, :boolean, default: false
    field :family_members, :integer
    field :protein_credits, :integer
    field :carb_credits, :integer
    field :veggie_credits, :integer
    belongs_to :facility, OpenPantry.Facility
    has_many :foods, through: [:facility, :food]
    has_many :user_languages, OpenPantry.UserLanguage
    has_many :languages, through: [:user_languages, :language]
    belongs_to :primary_language, OpenPantry.Language

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:email, :name, :phone, :ok_to_text, :family_members, :protein_credits, :carb_credits, :veggie_credits, :primary_language_id, :facility_id])
    |> unique_constraint(:email)
    |> validate_required([:email, :name, :phone, :ok_to_text, :family_members, :protein_credits, :carb_credits, :veggie_credits, :primary_language_id, :facility_id])
  end
end
