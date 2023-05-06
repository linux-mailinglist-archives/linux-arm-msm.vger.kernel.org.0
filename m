Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 75BBB6F91FF
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 14:30:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232123AbjEFMay (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 08:30:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231576AbjEFMay (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 08:30:54 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F2BE1568E
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 05:30:52 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2ac806f4fccso31856071fa.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 05:30:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683376251; x=1685968251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vDXewRHi5DlLcSO63aqmmvYj2924AUE72JCjILEK6/Y=;
        b=eTnvcg84EUWceDD5VenapU8oXm4MmitRSwyhCKw5qoTZYqzJWetFR5LI4Xc2cI/KS2
         pZwpPeQ4G/vM44jcYO+QmJwcvKfc8pCUp24i4VfX68ZRgES80LPVQWFDVyxGJ8kVoS1w
         OMnXJnWumapfAMiVGVJGIXMDsoY+3UmlKU9FI4O9DI0UQRf+2e+oEPcOgxnq1v/T9qrS
         jm+5TAKUKA/Mg7bIDZcFl71i/EVNhdA7/fnlCoLLL1rqEee2qFxcWGn7fADE0EceWdAb
         ceUTBycfhnGH3PPUzFJvgJd9A/Y9C4MgAO0nhHMtL6k4qMBTd0NctxQ5OsWRJqxMfzMl
         yGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683376251; x=1685968251;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vDXewRHi5DlLcSO63aqmmvYj2924AUE72JCjILEK6/Y=;
        b=C7jhxeMFHMMCdLF3ZAjJFQHJBvpkJ0q5hq4WMehSLO2s6HY8dxviAQX9zLGaqCtoN4
         +JUq90jmc/hQEQbAQpRM3KBYopli5ddA0nGFx7DEIjElURGnUxj8bmOARkv5pv/ANrRg
         0U2UNVTUnRRkyOwH1aPmqFUDyoiOmCmU1Xy/tjPQS3xnL1XaosiyF2ccO5sUqvf+0BaE
         xA7SaAOJ8DC15RuPOlYgFxhpnfDSxrTzZnXGfR5DoHZmxhd6NYJ1DKCH6QnHpa3o7QvV
         Qrq8DfPnTg/Mh57NHQppsZ01OzNwN3QLOa/UHleRV+Le6yPaPbADNOn7ZCaOkWpJUEL1
         9DRQ==
X-Gm-Message-State: AC+VfDwh6pT+PnFpFSHci7JtXmSQlpdM9Piak7S4EK4MVUyYq6EubJS9
        iy8b/WTAekdZoTjP6vvzLUyHqQ==
X-Google-Smtp-Source: ACHHUZ7UHIlGtIjZEeMM1KAFJBGYWneO79iZuPL8x+BgJN1fSofMUbXweuxepgg8pzkUMeAkjxbwrw==
X-Received: by 2002:ac2:425a:0:b0:4ed:b4f9:28c7 with SMTP id m26-20020ac2425a000000b004edb4f928c7mr1104103lfl.6.1683376250653;
        Sat, 06 May 2023 05:30:50 -0700 (PDT)
Received: from [192.168.1.101] (abyl248.neoplus.adsl.tpnet.pl. [83.9.31.248])
        by smtp.gmail.com with ESMTPSA id w12-20020a056512098c00b004f13c3cb9ffsm637877lft.200.2023.05.06.05.30.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 05:30:50 -0700 (PDT)
Message-ID: <c70fc9de-4e47-b00c-276c-7a4a5ebce594@linaro.org>
Date:   Sat, 6 May 2023 14:30:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add Fxtec Pro1X (QX1050) DTS
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Dang Huynh <danct12@riseup.net>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230505-fxtec-pro1x-support-v2-0-0ea2378ba9ae@riseup.net>
 <20230505-fxtec-pro1x-support-v2-1-0ea2378ba9ae@riseup.net>
 <abae55ef-172b-036f-40a9-b27c38e850ec@linaro.org>
 <CAA8EJprxyHSQqoeNpiLGbx7v+CUgh7Tezw8D3RRY01izywckBg@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprxyHSQqoeNpiLGbx7v+CUgh7Tezw8D3RRY01izywckBg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 6.05.2023 13:48, Dmitry Baryshkov wrote:
> On Fri, 5 May 2023 at 21:41, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 5.05.2023 19:12, Dang Huynh wrote:
>>> The F(x)tec Pro1X is a mobile phone released by FX Technologies Ltd
>>> in 2022.
>>>
>>> The phone is exactly the same as the Pro1 released in 2019 with some
>>> changes:
>>> - MSM8998 -> SM6115
>>> - Camera button is no longer multistate
>>> - Only one 48MP back camera
>>> - A new keyboard layout picked by the community.
>>>
>>> This commit has the following features working:
>>> - Display (using simplefb)
>>> - UFS
>>> - Power and volume buttons
>>> - Pinctrl
>>> - RPM Regulators
>>> - USB (Device Mode)
>>>
>>> To get a successful boot run:
>>>
>>> cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/\
>>> sm6115-fxtec-pro1x.dtb  > .Image.gz-dtb
>>>
>>> mkbootimg --kernel .Image.gz-dtb \
>>> --ramdisk initrd.img \
>>> --base 0x0 \
>>> --kernel_offset 0x8000 \
>>> --ramdisk_offset 0x1000000 \
>>> --second_offset 0xf00000 \
>>> --tags_offset 0x100 \
>>> --pagesize 4096 \
>>> --cmdline "CMDLINE HERE" \
>>> -o qx1050-boot.img
>>>
>>> fastboot flash boot qx1050-boot.img
>>> fastboot erase dtbo
>>> fastboot reboot
>>>
>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>> ---
>>>  arch/arm64/boot/dts/qcom/Makefile               |   1 +
>>>  arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 248 ++++++++++++++++++++++++
>>>  2 files changed, 249 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>> index d42c59572ace..e311ba675f35 100644
>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>> @@ -174,6 +174,7 @@ dtb-$(CONFIG_ARCH_QCOM)   += sdm845-shift-axolotl.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)      += sdm850-lenovo-yoga-c630.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)      += sdm850-samsung-w737.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)      += sm4250-oneplus-billie2.dtb
>>> +dtb-$(CONFIG_ARCH_QCOM)      += sm6115-fxtec-pro1x.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)      += sm6115p-lenovo-j606f.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)      += sm6125-sony-xperia-seine-pdx201.dtb
>>>  dtb-$(CONFIG_ARCH_QCOM)      += sm6125-xiaomi-laurel-sprout.dtb
>>> diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
>>> new file mode 100644
>>> index 000000000000..a9ff1d9534ae
>>> --- /dev/null
>>> +++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
>>> @@ -0,0 +1,248 @@
>>> +// SPDX-License-Identifier: GPL-2.0-only
>> I'm not a licensing expert, but fyi sm6115.dtsi uses (GPL2+ & BSD3)
> 
> Yes, we usually ask for the DTs to be dual-licensed, since they may be
> e.g. used or distributed as a part of the bootloader.
> 
>>
> 
> [skipped]
> 
>>> +
>>> +&rpm_requests {
>>> +     pm6125-regulators {
>>> +             compatible = "qcom,rpm-pm6125-regulators";
>>> +
>>> +             vreg_s6a: s6 {
>> You can keep the PMIC name apparent by renaming vreg_s6a to
>> pm6125_s6 etc.
> 
> Hmm, we were usually using the resource-name here,
Yeah, but on smd rpm a "resource name" is a very vague concept,
you have a "path" to a resource (which is resolved internally by RPM),
then there's a "type", "key" and "id"

 so vreg_s6a is fine
> (usually it would be vreg_s6a_0p3 or vreg_s6a_1p5).
That naming is *very* problematic if your device isn't a dragonboard/RBx
where you can look up the schematics and leads to a lot of confusion, as
you can't really be sure what voltages are correct until you can confirm
everything works properly on the board :/


Konrad
> 
>>
>> Konrad
>>> +                     regulator-min-microvolt = <304000>;
>>> +                     regulator-max-microvolt = <1456000>;
>>> +             };
> 
