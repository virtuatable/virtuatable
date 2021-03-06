RSpec.describe Virtuatable::Enhancers::Base do
  let!(:category) {
    Arkaan::Permissions::Category.new(slug: 'category')
  }
  let!(:group) {
    Arkaan::Permissions::Group.new(slug: 'test_group')
  }
  let!(:right) {
    Arkaan::Permissions::Right.new(slug: 'right', groups: [group], category: category)
  }
  let!(:account) {
    Arkaan::Account.new(
      username: 'Babausse',
      email: 'test@enhancers.com',
      lastname: 'Courtois',
      groups: [group]
    )
  }
  let!(:application) {
    Arkaan::OAuth::Application.new(name: 'Test app', key: 'test_app_key', creator: account)
  }
  let!(:enhancer) {
    ::Enhancers::Account.new(account)
  }
  describe :enhanced do
    it 'Correctly returns the enhanced class' do
      expect(::Enhancers::Account.enhanced).to eq Arkaan::Account
    end
  end
  describe :enhancer do
    it 'Correctly returns the enhancer class' do
      expect(Arkaan::Account.enhancer).to eq ::Enhancers::Account
    end
  end

  describe :methods do
    it 'Returns the correct value for an enhanced method' do
      expect(enhancer.username).to eq 'Babausse'
    end
    it 'Returns the correct value for a not enhanced method' do
      expect(enhancer.lastname).to eq 'Sir Courtois'
    end
  end

  describe :enhance do
    it 'Creates a decorator correctly' do
      expect(account.enhance).to be_a_kind_of(::Enhancers::Account)
    end
    it 'Creates a decorator with the correct inner object' do
      expect(account.enhance.id).to eq account.id
    end
  end

  describe 'not existing method' do
    it 'Should raise an error when the method does not exist' do
      expect(->{ enhancer.not_existing_method }).to raise_error(NoMethodError)
    end
  end

  describe :respond_to? do
    it 'Returns TRUE if the method exists on the decorated object' do
      expect(enhancer.respond_to?(:username)).to be true
    end
    it 'Returns FALSE if the method does not exist ont he decorated object' do
      expect(enhancer.respond_to?(:not_existing_method)).to be false
    end
  end

  describe :associations do
    it 'returns a decorated collection if available' do
      expect(enhancer.groups.first).to be_a_kind_of(Enhancers::Group)
    end
    it 'returns the original documents wrapped if not enhanced' do
      expect(enhancer.applications.first.object).to be_a_kind_of(Arkaan::OAuth::Application)
    end
    it 'returns an undecorated belongs_to element wrapped in a base enhancer' do
      expect(Virtuatable::Enhancers::Base.new(right).category).to be_a_kind_of(Virtuatable::Enhancers::Base)
    end
  end
end