Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EF92B526D51
	for <lists+linux-arm-msm@lfdr.de>; Sat, 14 May 2022 01:06:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229598AbiEMXGT (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 13 May 2022 19:06:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230423AbiEMXF4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 13 May 2022 19:05:56 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CFC5253AA3
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:05:38 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id d15so16875644lfk.5
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 May 2022 16:05:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=5b2MhcmHs2O9qxlc70fS9UjNyboVfpLM5YasmFpVheg=;
        b=QOxg2C93uLuxx6QicraazQk+SNWvpTPhKIsWHUmJr2VGtuQoKxVkS5cCX5bOlWzx1W
         bhc+GWM4w+0D1TOjLKvO5k3PIFa4RqIY2d5iu3EIpTS2jtvnaK+R4KIp7+eOoYEcelVA
         NfYY4yfD2PLEhw+lzgZ9rEtuRN578UiDfJvbLPXLHKlQOQtzx0Nfj5GxqOVD9v+znSXy
         4YW7BEuEtGnG4TCbrUmu/I8zrYrDpqFPaZiADjf2JR0JbdmpPIpW9UyX4suejX0nwY9f
         UQ2/v3Wh9lnFFB3fdBA/zlZkF7BjrSubTUHayluXtYcijUZfYRwA9cH3kkdGsWY0n+00
         BF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=5b2MhcmHs2O9qxlc70fS9UjNyboVfpLM5YasmFpVheg=;
        b=XRSBlmm+PeMeptWYaQZKtey7yJucGlSZTfvKV3LXNjQ/7IqtXghp7beygQ54oL+Nj5
         iFg15QMxOukKB5CFQb7Ki7klB8yfqEWSC7SW8PJ85jJIQPt+kGUr82XxAWmWzXisO648
         SXAuzNiXmuVbnF3Du283J/QCScEHgyxWJQMJ6LSqv1/9zuXRFCb4SQCX7IiVgr7Xsne0
         +6Sldv/ir6cSqwrC5Fj6SMim0rZ31PJhWnN1t7IUZkdDKSAYy0O6C1QWulg7kGPbOQ5q
         tXP11J07Jz4ZIGBxP4fZvO0hFhxDLTVXHQAOtAwcVAA/9dRsFAM5HdrYGTjYCRaDvecZ
         kSdQ==
X-Gm-Message-State: AOAM532iAeLflD0L3Vgyc0ypzc1Xpx+BAKeargOUdIER9D6Ke8dEsneu
        IFQPi9GKzKlNhHccWj3/JgoVdA==
X-Google-Smtp-Source: ABdhPJzunuJKrHrbB+iySQolNPmo8FQWC4g4UA0ja1lh3mfpPbEoHjPP+P7+OPHmIAiKsdXqTaydsg==
X-Received: by 2002:a05:6512:e88:b0:474:2d05:7fee with SMTP id bi8-20020a0565120e8800b004742d057feemr4942528lfb.44.1652483136107;
        Fri, 13 May 2022 16:05:36 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q7-20020ac246e7000000b0047255d2116asm520853lfo.153.2022.05.13.16.05.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 May 2022 16:05:35 -0700 (PDT)
Message-ID: <24d13c3e-9e00-43f5-aac5-4cc7aa577f72@linaro.org>
Date:   Sat, 14 May 2022 02:05:34 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v1 5/5] arm64: dts: qcom: sdm660: Add initial Inforce
 IFC6560 board support
Content-Language: en-GB
To:     Konrad Dybcio <konrad.dybcio@somainline.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
References: <20220503220927.960821-1-dmitry.baryshkov@linaro.org>
 <20220503220927.960821-6-dmitry.baryshkov@linaro.org>
 <0574f34c-b898-8ccb-05bd-6e3d454fee2c@somainline.org>
 <ae909313-ef7a-5c40-55b8-a1a802b6cdd5@linaro.org>
 <89049083-9336-7490-ff89-f4337d4cea1a@somainline.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <89049083-9336-7490-ff89-f4337d4cea1a@somainline.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 13/05/2022 22:18, Konrad Dybcio wrote:
> 
> 
> On 13.05.2022 00:58, Dmitry Baryshkov wrote:
>> On 04/05/2022 19:17, Konrad Dybcio wrote:
>>>
>>> On 04/05/2022 00:09, Dmitry Baryshkov wrote:
>>>> The IFC6560 is a board from Inforce Computing, built around the SDA660
>>>> SoC. This patch describes core clocks, some regulators from the two
>>>> PMICs, debug uart, storage, bluetooth and audio DSP remoteproc.
>>>>
>>>> The regulator settings are inherited from prior work by Konrad Dybcio
>>>> and AngeloGioacchino Del Regno.
>>>>
>>>> Co-developed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/Makefile             |   1 +
>>>>    .../boot/dts/qcom/sda660-inforce-ifc6560.dts  | 455 ++++++++++++++++++
>>>>    2 files changed, 456 insertions(+)
>>>>    create mode 100644 arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dts
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
>>>> index f9e6343acd03..5f717fe0e8d0 100644
>>>> --- a/arch/arm64/boot/dts/qcom/Makefile
>>>> +++ b/arch/arm64/boot/dts/qcom/Makefile
>>>> @@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_QCOM)    +=
>>
>> [skipped]
>>
>>>> +
>>>> +/* BAM DMA doesn't seem to work on the board */
>>> I wonder if these are configured differently on your firmware.. what if you remove the `qcom,controlled-remotely` property, or in case that doesn't work, swap out the BAM clock for a fake one, like xo_board?
>>
>> You know, replacing BAM clock with xo_board makes the devices probe and work. So does adding interconnects property (together with Bhupeshe's patches which didn't land for some reason). I think I will override just the clocks for now and update the core dtsi once the [1] gets merged.
> Hm, perhaps that clock should be marked as protected on this board then, since interactions with it can cause the board to hang.. Can you read the rate in, for example, debugfs without it going crazy?

No, didn't try that. I'll check it next time I boot the board (might 
take a few days).

> 
>>
>> [1] https://lore.kernel.org/linux-arm-msm/20211110105922.217895-14-bhupesh.sharma@linaro.org/
>>
>>>> +&blsp1_dma {
>>>> +    status = "disabled";
>>>> +};
>>>
>>> This reference should come before blsp1_i2c6 alphabetically
>>>
>>>
>>
>> [skipped]
>>
>>
>>>> +
>>>> +&mdp {
>>>> +    status = "okay";
>>>> +};
>>>
>>> MDP should be always enabled in SoC DTSI instead, as MDSS is borderline useless without it..
>>
>> I see your point. sdm845 doesn't disable it, but later platforms (sc7180/sc7280/sm8250) disable mdp and require enabling it explicitly in the board files. I'd tend to follow the example of the later platforms. Not to mention that sdm630.dtsi already contains 'status="disabled"' for this device.
> 845 and 8250 do not, I changed that myself some time ago :P As for sc7x80, I just haven't gotten to play with these just yet..

ok. Then we should probably cleanup board files which still manually 
enable mdp nodes.

> 
> Konrad
>>
>>>> +
>>>> +&mdss {
>>>> +    status = "okay";
>>>> +};
>>>> +
>>>> +&mmss_smmu {
>>>> +    status = "okay";
>>>> +};
>>>
>>> ..and same goes for all the SMMUs (but that's a nit for the future, as I mentioned in one of the previous emails)
>>
>> Yes.
>>
>> [skipped]
>>
>>


-- 
With best wishes
Dmitry
