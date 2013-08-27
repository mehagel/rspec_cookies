require 'rspec'

require_relative 'cookie'

describe Cookie do

  let(:type)   { "peanut butter" }
  let(:cookie) { Cookie.new(type) }

  describe "#initialize" do
    context "with valid input" do
      it "creates a new Cookie of the specified type" do
        cookie.type.should eq(type)
      end
    end

    context "with invalid input" do
      it "throws an argument error when not given a type argument" do
        expect { Cookie.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe "#type" do
    it "returns the type of the cookie" do
      cookie.type.should eq 'peanut butter'
    end
  end

  describe "#bake!" do
    it "requires an integer time argument" do
      expect {cookie.bake!()}.to raise_error(ArgumentError)
    end

    it "returns the cookie object" do
      cookie.should eq cookie
    end

    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(7) }.to change(cookie, :status)
    end

    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(10) }.to change(cookie, :status)
    end

    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(12) }.to change(cookie, :status)
    end
s
    it "changes the status of the cookie when given enough time" do
      expect { cookie.bake!(13) }.to change(cookie, :status)
    end

  end


  describe "#status" do
    it "returns the cookie's current status" do
      cookie.status.should eq :doughy
    end

    context "when baked for less than 7 minutes" do
      (0..6).to_a.each do |time|
        it "returns doughy if time is #{time}" do
          cookie.bake!(time)
          cookie.status.should eq :doughy
        end
      end
    end

    context "when baked for at least 7 but less than 10 minutes" do
      (7..9).to_a.each do |time|
        it 'returns almost_ready if time is #{time}' do
        cookie.bake!(time)
        cookie.status.should eq :almost_ready
        end
      end
    end

    context "when baked for at least 7 but less than 10 minutes" do
      (7..9).to_a.sample do |time|
        it 'returns almost_ready if time is #{time}' do
        cookie.bake!(time)
        cookie.status.should eq :almost_ready
        end
      end
    end

    context "when baked for at least 7 but less than 10 minutes" do
        it 'returns almost_ready if time is between 7..9' do
        cookie.bake!(rand(7..9))
        cookie.status.should eq :almost_ready
      end
    end

    context "when baked for at least 10 but less than 12 minutes" do
        (10..11).to_a.each do |time|
      it 'returns ready if the time is #{time}' do
        cookie.bake!(time)
        cookie.status.should eq :ready
        end
      end
    end

    context "when baked for at least 12 minutes" do
      it "is `:burned`"
    end
  end
end
