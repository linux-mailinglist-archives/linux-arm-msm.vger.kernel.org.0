Return-Path: <linux-arm-msm+bounces-54731-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 54145A93667
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 13:19:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 68D124626F3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 18 Apr 2025 11:19:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6675F2749D1;
	Fri, 18 Apr 2025 11:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QYoA0iQG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF3B4A945
	for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 11:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744975150; cv=none; b=PRyX6oGMFiZJOrdk9YkoRd2tYOS0I+GhrZdTkQitt8VO8503IJSq++H7O2UDpC+uqCFs4im2eV9VAaSofUJNE7w+uih/1KKJrNF8ASDcKd++jqnriKBeNuACP9SN06hxYoZ5YxH5EeQVJjyvqeYPOCzqba4H5dKhX6POZZ/KYd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744975150; c=relaxed/simple;
	bh=gSs5GssrItXYqiejUmj1Jyjk3xws2Twm+3gJmUYQ1Vg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b/jBUuA+xtKLI1jxHL9iIxtFseQ7f1Uxwc0f7wjTQclOHbKnefZhU9gu+v5XoYdyzVtExk3mihpio0F5EZvVq8bxWDg5UAArXB45izehaBjEkbyaN4AZN4tAGI58cT7a4b54yX6wzRmV81rxJuFfvuEjyFpyiFnOKCDPs8XNFNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QYoA0iQG; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ede096d73so12267875e9.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 18 Apr 2025 04:19:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744975145; x=1745579945; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QC1W3fWtNRiKUlEQ6dnQPD3aUpjIornXN6JbcJQ149Q=;
        b=QYoA0iQG/ckaTh9dfeH7U82OECCRiHpwZe3bEgzvJ9Cr0OgRUD8jhHijh28Dtcepdu
         CeCnywaa7YwuLqHisRe/w/VNZzwTiQjK1jPdbu2pHO/pv9SrH9QTCWZ8z0FgGhEm1KQQ
         Kyc0T2rYZLTqCmDOdCUco5C2zDjuX13WyuA5b7JRQzJO7oiKfFN5B+JND8bT9LL2tyfj
         WrB/oq4okrrmsp7PYdIj4PekcE6YXb6ejtXGUNFS0xZwLkgCxa8sf/s9hXDfPozBgNxa
         QzCzcKRifwDDXbSK4HDvCKPZk2ubPtYBg8XCznjPxW2lWmsyVi46avxztVdPzHTVDJNe
         qeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744975145; x=1745579945;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QC1W3fWtNRiKUlEQ6dnQPD3aUpjIornXN6JbcJQ149Q=;
        b=UbjfffmEILsrbdQsaBnxS+CY1TUT6DBqUSp63DqGzIx81ng/hQtvQqyLSjWz5pUW55
         oUDSN2YUix0O1t4RcuHAt0Y/uzEYxpIZ4MGZg16dPz01eR0MofzQ94qPfAZu8Wfo62cE
         cA1B+okbwxZIbBYaDpnl3Xa4PusBBOEUX4OyFLd9QwVKht8I40zeZ01mYn0hKipVDgSr
         1KocYQRKLd4I52SpcLbbB9ErKrhGKmbolQ1lXxB9AAbguOTXQrhrdS9MpzQwlgbwAr2Z
         W4Lo7ZzJ72llouoStHdxXZvLcDhA/2Kto3FTjEEMhDFqtQ0uFn2uiZMz2QG1EL3zYkUN
         PCZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvfpt2lNRlPDdqkBnXUaHDU7AICXYqkBOxgiqZzvUw8V8XoDaTEccC654G6kL5QzL858LDFHCWQgyrPjvH@vger.kernel.org
X-Gm-Message-State: AOJu0YxzPmL93n3lpK/KwpL1ev90s0vNdPR0LITBUgVh+DsiPOE9fbqn
	h+tMullgjtPajQWpFc21RL47oSr/dWmUiJdS1tIoBXhBsNswSC+83pIU2qVn1Ig=
X-Gm-Gg: ASbGnctDH7sC6ji7OihIhQ/jc061u6Dr7qThtaNdITTDeynKsX6vcEeeMQFDtJFpa5g
	9lJOEARh85uOKAEQWjL7T1c3x0qE315URR/Ss/jVhp2NkUMXwvL9mltCq6iLKFTrHCw8eZi8Prs
	xrupzj/RKYCmZWsdtN5MqgM+7h2OZm7a2rwbcbTM2Q755++/BkW1jz7EFxcH7ei2vTQLeSNoUAc
	7yu5EIjUG2QREZVy3Tc+b1cIGT2NsA2QwM183tRwO9L30T2kPLwJawxqUIaKAii9dx6cbdzBZ34
	SVbHI/gzoYNhR4M0n0R9Kh8CMyKoe800N+4SUXpVgeGt/KlfBZ+fnm4JutptBX8d3cSx2QjLLMg
	f9oE=
X-Google-Smtp-Source: AGHT+IExdYAU6Oh5tSrYbpbjA2C4dsLbKfVF/oPwxj7qR9b5UJ9JqRTHgG8WmKn+Hx2vHu3ZeVCyJg==
X-Received: by 2002:a05:600c:54c7:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-4407076031dmr6899265e9.15.1744975145049;
        Fri, 18 Apr 2025 04:19:05 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-44034fc8886sm79315865e9.0.2025.04.18.04.19.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 04:19:04 -0700 (PDT)
Date: Fri, 18 Apr 2025 13:19:02 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
	rui.zhang@intel.com, lukasz.luba@arm.com,
	david.collins@oss.qualcomm.com, srinivas.kandagatla@linaro.org,
	stefan.schmidt@linaro.org, quic_tsoni@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org, dmitry.baryshkov@linaro.org
Subject: Re: [PATCH v3 4/5 RESEND] thermal: qcom-spmi-temp-alarm: add support
 for GEN2 rev 2 PMIC peripherals
Message-ID: <aAI1JnQ2yCjtJL9u@mai.linaro.org>
References: <20250320202408.3940777-1-anjelique.melendez@oss.qualcomm.com>
 <20250320202408.3940777-5-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250320202408.3940777-5-anjelique.melendez@oss.qualcomm.com>

On Thu, Mar 20, 2025 at 01:24:07PM -0700, Anjelique Melendez wrote:
> Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
> revision 2.  This revision utilizes individual temp DAC registers
> to set the threshold temperature for over-temperature stages 1,
> 2, and 3 instead of a single register to specify a set of
> thresholds.

Can you elaborate what are the different stages in the QCom semantic ?
 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 136 ++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> index 514772e94a28..efd2b6534127 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -26,6 +26,11 @@
>  #define QPNP_TM_REG_SHUTDOWN_CTRL1	0x40
>  #define QPNP_TM_REG_ALARM_CTRL		0x46
>  
> +/* TEMP_DAC_STGx registers are only present for TEMP_GEN2 v2.0 */
> +#define QPNP_TM_REG_TEMP_DAC_STG1	0x47
> +#define QPNP_TM_REG_TEMP_DAC_STG2	0x48
> +#define QPNP_TM_REG_TEMP_DAC_STG3	0x49
> +
>  #define QPNP_TM_TYPE			0x09
>  #define QPNP_TM_SUBTYPE_GEN1		0x08
>  #define QPNP_TM_SUBTYPE_GEN2		0x09
> @@ -65,6 +70,25 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
>  
>  #define TEMP_STAGE_HYSTERESIS		2000
>  
> +/*
> + * For TEMP_GEN2 v2.0, TEMP_DAC_STG1/2/3 registers are used to set the threshold
> + * for each stage independently.
> + * TEMP_DAC_STG* = 0 --> 80 C
> + * Each 8 step increase in TEMP_DAC_STG* value corresponds to 5 C (5000 mC).
> + */
> +#define TEMP_DAC_MIN			80000
> +#define TEMP_DAC_SCALE_NUM		8
> +#define TEMP_DAC_SCALE_DEN		5000
> +
> +#define TEMP_DAC_TEMP_TO_REG(temp) \
> +	(((temp) - TEMP_DAC_MIN) * TEMP_DAC_SCALE_NUM / TEMP_DAC_SCALE_DEN)
> +#define TEMP_DAC_REG_TO_TEMP(reg) \
> +	(TEMP_DAC_MIN + (reg) * TEMP_DAC_SCALE_DEN / TEMP_DAC_SCALE_NUM)
> +
> +static const long temp_dac_max[STAGE_COUNT] = {
> +	119375, 159375, 159375
> +};
> +
>  /* Temperature in Milli Celsius reported during stage 0 if no ADC is present */
>  #define DEFAULT_TEMP			37000
>  
> @@ -73,6 +97,7 @@ struct qpnp_tm_chip;
>  struct spmi_temp_alarm_data {
>  	const struct thermal_zone_device_ops *ops;
>  	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
> +	int (*setup)(struct qpnp_tm_chip *chip);
>  	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
>  	int (*configure_trip_temps)(struct qpnp_tm_chip *chip);
>  };
> @@ -88,6 +113,7 @@ struct qpnp_tm_chip {
>  	unsigned int			thresh;
>  	unsigned int			stage;
>  	unsigned int			base;
> +	unsigned int			ntrips;
>  	/* protects .thresh, .stage and chip registers */
>  	struct mutex			lock;
>  	bool				initialized;
> @@ -305,6 +331,52 @@ static const struct thermal_zone_device_ops qpnp_tm_sensor_ops = {
>  	.set_trip_temp = qpnp_tm_set_trip_temp,
>  };
>  
> +static int qpnp_tm_gen2_rev2_set_temp_thresh(struct qpnp_tm_chip *chip, int trip, int temp)
> +{
> +	int ret, temp_cfg;
> +	u8 reg;
> +
> +	if (trip < 0 || trip >= STAGE_COUNT) {
> +		dev_err(chip->dev, "invalid TEMP_DAC trip = %d\n", trip);
> +		return -EINVAL;
> +	} else if (temp < TEMP_DAC_MIN || temp > temp_dac_max[trip]) {
> +		dev_err(chip->dev, "invalid TEMP_DAC temp = %d\n", temp);
> +		return -EINVAL;
> +	}
> +
> +	reg = TEMP_DAC_TEMP_TO_REG(temp);
> +	temp_cfg = TEMP_DAC_REG_TO_TEMP(reg);
> +
> +	ret = qpnp_tm_write(chip, QPNP_TM_REG_TEMP_DAC_STG1 + trip, reg);
> +	if (ret < 0) {
> +		dev_err(chip->dev, "TEMP_DAC_STG write failed, ret=%d\n", ret);
> +		return ret;
> +	}
> +
> +	chip->temp_thresh_map[trip] = temp_cfg;
> +
> +	return 0;
> +}
> +
> +static int qpnp_tm_gen2_rev2_set_trip_temp(struct thermal_zone_device *tz,
> +					   const struct thermal_trip *trip, int temp)
> +{
> +	unsigned int trip_index = THERMAL_TRIP_PRIV_TO_INT(trip->priv);
> +	struct qpnp_tm_chip *chip = thermal_zone_device_priv(tz);
> +	int ret;
> +
> +	mutex_lock(&chip->lock);
> +	ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, trip_index, temp);
> +	mutex_unlock(&chip->lock);
> +
> +	return ret;
> +}
> +
> +static const struct thermal_zone_device_ops qpnp_tm_gen2_rev2_sensor_ops = {
> +	.get_temp = qpnp_tm_get_temp,
> +	.set_trip_temp = qpnp_tm_gen2_rev2_set_trip_temp,
> +};
> +
>  static irqreturn_t qpnp_tm_isr(int irq, void *data)
>  {
>  	struct qpnp_tm_chip *chip = data;
> @@ -329,6 +401,58 @@ static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
>  	return qpnp_tm_update_critical_trip_temp(chip, crit_temp);
>  }
>  
> +/* Configure TEMP_DAC registers based on DT thermal_zone trips */
> +static int qpnp_tm_gen2_rev2_configure_trip_temps_cb(struct thermal_trip *trip, void *data)
> +{
> +	struct qpnp_tm_chip *chip = data;
> +	int ret;
> +
> +	trip->priv = THERMAL_INT_TO_TRIP_PRIV(chip->ntrips);
> +	ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, chip->ntrips, trip->temperature);
> +	chip->ntrips++;
> +
> +	return ret;
> +}
> +
> +static int qpnp_tm_gen2_rev2_configure_trip_temps(struct qpnp_tm_chip *chip)
> +{
> +	int ret, i;
> +
> +	ret = thermal_zone_for_each_trip(chip->tz_dev,
> +					 qpnp_tm_gen2_rev2_configure_trip_temps_cb, chip);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* Verify that trips are strictly increasing. */
> +	for (i = 1; i < STAGE_COUNT; i++) {
> +		if (chip->temp_thresh_map[i] <= chip->temp_thresh_map[i - 1]) {
> +			dev_err(chip->dev, "Threshold %d=%ld <= threshold %d=%ld\n",
> +				i, chip->temp_thresh_map[i], i - 1,
> +				chip->temp_thresh_map[i - 1]);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* Read the hardware default TEMP_DAC stage threshold temperatures */
> +static int qpnp_tm_gen2_rev2_setup(struct qpnp_tm_chip *chip)
> +{
> +	int ret, i;
> +	u8 reg = 0;
> +
> +	for (i = 0; i < STAGE_COUNT; i++) {
> +		ret = qpnp_tm_read(chip, QPNP_TM_REG_TEMP_DAC_STG1 + i, &reg);
> +		if (ret < 0)
> +			return ret;
> +
> +		chip->temp_thresh_map[i] = TEMP_DAC_REG_TO_TEMP(reg);
> +	}
> +
> +	return 0;
> +}
> +
>  static const struct spmi_temp_alarm_data spmi_temp_alarm_data = {
>  	.ops = &qpnp_tm_sensor_ops,
>  	.temp_map = &temp_map_gen1,
> @@ -350,6 +474,13 @@ static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
>  	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
>  };
>  
> +static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev2_data = {
> +	.ops = &qpnp_tm_gen2_rev2_sensor_ops,
> +	.setup = qpnp_tm_gen2_rev2_setup,
> +	.configure_trip_temps = qpnp_tm_gen2_rev2_configure_trip_temps,
> +	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
> +};
> +
>  /*
>   * This function initializes the internal temp value based on only the
>   * current thermal stage and threshold. Setup threshold control and
> @@ -484,6 +615,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>  
>  	if (subtype == QPNP_TM_SUBTYPE_GEN1)
>  		chip->data = &spmi_temp_alarm_data;
> +	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 2)
> +		chip->data = &spmi_temp_alarm_gen2_rev2_data;
>  	else if (subtype == QPNP_TM_SUBTYPE_GEN2 && dig_major >= 1)
>  		chip->data = &spmi_temp_alarm_gen2_rev1_data;
>  	else if (subtype == QPNP_TM_SUBTYPE_GEN2)
> @@ -491,6 +624,9 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>  	else
>  		return -ENODEV;
>  
> +	if (chip->data->setup)
> +		chip->data->setup(chip);
> +
>  	/*
>  	 * Register the sensor before initializing the hardware to be able to
>  	 * read the trip points. get_temp() returns the default temperature
> -- 
> 2.34.1
> 

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

