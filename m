Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 185434B9516
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Feb 2022 01:40:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229832AbiBQAkV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Feb 2022 19:40:21 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:60910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbiBQAkU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Feb 2022 19:40:20 -0500
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5D67124C34
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 16:40:06 -0800 (PST)
Received: by mail-lj1-x236.google.com with SMTP id bn33so5893047ljb.6
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Feb 2022 16:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=irfOfdSIE9rR3XmORLk7Bf5d4a0WcfMYhHYf+s3tbSs=;
        b=AILDcMvPG9itOtC+CSIt/42wtECc07XURtltr7tN1l6iwwVFUcer9QlOidGe1bE6Oo
         lJ3mxg5ho54gQsy4Y/h37a+rnbQJbxMwwHw4jUe4/O069PV3zrcMlH0VyS+hnJCf0p/V
         URQ3OT2qwI+4bahYujfrfw5Vrmj2Zs8/ybeC+XbUjCDSXju+aZRbUbxsyKVEaPewEZnz
         3fJwD7K39V77Cc5eE+fYj1bxFEellkt8bIitHmWKG0BYzfcebAK5JXISaKBQhEC5kyl4
         LUQ47gj+LjKBylW4dOtUv3SufxPxUbos5KcWkY4qz17jlaQivgaVkUA8SAleUnizDbjX
         XZjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=irfOfdSIE9rR3XmORLk7Bf5d4a0WcfMYhHYf+s3tbSs=;
        b=Pay9nv31PhDG2nKvMCk69paWEthrewPR0BIGbX3AhSPa7kUK7uLs2WdVnVGJDFDiEY
         xBOyiZ9IenQCkT1rk0FTvpkKfuIGs2kklGUbhGgkF+Z51bT2fYk2tlWOGiMlJr9mQboZ
         ZGDLNvqMEHKaDMMuSpC7OuRUjNfMXZnAGyMqpIfagP8nO3a2ZCyjUjA5RVC1+fEf5nPe
         vhnUdFDnb6JEr/hWDLNXzJOOqtanG6RykfznVWmLz/MzK9S5vbLBreBsyoalEZakEMAn
         kKjiBXyHejxCf7+BJVaaRBJlYipr5JwLA6XgnBrNC3zNLUFWYxpnEGgKotbZ74WnWH3Y
         AUtg==
X-Gm-Message-State: AOAM532p72eRAXqs4LQpjSoKTQ6iFzLa33K8L9zOKq4g+aRB+C0+JzQP
        6QkmYWSv9kmtvwlc3+MxA7OwUeN0aAoPAA==
X-Google-Smtp-Source: ABdhPJzv0HhA2eC9Ca8TvfoEl3imb6op8FIsLTF5dy8X5bvs6IGsJDWqpBElKJJ5mKwrc8q714fGLg==
X-Received: by 2002:a2e:9c15:0:b0:23f:96fa:4b96 with SMTP id s21-20020a2e9c15000000b0023f96fa4b96mr426058lji.293.1645058404997;
        Wed, 16 Feb 2022 16:40:04 -0800 (PST)
Received: from [192.168.1.211] ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id l18sm4966807ljc.11.2022.02.16.16.40.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Feb 2022 16:40:04 -0800 (PST)
Message-ID: <8aeec164-836b-d964-3b40-fb0874612250@linaro.org>
Date:   Thu, 17 Feb 2022 03:40:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 3/3] drm/msm/dp: replace DRM_DEBUG_DP marco with
 drm_dbg_dp
Content-Language: en-GB
To:     Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        airlied@linux.ie, bjorn.andersson@linaro.org, daniel@ffwll.ch,
        dri-devel@lists.freedesktop.org, robdclark@gmail.com,
        sean@poorly.run, vkoul@kernel.org
Cc:     quic_abhinavk@quicinc.com, quic_aravindh@quicinc.com,
        quic_sbillaka@quicinc.com, freedreno@lists.freedesktop.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
 <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
 <CAE-0n534MH7ih4nKbjY5EewcZ0J73Zp_A=Q-CJ0M_z3nWoVaVQ@mail.gmail.com>
 <f480811d-3e82-a6c7-1e57-fabe51604f9b@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <f480811d-3e82-a6c7-1e57-fabe51604f9b@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 17/02/2022 03:22, Kuogee Hsieh wrote:
> 
> On 2/16/2022 3:46 PM, Stephen Boyd wrote:
>> Quoting Kuogee Hsieh (2022-02-02 10:56:39)
>>
>> Please add some commit text
>>
>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>> ---
>>>   drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++++------
>>>   drivers/gpu/drm/msm/dp/dp_catalog.c |  34 +++++++-----
>>>   drivers/gpu/drm/msm/dp/dp_ctrl.c    | 106 
>>> +++++++++++++++++++-----------------
>>>   drivers/gpu/drm/msm/dp/dp_display.c |  68 +++++++++++++----------
>>>   drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>>>   drivers/gpu/drm/msm/dp/dp_link.c    |  99 
>>> +++++++++++++++++++--------------
>>>   drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++++------
>>>   drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>>>   drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>>>   9 files changed, 246 insertions(+), 179 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c 
>>> b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> index d7e4a39..4fbbe0a 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
>>> @@ -136,7 +136,8 @@ static void dp_audio_stream_sdp(struct 
>>> dp_audio_private *audio)
>>>          parity_byte = dp_audio_calculate_parity(new_value);
>>>          value |= ((new_value << HEADER_BYTE_1_BIT)
>>>                          | (parity_byte << PARITY_BYTE_1_BIT));
>>> -       DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 
>>> 0x%x\n",
>>> +       drm_dbg_dp((struct drm_device *)NULL,
>> Why can't we pass the platform device pointer? Surely the cast is not
>> necessary and in fact harmful.
> 
> Platform device only available at top level (dp_display.c), other level 
> has no access to platform device or drm_device.

You can pass the platform device (or even better, drm device) to other 
driver blocks too. It's not something to be kept in secret in 
dp_display.c only.

> 
> I will just apss NULL, such as  drm_dbg_dp(NULL, ...), if not device 
> available.



-- 
With best wishes
Dmitry
