require 'rspec'

require_relative '../orange_tree.rb'

describe OrangeTree do
  subject { described_class.new }

  it 'should respond to the required methods' do
    subject.should respond_to :one_year_passes
    subject.should respond_to :count_the_oranges
    subject.should respond_to :pick_an_orange
    subject.should respond_to :height
    subject.should respond_to :age
    subject.should respond_to :fruits
  end

  it 'should increase age when one_year_passes is called' do
    subject.age.should be 0
    expect { subject.one_year_passes }.to change(subject, :age).by 1
    expect { 5.times { subject.one_year_passes } }.to change(subject, :age).by 5
  end

  it 'should grow every year' do
    subject.height.should be 0
    expect { subject.one_year_passes }.to change(subject, :height).by 2
  end

  it 'should die after 10 years' do
    subject.should respond_to :alive?
    subject.alive?.should be_true
    expect { 10.times { subject.one_year_passes } }.to change(subject, :alive?).to false
  end

  it 'should start producing fruits after 3 years and count them' do
    subject.fruits.should be 0
    expect { subject.one_year_passes }.not_to change(subject, :fruits)
    expect { subject.one_year_passes }.not_to change(subject, :fruits)
    expect { subject.one_year_passes }.to change(subject, :fruits).by 9
    subject.count_the_oranges.should be 9
  end

  it 'should produce more fruit every year' do
    3.times { subject.one_year_passes }
    subject.count_the_oranges.should be 9
    subject.one_year_passes
    subject.count_the_oranges.should be 16
  end

  it 'should be able to give us juicy oranges' do
    3.times { subject.one_year_passes }
    expect { subject.pick_an_orange }.to change(subject, :fruits).by -1
    subject.pick_an_orange.should be_a String
    7.times { subject.pick_an_orange }
    subject.pick_an_orange.should be_eql 'No more juice! :('
  end

  it 'should not give fruits when it\'s dead' do
    10.times { subject.one_year_passes }
    subject.alive?.should be_false
    subject.pick_an_orange.should be_eql 'No more juice! :('
  end
end