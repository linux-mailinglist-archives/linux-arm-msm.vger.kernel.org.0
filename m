Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 763F1725035
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Jun 2023 00:51:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240132AbjFFWva (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 6 Jun 2023 18:51:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239630AbjFFWvO (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 6 Jun 2023 18:51:14 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 765BF1998
        for <linux-arm-msm@vger.kernel.org>; Tue,  6 Jun 2023 15:50:56 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4f624daccd1so4027760e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Jun 2023 15:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686091854; x=1688683854;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KoLjNQ9/WlVBAHXrDoXRHflNLPFJVHWzocmCniAhhbU=;
        b=iRuwNRc7T9uHb3WKQuAj5d9L4CRHt/WyFCMws8qVkotHFlg+VzJtb2ZtzBh2cTqU4y
         qMzI60V6WlhA+ekf0su+Dj+sVnPOs6YJn0jTasknjVbnxdAjj5N8pvcnhY9bDCGOSwAC
         G3hDx4j/iu9+Cic3I1AstBV5+QiIJ7pUG6J6SQMkTALN/S8b5iH9Iihu372zN+A2xV9L
         xWqQONtvC4ciY50tc1Se3hDGYPixQTXaDRcCPgQQdvJiZw79bwHiZ7f4fla3I4HPQ7hD
         8Sr9BJnjsirooyN9X0279CpELsw7bkGRJLXZHCH6AeE0s3BCOZWelrN0PThgu8w8VVjs
         Q41w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686091854; x=1688683854;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KoLjNQ9/WlVBAHXrDoXRHflNLPFJVHWzocmCniAhhbU=;
        b=NIOHGUvKhGwj0ZKlcb1f/e+HFwwUunMTCNWD32w+APh0J2KzgmGJsy+B5K69ejoJ40
         Ota0P80wIKMDYroHPhDCvZ5mSl1zouU8t8xX6pTq0A4tqw1hbTNTjUB0UkOBFXojKyWP
         bmi03BtWsLw3LzJm9AtyZtgiMna7e2KitcOBGi9e3fJpWNPeMV0GcoUk5VAPO5erncNJ
         HJosqQVjAMj1QbzUm4Ke2GrjfxrgR1E97th/flDU+0aGlnZm2VMLURlPRTY09jOQh0w1
         sq2eS93exjitX5s1lAytk2eNJEhp1sqb0DV+ETfEq0h5Zi6HRFlU2k50ekCsXv3Irk4o
         AYzg==
X-Gm-Message-State: AC+VfDy6tnQgLm2JJnF452dbyO/i0DRO6PmHN73rNUgkT0/dEMWDI9nG
        tKTnBuvyv+UbFrLv20rCkKEsSA==
X-Google-Smtp-Source: ACHHUZ5LcprzGbHneV+BFSRw5lpZ6p3X1WbZ6ejY5K1it/E9H6aTKgECayXSLgEVg9yd+fXXAtEXQA==
X-Received: by 2002:a19:5204:0:b0:4eb:42b7:8c18 with SMTP id m4-20020a195204000000b004eb42b78c18mr1511390lfb.53.1686091854521;
        Tue, 06 Jun 2023 15:50:54 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5? (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w13-20020a05651203cd00b004ef11b30a17sm1588370lfp.91.2023.06.06.15.50.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jun 2023 15:50:52 -0700 (PDT)
Message-ID: <12aacfc4-8ed5-1c85-8c1c-abd0aed7f8a9@linaro.org>
Date:   Wed, 7 Jun 2023 01:50:51 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [RFC PATCH v2 10/13] drm/msm/dpu: add list of supported formats
 to the DPU caps
Content-Language: en-GB
To:     Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Stephen Boyd <swboyd@chromium.org>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org
References: <20230321011821.635977-1-dmitry.baryshkov@linaro.org>
 <20230321011821.635977-11-dmitry.baryshkov@linaro.org>
 <2a003674-29ef-f6c6-9a23-3eb93d2e479f@quicinc.com>
 <CAA8EJpr0DcVfG86SYKRb-4Ph82dfXafed9CFgY1qFSECFbAcTw@mail.gmail.com>
 <6c61a8f1-f77e-3a18-15f8-7c004a99f78d@quicinc.com>
 <cfad7817-2d7e-843d-033d-cf2f3aba440d@linaro.org>
 <868e69f5-0f47-18cf-0e1e-377c37376437@quicinc.com>
 <e258fce0-9044-399c-fcc9-634ea1d53f7a@linaro.org>
 <e43c9e17-1c0b-f3cd-036f-1a4968a0150d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <e43c9e17-1c0b-f3cd-036f-1a4968a0150d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 07/06/2023 01:47, Abhinav Kumar wrote:
> 
> 
> On 6/6/2023 2:52 PM, Dmitry Baryshkov wrote:
>> On 07/06/2023 00:47, Abhinav Kumar wrote:
>>>
>>>
>>> On 6/6/2023 2:29 PM, Dmitry Baryshkov wrote:
>>>> On 07/06/2023 00:14, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 5/24/2023 6:47 PM, Dmitry Baryshkov wrote:
>>>>>> On Thu, 25 May 2023 at 02:16, Abhinav Kumar 
>>>>>> <quic_abhinavk@quicinc.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>>
>>>>>>> On 3/20/2023 6:18 PM, Dmitry Baryshkov wrote:
>>>>>>>> As we are going to add virtual planes, add the list of supported 
>>>>>>>> formats
>>>>>>>> to the hw catalog entry. It will be used to setup universal 
>>>>>>>> planes, with
>>>>>>>> later selecting a pipe depending on whether the YUV format is 
>>>>>>>> used for
>>>>>>>> the framebuffer.
>>>>>>>>
>>>>>>>
>>>>>>> If your usage of format_list is going to be internal to 
>>>>>>> dpu_plane.c, I
>>>>>>> can think of another idea for this change.
>>>>>>>
>>>>>>> This essentially translates to if (num_vig >= 1)
>>>>>>>
>>>>>>> If we can just have a small helper to detect that from the 
>>>>>>> catalog can
>>>>>>> we use that instead of adding formats to the dpu caps?
>>>>>>
>>>>>> I'd prefer to be explicit here. The list of supported formats might
>>>>>> vary between generations, might it not? Also we don't have a case of
>>>>>> the devices not having VIG planes. Even the qcm2290 (which doesn't
>>>>>> have CSC) lists YUV as supported.
>>>>>>
>>>>>
>>>>> the list of formats is tied to the sspps the dpu generation has and 
>>>>> the capabilities of those sspps.
>>>>>
>>>>> qcm2290 is really an interesting case. It has one vig sspp but no 
>>>>> csc block for that vig sspp, hence it cannot support non-RGB formats.
>>>>>
>>>>> I have confirmed that downstream is incorrect to populate yuv 
>>>>> formats for qcm2290.
>>>>>
>>>>> I still think that having atleast one vig sspp with csc sub-blk is 
>>>>> the right condition to check if we want to decide if the dpu for 
>>>>> that chipset supports yuv formats. Extra csc-blk check to handle 
>>>>> qcm2290.
>>>>>
>>>>> Having a small helper in dpu_plane.c is good enough for that 
>>>>> because with virtual planes, you only need to know "if such a plane 
>>>>> exists and not which plane" and a full catalog change isnt needed IMO
>>>>
>>>> This goes down to the question: is the list of YUV and non-YUV 
>>>> formats static or not? Do all DPU devices support the same set of 
>>>> YUV and non-YUV formats? If it is static, we might as well drop 
>>>> dpu_sspp_sub_blks::format_list.
>>>>
>>>
>>> I would say yes based on the below reference:
>>>
>>> https://git.codelinaro.org/clo/la/platform/vendor/opensource/display-drivers/-/blob/clo/main/msm/sde/sde_hw_catalog.c#L3858
>>>
>>> We always add the same set of YUV formats for all Vig SSPPs 
>>> irrespective of the chipsets.
>>
>> Well, as your example pointed out, few lines below it starts adding 
>> formats to the list, so the format list is not static and depends on 
>> the generation.
>>
> 
> No, the DPU revision checks are there to add P010 UBWC formats on top of 
> the Vig formats.
> 
> At the moment, the latest downstream code (code which is not on CLO 
> hence I cannot share) has dropped all that and just checks if P010 UBWC 
> is supported for the Vig SSPP and adds all those.
> 
> So its still tied to the feature bit whether P010 UBWC is supported in 
> the Vig SSPP and not at the chipset level.

So, what is the difference? This means that depending on some conditions 
either we can support P010 UBWC or we can not. So the list of all 
suppored formats is not static.

> 
>>>
>>>> Note to myself: consider 
>>>> dpu_mdss_cfg::{dma_formats,cursor_formats,vig_formats}. Either 
>>>> migrate dpu_sspp_sub_blks::format_list users to these fields or drop 
>>>> them.
>>>>
>>>
>>> Yes, I agree. There is no need to have format list in the sub_blk as 
>>> for one type of SSPP, it supports the same format across DPU 
>>> generations.
>>>
>>>>>
>>>>>
>>>>>> Note: I think at some point we should have a closer look at the list
>>>>>> of supported formats and crosscheck that we do not have either
>>>>>> unsupported formats being listed, or missing formats which are not
>>>>>> listed as supported.
>>>>>>

-- 
With best wishes
Dmitry

