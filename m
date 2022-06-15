Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 19E1D54CE70
	for <lists+linux-arm-msm@lfdr.de>; Wed, 15 Jun 2022 18:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348775AbiFOQTW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 15 Jun 2022 12:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356403AbiFOQSf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 15 Jun 2022 12:18:35 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A8FDF4BFFF
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 09:17:12 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id a2so19705453lfg.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 15 Jun 2022 09:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=enqTj8G+JMLqJtg3eWd64lmGi1ztkOy37oPU+WBetZA=;
        b=v3SIyID1s3Pb2lnxi6rKrA98EqNfi95RGGgE+/eukh3tZnjcaZ7EHIGpFRbItYTAge
         iFpQE/OuPj+2sBvHVK2yuopP5Um6g4DG/pow8mMMGVRMZGz1Aa1uUAaoj8rhz3R9J/jL
         XtKr/YgNxxaYzj3YBGqesU3jKBwmTy4UAdCbPbYA8fpB87VgvoJClhJ3Qk6yLD8CZjwC
         PQvy+LR4im0cY6VJIDhvK1rTuVI2YdyVR2cLyxLNnuaKdaDbNa2MluM3fQrjqv0JVl/A
         5FddA4nTEw1BlWxxwK5+LspgO14sLmdSAgW6RbtQ++YowtDko29mo5oXl1JaR4jfjIYr
         T04Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=enqTj8G+JMLqJtg3eWd64lmGi1ztkOy37oPU+WBetZA=;
        b=JE9UUgUEMOiEUG+lkgEOk2mv0vjfJ4L8c1abwlmaLPKbPCJRzDA+FdHpVcCD1bsMsX
         oyv073NJQvb49oksgjwZmUyBjZyta7vnlk6m03eNrwS1cZ0zFtDb0B1o4wvhQND6wRM+
         cBh3Zbv4zyjhgcbBhcNdoq41qMlp6te4MFjpYPQIxUUDaxJqcbv6t5WY6FAnQcOQFQgh
         Y0kBosHSEohxCNKExmgvegUQiT4WZ2S5/jS4rKq0y78NNu4lpwtIycbLMkcpKy69Qumw
         ErTwHSlQf9gXLpgCwCIy9rOly1xdRJlRnNOTCP/GAiltt/LN9Uo+MVl0MPu8Ica3ktw6
         nYcA==
X-Gm-Message-State: AJIora/UeR+Q0IfToaGASqQ14nhFaP2t5NtMcR9NS4vl8uLiuz+qGSSw
        RXjhB7/A5e80iIFrwyPrqbAe/A==
X-Google-Smtp-Source: AGRyM1tDymQ2nSjUAUxrkEoOVXS2qLQxpubfiaMB8C34JUBpYCnl8JYWa9TFNWiAUPeHJyYmcQ5sPg==
X-Received: by 2002:a19:4316:0:b0:479:ed75:5c1f with SMTP id q22-20020a194316000000b00479ed755c1fmr158029lfa.253.1655309830906;
        Wed, 15 Jun 2022 09:17:10 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id o16-20020ac24bd0000000b0047255d211bfsm1849298lfq.238.2022.06.15.09.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Jun 2022 09:17:10 -0700 (PDT)
Message-ID: <d91600b6-c9a6-bdae-e5c3-38a6b1133883@linaro.org>
Date:   Wed, 15 Jun 2022 19:17:09 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 1/3] drm/msm/dpu: Move LM CRC code into separate method
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>
Cc:     freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        seanpaul@chromium.org, swboyd@chromium.org,
        quic_aravindh@quicinc.com, quic_abhinavk@quicinc.com
References: <20220614211328.216-1-quic_jesszhan@quicinc.com>
 <20220614211328.216-2-quic_jesszhan@quicinc.com>
 <CAA8EJppgyuzHipZT1SVyD5+NNnC2yB5hRy4=--DGv=dk1VRMAw@mail.gmail.com>
 <7489a181-f87f-5187-6fae-3ad5b74c2d2c@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7489a181-f87f-5187-6fae-3ad5b74c2d2c@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 15/06/2022 19:11, Jessica Zhang wrote:
> On 6/15/2022 2:35 AM, Dmitry Baryshkov wrote:
>> On Wed, 15 Jun 2022 at 00:13, Jessica Zhang 
>> <quic_jesszhan@quicinc.com> wrote:
>>>
>>> Move layer mixer-specific section of dpu_crtc_get_crc() into a separate
>>> helper method. This way, we can make it easier to get CRCs from other HW
>>> blocks by adding other get_crc helper methods.
>>>
>>> Changes since V1:
>>> - Moved common bitmasks to dpu_hw_util.h
>>> - Moved common CRC methods to dpu_hw_util.c
>>> - Updated copyrights
>>> - Changed crcs array to a dynamically allocated array and added it as a
>>>    member of crtc_state
>>>
>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>
>> Please split this into separate patches. One for hw_util, one for the 
>> rest
> 
> Sure
> 
>>
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 88 +++++++++++++--------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |  4 +
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c   | 42 +---------
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c | 46 ++++++++++-
>>>   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h | 16 ++++
>>>   5 files changed, 124 insertions(+), 72 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> index b56f777dbd0e..16742a66878e 100644
>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>> @@ -1,5 +1,6 @@
>>>   // SPDX-License-Identifier: GPL-2.0-only
>>>   /*
>>> + * Copyright (c) 2022 Qualcomm Innovation Center, Inc. All rights 
>>> reserved.
>>>    * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>>>    * Copyright (C) 2013 Red Hat
>>>    * Author: Rob Clark <robdclark@gmail.com>
>>> @@ -88,6 +89,11 @@ static int dpu_crtc_verify_crc_source(struct 
>>> drm_crtc *crtc,
>>>          enum dpu_crtc_crc_source source = 
>>> dpu_crtc_parse_crc_source(src_name);
>>>          struct dpu_crtc_state *crtc_state = 
>>> to_dpu_crtc_state(crtc->state);
>>>
>>> +       if (crtc_state->crcs) {
>>> +               kfree(crtc_state->crcs);
>>> +               crtc_state->crcs = NULL;
>>> +       }
>>> +
>>>          if (source < 0) {
>>>                  DRM_DEBUG_DRIVER("Invalid source %s for CRTC%d\n", 
>>> src_name, crtc->index);
>>>                  return -EINVAL;
>>> @@ -96,20 +102,37 @@ static int dpu_crtc_verify_crc_source(struct 
>>> drm_crtc *crtc,
>>>          if (source == DPU_CRTC_CRC_SOURCE_LAYER_MIXER)
>>>                  *values_cnt = crtc_state->num_mixers;
>>>
>>> +       crtc_state->crcs = kcalloc(*values_cnt, 
>>> sizeof(crtc_state->crcs), GFP_KERNEL);
>>> +
>>
>> I do not quite like the idea of constantly allocating and freeing the
>> crcs array. I'd suggest defining sensible MAX_CRC_VALUES, using a
>> static array and verifying that no one over commits the
>> MAX_CRC_VALUES.
>> If at some point we decide that we really need the dynamic array, we
>> can implement it later. We already had dynamic arrays and Rob had to
>> fix it. See 00326bfa4e63 ("drm/msm/dpu: Remove dynamic allocation from
>> atomic context").
> 
> Ah, got it... the reason I used a dynamic array here was because AFAIK 
> we don't have a defined upper limit for how many drm_encoders can be 
> connected to a CRTC simultaneously. Do you have a suggestion on what 
> value we can set for MAX_CRC_VALUES?

Three? Two for two hw_intfs?


-- 
With best wishes
Dmitry
