Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AF8346B90A6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Mar 2023 11:53:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbjCNKxQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Mar 2023 06:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230039AbjCNKxM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Mar 2023 06:53:12 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F20F584BC
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:52:37 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id br6so1246010lfb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 14 Mar 2023 03:52:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678791155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XMr9XUMOaddYL79MjMfHtWOWf4Lj3iArHK6IYS86sJ0=;
        b=PXxhoE3/u5GhpcI263xgFpRT6Q59PNLhzoTjaNd6QCjt2aO/SwMlzA4v9FuE/OwTyO
         8Du23c6uxthi9lv9cNYBl0o5qf85RgE9dZGAEhiWoH70x6rrKYH37UnXbgKJ1pml9W7l
         963rChp/ELryqTIoL9BCuZrrP6egyjkFIen5n3UXeQXx2vQ1nEbmhqS6z4OXM1gY86rL
         AeVkoDBzC++pDC90P/bQ54WiN567hbVzbYWQbW4TtL42BX3fITNgId0M/hMd+E7IDF1/
         7BJiPUJ4ZJODoZcfWJ0oHmbk2eFJx1ccwQxWBSuehcqB9O3HEgTAEs7i4+cD4Oinp7zO
         j5zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678791155;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XMr9XUMOaddYL79MjMfHtWOWf4Lj3iArHK6IYS86sJ0=;
        b=YHodnc2evLRxFdYn7E/flB17nD7wC3Hr5WgTJvkylId6NnEd+WCjXSBs3l63DbmnKO
         rnp5FVfO7cnWg5T1TBBDuWbN89IaBrgBaZE1+IdJrBGn6zJZJ30Djp9VHWv89CGX/lmH
         jU8M8xayua/P6S7dONdLiGyo0Dm3yHIiHZiOcQW4aKqCQrPKGKT/YdXSZzajvOa5kEkO
         gYlrcQA3e0mnDxbjrG3lfssY1Gii7+EX9lX4xIIkTfY+8EiJfI/IUlbzgkCG5rhGGOkE
         Nfyy96kVVlaExuKlv+btyTAsCBUfnzSRRfbpYg4iMc/O0TGHUn6M0nGOaqtNDW4/QhdS
         GBDg==
X-Gm-Message-State: AO0yUKUkQGV+ai7MmLvy9LvQIGkiUOd6gRjGIqcJ1b7URiNTDqLUzWXs
        YWl2gg2BPFz1Ux+VTP3DB7fUsw==
X-Google-Smtp-Source: AK7set9+NUcSouCpNpR9Vv9pRy1Hk+87Unn8vW4rx/LO+ldqtD2wjLeEqvY2n4ADL4duPfkoZAEqVA==
X-Received: by 2002:a05:6512:941:b0:4b4:6490:cbf1 with SMTP id u1-20020a056512094100b004b46490cbf1mr541424lft.15.1678791155333;
        Tue, 14 Mar 2023 03:52:35 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
        by smtp.gmail.com with ESMTPSA id t16-20020ac25490000000b004d342e1332csm357145lfk.25.2023.03.14.03.52.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Mar 2023 03:52:34 -0700 (PDT)
Message-ID: <8441a928-77d3-6df1-248f-84cacc6ab801@linaro.org>
Date:   Tue, 14 Mar 2023 11:52:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 1/2] arm64: dts: qcom: sdm845: add framebuffer reserved
 memory
Content-Language: en-US
To:     Caleb Connolly <caleb.connolly@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230314045812.3673958-1-caleb.connolly@linaro.org>
 <3ffb4326-ad13-d1c5-51e3-524dfa143930@linaro.org>
 <80f04aca-23c2-346f-4744-9ed19d58af3f@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <80f04aca-23c2-346f-4744-9ed19d58af3f@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_SORBS_HTTP,RCVD_IN_SORBS_SOCKS,SPF_HELO_NONE,SPF_PASS,
        URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 14.03.2023 11:46, Caleb Connolly wrote:
> 
> 
> On 14/03/2023 10:05, Konrad Dybcio wrote:
>>
>>
>> On 14.03.2023 05:58, Caleb Connolly wrote:
>>> Almost all of the SDM845 devices actually map the same region for the
>>> continuous splash / framebuffer. de-dup all the devices that specify it
>>> manually and put it in sdm845.dtsi instead.
>>>
>>> This now reserves it on the OnePlus 6 where it was not reserved before,
>>> this is intentional.
>>>
>>> Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
>>> ---
>> You didn't explain why is not done on 850 (which I assume has to do with
>> the windows memory map being different and putting it somewhere else) and
>> the reasoning for reserving it at all.
> 
> Patch 2 reserves it for 850 (not sure I understand you correctly?). The
> only difference there is the address.
Okay, but you did not say anything about it in this patch even though
you made changes to sdm850, perhaps either doing it in one go or
explaining it here would have been beneficial.

> 
> The reason for reserving it at all has been previously discussed, when
> it was added for db845c [1], the conclusion being that a better approach
> would be nice but didn't seem to be trivial to implement (Cc'd Dmitry).
> 
> I acknowledge that reserving this region as we do currently may not be
> the optimal way of doing so, but I would like to avoid the kernel trying
> to map memory here and crash my device - and this does that at least :>
Missing Fixes, then?

> 
> Basically, my thinking:
>  * NOT reserving this region is known to cause crashes
Missing from the commit message

>  * The OnePlus 6 doesn't currently reserve this region, and has some crashes
The crashing part is missing from the commit message

>  * All the devices that do, reserve it at the same address
Missing from the commit message

>  * Some don't reserve the full size which is WRONG
Missing from the commit message

>  * I'll reserve it for the OnePlus 6, de-dup the DT and ensure that the
> whole size is reserved for all devices.
Missing from the commit message

>  * ?
>  * Profit
Yes

> 
>>
>> If that's the framebuffer handoff issue with smmu faults happening, it may
>> be worth looking into solving that properly, i.e. introducing something like
>> qcom,framebuffer which would suck up the starting address and figure out the
>> required size based on MDP5 VIG pipes' registers and could tickle the
>> autorefresh regs if needed. See how lk2nd does it, the hardware underneath
>> hasn't changed since msm8974.
>>
>> Then, on drm handoff it could free the memory and let drm/msm initialize
>> its own, new, dynamically-allocated and dynamically-sized region as it wants.
>>
>> Or we can use mdss's never-used memory-region property, but that would
>> kill 35 or so megs of ram for everyone, no matter display their resolution.
> 
> Freeing up this ~30mb region sounds like a good improvement to me. I
> don't see how it's related to this patch though - especially given that
> commonising the region will make whatever long-term handoff solution we
> come up with easier anyway.
> 
> Apologies if I'm jumping the gun a bit, I'm just trying to avoid
> blocking this patch on a tangential discussion.
Okay sure, all of that is valid, but you need to explain these changes,
or people will just think that you decided to randomly steal RAM from
them only to commonize some nodes! I'm not saying the contents of this
patch are very bad, but I am saying that you're not selling it to me
well enough.

Konrad
> 
> [1]:
> https://lore.kernel.org/linux-arm-msm/dfcc8baa-c0a3-c554-a8cf-75702a1c4cad@linaro.org/
> [2]:
> https://lore.kernel.org/linux-arm-msm/2c0a893f-b1c2-a77e-4ad4-409c1c778655@linaro.org/
>>
>> Konrad
>>>  arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi              | 6 ------
>>>  arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts     | 5 -----
>>>  arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts           | 5 -----
>>>  arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi       | 6 ------
>>>  .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi | 6 ------
>>>  arch/arm64/boot/dts/qcom/sdm845.dtsi                        | 5 +++++
>>>  arch/arm64/boot/dts/qcom/sdm850.dtsi                        | 2 ++
>>>  7 files changed, 7 insertions(+), 28 deletions(-)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>> index f942c5afea9b..6a1c674a015b 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-lg-common.dtsi
>>> @@ -93,12 +93,6 @@ spss_mem: memory@99000000 {
>>>  			no-map;
>>>  		};
>>>  
>>> -		/* Framebuffer region */
>>> -		memory@9d400000 {
>>> -			reg = <0x0 0x9d400000 0x0 0x2400000>;
>>> -			no-map;
>>> -		};
>>> -
>>>  		/* rmtfs lower guard */
>>>  		memory@f0800000 {
>>>  			reg = <0 0xf0800000 0 0x1000>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
>>> index d37a433130b9..7c2457948a32 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-samsung-starqltechn.dts
>>> @@ -55,11 +55,6 @@ vreg_s4a_1p8: pm8998-smps4 {
>>>  	};
>>>  
>>>  	reserved-memory {
>>> -		memory@9d400000 {
>>> -			reg = <0x0 0x9d400000 0x0 0x02400000>;
>>> -			no-map;
>>> -		};
>>> -
>>>  		memory@a1300000 {
>>>  			compatible = "ramoops";
>>>  			reg = <0x0 0xa1300000 0x0 0x100000>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
>>> index b54e304abf71..4f6b1053c15b 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-shift-axolotl.dts
>>> @@ -60,11 +60,6 @@ key-vol-up {
>>>  	};
>>>  
>>>  	reserved-memory {
>>> -		framebuffer_region@9d400000 {
>>> -			reg = <0x0 0x9d400000 0x0 (1080 * 2160 * 4)>;
>>> -			no-map;
>>> -		};
>>> -
>>>  		ramoops: ramoops@b0000000 {
>>>  			compatible = "ramoops";
>>>  			reg = <0 0xb0000000 0 0x00400000>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
>>> index 4984c7496c31..7e273cc0158d 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-sony-xperia-tama.dtsi
>>> @@ -79,12 +79,6 @@ vreg_s4a_1p8: pm8998-smps4 {
>>>  	};
>>>  
>>>  	reserved-memory {
>>> -		/* SONY was cool and didn't diverge from MTP this time, yay! */
>>> -		cont_splash_mem: memory@9d400000 {
>>> -			reg = <0x0 0x9d400000 0x0 0x2400000>;
>>> -			no-map;
>>> -		};
>>> -
>>>  		ramoops@ffc00000 {
>>>  			compatible = "ramoops";
>>>  			reg = <0x0 0xffc00000 0x0 0x100000>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> index e0fda4d754fe..191c2664f721 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi
>>> @@ -98,12 +98,6 @@ spss_mem: memory@97f00000 {
>>>  			no-map;
>>>  		};
>>>  
>>> -		/* Cont splash region set up by the bootloader */
>>> -		cont_splash_mem: framebuffer@9d400000 {
>>> -			reg = <0 0x9d400000 0 0x2400000>;
>>> -			no-map;
>>> -		};
>>> -
>>>  		rmtfs_mem: memory@f6301000 {
>>>  			compatible = "qcom,rmtfs-mem";
>>>  			reg = <0 0xf6301000 0 0x200000>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> index 479859bd8ab3..ecec2ee46683 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
>>> @@ -865,6 +865,11 @@ spss_mem: spss@97b00000 {
>>>  			no-map;
>>>  		};
>>>  
>>> +		cont_splash_mem: framebuffer@9d400000 {
>>> +			reg = <0 0x9d400000 0 0x2400000>;
>>> +			no-map;
>>> +		};
>>> +
>>>  		mdata_mem: mpss-metadata {
>>>  			alloc-ranges = <0 0xa0000000 0 0x20000000>;
>>>  			size = <0 0x4000>;
>>> diff --git a/arch/arm64/boot/dts/qcom/sdm850.dtsi b/arch/arm64/boot/dts/qcom/sdm850.dtsi
>>> index da9f6fbe32f6..b787575c77a5 100644
>>> --- a/arch/arm64/boot/dts/qcom/sdm850.dtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sdm850.dtsi
>>> @@ -7,6 +7,8 @@
>>>  
>>>  #include "sdm845.dtsi"
>>>  
>>> +/delete-node/ &cont_splash_mem;
>>> +
>>>  &cpu4_opp_table {
>>>  	cpu4_opp33: opp-2841600000 {
>>>  		opp-hz = /bits/ 64 <2841600000>;
> 
