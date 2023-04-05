Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7346B6D719A
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Apr 2023 02:43:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234955AbjDEAnl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 4 Apr 2023 20:43:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230489AbjDEAnk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 4 Apr 2023 20:43:40 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 05C161B3
        for <linux-arm-msm@vger.kernel.org>; Tue,  4 Apr 2023 17:43:39 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id g19so31437259lfr.9
        for <linux-arm-msm@vger.kernel.org>; Tue, 04 Apr 2023 17:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680655417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lOXUD06Ut5gCyISL/ThTXuYokrK5x2lyY3jhfH4LGFw=;
        b=osKqK+rEBrGx0U4IIXp/c+J3Vjs1wXfdXAIGyfS/YsvpESkjU1xxUJNXtZG9U2uhzW
         x9Oz7F+BHYB018Mcx51g+l/rl4Z8f6vTYpzg5GHsDZ5+k85q1y9I3w/PQxN8nnQibmdD
         s+RXLqriElsRX/f8ij+pOFxNPuuEQzIgKM7uzbtiX46wf1Kal4krX2RELgxpsrv+V6UM
         DlfpPLOH44p/Ouo2nkLej0ZhqjZ4SIm2fFMxTfna4HdeGggdDI7oEyym70gcAWcEn/w5
         /b9zH5Ztu+fIOC9q3Ibsen8A/HblAk7BVYgYD+AVH/YIco27IPkjPduyTVoUoMB+USvN
         HQfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680655417;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lOXUD06Ut5gCyISL/ThTXuYokrK5x2lyY3jhfH4LGFw=;
        b=RgIWxb3kfxKgn9kOZUdL6TT1RkZjs3Q23yCjOnGgtgpKDc0Xtl8HH9bDEDuEo10Wha
         3/UIQt+idMo89xn1IJvhJlhK0Qx5NxNs8emvgGGAivk2YorbTdUmAgfvEP2RHKKQDgt2
         pp6bqepaDfakLbcJ9RpZmzhEyuQzN/uC4Mlh/lGg401iWkiC+XeNG+6XuR2oycSJuOoE
         3Hq1M4WZVkj/WdbBRD2puRN1lnkYyYKlaE5+W88EDGAAFKbDbSq19pm1jaJx8w/CHqM/
         77LhkxAUcl/AWCHhuTZ3nFKVFdBawnkCspH+c6VEnT1X9SHd7vaZNmxh/0faPi/hJ6Kg
         fMHw==
X-Gm-Message-State: AAQBX9f26YdDZds5xM2a1ww5ogKmRqIGUqhbbW0FXtB9G7R9/nJMpPDG
        fZ/64ryUPN5j7Xv83ykM43nQ8g==
X-Google-Smtp-Source: AKy350ZzP7B/TZjkgO7Ufz8WKL2NHiqzmnCd8jmaAcpv+XHCdRqnu5LrqbdLmCtcMVgap4cNo+5zgg==
X-Received: by 2002:ac2:4250:0:b0:4db:513f:fe2a with SMTP id m16-20020ac24250000000b004db513ffe2amr1035499lfl.23.1680655417271;
        Tue, 04 Apr 2023 17:43:37 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id p15-20020a19f00f000000b004ddaea30ba6sm2561493lfc.235.2023.04.04.17.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 17:43:36 -0700 (PDT)
Message-ID: <397da2da-2e76-3565-6416-568397cf32c1@linaro.org>
Date:   Wed, 5 Apr 2023 03:43:36 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v4 01/42] drm/msm/dpu: use CTL_SC7280_MASK for sm8450's
 ctl_0
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230404130622.509628-1-dmitry.baryshkov@linaro.org>
 <20230404130622.509628-2-dmitry.baryshkov@linaro.org>
 <aa3175ec-e381-7211-3bf1-ca8bb9ef696b@quicinc.com>
 <6948fe29-af08-9164-4cec-a6564dbb1e1a@linaro.org>
 <6b672c6b-5d89-a89d-d8ff-0cd4ec5b7961@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <6b672c6b-5d89-a89d-d8ff-0cd4ec5b7961@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
        DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05/04/2023 03:39, Abhinav Kumar wrote:
> 
> 
> On 4/4/2023 5:33 PM, Dmitry Baryshkov wrote:
>> On 05/04/2023 01:12, Abhinav Kumar wrote:
>>>
>>>
>>> On 4/4/2023 6:05 AM, Dmitry Baryshkov wrote:
>>>> On sm8450 platform the CTL_0 doesn't differ from the rest of CTL 
>>>> blocks,
>>>> so switch it to CTL_SC7280_MASK too.
>>>>
>>>> Some background: original commit 100d7ef6995d ("drm/msm/dpu: add 
>>>> support
>>>> for SM8450") had all (relevant at that time) bit spelled individually.
>>>> Then commit 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 to hw catalog"),
>>>> despite being a mismerge, correctly changed all other CTL entries to 
>>>> use
>>>> CTL_SC7280_MASK, except CTL_0.
>>>>
>>>
>>> I think having it spelled individually is better. If we start using 
>>> one chipset's mask for another, we are again going down the same path 
>>> of this becoming one confused file.
>>>
>>> So, even though I agree that 0e91bcbb0016 ("drm/msm/dpu: Add SM8350 
>>> to hw catalog") corrected the mask to re-use sc7280, with the 
>>> individual catalog file, its better to have it separate and spelled 
>>> individually.
>>>
>>> This change is not heading in the direction of the rest of the series.
>>
>> I didn't create duplicates of all the defines. This is done well in 
>> the style of patch37. I'm not going to add all per-SoC feature masks.
>>
> 
> Yes, I was actually going to comment even on patch 37.
> 
> We are again trying to generalize a CTL's caps based on DPU version, the 
> same mistake which led us down this path.
> 
> So today you have CTL_DPU_0_MASK , CTL_DPU_5_MASK , CTL_DPU_7_MASK  and 
> CTL_DPU_9_MASK and this builds on an assumption that you can get 5 by 
> ORing ACTIVE_CFG with 0.
> 
> +#define CTL_DPU_5_MASK (CTL_DPU_0_MASK | \
> +            BIT(DPU_CTL_ACTIVE_CFG))
> +
> 
> This is again moving towards that problematic pattern.
> 
> Why dont we stick to CTL features individually spelling it then work 
> towards generalizing as we discussed.

Because adding a feature would become a nightmare of touching all the 
platforms?

We discussed not merging on major+LM. Glad, I agreed there. But I don't 
think that we should remove existing defines without good reason. We 
know that they work in the majority of cases.

>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> index 6840b22a4159..83f8f83e2b29 100644
>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>> @@ -975,7 +975,7 @@ static const struct dpu_ctl_cfg sm8450_ctl[] = {
>>>>       {
>>>>       .name = "ctl_0", .id = CTL_0,
>>>>       .base = 0x15000, .len = 0x204,
>>>> -    .features = BIT(DPU_CTL_ACTIVE_CFG) | 
>>>> BIT(DPU_CTL_SPLIT_DISPLAY) | BIT(DPU_CTL_FETCH_ACTIVE),
>>>> +    .features = BIT(DPU_CTL_SPLIT_DISPLAY) | CTL_SC7280_MASK,
>>>>       .intr_start = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR2, 9),
>>>>       },
>>>>       {
>>

-- 
With best wishes
Dmitry

