Return-Path: <linux-arm-msm+bounces-17105-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CE3E89FF71
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 20:11:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7ABD41F217A8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Apr 2024 18:11:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 577831802A9;
	Wed, 10 Apr 2024 18:10:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K59b+dPk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40DEB17F36D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 18:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712772652; cv=none; b=MGbpV+BxEu8Pmvxj19fWSFk6gpfPDsJNigjZMLpuYA9mL0aMbyGXhXSz6WA8J634wxKFQ7cCPNUtZYuicClT+CFpCAj1kf1ZDqSN/KWGFFCoUYIz9kEiVjv00u5RuYPTKo1oPSYaNnZgIz/YbgQjNB52VcHZ9P189rVofilDO6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712772652; c=relaxed/simple;
	bh=KtK9AqOib5MZqlHDKaedY075K0v4Wz+y8tpNzm0i7Zc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ivc/8AA9cHrdPELuVJUW4nbhPxsmHgZbzPpHmVi79SHbWqZphnIfLNKFctIDGJQLnAVlbDrP6rCc/aXQ08N773LaOHV0mb9IXNik4LgPgyAt7opsk3bBSJT1Wv2LFYsDpDbQsPP6p9LoOkeOps1DSs5jVMikACnzXrdGY5vOopI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K59b+dPk; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-516d1c8dc79so7923986e87.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 10 Apr 2024 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712772647; x=1713377447; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/RYrpn/mMC4ytYkBE5KCuuEAqKXRwbGVkmp3cwBeGIY=;
        b=K59b+dPkW6277Zjtm5U6Qf3ROoeYgrOT6iN6YNRjzCnnE2fgb8URXwvi4cc59gIqcS
         waSoSoVHBIuQrqwxjncbea4h4inOaU9iiJRtYEiwqtEHnDctdBtmh3/5Yvd6z3lXnpM8
         tY6RqEB2IGi1sBJwJcUE/qc9j7LK6egA5hvnyKVg0IGJtHkCc19oshBcYRcx/1LIAtlj
         tPP4VxwvMoSwPIaqG0V+d2oiG6xEov/hpxoL9IsX5mFkJFAT/gsIwXbw1lHHqAo021hv
         C+NOgSxZHddWlnICVW+OJhz/XtXNQtO0OveLvszfkOqBbSJnvZWFhYkYAl4J9/OZcETI
         av7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712772647; x=1713377447;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/RYrpn/mMC4ytYkBE5KCuuEAqKXRwbGVkmp3cwBeGIY=;
        b=cS8shsLG7pvCQc87a59asHKvLNMu0goqtTbvLfQsOBJD42b68nVV/1jiMvzXfeYs5l
         nUlOnOwizu3QXVhhC1zzaAlN5R8lJ8ukm24CFbcbU99NrUEIh1yBFBqQNKimGV3w+1Mr
         avuCnlg7+r6IjZAHVdrz//W7/lEOFYDcYdBVe5zDRVWMLpyZzA529GkEIWfWrkBUMLaa
         FYV6JmLxX8jGOC5MSTWg+rB/FX34np3wiQbOci0lTZhE9VH8Cs+uT5s8IpESxTokDctl
         9fKKarD4OMxxaJriujaKemFOFI7EzHexf3cbuV2fGM/zWv2Uk+TEm4MFAWcO7aRYVx30
         DpxA==
X-Gm-Message-State: AOJu0YxFvj8k5l3O1ZmoiYgXfmJ2D0vBN3IbnjNkIgEXVE8w58rDu9Ne
	0QITdK1vzqzRBIekiGnUJ962tyhAwSWeLcCIs5ggliHBofgbhOpeobMFEFx7Krc=
X-Google-Smtp-Source: AGHT+IGlfv5cqTXSlUjnAcjKTd3JMZ3fyDBNaaCBpr+X/mF0R8M0rkj2RVLFCZH9Ow/DWy6PZhDG6Q==
X-Received: by 2002:ac2:518c:0:b0:517:8b6a:a664 with SMTP id u12-20020ac2518c000000b005178b6aa664mr181237lfi.18.1712772647289;
        Wed, 10 Apr 2024 11:10:47 -0700 (PDT)
Received: from [172.30.205.26] (UNUSED.212-182-62-129.lubman.net.pl. [212.182.62.129])
        by smtp.gmail.com with ESMTPSA id d11-20020a05651233cb00b00517806dcce7sm106530lfg.89.2024.04.10.11.10.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 10 Apr 2024 11:10:46 -0700 (PDT)
Message-ID: <3f8c970c-6a0d-4fc3-a2d3-e0797e7055cf@linaro.org>
Date: Wed, 10 Apr 2024 20:10:42 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 3/3] input: pm8xxx-vibrator: add new SPMI vibrator
 support
To: quic_fenglinw@quicinc.com, kernel@quicinc.com,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20240401-pm8xxx-vibrator-new-design-v8-0-6f2b8b03b4c7@quicinc.com>
 <20240401-pm8xxx-vibrator-new-design-v8-3-6f2b8b03b4c7@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240401-pm8xxx-vibrator-new-design-v8-3-6f2b8b03b4c7@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 4/1/24 10:38, Fenglin Wu via B4 Relay wrote:
> From: Fenglin Wu <quic_fenglinw@quicinc.com>
> 
> Add support for a new SPMI vibrator module which is very similar
> to the vibrator module inside PM8916 but has a finer drive voltage
> step and different output voltage range, its drive level control
> is expanded across 2 registers. The vibrator module can be found
> in following Qualcomm PMICs: PMI632, PM7250B, PM7325B, PM7550BA.
> 
> Signed-off-by: Fenglin Wu <quic_fenglinw@quicinc.com>
> ---

[...]

>   
> -#define VIB_MAX_LEVEL_mV	(3100)
> -#define VIB_MIN_LEVEL_mV	(1200)
> -#define VIB_MAX_LEVELS		(VIB_MAX_LEVEL_mV - VIB_MIN_LEVEL_mV)
> +#define VIB_MAX_LEVEL_mV(vib)	(vib->drv2_addr ? (3544) : (3100))

You shouldn't need the additional inside parentheses

Also, is this really a good discriminator for the voltage ranges? Do *all*
PMIC vibrators with a drv2_addr operate within this range? If not, consider
a struct field here


> +#define VIB_MIN_LEVEL_mV(vib)	(vib->drv2_addr ? (1504) : (1200))
> +#define VIB_MAX_LEVELS(vib)	(VIB_MAX_LEVEL_mV(vib) - VIB_MIN_LEVEL_mV(vib))

If the ranges are supposed to be inclusive, this is off-by-one. But looking
at the driver, it seems like MIN_LEVEL may be "off"? I'm not sure though.

Either way, this would be a separate fix.
[...]

> +static struct pm8xxx_regs pmi632_regs = {
> +	.enable_offset = 0x46,
> +	.enable_mask = BIT(7),
> +	.drv_offset = 0x40,
> +	.drv_mask = 0xFF,

GENMASK(7, 0)

> +	.drv_shift = 0,
> +	.drv2_offset = 0x41,
> +	.drv2_mask = 0x0F,

GENMASK(3, 0)

[...]

>   
> +	if (regs->drv2_mask) {
> +		if (on)
> +			val = (vib->level << regs->drv2_shift) & regs->drv2_mask;
> +		else
> +			val = 0;
> +		rc = regmap_write(vib->regmap, vib->drv2_addr, val);

Are you purposefuly zeroing out the other bits?

If yes, consider regmap_write_bits here
If not, consider regmap_update_bits here

> +		if (rc < 0)
> +			return rc;

Ignore regmap_r/w errors, these mean a complete failure of the API and
we don't generally assume MMIO accesses can fail

Unless SPMI is known to have issues here

> +	}
> +
>   	if (regs->enable_mask)
>   		rc = regmap_update_bits(vib->regmap, vib->enable_addr,
>   					regs->enable_mask, on ? ~0 : 0);
> @@ -114,19 +141,22 @@ static void pm8xxx_work_handler(struct work_struct *work)
>   		return;
>   
>   	/*
> -	 * pmic vibrator supports voltage ranges from 1.2 to 3.1V, so
> +	 * pmic vibrator supports voltage ranges from MIN_LEVEL to MAX_LEVEL, so
>   	 * scale the level to fit into these ranges.
>   	 */
>   	if (vib->speed) {
>   		vib->active = true;
> -		vib->level = ((VIB_MAX_LEVELS * vib->speed) / MAX_FF_SPEED) +
> -						VIB_MIN_LEVEL_mV;
> -		vib->level /= 100;
> +		vib->level = ((VIB_MAX_LEVELS(vib) * vib->speed) / MAX_FF_SPEED) +

mult_frac()

> +						VIB_MIN_LEVEL_mV(vib);

vib->level = VIB_MIN_LEVEL_mV;
vib->level += the other thing

for readability?

>   	} else {
>   		vib->active = false;
> -		vib->level = VIB_MIN_LEVEL_mV / 100;
> +		vib->level = VIB_MIN_LEVEL_mV(vib);
> +
>   	}
>   
> +	if (!vib->drv2_addr)
> +		vib->level /= 100;

Maybe this could be moved to pm8xxx_vib_set() instead

> +
>   	pm8xxx_vib_set(vib, vib->active);
>   }
>   
> @@ -202,7 +232,7 @@ static int pm8xxx_vib_probe(struct platform_device *pdev)
>   
>   	vib->enable_addr = reg_base + regs->enable_offset;
>   	vib->drv_addr = reg_base + regs->drv_offset;
> -
> +	vib->drv2_addr = reg_base + regs->drv2_offset;

It would be nice to preserve a newline between assignments and rw
functions here

Thanks for working on this!

Konrad

