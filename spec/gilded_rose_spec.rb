require File.join(File.dirname(__FILE__), '..', 'gilded_rose')

describe GildedRose do

  describe "#update_quality" do
    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "does not lower the quality below zero" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 0
    end

    it "lowers the quality by 2 when sell_in less than 0" do
      items = [Item.new("foo", 0, 20)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 18
    end

    it "increases the quality over time for aged brie" do
      items = [Item.new("Aged Brie", 5, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].quality).to eq 1
    end

  end

end
