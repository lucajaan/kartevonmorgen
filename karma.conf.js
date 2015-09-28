module.exports = function(config) {

  config.set({

    frameworks: ['mocha', 'chai'],

    files: [ 'spec/**/*.spec.coffee' ],

    preprocessors: { '**/*.spec.coffee': ['webpack'] },

    reporters: ['mocha'],

    colors: true,

    logLevel: config.LOG_INFO,

    autoWatch: false,

    browsers: ['PhantomJS'],

    singleRun: true,

    webpack: {
      debug: true,
      module: {
        loaders: [
          { test: /\.coffee$/, loader: 'coffee' }
        ]
      },
      resolve: {
        extensions: ['', '.json', '.js', '.coffee']
      }
    },
    webpackServer: {
      noInfo: true
    }
  })
}