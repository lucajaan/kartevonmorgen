(require "chai").should()

describe "view reducer", ->

  V  = require "../../src/reducers/view"
  PV = require "../../src/constants/PanelView"
  AT = require "../../src/constants/ActionTypes"

  it "should be a function", ->
    V.should.be.a "function"

  describe "right", ->
    it "is a key in view store", ->
      V().should.have.ownProperty "right"

    it "should change to IMPRINT view after action SHOW_IMPRINT", ->
      V({},{type:AT.SHOW_IMPRINT}).right.should.equal PV.IMPRINT

  describe "left", ->
    it "should change to RESULT view after action SEARCH_RESULT", ->
      V({},{type:AT.SEARCH_RESULT}).left.should.equal PV.RESULT

    it "should not be changed after action SEARCH_RESULT if it exists", ->
      V({left:"foo"},{type:AT.SEARCH_RESULT}).left.should.equal "foo"

  describe "the menu", ->

    it "should be active in the initial state", ->
      V().menu.should.equal true

    it "visibility can be toggled", ->
      state1 = V(V(), type:AT.TOGGLE_MENU)
      state1.menu.should.equal false

      state2 = V(state1, type:AT.TOGGLE_MENU)
      state2.menu.should.equal true

    it "cannot be opend if a modal dialog is open", ->

      state = V({modal: PV.LOCATE, menu: no}, type:AT.TOGGLE_MENU)
      state.menu.should.equal false
