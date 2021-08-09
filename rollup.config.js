import node_resolve from 'rollup-plugin-node-resolve';

export default {
  input: './lib/es6/src/main.js',
  output: {
    format: 'iife',
    file: './release/main-bundled.js',
    name: 'main'
  },
  plugins: [
    node_resolve({ module: true, browser: true })
  ]
};
