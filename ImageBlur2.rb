class Image
  attr_accessor :data

  def initialize data = []
    @data = data
  end

  def output_image
    @data.each do |row|
      row.each do |pixel|
        print pixel
      end
      puts
    end
  end

  def blur
    locations = []
    @data.each_with_index do |row, row_index|
      row.each_with_index do |pixel, pixel_index|
        locations.push([row_index, pixel_index]) if pixel == 1
      end
    end

    locations.each do |location|
      row_index = location.first
      pixel_index = location.last

      @data[row_index-1][pixel_index] = 1 if row_index != 0
      @data[row_index+1][location.last] = 1 if row_index != @data.length - 1 
      @data[row_index][pixel_index-1] = 1 if pixel_index != 0
      @data[row_index][pixel_index+1] = 1 if pixel_index != @data[row_index].length - 1
    end

    output_image()
  end
end

image = Image.new([
  [0, 0, 0, 0],
  [0, 1, 0, 0],
  [0, 0, 0, 1],
  [0, 0, 0, 0]
])
image.output_image