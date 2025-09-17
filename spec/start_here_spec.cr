require "./spec_helper"
require "./../src/start_here"

describe Guesser2 do
  # TODO: Write tests

  it "works" do
    puts Guesser2::StartHere.new
    true.should eq(true)
  end

  describe "when given a net with structure of [4, 2]" do
    structure = [6, 2]
    inputs = [1, 2, 3, 4, 5, 6]
    outputs = [7,8]
    expected_activation_nodes = [[1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0], [1.0, 1.0]]
    expected_weights_size = 1
    expected_weights_first_size = 7
    expected_weights_first_sub_size = 2
    net = Ai4cr2::NeuralNetwork::Backpropagation.new(structure).init_network

    it "sets @activation_nodes to expected nested array" do
      net.activation_nodes.should eq(expected_activation_nodes)
    end

    it "sets @weights to expected size" do
      net.weights.size.should eq(expected_weights_size)
    end

    it "sets @weights.first to expected size" do
      net.weights.first.size.should eq(expected_weights_first_size)
    end

    it "sets each sub-array w/in @weights.first to expected size" do
      net.weights.first.each do |weights_n|
        weights_n.size.should eq(expected_weights_first_sub_size)
      end
    end

    # TODO: uncomment and fix
    describe "#train" do
      it "returns a Float64" do
        result1 = result = net.train(inputs, outputs)
        i = 0
        while i < 1000
          puts i
          result2 = net.train(inputs, outputs)
          puts result2
          i += 1
        end
        puts "result1: " + result1.to_s
        puts "result2: " + result2.to_s
        result.should be_a(Float64)
      end

     it "updates the net" do
        net.train(inputs, outputs)
        net.activation_nodes.should_not eq(expected_activation_nodes)
      end
    end
  end
end
