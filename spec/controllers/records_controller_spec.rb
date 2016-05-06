require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
  describe 'GET #index' do
    let(:record){ FactoryGirl.create(:record) }

    before :each do
      get :index
    end

    it 'return response success' do
      expect(response).to be_success
    end

    it 'assigns records to @records' do
      expect(assigns(:records)).to eq([record])
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      let(:record){ FactoryGirl.attributes_for(:record) }

      it 'creates new record' do
        expect{
          post :create, record: record
        }.to change(Record, :count).by(1)
      end
    end

    context 'with invalid attributes' do
      let(:record){ FactoryGirl.attributes_for(:record, title: nil) }

      it 'does not save the record' do
        expect {
          post :create, record: record
        }.not_to change(Record, :count)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid attributes' do
      let(:record){ FactoryGirl.create(:record) }

      before :each do
        put :update, id: record, record: FactoryGirl.attributes_for(:record, title: 'Spec')
      end

      it 'assigns record to @record' do
        expect(assigns(:record)).to eq(record)
      end

      it 'changes record attributes' do
        record.reload
        expect(record.title).to eq('Spec')
      end
    end

    context 'with invalid attributes' do
      let(:record){ FactoryGirl.create(:record) }

      before :each do
        put :update, id: record, record: FactoryGirl.attributes_for(:record, title: nil)
      end

      it 'assigns record to @record' do
        expect(assigns(:record)).to eq(record)
      end

      it 'does not change record attributes' do
        record.reload
        expect(record.title).to eq('Record')
      end
    end
  end

  describe 'DELETE #destroy' do
    before :each do
      @record = FactoryGirl.create(:record)
    end

    it 'assigns record to @record' do
      delete :destroy, id: @record
      expect(assigns(:record)).to eq(@record)
    end

    it 'deletes record' do
      expect {
        delete :destroy, id: @record
      }.to change(Record, :count).by(-1)
    end
  end
end