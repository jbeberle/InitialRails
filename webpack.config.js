const path    = require("path")
const webpack = require("webpack")
const { environment } = require('@rails/webpacker')

module.exports = {
  mode: "production",
  devtool: "source-map",
  entry: {
    application: "./app/javascript/application.js"
  },
  output: {
    filename: "[name].js",
    sourceMapFilename: "[file].map",
    path: path.resolve(__dirname, "app/assets/builds"),
  },
  plugins: [
    new webpack.optimize.LimitChunkCountPlugin({
      maxChunks: 1
    })
  ]
}

environment.plugins.append("Provide", new webpack.ProvidePlugin({

  $: 'jquery',

  jQuery: 'jquery',

  Popper: ['popper.js', 'default']

}))

module.exports = environment

