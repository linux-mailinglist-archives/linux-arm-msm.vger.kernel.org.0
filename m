Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5D9EB733D36
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jun 2023 02:38:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230298AbjFQAiA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Jun 2023 20:38:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231268AbjFQAh6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Jun 2023 20:37:58 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F4E3A9E
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:37:55 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id 38308e7fff4ca-2b458769b9fso17606771fa.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 16 Jun 2023 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686962274; x=1689554274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=zLJ/HyLk8aHdK48XNj4A6heaUhmNKktRDgE5dNyjydg=;
        b=F/zDTD04CIDiDtqFILY+mlOJJrQDgwNsNf0ZJTwwM7BhWLA4SWXQJg/NUnSvrEIixH
         E/OwMz6Vx4bzt31u/Ep7J2sZcrE3REGZg4QTpPxsy8FkV8keDkznN4l2H0605wcWHJg1
         K27DuUnKZy6ENPvlWWUuTlY+Q8RmiPB7s3zl3SAS/xQM40+EeNGKhlHoRf5xGvxjAiru
         IZZ7aSO1A6XLxbrUVFCzfUI1CPGhU95RmYY03cnemM12cBWvOpHyKvdguM62CGyRg926
         GDlbIJQ/NrAfL/T+T5Ou33KrguWIUuGvM9W2K/abeDsvkpXn83I0gNUSxXaz2iaIArXr
         UY3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686962274; x=1689554274;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zLJ/HyLk8aHdK48XNj4A6heaUhmNKktRDgE5dNyjydg=;
        b=D8Hmy4IBZtiQBTidQmIc1qSmkrouO7KDqrS77DL2EghIlyTNzY5uu9QclKOyOHJvZC
         jhPWMZEjNhlm31VhrtFwld9WD+hThoffW2D9aD70XkXgtckSg2Po+R1bxM14vu7IS4cX
         aqQZh1sWC8gPe0DT4XPmhlKsSUKKDLWA4f0KzcisOGi0eGVggb55CSfZRo+SJW4EDkLf
         Rn6Lyqo4EYRSzi5AtAh9DBkljCfGCtXGJFXcZekc3KmlbbPwMg3hoscpP9sNNY+c6uUF
         YgK7I5/cEwYqTvyAYVv/x8JeIUKIXm1+wtcQ51RnyoT0i+xyfamjU1hAlZcCvGRzC+Yq
         /HBg==
X-Gm-Message-State: AC+VfDzt+eIX5/30mL1E7shaoZgNivAPeSvqeUdx4ISbVC/299bSZ+Bw
        /et17gvOAFaAIbj0aS0wJjF1YA==
X-Google-Smtp-Source: ACHHUZ70tOwcodBKjysvwsCBQVd0Y91pAmSk1S5eoU5HgEC2qlxBhGcITnzOYwkKBnRAYA55tcDz+A==
X-Received: by 2002:a2e:9082:0:b0:2b1:e807:f0f with SMTP id l2-20020a2e9082000000b002b1e8070f0fmr2660137ljg.28.1686962274146;
        Fri, 16 Jun 2023 17:37:54 -0700 (PDT)
Received: from [192.168.1.212] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id y5-20020a2e95c5000000b002b3204fdd78sm3021076ljh.140.2023.06.16.17.37.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Jun 2023 17:37:53 -0700 (PDT)
Message-ID: <2b01b53a-9d8a-3b7d-d1bd-7d25eb77a9c0@linaro.org>
Date:   Sat, 17 Jun 2023 03:37:52 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [Freedreno] [PATCH 1/3] drm/msm/dpu: Add DPU_INTF_DATABUS_WIDEN
 feature flag for DPU >= 5.0
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Marijn Suijten <marijn.suijten@somainline.org>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Sean Paul <sean@poorly.run>
References: <20230525-add-widebus-support-v1-0-c7069f2efca1@quicinc.com>
 <20230525-add-widebus-support-v1-1-c7069f2efca1@quicinc.com>
 <wpjxrnhbcanbc5iatxnff25yrrdfrtmgb24sgwyo457dz2oyjz@e2docpcb6337>
 <f4fb042c-1458-6077-3c49-8cc02638b27c@linaro.org>
 <ycgei43x4kfmjk7g7gbeglehtiiinfbqmrjbdzcy56frxbtd2z@yk2f5kgrkbrt>
 <e23de804-060d-3278-5045-1ed03f0de80d@quicinc.com>
 <c5cfc132-effb-8269-ac5d-ed8c988d1a16@quicinc.com>
 <08b6aaf4-6edd-4f41-5d98-11ffc27e766e@quicinc.com>
 <6d11e420-1b95-0029-ec7a-17fbc8acb5ca@linaro.org>
 <827875ad-a446-10e7-6608-f9b0fa830a00@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <827875ad-a446-10e7-6608-f9b0fa830a00@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/06/2023 00:10, Abhinav Kumar wrote:
> 
> 
> On 6/14/2023 1:43 PM, Dmitry Baryshkov wrote:
>> On 14/06/2023 23:39, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/14/2023 12:54 PM, Abhinav Kumar wrote:
>>>>
>>>>
>>>> On 6/14/2023 12:35 PM, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 6/14/2023 5:23 AM, Marijn Suijten wrote:
>>>>>> On 2023-06-14 15:01:59, Dmitry Baryshkov wrote:
>>>>>>> On 14/06/2023 14:42, Marijn Suijten wrote:
>>>>>>>> On 2023-06-13 18:57:11, Jessica Zhang wrote:
>>>>>>>>> DPU 5.x+ supports a databus widen mode that allows more data to 
>>>>>>>>> be sent
>>>>>>>>> per pclk. Enable this feature flag on all relevant chipsets.
>>>>>>>>>
>>>>>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>>>>>> ---
>>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 ++-
>>>>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 ++
>>>>>>>>>    2 files changed, 4 insertions(+), 1 deletion(-)
>>>>>>>>>
>>>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>> index 36ba3f58dcdf..0be7bf0bfc41 100644
>>>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>>>> @@ -103,7 +103,8 @@
>>>>>>>>>        (BIT(DPU_INTF_INPUT_CTRL) | \
>>>>>>>>>         BIT(DPU_INTF_TE) | \
>>>>>>>>>         BIT(DPU_INTF_STATUS_SUPPORTED) | \
>>>>>>>>> -     BIT(DPU_DATA_HCTL_EN))
>>>>>>>>> +     BIT(DPU_DATA_HCTL_EN) | \
>>>>>>>>> +     BIT(DPU_INTF_DATABUS_WIDEN))
>>>>>>>>
>>>>>>>> This doesn't work.  DPU 5.0.0 is SM8150, which has DSI 6G 2.3. 
>>>>>>>> In the
>>>>>>>> last patch for DSI you state and enable widebus for DSI 6G 2.5+ 
>>>>>>>> only,
>>>>>>>> meaning DPU and DSI are now desynced, and the output is completely
>>>>>>>> corrupted.
>>>>>>
>>>
>>> I looked at the internal docs and also this change. This change is 
>>> incorrect because this will try to enable widebus for DPU >= 5.0 and 
>>> DSI  >= 2.5
>>>
>>> That was not the intended right condition as thats not what the docs 
>>> say.
>>>
>>> We should enable for DPU >= 7.0 and DSI >= 2.5
>>>
>>> Is there any combination where this compatibility is broken? That 
>>> would be the strange thing for me ( not DPU 5.0 and DSI 2.5 as that 
>>> was incorrect)
>>>
>>> Part of this confusion is because of catalog macro re-use again.
>>>
>>> This series is a good candidate and infact I think we should only do 
>>> core_revision based check on DPU and DSI to avoid bringing the 
>>> catalog mess into this.
>>
>> I have just a single request here: can we please have the same 
>> approach for both DSI and DP? I don't mind changing DP code if it 
>> makes it better. If you don't have better reasons, I like the idea of 
>> DSI/DP dictating whether wide bus should be used on the particular 
>> interface. It allows us to handle possible errata or corner cases 
>> there. Another option would be to make DPU tell DSI / DP whether the 
>> wide bus is enabled or not, but I'd say, this is slightly worse solution.
>>
> 
> Today, DP's widebus does not check if DPU supports that or not.
> 
> DPU encoder queries the DP whether widebus is available and enables it.
> 
> We can also do the same thing for DSI.
> 
> So for intf_type of DSI, DPU encoder will query DSI if it supports widebus.

Not if it supports wide bus. But the check is whether enabling wide bus 
is requested by the output driver (DSI/DP).

> 
> Then DSI will do its version checks and for DSC it will say yes.
> 
> This way, we will never check for the DPU's core revision for DSI and 
> purely rely of DP/DSI's hw revisions.
> 
> Thats fine with me because that way we again just rely on the hw 
> revision to enable the feature.
> 
> But as a result I am still going to drop this patch which adds widebus 
> to the catalog as a dpu cap which I always wanted to do anyway as we 
> will just rely on the DSI and DP hw revisions.

Yep.

> 
>>>
>>>>>> Tested this on SM8350 which actually has DSI 2.5, and it is also
>>>>>> corrupted with this series so something else on this series might be
>>>>>> broken.
>>>>>>
>>>>
>>>> Missed this response. That seems strange.
>>>>
>>>> This series was tested on SM8350 HDK with a command mode panel.
>>>>
>>>> We will fix the DPU-DSI handshake and post a v2 but your issue needs 
>>>> investigation in parallel.
>>>>
>>>> So another bug to track that would be great.
>>>>
>>>>>>>> Is the bound in dsi_host wrong, or do DPU and DSI need to 
>>>>>>>> communicate
>>>>>>>> when widebus will be enabled, based on DPU && DSI supporting it?
>>>>>>>
>>>>>>> I'd prefer to follow the second approach, as we did for DP. DPU 
>>>>>>> asks the
>>>>>>> actual video output driver if widebus is to be enabled.
>>>>>>
>>>>>
>>>>> I was afraid of this. This series was made on an assumption that 
>>>>> the DPU version of widebus and DSI version of widebus would be 
>>>>> compatible but looks like already SM8150 is an outlier.
>>>>>
>>>>> Yes, I think we have to go with second approach.
>>>>>
>>>>> DPU queries DSI if it supports widebus and enables it.
>>>>>
>>>>> Thanks for your responses. We will post a v2.
>>>>>
>>>>>> Doesn't it seem very strange that DPU 5.x+ comes with a widebus 
>>>>>> feature,
>>>>>> but the DSI does not until two revisions later?  Or is this 
>>>>>> available on
>>>>>> every interface, but only for a different (probably DP) encoder 
>>>>>> block?
>>>>>>
>>>>>
>>>>> Yes its strange.
>>>>>
>>>
>>> I have clarified this above. Its not strange but appeared strange 
>>> because we were checking wrong conditions.
>>>
>>>
>>>>>> - Marijn
>>

-- 
With best wishes
Dmitry

