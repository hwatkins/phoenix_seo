defmodule SEO.Facebook do
  @moduledoc """
  Facebook originally developed the OpenGraph standard, so much of social-sharing techniques
  are contained in `SEO.OpenGraph`, however there remains one Facebook-specific attribute: the `:app_id`.

  Resources:
  - https://developers.facebook.com/docs/sharing/webmaster
  """

  defstruct [:app_id]

  @type t :: %__MODULE__{
          app_id: String.t()
        }

  @doc """
  In order to use Facebook Insights you must add the `:app_id` to your page. Insights lets you view analytics for traffic
  to your site from Facebook. Find the app ID in your Facebook App Dashboard.
  """
  def build(attrs, default \\ nil)

  def build(attrs, default) do
    SEO.Utils.merge_defaults(__MODULE__, attrs, default)
  end

  use Phoenix.Component

  attr(:item, __MODULE__, required: true)

  def meta(assigns) do
    ~H"""
    <meta :if={@item.app_id} name="fb:app_id" content={@item.app_id} />
    """
  end
end
