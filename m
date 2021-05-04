Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 018B9372435
	for <lists+linux-arm-msm@lfdr.de>; Tue,  4 May 2021 03:20:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229650AbhEDBVR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 3 May 2021 21:21:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:61475 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229634AbhEDBVR (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 3 May 2021 21:21:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1620091223; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=iDUkLDF5COgk7xf2Jq7xbNVKbXk948/8h1U9swTimdo=; b=TmieOISfabrfSH7BbH1TEHcVNSNMMuEp0U8ECPTcriZXrCmwXrtfsNFXf8qWOEg/LOFXZAb+
 vk3G3iK4w12CFvgXUH0VgkU9VzBPSaDl7DUqFfscHS6/uyOnY9wL22NzfWGYvjfXqMt3+8xo
 O0Qf9C6j5VcuRH/BXDOQXeYZJng=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6090a1562cbba8898015e540 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 04 May 2021 01:20:22
 GMT
Sender: subbaram=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 9DFC5C4323A; Tue,  4 May 2021 01:20:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=no autolearn_force=no version=3.4.0
Received: from [10.46.162.93] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: subbaram)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2E825C433D3;
        Tue,  4 May 2021 01:20:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2E825C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=subbaram@codeaurora.org
Subject: Re: [PATCH v7 2/6] leds: Add driver for Qualcomm LPG
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Pavel Machek <pavel@ucw.cz>, Rob Herring <robh+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Lee Jones <lee.jones@linaro.org>
Cc:     linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pwm@vger.kernel.org,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Luca Weiss <luca@z3ntu.xyz>
References: <20210429211517.312792-1-bjorn.andersson@linaro.org>
 <20210429211517.312792-3-bjorn.andersson@linaro.org>
From:   Subbaraman Narayanamurthy <subbaram@codeaurora.org>
Message-ID: <960f1519-f830-583a-ff10-039d7de83335@codeaurora.org>
Date:   Mon, 3 May 2021 18:20:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210429211517.312792-3-bjorn.andersson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/29/21 2:15 PM, Bjorn Andersson wrote:
> The Light Pulse Generator (LPG) is a PWM-block found in a wide range of
> PMICs from Qualcomm. It can operate on fixed parameters or based on a
> lookup-table, altering the duty cycle over time - which provides the
> means for e.g. hardware assisted transitions of LED brightness.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
>
> Changes since v6:
> - Moved code into drivers/leds/rgb/
> - Reverted to earlier qcom,dtest handling to support routing pwm signals
>   through dtest lines.
> - Remember the duration of each step of the pattern, rather than adding up and
>   then dividing when the value is used.
> - Added missing error prints on DT parse errors.
> - Added sm8150[lb] and made led source and atc presence optional
> - Added missing parenthesis around (len + 1) / 2 in search for hi_pause in the
>   pattern.
>
>  drivers/leds/Kconfig             |    3 +
>  drivers/leds/Makefile            |    3 +
>  drivers/leds/rgb/leds-qcom-lpg.c | 1286 ++++++++++++++++++++++++++++++
>  3 files changed, 1292 insertions(+)
>  create mode 100644 drivers/leds/rgb/leds-qcom-lpg.c
>
> diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
> index 49d99cb084db..8ab06b3f162d 100644
> --- a/drivers/leds/Kconfig
> +++ b/drivers/leds/Kconfig
> @@ -933,6 +933,9 @@ source "drivers/leds/blink/Kconfig"
>  comment "Flash and Torch LED drivers"
>  source "drivers/leds/flash/Kconfig"
>  
> +comment "RGB LED drivers"
> +source "drivers/leds/rgb/Kconfig"


Are you planning to add "drivers/leds/rgb/Kconfig" and "drivers/leds/rgb/Makefile" as a separate change?


> +
>  comment "LED Triggers"
>  source "drivers/leds/trigger/Kconfig"
>  
> diff --git a/drivers/leds/Makefile b/drivers/leds/Makefile
> index 7e604d3028c8..8cad0465aae0 100644
> --- a/drivers/leds/Makefile
> +++ b/drivers/leds/Makefile
> @@ -106,6 +106,9 @@ obj-$(CONFIG_LEDS_USER)			+= uleds.o
>  # Flash and Torch LED Drivers
>  obj-$(CONFIG_LEDS_CLASS_FLASH)		+= flash/
>  
> +# RGB LED Drivers
> +obj-$(CONFIG_LEDS_CLASS_MULTICOLOR)	+= rgb/
> +
>  # LED Triggers
>  obj-$(CONFIG_LEDS_TRIGGERS)		+= trigger/
>  
> diff --git a/drivers/leds/rgb/leds-qcom-lpg.c b/drivers/leds/rgb/leds-qcom-lpg.c
> new file mode 100644
> index 000000000000..c68233b43c2c
> --- /dev/null
> +++ b/drivers/leds/rgb/leds-qcom-lpg.c
> @@ -0,0 +1,1286 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2017-2021 Linaro Ltd
> + * Copyright (c) 2010-2012, The Linux Foundation. All rights reserved.
> + */
> +#include <linux/bits.h>
> +#include <linux/led-class-multicolor.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/pwm.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +
> +#define LPG_PATTERN_CONFIG_REG	0x40
> +#define LPG_SIZE_CLK_REG	0x41
> +#define LPG_PREDIV_CLK_REG	0x42
> +#define PWM_TYPE_CONFIG_REG	0x43
> +#define PWM_VALUE_REG		0x44
> +#define PWM_ENABLE_CONTROL_REG	0x46
> +#define PWM_SYNC_REG		0x47
> +#define LPG_RAMP_DURATION_REG	0x50
> +#define LPG_HI_PAUSE_REG	0x52
> +#define LPG_LO_PAUSE_REG	0x54
> +#define LPG_HI_IDX_REG		0x56
> +#define LPG_LO_IDX_REG		0x57
> +#define PWM_SEC_ACCESS_REG	0xd0
> +#define PWM_DTEST_REG(x)	(0xe2 + (x) - 1)
> +
> +#define TRI_LED_SRC_SEL		0x45
> +#define TRI_LED_EN_CTL		0x46
> +#define TRI_LED_ATC_CTL		0x47
> +
> +#define LPG_LUT_REG(x)		(0x40 + (x) * 2)
> +#define RAMP_CONTROL_REG	0xc8
> +
> +struct lpg_channel;
> +struct lpg_data;
> +
> +/**
> + * struct lpg - LPG device context
> + * @dev:	struct device for LPG device
> + * @map:	regmap for register access
> + * @pwm:	PWM-chip object, if operating in PWM mode
> + * @lut_base:	base address of the LUT block (optional)
> + * @lut_size:	number of entries in the LUT block
> + * @lut_bitmap:	allocation bitmap for LUT entries
> + * @triled_base: base address of the TRILED block (optional)
> + * @triled_src:	power-source for the TRILED
> + * @triled_has_atc_ctl:	true if there is TRI_LED_ATC_CTL register
> + * @triled_has_src_sel:	true if there is TRI_LED_SRC_SEL register
> + * @channels:	list of PWM channels
> + * @num_channels: number of @channels
> + */
> +struct lpg {
> +	struct device *dev;
> +	struct regmap *map;
> +
> +	struct pwm_chip pwm;
> +
> +	const struct lpg_data *data;
> +
> +	u32 lut_base;
> +	u32 lut_size;
> +	unsigned long *lut_bitmap;
> +
> +	u32 triled_base;
> +	u32 triled_src;
> +	bool triled_has_atc_ctl;
> +	bool triled_has_src_sel;
> +
> +	struct lpg_channel *channels;
> +	unsigned int num_channels;
> +};
> +
> +/**
> + * struct lpg_channel - per channel data
> + * @lpg:	reference to parent lpg
> + * @base:	base address of the PWM channel
> + * @triled_mask: mask in TRILED to enable this channel
> + * @lut_mask:	mask in LUT to start pattern generator for this channel
> + * @in_use:	channel is exposed to LED framework
> + * @color:	color of the LED attached to this channel
> + * @dtest_line:	DTEST line for output, or 0 if disabled
> + * @dtest_value: DTEST line configuration
> + * @pwm_value:	duty (in microseconds) of the generated pulses, overridden by LUT
> + * @enabled:	output enabled?
> + * @period_us:	period (in microseconds) of the generated pulses
> + * @pwm_size:	resolution of the @pwm_value, 6 or 9 bits
> + * @clk:	base frequency of the clock generator
> + * @pre_div:	divider of @clk
> + * @pre_div_exp: exponential divider of @clk
> + * @ramp_enabled: duty cycle is driven by iterating over lookup table
> + * @ramp_ping_pong: reverse through pattern, rather than wrapping to start
> + * @ramp_oneshot: perform only a single pass over the pattern
> + * @ramp_reverse: iterate over pattern backwards
> + * @ramp_tick_ms: length (in milliseconds) of one step in the pattern
> + * @ramp_lo_pause_ms: pause (in milliseconds) before iterating over pattern
> + * @ramp_hi_pause_ms: pause (in milliseconds) after iterating over pattern
> + * @pattern_lo_idx: start index of associated pattern
> + * @pattern_hi_idx: last index of associated pattern
> + */
> +struct lpg_channel {
> +	struct lpg *lpg;
> +
> +	u32 base;
> +	unsigned int triled_mask;
> +	unsigned int lut_mask;
> +
> +	bool in_use;
> +
> +	int color;
> +
> +	u32 dtest_line;
> +	u32 dtest_value;
> +
> +	u16 pwm_value;
> +	bool enabled;
> +
> +	unsigned int period_us;
> +	unsigned int pwm_size;
> +	unsigned int clk;
> +	unsigned int pre_div;
> +	unsigned int pre_div_exp;
> +
> +	bool ramp_enabled;
> +	bool ramp_ping_pong;
> +	bool ramp_oneshot;
> +	bool ramp_reverse;
> +	unsigned long ramp_tick_ms;
> +	unsigned long ramp_lo_pause_ms;
> +	unsigned long ramp_hi_pause_ms;
> +
> +	unsigned int pattern_lo_idx;
> +	unsigned int pattern_hi_idx;
> +};
> +
> +/**
> + * struct lpg_led - logical LED object
> + * @lpg:		lpg context reference
> + * @cdev:		LED class device
> + * @mcdev:		Multicolor LED class device
> + * @num_channels:	number of @channels
> + * @channels:		list of channels associated with the LED
> + */
> +struct lpg_led {
> +	struct lpg *lpg;
> +
> +	struct led_classdev cdev;
> +	struct led_classdev_mc mcdev;
> +
> +	unsigned int num_channels;
> +	struct lpg_channel *channels[];
> +};
> +
> +/**
> + * struct lpg_channel_data - per channel initialization data
> + * @base:		base address for PWM channel registers
> + * @triled_mask:	bitmask for controlling this channel in TRILED
> + */
> +struct lpg_channel_data {
> +	unsigned int base;
> +	u8 triled_mask;
> +};
> +
> +/**
> + * struct lpg_data - initialization data
> + * @lut_base:		base address of LUT block
> + * @lut_size:		number of entries in LUT
> + * @triled_base:	base address of TRILED
> + * @triled_has_atc_ctl:	true if there is TRI_LED_ATC_CTL register
> + * @triled_has_src_sel:	true if there is TRI_LED_SRC_SEL register
> + * @pwm_9bit_mask:	bitmask for switching from 6bit to 9bit pwm
> + * @num_channels:	number of channels in LPG
> + * @channels:		list of channel initialization data
> + */
> +struct lpg_data {
> +	unsigned int lut_base;
> +	unsigned int lut_size;
> +	unsigned int triled_base;
> +	bool triled_has_atc_ctl;
> +	bool triled_has_src_sel;
> +	unsigned int pwm_9bit_mask;
> +	int num_channels;
> +	struct lpg_channel_data *channels;
> +};
> +
> +static int triled_set(struct lpg *lpg, unsigned int mask, unsigned int enable)
> +{
> +	/* Skip if we don't have a triled block */
> +	if (!lpg->triled_base)
> +		return 0;
> +
> +	return regmap_update_bits(lpg->map, lpg->triled_base + TRI_LED_EN_CTL,
> +				  mask, enable);
> +}
> +
> +static int lpg_lut_store(struct lpg *lpg, struct led_pattern *pattern,
> +			 size_t len, unsigned int *lo_idx, unsigned int *hi_idx)
> +{
> +	unsigned int idx;
> +	u16 val;
> +	int i;
> +
> +	/* Hardware does not behave when LO_IDX == HI_IDX */
> +	if (len == 1)
> +		return -EINVAL;
> +
> +	idx = bitmap_find_next_zero_area(lpg->lut_bitmap, lpg->lut_size,
> +					 0, len, 0);
> +	if (idx >= lpg->lut_size)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < len; i++) {
> +		val = pattern[i].brightness;
> +
> +		regmap_bulk_write(lpg->map, lpg->lut_base + LPG_LUT_REG(idx + i), &val, 1);
> +	}
> +
> +	bitmap_set(lpg->lut_bitmap, idx, len);
> +
> +	*lo_idx = idx;
> +	*hi_idx = idx + len - 1;
> +
> +	return 0;
> +}
> +
> +static void lpg_lut_free(struct lpg *lpg, unsigned int lo_idx, unsigned int hi_idx)
> +{
> +	int len;
> +
> +	if (lo_idx == hi_idx)
> +		return;
> +
> +	len = hi_idx - lo_idx + 1;
> +	bitmap_clear(lpg->lut_bitmap, lo_idx, len);
> +}
> +
> +static int lpg_lut_sync(struct lpg *lpg, unsigned int mask)
> +{
> +	return regmap_write(lpg->map, lpg->lut_base + RAMP_CONTROL_REG, mask);
> +}
> +
> +#define NUM_PWM_PREDIV	4
> +#define NUM_PWM_CLK	3
> +#define NUM_EXP		7
> +
> +static const unsigned int lpg_clk_table[NUM_PWM_PREDIV][NUM_PWM_CLK] = {
> +	{
> +		1 * (NSEC_PER_SEC / 1024),
> +		1 * (NSEC_PER_SEC / 32768),
> +		1 * (NSEC_PER_SEC / 19200000),
> +	},
> +	{
> +		3 * (NSEC_PER_SEC / 1024),
> +		3 * (NSEC_PER_SEC / 32768),
> +		3 * (NSEC_PER_SEC / 19200000),
> +	},
> +	{
> +		5 * (NSEC_PER_SEC / 1024),
> +		5 * (NSEC_PER_SEC / 32768),
> +		5 * (NSEC_PER_SEC / 19200000),
> +	},
> +	{
> +		6 * (NSEC_PER_SEC / 1024),
> +		6 * (NSEC_PER_SEC / 32768),
> +		6 * (NSEC_PER_SEC / 19200000),
> +	},
> +};
> +
> +/*
> + * PWM Frequency = Clock Frequency / (N * T)
> + *      or
> + * PWM Period = Clock Period * (N * T)
> + *      where
> + * N = 2^9 or 2^6 for 9-bit or 6-bit PWM size
> + * T = Pre-divide * 2^m, where m = 0..7 (exponent)
> + *
> + * This is the formula to figure out m for the best pre-divide and clock:
> + * (PWM Period / N) = (Pre-divide * Clock Period) * 2^m
> + */
> +static void lpg_calc_freq(struct lpg_channel *chan, unsigned int period_us)
> +{
> +	int             n, m, clk, div;
> +	int             best_m, best_div, best_clk;
> +	unsigned int    last_err, cur_err, min_err;
> +	unsigned int    tmp_p, period_n;
> +
> +	if (period_us == chan->period_us)
> +		return;
> +
> +	/* PWM Period / N */
> +	if (period_us < UINT_MAX / NSEC_PER_USEC)
> +		n = 6;
> +	else
> +		n = 9;
> +
> +	period_n = ((u64)period_us * NSEC_PER_USEC) >> n;
> +
> +	min_err = UINT_MAX;
> +	last_err = UINT_MAX;
> +	best_m = 0;
> +	best_clk = 0;
> +	best_div = 0;
> +	for (clk = 0; clk < NUM_PWM_CLK; clk++) {
> +		for (div = 0; div < NUM_PWM_PREDIV; div++) {
> +			/* period_n = (PWM Period / N) */
> +			/* tmp_p = (Pre-divide * Clock Period) * 2^m */
> +			tmp_p = lpg_clk_table[div][clk];
> +			for (m = 0; m <= NUM_EXP; m++) {
> +				cur_err = abs(period_n - tmp_p);
> +				if (cur_err < min_err) {
> +					min_err = cur_err;
> +					best_m = m;
> +					best_clk = clk;
> +					best_div = div;
> +				}
> +
> +				if (m && cur_err > last_err)
> +					/* Break for bigger cur_err */
> +					break;
> +
> +				last_err = cur_err;
> +				tmp_p <<= 1;
> +			}
> +		}
> +	}
> +
> +	/* Use higher resolution */
> +	if (best_m >= 3 && n == 6) {
> +		n += 3;
> +		best_m -= 3;
> +	}
> +
> +	chan->clk = best_clk;
> +	chan->pre_div = best_div;
> +	chan->pre_div_exp = best_m;
> +	chan->pwm_size = n;
> +
> +	chan->period_us = period_us;
> +}
> +
> +static void lpg_calc_duty(struct lpg_channel *chan, unsigned int duty_us)
> +{
> +	unsigned int max = (1 << chan->pwm_size) - 1;
> +	unsigned int val = div_u64((u64)duty_us << chan->pwm_size, chan->period_us);
> +
> +	chan->pwm_value = min(val, max);
> +}
> +
> +static void lpg_apply_freq(struct lpg_channel *chan)
> +{
> +	unsigned long val;
> +	struct lpg *lpg = chan->lpg;
> +
> +	if (!chan->enabled)
> +		return;
> +
> +	/* Clock register values are off-by-one from lpg_clk_table */
> +	val = chan->clk + 1;
> +
> +	if (chan->pwm_size == 9)
> +		val |= lpg->data->pwm_9bit_mask;
> +
> +	regmap_write(lpg->map, chan->base + LPG_SIZE_CLK_REG, val);
> +
> +	val = chan->pre_div << 5 | chan->pre_div_exp;
> +	regmap_write(lpg->map, chan->base + LPG_PREDIV_CLK_REG, val);
> +}
> +
> +#define LPG_ENABLE_GLITCH_REMOVAL	BIT(5)
> +
> +static void lpg_enable_glitch(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg = chan->lpg;
> +
> +	regmap_update_bits(lpg->map, chan->base + PWM_TYPE_CONFIG_REG,
> +			   LPG_ENABLE_GLITCH_REMOVAL, 0);
> +}
> +
> +static void lpg_disable_glitch(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg = chan->lpg;
> +
> +	regmap_update_bits(lpg->map, chan->base + PWM_TYPE_CONFIG_REG,
> +			   LPG_ENABLE_GLITCH_REMOVAL,
> +			   LPG_ENABLE_GLITCH_REMOVAL);
> +}
> +
> +static void lpg_apply_pwm_value(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg = chan->lpg;
> +	u16 val = chan->pwm_value;
> +
> +	if (!chan->enabled)
> +		return;
> +
> +	regmap_bulk_write(lpg->map, chan->base + PWM_VALUE_REG, &val, 1);
> +}
> +
> +#define LPG_PATTERN_CONFIG_LO_TO_HI	BIT(4)
> +#define LPG_PATTERN_CONFIG_REPEAT	BIT(3)
> +#define LPG_PATTERN_CONFIG_TOGGLE	BIT(2)
> +#define LPG_PATTERN_CONFIG_PAUSE_HI	BIT(1)
> +#define LPG_PATTERN_CONFIG_PAUSE_LO	BIT(0)
> +
> +static void lpg_apply_lut_control(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg = chan->lpg;
> +	unsigned int hi_pause;
> +	unsigned int lo_pause;
> +	unsigned int step;
> +	unsigned int conf = 0;
> +	unsigned int lo_idx = chan->pattern_lo_idx;
> +	unsigned int hi_idx = chan->pattern_hi_idx;
> +	int pattern_len;
> +
> +	if (!chan->ramp_enabled || chan->pattern_lo_idx == chan->pattern_hi_idx)
> +		return;
> +
> +	pattern_len = hi_idx - lo_idx + 1;
> +
> +	step = chan->ramp_tick_ms;
> +	hi_pause = DIV_ROUND_UP(chan->ramp_hi_pause_ms, step);
> +	lo_pause = DIV_ROUND_UP(chan->ramp_lo_pause_ms, step);
> +
> +	if (!chan->ramp_reverse)
> +		conf |= LPG_PATTERN_CONFIG_LO_TO_HI;
> +	if (!chan->ramp_oneshot)
> +		conf |= LPG_PATTERN_CONFIG_REPEAT;
> +	if (chan->ramp_ping_pong)
> +		conf |= LPG_PATTERN_CONFIG_TOGGLE;
> +	if (chan->ramp_hi_pause_ms)
> +		conf |= LPG_PATTERN_CONFIG_PAUSE_HI;
> +	if (chan->ramp_lo_pause_ms)
> +		conf |= LPG_PATTERN_CONFIG_PAUSE_LO;
> +
> +	regmap_write(lpg->map, chan->base + LPG_PATTERN_CONFIG_REG, conf);
> +	regmap_write(lpg->map, chan->base + LPG_HI_IDX_REG, hi_idx);
> +	regmap_write(lpg->map, chan->base + LPG_LO_IDX_REG, lo_idx);
> +
> +	regmap_write(lpg->map, chan->base + LPG_RAMP_DURATION_REG, step);
> +	regmap_write(lpg->map, chan->base + LPG_HI_PAUSE_REG, hi_pause);
> +	regmap_write(lpg->map, chan->base + LPG_LO_PAUSE_REG, lo_pause);
> +}
> +
> +#define LPG_ENABLE_CONTROL_OUTPUT		BIT(7)
> +#define LPG_ENABLE_CONTROL_BUFFER_TRISTATE	BIT(5)
> +#define LPG_ENABLE_CONTROL_SRC_PWM		BIT(2)
> +#define LPG_ENABLE_CONTROL_RAMP_GEN		BIT(1)
> +
> +static void lpg_apply_control(struct lpg_channel *chan)
> +{
> +	unsigned int ctrl;
> +	struct lpg *lpg = chan->lpg;
> +
> +	ctrl = LPG_ENABLE_CONTROL_BUFFER_TRISTATE;
> +
> +	if (chan->enabled)
> +		ctrl |= LPG_ENABLE_CONTROL_OUTPUT;
> +
> +	if (chan->pattern_lo_idx != chan->pattern_hi_idx)
> +		ctrl |= LPG_ENABLE_CONTROL_RAMP_GEN;
> +	else
> +		ctrl |= LPG_ENABLE_CONTROL_SRC_PWM;
> +
> +	regmap_write(lpg->map, chan->base + PWM_ENABLE_CONTROL_REG, ctrl);
> +
> +	/*
> +	 * Due to LPG hardware bug, in the PWM mode, having enabled PWM,
> +	 * We have to write PWM values one more time.
> +	 */
> +	if (chan->enabled)
> +		lpg_apply_pwm_value(chan);
> +}
> +
> +#define LPG_SYNC_PWM	BIT(0)
> +
> +static void lpg_apply_sync(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg = chan->lpg;
> +
> +	regmap_write(lpg->map, chan->base + PWM_SYNC_REG, LPG_SYNC_PWM);
> +}
> +
> +static int lpg_parse_dtest(struct lpg *lpg)
> +{
> +	struct lpg_channel *chan;
> +	struct device_node *np = lpg->dev->of_node;
> +	int count;
> +	int ret;
> +	int i;
> +
> +	count = of_property_count_u32_elems(np, "qcom,dtest");
> +	if (count == -EINVAL) {
> +		return 0;
> +	} else if (count < 0) {
> +		ret = count;
> +		goto err_malformed;
> +	} else if (count != lpg->data->num_channels * 2) {
> +		dev_err(lpg->dev, "qcom,dtest needs to be %d items\n",
> +			lpg->data->num_channels * 2);
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < lpg->data->num_channels; i++) {
> +		chan = &lpg->channels[i];
> +
> +		ret = of_property_read_u32_index(np, "qcom,dtest", i * 2,
> +						 &chan->dtest_line);
> +		if (ret)
> +			goto err_malformed;
> +
> +		ret = of_property_read_u32_index(np, "qcom,dtest", i * 2 + 1,
> +						 &chan->dtest_value);
> +		if (ret)
> +			goto err_malformed;
> +	}
> +
> +	return 0;
> +
> +err_malformed:
> +	dev_err(lpg->dev, "malformed qcom,dtest\n");
> +	return ret;
> +}
> +
> +static void lpg_apply_dtest(struct lpg_channel *chan)
> +{
> +	struct lpg *lpg = chan->lpg;
> +
> +	if (!chan->dtest_line)
> +		return;
> +
> +	regmap_write(lpg->map, chan->base + PWM_SEC_ACCESS_REG, 0xa5);
> +	regmap_write(lpg->map, chan->base + PWM_DTEST_REG(chan->dtest_line),
> +		     chan->dtest_value);
> +}
> +
> +static void lpg_apply(struct lpg_channel *chan)
> +{
> +	lpg_disable_glitch(chan);
> +	lpg_apply_freq(chan);
> +	lpg_apply_pwm_value(chan);
> +	lpg_apply_control(chan);
> +	lpg_apply_sync(chan);
> +	lpg_apply_lut_control(chan);
> +	lpg_enable_glitch(chan);
> +}
> +
> +static void lpg_brightness_set(struct lpg_led *led, struct led_classdev *cdev,
> +			       struct mc_subled *subleds)
> +{
> +	enum led_brightness brightness;
> +	struct lpg_channel *chan;
> +	unsigned int triled_enabled = 0;
> +	unsigned int triled_mask = 0;
> +	unsigned int lut_mask = 0;
> +	unsigned int duty_us;
> +	struct lpg *lpg = led->lpg;
> +	int i;
> +
> +	for (i = 0; i < led->num_channels; i++) {
> +		chan = led->channels[i];
> +		brightness = subleds[i].brightness;
> +
> +		if (brightness == LED_OFF) {
> +			chan->enabled = false;
> +			chan->ramp_enabled = false;
> +		} else if (chan->pattern_lo_idx != chan->pattern_hi_idx) {
> +			lpg_calc_freq(chan, NSEC_PER_USEC);
> +
> +			chan->enabled = true;
> +			chan->ramp_enabled = true;
> +
> +			lut_mask |= chan->lut_mask;
> +			triled_enabled |= chan->triled_mask;
> +		} else {
> +			lpg_calc_freq(chan, NSEC_PER_USEC);
> +
> +			duty_us = brightness * chan->period_us / cdev->max_brightness;
> +			lpg_calc_duty(chan, duty_us);
> +			chan->enabled = true;
> +			chan->ramp_enabled = false;
> +
> +			triled_enabled |= chan->triled_mask;
> +		}
> +
> +		triled_mask |= chan->triled_mask;
> +
> +		lpg_apply(chan);
> +	}
> +
> +	/* Toggle triled lines */
> +	if (triled_mask)
> +		triled_set(lpg, triled_mask, triled_enabled);
> +
> +	/* Trigger start of ramp generator(s) */
> +	if (lut_mask)
> +		lpg_lut_sync(lpg, lut_mask);
> +}
> +
> +static void lpg_brightness_single_set(struct led_classdev *cdev,
> +				      enum led_brightness value)
> +{
> +	struct lpg_led *led = container_of(cdev, struct lpg_led, cdev);
> +	struct mc_subled info;
> +
> +	info.brightness = value;
> +	lpg_brightness_set(led, cdev, &info);
> +}
> +
> +static void lpg_brightness_mc_set(struct led_classdev *cdev,
> +				  enum led_brightness value)
> +{
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
> +	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
> +
> +	led_mc_calc_color_components(mc, value);
> +	lpg_brightness_set(led, cdev, mc->subled_info);
> +}
> +
> +static int lpg_blink_set(struct lpg_led *led,
> +			 unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct lpg_channel *chan;
> +	unsigned int period_us;
> +	unsigned int duty_us;
> +	int i;
> +
> +	if (!*delay_on && !*delay_off) {
> +		*delay_on = 500;
> +		*delay_off = 500;
> +	}
> +
> +	duty_us = *delay_on * USEC_PER_MSEC;
> +	period_us = (*delay_on + *delay_off) * USEC_PER_MSEC;
> +
> +	for (i = 0; i < led->num_channels; i++) {
> +		chan = led->channels[i];
> +
> +		lpg_calc_freq(chan, period_us);
> +		lpg_calc_duty(chan, duty_us);
> +
> +		chan->enabled = true;
> +		chan->ramp_enabled = false;
> +
> +		lpg_apply(chan);
> +	}
> +
> +	return 0;
> +}
> +
> +static int lpg_blink_single_set(struct led_classdev *cdev,
> +				unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct lpg_led *led = container_of(cdev, struct lpg_led, cdev);
> +
> +	return lpg_blink_set(led, delay_on, delay_off);
> +}
> +
> +static int lpg_blink_mc_set(struct led_classdev *cdev,
> +			    unsigned long *delay_on, unsigned long *delay_off)
> +{
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
> +	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
> +
> +	return lpg_blink_set(led, delay_on, delay_off);
> +}
> +
> +static int lpg_pattern_set(struct lpg_led *led, struct led_pattern *pattern,
> +			   u32 len, int repeat)
> +{
> +	struct lpg_channel *chan;
> +	struct lpg *lpg = led->lpg;
> +	unsigned int hi_pause;
> +	unsigned int lo_pause;
> +	unsigned int lo_idx;
> +	unsigned int hi_idx;
> +	bool ping_pong = true;
> +	int brightness_a;
> +	int brightness_b;
> +	int ret;
> +	int i;
> +
> +	/* Only support oneshot or indefinite loops, due to limited pattern space */
> +	if (repeat != -1 && repeat != 1)
> +		return -EINVAL;
> +
> +	/*
> +	 * The LPG plays patterns with at a fixed pace, a "low pause" can be
> +	 * performed before the pattern and a "high pause" after. In order to
> +	 * save space the pattern can be played in "ping pong" mode, in which
> +	 * the pattern is first played forward, then "high pause" is applied,
> +	 * then the pattern is played backwards and finally the "low pause" is
> +	 * applied.
> +	 *
> +	 * The delta_t of the first entry is used to determine the pace of the
> +	 * pattern.
> +	 *
> +	 * If the specified pattern is a palindrome the ping pong mode is
> +	 * enabled. In this scenario the delta_t of the last entry determines
> +	 * the "low pause" time and the delta_t of the middle entry (i.e. the
> +	 * last in the programmed pattern) determines the "high pause". If the
> +	 * pattern consists of an odd number of values, no "high pause" is
> +	 * used.
> +	 *
> +	 * When ping pong mode is not selected, the delta_t of the last entry
> +	 * is used as "high pause". No "low pause" is used.
> +	 *
> +	 * delta_t of any other members of the pattern is ignored.
> +	 */
> +
> +	/* Detect palindromes and use "ping pong" to reduce LUT usage */
> +	for (i = 0; i < len / 2; i++) {
> +		brightness_a = pattern[i].brightness;
> +		brightness_b = pattern[len - i - 1].brightness;
> +
> +		if (brightness_a != brightness_b) {
> +			ping_pong = false;
> +			break;
> +		}
> +	}
> +
> +	if (ping_pong) {
> +		if (len % 2)
> +			hi_pause = 0;
> +		else
> +			hi_pause = pattern[(len + 1) / 2].delta_t;
> +		lo_pause = pattern[len - 1].delta_t;
> +
> +		len = (len + 1) / 2;
> +	} else {
> +		hi_pause = pattern[len - 1].delta_t;
> +		lo_pause = 0;
> +	}
> +
> +	ret = lpg_lut_store(lpg, pattern, len, &lo_idx, &hi_idx);
> +	if (ret < 0)
> +		return ret;
> +
> +	for (i = 0; i < led->num_channels; i++) {
> +		chan = led->channels[i];
> +
> +		chan->ramp_tick_ms = pattern[0].delta_t;
> +		chan->ramp_ping_pong = ping_pong;
> +		chan->ramp_oneshot = repeat != -1;
> +
> +		chan->ramp_lo_pause_ms = lo_pause;
> +		chan->ramp_hi_pause_ms = hi_pause;
> +
> +		chan->pattern_lo_idx = lo_idx;
> +		chan->pattern_hi_idx = hi_idx;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lpg_pattern_single_set(struct led_classdev *cdev,
> +				  struct led_pattern *pattern, u32 len,
> +				  int repeat)
> +{
> +	struct lpg_led *led = container_of(cdev, struct lpg_led, cdev);
> +	int ret;
> +
> +	ret = lpg_pattern_set(led, pattern, len, repeat);
> +	if (ret < 0)
> +		return ret;
> +
> +	lpg_brightness_single_set(cdev, LED_FULL);
> +
> +	return 0;
> +}
> +
> +static int lpg_pattern_mc_set(struct led_classdev *cdev,
> +			      struct led_pattern *pattern, u32 len,
> +			      int repeat)
> +{
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
> +	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
> +	int ret;
> +
> +	ret = lpg_pattern_set(led, pattern, len, repeat);
> +	if (ret < 0)
> +		return ret;
> +
> +	led_mc_calc_color_components(mc, LED_FULL);
> +	lpg_brightness_set(led, cdev, mc->subled_info);
> +
> +	return 0;
> +}
> +
> +static int lpg_pattern_clear(struct lpg_led *led)
> +{
> +	struct lpg_channel *chan;
> +	struct lpg *lpg = led->lpg;
> +	int i;
> +
> +	chan = led->channels[0];
> +	lpg_lut_free(lpg, chan->pattern_lo_idx, chan->pattern_hi_idx);
> +
> +	for (i = 0; i < led->num_channels; i++) {
> +		chan = led->channels[i];
> +		chan->pattern_lo_idx = 0;
> +		chan->pattern_hi_idx = 0;
> +	}
> +
> +	return 0;
> +}
> +
> +static int lpg_pattern_single_clear(struct led_classdev *cdev)
> +{
> +	struct lpg_led *led = container_of(cdev, struct lpg_led, cdev);
> +
> +	return lpg_pattern_clear(led);
> +}
> +
> +static int lpg_pattern_mc_clear(struct led_classdev *cdev)
> +{
> +	struct led_classdev_mc *mc = lcdev_to_mccdev(cdev);
> +	struct lpg_led *led = container_of(mc, struct lpg_led, mcdev);
> +
> +	return lpg_pattern_clear(led);
> +}
> +
> +static int lpg_pwm_request(struct pwm_chip *chip, struct pwm_device *pwm)
> +{
> +	struct lpg *lpg = container_of(chip, struct lpg, pwm);
> +	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> +
> +	return chan->in_use ? -EBUSY : 0;
> +}
> +
> +static int lpg_pwm_apply(struct pwm_chip *chip, struct pwm_device *pwm,
> +			 const struct pwm_state *state)
> +{
> +	struct lpg *lpg = container_of(chip, struct lpg, pwm);
> +	struct lpg_channel *chan = &lpg->channels[pwm->hwpwm];
> +
> +	lpg_calc_freq(chan, div_u64(state->period, NSEC_PER_USEC));
> +	lpg_calc_duty(chan, div_u64(state->duty_cycle, NSEC_PER_USEC));
> +	chan->enabled = state->enabled;
> +
> +	lpg_apply(chan);
> +
> +	triled_set(lpg, chan->triled_mask, chan->enabled ? chan->triled_mask : 0);
> +
> +	return 0;
> +}
> +
> +static const struct pwm_ops lpg_pwm_ops = {
> +	.request = lpg_pwm_request,
> +	.apply = lpg_pwm_apply,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int lpg_add_pwm(struct lpg *lpg)
> +{
> +	int ret;
> +
> +	lpg->pwm.base = -1;
> +	lpg->pwm.dev = lpg->dev;
> +	lpg->pwm.npwm = lpg->num_channels;
> +	lpg->pwm.ops = &lpg_pwm_ops;
> +
> +	ret = pwmchip_add(&lpg->pwm);
> +	if (ret)
> +		dev_err(lpg->dev, "failed to add PWM chip: ret %d\n", ret);
> +
> +	return ret;
> +}
> +
> +static int lpg_parse_channel(struct lpg *lpg, struct device_node *np,
> +			     struct lpg_channel **channel)
> +{
> +	struct lpg_channel *chan;
> +	u32 color = LED_COLOR_ID_GREEN;
> +	u32 reg;
> +	int ret;
> +
> +	ret = of_property_read_u32(np, "reg", &reg);
> +	if (ret || !reg || reg > lpg->num_channels) {
> +		dev_err(lpg->dev, "invalid reg of %pOFn\n", np);
> +		return -EINVAL;
> +	}
> +
> +	chan = &lpg->channels[reg - 1];
> +	chan->in_use = true;
> +
> +	ret = of_property_read_u32(np, "color", &color);
> +	if (ret < 0 && ret != -EINVAL) {
> +		dev_err(lpg->dev, "failed to parse \"color\" of %pOF\n", np);
> +		return ret;
> +	}
> +
> +	chan->color = color;
> +
> +	*channel = chan;
> +
> +	return 0;
> +}
> +
> +static int lpg_add_led(struct lpg *lpg, struct device_node *np)
> +{
> +	struct led_classdev *cdev;
> +	struct device_node *child;
> +	struct mc_subled *info;
> +	struct lpg_led *led;
> +	const char *state;
> +	int num_channels;
> +	u32 color = 0;
> +	int ret;
> +	int i;
> +
> +	ret = of_property_read_u32(np, "color", &color);
> +	if (ret < 0 && ret != -EINVAL) {
> +		dev_err(lpg->dev, "failed to parse \"color\" of %pOF\n", np);
> +		return ret;
> +	}
> +
> +	if (color == LED_COLOR_ID_MULTI)
> +		num_channels = of_get_available_child_count(np);
> +	else
> +		num_channels = 1;
> +
> +	led = devm_kzalloc(lpg->dev, struct_size(led, channels, num_channels), GFP_KERNEL);
> +	if (!led)
> +		return -ENOMEM;
> +
> +	led->lpg = lpg;
> +	led->num_channels = num_channels;
> +
> +	if (color == LED_COLOR_ID_MULTI) {
> +		info = devm_kcalloc(lpg->dev, num_channels, sizeof(*info), GFP_KERNEL);
> +		if (!info)
> +			return -ENOMEM;
> +		i = 0;
> +		for_each_available_child_of_node(np, child) {
> +			ret = lpg_parse_channel(lpg, child, &led->channels[i]);
> +			if (ret < 0)
> +				return ret;
> +
> +			info[i].color_index = led->channels[i]->color;
> +			info[i].intensity = LED_FULL;
> +			i++;
> +		}
> +
> +		led->mcdev.subled_info = info;
> +		led->mcdev.num_colors = num_channels;
> +
> +		cdev = &led->mcdev.led_cdev;
> +		cdev->brightness_set = lpg_brightness_mc_set;
> +		cdev->blink_set = lpg_blink_mc_set;
> +
> +		/* Register pattern accessors only if we have a LUT block */
> +		if (lpg->lut_base) {
> +			cdev->pattern_set = lpg_pattern_mc_set;
> +			cdev->pattern_clear = lpg_pattern_mc_clear;
> +		}
> +	} else {
> +		ret = lpg_parse_channel(lpg, np, &led->channels[0]);
> +		if (ret < 0)
> +			return ret;
> +
> +		cdev = &led->cdev;
> +		cdev->brightness_set = lpg_brightness_single_set;
> +		cdev->blink_set = lpg_blink_single_set;
> +
> +		/* Register pattern accessors only if we have a LUT block */
> +		if (lpg->lut_base) {
> +			cdev->pattern_set = lpg_pattern_single_set;
> +			cdev->pattern_clear = lpg_pattern_single_clear;
> +		}
> +	}
> +
> +	/* Use label else node name */
> +	cdev->name = of_get_property(np, "label", NULL) ? : np->name;
> +	cdev->default_trigger = of_get_property(np, "linux,default-trigger", NULL);
> +	cdev->max_brightness = 255;
> +
> +	if (!of_property_read_string(np, "default-state", &state) &&
> +	    !strcmp(state, "on"))
> +		cdev->brightness = LED_FULL;
> +	else
> +		cdev->brightness = LED_OFF;
> +
> +	cdev->brightness_set(cdev, cdev->brightness);
> +
> +	if (color == LED_COLOR_ID_MULTI)
> +		ret = devm_led_classdev_multicolor_register(lpg->dev, &led->mcdev);
> +	else
> +		ret = devm_led_classdev_register(lpg->dev, &led->cdev);
> +	if (ret)
> +		dev_err(lpg->dev, "unable to register %s\n", cdev->name);
> +
> +	return ret;
> +}
> +
> +static int lpg_init_channels(struct lpg *lpg)
> +{
> +	const struct lpg_data *data = lpg->data;
> +	int i;
> +
> +	lpg->num_channels = data->num_channels;
> +	lpg->channels = devm_kcalloc(lpg->dev, data->num_channels,
> +				     sizeof(struct lpg_channel), GFP_KERNEL);
> +	if (!lpg->channels)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < data->num_channels; i++) {
> +		lpg->channels[i].lpg = lpg;
> +		lpg->channels[i].base = data->channels[i].base;
> +		lpg->channels[i].triled_mask = data->channels[i].triled_mask;
> +		lpg->channels[i].lut_mask = BIT(i);
> +	}
> +
> +	return 0;
> +}
> +
> +static int lpg_init_triled(struct lpg *lpg)
> +{
> +	struct device_node *np = lpg->dev->of_node;
> +	int ret;
> +
> +	/* Skip initialization if we don't have a triled block */
> +	if (!lpg->data->triled_base)
> +		return 0;
> +
> +	lpg->triled_base = lpg->data->triled_base;
> +	lpg->triled_has_atc_ctl = lpg->data->triled_has_atc_ctl;
> +	lpg->triled_has_src_sel = lpg->data->triled_has_src_sel;
> +
> +	if (lpg->triled_has_src_sel) {
> +		ret = of_property_read_u32(np, "qcom,power-source", &lpg->triled_src);
> +		if (ret || lpg->triled_src == 2 || lpg->triled_src > 3) {
> +			dev_err(lpg->dev, "invalid power source\n");
> +			return -EINVAL;
> +		}
> +	}
> +
> +	/* Disable automatic trickle charge LED */
> +	if (lpg->triled_has_atc_ctl)
> +		regmap_write(lpg->map, lpg->triled_base + TRI_LED_ATC_CTL, 0);
> +
> +	/* Configure power source */
> +	if (lpg->triled_has_src_sel)
> +		regmap_write(lpg->map, lpg->triled_base + TRI_LED_SRC_SEL, lpg->triled_src);
> +
> +	/* Default all outputs to off */
> +	regmap_write(lpg->map, lpg->triled_base + TRI_LED_EN_CTL, 0);
> +
> +	return 0;
> +}
> +
> +static int lpg_init_lut(struct lpg *lpg)
> +{
> +	const struct lpg_data *data = lpg->data;
> +	size_t bitmap_size;
> +
> +	if (!data->lut_base)
> +		return 0;
> +
> +	lpg->lut_base = data->lut_base;
> +	lpg->lut_size = data->lut_size;
> +
> +	bitmap_size = BITS_TO_BYTES(lpg->lut_size);
> +	lpg->lut_bitmap = devm_kzalloc(lpg->dev, bitmap_size, GFP_KERNEL);
> +	if (!lpg->lut_bitmap)
> +		return -ENOMEM;
> +
> +	bitmap_clear(lpg->lut_bitmap, 0, lpg->lut_size);
> +
> +	return 0;
> +}
> +
> +static int lpg_probe(struct platform_device *pdev)
> +{
> +	struct device_node *np;
> +	struct lpg *lpg;
> +	int ret;
> +	int i;
> +
> +	lpg = devm_kzalloc(&pdev->dev, sizeof(*lpg), GFP_KERNEL);
> +	if (!lpg)
> +		return -ENOMEM;
> +
> +	lpg->data = of_device_get_match_data(&pdev->dev);
> +	if (!lpg->data)
> +		return -EINVAL;
> +
> +	lpg->dev = &pdev->dev;
> +
> +	lpg->map = dev_get_regmap(pdev->dev.parent, NULL);
> +	if (!lpg->map) {
> +		dev_err(&pdev->dev, "parent regmap unavailable\n");
> +		return -ENXIO;
> +	}
> +
> +	ret = lpg_init_channels(lpg);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = lpg_parse_dtest(lpg);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = lpg_init_triled(lpg);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = lpg_init_lut(lpg);
> +	if (ret < 0)
> +		return ret;
> +
> +	for_each_available_child_of_node(pdev->dev.of_node, np) {
> +		ret = lpg_add_led(lpg, np);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	for (i = 0; i < lpg->num_channels; i++)
> +		lpg_apply_dtest(&lpg->channels[i]);
> +
> +	ret = lpg_add_pwm(lpg);
> +	if (ret)
> +		return ret;
> +
> +	platform_set_drvdata(pdev, lpg);
> +
> +	return 0;
> +}
> +
> +static int lpg_remove(struct platform_device *pdev)
> +{
> +	struct lpg *lpg = platform_get_drvdata(pdev);
> +
> +	pwmchip_remove(&lpg->pwm);
> +
> +	return 0;
> +}
> +
> +static const struct lpg_data pm8916_pwm_data = {
> +	.pwm_9bit_mask = BIT(2),
> +
> +	.num_channels = 1,
> +	.channels = (struct lpg_channel_data[]) {
> +		{ .base = 0xbc00 },
> +	},
> +};
> +
> +static const struct lpg_data pm8941_lpg_data = {
> +	.lut_base = 0xb000,
> +	.lut_size = 64,
> +
> +	.triled_base = 0xd000,
> +	.triled_has_atc_ctl = true,
> +	.triled_has_src_sel = true,
> +
> +	.pwm_9bit_mask = 3 << 4,
> +
> +	.num_channels = 8,
> +	.channels = (struct lpg_channel_data[]) {
> +		{ .base = 0xb100 },
> +		{ .base = 0xb200 },
> +		{ .base = 0xb300 },
> +		{ .base = 0xb400 },
> +		{ .base = 0xb500, .triled_mask = BIT(5) },
> +		{ .base = 0xb600, .triled_mask = BIT(6) },
> +		{ .base = 0xb700, .triled_mask = BIT(7) },
> +		{ .base = 0xb800 },
> +	},
> +};
> +
> +static const struct lpg_data pm8994_lpg_data = {
> +	.lut_base = 0xb000,
> +	.lut_size = 64,
> +
> +	.pwm_9bit_mask = 3 << 4,
> +
> +	.num_channels = 6,
> +	.channels = (struct lpg_channel_data[]) {
> +		{ .base = 0xb100 },
> +		{ .base = 0xb200 },
> +		{ .base = 0xb300 },
> +		{ .base = 0xb400 },
> +		{ .base = 0xb500 },
> +		{ .base = 0xb600 },
> +	},
> +};
> +
> +static const struct lpg_data pmi8994_lpg_data = {
> +	.lut_base = 0xb000,
> +	.lut_size = 24,
> +
> +	.triled_base = 0xd000,
> +	.triled_has_atc_ctl = true,
> +	.triled_has_src_sel = true,
> +
> +	.pwm_9bit_mask = BIT(4),
> +
> +	.num_channels = 4,
> +	.channels = (struct lpg_channel_data[]) {
> +		{ .base = 0xb100, .triled_mask = BIT(5) },
> +		{ .base = 0xb200, .triled_mask = BIT(6) },
> +		{ .base = 0xb300, .triled_mask = BIT(7) },
> +		{ .base = 0xb400 },
> +	},
> +};
> +
> +static const struct lpg_data pmi8998_lpg_data = {
> +	.lut_base = 0xb000,
> +	.lut_size = 49,
> +
> +	.triled_base = 0xd000,
> +
> +	.pwm_9bit_mask = BIT(4),
> +
> +	.num_channels = 6,
> +	.channels = (struct lpg_channel_data[]) {
> +		{ .base = 0xb100 },
> +		{ .base = 0xb200 },
> +		{ .base = 0xb300, .triled_mask = BIT(5) },
> +		{ .base = 0xb400, .triled_mask = BIT(6) },
> +		{ .base = 0xb500, .triled_mask = BIT(7) },
> +		{ .base = 0xb600 },
> +	},
> +};
> +
> +static const struct lpg_data pm8150b_lpg_data = {
> +	.lut_base = 0xb000,
> +	.lut_size = 49,
> +
> +	.triled_base = 0xd000,


For the LED peripheral under PM8150B we've some quirks. If one of the channels is enabled, then we need to do an additional SDAM register write to trigger a PBS (programmable boot sequence).

This is required to set the headroom voltage of BOB peripheral that is on PM8150L PMIC. When both the LED channels are disabled, a similar register write has to be made

again to trigger the PBS again to unvote the headroom voltage request made before.


> +
> +	.pwm_9bit_mask = BIT(4),
> +
> +	.num_channels = 2,
> +	.channels = (struct lpg_channel_data[]) {
> +		{ .base = 0xb100, .triled_mask = BIT(7) },
> +		{ .base = 0xb200, .triled_mask = BIT(6) },
> +	},
> +};
> +
> +static const struct lpg_data pm8150l_lpg_data = {
> +	.lut_base = 0xb000,
> +	.lut_size = 49,
> +
> +	.triled_base = 0xd000,
> +
> +	.pwm_9bit_mask = BIT(4),
> +
> +	.num_channels = 5,


Not a big concern but I'm wondering how to represent 2 different blocks of HW from a PMIC here. First one is a LPG peripheral with 3 channels starting from 0xb100 which is consumed for TRI_LED.

Second one is a PWM peripheral with 2 channel starting from 0xbc00 which can never use LUT specified above. Looks like here you want to represent them as a whole. But in the case, if

an user wants to use the PWM channel (not a LPG channel) along with LUT, it shouldn't be supported. Can this be enforced by allowing LUT to be configured only for a peripheral of subtype LPG?


> +	.channels = (struct lpg_channel_data[]) {
> +		{ .base = 0xb100, .triled_mask = BIT(7) },
> +		{ .base = 0xb200, .triled_mask = BIT(6) },
> +		{ .base = 0xb300, .triled_mask = BIT(5) },
> +		{ .base = 0xbc00 },
> +		{ .base = 0xbd00 },
> +
> +	},
> +};
> +
> +static const struct of_device_id lpg_of_table[] = {
> +	{ .compatible = "qcom,pm8150b-lpg", .data = &pm8150b_lpg_data },
> +	{ .compatible = "qcom,pm8150l-lpg", .data = &pm8150l_lpg_data },
> +	{ .compatible = "qcom,pm8916-pwm", .data = &pm8916_pwm_data },
> +	{ .compatible = "qcom,pm8941-lpg", .data = &pm8941_lpg_data },
> +	{ .compatible = "qcom,pm8994-lpg", .data = &pm8994_lpg_data },
> +	{ .compatible = "qcom,pmi8994-lpg", .data = &pmi8994_lpg_data },
> +	{ .compatible = "qcom,pmi8998-lpg", .data = &pmi8998_lpg_data },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(of, lpg_of_table);
> +
> +static struct platform_driver lpg_driver = {
> +	.probe = lpg_probe,
> +	.remove = lpg_remove,
> +	.driver = {
> +		.name = "qcom-spmi-lpg",
> +		.of_match_table = lpg_of_table,
> +	},
> +};
> +module_platform_driver(lpg_driver);
> +
> +MODULE_DESCRIPTION("Qualcomm LPG LED driver");
> +MODULE_LICENSE("GPL v2");


-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum, a Linux Foundation Collaborative Project

