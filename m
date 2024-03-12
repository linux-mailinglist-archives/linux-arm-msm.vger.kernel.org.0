Return-Path: <linux-arm-msm+bounces-13934-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AFCD879459
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 13:44:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACFB1B23E37
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Mar 2024 12:44:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 998D356750;
	Tue, 12 Mar 2024 12:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j7sR46qW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B123D811
	for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 12:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710247447; cv=none; b=b2kXAURw13QCNyrL1RV7cL9NNPH3fjdm06oWkDUCGYEIG2ycKuQuxOQg3l9EPBZ5F9bb05L8wkJSH5SvjQ8VlpyxRfj/at0flnaPb/+wNeHYGLYA5oJXO16JqXAmyR5AdW6c3oEg/dN0JWmu6q7WctqbulUUlKSPoqseDhbpkjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710247447; c=relaxed/simple;
	bh=c3wq8KjiBK3iB7Yq7axillLzJackciCs+2P4yMTWUgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QyHIv50vlNCul8pa2EsHxwJ27pK0oCQxUgkxe+PkvneL1jFlh+sDW0f+gIwjj8SUR6tZZdscVal25Vd6H4SLapy5oBkGEc5hyrDoK88juSjJBwbkgyEmC5mhXZ5vVboK8T476VxRkpROj1JoXmCc0cDCW/dUvgQtW42GwISqQmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j7sR46qW; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4132f37e170so9329235e9.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 12 Mar 2024 05:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710247444; x=1710852244; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4B3ShZZpHaJXDCdfM6G41q+bchG22d5Wpm6qfWCjnS4=;
        b=j7sR46qWNXl0Qs6WWrLzU5qTME9eTWRw3od4lxSVXzHNezNBp/9IAdBT7fSTnThTbH
         P5Q4MRCNQrvA+z3khcbGj0GmFtP0eUPPN1F983EU9IvfpWmv2SC77pD0LS86yjAtPbiY
         5XGFPb44OhWWB0dnDRfcdq4PvnHn2fSrfepdCjhhbLV9ye0JZg6EEAHT8eEmbVDv6scf
         DMmJVmZW3NFl9dGiN5KlIh+WRp7jYXJYJzRrt9mWLb+VYUadRa6LWdkAzM1O+D3tTT5a
         1NkqmWsibzLQA1D4PQxXPQDvcfHmYkc2LHjyoG9WVNd5wi97ZSdDi11nwhfZlInLDf4z
         0q1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710247444; x=1710852244;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4B3ShZZpHaJXDCdfM6G41q+bchG22d5Wpm6qfWCjnS4=;
        b=MOFKEixVrjsYV9bDm34+m7vPMK4O8tPQBxfeNYviOMK2Ns88nXou4FXzBDVAPx9ssP
         afORJ2N3hX67kc3Yu0Uk/CqCDGQ0dWfx6biTsyQLr6peSrlIc4b1veMLD5M6iFaFZhfx
         yWY9H3HxlMMEuYG90IZ/QQGjRSZEjgJfkEVdUQvTIjdwm0nQbbnW+WP/mTfaW0JYCfv7
         JcRaq9rYjlfObYB4eV9zHE2K4z09cHWBely2s8wEmpXshui+JiovX6lZVJw7nty+mzUF
         Tn3Mhk1khnu6DPhc7pkp7Nai9Q+E7UoLa4zzcqXemhxKCYwPk5hZ1PMojWByKhYr8Vq0
         dNpQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrMCJ4WZGrhHoWPfBCQ3+VyzLZWmxHAXXzpxtsQa0FF+1x2YiFomvTsenZvEr5Ee/d2uLpIj8sEom/S6ssbvK8a4kXoqLiGRgqFKeU3Q==
X-Gm-Message-State: AOJu0Yw4Bl4IpLm579OvigIXTbSAI5zvqDDySulnO6T+u3uR+wpNQuWU
	1D7ZpOyNHeBO+SjooqoRtqOkKzBWBNbhLnFuUDylA6TYds/LYv0C0DodA/fJKC4=
X-Google-Smtp-Source: AGHT+IHzfn3GhVnD60ibpE5ibSDuCPcyyCwmNrhsXVXVRKOxPoc1R0Gqjt4J3WsF0OaqNsTZy4eZ5Q==
X-Received: by 2002:a05:600c:1912:b0:413:1139:3bec with SMTP id j18-20020a05600c191200b0041311393becmr37941wmq.35.1710247444098;
        Tue, 12 Mar 2024 05:44:04 -0700 (PDT)
Received: from [192.168.0.102] ([176.61.106.68])
        by smtp.gmail.com with ESMTPSA id r13-20020adff10d000000b0033b278cf5fesm8909757wro.102.2024.03.12.05.44.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Mar 2024 05:44:03 -0700 (PDT)
Message-ID: <104ae92c-e9ef-494e-b33e-351210c93846@linaro.org>
Date: Tue, 12 Mar 2024 12:44:02 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] platform: arm64: Add Acer Aspire 1 embedded
 controller driver
Content-Language: en-US
To: Nikita Travkin <nikita@trvn.ru>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Sebastian Reichel <sre@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20240312-aspire1-ec-v4-0-bd8e3eea212f@trvn.ru>
 <20240312-aspire1-ec-v4-3-bd8e3eea212f@trvn.ru>
 <f62bbc98-12c1-48e1-8ebc-17dd5887026a@linaro.org>
 <84b4d83f3340402e98fe0e70afd085be@trvn.ru>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
In-Reply-To: <84b4d83f3340402e98fe0e70afd085be@trvn.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 12/03/2024 12:23, Nikita Travkin wrote:
> Bryan O'Donoghue писал(а) 12.03.2024 16:58:
>> On 12/03/2024 08:42, Nikita Travkin wrote:
>>> Acer Aspire 1 is a Snapdragon 7c based laptop. It uses an embedded
>>> controller to perform a set of various functions, such as:
>>>
>>> - Battery and charger monitoring;
>>> - Keyboard layout control (i.e. fn_lock settings);
>>> - USB Type-C DP alt mode HPD notifications;
>>> - Laptop lid status.
>>>
>>> Unfortunately, while all this functionality is implemented in ACPI, it's
>>> currently not possible to use ACPI to boot Linux on such Qualcomm
>>> devices. To allow Linux to still support the features provided by EC,
>>> this driver reimplments the relevant ACPI parts. This allows us to boot
>>> the laptop with Device Tree and retain all the features.
>>>
>>> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
>>> ---
>>>    drivers/platform/arm64/Kconfig           |  16 +
>>>    drivers/platform/arm64/Makefile          |   2 +
>>>    drivers/platform/arm64/acer-aspire1-ec.c | 555 +++++++++++++++++++++++++++++++
>>
>> You should be listing yourself as a maintainer for a driver you contribute.
> 
> I always believed that being in the AUTHOR() at the bottom of the driver
> would guarantee me being in CC for patches, which so far worked great,
> thus I was always hesitent adding extra entries in MAINTAINERS.

There's no such rule that I'm aware of there.

scripts/get_maintainer.pl won't list a driver author for the CC list

This is a substantial body of code, you should own it upstream.

>>> +	case ASPIRE_EC_EVENT_FG_INF_CHG:
>>> +		/* Notify (\_SB.I2C3.BAT1, 0x81) // Information Change */
>>
>> fallthrough;
>>
> 
> Hm I believe this would not warn since it's just two values for the same
> code, just with an extra comment inbetween?

True

>>> +	case POWER_SUPPLY_PROP_VOLTAGE_NOW:
>>> +		val->intval = le16_to_cpu(ddat.voltage_now) * 1000;
>>> +		break;
>>> +
>>> +	case POWER_SUPPLY_PROP_VOLTAGE_MAX_DESIGN:
>>> +		val->intval = le16_to_cpu(sdat.voltage_design) * 1000;
>>> +		break;
>>> +
>>> +	case POWER_SUPPLY_PROP_CHARGE_NOW:
>>> +		val->intval = le16_to_cpu(ddat.capacity_now) * 1000;
>>> +		break;
>>> +
>>> +	case POWER_SUPPLY_PROP_CHARGE_FULL:
>>> +		val->intval = le16_to_cpu(sdat.capacity_full) * 1000;
>>> +		break;
>>
>> You could stick this "* 1000" stuff in a macro
>>
> 
> acpi/battery.c also explicitly sets the multiplier so I think it's the
> "common" way to do this.

common != nice

Purely aesthetics but anyway consider decomposing the replication down.

>>> +
>>> +	case POWER_SUPPLY_PROP_CAPACITY:
>>> +		val->intval = le16_to_cpu(ddat.capacity_now) * 100;
>>> +		val->intval /= le16_to_cpu(sdat.capacity_full);
>>> +		break;
>>> +
>>> +	case POWER_SUPPLY_PROP_CURRENT_NOW:
>>> +		val->intval = (s16)le16_to_cpu(ddat.current_now) * 1000;
>>> +		break;
>>> +
>>> +	case POWER_SUPPLY_PROP_PRESENT:
>>> +		val->intval = !!(ddat.flags & ASPIRE_EC_FG_FLAG_PRESENT);
>>> +		break;
>>> +
>>> +	case POWER_SUPPLY_PROP_SCOPE:
>>> +		val->intval = POWER_SUPPLY_SCOPE_SYSTEM;
>>> +		break;
>>> +
>>> +	case POWER_SUPPLY_PROP_MODEL_NAME:
>>> +		if (sdat.model_id - 1 < ARRAY_SIZE(aspire_ec_bat_psy_battery_model))
>>> +			val->strval = aspire_ec_bat_psy_battery_model[sdat.model_id - 1];
>>> +		else
>>> +			val->strval = "Unknown";
>>> +		break;
>>> +
>>> +	case POWER_SUPPLY_PROP_MANUFACTURER:
>>> +		if (sdat.vendor_id - 3 < ARRAY_SIZE(aspire_ec_bat_psy_battery_vendor))
>>> +			val->strval = aspire_ec_bat_psy_battery_vendor[sdat.vendor_id - 3];
>>
>> How does this -3 offset not underflow ?
>>
> 
> vendor_id here is unsigned so the if check would actually overflow,
> though explaining that I guess it's better to be explicit there and let
> the compiler optimize that check away anyway... I will update the if
> condition with an extra (id >= 3).

What's the "3" about though, that's what's not jumping out at me here.

> 
>> Seems a bit dodgy to me - can you add a comment to the code to explain ? Its not immediately obvious the -3 is OK.
>>
>> Also could you take an index instead of replicating the -value stepdown each time ?
>>
>> int myindex = sdat.model_id - 1;
>>
>> if (myindex < someconstraint)
>> 	strval = somearry[myindex];
>>
> 
> I decided against adding a dedicated index variable since there is only
> one actual use for each, so it's easy to see where it goes.

But you do it twice which is why I'm suggesting take an index and do it 
once.

Then add

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

