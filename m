Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5752E6EB48E
	for <lists+linux-arm-msm@lfdr.de>; Sat, 22 Apr 2023 00:16:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbjDUWQw (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 21 Apr 2023 18:16:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233697AbjDUWQu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 21 Apr 2023 18:16:50 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959192705
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 15:16:48 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-4eed6ddcae1so9748214e87.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 21 Apr 2023 15:16:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682115407; x=1684707407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8G5FObVVgsm9tbM7LACwT4TVgM1XACF53tzcjkM3Wi0=;
        b=hNElGow2W1/eEsGSqDa+AteEZ0tihNCulnenG2EeOoB870QdO/oNqo1u8BCoFhQtKA
         AhXlKqswhQveIae6wY5kih5XRkg9o61GWmYPBbwntYNQGb3eCveRwCIn6dTIrTMDwiOF
         PLkmtYJ98X622ghmaUf05AiFZ3ruEegyLuJk7pb4vEVq0Jd5D1dFwCbhHUQ+91JmAE+k
         R+taLJWVrinNGxeoFw6pjNmFGtjBbXFOe8qj6HLmMQFUSi9i1W3qANLNCssV6GiS0J81
         AszyBu+onfntFJTi63d2PVzXNLDCHp0HUZ5iODASRwuS386Kn5zEk/2M/4m7DM19C4Yp
         24Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682115407; x=1684707407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8G5FObVVgsm9tbM7LACwT4TVgM1XACF53tzcjkM3Wi0=;
        b=UUqUACfS1hmcUZCijeJGljERcF/biNvNFRmmbbPMOulQKV72ooCzzL174NTO06vWmC
         mWLIK0KSdKHF+Ou+sQcRPukxe4GA58NRK52anevk50sVHQvWWsiEN3WMdMtL151Nsrtc
         5tIE+KfuuDzsETJ8NJetA1Aezw20JbfHyXifOWmIvOMmGuJO00CnqIDCxhZpgdheQ/+G
         OBcP9fS+rm+DOBpherImFBR4/3ks5+1xI/p9wuI46NwRLtEBRYjh4MrVxEoIgfUzKuw8
         Q4ioSOdKeEViqMBwZ0NOAgt+veVTurl9dBeRSkwvmnoBhmIyxtUuZp+RINeGLKcxdVcQ
         lJtA==
X-Gm-Message-State: AAQBX9fUPdQYggsGDD45CKP1ycN5AWBGEZGLoFS1ebFyQWzM5Hby+BDq
        1VWLDQ+F7ID2/+SYXwgUm9EwPA==
X-Google-Smtp-Source: AKy350bgz9l0F7rcrV3qoc9NrfgW1k8ZSg2ViohrJBy+z1PJkEHlFgNtCRcoJVY5NCtjMQdHlEYzkQ==
X-Received: by 2002:a05:651c:104f:b0:2a8:ea9e:29b6 with SMTP id x15-20020a05651c104f00b002a8ea9e29b6mr956269ljm.11.1682115406797;
        Fri, 21 Apr 2023 15:16:46 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id a28-20020a2eb17c000000b0029c96178425sm747894ljm.19.2023.04.21.15.16.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Apr 2023 15:16:46 -0700 (PDT)
Message-ID: <7b493d85-0691-8797-367e-1d71ea87c826@linaro.org>
Date:   Sat, 22 Apr 2023 01:16:45 +0300
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
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <3ee67248-c94c-5f3d-527e-914e8c8b4a31@quicinc.com>
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

On 22/04/2023 01:05, Kuogee Hsieh wrote:
> 
> On 4/20/2023 5:07 PM, Dmitry Baryshkov wrote:
>> On 21/04/2023 02:25, Kuogee Hsieh wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Add DSC 1.2 hardware blocks to the catalog with necessary
>>> sub-block and feature flag information.
>>> Each display compression engine (DCE) contains dual hard
>>> slice DSC encoders so both share same base address but with
>>> its own different sub block address.
>>
>> Please correct line wrapping. 72-75 is usually the preferred width
>>
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h  | 19 
>>> +++++++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h  | 11 +++++++++++
>>>   .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h    | 21 
>>> +++++++++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h  | 19 
>>> +++++++++++++++++++
>>>   .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h  | 19 
>>> +++++++++++++++++++
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c      | 12 ++++++++++--
>>>   6 files changed, 99 insertions(+), 2 deletions(-)
>>>
>>
>>
>> [I commented on sm8550, it applies to all the rest of platforms]
>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h 
>>> b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> index 9e40303..72a7bcf 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
>>> @@ -165,6 +165,23 @@ static const struct dpu_merge_3d_cfg 
>>> sm8550_merge_3d[] = {
>>>       MERGE_3D_BLK("merge_3d_3", MERGE_3D_3, 0x66700),
>>>   };
>>>   +static const struct dpu_dsc_sub_blks sm8550_dsc_sblk_0 = {
>>> +    .enc = {.base = 0x100, .len = 0x100},
>>> +    .ctl = {.base = 0xF00, .len = 0x10},
>>> +};
>>> +
>>> +static const struct dpu_dsc_sub_blks sm8550_dsc_sblk_1 = {
>>> +    .enc = {.base = 0x200, .len = 0x100},
>>> +    .ctl = {.base = 0xF80, .len = 0x10},
>>> +};
>>
>> Please keep sblk in dpu_hw_catalog for now.
>>
>>> +
>>> +static const struct dpu_dsc_cfg sm8550_dsc[] = {
>>> +    DSC_BLK_1_2("dsc_0", DSC_0, 0x80000, 0x100, 0, sm8550_dsc_sblk_0),
>>> +    DSC_BLK_1_2("dsc_0", DSC_1, 0x80000, 0x100, 0, sm8550_dsc_sblk_1),
>>
>> Is there a reason why index in "dsc_N" doesn't match the DSC_n which 
>> comes next to it?
> 
> usually each DCE (display compression engine) contains two hard slice 
> encoders.
> 
> DSC_0 and DSC_1 (index) is belong to dsc_0.
> 
> If there are two DCE, then DSC_2 and DSC_3 belong to dsc_1

Ah, I see now. So, the block register space is the following:
DCEi ->
   common
   dsc0_enc
   dsc1_enc
   dsc0_ctl
   dsc1_ctl

Instead of declaring a single DCE unit with two DSC blocks, we declare 
two distinct DSC blocks. This raises a question, how independent are 
these two parts of a single DCE block? For example, can we use them to 
perform compression with different parameters? Or use one of them for 
the DP DSC and another one for DSI DSC? Can we have the following 
configuration:

DSC_0 => DP DSC
DSC_1, DSC_2 => DSI DSC in DSC_MERGE topology?

> 
>>
>>> +    DSC_BLK_1_2("dsc_1", DSC_2, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), sm8550_dsc_sblk_0),
>>> +    DSC_BLK_1_2("dsc_1", DSC_3, 0x81000, 0x100, 
>>> BIT(DPU_DSC_NATIVE_422_EN), sm8550_dsc_sblk_1),
>>> +};
>>> +
>>>   static const struct dpu_intf_cfg sm8550_intf[] = {
>>>       INTF_BLK("intf_0", INTF_0, 0x34000, 0x280, INTF_DP, 
>>> MSM_DP_CONTROLLER_0, 24, INTF_SC7280_MASK, MDP_SSPP_TOP0_INTR, 24, 25),
>>>       /* TODO TE sub-blocks for intf1 & intf2 */
>>> @@ -218,6 +235,8 @@ const struct dpu_mdss_cfg dpu_sm8550_cfg = {
>>>       .dspp = sm8550_dspp,
>>>       .pingpong_count = ARRAY_SIZE(sm8550_pp),
>>>       .pingpong = sm8550_pp,
>>> +    .dsc = sm8550_dsc,
>>> +    .dsc_count = ARRAY_SIZE(sm8550_dsc),
>>>       .merge_3d_count = ARRAY_SIZE(sm8550_merge_3d),
>>>       .merge_3d = sm8550_merge_3d,
>>>       .intf_count = ARRAY_SIZE(sm8550_intf),
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> index 03f162a..be08158 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
>>> @@ -1,6 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   /* Copyright (c) 2015-2018, The Linux Foundation. All rights reserved.
>>> - * Copyright (c) 2022. Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>> + * Copyright (c) 2022-2023, Qualcomm Innovation Center, Inc. All 
>>> rights reserved.
>>>    */
>>>     #define pr_fmt(fmt)    "[drm:%s:%d] " fmt, __func__, __LINE__
>>> @@ -540,7 +540,15 @@ static const struct dpu_pingpong_sub_blks 
>>> sc7280_pp_sblk = {
>>>       {\
>>>       .name = _name, .id = _id, \
>>>       .base = _base, .len = 0x140, \
>>> -    .features = _features, \
>>> +    .features = BIT(DPU_DSC_HW_REV_1_1) | _features, \
>>> +    }
>>> +
>>> +#define DSC_BLK_1_2(_name, _id, _base, _len, _features, _sblk) \
>>> +    {\
>>> +    .name = _name, .id = _id, \
>>> +    .base = _base, .len = _len, \
>>> +    .features = BIT(DPU_DSC_HW_REV_1_2) | _features, \
>>> +    .sblk = &_sblk, \
>>>       }
>>> /*************************************************************
>>

-- 
With best wishes
Dmitry

