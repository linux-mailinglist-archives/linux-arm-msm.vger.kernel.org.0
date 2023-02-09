Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9B7AD690807
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 12:57:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230453AbjBIL5z (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 9 Feb 2023 06:57:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229527AbjBIL4R (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 9 Feb 2023 06:56:17 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8107A5DC22
        for <linux-arm-msm@vger.kernel.org>; Thu,  9 Feb 2023 03:46:35 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id h3so1881956eda.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Feb 2023 03:46:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9Stjp+OIj5o2DivNhN/G2i5CLCtz9VbTmZkRF6z8lM0=;
        b=f+1pEiZESR4n4uEmvoRwPCrQ3lL7JBFEyyc38LD3APw30rOivWPxSByQxmLIhjLN/8
         WzFW5bneNMwj45Xy4dlNiyzCTq9xQKca3TtgJiUTOSq/zfiYg6FPISrJm6O4XZ/oCjA5
         jfuMjabXuppSTyFxUuLVftrTvevWfaT9JDqrLB7Mj11vir7LFGfWiLaCKNvwSgjoG5g4
         PryTLJJxcoBi8lOpXEo1Uwe20peAorPBx7mT7Dll+cwc25G62BFEffz/UJCUDjIri8+x
         UEOox9VjRuWKRReVoOOXcaFeNAazJ31S5i/64oWwHoDJdattBna0feLGn9a7CmlHT0z0
         2+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9Stjp+OIj5o2DivNhN/G2i5CLCtz9VbTmZkRF6z8lM0=;
        b=WpoORt08dJSQB94CAkaP3Cwk4velkFoQi3psCtlAWnhKOea0WpJEiWvx0JwrwVzQ81
         4zDdgvRggsLVJnJdqUoPuelqngmJkCZqOkwNgLL8oaBFohV+uPqWGm3q90yucum9g18J
         ALT6+NCD4S5TlHUM6E4yAsNzUu1o8vCUmp8yGmGkvjAyUUD+reWMxZP9wJhW8WyHH8fi
         9pTNiQNOs4Im4nSbW/W/XyappAYCe7emz4lmu99w29S6GuKtx2a/raXu6P/tz3vjQ+mL
         ThGDZgrSYfP8gxbWODUSIlULSIIVwKEDrfq87tHQ999v1BPJOKs19bcQ2bIj++2uPoUt
         PlOA==
X-Gm-Message-State: AO0yUKXQdfIsYhy2rnOVkJT48YRsazNdMEPCy0aghMSThjGyDAFlXuTM
        nrN2G0mjH3vRZiXIQyemL6/BRg==
X-Google-Smtp-Source: AK7set8C6I3HhwH5lf4dzecZFkxWy6hAFfaKmq34a5m/Z70X8YpgrzHMEPYIbP63Jf4WWfpRtn1Ydw==
X-Received: by 2002:a50:f697:0:b0:4a2:7579:1d9c with SMTP id d23-20020a50f697000000b004a275791d9cmr12222407edn.1.1675943194018;
        Thu, 09 Feb 2023 03:46:34 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id i8-20020a508708000000b004ab104b3bc6sm661734edb.55.2023.02.09.03.46.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Feb 2023 03:46:33 -0800 (PST)
Message-ID: <81e84d97-2cb4-56d1-04a8-86ec1898a63b@linaro.org>
Date:   Thu, 9 Feb 2023 13:46:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 22/27] drm/msm/dpu: rework
 dpu_plane_sspp_atomic_update()
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
 <20230203182132.1307834-23-dmitry.baryshkov@linaro.org>
 <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <7132b394-2e6a-20c8-fa64-3da082060226@quicinc.com>
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

On 07/02/2023 02:22, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Split pipe-dependent code from dpu_plane_sspp_atomic_update() into the
> 
> sspp-dependent?
> 
>> separate function dpu_plane_sspp_update_pipe(). This is one of
>> preparational steps to add r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> Just a couple of minor comments below but otherwise this split up lgtm
> 
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 113 ++++++++++++----------
>>   1 file changed, 63 insertions(+), 50 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 0986e740b978..f94e132733f3 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -404,12 +404,13 @@ static void _dpu_plane_set_qos_ctrl(struct 
>> drm_plane *plane,
>>    * _dpu_plane_set_ot_limit - set OT limit for the given plane
>>    * @plane:        Pointer to drm plane
>>    * @pipe:        Pointer to software pipe
>> - * @crtc:        Pointer to drm crtc
>>    * @pipe_cfg:        Pointer to pipe configuration
>> + * @frame_rate:        CRTC's frame rate
> 
> Can you please check the spacing here. There seems to be an extra tab 
> before the CRTC's frame rate

I checked, the ident is correct here. It uses tabs, maybe that confuses 
your mailer.

> 
>>    */
>>   static void _dpu_plane_set_ot_limit(struct drm_plane *plane,
>>           struct dpu_sw_pipe *pipe,
>> -        struct drm_crtc *crtc, struct dpu_hw_sspp_cfg *pipe_cfg)
>> +        struct dpu_hw_sspp_cfg *pipe_cfg,
>> +        int frame_rate)
>>   {
>>       struct dpu_plane *pdpu = to_dpu_plane(plane);
>>       struct dpu_vbif_set_ot_params ot_params;
>> @@ -421,7 +422,7 @@ static void _dpu_plane_set_ot_limit(struct 
>> drm_plane *plane,
>>       ot_params.width = drm_rect_width(&pipe_cfg->src_rect);
>>       ot_params.height = drm_rect_height(&pipe_cfg->src_rect);
>>       ot_params.is_wfd = !pdpu->is_rt_pipe;
>> -    ot_params.frame_rate = drm_mode_vrefresh(&crtc->mode);
>> +    ot_params.frame_rate = frame_rate;
>>       ot_params.vbif_idx = VBIF_RT;
>>       ot_params.clk_ctrl = pipe->sspp->cap->clk_ctrl;
>>       ot_params.rd = true;
>> @@ -457,26 +458,6 @@ static void _dpu_plane_set_qos_remap(struct 
>> drm_plane *plane,
>>       dpu_vbif_set_qos_remap(dpu_kms, &qos_params);
>>   }
>> -static void _dpu_plane_set_scanout(struct drm_plane *plane,
>> -        struct dpu_plane_state *pstate,
>> -        struct drm_framebuffer *fb)
>> -{
>> -    struct dpu_plane *pdpu = to_dpu_plane(plane);
>> -    struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>> -    struct msm_gem_address_space *aspace = kms->base.aspace;
>> -    struct dpu_hw_fmt_layout layout;
>> -    int ret;
>> -
>> -    ret = dpu_format_populate_layout(aspace, fb, &layout);
>> -    if (ret)
>> -        DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>> -    else if (pstate->pipe.sspp->ops.setup_sourceaddress) {
>> -        trace_dpu_plane_set_scanout(&pstate->pipe,
>> -                        &layout);
>> -        pstate->pipe.sspp->ops.setup_sourceaddress(&pstate->pipe, 
>> &layout);
>> -    }
>> -}
>> -
>>   static void _dpu_plane_setup_scaler3(struct dpu_hw_sspp *pipe_hw,
>>           uint32_t src_w, uint32_t src_h, uint32_t dst_w, uint32_t dst_h,
>>           struct dpu_hw_scaler3_cfg *scale_cfg,
>> @@ -1102,35 +1083,25 @@ void dpu_plane_set_error(struct drm_plane 
>> *plane, bool error)
>>       pdpu->is_error = error;
>>   }
>> -static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>> +static void dpu_plane_sspp_update_pipe(struct drm_plane *plane,
>> +                       struct dpu_sw_pipe *pipe,
>> +                       struct dpu_hw_sspp_cfg *pipe_cfg,
> 
> You can call this parameter sspp_cfg instead of pipe_cfg?
> 
>> +                       const struct dpu_format *fmt,
>> +                       int frame_rate,
>> +                       struct dpu_hw_fmt_layout *layout)
>>   {
>>       uint32_t src_flags;
>>       struct dpu_plane *pdpu = to_dpu_plane(plane);
>>       struct drm_plane_state *state = plane->state;
>>       struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>> -    struct dpu_sw_pipe *pipe = &pstate->pipe;
>> -    struct drm_crtc *crtc = state->crtc;
>> -    struct drm_framebuffer *fb = state->fb;
>> -    bool is_rt_pipe;
>> -    const struct dpu_format *fmt =
>> -        to_dpu_format(msm_framebuffer_format(fb));
>> -    struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>> -    _dpu_plane_set_scanout(plane, pstate, fb);
>> -
>> -    pstate->pending = true;
>> -
>> -    is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>> -    pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
>> -    pdpu->is_rt_pipe = is_rt_pipe;
>> +    if (layout && pipe->sspp->ops.setup_sourceaddress) {
>> +        trace_dpu_plane_set_scanout(pipe, layout);
>> +        pipe->sspp->ops.setup_sourceaddress(pipe, layout);
>> +    }
>>       _dpu_plane_set_qos_ctrl(plane, pipe, false, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>> -    DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> -            ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> -            crtc->base.id, DRM_RECT_ARG(&state->dst),
>> -            (char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>> -
>>       /* override for color fill */
>>       if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>>           /* skip remaining processing on color fill */
>> @@ -1183,22 +1154,64 @@ static void 
>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>           }
>>       }
>> -    _dpu_plane_set_qos_lut(plane, pipe, fmt, &pstate->pipe_cfg);
>> +    _dpu_plane_set_qos_lut(plane, pipe, fmt, pipe_cfg);
>>       _dpu_plane_set_danger_lut(plane, pipe, fmt);
>>       if (plane->type != DRM_PLANE_TYPE_CURSOR) {
>>           _dpu_plane_set_qos_ctrl(plane, pipe, true, 
>> DPU_PLANE_QOS_PANIC_CTRL);
>> -        _dpu_plane_set_ot_limit(plane, pipe, crtc, &pstate->pipe_cfg);
>> +        _dpu_plane_set_ot_limit(plane, pipe, pipe_cfg, frame_rate);
>>       }
>> -    if (pstate->needs_qos_remap) {
>> -        pstate->needs_qos_remap = false;
>> +    if (pstate->needs_qos_remap)
>>           _dpu_plane_set_qos_remap(plane, pipe);
>> -    }
>> +}
>> +
>> +static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>> +{
>> +    struct dpu_plane *pdpu = to_dpu_plane(plane);
>> +    struct drm_plane_state *state = plane->state;
>> +    struct dpu_plane_state *pstate = to_dpu_plane_state(state);
>> +    struct dpu_sw_pipe *pipe = &pstate->pipe;
>> +    struct drm_crtc *crtc = state->crtc;
>> +    struct drm_framebuffer *fb = state->fb;
>> +    bool is_rt_pipe;
>> +    const struct dpu_format *fmt =
>> +        to_dpu_format(msm_framebuffer_format(fb));
>> +    struct dpu_hw_sspp_cfg *pipe_cfg = &pstate->pipe_cfg;
>> +
>> +    struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>> +    struct msm_gem_address_space *aspace = kms->base.aspace;
>> +    struct dpu_hw_fmt_layout layout;
>> +    bool layout_valid = false;
>> +    int ret;
>> +
>> +    ret = dpu_format_populate_layout(aspace, fb, &layout);
>> +    if (ret)
>> +        DPU_ERROR_PLANE(pdpu, "failed to get format layout, %d\n", ret);
>> +    else
>> +        layout_valid = true;
>> +
>> +    pstate->pending = true;
>> +
>> +    is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>> +    pstate->needs_qos_remap |= (is_rt_pipe != pdpu->is_rt_pipe);
>> +    pdpu->is_rt_pipe = is_rt_pipe;
>> +
>> +    DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> +            ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> +            crtc->base.id, DRM_RECT_ARG(&state->dst),
>> +            (char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>> +
>> +    dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
>> +                   drm_mode_vrefresh(&crtc->mode),
>> +                   layout_valid ? &layout: NULL);
>> +
>> +    if (pstate->needs_qos_remap)
>> +        pstate->needs_qos_remap = false;
>> -    pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, 
>> &crtc->mode, &pstate->pipe_cfg);
>> +    pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt, 
>> &crtc->mode, pipe_cfg);
>> -    pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, 
>> &pstate->pipe_cfg);
>> +    pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
>>   }
>>   static void _dpu_plane_atomic_disable(struct drm_plane *plane)

-- 
With best wishes
Dmitry

