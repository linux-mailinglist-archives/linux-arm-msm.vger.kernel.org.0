Return-Path: <linux-arm-msm+bounces-52481-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 57FB1A708BC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 19:04:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A1DF7A20CC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Mar 2025 18:03:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CFEC825E802;
	Tue, 25 Mar 2025 18:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q2SXiKEe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F3426460B
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 18:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742925869; cv=none; b=YtLeXlCihxe9lqjmbkvyFUMYlDUeL2VsKnAI4FA8ElNGstITr/znaaO4bE+wAxpAiK0pZ3vQWQSCNxopJwgUEew/AO8DUtnMDtL9sMbyzAYt6yEigeIOdCvQIXbqhzcKC9ey4kgrONSj7viTEXuiaUl5vxFqT6MEJM5zyOv5ATA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742925869; c=relaxed/simple;
	bh=rTjTJEKZGu08Y3nV5h6fqKxC03MuFdMFJiI+QY7DgyQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qbyotYVsN6rD3bIAm/VLbx456iio1ujp3PIE/f+dYWTZtW5z2KaV6dokLwkPE7PcwMXCdWuT7KDwZbM4hIsIIXCc7EpWo4cII5T88wd2aVfdc8Y7x+RpUvAYz2eiQLyCemUMSleV+vh4FlsKcDMWHPMVY7lvd/COzUQgt8yp2+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q2SXiKEe; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so41604505e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Mar 2025 11:04:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742925866; x=1743530666; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N0CayCPCDi0c+eScMJRQeYXJLtxxGmBOFsr527xiD2I=;
        b=q2SXiKEes9KsWr887jneMZxZmF8Q287lcGXd6u5hjBhhVhxdqqjqEt0q9QP5dT/Vjw
         eyJP7ZQfb5q5UUNWdH2loSxVtNwgnDvBio7wL9cc9hPEDjtSxn0FElP+vM/38GiVGASY
         M8bzQ581adiXGeUpe81YqUGS/BPQgcBtDYiK6ARNSVhWNayLCcYLy1ufbAP3OOtYZrgQ
         HBpzLFNnjxOwwTWRpEdBQiRQZhylS0k/z0wP5zOHlastdOnwj0OODziQBw9c0HkzpNPc
         bp9f21zcQeG3CfCuFTrdJPDdeIBHk8FkkpSE/HHWQAd1k1gZTjvBSubdU/QpHFnWGR5r
         vNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742925866; x=1743530666;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N0CayCPCDi0c+eScMJRQeYXJLtxxGmBOFsr527xiD2I=;
        b=gFwlZrcWUJqf11btb3ZXcbISlTwOygOsoxHEW9Gneg4c6X6zuruOM1ZbHupIbS41I4
         3orB5iDw8xjpe3sqn1C+9FKM3XI9rGV38qlI2HVfaOZZHCq/DOSAXPMHb+KYrBM2X9Q7
         FS/t8XWWzIGq6OlFIu61Ep5yMJ7kW4G3+Sr3rDs0+fBlg08q8rY2NpYdSm0AoAXi3EaT
         UQvX+Kd+Z5jRqf/p0uED19g5G7H6X6ySPLA5L0AD0uAKkokK8p1Y+kTu0MXc7Tr3CbsH
         cRhS8RhUOKesHmUovBg9P5SvfO6OUt6g7jSorr8cbqAmhkV/NDP44XgP3cCtziYbJlGh
         5sJg==
X-Forwarded-Encrypted: i=1; AJvYcCWX0gWJ1I40O3VdayUchgRKU/9xCIDgpagWgVnHvrPun3R0TAi136IpohbDKh8PJdylpC4uZTGfpBJpPv45@vger.kernel.org
X-Gm-Message-State: AOJu0YzQG8vVGtdr/5wsvLvjJU7HFhqGPTkUEmrDFV683LwEexqdR7DX
	vAieaZDOMygxllP/U//RYOwCBLOnmjSXRFRFSlGwLiWEsNLS5wM7sqDwXxHMGuQ=
X-Gm-Gg: ASbGnctTZtvqhsAaUSn7sllQlu6MAmpSxVuMTxjuAwGfGEkD0ruRC45i1wu2yBdH3HK
	MOVV+zjflA8oUAB6WK+YSO9XMF33rD+4S9cHMX/e391SMf0QLcrIJetzepGCp21bjvRmZJRjhDL
	jq69hhwIMBsB9gu2X2hzXvqPFwQbNTDqc9cTTnKVZ4DiZJ/+Qvz5Cm4wOk7Mt8XcoxJZZnlkwG9
	mS4kVdbabHKTj8w5a+KNWpys/gY6u7PkwicsHXZnlU0BhBWCztEKM4Va2/eZAkgr25Cu8eeL9uB
	pG+pwZs5ZsmvGkApTe9b5zAa+bc6Ee6+nWLF3J8QdRgUzT+3Mv0zKnGfI3cLdac=
X-Google-Smtp-Source: AGHT+IH/PB6BVarMqT4SU3RviqfCTKK1Z7vJ2U4Ut/r5poNYG8tGZE1NVFEihed/kHkNIgYqkBvHXg==
X-Received: by 2002:a05:600c:692:b0:43d:17f1:2640 with SMTP id 5b1f17b1804b1-43d58db54c7mr71879365e9.26.1742925865894;
        Tue, 25 Mar 2025 11:04:25 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3997f9b565bsm14550986f8f.58.2025.03.25.11.04.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Mar 2025 11:04:25 -0700 (PDT)
Message-ID: <4654f21b-bf61-4b41-b073-407fab4bff6a@linaro.org>
Date: Tue, 25 Mar 2025 18:04:24 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/6] ASoC: codecs: wcd938x: add mux control support for
 hp audio mux
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: peda@axentia.se, broonie@kernel.org, andersson@kernel.org,
 krzk+dt@kernel.org, ivprusov@salutedevices.com, luca.ceresoli@bootlin.com,
 zhoubinbin@loongson.cn, paulha@opensource.cirrus.com, lgirdwood@gmail.com,
 robh@kernel.org, conor+dt@kernel.org, konradybcio@kernel.org,
 perex@perex.cz, tiwai@suse.com, linux-sound@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, johan+linaro@kernel.org,
 Christopher Obbard <christopher.obbard@linaro.org>
References: <20250325114058.12083-1-srinivas.kandagatla@linaro.org>
 <20250325114058.12083-6-srinivas.kandagatla@linaro.org>
 <vmhrs62ygu2xozcabc6tgy37ta5qskeyks5j3ldponzfijicl4@nudcmxonq7qj>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <vmhrs62ygu2xozcabc6tgy37ta5qskeyks5j3ldponzfijicl4@nudcmxonq7qj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25/03/2025 13:36, Dmitry Baryshkov wrote:
> On Tue, Mar 25, 2025 at 11:40:57AM +0000, srinivas.kandagatla@linaro.org wrote:
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
>> Tested-by: Christopher Obbard <christopher.obbard@linaro.org>
>> ---
>>   sound/soc/codecs/Kconfig   |  1 +
>>   sound/soc/codecs/wcd938x.c | 50 +++++++++++++++++++++++++++++---------
>>   2 files changed, 39 insertions(+), 12 deletions(-)
>>
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index ee35f3aa5521..a2829d76e108 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
>>   	tristate
>>   	depends on SOUNDWIRE || !SOUNDWIRE
>>   	select SND_SOC_WCD_CLASSH
>> +	select MULTIPLEXER
>>   
>>   config SND_SOC_WCD938X_SDW
>>   	tristate "WCD9380/WCD9385 Codec - SDW"
>> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
>> index dfaa3de31164..209d0b64c8be 100644
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
>> +	unsigned int mux_state;
>>   	u32 micb1_mv;
>>   	u32 micb2_mv;
>>   	u32 micb3_mv;
>> @@ -3237,15 +3240,22 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
>>   
>>   static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
>>   {
>> -	int value;
>> -
>> -	struct wcd938x_priv *wcd938x;
>> -
>> -	wcd938x = snd_soc_component_get_drvdata(component);
>> +	struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
>> +	struct device *dev = component->dev;
>> +	int ret;
>>   
>> -	value = gpiod_get_value(wcd938x->us_euro_gpio);
>> +	if (wcd938x->us_euro_mux) {
>> +		mux_control_deselect(wcd938x->us_euro_mux);
>> +		ret = mux_control_try_select(wcd938x->us_euro_mux, !wcd938x->mux_state);
>> +		if (ret) {
>> +			dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
>> +			return false;
> 
> 
> I really don't see any improvement here. If mux_control_try_select()
> fails, then on the next toggle mux_control_deselect() would still try to
> deselect the mux, although the driver no longer owns it.
TBH, if the first select fails, there is no guarantee that next select 
will pass,

Something like this to conditionally check before deselecting should 
address some of your concerns:

---------------------------->cut<-----------------------------------
if (wcd938x->us_euro_mux) {
	if (wcd938x->mux_setup_done)
		mux_control_deselect(wcd938x->us_euro_mux);

	ret = mux_control_try_select(wcd938x->us_euro_mux, !wcd938x->mux_state);
	if (ret) {
		dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
		wcd938x->mux_setup_done = false;
		return false;
	}
} else {
	gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);
}

wcd938x->mux_state = !wcd938x->mux_state;
wcd938x->mux_setup_done = true;
---------------------------->cut<-----------------------------------

I wish we could be taken care in mux-core or even in the deselect api

--srini

  Likewise in the
> remove path the mux_control_deselect() is called unconditionally. I
> understand that this driver is the only user of the MUX, so currently
> there seems to be no need for any special handling. However if the
> hardware design gets more complicated, we can easily face the situation
> when selecting the MUX state errors out.
> 
>> +		}
>> +	} else {
>> +		gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);
>> +	}
>>   
>> -	gpiod_set_value(wcd938x->us_euro_gpio, !value);
>> +	wcd938x->mux_state = !wcd938x->mux_state;
>>   
>>   	return true;
>>   }
> 
> [...]
> 
>> @@ -3581,6 +3604,9 @@ static void wcd938x_remove(struct platform_device *pdev)
>>   	pm_runtime_set_suspended(dev);
>>   	pm_runtime_dont_use_autosuspend(dev);
>>   
>> +	if (wcd938x->us_euro_mux)
>> +		mux_control_deselect(wcd938x->us_euro_mux);
>> +
>>   	regulator_bulk_disable(WCD938X_MAX_SUPPLY, wcd938x->supplies);
>>   	regulator_bulk_free(WCD938X_MAX_SUPPLY, wcd938x->supplies);
>>   }
>> -- 
>> 2.39.5
>>
> 

