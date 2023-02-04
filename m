Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F07A768A987
	for <lists+linux-arm-msm@lfdr.de>; Sat,  4 Feb 2023 11:43:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230139AbjBDKnr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 4 Feb 2023 05:43:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230118AbjBDKnq (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 4 Feb 2023 05:43:46 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F2541CADA
        for <linux-arm-msm@vger.kernel.org>; Sat,  4 Feb 2023 02:43:44 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id qw12so21874372ejc.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 04 Feb 2023 02:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HN9r4b9P/+PBlO+lQJOLpyUbQijsh414B6hdUqmV1Ns=;
        b=ZypADk0p27+11vYLucdQgJd4/eJSjuuRlOOpVTiV1UJbRlHLU/pUXCedSDRqTsyqLc
         NJmiJZgbaVxHqHUaqJWPYyC9T2ICLtvdnQffTD+3CYtxj/jL1ZVmS+6hkhqbm3vePL04
         qZP1ahdMDvWGjO58/7HTsu0MDDkOPEPdLY7BK3XSqra1UqDnjEScOvwGgcwi2As1nJPd
         hejr8/nXv+Acyur2oJQ2LktUf20hwFyg7Ig2MKk4bWeoEd/79taIQAnU3ENaknvy4RTb
         TiyNfNcwGw+YngTZCfSrwlfS9sIH6zELiqRwE/EoasVAbzscKIl5z/wFBJ7GIO1MfOnk
         2GAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HN9r4b9P/+PBlO+lQJOLpyUbQijsh414B6hdUqmV1Ns=;
        b=jw5O67prbzNoSyqU76DGgNbByJZOquh125oelsqi5OgZN9vGEVUA3rUn1asYn9vLZd
         JKBEkxvsSMSnfP8/NV8LxmXqfVt8BZMQXzCHW3lM/zYASmX4PVJoJegR3CxrCruJYAep
         qdCc709QE2T+jSL4NNjK1t0+2X4qftxhzZrQop6ovnV5cIxttpvH88F3/Kyp1tXnYX2I
         IvGWnipZs+/43dMCdXlBle19UsYGWG8SbF8t/RP1kBOP2viK+nWLUbUxjR/6gup8sLtf
         ioxFAvzrq55yChrkmQoIRzony3aKWPrv3b6VB1MSGFYklZaEVKfqixdwnffHGQG1P83L
         SuAg==
X-Gm-Message-State: AO0yUKXIpWo9hni3JcPNZr2Lx/6PMFKnSna2UaEvlZDfM3EnPA3ftR0x
        tXHvFpagaOz+o+W3170qoLdMDk+WHghQmI9H
X-Google-Smtp-Source: AK7set/L6NLE3uZcPCBH1bNufat8uLGfW8wWf8/R9GX9sFMb0z2kUCADwK7VfquClsbHh45nKCv4Yw==
X-Received: by 2002:a17:906:c18d:b0:878:5372:a34b with SMTP id g13-20020a170906c18d00b008785372a34bmr12681102ejz.45.1675507423099;
        Sat, 04 Feb 2023 02:43:43 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id v5-20020a1709061dc500b0084d4e9a13cbsm2646236ejh.221.2023.02.04.02.43.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Feb 2023 02:43:42 -0800 (PST)
Message-ID: <6d171f4b-9a49-ea90-8cf3-518bea0964b3@linaro.org>
Date:   Sat, 4 Feb 2023 12:43:41 +0200
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <d89a1735-4351-a9b5-c6e3-d0d05af9d283@quicinc.com>
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

On 04/02/2023 07:10, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 8:10 PM, Dmitry Baryshkov wrote:
>> On 04/02/2023 04:43, Abhinav Kumar wrote:
>>>
>>>
>>> On 2/3/2023 6:29 PM, Dmitry Baryshkov wrote:
>>>> On 04/02/2023 01:35, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>>>>>> Downstream driver uses dpu->caps->smart_dma_rev to update
>>>>>> sspp->cap->features with the bit corresponding to the supported 
>>>>>> SmartDMA
>>>>>> version. Upstream driver does not do this, resulting in SSPP 
>>>>>> subdriver
>>>>>> not enbaling setup_multirect callback. Add corresponding SmartDMA 
>>>>>> SSPP
>>>>>> feature bits to dpu hw catalog.
>>>>>>
>>>>>
>>>>> While reviewing this patch, I had a first hand experience of how we 
>>>>> are reusing SSPP bitmasks for so many chipsets but I think overall 
>>>>> you got them right here :)
>>>>>
>>>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>> ---
>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
>>>>>>   1 file changed, 7 insertions(+), 3 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> index cf053e8f081e..fc818b0273e7 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>> @@ -21,13 +21,16 @@
>>>>>>       (VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>>   #define VIG_SDM845_MASK \
>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>> BIT(DPU_SSPP_SCALER_QSEED3))
>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>> BIT(DPU_SSPP_SCALER_QSEED3) |\
>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>   #define VIG_SC7180_MASK \
>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>> BIT(DPU_SSPP_SCALER_QSEED4))
>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>> BIT(DPU_SSPP_SCALER_QSEED4) |\
>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>   #define VIG_SM8250_MASK \
>>>>>> -    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE))
>>>>>> +    (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | 
>>>>>> BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2))
>>>>>>   #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
>>>>>> @@ -42,6 +45,7 @@
>>>>>>   #define DMA_SDM845_MASK \
>>>>>>       (BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | 
>>>>>> BIT(DPU_SSPP_QOS_8LVL) |\
>>>>>>       BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
>>>>>> +    BIT(DPU_SSPP_SMART_DMA_V2) |\
>>>>>>       BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
>>>>>>   #define DMA_CURSOR_SDM845_MASK \
>>>>>
>>>>> VIG_SDM845_MASK and DMA_SDM845_MASK are used for many other 
>>>>> chipsets like 8250, 8450, 8550.
>>>>>
>>>>> At the moment, for visual validation of this series, I only have 
>>>>> sc7180/sc7280. We are leaving the rest for CI.
>>>>>
>>>>> Was that an intentional approach?
>>>>>
>>>>> If so, we will need tested-by tags from folks having 
>>>>> 8350/8450/8550/sc8280x,qcm2290?
>>>>>
>>>>> I am only owning the visual validation on sc7280 atm.
>>>>
>>>> I'm not quite sure what is your intent here. Are there any SoCs 
>>>> after 845 that do not have SmartDMA 2.5? Or do you propose to enable 
>>>> SmartDMA only for the chipsets that we can visually test? That 
>>>> sounds strange.
>>>>
>>>
>>> Yes I was thinking to enable smartDMA at the moment on chipsets which 
>>> we can validate visually that display comes up. But I am not sure if 
>>> thats entirely practical.
>>>
>>> But the intent was I just want to make sure basic display does come 
>>> up with smartDMA enabled if we are enabling it for all chipsets.
>>
>> I don't think it is practical or logical. We don't require validating 
>> other changes on all possible chipsets, so what is so different with 
>> this one?
>>
> 
> Thats because with smartDMA if the programming of stages goes wrong we 
> could potentially just see a blank screen. Its not about other changes, 
> this change in particular controls enabling a feature.
> 
> But thats just my thought. I am not going to request to ensure this or 
> block this for this.
> 
> You can still have my
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> 
> But think of the validations that have to be done before we merge it.

The usual way: verify as much as feasible and let anybody else complain 
during the development cycle.

-- 
With best wishes
Dmitry

