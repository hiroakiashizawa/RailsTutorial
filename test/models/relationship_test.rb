require 'test_helper'

class RelationshipTest < ActiveSupport::TestCase

  def setup
    @relationship = Relationship.new(follower_id: users(:michael).id,
                                     followed_id: users(:archer).id )
  end

  test "Should be valid" do
    assert @relationship.valid?
  end

  test "Should require a follower_id" do
    @relationship.follower_id = nil
    assert_not @relationship.valid?
  end

  test "Should require a followed_id" do
    @relationship.followed_id = nil
    assert_not @relationship.valid?
  end
end
