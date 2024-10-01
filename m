Return-Path: <linux-arm-msm+bounces-32898-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C0E998C354
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 18:25:18 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AC4BE2815E2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Oct 2024 16:25:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CCCB71CC158;
	Tue,  1 Oct 2024 16:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QUVHDEAy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB5CD1C9EA6;
	Tue,  1 Oct 2024 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727799808; cv=none; b=NjQH28WG/iSVpxRTvWh+Mvc3oqHixuKsXnUxx9deIUk4oyPwbDEBJNdesoipE9lmY4KBbxFORTdb49oLiP/L1xsgbw+Y2D9PGNPRE5bENyBCOprPepRwYz3eucUxOEvDkEPkdJ3QlkYJWE7oUsGRnq28P/Pf9L8qna7t+OBYpjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727799808; c=relaxed/simple;
	bh=IJavUK5WJXqRpVf9hiSQVkHvMz4LNmrbRRWDl5IeeJ4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RH+0Ved13n8lXFFYLj3UkUdOtKxepercR4ovRVnniFTKTEKvHLtxUTXmqDQc3h4GWp19KPL5iGUsuehpjM+QAkOLvz5FyayXQONcXndeOQwD+sVJdlaqkqyF+6pMeKky0Dq7Z3oKCXKkrgfCPfasOam7AUGgjKB3Pe2BLqx0Suk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QUVHDEAy; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-42e748f78d6so47283705e9.0;
        Tue, 01 Oct 2024 09:23:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727799804; x=1728404604; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8VG1nCJDA6qrToU6qHnktcYNvSZlr6WxpXfQRVF5X+U=;
        b=QUVHDEAyISSbPCOq015N2XJfTlPRygpNfejw0Had01qOBYVuNoRdGvCoWr36xjhMsB
         EMn7LRuylK5CBU3NwlJCB5CvwVTpKUJGW79I9qalHOBbEH6mXMQD16RBLbUYuUDEWWR4
         MKvcwdHD20xv42KOCYbAL/ep6fb8kqVQkk1V/wxlNTS1Cba0rOBCYUMFlHstXGeKjj9y
         wWOcvVK8gi49UyRLt7WXElwNyrhLgfjQ31w2xQTUaWclDcMX2brhWCmxEyty8E1F8EyK
         Ew/gJGFSAOnaTBziebqRv9/j8zd9qxYZRg1HLkPdFddW+8V+JlB6o0CYJGJMNmcTqScd
         taNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727799804; x=1728404604;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8VG1nCJDA6qrToU6qHnktcYNvSZlr6WxpXfQRVF5X+U=;
        b=YospdnHugF39xs0ico3R5WyeD7hcEjCVFWc2mrW6SCMdl9GZ+V86ZyoEgJhf82cdLk
         tzGa+4OQpAg4hkp6sVLJw8pMdcO/Fwp67gV57XqJ3MVqxzKfob38NEKEXBU36XXCEsx/
         fVTfUQ1CqDEX4qcuste8VRb2x8pO+Z2MNSQU10VRP06FMz8N0y0/03dczEGkagCroEZa
         MqX3C8b7r6s4Sb3T3+hlLgl0sFg/rEfik7Gi+ryMnnXC+YtKP4BvPsxMuwp2WmQbFLYH
         Lon+bbQX59hALY1bOSe4QP0YfU/85w7dlGRS/QtorHmx8yrIkjoGKuRfbdrfGPR0HDHQ
         2sMg==
X-Forwarded-Encrypted: i=1; AJvYcCUJLyBhrti4zoJzxSimMdCsvydjIXWm1yio0QBOGYGQ1bS/JC248tkNBxCePIAWGPjsBcf4LUjgxyR+@vger.kernel.org, AJvYcCUwm8Rq57MvlyXDR5E2k2jtSS1XIroqvu9IFONZlmoFYfpO+q21SqWQLmb5wkUjRYBFpfDiYGAjbp1kIpTD@vger.kernel.org, AJvYcCV6vRyQyD8DkRKQHYIBUd4x8JYXlbhJFlpWXQCVcCeQwpvROmYgwgkjxwHFZlReXRYdkW4U7qMGV5L2hQJ3TQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyDROzdrylAymPi+6gOQRf7GQu0Y9nPngxLJdCEbtKrma6PfWX
	VNmGfbHAracotSZt8CUF3bB4Rc67na+28qqScCG5Jqa1gznmmlSL
X-Google-Smtp-Source: AGHT+IGWiASG7Zz7iZwEAPlqWHM705Mjg3np8FL0MRoQt0+wm+qsjXga95Hg65rCspvewgLRDhygUA==
X-Received: by 2002:a05:600c:4ed0:b0:42c:a8cb:6a96 with SMTP id 5b1f17b1804b1-42f778f12b8mr311565e9.31.1727799803773;
        Tue, 01 Oct 2024 09:23:23 -0700 (PDT)
Received: from ?IPV6:2a02:2f04:9003:a900:f328:5b1b:814:3b18? ([2a02:2f04:9003:a900:f328:5b1b:814:3b18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37cd56e94c4sm12097865f8f.62.2024.10.01.09.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Oct 2024 09:23:23 -0700 (PDT)
Message-ID: <d54d98f2-f678-491b-8448-0dd2be32aa82@gmail.com>
Date: Tue, 1 Oct 2024 19:23:21 +0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell
 XPS 13 9345
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
 "Kemp, Bryan" <Bryan.Kemp@dell.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
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
Content-Language: en-US
From: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
In-Reply-To: <CAMcHhXo7PNxoOs3BEhbS7v-hDqEZQSyQJnzHbpTMoRbeaunp3g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alex,

On 10/1/24 19:09, Aleksandrs Vinarskis wrote:
> On Tue, 1 Oct 2024 at 02:47, Kemp, Bryan <Bryan.Kemp@dell.com> wrote:
>>
>> Fascinating topic. First of all, thank you Alex for the explanation of your logic, and thank you as well for the work on the device tree for the XPS 13. I understand completely how the Dell naming/numbering scheme is confusing. The shortened version down to just the model number could also be confusing. For example, there is an XPS 9520 as well as a Latitude 9520. The 9 basically translates to "premium" not a specific line of business. For what it is worth, I would prefer the dell-xps13-9345 naming and I think we can have to be mindful to avoid a naming collision in a decade.
>>
> 
> Hi,
> 
> Thanks for the input, it's really nice to have Dell's perspective as well.
> That's a good point with latitude, I was only aware of 5XXX/7XXX
> naming for that one... which I guess further highlights the confusing
> naming scheme.

Yeah, completely agree. We will raise this internally so that in the 
future we'll do a better job at naming platforms.

> I will re-spin with `dell-xps13-9345` and `dell,xps13-9345`
> respectively as proposed then, unless there will be any other feedback
> on the V3 series before tomorrow.

Great, thanks!

Couple of points:
  - i'm thinking that maybe at a later point, as more dell platforms are 
getting added, we can re-organize the device trees, e.g. have a common 
'dell-xps.dtsi' which gets inherited by specific platforms
  - just noticed that the firmware paths point to something like 
".../dell/tributo/...". Should we reconsider these too? Maybe something 
like ".../dell/xps/..." would be better?

---
Thanks & Best Regards, Laurentiu

> Thanks,
> Alex
> 
>>
>> Thanks again for the support.
>>
>> Bryan Kemp
>> Architect - Linux OS Engineering
>>
>>
>> Internal Use - Confidential
>> -----Original Message-----
>> From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>> Sent: Monday, September 30, 2024 2:24 PM
>> To: Laurentiu Tudor <tudor.laurentiu.oss@gmail.com>
>> Cc: Bjorn Andersson <andersson@kernel.org>; Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>; Dmitry Baryshkov <dmitry.baryshkov@linaro.org>; linux-arm-msm@vger.kernel.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; Tudor, Laurentiu <Laurentiu.Tudor1@dell.com>; Konrad Dybcio <konradybcio@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Rob Clark <robdclark@gmail.com>; Peter de Kraker <peterdekraker@umito.nl>; Kemp, Bryan <Bryan_Kemp@Dell.com>
>> Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: Add support for X1-based Dell XPS 13 9345
>>
>>
>> [EXTERNAL EMAIL]
>>
>> On Mon, 30 Sept 2024 at 20:26, Laurentiu Tudor <tudor.laurentiu.oss@gmail.com> wrote:
>>>
>>> Hi Alex,
>>>
>>> Thanks for this! Comment inline.
>>>
>>> On 9/21/24 19:33, Aleksandrs Vinarskis wrote:
>>>> Initial support for Dell XPS 9345 13" 2024 (Tributo) based on X1E80100.
>>>>
>>>> Working:
>>>> * Touchpad
>>>> * Keyboard (only post suspend&resume, i2c-hid patch WIP)
>>>> * eDP, with brightness control
>>>> * NVME
>>>> * USB Type-C ports in USB2/USB3 (one orientation)
>>>> * WiFi
>>>> * GPU/aDSP/cDSP firmware loading (requires binaries from Windows)
>>>> * Lid switch
>>>> * Sleep/suspend, nothing visibly broken on resume
>>>>
>>>> Not working:
>>>> * Speakers (WIP, pin guessing, x4 WSA8845)
>>>> * Microphones (WIP, pin guessing)
>>>> * Fingerprint Reader (WIP, USB MP with ptn3222)
>>>> * USB as DP/USB3 (WIP, PS8830 based)
>>>> * Camera
>>>> * Battery Info
>>>>
>>>> Should be working, but cannot be tested due to lack of hw:
>>>> * Higher res OLED, higher res IPS panels
>>>> * Touchscreen
>>>>
>>>> Signed-off-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>    .../dts/qcom/x1e80100-dell-tributo-13.dts     | 860 ++++++++++++++++++
>>>
>>>
>>> Could you please use the marketing name for the device tree file name
>>> & machine compatible, e.g. "x1e80100-dell-xps13-9345.dts" for the dts
>>> file and "dell,xps13-9345" for the compat? I'm thinking that this will
>>> help people to identify it more easily.
>>
>> Hi,
>>
>> Even though I agree that it may be easier to identify for a non-developer, I am a bit skeptical as Dell has a pretty weird naming convention which sometimes results in the name being non-unique.
>> In particular case - 9345 - 9 stands for XPS series, 3 stands for 13", and 45 would typically be the last digit of year + 0 (so 40), but with the introduction of last year's ''13 Plus"series they added a 5. At present, this is unique, however in 10 years it may not be.
>>
>> I have recently hit this issue when working on Dell XPS 15" 2024 (9530), which has the same model number as Dell XPS 15" 2013 and led to huge confusions. Only way to distinguish them is by codename ('fiorano' for the newer one), or using a complete name including the year... The codename on the other hand is easily searchable both in the source code and online.
>>
>> I tried to browse the source code for existing notation, but didn't find anything strongly supporting one or another way, so decided to follow Microsoft Surface's example with codenames ('romulus').
>> Codenaming is also imperfect though, as in Dell's case it typically refers to chassis, rather than _the_ particular device, which typically lasts several years. Typically throughout chassis generation internals stay +/- the same, but we can't know if any of the changes would be breaking. Perhaps then, `x1e80100-dell-tributo-9345` and `dell,tributo-9345` respectively, as this would be the shortest yet most complete description? 'Tributo' already implies its XPS 13" and chassis variation (touchar, hidden trackpad etc etc), '9345' implies XPS 13" of 2024 (?) and in combination with chassis variant pinpoints the model.
>> Otherwise, if it's strongly desired to use marketing names it can be reduced down to `x1e80100-dell-9345.dts` and `dell,9345` altogether as
>> 9345 implies it being both 'XPS' series and 13", and we can hope that by 2034 Dell won't repeat the same mistake with naming. Curious to hear maintainers' opinions as well.
>>
>> P.S. I've sent the V3 version of the series, it probably makes sense to move this conversation there for visibility.
>>
>> Alex
>>
>>>
>>> ---
>>> Thanks & Best Regards, Laurentiu
>>>
>>>>    2 files changed, 861 insertions(+)
>>>>    create mode 100644
>>>> arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>>>
>>>
>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile
>>>> b/arch/arm64/boot/dts/qcom/Makefile
>>>> index ae002c7cf126..111c589d6bae 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -271,6 +271,7 @@ dtb-$(CONFIG_ARCH_QCOM)   += sm8650-qrd.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)     += x1e78100-lenovo-thinkpad-t14s.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-asus-vivobook-s15.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-crd.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)      += x1e80100-dell-tributo-13.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-lenovo-yoga-slim7x.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-microsoft-romulus13.dtb
>>>>    dtb-$(CONFIG_ARCH_QCOM)     += x1e80100-microsoft-romulus15.dtb
>>>> diff --git a/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>>>> b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>>>> new file mode 100644
>>>> index 000000000000..ec04b64f9558
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/x1e80100-dell-tributo-13.dts
>>>> @@ -0,0 +1,860 @@
>>>> +// SPDX-License-Identifier: BSD-3-Clause
>>>> +/*
>>>> + * Copyright (c) 2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>> + * Copyright (c) 2024 Aleksandrs Vinarskis
>>>> +<alex.vinarskis@gmail.com>  */
>>>> +
>>>> +/dts-v1/;
>>>> +
>>>> +#include <dt-bindings/gpio/gpio.h>
>>>> +#include <dt-bindings/input/gpio-keys.h> #include
>>>> +<dt-bindings/input/input.h> #include <dt-bindings/leds/common.h>
>>>> +#include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>>> +
>>>> +#include "x1e80100.dtsi"
>>>> +#include "x1e80100-pmics.dtsi"
>>>> +
>>>> +/ {
>>>> +     model = "Dell XPS 13 9345";
>>>> +     compatible = "dell,tributo-13", "qcom,x1e80100";
>>>> +     chassis-type = "laptop";
>>>> +
>>>> +     gpio-keys {
>>>> +             compatible = "gpio-keys";
>>>> +
>>>> +             pinctrl-0 = <&hall_int_n_default>;
>>>> +             pinctrl-names = "default";
>>>> +
>>>> +             switch-lid {
>>>> +                     gpios = <&tlmm 92 GPIO_ACTIVE_LOW>;
>>>> +                     linux,input-type = <EV_SW>;
>>>> +                     linux,code = <SW_LID>;
>>>> +                     wakeup-source;
>>>> +                     wakeup-event-action = <EV_ACT_DEASSERTED>;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     leds {
>>>> +             compatible = "gpio-leds";
>>>> +
>>>> +             pinctrl-names = "default";
>>>> +             pinctrl-0 = <&cam_indicator_en>;
>>>> +
>>>> +             led-camera-indicator {
>>>> +                     label = "white:camera-indicator";
>>>> +                     function = LED_FUNCTION_INDICATOR;
>>>> +                     color = <LED_COLOR_ID_WHITE>;
>>>> +                     gpios = <&tlmm 110 GPIO_ACTIVE_HIGH>;
>>>> +                     linux,default-trigger = "none";
>>>> +                     default-state = "off";
>>>> +                     /* Reuse as a panic indicator until we get a "camera on" trigger */
>>>> +                     panic-indicator;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     pmic-glink {
>>>> +             compatible = "qcom,x1e80100-pmic-glink",
>>>> +                          "qcom,sm8550-pmic-glink",
>>>> +                          "qcom,pmic-glink";
>>>> +             orientation-gpios = <&tlmm 121 GPIO_ACTIVE_HIGH>,
>>>> +                                 <&tlmm 123 GPIO_ACTIVE_HIGH>;
>>>> +             #address-cells = <1>;
>>>> +             #size-cells = <0>;
>>>> +
>>>> +             /* Right-side USB Type-C port */
>>>> +             connector@0 {
>>>> +                     compatible = "usb-c-connector";
>>>> +                     reg = <0>;
>>>> +                     power-role = "dual";
>>>> +                     data-role = "dual";
>>>> +
>>>> +                     ports {
>>>> +                             #address-cells = <1>;
>>>> +                             #size-cells = <0>;
>>>> +
>>>> +                             port@0 {
>>>> +                                     reg = <0>;
>>>> +
>>>> +                                     pmic_glink_ss0_hs_in: endpoint {
>>>> +                                             remote-endpoint = <&usb_1_ss0_dwc3_hs>;
>>>> +                                     };
>>>> +                             };
>>>> +
>>>> +                             port@1 {
>>>> +                                     reg = <1>;
>>>> +
>>>> +                                     pmic_glink_ss0_ss_in: endpoint {
>>>> +                                             remote-endpoint = <&usb_1_ss0_qmpphy_out>;
>>>> +                                     };
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +
>>>> +             /* Left-side USB Type-C port */
>>>> +             connector@1 {
>>>> +                     compatible = "usb-c-connector";
>>>> +                     reg = <1>;
>>>> +                     power-role = "dual";
>>>> +                     data-role = "dual";
>>>> +
>>>> +                     ports {
>>>> +                             #address-cells = <1>;
>>>> +                             #size-cells = <0>;
>>>> +
>>>> +                             port@0 {
>>>> +                                     reg = <0>;
>>>> +
>>>> +                                     pmic_glink_ss1_hs_in: endpoint {
>>>> +                                             remote-endpoint = <&usb_1_ss1_dwc3_hs>;
>>>> +                                     };
>>>> +                             };
>>>> +
>>>> +                             port@1 {
>>>> +                                     reg = <1>;
>>>> +
>>>> +                                     pmic_glink_ss1_ss_in: endpoint {
>>>> +                                             remote-endpoint = <&usb_1_ss1_qmpphy_out>;
>>>> +                                     };
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     reserved-memory {
>>>> +             linux,cma {
>>>> +                     compatible = "shared-dma-pool";
>>>> +                     size = <0x0 0x8000000>;
>>>> +                     reusable;
>>>> +                     linux,cma-default;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     vreg_edp_3p3: regulator-edp-3p3 {
>>>> +             compatible = "regulator-fixed";
>>>> +
>>>> +             regulator-name = "VREG_EDP_3P3";
>>>> +             regulator-min-microvolt = <3300000>;
>>>> +             regulator-max-microvolt = <3300000>;
>>>> +
>>>> +             gpio = <&tlmm 70 GPIO_ACTIVE_HIGH>;
>>>> +             enable-active-high;
>>>> +
>>>> +             pinctrl-0 = <&edp_reg_en>;
>>>> +             pinctrl-names = "default";
>>>> +
>>>> +             regulator-boot-on;
>>>> +     };
>>>> +
>>>> +     vreg_nvme: regulator-nvme {
>>>> +             compatible = "regulator-fixed";
>>>> +
>>>> +             regulator-name = "VREG_NVME_3P3";
>>>> +             regulator-min-microvolt = <3300000>;
>>>> +             regulator-max-microvolt = <3300000>;
>>>> +
>>>> +             gpio = <&tlmm 18 GPIO_ACTIVE_HIGH>;
>>>> +             enable-active-high;
>>>> +
>>>> +             pinctrl-0 = <&nvme_reg_en>;
>>>> +             pinctrl-names = "default";
>>>> +     };
>>>> +
>>>> +     vreg_vph_pwr: regulator-vph-pwr {
>>>> +             compatible = "regulator-fixed";
>>>> +
>>>> +             regulator-name = "vph_pwr";
>>>> +             regulator-min-microvolt = <3700000>;
>>>> +             regulator-max-microvolt = <3700000>;
>>>> +
>>>> +             regulator-always-on;
>>>> +             regulator-boot-on;
>>>> +     };
>>>> +};
>>>> +
>>>> +&apps_rsc {
>>>> +     regulators-0 {
>>>> +             compatible = "qcom,pm8550-rpmh-regulators";
>>>> +             qcom,pmic-id = "b";
>>>> +             vdd-bob1-supply = <&vreg_vph_pwr>;
>>>> +             vdd-bob2-supply = <&vreg_vph_pwr>;
>>>> +             vdd-l1-l4-l10-supply = <&vreg_s4c_1p8>;
>>>> +             vdd-l2-l13-l14-supply = <&vreg_bob1>;
>>>> +             vdd-l5-l16-supply = <&vreg_bob1>;
>>>> +             vdd-l6-l7-supply = <&vreg_bob2>;
>>>> +             vdd-l8-l9-supply = <&vreg_bob1>;
>>>> +             vdd-l12-supply = <&vreg_s5j_1p2>;
>>>> +             vdd-l15-supply = <&vreg_s4c_1p8>;
>>>> +             vdd-l17-supply = <&vreg_bob2>;
>>>> +
>>>> +             vreg_bob1: bob1 {
>>>> +                     regulator-name = "vreg_bob1";
>>>> +                     regulator-min-microvolt = <3008000>;
>>>> +                     regulator-max-microvolt = <3960000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_bob2: bob2 {
>>>> +                     regulator-name = "vreg_bob2";
>>>> +                     regulator-min-microvolt = <2504000>;
>>>> +                     regulator-max-microvolt = <3008000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l2b_3p0: ldo2 {
>>>> +                     regulator-name = "vreg_l2b_3p0";
>>>> +                     regulator-min-microvolt = <3072000>;
>>>> +                     regulator-max-microvolt = <3072000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l4b_1p8: ldo4 {
>>>> +                     regulator-name = "vreg_l4b_1p8";
>>>> +                     regulator-min-microvolt = <1800000>;
>>>> +                     regulator-max-microvolt = <1800000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l6b_1p8: ldo6 {
>>>> +                     regulator-name = "vreg_l6b_1p8";
>>>> +                     regulator-min-microvolt = <1800000>;
>>>> +                     regulator-max-microvolt = <2960000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l8b_3p0: ldo8 {
>>>> +                     regulator-name = "vreg_l8b_3p0";
>>>> +                     regulator-min-microvolt = <3072000>;
>>>> +                     regulator-max-microvolt = <3072000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l9b_2p9: ldo9 {
>>>> +                     regulator-name = "vreg_l9b_2p9";
>>>> +                     regulator-min-microvolt = <2960000>;
>>>> +                     regulator-max-microvolt = <2960000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l12b_1p2: ldo12 {
>>>> +                     regulator-name = "vreg_l12b_1p2";
>>>> +                     regulator-min-microvolt = <1200000>;
>>>> +                     regulator-max-microvolt = <1200000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l13b_3p0: ldo13 {
>>>> +                     regulator-name = "vreg_l13b_3p0";
>>>> +                     regulator-min-microvolt = <3072000>;
>>>> +                     regulator-max-microvolt = <3072000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l14b_3p0: ldo14 {
>>>> +                     regulator-name = "vreg_l14b_3p0";
>>>> +                     regulator-min-microvolt = <3072000>;
>>>> +                     regulator-max-microvolt = <3072000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l15b_1p8: ldo15 {
>>>> +                     regulator-name = "vreg_l15b_1p8";
>>>> +                     regulator-min-microvolt = <1800000>;
>>>> +                     regulator-max-microvolt = <1800000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l17b_2p5: ldo17 {
>>>> +                     regulator-name = "vreg_l17b_2p5";
>>>> +                     regulator-min-microvolt = <2504000>;
>>>> +                     regulator-max-microvolt = <2504000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     regulators-1 {
>>>> +             compatible = "qcom,pm8550ve-rpmh-regulators";
>>>> +             qcom,pmic-id = "c";
>>>> +             vdd-l1-supply = <&vreg_s5j_1p2>;
>>>> +             vdd-l2-supply = <&vreg_s1f_0p7>;
>>>> +             vdd-l3-supply = <&vreg_s1f_0p7>;
>>>> +
>>>> +             vreg_s4c_1p8: smps4 {
>>>> +                     regulator-name = "vreg_s4c_1p8";
>>>> +                     regulator-min-microvolt = <1856000>;
>>>> +                     regulator-max-microvolt = <2000000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l1c_1p2: ldo1 {
>>>> +                     regulator-name = "vreg_l1c_1p2";
>>>> +                     regulator-min-microvolt = <1200000>;
>>>> +                     regulator-max-microvolt = <1200000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l2c_0p8: ldo2 {
>>>> +                     regulator-name = "vreg_l2c_0p8";
>>>> +                     regulator-min-microvolt = <880000>;
>>>> +                     regulator-max-microvolt = <880000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l3c_0p9: ldo3 {
>>>> +                     regulator-name = "vreg_l3c_0p9";
>>>> +                     regulator-min-microvolt = <920000>;
>>>> +                     regulator-max-microvolt = <920000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     regulators-2 {
>>>> +             compatible = "qcom,pmc8380-rpmh-regulators";
>>>> +             qcom,pmic-id = "d";
>>>> +             vdd-l1-supply = <&vreg_s1f_0p7>;
>>>> +             vdd-l2-supply = <&vreg_s1f_0p7>;
>>>> +             vdd-l3-supply = <&vreg_s4c_1p8>;
>>>> +             vdd-s1-supply = <&vreg_vph_pwr>;
>>>> +
>>>> +             vreg_l1d_0p8: ldo1 {
>>>> +                     regulator-name = "vreg_l1d_0p8";
>>>> +                     regulator-min-microvolt = <880000>;
>>>> +                     regulator-max-microvolt = <880000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l2d_0p9: ldo2 {
>>>> +                     regulator-name = "vreg_l2d_0p9";
>>>> +                     regulator-min-microvolt = <912000>;
>>>> +                     regulator-max-microvolt = <912000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l3d_1p8: ldo3 {
>>>> +                     regulator-name = "vreg_l3d_1p8";
>>>> +                     regulator-min-microvolt = <1800000>;
>>>> +                     regulator-max-microvolt = <1800000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     regulators-3 {
>>>> +             compatible = "qcom,pmc8380-rpmh-regulators";
>>>> +             qcom,pmic-id = "e";
>>>> +             vdd-l2-supply = <&vreg_s1f_0p7>;
>>>> +             vdd-l3-supply = <&vreg_s5j_1p2>;
>>>> +
>>>> +             vreg_l2e_0p8: ldo2 {
>>>> +                     regulator-name = "vreg_l2e_0p8";
>>>> +                     regulator-min-microvolt = <880000>;
>>>> +                     regulator-max-microvolt = <880000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l3e_1p2: ldo3 {
>>>> +                     regulator-name = "vreg_l3e_1p2";
>>>> +                     regulator-min-microvolt = <1200000>;
>>>> +                     regulator-max-microvolt = <1200000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     regulators-4 {
>>>> +             compatible = "qcom,pmc8380-rpmh-regulators";
>>>> +             qcom,pmic-id = "f";
>>>> +             vdd-l1-supply = <&vreg_s5j_1p2>;
>>>> +             vdd-l2-supply = <&vreg_s5j_1p2>;
>>>> +             vdd-l3-supply = <&vreg_s5j_1p2>;
>>>> +             vdd-s1-supply = <&vreg_vph_pwr>;
>>>> +
>>>> +             vreg_s1f_0p7: smps1 {
>>>> +                     regulator-name = "vreg_s1f_0p7";
>>>> +                     regulator-min-microvolt = <700000>;
>>>> +                     regulator-max-microvolt = <1100000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     regulators-6 {
>>>> +             compatible = "qcom,pm8550ve-rpmh-regulators";
>>>> +             qcom,pmic-id = "i";
>>>> +             vdd-l1-supply = <&vreg_s4c_1p8>;
>>>> +             vdd-l2-supply = <&vreg_s5j_1p2>;
>>>> +             vdd-l3-supply = <&vreg_s1f_0p7>;
>>>> +             vdd-s1-supply = <&vreg_vph_pwr>;
>>>> +             vdd-s2-supply = <&vreg_vph_pwr>;
>>>> +
>>>> +             vreg_s1i_0p9: smps1 {
>>>> +                     regulator-name = "vreg_s1i_0p9";
>>>> +                     regulator-min-microvolt = <900000>;
>>>> +                     regulator-max-microvolt = <920000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_s2i_1p0: smps2 {
>>>> +                     regulator-name = "vreg_s2i_1p0";
>>>> +                     regulator-min-microvolt = <1000000>;
>>>> +                     regulator-max-microvolt = <1100000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l1i_1p8: ldo1 {
>>>> +                     regulator-name = "vreg_l1i_1p8";
>>>> +                     regulator-min-microvolt = <1800000>;
>>>> +                     regulator-max-microvolt = <1800000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l2i_1p2: ldo2 {
>>>> +                     regulator-name = "vreg_l2i_1p2";
>>>> +                     regulator-min-microvolt = <1200000>;
>>>> +                     regulator-max-microvolt = <1200000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l3i_0p8: ldo3 {
>>>> +                     regulator-name = "vreg_l3i_0p8";
>>>> +                     regulator-min-microvolt = <880000>;
>>>> +                     regulator-max-microvolt = <880000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     regulators-7 {
>>>> +             compatible = "qcom,pm8550ve-rpmh-regulators";
>>>> +             qcom,pmic-id = "j";
>>>> +             vdd-l1-supply = <&vreg_s1f_0p7>;
>>>> +             vdd-l2-supply = <&vreg_s5j_1p2>;
>>>> +             vdd-l3-supply = <&vreg_s1f_0p7>;
>>>> +             vdd-s5-supply = <&vreg_vph_pwr>;
>>>> +
>>>> +             vreg_s5j_1p2: smps5 {
>>>> +                     regulator-name = "vreg_s5j_1p2";
>>>> +                     regulator-min-microvolt = <1256000>;
>>>> +                     regulator-max-microvolt = <1304000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l1j_0p9: ldo1 {
>>>> +                     regulator-name = "vreg_l1j_0p9";
>>>> +                     regulator-min-microvolt = <912000>;
>>>> +                     regulator-max-microvolt = <912000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l2j_1p2: ldo2 {
>>>> +                     regulator-name = "vreg_l2j_1p2";
>>>> +                     regulator-min-microvolt = <1256000>;
>>>> +                     regulator-max-microvolt = <1256000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +
>>>> +             vreg_l3j_0p8: ldo3 {
>>>> +                     regulator-name = "vreg_l3j_0p8";
>>>> +                     regulator-min-microvolt = <880000>;
>>>> +                     regulator-max-microvolt = <880000>;
>>>> +                     regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>>> +             };
>>>> +     };
>>>> +};
>>>> +
>>>> +&gpu {
>>>> +     status = "okay";
>>>> +
>>>> +     zap-shader {
>>>> +             firmware-name = "qcom/x1e80100/dell/tributo/qcdxkmsuc8380.mbn";
>>>> +     };
>>>> +};
>>>> +
>>>> +&i2c0 {
>>>> +     clock-frequency = <400000>;
>>>> +     status = "okay";
>>>> +
>>>> +     keyboard@5 {
>>>> +             compatible = "hid-over-i2c";
>>>> +             reg = <0x5>;
>>>> +
>>>> +             hid-descr-addr = <0x20>;
>>>> +             interrupts-extended = <&tlmm 67 IRQ_TYPE_LEVEL_LOW>;
>>>> +
>>>> +             pinctrl-0 = <&kybd_default>;
>>>> +             pinctrl-names = "default";
>>>> +
>>>> +             wakeup-source;
>>>> +     };
>>>> +};
>>>> +
>>>> +&i2c3 {
>>>> +     clock-frequency = <400000>;
>>>> +     status = "disabled";
>>>> +     /* PS8830 Retimer @0x8 */
>>>> +     /* Unknown device @0x9 */
>>>> +};
>>>> +
>>>> +&i2c5 {
>>>> +     clock-frequency = <100000>;
>>>> +     status = "disabled";
>>>> +     /* Unknown device @0x3b */
>>>> +};
>>>> +
>>>> +&i2c7 {
>>>> +     clock-frequency = <400000>;
>>>> +     status = "disabled";
>>>> +     /* PS8830 Retimer @0x8 */
>>>> +     /* Unknown device @0x9 */
>>>> +};
>>>> +
>>>> +&i2c8 {
>>>> +     clock-frequency = <400000>;
>>>> +
>>>> +     status = "okay";
>>>> +
>>>> +     touchscreen@0 {
>>>> +             compatible = "hid-over-i2c";
>>>> +             reg = <0x0>;
>>>> +
>>>> +             hid-descr-addr = <0x1>;
>>>> +             interrupts-extended = <&tlmm 51 IRQ_TYPE_LEVEL_LOW>;
>>>> +
>>>> +             pinctrl-0 = <&ts0_default>;
>>>> +             pinctrl-names = "default";
>>>> +     };
>>>> +};
>>>> +
>>>> +&i2c9 {
>>>> +     clock-frequency = <400000>;
>>>> +     status = "disabled";
>>>> +     /* USB3 retimer device @0x4f */ };
>>>> +
>>>> +&i2c17 {
>>>> +     clock-frequency = <400000>;
>>>> +     status = "okay";
>>>> +
>>>> +     touchpad@2c {
>>>> +             compatible = "hid-over-i2c";
>>>> +             reg = <0x2c>;
>>>> +
>>>> +             hid-descr-addr = <0x20>;
>>>> +             interrupts-extended = <&tlmm 3 IRQ_TYPE_LEVEL_LOW>;
>>>> +
>>>> +             pinctrl-0 = <&tpad_default>;
>>>> +             pinctrl-names = "default";
>>>> +
>>>> +             wakeup-source;
>>>> +     };
>>>> +};
>>>> +
>>>> +&mdss {
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&mdss_dp3 {
>>>> +     compatible = "qcom,x1e80100-dp";
>>>> +     /delete-property/ #sound-dai-cells;
>>>> +
>>>> +     status = "okay";
>>>> +
>>>> +     aux-bus {
>>>> +             panel {
>>>> +                     /* 1920x1200 IPS panel is SHP1593, PNP09FF compatible */
>>>> +                     compatible = "edp-panel";
>>>> +                     power-supply = <&vreg_edp_3p3>;
>>>> +
>>>> +                     port {
>>>> +                             edp_panel_in: endpoint {
>>>> +                                     remote-endpoint = <&mdss_dp3_out>;
>>>> +                             };
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +
>>>> +     ports {
>>>> +             port@1 {
>>>> +                     reg = <1>;
>>>> +
>>>> +                     mdss_dp3_out: endpoint {
>>>> +                             data-lanes = <0 1 2 3>;
>>>> +                             link-frequencies = /bits/ 64
>>>> + <1620000000 2700000000 5400000000 8100000000>;
>>>> +
>>>> +                             remote-endpoint = <&edp_panel_in>;
>>>> +                     };
>>>> +             };
>>>> +     };
>>>> +};
>>>> +
>>>> +&mdss_dp3_phy {
>>>> +     vdda-phy-supply = <&vreg_l3j_0p8>;
>>>> +     vdda-pll-supply = <&vreg_l2j_1p2>;
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&pcie4 {
>>>> +     perst-gpios = <&tlmm 146 GPIO_ACTIVE_LOW>;
>>>> +     wake-gpios = <&tlmm 148 GPIO_ACTIVE_LOW>;
>>>> +
>>>> +     pinctrl-0 = <&pcie4_default>;
>>>> +     pinctrl-names = "default";
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&pcie4_phy {
>>>> +     vdda-phy-supply = <&vreg_l3i_0p8>;
>>>> +     vdda-pll-supply = <&vreg_l3e_1p2>;
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&pcie6a {
>>>> +     perst-gpios = <&tlmm 152 GPIO_ACTIVE_LOW>;
>>>> +     wake-gpios = <&tlmm 154 GPIO_ACTIVE_LOW>;
>>>> +
>>>> +     vddpe-3v3-supply = <&vreg_nvme>;
>>>> +
>>>> +     pinctrl-0 = <&pcie6a_default>;
>>>> +     pinctrl-names = "default";
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&pcie6a_phy {
>>>> +     vdda-phy-supply = <&vreg_l1d_0p8>;
>>>> +     vdda-pll-supply = <&vreg_l2j_1p2>;
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&qupv3_0 {
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&qupv3_1 {
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&qupv3_2 {
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&remoteproc_adsp {
>>>> +     firmware-name = "qcom/x1e80100/dell/tributo/qcadsp8380.mbn",
>>>> +                     "qcom/x1e80100/dell/tributo/adsp_dtbs.elf";
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&remoteproc_cdsp {
>>>> +     firmware-name = "qcom/x1e80100/dell/tributo/qccdsp8380.mbn",
>>>> +                     "qcom/x1e80100/dell/tributo/cdsp_dtbs.elf";
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&smb2360_0_eusb2_repeater {
>>>> +     vdd18-supply = <&vreg_l3d_1p8>;
>>>> +     vdd3-supply = <&vreg_l2b_3p0>; };
>>>> +
>>>> +&smb2360_1_eusb2_repeater {
>>>> +     vdd18-supply = <&vreg_l3d_1p8>;
>>>> +     vdd3-supply = <&vreg_l14b_3p0>; };
>>>> +
>>>> +&tlmm {
>>>> +     gpio-reserved-ranges = <44 4>,  /* SPI11 (TPM) */
>>>> +                            <76 4>,  /* SPI19 (TZ Protected) */
>>>> +                            <238 1>; /* UFS Reset */
>>>> +
>>>> +     cam_indicator_en: cam-indicator-en-state {
>>>> +             pins = "gpio110";
>>>> +             function = "gpio";
>>>> +             drive-strength = <2>;
>>>> +             bias-disable;
>>>> +     };
>>>> +
>>>> +     edp_reg_en: edp-reg-en-state {
>>>> +             pins = "gpio70";
>>>> +             function = "gpio";
>>>> +             drive-strength = <16>;
>>>> +             bias-disable;
>>>> +     };
>>>> +
>>>> +     hall_int_n_default: hall-int-n-state {
>>>> +             pins = "gpio92";
>>>> +             function = "gpio";
>>>> +
>>>> +             bias-disable;
>>>> +     };
>>>> +
>>>> +     kybd_default: kybd-default-state {
>>>> +             pins = "gpio67";
>>>> +             function = "gpio";
>>>> +             bias-pull-up;
>>>> +     };
>>>> +
>>>> +     nvme_reg_en: nvme-reg-en-state {
>>>> +             pins = "gpio18";
>>>> +             function = "gpio";
>>>> +             drive-strength = <2>;
>>>> +             bias-disable;
>>>> +     };
>>>> +
>>>> +     pcie4_default: pcie4-default-state {
>>>> +             clkreq-n-pins {
>>>> +                     pins = "gpio147";
>>>> +                     function = "pcie4_clk";
>>>> +                     drive-strength = <2>;
>>>> +                     bias-pull-up;
>>>> +             };
>>>> +
>>>> +             perst-n-pins {
>>>> +                     pins = "gpio146";
>>>> +                     function = "gpio";
>>>> +                     drive-strength = <2>;
>>>> +                     bias-disable;
>>>> +             };
>>>> +
>>>> +             wake-n-pins {
>>>> +                     pins = "gpio148";
>>>> +                     function = "gpio";
>>>> +                     drive-strength = <2>;
>>>> +                     bias-pull-up;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     pcie6a_default: pcie6a-default-state {
>>>> +             clkreq-n-pins {
>>>> +                     pins = "gpio153";
>>>> +                     function = "pcie6a_clk";
>>>> +                     drive-strength = <2>;
>>>> +                     bias-pull-up;
>>>> +             };
>>>> +
>>>> +             perst-n-pins {
>>>> +                     pins = "gpio152";
>>>> +                     function = "gpio";
>>>> +                     drive-strength = <2>;
>>>> +                     bias-disable;
>>>> +             };
>>>> +
>>>> +             wake-n-pins {
>>>> +                     pins = "gpio154";
>>>> +                     function = "gpio";
>>>> +                     drive-strength = <2>;
>>>> +                     bias-pull-up;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     tpad_default: tpad-default-state {
>>>> +             disable-pins {
>>>> +                     pins = "gpio38";
>>>> +                     function = "gpio";
>>>> +                     output-high;
>>>> +             };
>>>> +
>>>> +             int-n-pins {
>>>> +                     pins = "gpio3";
>>>> +                     function = "gpio";
>>>> +                     bias-pull-up;
>>>> +             };
>>>> +
>>>> +             reset-n-pins {
>>>> +                     pins = "gpio52";
>>>> +                     function = "gpio";
>>>> +                     bias-disable;
>>>> +             };
>>>> +     };
>>>> +
>>>> +     ts0_default: ts0-default-state {
>>>> +             disable-pins {
>>>> +                     pins = "gpio75";
>>>> +                     function = "gpio";
>>>> +                     output-high;
>>>> +             };
>>>> +
>>>> +             int-n-pins {
>>>> +                     pins = "gpio51";
>>>> +                     function = "gpio";
>>>> +                     bias-pull-up;
>>>> +             };
>>>> +
>>>> +             reset-n-pins {
>>>> +                     /* Technically should be High-Z input */
>>>> +                     pins = "gpio48";
>>>> +                     function = "gpio";
>>>> +                     output-low;
>>>> +                     drive-strength = <2>;
>>>> +             };
>>>> +     };
>>>> +};
>>>> +
>>>> +&uart21 {
>>>> +     compatible = "qcom,geni-debug-uart";
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_ss0_hsphy {
>>>> +     vdd-supply = <&vreg_l3j_0p8>;
>>>> +     vdda12-supply = <&vreg_l2j_1p2>;
>>>> +
>>>> +     phys = <&smb2360_0_eusb2_repeater>;
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_ss0_qmpphy {
>>>> +     vdda-phy-supply = <&vreg_l3e_1p2>;
>>>> +     vdda-pll-supply = <&vreg_l1j_0p9>;
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_ss0 {
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_ss0_dwc3 {
>>>> +     dr_mode = "host";
>>>> +};
>>>> +
>>>> +&usb_1_ss0_dwc3_hs {
>>>> +     remote-endpoint = <&pmic_glink_ss0_hs_in>; };
>>>> +
>>>> +&usb_1_ss0_qmpphy_out {
>>>> +     remote-endpoint = <&pmic_glink_ss0_ss_in>; };
>>>> +
>>>> +&usb_1_ss1_hsphy {
>>>> +     vdd-supply = <&vreg_l3j_0p8>;
>>>> +     vdda12-supply = <&vreg_l2j_1p2>;
>>>> +
>>>> +     phys = <&smb2360_1_eusb2_repeater>;
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_ss1_qmpphy {
>>>> +     vdda-phy-supply = <&vreg_l3e_1p2>;
>>>> +     vdda-pll-supply = <&vreg_l2d_0p9>;
>>>> +
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_ss1 {
>>>> +     status = "okay";
>>>> +};
>>>> +
>>>> +&usb_1_ss1_dwc3 {
>>>> +     dr_mode = "host";
>>>> +};
>>>> +
>>>> +&usb_1_ss1_dwc3_hs {
>>>> +     remote-endpoint = <&pmic_glink_ss1_hs_in>; };
>>>> +
>>>> +&usb_1_ss1_qmpphy_out {
>>>> +     remote-endpoint = <&pmic_glink_ss1_ss_in>; };
>>>


