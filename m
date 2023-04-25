Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D5CF66EDD45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 Apr 2023 09:54:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233247AbjDYHyz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 25 Apr 2023 03:54:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58646 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233440AbjDYHyx (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 25 Apr 2023 03:54:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B9F72D52
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 00:54:50 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f1957e80a2so103644415e9.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Apr 2023 00:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682409289; x=1685001289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VQwbma0iSI5QAy6oY/g8yyHDTalLHVN442ZQ8tvUH24=;
        b=fbLhHVt+lFYR4yIQa+10NhRc6dkhInNnA8+K7HTASmn+mKX4Hfm7yq7LFxEthff06H
         M4/EtuuBL/h9BmwBsZC9J0ZqOb0HxbtVYVFuYKt1IEROEUctGiRzrIj+yO2UiNVyViSx
         j2AfmUyyKbUXV9N6ztoCdIzNm2fegmQTUptqhsWigMLzZMU6W2cGH6fYIr/oaPhbADmB
         ijLSNIVrrESS6BQmopEXhUGaJ53opq2rmslJPPnZZaym3x8q2x89fgx2ULchAXDxzhhZ
         sGKhHZWJRc27SMAPllO9LRB/zd+a902zQgjUeSfRH647+AJnQFlFEKM3zqO95PU9RsuS
         KsHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682409289; x=1685001289;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VQwbma0iSI5QAy6oY/g8yyHDTalLHVN442ZQ8tvUH24=;
        b=TpDph9TJGDeM0qSZ8f98XWR2Pf2fqsfBLhNYovIIOzqwg0P8LFY4XUQUjpzkaimRSw
         /9uSAxA3uMBD2jgzRLJPnlZH536qSlkU6H0C4mrjlSJTKZ4UsXInK7Sxun6NjPl8Ifov
         pj/032aPpCD+OlLIgJIMVK+ZQbruR33p4eASUSXG6f12/LhySHXoWZ/AGZjvTCCgqU1H
         /+Pu5DZlM92JmrsRkb7ONyUTKt1fkuTYhG3ayOJUVRO484U0aDZq1uUaZ4MOZgH1gTUO
         bDqAwP9KFBl9sFAcP0CAhoqkKPc+VaRvkVJDU2dQ8ZoYD+XFbPppfQoE4izLDyD6NXPn
         Y1Uw==
X-Gm-Message-State: AAQBX9d1rXnBfAXxuzUoXNTJumE+wHQIZikI5YwhvdK/VCPdYVzah1n6
        rOq6TSBqcV2mloN2/S1IGbw9nKzmj4eMMFK82U5FvA==
X-Google-Smtp-Source: AKy350bxj+aLsLRHeyMoP4qkYz3CwXQQYHpY+KUVzCxjAPI+daPQkuA/5bLUrLZ68T16RxCKRXIXAg==
X-Received: by 2002:a5d:414c:0:b0:2fa:d00d:cab8 with SMTP id c12-20020a5d414c000000b002fad00dcab8mr11412934wrq.18.1682409288661;
        Tue, 25 Apr 2023 00:54:48 -0700 (PDT)
Received: from [172.23.2.5] ([31.221.30.162])
        by smtp.gmail.com with ESMTPSA id v7-20020a5d4a47000000b002fe065da369sm12333449wrs.69.2023.04.25.00.54.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Apr 2023 00:54:48 -0700 (PDT)
Message-ID: <31f116f6-a6b7-1241-83bc-96c31e718f3f@linaro.org>
Date:   Tue, 25 Apr 2023 10:54:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 3/3] drm/msm/dpu: Pass catalog pointers directly from
 RM instead of IDs
Content-Language: en-GB
To:     Marijn Suijten <marijn.suijten@somainline.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        ~postmarketos/upstreaming@lists.sr.ht,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Martin Botka <martin.botka@somainline.org>,
        Jami Kettunen <jami.kettunen@somainline.org>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20230418-dpu-drop-useless-for-lookup-v2-0-acb08e82ef19@somainline.org>
 <20230418-dpu-drop-useless-for-lookup-v2-3-acb08e82ef19@somainline.org>
 <50d22e0c-84b3-0678-eb06-30fb66fd24cf@quicinc.com>
 <ymq4kstme55dm3j5kr6trevnwdelhjq7e7m4yky6zcbnf7auid@66l7inxz4oq2>
 <CAA8EJprYQUFER6x1+ucHX_Ze2uqWc6xoEaYDdJ1s0jgZjPJ0QQ@mail.gmail.com>
 <c809476f-74bc-0399-08f9-1bf26e7170fa@quicinc.com>
 <r2tndjr5jbjtrwwti6l3ag7562e53nqx2uk6vz6fx43yc7sncl@eypc37r2ey3j>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <r2tndjr5jbjtrwwti6l3ag7562e53nqx2uk6vz6fx43yc7sncl@eypc37r2ey3j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 25/04/2023 10:16, Marijn Suijten wrote:
> On 2023-04-24 16:23:17, Abhinav Kumar wrote:
>>
>>
>> On 4/24/2023 3:54 PM, Dmitry Baryshkov wrote:
>>> On Tue, 25 Apr 2023 at 01:03, Marijn Suijten
>>> <marijn.suijten@somainline.org> wrote:
>>>>
>>>> On 2023-04-21 16:25:15, Abhinav Kumar wrote:
>>>>>
>>>>>
>>>>> On 4/21/2023 1:53 PM, Marijn Suijten wrote:
>>>>>> The Resource Manager already iterates over all available blocks from the
>>>>>> catalog, only to pass their ID to a dpu_hw_xxx_init() function which
>>>>>> uses an _xxx_offset() helper to search for and find the exact same
>>>>>> catalog pointer again to initialize the block with, fallible error
>>>>>> handling and all.
>>>>>>
>>>>>> Instead, pass const pointers to the catalog entries directly to these
>>>>>> _init functions and drop the for loops entirely, saving on both
>>>>>> readability complexity and unnecessary cycles at boot.
>>>>>>
>>>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>>>
>>>>> Overall, a nice cleanup!
>>>>>
>>>>> One comment below.
>>>>>
>>>>>> ---
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c        | 37 +++++----------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h        | 14 ++++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c        | 32 +++---------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h        | 11 +++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c       | 38 ++++-----------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.h       | 12 +++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  2 +-
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c       | 40 ++++++-----------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h       | 12 +++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c         | 38 ++++-----------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h         | 10 +++---
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    | 33 +++----------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.h    | 14 ++++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 33 +++----------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   | 14 ++++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c       | 39 ++++------------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h       | 12 +++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c       | 33 +++----------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h       | 11 +++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c         | 33 ++++---------------
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h         | 11 +++----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c           | 17 +++++-----
>>>>>>     drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c            | 18 +++++-----
>>>>>>     23 files changed, 139 insertions(+), 375 deletions(-)
>>>>>>
>>>>>
>>>>> <snipped>
>>>>>
>>>>>> -struct dpu_hw_intf *dpu_hw_intf_init(enum dpu_intf idx,
>>>>>> -           void __iomem *addr,
>>>>>> -           const struct dpu_mdss_cfg *m)
>>>>>> +struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
>>>>>> +           void __iomem *addr)
>>>>>>     {
>>>>>>       struct dpu_hw_intf *c;
>>>>>> -   const struct dpu_intf_cfg *cfg;
>>>>>> +
>>>>>> +   if (cfg->type == INTF_NONE) {
>>>>>> +           pr_err("Cannot create interface hw object for INTF_NONE type\n");
>>>>>> +           return ERR_PTR(-EINVAL);
>>>>>> +   }
>>>>>
>>>>> The caller of dpu_hw_intf_init which is the RM already has protection
>>>>> for INTF_NONE, see below
>>>>>
>>>>>            for (i = 0; i < cat->intf_count; i++) {
>>>>>                    struct dpu_hw_intf *hw;
>>>>>                    const struct dpu_intf_cfg *intf = &cat->intf[i];
>>>>>
>>>>>                    if (intf->type == INTF_NONE) {
>>>>>                            DPU_DEBUG("skip intf %d with type none\n", i);
>>>>>                            continue;
>>>>>                    }
>>>>>                    if (intf->id < INTF_0 || intf->id >= INTF_MAX) {
>>>>>                            DPU_ERROR("skip intf %d with invalid id\n",
>>>>> intf->id);
>>>>>                            continue;
>>>>>                    }
>>>>>                    hw = dpu_hw_intf_init(intf->id, mmio, cat);
>>>>>
>>>>> So this part can be dropped.
>>>>
>>>> I mainly intended to keep original validation where _intf_offset would
>>>> skip INTF_NONE, and error out.  RM init is hence expected to filter out
>>>> INTF_NONE instead of running into that `-EINVAL`, which I maintained
>>>> here.
>>>>
>>>> If you think there won't be another caller of dpu_hw_intf_init, and that
>>>> such validation is hence excessive, I can remove it in a followup v3.
>>>
>>> I'd prefer to see the checks at dpu_rm to be dropped.
>>> dpu_hw_intf_init() (and other dpu_hw_foo_init() functions) should be
>>> self-contained. If they can not init HW block (e.g. because the index
>>> is out of the boundaries), they should return an error.
>>>
>>
>> They already do that today because even without this it will call into
>> _intf_offset() and that will bail out for INTF_NONE.
>>
>> I feel this is a duplicated check because the caller with the loop needs
>> to validate the index before passing it to dpu_hw_intf_init() otherwise
>> the loop will get broken at the first return of the error and rest of
>> the blocks will also not be initialized.
> 
> To both: keep in mind that the range-checks we want to remove from
> dpu_rm_init validate the ID (index?) of a block.  This check is for the
> *TYPE* of an INTF block, to skip it gracefully if no hardware is mapped
> there.  As per the first patch of this series SM6115/QCM2290 only have a
> DSI interface which always sits at ID 1, and ID 0 has its TYPE set to
> INTF_NONE and is skipped.
> 
> Hence we _should_ keep the graceful TYPE check in dpu_rm_init() to skip
> calling this function _and assigning it to the rm->hw_intf array_.  But
> I can remove the second TYPE check here in dpu_hw_intf_init() if you
> prefer.

We can return NULL from dpu_hw_foo_init(), which would mean that the 
block was skipped or is not present.

> 
> - Marijn

-- 
With best wishes
Dmitry

