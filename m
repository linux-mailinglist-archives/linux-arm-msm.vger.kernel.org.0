Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 63A4E6F9203
	for <lists+linux-arm-msm@lfdr.de>; Sat,  6 May 2023 14:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232340AbjEFMeB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 6 May 2023 08:34:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230493AbjEFMd7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 6 May 2023 08:33:59 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 514BE156AA
        for <linux-arm-msm@vger.kernel.org>; Sat,  6 May 2023 05:33:58 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2ac82c08542so25782031fa.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 06 May 2023 05:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683376436; x=1685968436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OUDagiW7UckkdR32TMqC1U7AToV7XXnlxtT8unY2FCc=;
        b=TtQh5dW1tnaYHQC+E9VwtKcjJMjAdRN0rj/Swc4+1sk5GAdEKh1Hdj9It7LoygwJ2p
         rSlxE+t3PCa+spa04/dKfqpe4pMMZEk74R3h/clf72/MvYnqKkNH0rXA0ZmK+F78Ize7
         R8f7NsSpuFqbFgUbbOoc+BXYMUMxtRMo7fHb9s9vdKp/3Bc2JE3FCLV0Zx2jdzg1S26R
         MOuiuOyN1ipHz41mrGX8WfrIN/xH/h8cDcCfFHQYKWt6QEeDzCmGE7hCcLP9wsrTBImZ
         dN0QYchNzTcqFgA7ZZNsmw+jlk4B4+5fWNjd40uW+/jfDMpQ30lUWSyOcYRyZlk5iq79
         t0qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683376436; x=1685968436;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OUDagiW7UckkdR32TMqC1U7AToV7XXnlxtT8unY2FCc=;
        b=KaQQWjdMTZAFxzBoHLvRpJ2km5cDp/hUA6/jsfcNjkVy6fd0RrZYPRbhQjvxijgpVy
         EirKhJ8Ro2bC9LjsmXqVKX1C+e7s0zDL2LUogcEVq0L9H8UFeGW8w+Znw79n5x+B/pD1
         nJgJho7IPk4UV32dwcPTxQXcgM734CKfmpzZg2zGN5leJvWuBjcQ055l9HUT0xjLvuz4
         aLZsjsZp0wEKo9NuD1pUCpmgMcNwarEtTaVO36m/XhYQYqZ1df5WL21YuPShaOcpq75E
         h1RmHduITuGpSKKzagTnETilPy3vHwb8HFz3VYCJZsam4LpOf1O3abxmpJIOqOU8vU5W
         3aUw==
X-Gm-Message-State: AC+VfDxNYz2CvSkbLa/rcuxm6qj/o3nqOl34LOI/BRNIpbzFvn9IXUyj
        n32SrcvtpkkMx8XrqlO/zqAFZQ==
X-Google-Smtp-Source: ACHHUZ4Ttco94LXkVpyU6g4LA/QnLPz50rQK0qLD21D6zsgS9fEDJS2dX6MRHMKJiRzS15dT2Ihxew==
X-Received: by 2002:a2e:8002:0:b0:2a7:acb7:cabc with SMTP id j2-20020a2e8002000000b002a7acb7cabcmr1191795ljg.40.1683376436572;
        Sat, 06 May 2023 05:33:56 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id a8-20020ac25208000000b004eb0c12df21sm643606lfl.128.2023.05.06.05.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 May 2023 05:33:56 -0700 (PDT)
Message-ID: <fbed1061-d5ac-36f8-5705-730672267ad2@linaro.org>
Date:   Sat, 6 May 2023 15:33:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 1/2] arm64: dts: qcom: Add Fxtec Pro1X (QX1050) DTS
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
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
 <c70fc9de-4e47-b00c-276c-7a4a5ebce594@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <c70fc9de-4e47-b00c-276c-7a4a5ebce594@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 06/05/2023 15:30, Konrad Dybcio wrote:
> 
> 
> On 6.05.2023 13:48, Dmitry Baryshkov wrote:
>> On Fri, 5 May 2023 at 21:41, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>>
>>>
>>> On 5.05.2023 19:12, Dang Huynh wrote:
>>>> The F(x)tec Pro1X is a mobile phone released by FX Technologies Ltd
>>>> in 2022.
>>>>
>>>> The phone is exactly the same as the Pro1 released in 2019 with some
>>>> changes:
>>>> - MSM8998 -> SM6115
>>>> - Camera button is no longer multistate
>>>> - Only one 48MP back camera
>>>> - A new keyboard layout picked by the community.
>>>>
>>>> This commit has the following features working:
>>>> - Display (using simplefb)
>>>> - UFS
>>>> - Power and volume buttons
>>>> - Pinctrl
>>>> - RPM Regulators
>>>> - USB (Device Mode)
>>>>
>>>> To get a successful boot run:
>>>>
>>>> cat arch/arm64/boot/Image.gz arch/arm64/boot/dts/qcom/\
>>>> sm6115-fxtec-pro1x.dtb  > .Image.gz-dtb
>>>>
>>>> mkbootimg --kernel .Image.gz-dtb \
>>>> --ramdisk initrd.img \
>>>> --base 0x0 \
>>>> --kernel_offset 0x8000 \
>>>> --ramdisk_offset 0x1000000 \
>>>> --second_offset 0xf00000 \
>>>> --tags_offset 0x100 \
>>>> --pagesize 4096 \
>>>> --cmdline "CMDLINE HERE" \
>>>> -o qx1050-boot.img
>>>>
>>>> fastboot flash boot qx1050-boot.img
>>>> fastboot erase dtbo
>>>> fastboot reboot
>>>>
>>>> Signed-off-by: Dang Huynh <danct12@riseup.net>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/Makefile               |   1 +
>>>>   arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts | 248 ++++++++++++++++++++++++
>>>>   2 files changed, 249 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index d42c59572ace..e311ba675f35 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -174,6 +174,7 @@ dtb-$(CONFIG_ARCH_QCOM)   += sdm845-shift-axolotl.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)      += sdm850-lenovo-yoga-c630.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)      += sdm850-samsung-w737.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)      += sm4250-oneplus-billie2.dtb
>>>> +dtb-$(CONFIG_ARCH_QCOM)      += sm6115-fxtec-pro1x.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)      += sm6115p-lenovo-j606f.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)      += sm6125-sony-xperia-seine-pdx201.dtb
>>>>   dtb-$(CONFIG_ARCH_QCOM)      += sm6125-xiaomi-laurel-sprout.dtb
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
>>>> new file mode 100644
>>>> index 000000000000..a9ff1d9534ae
>>>> --- /dev/null
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dts
>>>> @@ -0,0 +1,248 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-only
>>> I'm not a licensing expert, but fyi sm6115.dtsi uses (GPL2+ & BSD3)
>>
>> Yes, we usually ask for the DTs to be dual-licensed, since they may be
>> e.g. used or distributed as a part of the bootloader.
>>
>>>
>>
>> [skipped]
>>
>>>> +
>>>> +&rpm_requests {
>>>> +     pm6125-regulators {
>>>> +             compatible = "qcom,rpm-pm6125-regulators";
>>>> +
>>>> +             vreg_s6a: s6 {
>>> You can keep the PMIC name apparent by renaming vreg_s6a to
>>> pm6125_s6 etc.
>>
>> Hmm, we were usually using the resource-name here,
> Yeah, but on smd rpm a "resource name" is a very vague concept,
> you have a "path" to a resource (which is resolved internally by RPM),
> then there's a "type", "key" and "id"
> 
>   so vreg_s6a is fine
>> (usually it would be vreg_s6a_0p3 or vreg_s6a_1p5).
> That naming is *very* problematic if your device isn't a dragonboard/RBx
> where you can look up the schematics and leads to a lot of confusion, as
> you can't really be sure what voltages are correct until you can confirm
> everything works properly on the board :/

Fully agree here. I just wanted to point out that vreg_s6a is also a 
frequently used alias.

> 
> 
> Konrad
>>
>>>
>>> Konrad
>>>> +                     regulator-min-microvolt = <304000>;
>>>> +                     regulator-max-microvolt = <1456000>;
>>>> +             };
>>

-- 
With best wishes
Dmitry

