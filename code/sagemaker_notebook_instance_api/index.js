'use strict'

// var async = require('async');
// var aws = require('aws-sdk');

exports.handler = function(event, context, callback) {
    console.log('Received event:');
    console.log(JSON.stringify(event, null, '  '));
};