# frozen_string_literal: true

# svg / https://www.notion.so/highereducation/svg-e18426a1b2214849b8a2a14990aea88d
# Takes the `path` of the svg and outputs/sanitizes it's content and embeds the svg within the designated area on the page.
# {% svg path:"/assets/img/logo.svg" %}

require 'nokogiri'
require 'open-uri'

module Jekyll
  class SVG < Liquid::Tag
    include Liquid::StandardFilters

    # Initialize
    def initialize(tag_name, markup, tokens)
      @markup   = markup
      @tag_name = tag_name
      super
    end

    # Get SVG
    def getSVG(variables)
      # Return if no path
      return '{svg: Path property is empty.}' if variables['path'].nil? || variables['path'].empty?

      # Set Height equal to Width if non-existant
      variables['height'] = variables['width'] if variables.key?('width') && !variables.key?('height')

      # Site Source Path
      if variables['path'].start_with? 'http'
        svg_doc = Nokogiri::XML(open(variables['path']))
      else
        svg_file = Jekyll.sanitized_path(variables['site']['source'], variables['path'])
        svg_doc = Nokogiri::XML(File.open(svg_file))
      end

      # Add/Replace Variables
      variables.each do |key, val|
        next if %w[site page layout].include? key

        svg_doc.root.set_attribute(key, val)
      end

      # Return
      svg_doc.to_html
    end

    # Render
    def render(context)
      getSVG(get_properties(context, @tag, @markup))
    end
  end
end

Liquid::Template.register_tag('svg', Jekyll::SVG)
