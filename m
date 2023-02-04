Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0C9ED68AC6F
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Feb 2023 22:08:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229877AbjBDVIQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Feb 2023 16:08:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231230AbjBDVIP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Feb 2023 16:08:15 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E4C1206B
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Feb 2023 13:08:13 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id ud5so24374633ejc.4
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Feb 2023 13:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=P1Ize9jvuY0M2rJTTxP9NCBQSf1vtnm5BVtaBuaJ814=;
        b=WaURpkSzQR2ymdxB7b57YpYxAK8TYbuM6PapgtQYjVegufh1zsu8LEUouR+VuP6+hx
         k8UEtFOZjGNPPnTFsjprBBY7AuTo+ZgzSifReaK20MQWHMjCqk7h6MaeD7i4QCJFrsvF
         fo0W0wW1uS+FkA1qeplKPCng/hsxUXbWmJppyIkxN+IRuXo2w6ZnprZ+TA0yVN+gt7oX
         58vkJvEJgoFmV90lNIK2rLDdZi2WfOnnibQhrqefa2cjQN+H3MLn4H8zDbVciyBUGs4v
         bHXFxJWomY7i+4t4uppM12LqURIMMQP6/DLNAilNUcz0rzR6hDD1dCL5QuHNdj6OtLGp
         5I5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P1Ize9jvuY0M2rJTTxP9NCBQSf1vtnm5BVtaBuaJ814=;
        b=EthC4HkeOwMYImTWuJtbO29jMRXa2eqsOn9nHyGPCJyqvvwSQGpV2AHCwtm5IDoiy+
         wN1dyvk3Y6P4v8cCUyQZZS1djk+QxDbfhbx3teu6iMU4/OR3vJHg84RWWGOGficz2d+l
         Qm0+xZ1ykVZ6fhD71GTEbuB7ss/87V2iRe+YdpEcPUQJLHSPvHNKIkHZgkkQejGdCy3U
         s7LUZy3smaJQnrfbuulMxgP2ZxcTE5pOrqui9mw7UB8QHEudIhLmQ9Axr03wwNJHmrB5
         nL0eTUV/6cl9yEdPcEM7PXdE+JyRsO3WWe8EN4SAp8Q6VKfNAnFvpsumpNEhA7KBpXC9
         5O7Q==
X-Gm-Message-State: AO0yUKUUMcDb60hvNSlYkoRmKaCTGDy+F/EvKIfZe1dy7ahuKoJBK3Um
        naMmkoS392DcUZw7t0FVbRrA2bcfvpBOVYlB
X-Google-Smtp-Source: AK7set8rlU35uv+szqyEB8JepgvXQEG3Yfnd5tgniyE8T9HqsWLQ/LQqYPJNfhMC9kg4YVfKt4293Q==
X-Received: by 2002:a17:906:8d03:b0:878:82c7:f5dc with SMTP id rv3-20020a1709068d0300b0087882c7f5dcmr15861335ejc.56.1675544891873;
        Sat, 04 Feb 2023 13:08:11 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d4-20020a1709063ec400b0087bd2ebe474sm3214240ejj.208.2023.02.04.13.08.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 13:08:11 -0800 (PST)
Message-ID: <5d482d65-858f-7c6c-1f93-dabc6e2f4be9@linaro.org>
Date:   Sat, 4 Feb 2023 23:08:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA features in hw
 catalog
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
 <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
 <c04a01d1-0375-16be-b8d0-022704ae89a5@quicinc.com>
 <3754a9a9-8b64-62ae-0b0d-f379debefa16@linaro.org>
 <ddb0de30-9e29-f6f0-028c-48530bee4a6b@quicinc.com>
 <42e6237d-9fae-0679-1354-7df74594a9db@linaro.org>
 <d89a1735-4351-a9b5-c6e3-d0d05af9d283@quicinc.com>
 <6d171f4b-9a49-ea90-8cf3-518bea0964b3@linaro.org>
 <edc1aab6-b38f-c0ec-9339-01117d037ebf@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <edc1aab6-b38f-c0ec-9339-01117d037ebf@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04/02/2023 20:35, Abhinav Kumar wrote:
> 
> 
> On 2/4/2023 2:43 AM, Dmitry Baryshkov wrote:
>> On 04/02/2023 07:10, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/3/2023 8:10 PM, Dmitry Baryshkov wrote:
>>>> On 04/02/2023 04:43, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 2/3/2023 6:29 PM, Dmitry Baryshkov wrote:
>>>>>> On 04/02/2023 01:35, Abhinav Kumar wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>>>>> Downstream driver uses dpu->caps->smart_dma_rev to update
>>>>>>>> sspp->cap->features with the bit corresponding to the supported 
>>>>>>>> SmartDMA
>>>>>>>> version. Upstream driver does not do this, resulting in SSPP 
>>>>>>>> subdriver
>>>>>>>> not enbaling setup_multirect callback. Add corresponding 
>>>>>>>> SmartDMA SSPP
>>>>>>>> feature bits to dpu hw catalog.
>>>>>>>>
>>>>>>>
>>>>>>> While reviewing this patch, I had a first hand experience of how 
>>>>>>> we are reusing SSPP bitmasks for so many chipsets but I think 
>>>>>>> overall you got them right here :)
>>>>>>>
>>>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>>>> ---
>>>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
>>>>>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>> index cf053e8f081e..fc818b0273e7 100644
>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>> @@ -21,13 +21,16 @@
>>>>>>>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>>>   #define VIG_SDM845_MASK \
>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3) |\
>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>   #define VIG_SC7180_MASK \
>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED4))
>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED4) |\
>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>   #define VIG_SM8250_MASK \
>>>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>>>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>>>>>> @@ -42,6 +45,7 @@
>>>>>>>>   #define DMA_SDM845_MASK \
>>>>>>>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | 
>>>>>>>> BIT(DPU_SSPP_QOS_8LVL) |\
>>>>>>>>       BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>>>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
>>>>>>>>       BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>>>>>>>>   #define DMA_CURSOR_SDM845_MASK \
>>>>>>>
>>>>>>> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other 
>>>>>>> chipsets like 8250, 8450, 8550.
>>>>>>>
>>>>>>> At the moment, for visual validation of this series, I only have 
>>>>>>> sc7180/sc7280. We are leaving the rest for CI.
>>>>>>>
>>>>>>> Was that an intentional approach?
>>>>>>>
>>>>>>> If so, we will need tested-by tags from folks having 
>>>>>>> 8350/8450/8550/sc8280x,qcm2290?
>>>>>>>
>>>>>>> I am only owning the visual validation on sc7280 atm.
>>>>>>
>>>>>> I'm not quite sure what is your intent here. Are there any SoCs 
>>>>>> after 845 that do not have SmartDMA 2.5? Or do you propose to 
>>>>>> enable SmartDMA only for the chipsets that we can visually test? 
>>>>>> That sounds strange.
>>>>>>
>>>>>
>>>>> Yes I was thinking to enable smartDMA at the moment on chipsets 
>>>>> which we can validate visually that display comes up. But I am not 
>>>>> sure if thats entirely practical.
>>>>>
>>>>> But the intent was I just want to make sure basic display does come 
>>>>> up with smartDMA enabled if we are enabling it for all chipsets.
>>>>
>>>> I don't think it is practical or logical. We don't require 
>>>> validating other changes on all possible chipsets, so what is so 
>>>> different with this one?
>>>>
>>>
>>> Thats because with smartDMA if the programming of stages goes wrong 
>>> we could potentially just see a blank screen. Its not about other 
>>> changes, this change in particular controls enabling a feature.
>>>
>>> But thats just my thought. I am not going to request to ensure this 
>>> or block this for this.
>>>
>>> You can still have my
>>>
>>> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> But think of the validations that have to be done before we merge it.
>>
>> The usual way: verify as much as feasible and let anybody else 
>> complain during the development cycle.
>>
> 
> Well, our perspective is to enable the feature on devices on which you 
> are able to test and not enable then wait for others to complain.

This would not be really practical. There are plenty of people who can 
test things on obscure platforms, but unfortunately far less amount of 
people who tightly follow the development and can track which new 
feature applies to a particular platform. I hope to be able to fix that 
slightly with the hw catalog rework. However enabling features on other 
platforms definitely requires more knowledge than simply testing the kernel.

> 
> I did not say test all devices. My point was to enable smartDMA on 
> devices which we are able to test.
> 
> There are other examples of this, like inline rotation, writeback etc. 
> which are at the moment enabled only on devices which QC or others have 
> tested on.

But at the time it was added, inline rotation 2.0 could only be 
supported on sc7280. Probably we should expand it not to sc8280xp and 
sm8[345]50.

For WB I don't remember which platforms were supported at the moment it 
was added. But it's also worth expanding support to new platforms.

And, as we speak about testing, is there an easy way to setup the plane 
with UBWC format modifier? Also, did the WB support patches land into 
libdrm?

> So when i said my suggestion was not practical, yes because if you want 
> to go ahead with this change in the current form, you would have to 
> validate all the chipsets as you are enabling smartDMA on all of them.
> 
> If you enable smartDMA only on the chipsets you OR others can validate 
> and give Tested-by for like I was planning to do for sc7280, then I am 
> not sure why it doesnt sound logical.
> 
> But like I said, thats my perspective. I will let you decide as you 
> would know how confident you are with this getting enabled for all 
> chipsets upstream.

I'd say, that once tested on some of the platforms and granted that even 
smalled (qcm2290, sm6115) platforms support smartdma, it will be safe to 
enable smart DMA globablly for every SoC >= sdm845. If I remember 
correctly, msm8998 (and sdm660/630) support smartdma/rect only on DMA 
planes. Is it correct?


-- 
With best wishes
Dmitry

