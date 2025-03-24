Return-Path: <linux-arm-msm+bounces-52349-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7B5A6DC4A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 14:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7BA4116D343
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Mar 2025 13:58:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B31D25F798;
	Mon, 24 Mar 2025 13:58:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Jf9Ch+03"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75B7825E444
	for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 13:58:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742824691; cv=none; b=V9+cpJfBMSEZ1rh8JmD3miM1kRuI/5vFI+k9A22wHloaUb2NAi97zo0MhYvJJJt1/L8/pkCcZByrqdVec5Ml+ogvOijBP6rgHYikuH+PS6DQuCgkot2EKDQapsdjixPwc1MM39HcIU9PAlPCJES2t0tOonDy9c4Oz3c4m6clYLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742824691; c=relaxed/simple;
	bh=y4Yv/4+0V8Ty/I5zEXY3cZz1CfX1+e1X8HtU9exWbpM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ihzpUu6swPY05ih7T/8sTFiujSS2S7aMHNzaxD8DU3A3eDpprj1g3N6wBsNNN/mDJuyeL+Po1uzJaADgSlEaZ99rRCTYdohICVUvknTD4PlHWOlcO+B+a7qETJvEClvQ+XGgaopK/K2QtArcAYnZE++sFwEdmVXusC9kXdI9zhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Jf9Ch+03; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so41049865e9.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 Mar 2025 06:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1742824688; x=1743429488; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HzBq7E0dY/7OqbduLLdzI0R6VOQc8u4E/kDdciBltiw=;
        b=Jf9Ch+035l9QUvPYeUey+9XqwsTyIgiOyTJbZwAT62Q9kO85ROa7tYnOIkoiOGrHTL
         FFN7XcdjRun4j01AdMyvclns3v2vesJDpuqFwbXvxyXEc1tBh8dQ+2/96ZooFO3M0B3b
         vv8iwmZ0ynxivcm/j3UnywaKAql9vd4vjtVhtf2Dpl8a4APEXVX8VdMKEcfalns8zwW4
         CxoGNZECYC1gX0KrzgDmDI0lw7EAyzdPmkCen4sOjeMlZBAPkw607yIAKsB4QcjSKsnd
         Ji2mCf/0pgvvlHiKcQdRadk9m6bmWuoWJEs9EwxFfm0kUn1SdJQnd+DPRB0cpfGszJSi
         pNMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742824688; x=1743429488;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HzBq7E0dY/7OqbduLLdzI0R6VOQc8u4E/kDdciBltiw=;
        b=Pc86oacfoTFZT1mltcIIL4F+5GcT3fNidNUr2Sh1UYp/wPaXHbO0DttSUk9DHmKCz7
         JLI/yNyWCHmYUHO/tur8jwzfBDIsvJXvgNg4FIaRj4na4J0UII347PUdEasxBPq/XDrQ
         w3YYUvB8i6WcNgYw2b70oOFpowoKGz4zz2yBBvLkdD3tKgl0fVgHUvNE1D6kiLsq9Y7t
         oW/Vd/qaksFID/wy17nHE4GpRwd5s7g7Ai8ONCgUf9J6bl0jcGom2FyUhO8jOIYdUGk4
         cRG5XXDipTGH8nvg1Yztx64kwJUW5KDmWSMHTo4sAe0XXmAJlULGaAHz4wzPKTXE/enX
         UkQA==
X-Forwarded-Encrypted: i=1; AJvYcCXBh0l8WAzFqId+5IeyVP4E3QNjkzxm1rVsEJSTJ2jLFTRIbYaDx5CECQRgsYpqzro1Nw1Q1rHMVrHZmcZj@vger.kernel.org
X-Gm-Message-State: AOJu0YyJI/borDSJ3bKaiqfx2h7yIgAKMcgqTuN/YaP+pF/46p/KvUnh
	jfNqh9MmS9tdds/qM2Kvkn9txJsEqgiRfMbYdVECNjcbSb0I1aCtIkbjxqECjnY=
X-Gm-Gg: ASbGnct9GO6qVaXZYIEqAOebYEqiC7kQvB0hW5sKMc1NfJ4jUM4TqrIly1MAEc1Jipu
	Yx2OsobvxMcgi9jYEXm/L4e0ztucuEmZ2OSBZpxYW/BjjomKhYCCWmeBL+JyGbmnQ7QtgruOAQ3
	8SQYv/Ifj37mbDPcJb9HV2/a6Zkxvg3oUW58AkQFhrkFdBuJ12N2DyPC48HITmwAZ2ALgEcY1IZ
	F4AlUzXCwxVjPeY5oIQQr2A0mW0+A+qmh10Ymkf6UnwldDExjy79Bdq9xw8SmBeafy0jHIf4+Ek
	ElYTgSzi2Enygft5HMFBHjAGgs7EFQsisGVIsNDkAUyRAYKVMrZOIpDN3JX0qNqyWXp8xKqUZw=
	=
X-Google-Smtp-Source: AGHT+IHu6+jsbV7bKWmWs8+hRNELJ+cI6cKFiSeoykyEH0Xk36WsoVuwLU4toY3H2FVtwFB9Bud6fg==
X-Received: by 2002:a05:600c:3c9e:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-43d50a4f8camr124967445e9.30.1742824687578;
        Mon, 24 Mar 2025 06:58:07 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d3bb2b2ffsm151418925e9.1.2025.03.24.06.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Mar 2025 06:58:07 -0700 (PDT)
Message-ID: <e4e94fbf-172f-4cfd-becc-cb2836ac1fb1@linaro.org>
Date: Mon, 24 Mar 2025 13:58:06 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] ASoC: codecs: wcd938x: add mux control support for
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
References: <20250324130057.4855-1-srinivas.kandagatla@linaro.org>
 <20250324130057.4855-6-srinivas.kandagatla@linaro.org>
 <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <CAO9ioeX9RTBAeL3+9STn+=oEYR0wtaF6yoa=esNddEvqLQyO9Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/03/2025 13:50, Dmitry Baryshkov wrote:
> On Mon, 24 Mar 2025 at 15:01, <srinivas.kandagatla@linaro.org> wrote:
>>
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
>>   2 files changed, 40 insertions(+), 11 deletions(-)
>>
>> diff --git a/sound/soc/codecs/Kconfig b/sound/soc/codecs/Kconfig
>> index ee35f3aa5521..a2829d76e108 100644
>> --- a/sound/soc/codecs/Kconfig
>> +++ b/sound/soc/codecs/Kconfig
>> @@ -2226,6 +2226,7 @@ config SND_SOC_WCD938X
>>          tristate
>>          depends on SOUNDWIRE || !SOUNDWIRE
>>          select SND_SOC_WCD_CLASSH
>> +       select MULTIPLEXER
>>
>>   config SND_SOC_WCD938X_SDW
>>          tristate "WCD9380/WCD9385 Codec - SDW"
>> diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
>> index dfaa3de31164..88c758efe40d 100644
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
>>          int variant;
>>          int reset_gpio;
>>          struct gpio_desc *us_euro_gpio;
>> +       struct mux_control *us_euro_mux;
>> +       u32 mux_state;
>>          u32 micb1_mv;
>>          u32 micb2_mv;
>>          u32 micb3_mv;
>> @@ -3235,17 +3238,31 @@ static void wcd938x_dt_parse_micbias_info(struct device *dev, struct wcd938x_pri
>>                  dev_info(dev, "%s: Micbias4 DT property not found\n", __func__);
>>   }
>>
>> -static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
>> +static int wcd938x_select_mux_state(struct device *dev, struct wcd938x_priv *wcd938x, int state)
>>   {
>> -       int value;
>> +       int ret = mux_control_try_select(wcd938x->us_euro_mux, state);
> 
> Hmm. Does this really work? You have selected the mux in probe
> function, now you are trying to select it again. If I'm reading the
> code correctly, you will get -EBUSY here.

On successful selection of mux state, the mux will be kept available 
(mux_control_deselect) for any new callers.

So we will not get EBUSY for the second caller.

--srini
> 
>>
>> -       struct wcd938x_priv *wcd938x;
>> +       if (ret) {
>> +               dev_err(dev, "Error (%d) Unable to select us/euro mux state\n", ret);
>> +               return ret;
>> +       }
>>
>> -       wcd938x = snd_soc_component_get_drvdata(component);
>> +       wcd938x->mux_state = state;
>> +       mux_control_deselect(wcd938x->us_euro_mux);
>> +
>> +       return 0;
>> +}
>>
>> -       value = gpiod_get_value(wcd938x->us_euro_gpio);
>> +static bool wcd938x_swap_gnd_mic(struct snd_soc_component *component)
>> +{
>> +       struct wcd938x_priv *wcd938x = snd_soc_component_get_drvdata(component);
>>
>> -       gpiod_set_value(wcd938x->us_euro_gpio, !value);
>> +       if (wcd938x->us_euro_mux) {
>> +               if (wcd938x_select_mux_state(component->dev, wcd938x, !wcd938x->mux_state))
>> +                       return false;
>> +       } else {
>> +               gpiod_set_value(wcd938x->us_euro_gpio, !wcd938x->mux_state);
>> +       }
>>
>>          return true;
>>   }
>> @@ -3261,11 +3278,22 @@ static int wcd938x_populate_dt_data(struct wcd938x_priv *wcd938x, struct device
>>                  return dev_err_probe(dev, wcd938x->reset_gpio,
>>                                       "Failed to get reset gpio\n");
>>
>> -       wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro",
>> -                                               GPIOD_OUT_LOW);
>> -       if (IS_ERR(wcd938x->us_euro_gpio))
>> -               return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
>> -                                    "us-euro swap Control GPIO not found\n");
>> +       wcd938x->us_euro_mux = devm_mux_control_get(dev, NULL);
>> +       if (IS_ERR(wcd938x->us_euro_mux)) {
>> +               if (PTR_ERR(wcd938x->us_euro_mux) == -EPROBE_DEFER)
>> +                       return -EPROBE_DEFER;
>> +
>> +               /* mux is optional and now fallback to using gpio */
>> +               wcd938x->us_euro_mux = NULL;
>> +               wcd938x->us_euro_gpio = devm_gpiod_get_optional(dev, "us-euro", GPIOD_OUT_LOW);
>> +               if (IS_ERR(wcd938x->us_euro_gpio))
>> +                       return dev_err_probe(dev, PTR_ERR(wcd938x->us_euro_gpio),
>> +                                            "us-euro swap Control GPIO not found\n");
>> +       } else {
>> +               ret = wcd938x_select_mux_state(dev, wcd938x, wcd938x->mux_state);
>> +               if (ret)
>> +                       return ret;
>> +       }
>>
>>          cfg->swap_gnd_mic = wcd938x_swap_gnd_mic;
>>
>> --
>> 2.39.5
>>
> 
> 

