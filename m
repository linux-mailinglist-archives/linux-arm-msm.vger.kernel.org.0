Return-Path: <linux-arm-msm+bounces-116617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id tbD4LBXuSmprJwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-116617-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 01:51:49 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [104.64.211.4])
	by mail.lfdr.de (Postfix) with ESMTPS id A716C70BC5E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Jul 2026 01:51:48 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=kernel.org header.s=k20260515 header.b=RZJ5WKh4;
	dmarc=pass (policy=quarantine) header.from=kernel.org;
	spf=pass (mail.lfdr.de: domain of "linux-arm-msm+bounces-116617-lists+linux-arm-msm=lfdr.de@vger.kernel.org" designates 104.64.211.4 as permitted sender) smtp.mailfrom="linux-arm-msm+bounces-116617-lists+linux-arm-msm=lfdr.de@vger.kernel.org";
	arc=pass ("subspace.kernel.org:s=arc-20240116:i=1")
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id 92B473004D10
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Jul 2026 23:51:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1336366051;
	Sun,  5 Jul 2026 23:51:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B7878F2B;
	Sun,  5 Jul 2026 23:51:41 +0000 (UTC)
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783295502; cv=none; b=tMgdZeq8iyNvXrJ+drfC3S50ULqBVN5b/Mj+GcZGB1Fhe1bf9YtM+mUvzCjwRpwDvZ6IIkLqU89lOiYQXLYAATaTqNWMUGllzpRa3dDiSLEoOqXSabPv3sgurMABNRENHI5KiRqsRhmS4XPhWGnXeA47G7LPH7ZZU1/XhejmsQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783295502; c=relaxed/simple;
	bh=pkA9rgbv+reXRlNiKyAV/3TvRD4imyajTyhrBYIatCU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Mkh6hIA5i0u7XvgTZyAJZQihtz7Lrue+zMMmmM2U3UPtlcgTFpfhJZ36/M5bBIhHAkNLWfPLWO4u/4a3ns6Vj3nGwYaDjsGd8ods2Xe1tZ7uxyYFBGZLPjM/0vym4+JtAFhRMJiUVPaVp6OV1+u8f9+4iqgjruYO6r8qFbAUj5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RZJ5WKh4; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C8A51F000E9;
	Sun,  5 Jul 2026 23:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783295501;
	bh=5uNO4hsAEMnlm47dNGQ7c9+leAi03kI10l4h2ojGpFo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=RZJ5WKh4+jBfEau7BW4jCefi0rf4oxQ6JnxrCrZkvSaOS8T1qWZYAYrdxKOZd42rN
	 dmcqBYYkfsN9IKZKMLz1OliFNKRznre/sMI8ORyiC7RALKgrWqjE7YLE8KkeGMbeWP
	 HeBkcBrfdyS4Gg6l2pf2y/2Ct+zFWhRUCgv89yEXjj8LNKy7Ax5vT6cNAHwWR79dSP
	 4czPTC8CIM5i0CVfivfoUz08HquNgmGTcL+oEoHQAY89uTdNg+FeKuhSPLJ2cMIaIY
	 Or2sMqO2nGz/Y4IalxP/EWjzsW8RttsCjsc4TGoxBJx80DrxPvvQRSEXf6+nBaee1Z
	 IQUVzf4bLZShQ==
Date: Mon, 6 Jul 2026 00:51:34 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Cc: David Lechner <dlechner@baylibre.com>, Nuno =?UTF-8?B?U8Oh?=
 <nuno.sa@analog.com>, Andy Shevchenko <andy@kernel.org>, Amit Kucheria
 <amitk@kernel.org>, Thara Gopinath <thara.gopinath@gmail.com>, "Rafael J.
 Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
 linux-arm-msm@vger.kernel.org, linux-iio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, Kamal Wadhwa
 <kamal.wadhwa@oss.qualcomm.com>, David Collins
 <david.collins@oss.qualcomm.com>, Anjelique Melendez
 <anjelique.melendez@oss.qualcomm.com>, Neil Armstrong
 <neil.armstrong@linaro.org>, Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: Re: [PATCH v3 3/3] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Message-ID: <20260706005134.7add6bbe@jic23-huawei>
In-Reply-To: <20260705-gen3_adc_tm-v3-3-ac62f387dbce@oss.qualcomm.com>
References: <20260705-gen3_adc_tm-v3-0-ac62f387dbce@oss.qualcomm.com>
	<20260705-gen3_adc_tm-v3-3-ac62f387dbce@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.16 / 15.00];
	WHITELIST_SPF_DKIM(-3.00)[kernel.org:d:+,kernel.org:s:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	R_SPF_ALLOW(-0.20)[+ip4:104.64.211.4:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-116617-lists,linux-arm-msm=lfdr.de];
	FORWARDED(0.00)[lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS(0.00)[m:jishnu.prakash@oss.qualcomm.com,m:dlechner@baylibre.com,m:nuno.sa@analog.com,m:andy@kernel.org,m:amitk@kernel.org,m:thara.gopinath@gmail.com,m:rafael@kernel.org,m:daniel.lezcano@kernel.org,m:rui.zhang@intel.com,m:lukasz.luba@arm.com,m:linux-arm-msm@vger.kernel.org,m:linux-iio@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-pm@vger.kernel.org,m:kamal.wadhwa@oss.qualcomm.com,m:david.collins@oss.qualcomm.com,m:anjelique.melendez@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:stephan.gerhold@linaro.org,m:tharagopinath@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	ALIAS_RESOLVED(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:104.64.192.0/19, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,vger.kernel.org:from_smtp,jic23-huawei:mid,sin.lore.kernel.org:helo,sin.lore.kernel.org:rdns]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: A716C70BC5E

On Sun, 05 Jul 2026 22:23:35 +0530
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> Add support for ADC_TM part of PMIC5 Gen3.
> 
> This is an auxiliary driver under the Gen3 ADC driver, which implements the
> threshold setting and interrupt generating functionalities of QCOM ADC_TM
> drivers, used to support thermal trip points.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Hi Jishnu,

I took a quick look at this. A few really minor suggestions inline.

> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> new file mode 100644
> index 000000000000..5a82c4d8a37e
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c


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

That seems noisy.  Maybe dev_dbg() appropriate if this is an expected
board dependent condition?

> +					 channel);
> +				continue;
> +			}
> +			return dev_err_probe(adc_tm5->dev, PTR_ERR(tzd),
> +					     "Error registering TZ zone:%ld for channel:%d\n",
> +					     PTR_ERR(tzd), channel);
> +		}
> +		adc_tm5->chan_props[i].tzd = tzd;
> +		ret = devm_thermal_add_hwmon_sysfs(adc_tm5->dev, tzd);
> +		if (ret)
> +			return ret;
> +	}
> +	return 0;
> +}


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
> +		adc_tm5->chan_props[i].common_props = aux_dev_wrapper->tm_props[i];
> +		adc_tm5->chan_props[i].timer = MEAS_INT_1S;
> +		adc_tm5->chan_props[i].sdam_index = (i + 1) / 8;
> +		adc_tm5->chan_props[i].tm_chan_index = (i + 1) % 8;
> +		adc_tm5->chan_props[i].chip = adc_tm5;
> +	}
> +
> +	/* This is to disable all ADC_TM channels in case of probe failure. */

Perhaps indicate who turned them on?  On from reset or something hidden
somewhere else?

> +	ret = devm_add_action(dev, adc5_gen3_disable, adc_tm5);
> +	if (ret)
> +		return ret;

...

> +	/*
> +	 * First SDAM's interrupt is shared between main ADC driver
> +	 * and auxiliary TM driver, so its flags must include
> +	 * IRQF_SHARED. This is not needed for other SDAMs as they
> +	 * will be used only for TM functionality.

If indent of this doesn't change, rewrap to 80 chars.

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
> +		irq_flags = IRQF_ONESHOT;
Whilst this code works, I'd be tempted to make it less ordering dependent.  E.g.
	for (int i = 0; i < adc_tm5->dev_data->num_sdams; i++) {
		u32 irq_flags = IRQF_ONESHOT;

		/*
		 * First SDAM's interrupt is shared between main ADC driver
		 * and auxiliary TM driver, so its flags must include
		 * IRQF_SHARED. This is not needed for other SDAMs as they
		 * will be used only for TM functionality.
		 */
		if (i == 0)
			irq_flags |= IRQF_SHARED;

		ret = devm_request_threaded_irq(dev,
> +						adc_tm5->dev_data->base[i].irq,
> +						adctm5_gen3_isr, adctm5_gen3_isr_thread,
> +						irq_flags, adc_tm5->dev_data->base[i].irq_name,
> +						adc_tm5);
> +	}
> +
> +	return 0;
> +}



