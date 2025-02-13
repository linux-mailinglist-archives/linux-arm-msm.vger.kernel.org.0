Return-Path: <linux-arm-msm+bounces-47954-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2E5A350E8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 23:06:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 12D9E1882976
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 22:06:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C21020D50E;
	Thu, 13 Feb 2025 22:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iXUA2vlV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC927206F15
	for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 22:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739484386; cv=none; b=hhHvacqobMjuS6GW8+cljGmileTZGFqqX0N/83kyWVYkFvPxCT2hh3TZ8Kru/ypmtFN2beYzWIJXzfQSXiXWbo7IEOtIytXh9mvCAD3BfPlzRXRHNkmFVdKksyb+zCs3gWPT40DU+bYHewRCFBYQEaUNxhBPdM5TflbojD6jKeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739484386; c=relaxed/simple;
	bh=QgWauNEM6UChiF2hW2FQsCjcZMFqp8dWkRmKJhmndjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LnhlQytQxQX/l77yLEHADobIinIOXeKZoOu1Yv2hJTnPBugUN2IlMowlrM7sjiUKy/zJIW9p4g8KaN9RNcJu5Jv3lgh81csEh7SYkP1dZ4R+k06XyE2LE48OOjG/orkXH5JOPJM3HCP4+l85ijFeyR3o9zVvwJI0kY6DvisrHy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iXUA2vlV; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-308ec50eb3dso14656801fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2025 14:06:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739484383; x=1740089183; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0qlRazb6ocQz7umyRulN57yH+ZOew3i+7PgD6ClWrb4=;
        b=iXUA2vlVRNLQaNU5W7fYRG1X0wQovV1jb8ZnqNKacXPIbhINllHtmsBYhb7sJXT2lj
         8qB0TzEiE92rRE5QZN3g16b+qiSqD8X0oOqOChtKbPqJDjz2oP9+zpGWeenE2iB6Ua8T
         ZW7lueI8LT2F4p6Cw/C1efSs0amr0wbE1Iw5t1hrfdMrksmGHvsq8oy7N9+52AUuggYF
         wbctdIR7++sm06LMKpNXVjF9dI2CW8K2agjr9WdvYrjJPKuxtni6v3oMQnGtCRIRj9fP
         edRzeMIZ7o7tjEYwHBbZTIYoV0nLL5q7AD+CCkGyeZs5q1gtuKS2XiChzANdn6JsZxzV
         qu+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739484383; x=1740089183;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0qlRazb6ocQz7umyRulN57yH+ZOew3i+7PgD6ClWrb4=;
        b=NCkN8exZZmIDqasynByZ6uZK5yTvEwS3Vtv/kyejmjreio879vDHV286le4tQR5Eyh
         9CS0pdO7XNGileLBuvPaPocTagDLu+ryDTCYUZWLfR0I3sFc3OxrDMtm8xSDil3Sukoq
         WDNy2KLgK9y8zo7aaGFS74We0VYN1BN5uVpMhKnAwwiuU3pA6dYN9rsa5gkkNg0+PpVO
         f7bVtfGYKtAyV3ob4ZBpOMUMtWvADuT2x+HpigGOr+AQT6x00tp1xkOC3qEyxYrlX++6
         9zJHH8IvOIXtvvaDVconKMl6ZtqEyxD0zDGUHPMtv+dqzA327EghTj0zlt4exeV4AK8H
         d9/Q==
X-Forwarded-Encrypted: i=1; AJvYcCX0hzV/Pz5JPsNUzalKfRf2eNEjee9nBgCiRIBz10o4n69KBZvHd+vDVw0B9zdxbLdgYuvqtzVaWpzuG6Ht@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi/VGJlqYCgtiX+Jh3JwCbtHCXJZtx/wLvEUwGFjOxdnMbx2xX
	WVdtpvQtAqZtF3kBUSs0yOHowjiV59pdiFtV5tjCiYncMq1Jg8N/JgYajOsPnn4=
X-Gm-Gg: ASbGncs6InXK4A+XcjkYiP5CmXKWpZPaBgHyImwoVHPNIrT0ZtUnv/6gjdVEfUGsIZW
	kox0XgH8bz7+SJ/mj2d3mJwzejV8GPJIBy6cQR/boit6PpJjJttupwPsJenpF7l7bdTyrecRmHf
	rMJ0dA8qRaKzNGlaKIffkwea+cr7vykf4rDSQ0aQ84EH/ZWezHKy/pnoab+s0bTSo1wwp81C1Ju
	Rp20wah53YBfJtpnUxOceUHM4NSynlNpPYFc90B3Qw2KthaEnA8JYtAtz5OrzTbai6R1yIzY64k
	GOo80R7rWG6zNNnUDgdNoJvWeJUZ8cu8s+vxau8Z+gPLuyt5h0dQFiuxZ5Kkug1UYIOUbc0=
X-Google-Smtp-Source: AGHT+IGFdAPX0TuKH51GN0WgXQlA1GYV+eaaYHnYbmvkLSzL2/W7gj+s0MWz0QbrQTXEEAgNOhW9Gw==
X-Received: by 2002:a2e:bc16:0:b0:300:2a29:d47c with SMTP id 38308e7fff4ca-309036d731bmr35324221fa.24.1739484382886;
        Thu, 13 Feb 2025 14:06:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30910276839sm3248521fa.87.2025.02.13.14.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 14:06:21 -0800 (PST)
Date: Fri, 14 Feb 2025 00:06:19 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
Cc: amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org, 
	daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com, 
	david.collins@oss.qualcomm.com, linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] thermal: qcom-spmi-temp-alarm: add support for GEN2
 rev 2 PMIC peripherals
Message-ID: <3cwfckzxe32amd24b2mv72vuo63kra52dcjqksm4hux3vm3ckr@ym2ieq7w2ssq>
References: <20250213210403.3396392-1-anjelique.melendez@oss.qualcomm.com>
 <20250213210403.3396392-4-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213210403.3396392-4-anjelique.melendez@oss.qualcomm.com>

On Thu, Feb 13, 2025 at 01:04:02PM -0800, Anjelique Melendez wrote:
> Add support for TEMP_ALARM GEN2 PMIC peripherals with digital major
> revision 2.  This revision utilizes individual temp DAC registers
> to set the threshold temperature for over-temperature stages 1,
> 2, and 3 instead of a single register to specify a set of
> thresholds.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>  drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 136 ++++++++++++++++++++
>  1 file changed, 136 insertions(+)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> index af71d4238340..a10f368f2039 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -25,6 +25,11 @@
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
> @@ -64,6 +69,25 @@ static const long temp_map_gen2_v1[THRESH_COUNT][STAGE_COUNT] = {
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
> @@ -72,6 +96,7 @@ struct qpnp_tm_chip;
>  struct spmi_temp_alarm_data {
>  	const struct thermal_zone_device_ops *ops;
>  	const long (*temp_map)[THRESH_COUNT][STAGE_COUNT];
> +	int (*setup)(struct qpnp_tm_chip *chip);
>  	int (*get_temp_stage)(struct qpnp_tm_chip *chip);
>  	int (*configure_trip_temps)(struct qpnp_tm_chip *chip);
>  };
> @@ -87,6 +112,7 @@ struct qpnp_tm_chip {
>  	unsigned int			thresh;
>  	unsigned int			stage;
>  	unsigned int			base;
> +	unsigned int			ntrips;
>  	/* protects .thresh, .stage and chip registers */
>  	struct mutex			lock;
>  	bool				initialized;
> @@ -304,6 +330,52 @@ static const struct thermal_zone_device_ops qpnp_tm_sensor_ops = {
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
> @@ -328,6 +400,58 @@ static int qpnp_tm_configure_trip_temp(struct qpnp_tm_chip *chip)
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
> +static int qpnp_tm_gen2_rev2_init(struct qpnp_tm_chip *chip)

qpnp_tm_gen2_rev2_setup() (or rename the field to .init)

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
> @@ -349,6 +473,13 @@ static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev1_data = {
>  	.get_temp_stage = qpnp_tm_gen2_get_temp_stage,
>  };
>  
> +static const struct spmi_temp_alarm_data spmi_temp_alarm_gen2_rev2_data = {
> +	.ops = &qpnp_tm_gen2_rev2_sensor_ops,
> +	.setup = qpnp_tm_gen2_rev2_init,
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
With best wishes
Dmitry

