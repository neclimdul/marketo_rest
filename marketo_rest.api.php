<?php
/**
 * @file
 * Hooks provided by Marketo REST.
 */

/**
 * @addtogroup hooks
 * @{
 */

/**
 * This hook is executed when a lead is added to the queue for submission.
 *
 * @param array $data
 *   An associative array containing lead data
 *   - email: The email address of this lead
 *   - data: An associative array containing marketo fields and their values
 *     - firstName
 *     - lastName
 *   - marketoCookie: NULL or the value of $_COOKIE['_mkto_trk']
 *
 * @see marketo_rest_add_lead()
 */
function hook_marketo_rest_lead_alter(&$data) {
  // Set or update the lead source for this lead.
  $data['data']['leadSource'] = 'Foo';
}

/**
 * This hook is executed for a specific FIELDNAME when a lead is added to the
 * queue for submission.
 *
 * FIELDNAME equates to valid Marketo field names such as:
 * - firstName
 * - lastName
 *
 * @param mixed $data
 *   The value of FIELDNAME
 *
 * @see marketo_rest_add_lead()
 */
function hook_marketo_rest_lead_FIELDNAME_alter(&$data) {
  // convert this specific field value to lowercase.
  $data = strtolower($data);
}

/**
 * @} End of "addtogroup hooks".
 */
