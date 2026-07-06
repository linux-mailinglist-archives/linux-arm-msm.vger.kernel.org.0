Return-Path: <linux-arm-msm+bounces-116632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id LS10CkNES2quOQEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116632-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:59:31 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id B7CC970CBDF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 07:59:30 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=EZp7HPp5;
	dmarc=pass (policy=none) header.from=intel.com;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116632-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 172.234.253.10 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116632-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 281B23007E02
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jul 2026 05:59:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA643BED4F;
	Mon,  6 Jul 2026 05:59:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 372902E7631;
	Mon,  6 Jul 2026 05:59:22 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783317564; cv=none; b=I/20MfwkboRSzdBWKKTCYZ10BTUHk7f9rJheRDtHdItVt4Kd0k1e4UQeL9vVHhudS0KZBQUDqSG4oHI+n/pEDnqTqxeByda1TVXCfFXz/6MxQ6xCi3bnat+NNRpRBkpqmp5rUCatArqZpK1ku1fjzQRhTUG+PkYKEq5gOAzEwPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783317564; c=relaxed/simple;
	bh=VCK3AizRugSu62r9dimVzR94LhLsA7CaBGRE0bcO65M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RC/BhawO1k8ckpzVfBx59J4R5LZwLZP/Yid9BvjBKxh9jzmyy+jWbMWyj+nmA32MzTTKnlNWmy/L/6uoDXX3WbAabmaOn7gts25K5Z/Z/Dj9x6h4dvj+5XjL4htRXTqStWOU64QdYP8GLEEfq+JWdvC7npMdktWiLDygtjUK8wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EZp7HPp5; arc=none smtp.client-ip=198.175.65.21
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783317562; x=1814853562;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=VCK3AizRugSu62r9dimVzR94LhLsA7CaBGRE0bcO65M=;
  b=EZp7HPp5Ruf+/OhggBXzaYGLRT4YTinr5CODn9PYUYvtLkVUIKKmBSPa
   bKPtja1h17yr1iXrUusvOkMcJQKcrU6atOb9jtNhyg7/rMl65Xd8LjL8d
   nSF+GTBB6pooX4eFDqKXPQbK5L9npOWCnjJ1atTQE08n30BjkRd7s6+Ym
   XRH4n4dDZVki2IaOwNetSo3ODn/r9AQFsWKe2S9hZYszI3sle6XSuXVLV
   t/MS3rgZIem2vE6mhNBvti1VrPMEsFWQ1PfpH4vYxlhw2uoHgOSolCGdc
   QTn6/+4GsuGIGveSQox8x8h8yzRrgbMJet0vcI5KMSX1iw3LCUICxgs7l
   A==;
X-CSE-ConnectionGUID: kdaKtcnyRmORhDLT3VWKsA==
X-CSE-MsgGUID: sMF31VJSShiFjSQ1tB2U4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="83804015"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="83804015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:59:21 -0700
X-CSE-ConnectionGUID: OwP68szTQhqCzKsMTcZenw==
X-CSE-MsgGUID: GRElBvZLS7m71mJSRBI0Gg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="283705761"
Received: from vpanait-mobl.ger.corp.intel.com (HELO localhost) ([10.245.244.48])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2026 22:59:17 -0700
Date: Mon, 6 Jul 2026 08:59:14 +0300
From: Andy Shevchenko <andriy.shevchenko@intel.com>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>, Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
	David Collins <david.collins@oss.qualcomm.com>,
	Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v3 3/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Message-ID: <aktEMg55d6J_omaN@ashevche-desk.local>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
 <20260705-gen3_adc_tm-v3-3-ac62f387dbce@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705-gen3_adc_tm-v3-3-ac62f387dbce@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.66 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[intel.com:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[20];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-116632-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	HAS_ORG_HEADER(0.00)[];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MISSING_XM_UA(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,vger.kernel.org:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: B7CC970CBDF

On Sun, Jul 05, 2026 at 10:23:35PM +0530, Jishnu Prakash wrote:
> Add support for ADC_TM part of PMIC5 Gen3.
> 
> This is an auxiliary driver under the Gen3 ADC driver, which implements the
> threshold setting and interrupt generating functionalities of QCOM ADC_TM
> drivers, used to support thermal trip points.

...

> +DEFINE_GUARD(adc5_gen3, struct adc_tm5_gen3_chip *, adc5_gen3_mutex_lock(_T->dev),
> +	     adc5_gen3_mutex_unlock(_T->dev))

Logical split is slightly better.

DEFINE_GUARD(adc5_gen3, struct adc_tm5_gen3_chip *,
	     adc5_gen3_mutex_lock(_T->dev), adc5_gen3_mutex_unlock(_T->dev))


...

> +static int adc5_gen3_tm_status_check(struct adc_tm5_gen3_chip *adc_tm5,
> +				     int sdam_index, u8 tm_status[at_least 2])

This function uses exact size of the submitted tm_status. Instead of creating a
complications to the compiler with all these new fancy attributes, just pass the
sizeof in an additional argument.

> +{
> +	int ret;
> +
> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
> +			     tm_status, 2);
> +	if (ret)
> +		return ret;
> +
> +	return adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS_CLR,
> +				     tm_status, 2);
> +}
> +
> +static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
> +{
> +	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
> +	u8 tm_status[2] = { };

^^^^ The only case for the above function.

Also why do you need to nullify it? If it's an error condition, the compiler
should be clever enough to see this. It's not that complicated code.

> +	int sdam_index;
> +
> +	sdam_index = get_sdam_from_irq(adc_tm5, irq);
> +	if (sdam_index < 0)
> +		return IRQ_NONE;
> +
> +	scoped_guard(adc5_gen3, adc_tm5) {

> +		int ret = adc5_gen3_tm_status_check(adc_tm5, sdam_index,
> +						    tm_status);
> +		if (ret)
> +			return IRQ_NONE;

This is harder to maintain, the encouraged pattern is

		int ret;

		ret = ...
		if (ret)
			...

> +	}
> +
> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
> +		struct adc_tm5_gen3_channel_props *chan_prop = &adc_tm5->chan_props[i];
> +		int offset = chan_prop->tm_chan_index;
> +		bool upper_set, lower_set;
> +
> +		if (chan_prop->sdam_index != sdam_index)
> +			continue;
> +
> +		upper_set = ((tm_status[0] & BIT(offset)) && chan_prop->high_thr_en);
> +		lower_set = ((tm_status[1] & BIT(offset)) && chan_prop->low_thr_en);
> +
> +		if (!(upper_set || lower_set))
> +			continue;
> +
> +		thermal_zone_device_update(chan_prop->tzd, THERMAL_TRIP_VIOLATED);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

...

> +static int adc_tm5_gen3_disable_channel(struct adc_tm5_gen3_channel_props *prop)
> +{
> +	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
> +	int ret;
> +	u8 val;

> +	prop->high_thr_en = false;
> +	prop->low_thr_en = false;
> +
> +	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
> +	if (ret)
> +		return ret;
> +
> +	val = BIT(prop->tm_chan_index);
> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
> +			      ADC5_GEN3_TM_HIGH_STS_CLR, &val, sizeof(val));

sizeof(val) which is a single byte makes a little sense, but I'm not insisting
on the modifications.

> +	if (ret)
> +		return ret;
> +
> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
> +			      ADC5_GEN3_TM_LOW_STS_CLR, &val, sizeof(val));
> +	if (ret)
> +		return ret;
> +
> +	val = MEAS_INT_DISABLE;
> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
> +			      ADC5_GEN3_TIMER_SEL, &val, sizeof(val));
> +	if (ret)
> +		return ret;
> +
> +	/* To indicate there is an actual conversion request */
> +	val = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
> +			      ADC5_GEN3_PERPH_CH, &val, sizeof(val));
> +	if (ret)
> +		return ret;
> +
> +	val = ADC5_GEN3_CONV_REQ_REQ;
> +	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
> +			       ADC5_GEN3_CONV_REQ, &val, sizeof(val));
> +}

...

> +static int adc_tm5_gen3_configure(struct adc_tm5_gen3_channel_props *prop,
> +				  int low_temp, int high_temp)
> +{
> +	struct adc_tm5_gen3_chip *adc_tm5 = prop->chip;
> +	u8 buf[ADC_TM5_GEN3_CONFIG_REGS];
> +	u8 conv_req;
> +	u16 adc_code;
> +	int ret;
> +
> +	ret = adc5_gen3_poll_wait_hs(adc_tm5->dev_data, prop->sdam_index);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = adc5_gen3_read(adc_tm5->dev_data, prop->sdam_index,
> +			     ADC5_GEN3_SID, buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Write SID */
> +	buf[0] = FIELD_PREP(ADC5_GEN3_SID_MASK, prop->common_props.sid);
> +
> +	/* Select TM channel and indicate there is an actual conversion request */
> +	buf[1] = ADC5_GEN3_CHAN_CONV_REQ | prop->tm_chan_index;
> +
> +	buf[2] = prop->timer;
> +
> +	/* Digital param selection */
> +	adc5_gen3_update_dig_param(&prop->common_props, &buf[3]);
> +
> +	/* Update fast average sample value */
> +	buf[4] = FIELD_PREP(ADC5_GEN3_FAST_AVG_CTL_SAMPLES_MASK,
> +			    prop->common_props.avg_samples) | ADC5_GEN3_FAST_AVG_CTL_EN;
> +
> +	/* Select ADC channel */
> +	buf[5] = prop->common_props.channel;
> +
> +	/* Select HW settle delay for channel */
> +	buf[6] = FIELD_PREP(ADC5_GEN3_HW_SETTLE_DELAY_MASK,
> +			    prop->common_props.hw_settle_time_us);
> +
> +	/* High temperature corresponds to low voltage threshold */
> +	prop->low_thr_en = (high_temp != INT_MAX);
> +	if (prop->low_thr_en) {
> +		adc_code = qcom_adc_tm5_gen2_temp_res_scale(high_temp);
> +		put_unaligned_le16(adc_code, &buf[8]);
> +	}
> +
> +	/* Low temperature corresponds to high voltage threshold */
> +	prop->high_thr_en = (low_temp != -INT_MAX);
> +	if (prop->high_thr_en) {
> +		adc_code = qcom_adc_tm5_gen2_temp_res_scale(low_temp);
> +		put_unaligned_le16(adc_code, &buf[10]);
> +	}

> +	buf[7] = 0;

In this case this line is better to put after buf[6] assignment.

> +	if (prop->high_thr_en)
> +		buf[7] |= ADC5_GEN3_HIGH_THR_INT_EN;
> +	if (prop->low_thr_en)
> +		buf[7] |= ADC5_GEN3_LOW_THR_INT_EN;

And move these to the respective conditionals to deduplicate the checks.

> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index, ADC5_GEN3_SID,
> +			      buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	conv_req = ADC5_GEN3_CONV_REQ_REQ;
> +	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
> +			       ADC5_GEN3_CONV_REQ, &conv_req, sizeof(conv_req));
> +}

...

> +static int adc_tm5_register_tzd(struct adc_tm5_gen3_chip *adc_tm5)
> +{
> +	struct thermal_zone_device *tzd;
> +	unsigned int channel;
> +	int ret;
> +
> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
> +		channel = ADC5_GEN3_V_CHAN(adc_tm5->chan_props[i].common_props);
> +		tzd = devm_thermal_of_zone_register(adc_tm5->dev, channel,
> +						    &adc_tm5->chan_props[i],
> +						    &adc_tm_ops);
> +		if (IS_ERR(tzd)) {
> +			if (PTR_ERR(tzd) == -ENODEV) {
> +				dev_info(adc_tm5->dev,
> +					 "thermal sensor on channel %d is not used\n",
> +					 channel);
> +				continue;
> +			}
> +			return dev_err_probe(adc_tm5->dev, PTR_ERR(tzd),
> +					     "Error registering TZ zone:%ld for channel:%d\n",
> +					     PTR_ERR(tzd), channel);

Drop dup error code printing.

> +		}
> +		adc_tm5->chan_props[i].tzd = tzd;
> +		ret = devm_thermal_add_hwmon_sysfs(adc_tm5->dev, tzd);
> +		if (ret)
> +			return ret;
> +	}

+ Blank line here.

> +	return 0;
> +}

...

> +static void adc5_gen3_disable(void *data)
> +{
> +	struct adc_tm5_gen3_chip *adc_tm5 = data;
> +
> +	guard(adc5_gen3)(adc_tm5);

+ Blank line here.

> +	/* Disable all available TM channels */
> +	for (int i = 0; i < adc_tm5->nchannels; i++)
> +		adc_tm5_gen3_disable_channel(&adc_tm5->chan_props[i]);
> +}

...

> +static int adc_tm5_probe(struct auxiliary_device *aux_dev,
> +			 const struct auxiliary_device_id *id)
> +{
> +	struct adc_tm5_gen3_chip *adc_tm5;
> +	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
> +	struct device *dev = &aux_dev->dev;
> +	u32 irq_flags;
> +	int ret;
> +
> +	adc_tm5 = devm_kzalloc(dev, sizeof(*adc_tm5), GFP_KERNEL);
> +	if (!adc_tm5)
> +		return -ENOMEM;
> +
> +	aux_dev_wrapper = container_of(aux_dev, struct tm5_aux_dev_wrapper, aux_dev);
> +
> +	adc_tm5->dev = dev;
> +	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
> +	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
> +	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
> +					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
> +	if (!adc_tm5->chan_props)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < adc_tm5->nchannels; i++) {

Add a temporary variable for i+1 and explain in the comment on top of it why
this off-by-one is required and what is its meaning.

> +		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
> +		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
> +		adc_tm5->chan_props[i].sdam_index = (i + 1) / 8;
> +		adc_tm5->chan_props[i].tm_chan_index = (i + 1) % 8;
> +		adc_tm5->chan_props[i].chip = adc_tm5;
> +	}
> +
> +	/* This is to disable all ADC_TM channels in case of probe failure. */
> +	ret = devm_add_action(dev, adc5_gen3_disable, adc_tm5);
> +	if (ret)
> +		return ret;
> +
> +	ret = adc_tm5_register_tzd(adc_tm5);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * First SDAM's interrupt is shared between main ADC driver
> +	 * and auxiliary TM driver, so its flags must include
> +	 * IRQF_SHARED. This is not needed for other SDAMs as they
> +	 * will be used only for TM functionality.
> +	 */
> +	irq_flags = IRQF_ONESHOT | IRQF_SHARED;
> +	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
> +		ret = devm_request_threaded_irq(dev,
> +						adc_tm5->dev_data->base[i].irq,
> +						adctm5_gen3_isr, adctm5_gen3_isr_thread,
> +						irq_flags, adc_tm5->dev_data->base[i].irq_name,
> +						adc_tm5);
> +		if (ret < 0)
> +			return ret;

+ blank line.

> +		irq_flags = IRQF_ONESHOT;
> +	}
> +
> +	return 0;
> +}

-- 
With Best Regards,
Andy Shevchenko



