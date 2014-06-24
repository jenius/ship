path = require('path')

describe 'api', ->

  describe 'constructor', ->

    it 'should construct a new ship instance', ->
      (=> new Ship(root: __dirname, deployer: 's3')).should.not.throw()

    it 'should error if passed an invalid deployer', ->
      (=> new Ship(root: __dirname, deployer: 'wow'))
        .should.throw('wow is not a valid deployer')

    it 'should error if passed a nonexistant path to deploy', ->
      (=> new Ship(root: 'wow', deployer: 's3')).should.throw()

  describe 'is_configured', ->

    it 'should not be configured if no @config or shipfile', ->
      project = new Ship(root: __dirname, deployer: 's3')
      project.is_configured().should.be.false

    it 'should be configured if @config is defined', ->
      project = new Ship(root: __dirname, deployer: 's3')
      project.config = {}
      project.is_configured().should.be.true

    it 'should be condigured if a shipfile is present at root', ->
      dir = path.join(_path, 'commands/one_deployer')
      project = new Ship(root: dir, deployer: 's3')
      project.is_configured().should.be.true

  describe 'configure', ->
    it 'should correctly configure a deployer with passed in data'
    it 'should error if passed in data does not match requirements'

  describe 'config_prompt', ->
    it 'should prompt the user to enter config info via command line'
    it 'should set the resulting info to @config'

  describe 'write_config', ->
    it 'should write a shipfile with the config info to the project root'
    it 'should error if instance has not been configured'

  describe 'deploy', ->
    it 'should load in root/shipfile.conf as config if present'
    it 'should error if not configured and no shipfile present'
    it "should error if shipfile keys don't match the deployer's"
