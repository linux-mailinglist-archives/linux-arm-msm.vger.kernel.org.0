Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 08E216EB5B1
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 01:22:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233627AbjDUXWm (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 19:22:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231282AbjDUXWm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 19:22:42 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB5DFE76
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 16:22:39 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-4ec81773d50so2305027e87.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 16:22:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682119358; x=1684711358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1ykh/S9EIn/VQXAHcbCk1k51QtBL3y8O9SDlmWQNEJA=;
        b=v2UZ4AI8RCuY5SMoTKXtNlMRUXSlkHTOhV6vbcl3bvJlwrhsb1X++okBt3tcq7yYwH
         pXFj6ZSIDWD3Q1y0KLs9ta1nIVHtoeQgAmwEV8O5v9mTXar1Azlx1hOg8QrfSLeFu55U
         OoRK4f3AQ308EuIIi4CYZIu9tfzCNYPmHkX5WtgTFvZ1K1TN7SKj6MWaHBFu79GQvof4
         6pyoM9iF74UR3ixXVHJkwGgJ5ync3zszoChi2C4CBQbvqIDP2dXrwdf4b/jLszsVbrSE
         7isrtC8rIhOM4r6jdzgdIR6DqiGTgPlzbWQxdVBIitWqkV51HRWV1TDfBbKvlJIo5bHJ
         zdPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682119358; x=1684711358;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1ykh/S9EIn/VQXAHcbCk1k51QtBL3y8O9SDlmWQNEJA=;
        b=kQ3DidSGzF7+VzLwFwSe5YrYUmN8NOiEvLP8ld7DEpyIoS/gkAGGrfov6VOiQvLk3E
         o/uDSoD1cFfUvLcXBh62jfZtLjkomR2sq9+TqQSeTb0QDCjrLtF8iEzrH4k6F9eA1odF
         nMrTbl1WFaK0yVGu9eJRAdbZKecwFpHMYHsmR3cirXuZkgif0bysE09UhAIqrNV8Ir+w
         OwPjceoLwXbf2OkHCZg78HnSnJFsAqfq4J19FX8aR5juhlvpS4rVvNfyHUeh5kfxgyvC
         UboIppyUM1Jo1RhGOg9mYRFkp0UO8TM0R/o1sSpP7D1frfTmpJmMNmaOLojkEULYaXbT
         kvgQ==
X-Gm-Message-State: AAQBX9cuv3Ult73cn4XnbMfGUfEWkj1WTLeiFjgWzxIJqzH/575EFS17
        CDRM1Dl9I8Z9wQroBD4bnIwVcQ==
X-Google-Smtp-Source: AKy350bWhDhho9quoxdv9ivdTH3mVKiIHw/dtGyxTs7cIAi2KcAD49KPKFZzj7X4Gqslx/TnWL2ekQ==
X-Received: by 2002:ac2:4215:0:b0:4ec:a9c1:27d7 with SMTP id y21-20020ac24215000000b004eca9c127d7mr1705715lfh.67.1682119358089;
        Fri, 21 Apr 2023 16:22:38 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g9-20020a19ac09000000b004ec8615304dsm695534lfc.222.2023.04.21.16.22.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 16:22:37 -0700 (PDT)
Message-ID: <347f0ca0-2657-4cb5-c006-ef19b0f04e80@linaro.org>
Date:   Sat, 22 Apr 2023 02:22:37 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v1 5/5] drm/msm/dpu: add DSC 1.2 hw blocks for relevant
 chipsets
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, swboyd@chromium.org, dianders@chromium.org,
        vkoul@kernel.org, daniel@ffwll.ch, airlied@gmail.com,
        agross@kernel.org, andersson@kernel.org
Cc:     Abhinav Kumar <quic_abhinavk@quicinc.com>,
        quic_sbillaka@quicinc.com, marijn.suijten@somainline.org,
        freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1682033114-28483-1-git-send-email-quic_khsieh@quicinc.com>
 <1682033114-28483-6-git-send-email-quic_khsieh@quicinc.com>
 <b26dfb22-bf97-b65e-ef06-62098c4eafec@linaro.org>
 <3ee67248-c94c-5f3d-527e-914e8c8b4a31@quicinc.com>
 <7b493d85-0691-8797-367e-1d71ea87c826@linaro.org>
 <4bea9976-d353-6783-f55a-3e83e7501da2@quicinc.com>
 <40f5ac92-f658-25cf-352b-60db49a129f6@linaro.org>
 <89b2a4a0-ddbb-b176-aa3c-c06449a9758d@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <89b2a4a0-ddbb-b176-aa3c-c06449a9758d@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 22/04/2023 02:16, Kuogee Hsieh wrote:
> 
> On 4/21/2023 4:11 PM, Dmitry Baryshkov wrote:
>> On 22/04/2023 02:08, Kuogee Hsieh wrote:
>>>
>>> On 4/21/2023 3:16 PM, Dmitry Baryshkov wrote:
>>>> On 22/04/2023 01:05, Kuogee Hsieh wrote:
>>>>>
>>>>> On 4/20/2023 5:07 PM, Dmitry Baryshkov wrote:
>>>>>> On 21/04/2023 02:25, Kuogee Hsieh wrote:
>>>>>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>>
>>>>>>> Add DSC 1.2 hardware blocks to the catalog with necessary
>>>>>>> sub-block and feature flag information.
>>>>>>> Each display compression engine (DCE) contains dual hard
>>>>>>> slice DSC encoders so both share same base address but with
>>>>>>> its own different sub block address.
>>>>>>
>>>>>> Please correct line wrapping. 72-75 is usually the preferred width
>>>>>>
>>>>>>>
>>>>>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>>> ---
>>>>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 19 
>>>>>>> +++++++++++++++++++
>>>>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  | 11 
>>>>>>> +++++++++++
>>>>>>>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    | 21 
>>>>>>> +++++++++++++++++++++
>>>>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  | 19 
>>>>>>> +++++++++++++++++++
>>>>>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  | 19 
>>>>>>> +++++++++++++++++++
>>>>>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 12 
>>>>>>> ++++++++++--
>>>>>>>   6 files changed, 99 insertions(+), 2 deletions(-)
>>>>>>>
>>>>>>
>>>>>>
>>>>>> [I commented on sm8550, it applies to all the rest of platforms]
>>>>>>
>>>>>>> diff --git 
>>>>>>> a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>>>>> index 9e40303..72a7bcf 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>>>>>> @@ -165,6 +165,23 @@ static const struct dpu_merge_3d_cfg 
>>>>>>> sm8550_merge_3d[] = {
>>>>>>>       MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
>>>>>>>   };
>>>>>>>   +static const struct dpu_dsc_sub_blks sm8550_dsc_sblk_0 = {
>>>>>>> +    .enc = {.base = 0x100, .len = 0x100},
>>>>>>> +    .ctl = {.base = 0xF00, .len = 0x10},
>>>>>>> +};
>>>>>>> +
>>>>>>> +static const struct dpu_dsc_sub_blks sm8550_dsc_sblk_1 = {
>>>>>>> +    .enc = {.base = 0x200, .len = 0x100},
>>>>>>> +    .ctl = {.base = 0xF80, .len = 0x10},
>>>>>>> +};
>>>>>>
>>>>>> Please keep sblk in dpu_hw_catalog for now.
>>>>>>
>>>>>>> +
>>>>>>> +static const struct dpu_dsc_cfg sm8550_dsc[] = {
>>>>>>> +    DSC_BLK_1_2("dsc_0", DSC_0, 0x80000, 0x100, 0, 
>>>>>>> sm8550_dsc_sblk_0),
>>>>>>> +    DSC_BLK_1_2("dsc_0", DSC_1, 0x80000, 0x100, 0, 
>>>>>>> sm8550_dsc_sblk_1),
>>>>>>
>>>>>> Is there a reason why index in "dsc_N" doesn't match the DSC_n 
>>>>>> which comes next to it?
>>>>>
>>>>> usually each DCE (display compression engine) contains two hard 
>>>>> slice encoders.
>>>>>
>>>>> DSC_0 and DSC_1 (index) is belong to dsc_0.
>>>>>
>>>>> If there are two DCE, then DSC_2 and DSC_3 belong to dsc_1
>>>>
>>>> Ah, I see now. So, the block register space is the following:
>>>> DCEi ->
>>>>   common
>>>>   dsc0_enc
>>>>   dsc1_enc
>>>>   dsc0_ctl
>>>>   dsc1_ctl
>>>>
>>>> Instead of declaring a single DCE unit with two DSC blocks, we 
>>>> declare two distinct DSC blocks. This raises a question, how 
>>>> independent are these two parts of a single DCE block? For example, 
>>>> can we use them to perform compression with different parameters? Or 
>>>> use one of them for the DP DSC and another one for DSI DSC? Can we 
>>>> have the following configuration:
>>>>
>>>> DSC_0 => DP DSC
>>>> DSC_1, DSC_2 => DSI DSC in DSC_MERGE topology?
>>>
>>> no, For merge mode you have to use same DCE, such as DSC_2 and DSC3 
>>> (pair)
>>
>> Ok, this is for the merge mode. So the dpu_rm should be extended to 
>> allocate them in pairs if merge mode is requested.
>>
>> What about using DSC_0 for DP and DSC_1 for DSI? Is it possible?
> 
> I never do that, but i think it should  works since they can work 
> independently.

Good, thanks for the confirmation. For v2, could you please describe 
this arrangement of DCE -> 2xDSC in a comment close to DSC_BLK_1_2 and 
corresponding sblk definitions?

Also could you please fix dpu_rm to allocate DSC blocks in pairs for 
DSC_MERGE mode.

Last, but not least, would it make sense to name the blocks as "dceN" 
instead of "dscN"?

> 
> 
>>
>>>
>>>>
>>>>>
>>>>>>
>>>>>>> +    DSC_BLK_1_2("dsc_1", DSC_2, 0x81000, 0x100, 
>>>>>>> BIT(DPU_DSC_NATIVE_422_EN), sm8550_dsc_sblk_0),
>>>>>>> +    DSC_BLK_1_2("dsc_1", DSC_3, 0x81000, 0x100, 
>>>>>>> BIT(DPU_DSC_NATIVE_422_EN), sm8550_dsc_sblk_1),
>>>>>>> +};
>>>>>>> +
>>>>>>>   static const struct dpu_intf_cfg sm8550_intf[] = {
>>>>>>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>>>>>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 
>>>>>>> 24, 25),
>>>>>>>       /* TODO TE sub-blocks for intf1 & intf2 */
>>>>>>> @@ -218,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>>>>>>>       .dspp = sm8550_dspp,
>>>>>>>       .pingpong_count = ARRAY_SIZE(sm8550_pp),
>>>>>>>       .pingpong = sm8550_pp,
>>>>>>> +    .dsc = sm8550_dsc,
>>>>>>> +    .dsc_count = ARRAY_SIZE(sm8550_dsc),
>>>>>>>       .merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>>>>>>>       .merge_3d = sm8550_merge_3d,
>>>>>>>       .intf_count = ARRAY_SIZE(sm8550_intf),
>>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> index 03f162a..be08158 100644
>>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>>>>>> @@ -1,6 +1,6 @@
>>>>>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>>>>>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights 
>>>>>>> reserved.
>>>>>>> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All 
>>>>>>> rights reserved.
>>>>>>> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All 
>>>>>>> rights reserved.
>>>>>>>    */
>>>>>>>     #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>>>>>>> @@ -540,7 +540,15 @@ static const struct dpu_pingpong_sub_blks 
>>>>>>> sc7280_pp_sblk = {
>>>>>>>       {\
>>>>>>>       .name = _name, .id = _id, \
>>>>>>>       .base = _base, .len = 0x140, \
>>>>>>> -    .features = _features, \
>>>>>>> +    .features = BIT(DPU_DSC_HW_REV_1_1) | _features, \
>>>>>>> +    }
>>>>>>> +
>>>>>>> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>>>>>>> +    {\
>>>>>>> +    .name = _name, .id = _id, \
>>>>>>> +    .base = _base, .len = _len, \
>>>>>>> +    .features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>>>>>>> +    .sblk = &_sblk, \
>>>>>>>       }
>>>>>>> /*************************************************************
>>>>>>
>>>>
>>

-- 
With best wishes
Dmitry

