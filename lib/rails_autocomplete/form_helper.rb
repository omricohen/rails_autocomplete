
class ActionView::Helpers::FormBuilder
  include ActionView::Helpers::FormTagHelper
  include ActionView::Helpers::TagHelper
  
  def autocomplete_field name, path
    hash = Digest::MD5.hexdigest(name.to_s)
    output = text_field_tag("#{name}_autocomplete", nil, {  "class" => "rails-autocomplete", "data-autocomplete-parent" => hash, "data-autocomplete-url" => path, "data-provide" => "typeahead", "data-source" => "rails_autocomplete", "autocomplete" => "off" }).html_safe
    output << self.hidden_field(name, { "data-autocomplete-child" => hash }).html_safe
    output
  end
end
