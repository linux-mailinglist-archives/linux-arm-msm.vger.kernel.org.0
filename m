Return-Path: <linux-arm-msm+bounces-52202-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 98557A6BCBD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 15:17:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4592417CA12
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Mar 2025 14:14:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54F4C139CE3;
	Fri, 21 Mar 2025 14:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uRJ+mYwV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1354C80C02
	for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 14:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742566477; cv=none; b=oi+183ODxgUFe2LdsUoup5Xpx3XtJRGQeUQv6Pw9zIb7GikrFQkMKEbTbJiZ8P6nEEDA7olsdgLAcJsdbD2aWAZDyLnAJNyi5jgtM/Zitqe1GtafqHSmc0oXXs7LxEgM0yGT3Sc3ancVMs//4iRKu2MfJ+9hrpsQkITeio++uw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742566477; c=relaxed/simple;
	bh=ZZhBC4ZUh/6PRkPvmx69qNRirNMiGADybEAm/mIRUqs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=k9OSb528VwICRT2YSnmHgESvPN7b2urHlmouMj6pJW4AuyptArNtd+CKlbuWP9MqF1vgLxMQcot71CTJvc4QN+pQOgMKVtZ6RrUwuiaqQuprNuHvzdYIVYz7DXuCO8wAiMB7oBTYgM4xI8Tc95vBqO6vmIm4VbFt8w5boTWgA+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uRJ+mYwV; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39143200ddaso1255880f8f.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Mar 2025 07:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742566472; x=1743171272; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dxphMk5gHuL/ibLKGMHwC3/28Tm/GP6rXuS1fj8+YA8=;
        b=uRJ+mYwVfGZWja7qSQlzlUl22gMyKzmNlCO7k+vYcL/uFuhOLty8vFqRkaalzlf7Mn
         Rw1+ZgmLN2Zm3On5K76OA687wHKBh8s7tZ6LUZyP94wWiPHl1YEHCBpWg0u4271KJoXW
         xHhTdArdKZN1Mpm3NobfTQE2pHk4LXX/OJKlIVe/FDF15nSV8DfiNWcxgjgjDIvY8UB1
         fgATGhGZjaSQ4xur8Br2plWfM4KGxiOteoxkCieX0ylcwlLvNPeLfu20mvsqDCabRB+4
         AqxpjCR/5dwcOO/MFqV2KKpX/yZN4gYXz134D+wqMIOd5v6ANQss0YsZXIna3BcF16cJ
         sWIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742566472; x=1743171272;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dxphMk5gHuL/ibLKGMHwC3/28Tm/GP6rXuS1fj8+YA8=;
        b=iAheJ5FIxWukwoMLYcTbflbrJ/UYfIYBsq0Pg1wC3IbClfzZxxw6dj2EbUNbZOMp11
         IZz+0VXY0NV1ao2f3DGnnG+cPGDyOojbza6EQF9fzdH0SlJlHEPAyKhRoh30tg3LSMXU
         yKdk3EvJyqEu6bxmeEiqC1qRRbCtiyjsMhLHonEFmyb26XzlZuTUcLcSl2XrXH3SUaOH
         1KvUiqcYo/FdLHjzDB4Yl/z1VOMTvnLuMJ2og57Oe0Klu0rM6R1Z9WqB8olpS5e+7xGh
         h+6H44O+q8p9zwgRkf/H1+xykqgh5zwGSztyU8sM8cqT2REjAcTD4aUG5L/5G4lRTU0u
         dpog==
X-Forwarded-Encrypted: i=1; AJvYcCWA6hEj12Pu0pm385JyrVLzC7RKfMOzatSDBGZtc6fV66pIYysHcGH1gubpAsbYXNPN/1vbVbrKOHlj0h2W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3H0si7WLNMveFsOGYUXhDyCq1Ef6WFeKSJFcfG9bka/mjTXK
	N8spBnJBjJnheQBd4/WIWSmXiMdZoU2OFGMuqBwLpJKQO6DHXaMUePashDEtjl0=
X-Gm-Gg: ASbGncttiZ6ncoY2GZYsuPD4GYuEZ2DcXMKHyp3iMOWyoNkDJjBf834h4sONHjBUPa9
	o6NevkxzxqTE5VfXXu92IF40T9t1YII/p9BSQy/x23bNTOcnTW2nUk5Vum6bA4zFkVMQupFgeV3
	JhY4mNUZTtrKRsMGSqWNJ4FB1i7Ft2DcS4/RQSzcbKJkprBISSOysnqMW3rrCETX9HB4g7gz9vc
	Em2bXfvpMTjciUfrrhBKZnY24/9J1yWzng76Jl4rbxcVGH5pRu4ITOlWiTXSXhdn0NwCbd6QWGP
	wRb3HsYqUuRKidDWe5pQtxRsz4qnGnbBhPvYxkvdvfKgV6mL9H3R7ib+SA4/DoA=
X-Google-Smtp-Source: AGHT+IENBehotMhwohtyGw9XcCRtOfJcARUzAAQZMbCLVLVjodl3cnOOUdTsf5h+Agrt7LuxVVy5wg==
X-Received: by 2002:a05:6000:2d86:b0:390:fbba:e65e with SMTP id ffacd0b85a97d-3997f90edf9mr2640161f8f.32.1742566472274;
        Fri, 21 Mar 2025 07:14:32 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9b5b8dsm2517680f8f.59.2025.03.21.07.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Mar 2025 07:14:31 -0700 (PDT)
Message-ID: <adfecf33-6ab2-4c3e-b7d9-3d6481ebd3f8@linaro.org>
Date: Fri, 21 Mar 2025 14:14:31 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org
References: <20250320115633.4248-1-srinivas.kandagatla@linaro.org>
 <20250320115633.4248-5-srinivas.kandagatla@linaro.org>
 <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <rdvsnxuc6by6sci56sh7thzpxo5cqi7q24fnmc7hi5yrfszwrg@kqjpiilko3xo>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 20/03/2025 14:03, Dmitry Baryshkov wrote:
> On Thu, Mar 20, 2025 at 11:56:32AM +0000, srinivas.kandagatla@linaro.org wrote:
>> From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>>
>> On some platforms to minimise pop and click during switching between
>> CTIA and OMTP headset an additional HiFi mux is used. Most common
>> case is that this switch is switched on by default, but on some
>> platforms this needs a regulator enable.
>>
>> move to using mux control to enable both regulator and handle gpios,
>> deprecate the usage of gpio.
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
>> ---
>>   sound/soc/codecs/Kconfig   |  2 ++
>>   sound/soc/codecs/wcd938x.c | 38 ++++++++++++++++++++++++++++++--------
>>   2 files changed, 32 insertions(+), 8 deletions(-)
>>
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index ee35f3aa5521..b04076282c8b 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -2226,6 +2226,8 @@ config SND_SOC_WCD938X
>>   	tristate
>>   	depends on SOUNDWIRE || !SOUNDWIRE
>>   	select SND_SOC_WCD_CLASSH
>> +	select MULTIPLEXER
>> +	imply MUX_GPIO
> 
> Why? This is true for a particular platform, isn't it?
> 
>>   
>>   config SND_SOC_WCD938X_SDW
>>   	tristate "WCD9380/WCD9385 Codec - SDW"
>> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
>> index f2a4f3262bdb..b7a235eef6ba 100644
>> --- a/sound/soc/codecs/wcd938x.c
>> +++ b/sound/soc/codecs/wcd938x.c
>> @@ -19,6 +19,7 @@
>>   #include <linux/regmap.h>
>>   #include <sound/soc.h>
>>   #include <sound/soc-dapm.h>
>> +#include <linux/mux/consumer.h>
>>   #include <linux/regulator/consumer.h>
>>   
>>   #include "wcd-clsh-v2.h"
>> @@ -178,6 +179,8 @@ struct wcd938x_priv {
>>   	int variant;
>>   	int reset_gpio;
>>   	struct gpio_desc *us_euro_gpio;
>> +	struct mux_control *us_euro_mux;
>> +	u32 mux_state;
>>   	u32 micb1_mv;
>>   	u32 micb2_mv;
>>   	u32 micb3_mv;
>> @@ -3243,9 +3246,16 @@ static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component, bool activ
>>   
>>   	wcd938x = snd_soc_component_get_drvdata(component);
>>   
>> -	value = gpiod_get_value(wcd938x->us_euro_gpio);
>> +	if (!wcd938x->us_euro_mux) {
>> +		value = gpiod_get_value(wcd938x->us_euro_gpio);
>>   
>> -	gpiod_set_value(wcd938x->us_euro_gpio, !value);
>> +		gpiod_set_value(wcd938x->us_euro_gpio, !value);
> 
> This looks like a separate topic, but why is 'active' being ignored?
> 
>> +	} else {
>> +		mux_control_deselect(wcd938x->us_euro_mux);
>> +		wcd938x->mux_state = !wcd938x->mux_state;
>> +		if (mux_control_select(wcd938x->us_euro_mux, wcd938x->mux_state))
> 
> Can't it just be 'mux_control_select(wcd938x->us_euro_mux, active)' ?
> 

No, the way this is supposed to work is that if the codec detects cross 
connection, It will try to switch the mux to other option.

So using active will just work if we try to pulg one type of headset all 
the time. But if we change the headset type the mux will still be 
configured to use the old headset type and not work.

fyi, active is always set to true

I agree the argument to api is poorly labeled. It should be labeled as 
flip or something on those lines?


thanks,
Srini
>> +			dev_err(component->dev, "Unable to select us/euro mux state\n");
>> +	}
>>   
>>   	return true;
>>   }
> 

