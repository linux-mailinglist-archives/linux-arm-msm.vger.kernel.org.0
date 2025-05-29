Return-Path: <linux-arm-msm+bounces-59814-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D34AC7C4C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 12:59:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 56F934A57BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 May 2025 10:59:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD69F28DF2D;
	Thu, 29 May 2025 10:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="u3Mvde2v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C08C229B02
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 10:59:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516392; cv=none; b=qKY36PpstIRcgLLj/bWkMxWPrJAVEaul7KNQCRqVgUFGa23pr3RRHL/1cGOUlK+gaXfPND7ln0setcb4h4/+7t0oG7YfwPUjPW0N3KpJKs3H/b7oaqGG4hlT9JRt0i/ztK/4q4Od7doUGqxEwlGtJEf8f2XIZsuezXwqylFUaHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516392; c=relaxed/simple;
	bh=uokOcpliAtsO0yPgDgaMCS61kumW1dce6ne6Ov1VvFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AFUgGEeJ6H36gKlYHtRsfxhIkvzxntqsHKQizi2WuG9jIjSYNk9UW6rVf6uxgO4Zq1xtxSXjVzph+mcV2ObgpFAnT8WZkUU1D1pW4Te5AwN3k+utA4r/1N2GAO9ED3w599TPH0fBS/tCVmN3tcCxuc/Qtni/TKm+egGI/fc1fDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=u3Mvde2v; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so9925835e9.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 May 2025 03:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748516389; x=1749121189; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zIw9ZqjIqtglnQzbhkOCsGKq/yrA50x6t5WtTG1WnPI=;
        b=u3Mvde2vIxJBag/MnIjAxlf4+nnq4KlMquSkzYdDjQxPGC9G4kdzXST65aGUMUsmwz
         yYWk1zv2l2i5Esm5E5pzvUw20DHIsY7yQCYNXsE2GW5oWCf0y0UhuT6xcnFSn8aPyKl7
         0GcHa6I35ZaFB/9AtFxG4xvcjeuSy+T8QvtgXiDwTEzi1LVHkZr1anW+sgufIZsqvBvd
         lumeCmLs44H7Zmd+f4O7YEPgi7JM9d05+vNrSK6BnX+M1+yVKU0tZArrlg+FHBBWcRTo
         IT1dRnTbbHRxowO2bm9iy6/uPfMBBB0yAQR93OH+bVP2rOFSUQpiunVbw5ZlxmQbdbfF
         fIsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748516389; x=1749121189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zIw9ZqjIqtglnQzbhkOCsGKq/yrA50x6t5WtTG1WnPI=;
        b=PgTjISwVeLtPwRgeP0X4nVrJHa4VoP5iHc+hIqXw9I/N4BoYTV1+i8orHelzTTOglA
         kQglcsyYHcvHzuvcnWicKzhYS8/g2fAHQd4fbzByMA3UAO47bn2kQdctxDIH7P6UoMu4
         pkB7vHt5WlKKKVhD6Ali3oyVjJ+bDsurAotc83yE9H+i62vUfpiAwEbNx5hg7YdM2zbz
         rG1FYPw6O1HmSVjC2Wntjc5rGWnEhTJOAs42AIaF9/A1pKesDLOz+001YRxbUlonc302
         zRitjkf7Kkm9Gtv0OZ9G0FFYbXVTUUNRM1Lwe1msmgo/R8frWsiPGOr4PeprBUFBBxmr
         gxcw==
X-Forwarded-Encrypted: i=1; AJvYcCVecpAC859663+cCm18Drn+EJ/F7WrZ7gpJOk8a4FSJBWSBpxx/kyzcKCiaCJdVk87UUcCOk0ZOSGbfYUGp@vger.kernel.org
X-Gm-Message-State: AOJu0YypIPE/+y8GibNvz+1PHYCXijoLA+PJBdiYLv+u8+LxyA2yNImH
	958J8kqO5Fn+6pgb4kHgphjUD9fAh6oGq3+6Mka0BJx78YzpWfSSywEC++k6N9GJrIc=
X-Gm-Gg: ASbGncsq6QzmnuciMXZisCQ0R+fb8k9igm4/fhbncwZpfsiFR2/pMbFXkYEYV+59pF2
	gX3tx/7kvKtX/v7efLpMaESkS/ctbbOW7wtRjz0wRcSj/2u1q9Z+ZCC6VS3kaGwIspym6d5VRw2
	Q9KCD/JXVDyGRb2OaYx4Y9pFjuPIwlIRyt/cRoubi1SKFkSGGXp2Pijyl6FvY2Q6B6FUNiRkYhw
	WCuengEbH7Zi/UvNYfDMjjWj1nZ7beyFWT6OBQ+A3Hgs3WG1ep7HlxmAYV9aDleHtbqiG7pnZvK
	E+2GKSxum2bxLR8p1OICaJ/CtquE9JIryNHE/aUnX0onur1PjyoYvh/+l/8Tl1yEojoFZTLIiQB
	kuCPtCEhI3dTX4VGW
X-Google-Smtp-Source: AGHT+IGBNOksY0Dn1siJUEYw2Be2FNY53x04kcV72jN+DJxdz71cewTb6DwiVUGoW3jjAYY9Zdl7Yw==
X-Received: by 2002:a05:600c:828f:b0:450:d3c6:84d8 with SMTP id 5b1f17b1804b1-450d3c68523mr10216405e9.14.1748516388671;
        Thu, 29 May 2025 03:59:48 -0700 (PDT)
Received: from [192.168.0.34] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc03430sm16779555e9.12.2025.05.29.03.59.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 03:59:48 -0700 (PDT)
Message-ID: <07ecd160-5bb5-4e39-ab5c-9f761e7db0af@linaro.org>
Date: Thu, 29 May 2025 11:59:47 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/5] thermal: qcom-spmi-temp-alarm: add support for
 GEN2 rev 2 PMIC peripherals
To: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>,
 amitk@kernel.org, thara.gopinath@gmail.com, rafael@kernel.org,
 daniel.lezcano@linaro.org
Cc: rui.zhang@intel.com, lukasz.luba@arm.com, david.collins@oss.qualcomm.com,
 srinivas.kandagatla@linaro.org, stefan.schmidt@linaro.org,
 quic_tsoni@quicinc.com, linux-arm-msm@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dmitry.baryshkov@linaro.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250528235026.4171109-1-anjelique.melendez@oss.qualcomm.com>
 <3niPa8t6TJc43heEDzbk3f9nuULmgPi0LavIEOdHufZwUvhipGZxrwj317kugr1GXnHZjtCwM_6trcPCQ3c4hQ==@protonmail.internalid>
 <20250528235026.4171109-5-anjelique.melendez@oss.qualcomm.com>
Content-Language: en-US
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <20250528235026.4171109-5-anjelique.melendez@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29/05/2025 00:50, Anjelique Melendez wrote:
> +static int qpnp_tm_gen2_rev2_set_temp_thresh(struct qpnp_tm_chip *chip, int trip, int temp)
> +{
> +	int ret, temp_cfg;
> +	u8 reg;
> +
> +	WARN_ON(!mutex_is_locked(&chip->lock));
> +
> +	if (trip < 0 || trip >= STAGE_COUNT) {

trip < 0 can never be true because the value passed to this function 
comes from an unsigned int

include/linux/thermal.h:#define THERMAL_TRIP_PRIV_TO_INT(_val_) 
(uintptr_t)(_val_)

actually why is it int trip here instead of unsigned int trip ?

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
> +	ret = qpnp_tm_gen2_rev2_set_temp_thresh(chip, trip_index, temp);The sign conversion in the integer seems questionable. I see that the 
intel code does the same thing but I think that's just an error being 
replicated here.
---
bod


