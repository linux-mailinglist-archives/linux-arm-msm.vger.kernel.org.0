Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6CDAA62B6CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Nov 2022 10:43:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232833AbiKPJnR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Nov 2022 04:43:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238613AbiKPJnG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Nov 2022 04:43:06 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4389A29CB4
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 01:43:04 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id g7so28652708lfv.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Nov 2022 01:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LMvW25EyOFPFoWFslYOxt3sbuYD4Cmo8S4VqLGbmSNk=;
        b=VZRSekNoeym/lJTYRiOsNTSMPw2BxyBupPMWLNLlqE174pTO35t7F6DUlP2Wx1lAAJ
         iaVUA2VW6VySQDTIfnk2Lu/mA4qDd2DzIhoYDR2UzTl7d7b4QBWIj7RqaV/iOBI9Wxc2
         SdKYYIwo1NIF0G/OZPZ9cq1L7ureldhogFurzQ3b4jv9rsrMV2fCLd/wbIDFv/YQctxW
         HOl9ZqMZ/4GmiXsbEe5pEVjM8JX6IViE7SnmNw9oqHgxuSXWYUlye8fplyKJvE6HyEVL
         1FFiAY+5ZzsfdLOwvSiPmxI6gSQ0eqVz/4ZdNjkDB2gTtIzzL3w+mOn2JGLwCe5z44sn
         WUJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LMvW25EyOFPFoWFslYOxt3sbuYD4Cmo8S4VqLGbmSNk=;
        b=YVtOKQhafzKQgAryh1RDehY68IWcvSxdwz3BjKBa2Oc+Hr9N0gbhH+1zxdVM+xgRQb
         /8kN7tuYNIDbaWph/Aj4sQPv5y7XSO+d28AHFIbrlDphoUhTLFfrKPjKZSCIUgjhCpyM
         Mo7l2oeNHC/oO5U8Ki2wEworJmODgaB3/vHGEJOvVCsPk2dDkuukwR/RyymsLHKrifSR
         4fLmQq3D0lnYUVBtxv+vd7qObHtohq5QjvLPvCGCMD5bcy1jmRzyTv55YLm9doxZtu8F
         P5AMDRR3c4OOA7rJ47CKmbl+fX+KoHIwBTkvL4ASaSqJU2vm3xzL3MAq3BS/Vqx3FwVG
         /O+Q==
X-Gm-Message-State: ANoB5pn/bG6oHG7sNWf0Y1I2cczMC09rKBuwHDhonSxvx2dVls8mSp5A
        lIktHjPLmPeqvAtkerg6AQEzrw==
X-Google-Smtp-Source: AA0mqf6LDfKju/pZG75qjyB64ctoZA8TXqR/FJ1HZ76WetNE4cnt5rcQoyIMwllSVKh0N5rJmvTD3Q==
X-Received: by 2002:a05:6512:2587:b0:4a2:645b:15cd with SMTP id bf7-20020a056512258700b004a2645b15cdmr6686154lfb.308.1668591782566;
        Wed, 16 Nov 2022 01:43:02 -0800 (PST)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id u9-20020ac258c9000000b0047f7722b73csm2517090lfo.142.2022.11.16.01.43.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Nov 2022 01:43:02 -0800 (PST)
Message-ID: <5bfaae9f-2d71-a69a-59e6-c4adf5d929da@linaro.org>
Date:   Wed, 16 Nov 2022 12:43:00 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v3 6/8] drm/msm/dpu: add support for MDP_TOP blackhole
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, Vinod Koul <vkoul@kernel.org>
References: <20221104130324.1024242-1-dmitry.baryshkov@linaro.org>
 <20221104130324.1024242-7-dmitry.baryshkov@linaro.org>
 <3429c5a5-084d-919c-5c3f-5e12f447c931@quicinc.com>
 <e53520b4-65da-d183-c3bf-65dc16c59358@linaro.org>
 <c23b1bc2-6477-a125-7ad9-11dfec6fed55@quicinc.com>
 <65ab13cb-93ae-eb71-531a-79cf99c7fcdd@linaro.org>
 <3041e527-f955-3582-e41f-5f5dc4d04e26@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3041e527-f955-3582-e41f-5f5dc4d04e26@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 16/11/2022 12:29, Abhinav Kumar wrote:
> 
> 
> On 11/16/2022 1:18 AM, Dmitry Baryshkov wrote:
>> On 16/11/2022 11:30, Abhinav Kumar wrote:
>>>
>>>
>>> On 11/16/2022 12:19 AM, Dmitry Baryshkov wrote:
>>>> On 16/11/2022 10:50, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 11/4/2022 6:03 AM, Dmitry Baryshkov wrote:
>>>>>> On sm8450 a register block was removed from MDP TOP. Accessing it 
>>>>>> during
>>>>>> snapshotting results in NoC errors / immediate reboot. Skip accessing
>>>>>> these registers during snapshot.
>>>>>>
>>>>>> Tested-by: Vinod Koul <vkoul@kernel.org>
>>>>>> Reviewed-by: Vinod Koul <vkoul@kernel.org>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> I am confused with both the ordering and the split of this patch.
>>>>>
>>>>> You have defined DPU_MDP_PERIPH_0_REMOVED in the catalog header 
>>>>> file in this patch but used it in the next.
>>>>>
>>>>> But you also have code in this patch which relies on setting of 
>>>>> this bit.
>>>>>
>>>>> So if this patch is taken without the next, it will still crash.
>>>>
>>>> It will not crash if this patch is taken without the next one. 
>>>> Without the next patch the DPU driver will not match and bind 
>>>> against the qcom,sm8450-dpu device.
>>>
>>> Ah okay, I just now saw that you have the compatible change also in 
>>> the next patch.
>>>
>>>>
>>>> So, the ordering is quite logical from my point of view:
>>>> - add support for all the features required for the device
>>>> - add the device compat string & catalog entry
>>>>
>>>>>
>>>>> Rather, you should combine the define part of this patch to the 
>>>>> next patch in the series 
>>>>> https://patchwork.freedesktop.org/patch/510114/?series=108883&rev=3 
>>>>> , then move that one in front of this patch.
>>>>
>>>> No. This way we'll have a state (after adding the next patch) when 
>>>> the sm8450 support is enabled, but the top-hole is not handled, 
>>>> leading to a crash.
>>>>
>>>
>>> What if you split the compatible to a separate patch like what SM8350 
>>> did.
>>>
>>> https://patchwork.freedesktop.org/patch/511659/?series=110924&rev=1
>>>
>>> So, we have hw catalog changes ---> snapshot fix ---> add the 
>>> compatible.
>>
>> I don't see any good reason to do this. Adding a define without 
>> backing implementation is a bad idea in my opinion.
>>
> 
> The define is used in two places today. First in the catalog and second 
> in the snapshot (which is your change).
> 
> Even with the split i am suggesting the define and usage will be together.
> 
> In fact, in my opinion thats more coherent because you defined the 
> macro, used it to show that sm8450 has this TOP_HOLE.
> 
> Then, you are using the hw->caps which will be set in the previous patch 
> to avoid that region in the snapshot.
> 
> The good reason to do it this way is that, with this current ordering of 
> patch, this patch is essentially a dummy patch because technically no 
> chipset has set this capability.

It's not dummy, because it clearly shows, what really is beyond this 
capability. A feature without a backing implementation would be a dummy 
patch (even if it's mentioned in the hw catalog entry).

Just a simple check. If we use a guillotine and cut the patch series in 
the middle, which one will make more sense:

- #define DPU_MDP_TOP_UGLY
   add DPU_MDP_TOP_UGLY to sdm999's features

- #define DPU_MDP_TOP_UGLY
   add an implementation of DPU_MDP_TOP_UGLY describing what it does

With the first approach the MDP_TOP_UGLY is an ugly define without any 
particular meaning. Mentioning it in the hw_catalog doesn't bring us any 
additional information (in other words, what does it mean that sdm999 
has MDP_TOP_UGLY feature?).

The second approach doesn't bind any chipset to use MDP_TOP_UGLY. But 
knowing the implementation, one can check whether it applies to his 
chipset or not.

Yes, I must admit, this case is a little bit odd. Regularly I'd have 
added the sm8450's compat string and catalog entries, then I'd have 
populated the catalog with new features one by one (using implementation 
+ define + hw_catalog patch), like we do e.g. for DSC, WB, 
DSPP_sub_flush, etc. In this particular case, sm8450 will not work 
without PERIPH_0_REMOVED, as the first DSI underrun, which can easily 
happen while turning on the INTF, will reboot the board.

> 
> But if you follow the order i am suggesting, it actually has more 
> meaning because we know sm8450 has set it in its caps before you use it.
> 
>> Regarding splitting the hw_catalog and compat. I have always 
>> considered the hw catalog entry as of_device_id.data. In other words, 
>> a devices' match data, which makes a little sense without compat entry.
>>
>> With the current approach each patch is atomic, it changes single 
>> point or adds a single feature, etc.
>>
>>>
>>> That will make both of us happy?
>>>
>>>>>
>>>>> So that its much more coherent that you defined 
>>>>> DPU_MDP_PERIPH_0_REMOVED both in the catalog header and used it in 
>>>>> the catalog.c file and the in the next change you used the caps to 
>>>>> avoid touching that register.
>>>>
>>>> I'd say it's rather strange way. When I see a define/feature 
>>>> addition, I'd prefer to seethe implementation too.
>>>>
>>>>> Regarding the TOP hole itself, I need one day to investigate this. 
>>>>> I am waiting for permissions to the documentation.
>>>>>
>>>>> If i cannot get access by the time you have re-ordered this, I will 
>>>>> ack this once the reorder is done within a day.
>>>>
>>>>
>>>> For the reference: [1]
>>>>
>>>> [1] 
>>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/commit/f9ff8af5b640147f3651c23551c60f81f62874b1
>>>>
>>>>>
>>>>>> ---
>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h |  1 +
>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c        | 11 +++++++++--
>>>>>>   2 files changed, 10 insertions(+), 2 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h 
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>> index 38aa38ab1568..4730f8268f2a 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
>>>>>> @@ -92,6 +92,7 @@ enum {
>>>>>>       DPU_MDP_UBWC_1_0,
>>>>>>       DPU_MDP_UBWC_1_5,
>>>>>>       DPU_MDP_AUDIO_SELECT,
>>>>>> +    DPU_MDP_PERIPH_0_REMOVED,
>>>>>>       DPU_MDP_MAX
>>>>>>   };
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c 
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>> index f3660cd14f4f..95d8765c1c53 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
>>>>>> @@ -927,8 +927,15 @@ static void dpu_kms_mdp_snapshot(struct 
>>>>>> msm_disp_state *disp_state, struct msm_k
>>>>>>           msm_disp_snapshot_add_block(disp_state, cat->wb[i].len,
>>>>>>                   dpu_kms->mmio + cat->wb[i].base, "wb_%d", i);
>>>>>> -    msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>>>>> -            dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>>> +    if (dpu_kms->hw_mdp->caps->features & 
>>>>>> BIT(DPU_MDP_PERIPH_0_REMOVED)) {
>>>>>> +        msm_disp_snapshot_add_block(disp_state, 0x380,
>>>>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len - 
>>>>>> 0x3a8,
>>>>>> +                dpu_kms->mmio + cat->mdp[0].base + 0x3a8, "top_2");
>>>>>> +    } else {
>>>>>> +        msm_disp_snapshot_add_block(disp_state, cat->mdp[0].len,
>>>>>> +                dpu_kms->mmio + cat->mdp[0].base, "top");
>>>>>> +    }
>>>>>>       pm_runtime_put_sync(&dpu_kms->pdev->dev);
>>>>>>   }
>>>>
>>

-- 
With best wishes
Dmitry

