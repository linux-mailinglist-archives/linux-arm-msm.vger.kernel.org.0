Return-Path: <linux-arm-msm+bounces-90450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4CGZFAYadmnXLgEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:26:30 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 96F7C80B5F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 14:26:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id DDEFF300274A
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 Jan 2026 13:21:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3BF6D31A7FD;
	Sun, 25 Jan 2026 13:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NVR9As79"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 729731B81CA
	for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 13:21:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769347294; cv=none; b=C98/94BRTSeT8LcCNJXG/Px1dAD8A5QEFl0eRzkBy/JoaoOPxp0Cl3ENNFxEuB2X5IeEw4eWbq+Cfd4x9DsNkOmMv34HN+PyIdJiD2mPqhLgxBXPIVct1wcpaF3fS3b8W8x2wmY3tXpoHgz79PIjr2HRSm+n7lKCEc4bjAtb53g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769347294; c=relaxed/simple;
	bh=t2Vnth4pLXmngaQz4oz8DOhdfKRlEIrLXEvo5xHEthY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SDAB08z3RR4Bva5Y166Z/hz4Dqomnvgv5mTcTCrITTMkASqPe1S08CAOc0skvpmcjC+9qJ5EIPza8xgwvToErpofX/x71eZRfsmx/+3gQXAZPs+ck0sKif0HX/PCowDSzEc/2ABASOVNpWAjVkuuY2u4lSxQ49HU3p+Xj87/QDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NVR9As79; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-47ee3a63300so41893555e9.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 25 Jan 2026 05:21:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1769347291; x=1769952091; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+XYIwuBOf+rKUtpJWTb5kSlSAnO99KDliXLsbnLZ79U=;
        b=NVR9As79yB4H+Wlk2GLc/MvVN5IzM9/za5pESMc/Fm6NoWbvG/zjKkV7IzjTvxogcX
         LVOyHa0hXeXGC0SNf8spCqynDzEyRBhO6iXx+PfJwjE7GQppX5aWFESBeD7jkBpz7mto
         rmmD1h0RgbguEbTgoF5kRQkx6F9e09Wub2U1BzO9g98iFiLEOxn0L4hw0oPROJfBIxLl
         HhlYGQJZQ08AHbMdFzKvwB7n9o95MNmnjCA85C7j2nVgBexFxMsoKAEx4ZIjB37cqP4E
         OM0yfaTIdzNdHYsAlvehEhJ6laCFeG4WQcY2Po4GGlFMiUG5aH6gNJxNwUTMEOjiAEjx
         FwCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769347291; x=1769952091;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+XYIwuBOf+rKUtpJWTb5kSlSAnO99KDliXLsbnLZ79U=;
        b=f6UbdLUZR7g+AL0QNpjh+PAjRsiOPbE3W2OLrtiyCBtdxtyIVsVMAMVperV8WdQxwt
         8EZ/c42aj4UBxkK5LSspfNpp3LYRFjOmihMPGIOz6oi3Lh6zjaKiHE/NbrDg8zrxl+PL
         bbcPc02NHZPmRQ6cSdlNBu4hdbwHrZ11brWQ6Vs0PuJzuHTNHc6XTh2sAkQ58oYmvcZT
         JEbZ2C+koi84HKQ3IU9Jvgu4fZkYEaIirKAwtgYLPat8wAy4SX5dyG4RCvAn9kkCQFlX
         Ut6SzlDdq60heytFqLoU18UAiSnwFFtMvvoMXYYR5GmIhMYbhVCnXrtkoW4BDftNbCs1
         wDpQ==
X-Gm-Message-State: AOJu0YzvKrxFgjEbMAFk0CyB6D/jejfiDmSilY90A6UlojfiyRcEX/Yc
	t5PctROev552RONbHtGhL8Oq1TjFiBlW4EnSDbOn3Bv7BoA+orWRgQbF04xhyWcsM4E=
X-Gm-Gg: AZuq6aLmo8RBjuO8oOLhlkS8qG09IQ+heYLGNezL1q9dfg+OAQoElww4aIFfXKUe2JO
	uaQYmYXbdo9UC9NxTw68KkUHZMJfpFgfGtCaMUr40izjpEp+rpznliCGDuTRbC1chhbPNk7RRfP
	rtqJoGkXlUI01mZrb+tMoSh3suPhOHYuY9ADxlNG5AD82Sd5L92jVipK0V0leK5joSA/gYP8ahc
	Ul9xeRamqerus3+D4Q/mA+s44MU2m2i95PrLcdkTKKztdV87e4z9LfR8rOoDJaUbk4eeOhruEvl
	EQTW0/p/rJmetLaNMxvlj3tSXRPJO3HLlNJshxramziBSPxTct+EGAETC0eXMGjt+18FRU1fXnA
	Mk5OIWdL+Yx5YXLrm/EVrIu1Sf7JvunguQKeNYFLFR+R4qYMenN3I2HrMC69I2CLPHufJ8gXCdA
	MyrOzzjRH6N70tEtpsMj0KvgDmjLjQv4+29zqr+Vn6+j4YSwFtbeUP
X-Received: by 2002:a05:600c:3b93:b0:477:af8d:203a with SMTP id 5b1f17b1804b1-4805d064549mr26288675e9.27.1769347290741;
        Sun, 25 Jan 2026 05:21:30 -0800 (PST)
Received: from [192.168.0.40] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804f5ad4c1sm70848225e9.12.2026.01.25.05.21.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 25 Jan 2026 05:21:30 -0800 (PST)
Message-ID: <52133fc4-9b4e-4ef4-8e04-a392d9c71da8@linaro.org>
Date: Sun, 25 Jan 2026 13:21:28 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: i2c: ov02c10: Enforce cool-down period to prevent
 brownout
To: Saikiran <bjsaikiran@gmail.com>, linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org, rfoss@kernel.org, todor.too@gmail.com,
 bod@kernel.org, vladimir.zapolskiy@linaro.org, hansg@kernel.org,
 sakari.ailus@linux.intel.com, mchehab@kernel.org
References: <20260124071751.5885-1-bjsaikiran@gmail.com>
 <20260124071751.5885-4-bjsaikiran@gmail.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20260124071751.5885-4-bjsaikiran@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[linaro.org,none];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[linaro.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[vger.kernel.org,kernel.org,gmail.com,linaro.org,linux.intel.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[bounces-90450-lists,linux-arm-msm=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:+];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bryan.odonoghue@linaro.org,linux-arm-msm@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCPT_COUNT_SEVEN(0.00)[10];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,linaro.org:mid,linaro.org:dkim]
X-Rspamd-Queue-Id: 96F7C80B5F
X-Rspamd-Action: no action

On 24/01/2026 07:17, Saikiran wrote:
> The OV02C10 sensor is susceptible to brownout/latch-up states when
> power-cycled rapidly (e.g., within 50-100ms). This often occurs during
> userspace interactions like browser WebRTC permissions checks, where
> the device is opened, closed, and reopened in quick succession.
> 
> When this happens, the regulator discharge is incomplete, and the
> sensor fails to perform a clean Power-On Reset (POR). The internal
> microcontroller locks up, resulting in I2C timeouts ("failed to set
> mode") and necessitating a full system reboot to recover the camera.
> 
> To prevent this, implement a mandatory cool-down period. The driver
> now tracks the timestamp of the last power-off. If a power-on attempt
> occurs within 3 seconds of the last power-off, the driver sleeps for
> the remaining duration to ensure physical power rails have fully
> discharged and the sensor has completely reset before voltage is
> re-applied.

3 seconds ????????????

This seems completely wrong.

I think we should look at - again - improving/fixing the power_on() 
logic to ensure we

- Put the reset pin into a known state
- Carefully apply clock and power as per chip stipulations
- Try to capture the T timings either with documentation or
   trial and error

That is to say getting the power-on function right should fix this. 
Likely we are going through power_on() incorrectly for one of the 
timings to correctly bring the chip into the right state - or not 
respecting the gap between power-on and first CCI or first stream.

Since this code has mostly been developed used on x86/ACPI systems it is 
entirely plausible that the OSPM agent on x86 does stuff around 
reset/power-on that we don't have in !ACPI world.

Lets take a quick look.

Minimum XVCLK freq is 6 MHz.

t1: XSHUTDN min 5 unit milliseconds
t2: first CCI min 8192 XVCLK cycles
     @ 6MHz this is 1365361 nanoseconds
     1.37 milliseconds
t3: MIPI CLK start time max 8192 XVCLK cycles
t4: First data on MIPI bus - variable
t5: infinite nanoseconds

power_on() {
	- XSHUTDOWN is assumed be be asserted
	- XVCLK is assumed to be freerunning i.e. already started and
	  stable prior to the next step
	- T5: DOVDD, AVDD, DVDD power on = potentially infinite
	  Hardware standby period
	- T2: First CCI
}

stream_on() {
	- T3: Time it take for MIPI MCP/MCN clock to start = 8192 XVCLKs
	- T4: First time to data is variable but, this is irrelevant
}

T3: T3: the time from XSHUTOWN/VDD off to power_off unspecified.

power_off() {
	- XSHUTDOWN
	- T3: hardware standby period
	- VDD shutdown
}

In the code, we don't assert reset in power_on() - so we are reliant on 
power_off(); to have run and completed and that XSHUTDOWN is in the 
logical state we expect.

Try something like:

diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
index cf93d36032e14..ab68fc3a971f8 100644
--- a/drivers/media/i2c/ov02c10.c
+++ b/drivers/media/i2c/ov02c10.c
@@ -661,6 +661,7 @@ static int ov02c10_power_off(struct device *dev)
         struct ov02c10 *ov02c10 = to_ov02c10(sd);

         gpiod_set_value_cansleep(ov02c10->reset, 1);
+       usleep_range(2000, 2200);

         regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
                                ov02c10->supplies);
@@ -676,12 +677,21 @@ static int ov02c10_power_on(struct device *dev)
         struct ov02c10 *ov02c10 = to_ov02c10(sd);
         int ret;

+       if (ov02c10->reset) {
+               /* Ensure reset is asserted before trying to power_on */
+               gpiod_set_value_cansleep(ov02c10->reset, 1);
+               usleep_range(2000, 2200);
+       }
+
         ret = clk_prepare_enable(ov02c10->img_clk);
         if (ret < 0) {
                 dev_err(dev, "failed to enable imaging clock: %d", ret);
                 return ret;
         }

+       /* Let the clock stabilise */
+       usleep_range(2000, 2200);
+
         ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
                                     ov02c10->supplies);
         if (ret < 0) {
@@ -694,6 +704,7 @@ static int ov02c10_power_on(struct device *dev)
                 /* Assert reset for at least 2ms on back to back off-on */
                 usleep_range(2000, 2200);
                 gpiod_set_value_cansleep(ov02c10->reset, 0);
+               /* This is where we need to capture power_on() T2 */
                 usleep_range(5000, 5100);
         }

> Additionally, standard Power-On-Reset logic is refined:
> 1. Ensure MCLK is disabled BEFORE regulators during power-off to
>     prevent phantom power injection.
> 2. Assert the reset line (hold low) throughout the regulator ramp-up
>     phase to prevent indeterminate states.
> 
> Testing Results (10 rapid cycles each):
> 1. 900ms minimum gap:  Failed (brownout/timeout errors)
> 2. 1500ms minimum gap: Failed (intermittent failures)
> 3. 2000ms minimum gap: Reliable (0 failures in 50+ test cycles)
> 4. 3000ms minimum gap: Reliable (excessive, 2s is sufficient)
> 
> The 3-second check window with 2-second minimum enforcement provides
> the optimal balance between reliability and responsiveness.
> 
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>
> ---
>   drivers/media/i2c/ov02c10.c | 63 +++++++++++++++++++++++++++++++------
>   1 file changed, 54 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index db191dccff75..7e9454e8540c 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -389,6 +389,9 @@ struct ov02c10 {
>   	/* MIPI lane info */
>   	u32 link_freq_index;
>   	u8 mipi_lanes;
> +
> +	/* Power cycling rate limit */
> +	ktime_t last_power_off;
>   };
>   
>   static inline struct ov02c10 *to_ov02c10(struct v4l2_subdev *subdev)
> @@ -616,6 +619,13 @@ static int ov02c10_enable_streams(struct v4l2_subdev *sd,
>   	if (ret)
>   		goto out;
>   
> +	/*
> +	 * Delay before streaming:
> +	 * Give the sensor time to process all the register writes and internal
> +	 * calibration before we assert the STREAM_ON bit.
> +	 */
> +	usleep_range(2000, 2500);
> +
>   	ret = cci_write(ov02c10->regmap, OV02C10_REG_STREAM_CONTROL, 1, NULL);
>   out:
>   	if (ret)
> @@ -670,12 +680,25 @@ static int ov02c10_power_off(struct device *dev)
>   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>   	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>   
> +	/* 1. Assert Reset */
>   	gpiod_set_value_cansleep(ov02c10->reset, 1);
>   
> +	/* 2. Disable Clock (Stop sensor state machine) */
> +	clk_disable_unprepare(ov02c10->img_clk);
> +	usleep_range(1000, 1500);
> +
> +	/* 3. Disable Power */
>   	regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
>   			       ov02c10->supplies);
>   
> -	clk_disable_unprepare(ov02c10->img_clk);
> +	/*
> +	 * 4. Discharge Wait
> +	 * Wait for regulators to fully discharge before returning.
> +	 * This delay ensures clean power cycling.
> +	 */
> +	usleep_range(50000, 55000);
> +
> +	ov02c10->last_power_off = ktime_get();
>   
>   	return 0;
>   }
> @@ -685,26 +708,48 @@ static int ov02c10_power_on(struct device *dev)
>   	struct v4l2_subdev *sd = dev_get_drvdata(dev);
>   	struct ov02c10 *ov02c10 = to_ov02c10(sd);
>   	int ret;
> +	s64 delta_us;
>   
> -	ret = clk_prepare_enable(ov02c10->img_clk);
> -	if (ret < 0) {
> -		dev_err(dev, "failed to enable imaging clock: %d", ret);
> -		return ret;
> +	/*
> +	 * Mandatory Cool-Down:
> +	 * If the camera was powered off within the last 3 seconds, ensure at least
> +	 * 2 seconds have elapsed to allow full regulator discharge and sensor reset.
> +	 * This prevents brownouts during rapid open/close/open sequences.
> +	 */
> +	delta_us = ktime_us_delta(ktime_get(), ov02c10->last_power_off);
> +	if (delta_us < 3000000) {
> +		dev_dbg(dev, "Enforcing %lld us cool-down period\n", 2000000 - delta_us);
> +		fsleep(2000000 - delta_us);
>   	}
>   
> +	/*
> +	 * Standard Power-Up Sequence:
> +	 * 1. Enable Regulators
> +	 * 2. Enable Clock
> +	 * 3. Release Reset (with ample boot time)
> +	 */
> +
>   	ret = regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
>   				    ov02c10->supplies);
>   	if (ret < 0) {
>   		dev_err(dev, "failed to enable regulators: %d", ret);
> -		clk_disable_unprepare(ov02c10->img_clk);
>   		return ret;
>   	}
>   
> +	ret = clk_prepare_enable(ov02c10->img_clk);
> +	if (ret < 0) {
> +		dev_err(dev, "failed to enable imaging clock: %d", ret);
> +		regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> +				       ov02c10->supplies);
> +		return ret;
> +	}
> +
> +	/* Wait for power/clock to stabilize */
> +	usleep_range(5000, 5500);
> +
>   	if (ov02c10->reset) {
> -		/* Assert reset for at least 2ms on back to back off-on */
> -		usleep_range(5000, 5500);
>   		gpiod_set_value_cansleep(ov02c10->reset, 0);
> -		usleep_range(20000, 21000);
> +		usleep_range(80000, 85000);
>   	}
>   
>   	return 0;


