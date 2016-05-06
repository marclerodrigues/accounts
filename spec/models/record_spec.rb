require 'rails_helper'

RSpec.describe Record, type: :model do
  it { is_expected.to validate_presence_of(:title) }
  it { is_expected.to validate_presence_of(:date) }
  it { is_expected.to validate_presence_of(:amount) }

  context 'is valid' do
    it 'has a valid factory' do
      expect(FactoryGirl.build(:record)).to be_valid
    end
  end
end