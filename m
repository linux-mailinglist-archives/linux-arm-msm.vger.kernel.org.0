Return-Path: <linux-arm-msm+bounces-110882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id RKUzBfdqH2ohlwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-110882-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 01:44:55 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E36632F80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 03 Jun 2026 01:44:54 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=intel.com header.s=Intel header.b=lSMMhcQg;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-110882-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 2600:3c09:e001:a7::12fc:5321 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-110882-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	dmarc=pass (policy=none) header.from=intel.com;
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 1D8EE302DC50
	for <lists+linux-arm-msm@lfdr.de>; Tue,  2 Jun 2026 23:44:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A57563815C2;
	Tue,  2 Jun 2026 23:44:50 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F74136A34E;
	Tue,  2 Jun 2026 23:44:48 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780443890; cv=none; b=TmmlryZ83hKKuSDm080t6hXQt334CpE+5/Km9Vv8LPn/E2w5RD4AJWu61yS9w9QbKLd/3H4cN6sqmxaS6uHfdKeYyhL9q+NPMKCXEKJY0x8+qygnSmLTUXlkkDUbZYdN5E+8bZ44S33DVyylJjwgfXOTEKSrejeXnjDKVK2khBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780443890; c=relaxed/simple;
	bh=SJyLOGb6M+e+IMMB0xOlTYjn4owis3x6hI5FqwMXsiw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CamU2cWwHqoGwHuJA+gUyRnXX9amuYvdS0QglVt3qpgHLPMXgR1Qbfxa0eOf4DK6hfH0JTdbopzqsic+TggOpLYOOE/fVLxSd7Re3fF1y+aZY/JdCHXMok0JKksfuY3Phq4d+ENsIAzk6E2tUsYqTIKsbqHRtBV62D/EEl/BQ6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lSMMhcQg; arc=none smtp.client-ip=192.198.163.16
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780443889; x=1811979889;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SJyLOGb6M+e+IMMB0xOlTYjn4owis3x6hI5FqwMXsiw=;
  b=lSMMhcQgLzNU8dEcxfw2KynvwWvmUeZeiJSgyYGr7EwBCC2w97srr31L
   X0rgf3Aw3aLW4Q+34LEFlGbyQndHAzQe0F9T386lfo5/Wun6pwJ0BsKsc
   fYvwj2dTPqz1kWFofswR2zK8aa9887wasuTGezRQ3l0exwCJe2jYFyAl+
   itYIVxE2JSEfA+Ejj3T+MHc2tj+6dgk6co4QRECVJp63myjtf1bOcwZTs
   U55n53/c4uitlbfC6Klbopy38rmhVsjfJ/pTzAPejRHPNaWxEFNrHpT+y
   I8Nq2uwiuLTbzJXZFb6qEXrL51MGOFgD0jh5elWbPeOGg7sfwx1TeL6Ae
   w==;
X-CSE-ConnectionGUID: YjDUoFyZQqGGmxBMK7JKRg==
X-CSE-MsgGUID: grwIN1cUShWrSyDEc9CK4A==
X-IronPort-AV: E=McAfee;i="6800,10657,11805"; a="68784593"
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="68784593"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:44:48 -0700
X-CSE-ConnectionGUID: ZZCjstl7QSmiYwPSErRUeA==
X-CSE-MsgGUID: 3YD4qJ0ZRo+HsPggyrC/PQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,184,1774335600"; 
   d="scan'208";a="248360229"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.244.116])
  by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2026 16:44:44 -0700
Date: Wed, 3 Jun 2026 02:44:40 +0300
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
Subject: Re: [PATCH v2 2/2] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Message-ID: <ah9q6JbkC5A9riO6@ashevche-desk.local>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
 <20260526-gen3_adc_tm-v2-2-702fbac919ac@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260526-gen3_adc_tm-v2-2-702fbac919ac@oss.qualcomm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-110882-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:jic23@kernel.org,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	RCPT_COUNT_TWELVE(0.00)[20];
	FREEMAIL_CC(0.00)[kernel.org,baylibre.com,analog.com,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[andriy.shevchenko@intel.com,linux-arm-msm@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vger.kernel.org:from_smtp,ashevche-desk.local:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,intel.com:from_mime,intel.com:dkim]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A3E36632F80

On Tue, May 26, 2026 at 04:26:10PM +0530, Jishnu Prakash wrote:
> Add support for ADC_TM part of PMIC5 Gen3.
> 
> This is an auxiliary driver under the Gen3 ADC driver, which implements the
> threshold setting and interrupt generating functionalities of QCOM ADC_TM
> drivers, used to support thermal trip points.

...

> +#include <linux/auxiliary_bus.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/container_of.h>
> +#include <linux/device/devres.h>
> +#include <linux/dev_printk.h>
> +#include <linux/err.h>
> +#include <linux/iio/adc/qcom-adc5-gen3-common.h>
> +#include <linux/interrupt.h>

> +#include <linux/kernel.h>

Why?!

> +#include <linux/module.h>
> +#include <linux/thermal.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>

...

> +/**
> + * struct adc_tm5_gen3_channel_props - ADC_TM channel structure
> + * @timer: time period of recurring TM measurement.
> + * @tm_chan_index: TM channel number used (ranging from 1-7).
> + * @sdam_index: SDAM on which this TM channel lies.
> + * @common_props: structure with common  ADC channel properties.
> + * @high_thr_en: TM high threshold crossing detection enabled.
> + * @low_thr_en: TM low threshold crossing detection enabled.
> + * @chip: ADC TM device.
> + * @tzd: pointer to thermal device corresponding to TM channel.
> + */
> +struct adc_tm5_gen3_channel_props {
> +	unsigned int timer;
> +	unsigned int tm_chan_index;
> +	unsigned int sdam_index;
> +	struct adc5_channel_common_prop common_props;
> +	bool high_thr_en;
> +	bool low_thr_en;
> +	struct adc_tm5_gen3_chip *chip;
> +	struct thermal_zone_device *tzd;

Wouldn't `pahole` suggest better layout?

> +};

...

> +struct adc_tm5_gen3_chip {
> +	struct adc5_device_data *dev_data;
> +	struct adc_tm5_gen3_channel_props *chan_props;
> +	unsigned int nchannels;
> +	struct device *dev;

Ditto. I would expect the nchannels to be the last. Also play with the position
of dev to see if bloat-o-meter will show the difference.

> +};

...

> +	return adc5_gen3_get_scaled_reading(adc_tm5->dev, &prop->common_props,
> +					    temp);

Make it a single line.

...

> +	/* Low temperature corresponds to high voltage threshold */
> +	prop->high_thr_en = (low_temp != -INT_MAX);

Can low_temp be INT_MIN at some point?

> +	if (prop->high_thr_en) {
> +		adc_code = qcom_adc_tm5_gen2_temp_res_scale(low_temp);
> +		put_unaligned_le16(adc_code, &buf[10]);
> +	}

...

> +static int adc_tm5_probe(struct auxiliary_device *aux_dev,
> +			 const struct auxiliary_device_id *id)
> +{
> +	struct adc_tm5_gen3_chip *adc_tm5;
> +	struct tm5_aux_dev_wrapper *aux_dev_wrapper;
> +	struct device *dev = &aux_dev->dev;
> +	int ret;
> +
> +	adc_tm5 = devm_kzalloc(dev, sizeof(*adc_tm5), GFP_KERNEL);
> +	if (!adc_tm5)
> +		return -ENOMEM;
> +
> +	aux_dev_wrapper = container_of(aux_dev, struct tm5_aux_dev_wrapper,
> +				       aux_dev);

One line is easier to read.

> +	adc_tm5->dev = dev;
> +	adc_tm5->dev_data = aux_dev_wrapper->dev_data;
> +	adc_tm5->nchannels = aux_dev_wrapper->n_tm_channels;
> +	adc_tm5->chan_props = devm_kcalloc(dev, aux_dev_wrapper->n_tm_channels,
> +					   sizeof(*adc_tm5->chan_props), GFP_KERNEL);
> +	if (!adc_tm5->chan_props)
> +		return -ENOMEM;
> +
> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
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
> +	/*
> +	 * First SDAM's interrupt is shared between main ADC driver
> +	 * and auxiliary TM driver, so its flags must include
> +	 * IRQF_SHARED. This is not needed for other SDAMs as they
> +	 * will be used only for TM functionality.
> +	 */

> +	ret = devm_request_threaded_irq(dev,
> +					adc_tm5->dev_data->base[0].irq,
> +					adctm5_gen3_isr, adctm5_gen3_isr_thread,
> +					IRQF_ONESHOT | IRQF_SHARED,
> +					adc_tm5->dev_data->base[0].irq_name,
> +					adc_tm5);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (int i = 1; i < adc_tm5->dev_data->num_sdams; i++) {
> +		ret = devm_request_threaded_irq(dev,
> +						adc_tm5->dev_data->base[i].irq,
> +						adctm5_gen3_isr, adctm5_gen3_isr_thread,
> +						IRQF_ONESHOT, adc_tm5->dev_data->base[i].irq_name,
> +						adc_tm5);
> +		if (ret < 0)
> +			return ret;
> +	}

Can't it be combined by using temporary irq_flags variable

	/* ...the fat comment... */
	irq_flags = ...
	for (int i = 0; ...) {
		...
		irq_flags = ...
	}

?

> +	return adc_tm5_register_tzd(adc_tm5);
> +}

...

> +static const struct auxiliary_device_id adctm5_auxiliary_id_table[] = {
> +	{ .name = "qcom_spmi_adc5_gen3.adc5_tm_gen3", },

Inner comma is redundant.

> +	{ }
> +};

> +

Unneeded blank line.

> +MODULE_DEVICE_TABLE(auxiliary, adctm5_auxiliary_id_table);
> +
> +static struct auxiliary_driver adctm5gen3_auxiliary_driver = {
> +	.id_table = adctm5_auxiliary_id_table,
> +	.probe = adc_tm5_probe,
> +};

> +

Ditto.

> +module_auxiliary_driver(adctm5gen3_auxiliary_driver);

-- 
With Best Regards,
Andy Shevchenko



