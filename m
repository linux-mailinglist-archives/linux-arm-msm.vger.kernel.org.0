Return-Path: <linux-arm-msm+bounces-109992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mBT+MbrYFmpGtQcAu9opvQ
	(envelope-from <linux-arm-msm+bounces-109992-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:42:50 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C785E381C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 13:42:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 32A443007B86
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2026 11:42:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AE233FD133;
	Wed, 27 May 2026 11:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lnL6nAz5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35CC3F9A16;
	Wed, 27 May 2026 11:42:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779882154; cv=none; b=VxLpuboz/az4zNryhCknX+vn7L0yzn8qIcrN6+vSiyqO7rFzTmmfUdKv+S0jV5/0MOaO7NNkHgEPbZhwTfnwpe/UMSo034bSqnKHSBnw1H1canvCxvOiBTCT0ohN2+tj++YBPse2etkKwl/B/u8BP+p/sn93/1vMlZunGIDHHoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779882154; c=relaxed/simple;
	bh=Pl1W3C6LWmU1OBFC9XXxUOhxLJ/WN9Q2R65ikdvYTW4=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N1UA32txAFtCWIBn7rHscTzWgORtHk/qZorhhm/fDp5s0+UeiTF1cP7MNxN9v0b2x9Vt2FMIFDpQD+7OXGc9qaDjc+mPOwrUStqnsb2ebdE0ewNnPztGG8YrsZCDjiLJYiOJOZ/4zxPw39rzx8338oMI06eb1lhvpFUbcUYKPMM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lnL6nAz5; arc=none smtp.client-ip=100.103.45.18
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 077DE1F000E9;
	Wed, 27 May 2026 11:42:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779882151;
	bh=OgVR1UNONM87p+GBWRXQmF2y0KVSlQRAr9kJag3SzFs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=lnL6nAz5srqMTgvyg9ydgo1mEGu+x9TGxjbngZSvsj5CocWbflcHFuIvy4p/LAc3u
	 IYxPzgTcmrw6DvzqhMqWACvE2MS+aZPSZPvOjmdCE1BmIeaUl4dflG0KE2zUtbA7WJ
	 nRLkjm/VXpurl173tgMlWEv0Ebb7kyyFh5kMtMYw5K+RyLCxQ/f14UwIKIGmSngXIC
	 9iNZ+XH77ZVOZ2ULg5tWKhtgrTbFXYzH6IWU6NIVc78N8BakKdqHNQa2d75lGfw8Yk
	 D0C7rV2kp7wnBkSuVjv5JqR0KYCVzquDqdLcd06YZbm4bYFoB7NICGTLuBg3MKUYf6
	 Lhyj2+/xR+wIQ==
Date: Wed, 27 May 2026 12:42:20 +0100
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
Subject: Re: [PATCH v2 2/2] thermal: qcom: add support for PMIC5 Gen3 ADC
 thermal monitoring
Message-ID: <20260527124220.39ac0b64@jic23-huawei>
In-Reply-To: <20260526-gen3_adc_tm-v2-2-702fbac919ac@oss.qualcomm.com>
References: <20260526-gen3_adc_tm-v2-0-702fbac919ac@oss.qualcomm.com>
	<20260526-gen3_adc_tm-v2-2-702fbac919ac@oss.qualcomm.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [-0.16 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20260515];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-109992-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[baylibre.com,analog.com,kernel.org,gmail.com,intel.com,arm.com,vger.kernel.org,oss.qualcomm.com,linaro.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[jic23@kernel.org,linux-arm-msm@vger.kernel.org];
	DKIM_TRACE(0.00)[kernel.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 71C785E381C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 26 May 2026 16:26:10 +0530
Jishnu Prakash <jishnu.prakash@oss.qualcomm.com> wrote:

> Add support for ADC_TM part of PMIC5 Gen3.
> 
> This is an auxiliary driver under the Gen3 ADC driver, which implements the
> threshold setting and interrupt generating functionalities of QCOM ADC_TM
> drivers, used to support thermal trip points.
> 
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
A couple of minor comments from me.

Thanks,

Jonathan

> diff --git a/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> new file mode 100644
> index 000000000000..633008f173a8
> --- /dev/null
> +++ b/drivers/thermal/qcom/qcom-spmi-adc-tm5-gen3.c
> @@ -0,0 +1,437 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
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

Do you need kernel.h?  It's odd to see a driver (correctly)
use the subheaders of device.h but still include the mega
header kernel.h rather than more focused ones.

> +#include <linux/module.h>
> +#include <linux/thermal.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>

> +
> +static irqreturn_t adctm5_gen3_isr(int irq, void *dev_id)
> +{
> +	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
> +	int ret, sdam_num;
> +	u8 tm_status[2];
> +	u8 status, val;
> +
> +	sdam_num = get_sdam_from_irq(adc_tm5, irq);
> +	if (sdam_num < 0)
> +		return IRQ_NONE;
> +
> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_STATUS1,
> +			     &status, sizeof(status));
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	if (status & ADC5_GEN3_STATUS1_CONV_FAULT) {
> +		val = ADC5_GEN3_CONV_ERR_CLR_REQ;
> +		adc5_gen3_status_clear(adc_tm5->dev_data, sdam_num,
> +				       ADC5_GEN3_CONV_ERR_CLR, &val, 1);
> +		return IRQ_HANDLED;
> +	}
> +
> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_num, ADC5_GEN3_TM_HIGH_STS,
> +			     tm_status, sizeof(tm_status));
> +	if (ret)
> +		return IRQ_NONE;
> +
> +	if (tm_status[0] || tm_status[1])
> +		return IRQ_WAKE_THREAD;
> +
> +	return IRQ_NONE;
> +}
> +
> +static int adc5_gen3_tm_status_check(struct adc_tm5_gen3_chip *adc_tm5,
> +				     int sdam_index, u8 *tm_status, u8 *buf)

Might be worth an at_least marking for buf and maybe for tm_status as well
so it is clear they are big enough for how they are used in here.
Sooner or later compilers will check those.


> +{
> +	int ret;
> +
> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS,
> +			     tm_status, 2);
> +	if (ret)
> +		return ret;
> +
> +	ret = adc5_gen3_status_clear(adc_tm5->dev_data, sdam_index, ADC5_GEN3_TM_HIGH_STS_CLR,
> +				     tm_status, 2);
> +	if (ret)
> +		return ret;
> +
> +	ret = adc5_gen3_read(adc_tm5->dev_data, sdam_index, ADC5_GEN3_CH_DATA0(0),
> +			     buf, 16);
> +	return ret;

	return adc5...

> +}
> +
> +static irqreturn_t adctm5_gen3_isr_thread(int irq, void *dev_id)
> +{
> +	struct adc_tm5_gen3_chip *adc_tm5 = dev_id;
> +	int sdam_index = -1;
> +	u8 tm_status[2] = { };
> +	u8 buf[16] = { };
> +
> +	for (int i = 0; i < adc_tm5->nchannels; i++) {
> +		struct adc_tm5_gen3_channel_props *chan_prop = &adc_tm5->chan_props[i];
> +		int offset = chan_prop->tm_chan_index;
> +		bool upper_set, lower_set;
> +		int ret;
> +
> +		scoped_guard(adc5_gen3, adc_tm5) {
> +			if (chan_prop->sdam_index != sdam_index) {
> +				sdam_index = chan_prop->sdam_index;
> +				ret = adc5_gen3_tm_status_check(adc_tm5, sdam_index,
> +								tm_status, buf);

I think the clear of other sdam interrupt status that sashiko was pointing out
is here as somewhat unexpectedly a function called status_check clears as well.


> +				if (ret)
> +					return IRQ_NONE;
> +			}
> +
> +			upper_set = ((tm_status[0] & BIT(offset)) && chan_prop->high_thr_en);
> +			lower_set = ((tm_status[1] & BIT(offset)) && chan_prop->low_thr_en);
> +		}
> +
> +		if (!(upper_set || lower_set))
> +			continue;
> +
> +		thermal_zone_device_update(chan_prop->tzd, THERMAL_TRIP_VIOLATED);
> +	}
> +
> +	return IRQ_HANDLED;
> +}

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
> +	buf[4] &= ~ADC5_GEN3_FAST_AVG_CTL_SAMPLES_MASK;

Maybe use FIELD_MODIFY() for this as makes it obvious where the update is.

> +	buf[4] |= prop->common_props.avg_samples | ADC5_GEN3_FAST_AVG_CTL_EN;

Looking at the field defines is this writing them all?  For other fields you don't
seem to have been careful to preserve reserved values so why this one?

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
> +
> +	buf[7] = 0;
> +	if (prop->high_thr_en)
> +		buf[7] |= ADC5_GEN3_HIGH_THR_INT_EN;
> +	if (prop->low_thr_en)
> +		buf[7] |= ADC5_GEN3_LOW_THR_INT_EN;
> +
> +	ret = adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index, ADC5_GEN3_SID,
> +			      buf, sizeof(buf));
> +	if (ret < 0)
> +		return ret;
> +
> +	conv_req = ADC5_GEN3_CONV_REQ_REQ;
> +	return adc5_gen3_write(adc_tm5->dev_data, prop->sdam_index,
> +			       ADC5_GEN3_CONV_REQ, &conv_req, sizeof(conv_req));
> +}


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
> +

Similar to in the ADC driver, I'd drop this blank line.

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
> +
> +	return adc_tm5_register_tzd(adc_tm5);
> +}


