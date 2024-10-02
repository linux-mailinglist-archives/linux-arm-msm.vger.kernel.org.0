Return-Path: <linux-arm-msm+bounces-32966-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DA9298E351
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 21:06:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3FF631C228AA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 19:06:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB04B1D173A;
	Wed,  2 Oct 2024 19:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TXs7mX1p"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2A7433A9;
	Wed,  2 Oct 2024 19:06:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727896013; cv=none; b=FrZct8fNA9fObInQeHspEeelP5YqCSFWiSmTMheeupGzFgD1vy5tjq4ROfSnCxek3FCsWFINS7QOfCfymWJc/oML90Mk2CCNMehXR1h+za4ZE7sFQjvolcqni5GM3KQbPjjjlf6kz+Nf5LIYINYVqEfeA653q5Hg0d3EMCcplLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727896013; c=relaxed/simple;
	bh=YBYS/SLkSSFrOnTVPetAGCFPzDdbEuhhKGCXiBPSp7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GtEuB1+V09eNm3GDFjRLI7066h65XQi10jnRtjaXYHe35bDp6Hi0e9jso6hGHk9E4SecASJ++cLD4ncdqpJiJN57m0iOs+PA8Ufc6guheRK9jkcY3mxL/V/yVqPj+tFyVHP0UtscTyboi3IyK5AQskKmtSlNEBjv4t8EtsCpHzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TXs7mX1p; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-a8a7b1c2f2bso13540366b.0;
        Wed, 02 Oct 2024 12:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727896009; x=1728500809; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CDYs9o4Cln9DJZqYmJszGkRBmVOTs/FYBFCqf8T+Ggo=;
        b=TXs7mX1pd+7HBOlA7YfAaoTikIJfjLHveSzmBOReYyc2LgBE1mydfLZW0ZQPJk4Zhg
         UDyixKruCLcOi8HOOMG6MIZeMFoXmB8aUTLdzHoJUxBMSPbWy/+n7goufJ+ep4jcYYk6
         6xn8x5BrIE85+IPfV9j8UV+c84QIeaSnlcPq64TaBLbWXz6Ntfdtg8CwGCyR06rJ3QSH
         P+Oxvz6nf7K6kWRuTH9DT5cx3oeq0Gss86lipIqg+tQi5Ug3K5n3I+iHbFVqsX9gtVuo
         qAF18n4sIqzhWUf6z0naLRF/nd4S74BdHC5qutZPB/TLb9ztEUGqbC3h3tIkTwvIutR3
         M9UQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727896009; x=1728500809;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CDYs9o4Cln9DJZqYmJszGkRBmVOTs/FYBFCqf8T+Ggo=;
        b=DtYMhRrc5tirp0E3Y4th28Uz4W7zk8M3DpYC6zjrhY2Ezc7F/Lc3hBUb0eohw+B0yg
         pm+fBPKy0Xel2v2V16S8janjUG5tk8yOOOHmpCi8jJxgsG/8duYw0fNnDxiDTj3ZQsRA
         NhKCyS8coNJDV2Gkf5TrlX7HnuvWnE5CN68iMeQ5eB+HrHfNnMoGBu637NNe7Xf6a5Tq
         uAOXHG6Hkf0z26RjPNPMcgTbecQzxriRFL+tyarqXT2rab3NUVDYo+HuSwbK5cVVQhha
         hUCfhCbVe1eB/urWgIDW2xi/C5QjhNDuv9xAH9DsELKGG3W2wTzhnOjHI6YnJHXiK+ND
         ZK9w==
X-Forwarded-Encrypted: i=1; AJvYcCUpzDAoax84xzKNDamtOP+bRzBUZQ0NuZgPWGSLM8dHLd1RVqHkGZh4njjIDc25+ysw4pcj/B9E8ssEf39Nbg==@vger.kernel.org, AJvYcCVORZRU5iQTdQjzFkwZHUIbJ1K/ozCBR4bLyoGpQ5wsVSnJIf6QRuPkLDXhRoYhTAVff42AGPhTsm8q@vger.kernel.org, AJvYcCWewE51nN25+Y38Y1doOHztZsgipcAWUFJkVdnVQfb0iHI2fZSuaSDwy3JfxgaWLAP1VV/T5dIteg8R4eOZ@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1cZsE6Tt7mZbc+6BpUAD+BvqlfLhDWAL3prSfyafb3untbupH
	/XvBfFvVmOlsOe0mPp+rWHtm3UiHSwiRsOTE1VBSZd3Hi5BSOsl8
X-Google-Smtp-Source: AGHT+IGtiX6lX1AOBusYxfgohjNqeZ1Q7X+ZV2P1uB9S6No/K6EK8t6JRmKdhw8QJRG+LLcXTfv4wQ==
X-Received: by 2002:a17:907:3fa4:b0:a93:d5d3:def6 with SMTP id a640c23a62f3a-a98f821ea56mr360789066b.19.1727896008745;
        Wed, 02 Oct 2024 12:06:48 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:9003:a900:8629:1024:80c1:8758? ([2a02:2f04:9003:a900:8629:1024:80c1:8758])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a93c2947a86sm900016966b.124.2024.10.02.12.06.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Oct 2024 12:06:43 -0700 (PDT)
Message-ID: <322946b9-bef1-488b-a1a7-e35b057ee018@gmail.com>
Date: Wed, 2 Oct 2024 22:06:41 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Cc: "Kemp, Bryan" <Bryan.Kemp@dell.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Tudor, Laurentiu" <Laurentiu.Tudor1@dell.com>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Peter de Kraker <peterdekraker@umito.nl>
References: <20240921163455.12577-1-alex.vinarskis@gmail.com>
 <20240921163455.12577-4-alex.vinarskis@gmail.com>
 <f9997a19-5aae-41c9-9ca2-c847d8071230@gmail.com>
 <CAMcHhXohz6kquH_JT9eAKMntxxyjDt+oZUB_kfAO840oJ5=LPQ@mail.gmail.com>
 <PH8PR19MB7071756BFAFA1BA3E92AF3C09E772@PH8PR19MB7071.namprd19.prod.outlook.com>
 <CAMcHhXo7PNxoOs3BEhbS7v-hDqEZQSyQJnzHbpTMoRbeaunp3g@mail.gmail.com>
 <d54d98f2-f678-491b-8448-0dd2be32aa82@gmail.com>
 <CAMcHhXr-0+mBggJ9PmT1G=Jti1BY-bmLfKJUz6=-oKg+4Rs2cg@mail.gmail.com>
Content-Language: en-US
From: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
In-Reply-To: <CAMcHhXr-0+mBggJ9PmT1G=Jti1BY-bmLfKJUz6=-oKg+4Rs2cg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

On 10/1/24 20:57, Aleksandrs Vinarskis wrote:
> On Tue, 1 Oct 2024 at 18:23, Laurentiu Tudor
> <tudor.laurentiu.oss@gmail.com> wrote:
>>
>> Hi Alex,
>>
>> On 10/1/24 19:09, Aleksandrs Vinarskis wrote:
>>> On Tue, 1 Oct 2024 at 02:47, Kemp, Bryan <Bryan.Kemp@dell.com> wrote:
>>>>
>>>> Fascinating topic. First of all, thank you Alex for the explanation of your logic, and thank you as well for the work on the device tree for the XPS 13. I understand completely how the Dell naming/numbering scheme is confusing. The shortened version down to just the model number could also be confusing. For example, there is an XPS 9520 as well as a Latitude 9520. The 9 basically translates to "premium" not a specific line of business. For what it is worth, I would prefer the dell-xps13-9345 naming and I think we can have to be mindful to avoid a naming collision in a decade.
>>>>
>>>
>>> Hi,
>>>
>>> Thanks for the input, it's really nice to have Dell's perspective as well.
>>> That's a good point with latitude, I was only aware of 5XXX/7XXX
>>> naming for that one... which I guess further highlights the confusing
>>> naming scheme.
>>
>> Yeah, completely agree. We will raise this internally so that in the
>> future we'll do a better job at naming platforms.
>>
>>> I will re-spin with `dell-xps13-9345` and `dell,xps13-9345`
>>> respectively as proposed then, unless there will be any other feedback
>>> on the V3 series before tomorrow.
>>
>> Great, thanks!
>>
>> Couple of points:
>>    - i'm thinking that maybe at a later point, as more dell platforms are
>> getting added, we can re-organize the device trees, e.g. have a common
>> 'dell-xps.dtsi' which gets inherited by specific platforms
> 
> Completely agree. Although I'm not sure about the name - analyzing
> DSDT of Tributo it seems there are quite a few more things defined
> than particular laptop utilizes, eg. support for x3 TypeC and x3 USB
> MP while current device only has x2 TypeC and x1 USB MP. I believe
> these are either leftovers of examples being provided to Dell which
> were just left there, or ACPI tables being (at least partially?)
> shared between multiple platforms - eg. Inspiron 14" 7441/Latitude 14"
> 5455 etc. In the latter case (unfortunately cannot test myself due to
> lack of hw) perhaps the .dtsi can be inherited by more than just XPS
> family. If you/Kemp Bryan could share some insight on that already wrt
> to how much is shared (if any), I can split to dtsi/dts with upcoming
> re-spin. Otherwise indeed can be done when the next platform is being
> introduced.

Regarding ACPI, hard to tell as I'm not familiar with what's exposed in 
there... there might be legacy / inconsistent things.

For now, I'd suggest to just stick with what we have at the moment and 
build on that. More to the point, have the device tree for xps13-9345 
accepted and derive from it, if / when at some point in time similar 
platforms show up.

>>    - just noticed that the firmware paths point to something like
>> ".../dell/tributo/...". Should we reconsider these too? Maybe something
>> like ".../dell/xps/..." would be better?
> 
> Yes, will drop 'tributo' altogether. Perhaps "../dell/xps13-9345"
> then, to match the proposed compat? 


Sounds good to me.

> Also when Divo/Huracan/Perfomante
> will come out, those are still "XPS" but I would guess will have
> different firmware files, so maybe it makes sense to be a bit more
> precise with the naming?

On naming, there are ongoing internal discussions to make them more 
coherent.

Apart from that, could you please Cc: us if you plan to submit stuff to 
linux-firmware?
---
Thanks & Best Regards, Laurentiu!

>>>
>>>>
>>>> Thanks again for the support.
>>>>
>>>> Bryan Kemp
>>>> Architect - Linux OS Engineering
>>>>
>>>>
>>>> Internal Use - Confidential
>>>> -----Original Message-----
>>>> From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>>> Sent: Monday, September 30, 2024 2:24 PM
>>>> To: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
>>>> Cc: Bjorn Andersson <andersson@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Dmitry Baryshkov <dmitry.baryshkov@linaro.org>; linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Tudor, Laurentiu <Laurentiu.Tudor1@dell.com>; Konrad Dybcio <konradybcio@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Rob Clark <robdclark@gmail.com>; Peter de Kraker <peterdekraker@umito.nl>; Kemp, Bryan <Bryan_Kemp@Dell.com>
>>>> Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
>>>>
>>>>
>>>> [EXTERNAL EMAIL]
>>>>
>>>> On Mon, 30 Sept 2024 at 20:26, Laurentiu Tudor <tudor.laurentiu.oss@gmail.com> wrote:
>>>>>
>>>>> Hi Alex,
>>>>>
>>>>> Thanks for this! Comment inline.
>>>>>
>>>>> On 9/21/24 19:33, Aleksandrs Vinarskis wrote:
>>>>>> Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.
>>>>>>
>>>>>> Working:
>>>>>> * Touchpad
>>>>>> * Keyboard (only post suspend&resume, i2c-hid patch WIP)
>>>>>> * eDP, with brightness control
>>>>>> * NVME
>>>>>> * USB Type-C ports in USB2/USB3 (one orientation)
>>>>>> * WiFi
>>>>>> * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
>>>>>> * Lid switch
>>>>>> * Sleep/suspend, nothing visibly broken on resume
>>>>>>
>>>>>> Not working:
>>>>>> * Speakers (WIP, pin guessing, x4 WSA8845)
>>>>>> * Microphones (WIP, pin guessing)
>>>>>> * Fingerprint Reader (WIP, USB MP with ptn3222)
>>>>>> * USB as DP/USB3 (WIP, PS8830 based)
>>>>>> * Camera
>>>>>> * Battery Info
>>>>>>
>>>>>> Should be working, but cannot be tested due to lack of hw:
>>>>>> * Higher res OLED, higher res IPS panels
>>>>>> * Touchscreen
>>>>>>
>>>>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>>>>> ---
>>>>>>     arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>>>     .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++++
>>>>>
>>>>>
>>>>> Could you please use the marketing name for the device tree file name
>>>>> & machine compatible, e.g. "x1e80100-dell-xps13-9345.dts" for the dts
>>>>> file and "dell,xps13-9345" for the compat? I'm thinking that this will
>>>>> help people to identify it more easily.
>>>>
>>>> Hi,
>>>>
>>>> Even though I agree that it may be easier to identify for a non-developer, I am a bit skeptical as Dell has a pretty weird naming convention which sometimes results in the name being non-unique.
>>>> In particular case - 9345 - 9 stands for XPS series, 3 stands for 13", and 45 would typically be the last digit of year + 0 (so 40), but with the introduction of last year's ''13 Plus"series they added a 5. At present, this is unique, however in 10 years it may not be.
>>>>
>>>> I have recently hit this issue when working on Dell XPS 15" 2024 (9530), which has the same model number as Dell XPS 15" 2013 and led to huge confusions. Only way to distinguish them is by codename ('fiorano' for the newer one), or using a complete name including the year... The codename on the other hand is easily searchable both in the source code and online.
>>>>
>>>> I tried to browse the source code for existing notation, but didn't find anything strongly supporting one or another way, so decided to follow Microsoft Surface's example with codenames ('romulus').
>>>> Codenaming is also imperfect though, as in Dell's case it typically refers to chassis, rather than _the_ particular device, which typically lasts several years. Typically throughout chassis generation internals stay +/- the same, but we can't know if any of the changes would be breaking. Perhaps then, `x1e80100-dell-tributo-9345` and `dell,tributo-9345` respectively, as this would be the shortest yet most complete description? 'Tributo' already implies its XPS 13" and chassis variation (touchar, hidden trackpad etc etc), '9345' implies XPS 13" of 2024 (?) and in combination with chassis variant pinpoints the model.
>>>> Otherwise, if it's strongly desired to use marketing names it can be reduced down to `x1e80100-dell-9345.dts` and `dell,9345` altogether as
>>>> 9345 implies it being both 'XPS' series and 13", and we can hope that by 2034 Dell won't repeat the same mistake with naming. Curious to hear maintainers' opinions as well.
>>>>
>>>> P.S. I've sent the V3 version of the series, it probably makes sense to move this conversation there for visibility.
>>>>
>>>> Alex
>>>>
>>>>>
>>>>> ---
>>>>> Thanks & Best Regards, Laurentiu
>>>>>
>>>>>>     2 files changed, 861 insertions(+)
>>>>>>     create mode 100644
>>>>>> arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>>>>>
>>>>>
>>>>>
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile
>>>>>> b/arch/arm64/boot/dts/qcom/Makefile
>>>>>> index ae002c7cf126..111c589d6bae 100644
>>>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>>>> @@ -271,6 +271,7 @@ dtb-$(CONFIG_ARCH_QCOM)   += sm8650-qrd.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)     += x1e78100-lenovo-thinkpad-t14s.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-asus-vivobook-s15.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-crd.dtb
>>>>>> +dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-dell-tributo-13.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-lenovo-yoga-slim7x.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-microsoft-romulus13.dtb
>>>>>>     dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-microsoft-romulus15.dtb
>>>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>>>>>> b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>>>>>> new file mode 100644
>>>>>> index 000000000000..ec04b64f9558
>>>>>> --- /dev/null
>>>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>>>>>> @@ -0,0 +1,860 @@
>>>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>>>> +/*
>>>>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>> + * Copyright (c) 2024 Aleksandrs Vinarskis
>>>>>> +<alex.vinarskis@gmail.com>  */
>>>>>> +
>>>>>> +/dts-v1/;
>>>>>> +
>>>>>> +#include <dt-bindings/gpio/gpio.h>
>>>>>> +#include <dt-bindings/input/gpio-keys.h> #include
>>>>>> +<dt-bindings/input/input.h> #include <dt-bindings/leds/common.h>
>>>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>>>> +
>>>>>> +#include "x1e80100.dtsi"
>>>>>> +#include "x1e80100-pmics.dtsi"
>>>>>> +
>>>>>> +/ {
>>>>>> +     model = "Dell XPS 13 9345";
>>>>>> +     compatible = "dell,tributo-13", "qcom,x1e80100";
>>>>>> +     chassis-type = "laptop";
>>>>>> +
>>>>>> +     gpio-keys {
>>>>>> +             compatible = "gpio-keys";
>>>>>> +
>>>>>> +             pinctrl-0 = <&hall_int_n_default>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +
>>>>>> +             switch-lid {
>>>>>> +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
>>>>>> +                     linux,input-type = <EV_SW>;
>>>>>> +                     linux,code = <SW_LID>;
>>>>>> +                     wakeup-source;
>>>>>> +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     leds {
>>>>>> +             compatible = "gpio-leds";
>>>>>> +
>>>>>> +             pinctrl-names = "default";
>>>>>> +             pinctrl-0 = <&cam_indicator_en>;
>>>>>> +
>>>>>> +             led-camera-indicator {
>>>>>> +                     label = "white:camera-indicator";
>>>>>> +                     function = LED_FUNCTION_INDICATOR;
>>>>>> +                     color = <LED_COLOR_ID_WHITE>;
>>>>>> +                     gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
>>>>>> +                     linux,default-trigger = "none";
>>>>>> +                     default-state = "off";
>>>>>> +                     /* Reuse as a panic indicator until we get a "camera on" trigger */
>>>>>> +                     panic-indicator;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     pmic-glink {
>>>>>> +             compatible = "qcom,x1e80100-pmic-glink",
>>>>>> +                          "qcom,sm8550-pmic-glink",
>>>>>> +                          "qcom,pmic-glink";
>>>>>> +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
>>>>>> +                                 <&tlmm 123 GPIO_ACTIVE_HIGH>;
>>>>>> +             #address-cells = <1>;
>>>>>> +             #size-cells = <0>;
>>>>>> +
>>>>>> +             /* Right-side USB Type-C port */
>>>>>> +             connector@0 {
>>>>>> +                     compatible = "usb-c-connector";
>>>>>> +                     reg = <0>;
>>>>>> +                     power-role = "dual";
>>>>>> +                     data-role = "dual";
>>>>>> +
>>>>>> +                     ports {
>>>>>> +                             #address-cells = <1>;
>>>>>> +                             #size-cells = <0>;
>>>>>> +
>>>>>> +                             port@0 {
>>>>>> +                                     reg = <0>;
>>>>>> +
>>>>>> +                                     pmic_glink_ss0_hs_in: endpoint {
>>>>>> +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
>>>>>> +                                     };
>>>>>> +                             };
>>>>>> +
>>>>>> +                             port@1 {
>>>>>> +                                     reg = <1>;
>>>>>> +
>>>>>> +                                     pmic_glink_ss0_ss_in: endpoint {
>>>>>> +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>>>>> +                                     };
>>>>>> +                             };
>>>>>> +                     };
>>>>>> +             };
>>>>>> +
>>>>>> +             /* Left-side USB Type-C port */
>>>>>> +             connector@1 {
>>>>>> +                     compatible = "usb-c-connector";
>>>>>> +                     reg = <1>;
>>>>>> +                     power-role = "dual";
>>>>>> +                     data-role = "dual";
>>>>>> +
>>>>>> +                     ports {
>>>>>> +                             #address-cells = <1>;
>>>>>> +                             #size-cells = <0>;
>>>>>> +
>>>>>> +                             port@0 {
>>>>>> +                                     reg = <0>;
>>>>>> +
>>>>>> +                                     pmic_glink_ss1_hs_in: endpoint {
>>>>>> +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
>>>>>> +                                     };
>>>>>> +                             };
>>>>>> +
>>>>>> +                             port@1 {
>>>>>> +                                     reg = <1>;
>>>>>> +
>>>>>> +                                     pmic_glink_ss1_ss_in: endpoint {
>>>>>> +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
>>>>>> +                                     };
>>>>>> +                             };
>>>>>> +                     };
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     reserved-memory {
>>>>>> +             linux,cma {
>>>>>> +                     compatible = "shared-dma-pool";
>>>>>> +                     size = <0x0 0x8000000>;
>>>>>> +                     reusable;
>>>>>> +                     linux,cma-default;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     vreg_edp_3p3: regulator-edp-3p3 {
>>>>>> +             compatible = "regulator-fixed";
>>>>>> +
>>>>>> +             regulator-name = "VREG_EDP_3P3";
>>>>>> +             regulator-min-microvolt = <3300000>;
>>>>>> +             regulator-max-microvolt = <3300000>;
>>>>>> +
>>>>>> +             gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
>>>>>> +             enable-active-high;
>>>>>> +
>>>>>> +             pinctrl-0 = <&edp_reg_en>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +
>>>>>> +             regulator-boot-on;
>>>>>> +     };
>>>>>> +
>>>>>> +     vreg_nvme: regulator-nvme {
>>>>>> +             compatible = "regulator-fixed";
>>>>>> +
>>>>>> +             regulator-name = "VREG_NVME_3P3";
>>>>>> +             regulator-min-microvolt = <3300000>;
>>>>>> +             regulator-max-microvolt = <3300000>;
>>>>>> +
>>>>>> +             gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
>>>>>> +             enable-active-high;
>>>>>> +
>>>>>> +             pinctrl-0 = <&nvme_reg_en>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +     };
>>>>>> +
>>>>>> +     vreg_vph_pwr: regulator-vph-pwr {
>>>>>> +             compatible = "regulator-fixed";
>>>>>> +
>>>>>> +             regulator-name = "vph_pwr";
>>>>>> +             regulator-min-microvolt = <3700000>;
>>>>>> +             regulator-max-microvolt = <3700000>;
>>>>>> +
>>>>>> +             regulator-always-on;
>>>>>> +             regulator-boot-on;
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>> +&apps_rsc {
>>>>>> +     regulators-0 {
>>>>>> +             compatible = "qcom,pm8550-rpmh-regulators";
>>>>>> +             qcom,pmic-id = "b";
>>>>>> +             vdd-bob1-supply = <&vreg_vph_pwr>;
>>>>>> +             vdd-bob2-supply = <&vreg_vph_pwr>;
>>>>>> +             vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
>>>>>> +             vdd-l2-l13-l14-supply = <&vreg_bob1>;
>>>>>> +             vdd-l5-l16-supply = <&vreg_bob1>;
>>>>>> +             vdd-l6-l7-supply = <&vreg_bob2>;
>>>>>> +             vdd-l8-l9-supply = <&vreg_bob1>;
>>>>>> +             vdd-l12-supply = <&vreg_s5j_1p2>;
>>>>>> +             vdd-l15-supply = <&vreg_s4c_1p8>;
>>>>>> +             vdd-l17-supply = <&vreg_bob2>;
>>>>>> +
>>>>>> +             vreg_bob1: bob1 {
>>>>>> +                     regulator-name = "vreg_bob1";
>>>>>> +                     regulator-min-microvolt = <3008000>;
>>>>>> +                     regulator-max-microvolt = <3960000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_bob2: bob2 {
>>>>>> +                     regulator-name = "vreg_bob2";
>>>>>> +                     regulator-min-microvolt = <2504000>;
>>>>>> +                     regulator-max-microvolt = <3008000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l2b_3p0: ldo2 {
>>>>>> +                     regulator-name = "vreg_l2b_3p0";
>>>>>> +                     regulator-min-microvolt = <3072000>;
>>>>>> +                     regulator-max-microvolt = <3072000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l4b_1p8: ldo4 {
>>>>>> +                     regulator-name = "vreg_l4b_1p8";
>>>>>> +                     regulator-min-microvolt = <1800000>;
>>>>>> +                     regulator-max-microvolt = <1800000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l6b_1p8: ldo6 {
>>>>>> +                     regulator-name = "vreg_l6b_1p8";
>>>>>> +                     regulator-min-microvolt = <1800000>;
>>>>>> +                     regulator-max-microvolt = <2960000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l8b_3p0: ldo8 {
>>>>>> +                     regulator-name = "vreg_l8b_3p0";
>>>>>> +                     regulator-min-microvolt = <3072000>;
>>>>>> +                     regulator-max-microvolt = <3072000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l9b_2p9: ldo9 {
>>>>>> +                     regulator-name = "vreg_l9b_2p9";
>>>>>> +                     regulator-min-microvolt = <2960000>;
>>>>>> +                     regulator-max-microvolt = <2960000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l12b_1p2: ldo12 {
>>>>>> +                     regulator-name = "vreg_l12b_1p2";
>>>>>> +                     regulator-min-microvolt = <1200000>;
>>>>>> +                     regulator-max-microvolt = <1200000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l13b_3p0: ldo13 {
>>>>>> +                     regulator-name = "vreg_l13b_3p0";
>>>>>> +                     regulator-min-microvolt = <3072000>;
>>>>>> +                     regulator-max-microvolt = <3072000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l14b_3p0: ldo14 {
>>>>>> +                     regulator-name = "vreg_l14b_3p0";
>>>>>> +                     regulator-min-microvolt = <3072000>;
>>>>>> +                     regulator-max-microvolt = <3072000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l15b_1p8: ldo15 {
>>>>>> +                     regulator-name = "vreg_l15b_1p8";
>>>>>> +                     regulator-min-microvolt = <1800000>;
>>>>>> +                     regulator-max-microvolt = <1800000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l17b_2p5: ldo17 {
>>>>>> +                     regulator-name = "vreg_l17b_2p5";
>>>>>> +                     regulator-min-microvolt = <2504000>;
>>>>>> +                     regulator-max-microvolt = <2504000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     regulators-1 {
>>>>>> +             compatible = "qcom,pm8550ve-rpmh-regulators";
>>>>>> +             qcom,pmic-id = "c";
>>>>>> +             vdd-l1-supply = <&vreg_s5j_1p2>;
>>>>>> +             vdd-l2-supply = <&vreg_s1f_0p7>;
>>>>>> +             vdd-l3-supply = <&vreg_s1f_0p7>;
>>>>>> +
>>>>>> +             vreg_s4c_1p8: smps4 {
>>>>>> +                     regulator-name = "vreg_s4c_1p8";
>>>>>> +                     regulator-min-microvolt = <1856000>;
>>>>>> +                     regulator-max-microvolt = <2000000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l1c_1p2: ldo1 {
>>>>>> +                     regulator-name = "vreg_l1c_1p2";
>>>>>> +                     regulator-min-microvolt = <1200000>;
>>>>>> +                     regulator-max-microvolt = <1200000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l2c_0p8: ldo2 {
>>>>>> +                     regulator-name = "vreg_l2c_0p8";
>>>>>> +                     regulator-min-microvolt = <880000>;
>>>>>> +                     regulator-max-microvolt = <880000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l3c_0p9: ldo3 {
>>>>>> +                     regulator-name = "vreg_l3c_0p9";
>>>>>> +                     regulator-min-microvolt = <920000>;
>>>>>> +                     regulator-max-microvolt = <920000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     regulators-2 {
>>>>>> +             compatible = "qcom,pmc8380-rpmh-regulators";
>>>>>> +             qcom,pmic-id = "d";
>>>>>> +             vdd-l1-supply = <&vreg_s1f_0p7>;
>>>>>> +             vdd-l2-supply = <&vreg_s1f_0p7>;
>>>>>> +             vdd-l3-supply = <&vreg_s4c_1p8>;
>>>>>> +             vdd-s1-supply = <&vreg_vph_pwr>;
>>>>>> +
>>>>>> +             vreg_l1d_0p8: ldo1 {
>>>>>> +                     regulator-name = "vreg_l1d_0p8";
>>>>>> +                     regulator-min-microvolt = <880000>;
>>>>>> +                     regulator-max-microvolt = <880000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l2d_0p9: ldo2 {
>>>>>> +                     regulator-name = "vreg_l2d_0p9";
>>>>>> +                     regulator-min-microvolt = <912000>;
>>>>>> +                     regulator-max-microvolt = <912000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l3d_1p8: ldo3 {
>>>>>> +                     regulator-name = "vreg_l3d_1p8";
>>>>>> +                     regulator-min-microvolt = <1800000>;
>>>>>> +                     regulator-max-microvolt = <1800000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     regulators-3 {
>>>>>> +             compatible = "qcom,pmc8380-rpmh-regulators";
>>>>>> +             qcom,pmic-id = "e";
>>>>>> +             vdd-l2-supply = <&vreg_s1f_0p7>;
>>>>>> +             vdd-l3-supply = <&vreg_s5j_1p2>;
>>>>>> +
>>>>>> +             vreg_l2e_0p8: ldo2 {
>>>>>> +                     regulator-name = "vreg_l2e_0p8";
>>>>>> +                     regulator-min-microvolt = <880000>;
>>>>>> +                     regulator-max-microvolt = <880000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l3e_1p2: ldo3 {
>>>>>> +                     regulator-name = "vreg_l3e_1p2";
>>>>>> +                     regulator-min-microvolt = <1200000>;
>>>>>> +                     regulator-max-microvolt = <1200000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     regulators-4 {
>>>>>> +             compatible = "qcom,pmc8380-rpmh-regulators";
>>>>>> +             qcom,pmic-id = "f";
>>>>>> +             vdd-l1-supply = <&vreg_s5j_1p2>;
>>>>>> +             vdd-l2-supply = <&vreg_s5j_1p2>;
>>>>>> +             vdd-l3-supply = <&vreg_s5j_1p2>;
>>>>>> +             vdd-s1-supply = <&vreg_vph_pwr>;
>>>>>> +
>>>>>> +             vreg_s1f_0p7: smps1 {
>>>>>> +                     regulator-name = "vreg_s1f_0p7";
>>>>>> +                     regulator-min-microvolt = <700000>;
>>>>>> +                     regulator-max-microvolt = <1100000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     regulators-6 {
>>>>>> +             compatible = "qcom,pm8550ve-rpmh-regulators";
>>>>>> +             qcom,pmic-id = "i";
>>>>>> +             vdd-l1-supply = <&vreg_s4c_1p8>;
>>>>>> +             vdd-l2-supply = <&vreg_s5j_1p2>;
>>>>>> +             vdd-l3-supply = <&vreg_s1f_0p7>;
>>>>>> +             vdd-s1-supply = <&vreg_vph_pwr>;
>>>>>> +             vdd-s2-supply = <&vreg_vph_pwr>;
>>>>>> +
>>>>>> +             vreg_s1i_0p9: smps1 {
>>>>>> +                     regulator-name = "vreg_s1i_0p9";
>>>>>> +                     regulator-min-microvolt = <900000>;
>>>>>> +                     regulator-max-microvolt = <920000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_s2i_1p0: smps2 {
>>>>>> +                     regulator-name = "vreg_s2i_1p0";
>>>>>> +                     regulator-min-microvolt = <1000000>;
>>>>>> +                     regulator-max-microvolt = <1100000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l1i_1p8: ldo1 {
>>>>>> +                     regulator-name = "vreg_l1i_1p8";
>>>>>> +                     regulator-min-microvolt = <1800000>;
>>>>>> +                     regulator-max-microvolt = <1800000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l2i_1p2: ldo2 {
>>>>>> +                     regulator-name = "vreg_l2i_1p2";
>>>>>> +                     regulator-min-microvolt = <1200000>;
>>>>>> +                     regulator-max-microvolt = <1200000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l3i_0p8: ldo3 {
>>>>>> +                     regulator-name = "vreg_l3i_0p8";
>>>>>> +                     regulator-min-microvolt = <880000>;
>>>>>> +                     regulator-max-microvolt = <880000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     regulators-7 {
>>>>>> +             compatible = "qcom,pm8550ve-rpmh-regulators";
>>>>>> +             qcom,pmic-id = "j";
>>>>>> +             vdd-l1-supply = <&vreg_s1f_0p7>;
>>>>>> +             vdd-l2-supply = <&vreg_s5j_1p2>;
>>>>>> +             vdd-l3-supply = <&vreg_s1f_0p7>;
>>>>>> +             vdd-s5-supply = <&vreg_vph_pwr>;
>>>>>> +
>>>>>> +             vreg_s5j_1p2: smps5 {
>>>>>> +                     regulator-name = "vreg_s5j_1p2";
>>>>>> +                     regulator-min-microvolt = <1256000>;
>>>>>> +                     regulator-max-microvolt = <1304000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l1j_0p9: ldo1 {
>>>>>> +                     regulator-name = "vreg_l1j_0p9";
>>>>>> +                     regulator-min-microvolt = <912000>;
>>>>>> +                     regulator-max-microvolt = <912000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l2j_1p2: ldo2 {
>>>>>> +                     regulator-name = "vreg_l2j_1p2";
>>>>>> +                     regulator-min-microvolt = <1256000>;
>>>>>> +                     regulator-max-microvolt = <1256000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +
>>>>>> +             vreg_l3j_0p8: ldo3 {
>>>>>> +                     regulator-name = "vreg_l3j_0p8";
>>>>>> +                     regulator-min-microvolt = <880000>;
>>>>>> +                     regulator-max-microvolt = <880000>;
>>>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>> +&gpu {
>>>>>> +     status = "okay";
>>>>>> +
>>>>>> +     zap-shader {
>>>>>> +             firmware-name = "qcom/x1e80100/dell/tributo/qcdxkmsuc8380.mbn";
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>> +&i2c0 {
>>>>>> +     clock-frequency = <400000>;
>>>>>> +     status = "okay";
>>>>>> +
>>>>>> +     keyboard@5 {
>>>>>> +             compatible = "hid-over-i2c";
>>>>>> +             reg = <0x5>;
>>>>>> +
>>>>>> +             hid-descr-addr = <0x20>;
>>>>>> +             interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
>>>>>> +
>>>>>> +             pinctrl-0 = <&kybd_default>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +
>>>>>> +             wakeup-source;
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>> +&i2c3 {
>>>>>> +     clock-frequency = <400000>;
>>>>>> +     status = "disabled";
>>>>>> +     /* PS8830 Retimer @0x8 */
>>>>>> +     /* Unknown device @0x9 */
>>>>>> +};
>>>>>> +
>>>>>> +&i2c5 {
>>>>>> +     clock-frequency = <100000>;
>>>>>> +     status = "disabled";
>>>>>> +     /* Unknown device @0x3b */
>>>>>> +};
>>>>>> +
>>>>>> +&i2c7 {
>>>>>> +     clock-frequency = <400000>;
>>>>>> +     status = "disabled";
>>>>>> +     /* PS8830 Retimer @0x8 */
>>>>>> +     /* Unknown device @0x9 */
>>>>>> +};
>>>>>> +
>>>>>> +&i2c8 {
>>>>>> +     clock-frequency = <400000>;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +
>>>>>> +     touchscreen@0 {
>>>>>> +             compatible = "hid-over-i2c";
>>>>>> +             reg = <0x0>;
>>>>>> +
>>>>>> +             hid-descr-addr = <0x1>;
>>>>>> +             interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
>>>>>> +
>>>>>> +             pinctrl-0 = <&ts0_default>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>> +&i2c9 {
>>>>>> +     clock-frequency = <400000>;
>>>>>> +     status = "disabled";
>>>>>> +     /* USB3 retimer device @0x4f */ };
>>>>>> +
>>>>>> +&i2c17 {
>>>>>> +     clock-frequency = <400000>;
>>>>>> +     status = "okay";
>>>>>> +
>>>>>> +     touchpad@2c {
>>>>>> +             compatible = "hid-over-i2c";
>>>>>> +             reg = <0x2c>;
>>>>>> +
>>>>>> +             hid-descr-addr = <0x20>;
>>>>>> +             interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>>>>>> +
>>>>>> +             pinctrl-0 = <&tpad_default>;
>>>>>> +             pinctrl-names = "default";
>>>>>> +
>>>>>> +             wakeup-source;
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>> +&mdss {
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&mdss_dp3 {
>>>>>> +     compatible = "qcom,x1e80100-dp";
>>>>>> +     /delete-property/ #sound-dai-cells;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +
>>>>>> +     aux-bus {
>>>>>> +             panel {
>>>>>> +                     /* 1920x1200 IPS panel is SHP1593, PNP09FF compatible */
>>>>>> +                     compatible = "edp-panel";
>>>>>> +                     power-supply = <&vreg_edp_3p3>;
>>>>>> +
>>>>>> +                     port {
>>>>>> +                             edp_panel_in: endpoint {
>>>>>> +                                     remote-endpoint = <&mdss_dp3_out>;
>>>>>> +                             };
>>>>>> +                     };
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     ports {
>>>>>> +             port@1 {
>>>>>> +                     reg = <1>;
>>>>>> +
>>>>>> +                     mdss_dp3_out: endpoint {
>>>>>> +                             data-lanes = <0 1 2 3>;
>>>>>> +                             link-frequencies = /bits/ 64
>>>>>> + <1620000000 2700000000 5400000000 8100000000>;
>>>>>> +
>>>>>> +                             remote-endpoint = <&edp_panel_in>;
>>>>>> +                     };
>>>>>> +             };
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>> +&mdss_dp3_phy {
>>>>>> +     vdda-phy-supply = <&vreg_l3j_0p8>;
>>>>>> +     vdda-pll-supply = <&vreg_l2j_1p2>;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&pcie4 {
>>>>>> +     perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>>>>>> +     wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>>>>>> +
>>>>>> +     pinctrl-0 = <&pcie4_default>;
>>>>>> +     pinctrl-names = "default";
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&pcie4_phy {
>>>>>> +     vdda-phy-supply = <&vreg_l3i_0p8>;
>>>>>> +     vdda-pll-supply = <&vreg_l3e_1p2>;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&pcie6a {
>>>>>> +     perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
>>>>>> +     wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
>>>>>> +
>>>>>> +     vddpe-3v3-supply = <&vreg_nvme>;
>>>>>> +
>>>>>> +     pinctrl-0 = <&pcie6a_default>;
>>>>>> +     pinctrl-names = "default";
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&pcie6a_phy {
>>>>>> +     vdda-phy-supply = <&vreg_l1d_0p8>;
>>>>>> +     vdda-pll-supply = <&vreg_l2j_1p2>;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&qupv3_0 {
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&qupv3_1 {
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&qupv3_2 {
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&remoteproc_adsp {
>>>>>> +     firmware-name = "qcom/x1e80100/dell/tributo/qcadsp8380.mbn",
>>>>>> +                     "qcom/x1e80100/dell/tributo/adsp_dtbs.elf";
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&remoteproc_cdsp {
>>>>>> +     firmware-name = "qcom/x1e80100/dell/tributo/qccdsp8380.mbn",
>>>>>> +                     "qcom/x1e80100/dell/tributo/cdsp_dtbs.elf";
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&smb2360_0_eusb2_repeater {
>>>>>> +     vdd18-supply = <&vreg_l3d_1p8>;
>>>>>> +     vdd3-supply = <&vreg_l2b_3p0>; };
>>>>>> +
>>>>>> +&smb2360_1_eusb2_repeater {
>>>>>> +     vdd18-supply = <&vreg_l3d_1p8>;
>>>>>> +     vdd3-supply = <&vreg_l14b_3p0>; };
>>>>>> +
>>>>>> +&tlmm {
>>>>>> +     gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
>>>>>> +                            <76 4>,  /* SPI19 (TZ Protected) */
>>>>>> +                            <238 1>; /* UFS Reset */
>>>>>> +
>>>>>> +     cam_indicator_en: cam-indicator-en-state {
>>>>>> +             pins = "gpio110";
>>>>>> +             function = "gpio";
>>>>>> +             drive-strength = <2>;
>>>>>> +             bias-disable;
>>>>>> +     };
>>>>>> +
>>>>>> +     edp_reg_en: edp-reg-en-state {
>>>>>> +             pins = "gpio70";
>>>>>> +             function = "gpio";
>>>>>> +             drive-strength = <16>;
>>>>>> +             bias-disable;
>>>>>> +     };
>>>>>> +
>>>>>> +     hall_int_n_default: hall-int-n-state {
>>>>>> +             pins = "gpio92";
>>>>>> +             function = "gpio";
>>>>>> +
>>>>>> +             bias-disable;
>>>>>> +     };
>>>>>> +
>>>>>> +     kybd_default: kybd-default-state {
>>>>>> +             pins = "gpio67";
>>>>>> +             function = "gpio";
>>>>>> +             bias-pull-up;
>>>>>> +     };
>>>>>> +
>>>>>> +     nvme_reg_en: nvme-reg-en-state {
>>>>>> +             pins = "gpio18";
>>>>>> +             function = "gpio";
>>>>>> +             drive-strength = <2>;
>>>>>> +             bias-disable;
>>>>>> +     };
>>>>>> +
>>>>>> +     pcie4_default: pcie4-default-state {
>>>>>> +             clkreq-n-pins {
>>>>>> +                     pins = "gpio147";
>>>>>> +                     function = "pcie4_clk";
>>>>>> +                     drive-strength = <2>;
>>>>>> +                     bias-pull-up;
>>>>>> +             };
>>>>>> +
>>>>>> +             perst-n-pins {
>>>>>> +                     pins = "gpio146";
>>>>>> +                     function = "gpio";
>>>>>> +                     drive-strength = <2>;
>>>>>> +                     bias-disable;
>>>>>> +             };
>>>>>> +
>>>>>> +             wake-n-pins {
>>>>>> +                     pins = "gpio148";
>>>>>> +                     function = "gpio";
>>>>>> +                     drive-strength = <2>;
>>>>>> +                     bias-pull-up;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     pcie6a_default: pcie6a-default-state {
>>>>>> +             clkreq-n-pins {
>>>>>> +                     pins = "gpio153";
>>>>>> +                     function = "pcie6a_clk";
>>>>>> +                     drive-strength = <2>;
>>>>>> +                     bias-pull-up;
>>>>>> +             };
>>>>>> +
>>>>>> +             perst-n-pins {
>>>>>> +                     pins = "gpio152";
>>>>>> +                     function = "gpio";
>>>>>> +                     drive-strength = <2>;
>>>>>> +                     bias-disable;
>>>>>> +             };
>>>>>> +
>>>>>> +             wake-n-pins {
>>>>>> +                     pins = "gpio154";
>>>>>> +                     function = "gpio";
>>>>>> +                     drive-strength = <2>;
>>>>>> +                     bias-pull-up;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     tpad_default: tpad-default-state {
>>>>>> +             disable-pins {
>>>>>> +                     pins = "gpio38";
>>>>>> +                     function = "gpio";
>>>>>> +                     output-high;
>>>>>> +             };
>>>>>> +
>>>>>> +             int-n-pins {
>>>>>> +                     pins = "gpio3";
>>>>>> +                     function = "gpio";
>>>>>> +                     bias-pull-up;
>>>>>> +             };
>>>>>> +
>>>>>> +             reset-n-pins {
>>>>>> +                     pins = "gpio52";
>>>>>> +                     function = "gpio";
>>>>>> +                     bias-disable;
>>>>>> +             };
>>>>>> +     };
>>>>>> +
>>>>>> +     ts0_default: ts0-default-state {
>>>>>> +             disable-pins {
>>>>>> +                     pins = "gpio75";
>>>>>> +                     function = "gpio";
>>>>>> +                     output-high;
>>>>>> +             };
>>>>>> +
>>>>>> +             int-n-pins {
>>>>>> +                     pins = "gpio51";
>>>>>> +                     function = "gpio";
>>>>>> +                     bias-pull-up;
>>>>>> +             };
>>>>>> +
>>>>>> +             reset-n-pins {
>>>>>> +                     /* Technically should be High-Z input */
>>>>>> +                     pins = "gpio48";
>>>>>> +                     function = "gpio";
>>>>>> +                     output-low;
>>>>>> +                     drive-strength = <2>;
>>>>>> +             };
>>>>>> +     };
>>>>>> +};
>>>>>> +
>>>>>> +&uart21 {
>>>>>> +     compatible = "qcom,geni-debug-uart";
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss0_hsphy {
>>>>>> +     vdd-supply = <&vreg_l3j_0p8>;
>>>>>> +     vdda12-supply = <&vreg_l2j_1p2>;
>>>>>> +
>>>>>> +     phys = <&smb2360_0_eusb2_repeater>;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss0_qmpphy {
>>>>>> +     vdda-phy-supply = <&vreg_l3e_1p2>;
>>>>>> +     vdda-pll-supply = <&vreg_l1j_0p9>;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss0 {
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss0_dwc3 {
>>>>>> +     dr_mode = "host";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss0_dwc3_hs {
>>>>>> +     remote-endpoint = <&pmic_glink_ss0_hs_in>; };
>>>>>> +
>>>>>> +&usb_1_ss0_qmpphy_out {
>>>>>> +     remote-endpoint = <&pmic_glink_ss0_ss_in>; };
>>>>>> +
>>>>>> +&usb_1_ss1_hsphy {
>>>>>> +     vdd-supply = <&vreg_l3j_0p8>;
>>>>>> +     vdda12-supply = <&vreg_l2j_1p2>;
>>>>>> +
>>>>>> +     phys = <&smb2360_1_eusb2_repeater>;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss1_qmpphy {
>>>>>> +     vdda-phy-supply = <&vreg_l3e_1p2>;
>>>>>> +     vdda-pll-supply = <&vreg_l2d_0p9>;
>>>>>> +
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss1 {
>>>>>> +     status = "okay";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss1_dwc3 {
>>>>>> +     dr_mode = "host";
>>>>>> +};
>>>>>> +
>>>>>> +&usb_1_ss1_dwc3_hs {
>>>>>> +     remote-endpoint = <&pmic_glink_ss1_hs_in>; };
>>>>>> +
>>>>>> +&usb_1_ss1_qmpphy_out {
>>>>>> +     remote-endpoint = <&pmic_glink_ss1_ss_in>; };
>>>>>
>>


