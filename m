Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E783E68FC35
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 01:53:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229703AbjBIAxn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 19:53:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229640AbjBIAxm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 19:53:42 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA2EF11643
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 16:53:40 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id gr7so1983705ejb.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 16:53:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sOyW9LAmTtWfl/yC7dD/NiWL3342cTdBhfReCFAVF6Q=;
        b=Kmv+QfRel4zco2DGL1LmeOF/d2xfQGpEPh5HbWKgV7XFX7kHj8aeU/gabSsqozGp9+
         ehuLIwObSe9s9nM7N/oSY2moMzEC/fjBenpse3DAepO3ptOJA0qFTLKci4Uc7n2mFTSG
         DZtxRktss2vY0qveJz0r+8+qDG/Ngws8quBqJYE9KkRUMCrB3YYsMu8CHrxnP7Q2EbHk
         CW7eLINEQZ+FtdMRgxcilpD52lR5/LDTjdespyCMBPadHvXWeMaILgQ9x6d2slNZduN6
         bYGnSTaqAukSY/aumXX2pJzb/A39V4hwswqsMqHvBhjT3YGhazpUng/jU09Ky10R5KTB
         GwaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sOyW9LAmTtWfl/yC7dD/NiWL3342cTdBhfReCFAVF6Q=;
        b=q7/cGCcvLwzVfPU5oJvu6xV4bdto1LeJH4TfggeMTu5ufpZX86v7J66cPKd1XUj52W
         PSkfRok89MsMBBppgTk5ai7ew40CYLftpMqhLg7MLx9ybsCBZ8rErYr4Kl8uVaS+BFYX
         kiQHX1ERMHql8CpWZxbyFDm8k2K0lEL/mt1wjxP1xzoeCBv/QaXS0XQZhnad5lFDkieT
         5YAn3/9i1HhEGx94zrvm+c6sp7qPqMIdtmFtxZuN28IehJFUVGcFdq8XcXWB6GV7V9G2
         eTaIxlmYb4g4P8BssqTnHJPUuFgBLoWBK3ucq1ZBrj/+gCjnoM5uX74+dnoFk5MPGQiM
         A7KA==
X-Gm-Message-State: AO0yUKWOBqpjRYv0UUz2LncjB0sy/MEWjq8poL2ENRZx2zT3zBpExzDH
        1jmv7cnJBPI8rk7yjp83d/Xo0Bnp8OfZnW2m
X-Google-Smtp-Source: AK7set+Z3QH7Oudl+1KTTYPN7nTS/82k8Ds/lfTAqYGaBkA6rDfIsxLJp3lTszEKepkgxZUmzte57g==
X-Received: by 2002:a17:906:b888:b0:881:efcd:1bc4 with SMTP id hb8-20020a170906b88800b00881efcd1bc4mr10277026ejb.46.1675904019375;
        Wed, 08 Feb 2023 16:53:39 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id g3-20020a170906868300b0087879f8c65asm155350ejx.89.2023.02.08.16.53.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 16:53:38 -0800 (PST)
Message-ID: <5e64d17b-c592-74a4-1609-239e4de22b2b@linaro.org>
Date:   Thu, 9 Feb 2023 02:53:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 25/27] drm/msm/dpu: rework static color fill code
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
 <20230203182132.1307834-26-dmitry.baryshkov@linaro.org>
 <ef6b0227-1ac9-331e-1c8e-beb6ce8a0aff@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <ef6b0227-1ac9-331e-1c8e-beb6ce8a0aff@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 09/02/2023 00:34, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Rework static color fill code to separate the pipe / pipe_cfg handling.
>> This is a preparation for the r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 70 +++++++++++++----------
>>   1 file changed, 41 insertions(+), 29 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 05047192cb37..e2e85688ed3c 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -639,20 +639,54 @@ static void _dpu_plane_setup_scaler(struct 
>> dpu_sw_pipe *pipe,
>>                   fmt);
>>   }
>> +static int _dpu_plane_color_fill_pipe(struct dpu_plane_state *pstate,
>> +        struct dpu_sw_pipe *pipe,
>> +        struct dpu_hw_sspp_cfg *old_pipe_cfg,
> 
> Why is this called old_pipe_cfg instead of just pipe_cfg?

Ack. Probably got that wrong during mass-renaming and then missed to fix it.

> 
> 
>> +        u32 fill_color,
>> +        const struct dpu_format *fmt)
>> +{
>> +    struct dpu_hw_sspp_cfg pipe_cfg;
>> +
>> +    /* update sspp */
>> +    if (!pipe->sspp->ops.setup_solidfill)
>> +        return 0;
> 
> You can just return from here and make this function void?

Of course.

> 
>> +
>> +    pipe->sspp->ops.setup_solidfill(pipe, fill_color);
>> +
>> +    /* override scaler/decimation if solid fill */
>> +    pipe_cfg.dst_rect = old_pipe_cfg->dst_rect;
>> +
>> +    pipe_cfg.src_rect.x1 = 0;
>> +    pipe_cfg.src_rect.y1 = 0;
>> +    pipe_cfg.src_rect.x2 =
>> +        drm_rect_width(&pipe_cfg.dst_rect);
>> +    pipe_cfg.src_rect.y2 =
>> +        drm_rect_height(&pipe_cfg.dst_rect);
>> +
>> +    if (pipe->sspp->ops.setup_format)
>> +        pipe->sspp->ops.setup_format(pipe, fmt, DPU_SSPP_SOLID_FILL);
>> +
>> +    if (pipe->sspp->ops.setup_rects)
>> +        pipe->sspp->ops.setup_rects(pipe, &pipe_cfg);
>> +
>> +    _dpu_plane_setup_scaler(pipe, fmt, true, &pipe_cfg, 
>> pstate->rotation);
>> +
>> +    return 0;
>> +}
>> +
>>   /**
>>    * _dpu_plane_color_fill - enables color fill on plane
>>    * @pdpu:   Pointer to DPU plane object
>>    * @color:  RGB fill color value, [23..16] Blue, [15..8] Green, 
>> [7..0] Red
>>    * @alpha:  8-bit fill alpha value, 255 selects 100% alpha
>> - * Returns: 0 on success
>>    */
>> -static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>> +static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>>           uint32_t color, uint32_t alpha)
>>   {
>>       const struct dpu_format *fmt;
>>       const struct drm_plane *plane = &pdpu->base;
>>       struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>> -    struct dpu_hw_sspp_cfg pipe_cfg;
>> +    u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
>>       DPU_DEBUG_PLANE(pdpu, "\n");
>> @@ -661,34 +695,12 @@ static int _dpu_plane_color_fill(struct 
>> dpu_plane *pdpu,
>>        * h/w only supports RGB variants
>>        */
>>       fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>> +    /* should not happen ever */
>> +    if (!fmt)
>> +        return;
>>       /* update sspp */
>> -    if (fmt && pstate->pipe.sspp->ops.setup_solidfill) {
>> -        pstate->pipe.sspp->ops.setup_solidfill(&pstate->pipe,
>> -                (color & 0xFFFFFF) | ((alpha & 0xFF) << 24));
>> -
>> -        /* override scaler/decimation if solid fill */
>> -        pipe_cfg.dst_rect = pstate->base.dst;
>> -
>> -        pipe_cfg.src_rect.x1 = 0;
>> -        pipe_cfg.src_rect.y1 = 0;
>> -        pipe_cfg.src_rect.x2 =
>> -            drm_rect_width(&pipe_cfg.dst_rect);
>> -        pipe_cfg.src_rect.y2 =
>> -            drm_rect_height(&pipe_cfg.dst_rect);
>> -
>> -        if (pstate->pipe.sspp->ops.setup_format)
>> -            pstate->pipe.sspp->ops.setup_format(&pstate->pipe,
>> -                    fmt, DPU_SSPP_SOLID_FILL);
>> -
>> -        if (pstate->pipe.sspp->ops.setup_rects)
>> -            pstate->pipe.sspp->ops.setup_rects(&pstate->pipe,
>> -                    &pipe_cfg);
>> -
>> -        _dpu_plane_setup_scaler(&pstate->pipe, fmt, true, &pipe_cfg, 
>> pstate->rotation);
>> -    }
>> -
>> -    return 0;
>> +    _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, 
>> &pstate->pipe_cfg, fill_color, fmt);
>>   }
>>   int dpu_plane_validate_multirect_v2(struct 
>> dpu_multirect_plane_states *plane)

-- 
With best wishes
Dmitry

