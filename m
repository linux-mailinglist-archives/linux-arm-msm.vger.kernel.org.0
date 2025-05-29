Return-Path: <linux-arm-msm+bounces-59812-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CF53AC7BD0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 12:34:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5F6C87AA9A0
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 10:33:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 00B2326B2D7;
	Thu, 29 May 2025 10:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LNJeyZPm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DACD3254B1B
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 10:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748514872; cv=none; b=PJOvsj1Us8Dv7bj9Gt8R52/nKp0hUAd/DrSSFrbsoPBy0Vc0I/WoznMS/ZSiuDKRK5GO59L14YU7IWMUE2yqNrFoJDB84wsxxZm4NUa2Bou4Zae28tswygxsMuNiiSi7NNkPTHAoF+buQeevP4g3FokmLrC0JSKHeoJ5wydWedw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748514872; c=relaxed/simple;
	bh=OLn0yjcyfm3UkHNoQjh9sE/IUKOkrxifgngY5zpEWGY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DyL7jEJ9lwYxNL3RFjMNs+4iN7tMuibvkwwRS7l9VVGVItWNDYhw4C0iv+HFEWhdQTbHzgou1GCyVLpUFdcWc++b7YDHhQtajBk78yW34IjBaPiiR8SlKvIhfY+PWNg60VJNU77tmzCJBvQv9v4WDYElXXREe8QCGvwf28SMmRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LNJeyZPm; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0ac853894so679573f8f.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 03:34:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748514869; x=1749119669; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H7XnyQzNX/drKQR10T94L+svKrfDQz7i/jR99c0lhmI=;
        b=LNJeyZPm1K/iLajVr5KmTdUHgV+UcxBw5bINJY5W0ehco53C8wkQxWL4SPMMplkJST
         piww+DS9fHtON7PJm5aH5ZHNtJBVsEMPD6JrINtbaNILQBlMX01VNnJSrHeGdsZDrugJ
         DJpkdpyC9x7Ms2X1PMzAiCJaLimsU1F+m9pmhIW01IYhWj8dtsaA3SSBd8T+uusKu9L3
         BN/vbTeel/s0QCfnN5V8EA2HRsE3U/Qx0REtugwVA5loWqnSvquSs3qRE8oUNUfwOppC
         4yB/eLP9Y/bSa048KO4bkYDFuQ9H9yFgI5OXmbU1M2+VxiQMTZRJ/6BOb7Cb6ZuqCL6t
         4Cug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748514869; x=1749119669;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H7XnyQzNX/drKQR10T94L+svKrfDQz7i/jR99c0lhmI=;
        b=kG/Be4gBxApbxCBQl5XcmXLuJvgwxW/mlzKZe2dkzbmgmtnfQKmvGR/8eJIrTa4a8T
         ijv1qKgOXB+1aiBkjCT+XMKXgEWh8ePwaZfR3dM0vhGi7nL8UPGd+uiqkagk380sbolV
         +Dd4GxSSDYNB0YklUBgTA9CwsT3H0US+i2uvqvrbxxOvUEMSlFiWndXSA1raC/OenG+B
         0I/AtpxNbHRMI+3YqKIkdv158vcPnfs4Xs6m60YsBXWIN1h9dw7mPtInFkUW6wdRkfFl
         Kf/y155MWVsscWFUVIywaemOIrxYW7ukqSojV8M9Xkoj1Kp6kOp/Ef/sVpDX6UXQpLZT
         oJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+jlV5q2SgqLFX4NsfVPK81aRa4j0Txc5r/0JOuHUUOtGXL4w7rxfPqRyGH4Whda4Evj+VvQte/AXCs/Nn@vger.kernel.org
X-Gm-Message-State: AOJu0YxszkSTDaUXtFQg9gWVFy75YHM1LPfVJNq2WqpRRHzg82xnQYZD
	S55/+xp7Ew16iWMbCDZ4u4krte/bFVigyvMHHnOASqeNfqCUpLVEyMyvmXmq1xcOHehXClMGCrE
	L3rbtzJY=
X-Gm-Gg: ASbGncuAr1vCdSbLvgjP3a9FQzSWFEcC+vN6gt5N/oT6W/yG1Qzqxa54So5PlZBGsIm
	QsziWliRlrZQcmsrkvzsnfM4vXMBx9BUpqq7QgiODgvJtvKIzmLnNI4hH/K5UF+3+YB0hEQCmNA
	KxjfPUWzMcGFwu8q59qv54AV+BxoYlj/1bVW+LFWFpcAOFEZbk5mG5b5f0wqbT5PWRISLuD9uvy
	KDX1pHIRRp/nYx3/MBSMpMEcS1oCf3+v8uOemSM6XT0/DSIBmGBEWnFG/jX9X2rXbNEzeF/+tCG
	ZtGygGV2oULa6ZXY+QlnXXpuxiJviQBfXXBlrizPRUqZrBZGzqo6/PubVln11EJU6Q+hdofSMy3
	4uxkXTl9YXCebVJVOPFEEIpIx4nk=
X-Google-Smtp-Source: AGHT+IFJ+vCc0Saq1NPdw5Cj12pfvhYMrQ1F1BPZvlG/AECXTZSodeN9++HB8oVZB4vb/Avl2dr7XQ==
X-Received: by 2002:a05:6000:288b:b0:3a4:e65d:b6d5 with SMTP id ffacd0b85a97d-3a4e65db6demr6935306f8f.1.1748514869111;
        Thu, 29 May 2025 03:34:29 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc03147sm16037435e9.14.2025.05.29.03.34.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 03:34:28 -0700 (PDT)
Message-ID: <895a0004-04df-4b7e-9855-bc0033ca650b@linaro.org>
Date: Thu, 29 May 2025 11:34:27 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/5] thermal: qcom-spmi-temp-alarm: enable stage 2
 shutdown when required
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
 amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
 daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
 srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
 quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
 <0nJRx6-RgYybx3jhgUDcxC9hIxr02feRJuYYgLa6lpO3DOSuQidQkRKKoqvQoV0x26UVeiV6G5XN8cMTZ9Ol5g==@protonmail.internalid>
 <20250528235026.4171109-2-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250528235026.4171109-2-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2025 00:50, Anjelique Melendez wrote:
> From: David Collins <david.collins@oss.qualcomm.com>
> 
> Certain TEMP_ALARM GEN2 PMIC peripherals need over-temperature
> stage 2 automatic PMIC partial shutdown to be enabled in order to

stage 2 should be hyphenated to stage-2

> avoid repeated faults in the event of reaching over-temperature
> stage 3.  Modify the stage 2 shutdown control logic to ensure that
> stage 2 shutdown is enabled on all affected PMICs.  Read the
> digital major and minor revision registers to identify these
> PMICs.
> 
> Signed-off-by: David Collins <david.collins@oss.qualcomm.com>
> Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
> ---
>   drivers/thermal/qcom/qcom-spmi-temp-alarm.c | 32 +++++++++++++++++++--
>   1 file changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> index a81e7d6e865f..47248a843591 100644
> --- a/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> +++ b/drivers/thermal/qcom/qcom-spmi-temp-alarm.c
> @@ -1,6 +1,7 @@
>   // SPDX-License-Identifier: GPL-2.0-only
>   /*
>    * Copyright (c) 2011-2015, 2017, 2020, The Linux Foundation. All rights reserved.
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.

Should have the year in it.

grep -r Copyright * | grep Qualcomm

>    */
> 
>   #include <linux/bitops.h>
> @@ -16,6 +17,7 @@
> 
>   #include "../thermal_hwmon.h"
> 
> +#define QPNP_TM_REG_DIG_MINOR		0x00
>   #define QPNP_TM_REG_DIG_MAJOR		0x01
>   #define QPNP_TM_REG_TYPE		0x04
>   #define QPNP_TM_REG_SUBTYPE		0x05
> @@ -78,6 +80,7 @@ struct qpnp_tm_chip {
>   	/* protects .thresh, .stage and chip registers */
>   	struct mutex			lock;
>   	bool				initialized;
> +	bool				require_s2_shutdown;
> 
>   	struct iio_channel		*adc;
>   	const long			(*temp_map)[THRESH_COUNT][STAGE_COUNT];
> @@ -255,7 +258,7 @@ static int qpnp_tm_update_critical_trip_temp(struct qpnp_tm_chip *chip,
> 
>   skip:
>   	reg |= chip->thresh;
> -	if (disable_s2_shutdown)
> +	if (disable_s2_shutdown && !chip->require_s2_shutdown)
>   		reg |= SHUTDOWN_CTRL1_OVERRIDE_S2;
> 
>   	return qpnp_tm_write(chip, QPNP_TM_REG_SHUTDOWN_CTRL1, reg);
> @@ -350,8 +353,8 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>   {
>   	struct qpnp_tm_chip *chip;
>   	struct device_node *node;
> -	u8 type, subtype, dig_major;
> -	u32 res;
> +	u8 type, subtype, dig_major, dig_minor;
> +	u32 res, dig_revision;
>   	int ret, irq;
> 
>   	node = pdev->dev.of_node;
> @@ -402,6 +405,12 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>   		return dev_err_probe(&pdev->dev, ret,
>   				     "could not read dig_major\n");
> 
> +	ret = qpnp_tm_read(chip, QPNP_TM_REG_DIG_MINOR, &dig_minor);
> +	if (ret < 0) {
> +		dev_err(&pdev->dev, "could not read dig_minor\n");
> +		return ret;
> +	}
> +
>   	if (type != QPNP_TM_TYPE || (subtype != QPNP_TM_SUBTYPE_GEN1
>   				     && subtype != QPNP_TM_SUBTYPE_GEN2)) {
>   		dev_err(&pdev->dev, "invalid type 0x%02x or subtype 0x%02x\n",
> @@ -415,6 +424,23 @@ static int qpnp_tm_probe(struct platform_device *pdev)
>   	else
>   		chip->temp_map = &temp_map_gen1;
> 
> +	if (chip->subtype == QPNP_TM_SUBTYPE_GEN2) {
> +		dig_revision = (dig_major << 8) | dig_minor;
> +		/*
> +		 * Check if stage 2 automatic partial shutdown must remain
> +		 * enabled to avoid potential repeated faults upon reaching
> +		 * over-temperature stage 3.
> +		 */
> +		switch (dig_revision) {
> +		case 0x0001:
> +		case 0x0002:
> +		case 0x0100:
> +		case 0x0101:
> +			chip->require_s2_shutdown = true;
> +			break;
> +		}
> +	}
> +
>   	/*
>   	 * Register the sensor before initializing the hardware to be able to
>   	 * read the trip points. get_temp() returns the default temperature
> --
> 2.34.1
> 
> 
---
bod

