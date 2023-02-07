Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3FBE168DF67
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Feb 2023 18:52:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232392AbjBGRwa (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Feb 2023 12:52:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232397AbjBGRwL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Feb 2023 12:52:11 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88A80A5CA
        for <linux-arm-msm@vger.kernel.org>; Tue,  7 Feb 2023 09:51:48 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id qw12so44699710ejc.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 07 Feb 2023 09:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YJLohgBBelS1kaNNmWKRDdSV+9WDB1MthdEHDQiW00o=;
        b=mhiJZRuQ+hdD2O69brE7nmsjknfYZ4chVoOoXwBq8jhyHrBCrwwCGrjesI7xp2eBuH
         mqgtdyaMhgWvEJog6lTbdmIN4KIOwaH38CRUx71CE1poeT9qrJxvLdfpecXzzpvPo4t3
         6CeiZrMSP+2+GTKK6yVJ1LjHLNkPbs7TNVG/brTPGsT0nqEfzLrDKopK6fS0aFmAJxpJ
         9DHNY0h9vnBndDVTyP0JqvWq7pIYcedfZD0wgUfn3pm9TrM2s2Al1FR09wLookXGdBjE
         SU8OXJSCiyVgQzPGTX9sq4ZR54j5C0laxr64S4PWWDbGHlsXwcMJ8vGurkRkjWnqzk0r
         t0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YJLohgBBelS1kaNNmWKRDdSV+9WDB1MthdEHDQiW00o=;
        b=6HXH1PyzlzNdiZQ64P08lAIrsY3nDj/k4nxbf7Lsny5Dh1fymuLJRBGK5TqVDnhvA7
         ErdnC121YHUBHu8YQn+qW+geIr0FoFtO9UKRVpKzr/sY/f/MlSh+FyIHHOGQkB8BcRgE
         nRPAg8Q1W5x7OeBBJOB3cL6KUO8Yd2wwtFVFlnUrLh0zhBaHGtWKJhGWIfmp5k2LIEGy
         F6debrfiGrgHKBgtEWczivhrnAO88Fe7jGlCXRnRHGf1Zc2YolCAm1eA2zsuHMdPXEXD
         SGQKmiq8tOX4UUFN+UyO0r+AhCBc1B+OrgMPfp6bnhTYX9Fjlere9K1dcCzUD98C/mLp
         rZPA==
X-Gm-Message-State: AO0yUKUv4i4RVyfU2TBg/dYEUPYMMjAWUwbMhs35w+Un7TsP0BkoTNUd
        +Wvf+zKP5StNE2k6A33IyQafNArkNRQTcv6K
X-Google-Smtp-Source: AK7set+OgG+hF0Nl3LjR/rT3qQ3ARctaUFKp1f0bbC3iPZ3P4C0oLTAxivF39/PO833ejPKymx50xg==
X-Received: by 2002:a17:906:2da9:b0:878:5bce:291a with SMTP id g9-20020a1709062da900b008785bce291amr4809533eji.36.1675792306544;
        Tue, 07 Feb 2023 09:51:46 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id uz12-20020a170907118c00b0084cb4d37b8csm7223659ejb.141.2023.02.07.09.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 09:51:46 -0800 (PST)
Message-ID: <fd2e4474-3ecb-91e1-d702-0b2dbb77f458@linaro.org>
Date:   Tue, 7 Feb 2023 19:51:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 23/27] drm/msm/dpu: rework dpu_plane_atomic_check()
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
 <20230203182132.1307834-24-dmitry.baryshkov@linaro.org>
 <04ab8d1e-d343-2d6c-c211-2cf0ffc713c2@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <04ab8d1e-d343-2d6c-c211-2cf0ffc713c2@quicinc.com>
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

On 07/02/2023 19:49, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Split pipe-dependent code from dpu_plane_atomic_check() into the
>> separate function dpu_plane_atomic_check_pipe(). This is one of
> 
> Same comment as prev patch, dpu_plane_atomic_check_pipe() ---> 
> dpu_plane_atomic_check_sspp()

No, it does what it does: it checks one software pipe configuration.

> 
>> preparational steps to add r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 88 ++++++++++++++---------
>>   1 file changed, 53 insertions(+), 35 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index f94e132733f3..e69499490d39 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -903,6 +903,51 @@ static int dpu_plane_check_inline_rotation(struct 
>> dpu_plane *pdpu,
>>       return 0;
>>   }
>> +static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>> +        struct dpu_sw_pipe *pipe,
>> +        struct dpu_hw_sspp_cfg *pipe_cfg,
> 
> pipe_cfg --> sspp_cfg
> 
> Also, had a question. For function parameters spreading across multiple 
> lines do we want to align to one guideline? Is it going to be two tabs 
> more than the prev line or aligning it with the opening brace of prev line?
> 
> I am seeing a mix in the prev patch of the series and this one.

I usually tend to keep the existing indent when adding new args and 
shifting to open brace when adding new functions. Maybe I failed a 
question in this patch, I'll doublecheck it.

> 
>> +        const struct dpu_format *fmt)
>> +{
>> +    uint32_t min_src_size;
>> +
>> +    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>> +
>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>> +        (!(pipe->sspp->cap->features & DPU_SSPP_SCALER) ||
>> +         !(pipe->sspp->cap->features & DPU_SSPP_CSC_ANY))) {
>> +        DPU_DEBUG_PLANE(pdpu,
>> +                "plane doesn't have scaler/csc for yuv\n");
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* check src bounds */
>> +    if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>> +           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>> +        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>> +        return -E2BIG;
>> +    }
>> +
>> +    /* valid yuv image */
>> +    if (DPU_FORMAT_IS_YUV(fmt) &&
>> +           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 
>> 0x1 ||
>> +            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>> +            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>> +        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
>> +                DRM_RECT_ARG(&pipe_cfg->src_rect));
>> +        return -EINVAL;
>> +    }
>> +
>> +    /* min dst support */
>> +    if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>> +        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
>> +                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>> +        return -EINVAL;
>> +    }
>> +
>> +    return 0;
>> +}
>> +
>>   static int dpu_plane_atomic_check(struct drm_plane *plane,
>>                     struct drm_atomic_state *state)
>>   {
>> @@ -915,7 +960,7 @@ static int dpu_plane_atomic_check(struct drm_plane 
>> *plane,
>>       const struct dpu_format *fmt;
>>       struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>>       struct drm_rect fb_rect = { 0 };
>> -    uint32_t min_src_size, max_linewidth;
>> +    uint32_t max_linewidth;
>>       unsigned int rotation;
>>       uint32_t supported_rotations;
>>       const struct dpu_sspp_cfg *pipe_hw_caps = pstate->pipe.sspp->cap;
>> @@ -970,46 +1015,19 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> -
>> -    min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>> -
>> -    if (DPU_FORMAT_IS_YUV(fmt) &&
>> -        (!(pipe_hw_caps->features & DPU_SSPP_SCALER) ||
>> -         !(pipe_hw_caps->features & DPU_SSPP_CSC_ANY))) {
>> -        DPU_DEBUG_PLANE(pdpu,
>> -                "plane doesn't have scaler/csc for yuv\n");
>> -        return -EINVAL;
>> -
>> -    /* check src bounds */
>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) < min_src_size ||
>> -           drm_rect_height(&pipe_cfg->src_rect) < min_src_size) {
>> -        DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>> -        return -E2BIG;
>> -
>> -    /* valid yuv image */
>> -    } else if (DPU_FORMAT_IS_YUV(fmt) &&
>> -           (pipe_cfg->src_rect.x1 & 0x1 || pipe_cfg->src_rect.y1 & 
>> 0x1 ||
>> -            drm_rect_width(&pipe_cfg->src_rect) & 0x1 ||
>> -            drm_rect_height(&pipe_cfg->src_rect) & 0x1)) {
>> -        DPU_DEBUG_PLANE(pdpu, "invalid yuv source " DRM_RECT_FMT "\n",
>> -                DRM_RECT_ARG(&pipe_cfg->src_rect));
>> -        return -EINVAL;
>> -
>> -    /* min dst support */
>> -    } else if (drm_rect_width(&pipe_cfg->dst_rect) < 0x1 || 
>> drm_rect_height(&pipe_cfg->dst_rect) < 0x1) {
>> -        DPU_DEBUG_PLANE(pdpu, "invalid dest rect " DRM_RECT_FMT "\n",
>> -                DRM_RECT_ARG(&pipe_cfg->dst_rect));
>> -        return -EINVAL;
>> -
>>       /* check decimated source width */
>> -    } else if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>> +    if (drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) {
>>           DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
>>                   DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
>>           return -E2BIG;
>>       }
>> +    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +
>> +    ret = dpu_plane_atomic_check_pipe(pdpu, &pstate->pipe, pipe_cfg, 
>> fmt);
>> +    if (ret)
>> +        return ret;
>> +
>>       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
>>       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))

-- 
With best wishes
Dmitry

