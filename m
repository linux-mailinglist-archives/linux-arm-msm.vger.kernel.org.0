Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0178A68FB7E
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Feb 2023 00:48:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229912AbjBHXsD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Feb 2023 18:48:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38434 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229675AbjBHXsC (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Feb 2023 18:48:02 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 472A11B1
        for <linux-arm-msm@vger.kernel.org>; Wed,  8 Feb 2023 15:48:00 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qw12so1688237ejc.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 08 Feb 2023 15:48:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UxUwN6bk2wtmwtOc4ROKIkFsdgxPdY69mdmGq/a0y/w=;
        b=AmA2hd6HsRXkolJjoLm0fPbvxpxWB7XNOmIVwawhIGgiFLpHL699f8EtlkBkcaLBxe
         OPjO44HUoQQBX4S5mMQscJklYEfGjkXyYoBR7P9INsF3hAmdo/dZDE55cExW/MaGy7ft
         s/pQO26SOGOJSj24stzdSxpyQROnEKguVXGOwiOp2qgnDivG7y3179F9hWsdF7HY+HX1
         VNlLYdA544kaIPjtKPm/8IdDOZ7wO0vD5u2z1lpK9NtmDW38ugqAhBNn9+X3Dto1ZI6S
         pY7vTllT0j9AjkWvY88uCypFM6cHm87OldHHWvJL9z2Ky7ZqmqyZBAYiOwFKMRjBIa1l
         7D7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UxUwN6bk2wtmwtOc4ROKIkFsdgxPdY69mdmGq/a0y/w=;
        b=hk2UgB0M0L++qJ/SA1lXmjWd5o3BmraxlVUvNP6bLJLx3Uk/3Ya5aA8zZm7Y4k3Jp5
         Z2rRw/wQEk/sQhCSuNCEnSxRTQL584+a4nmiopG4dzUnCWlY0aRWzl/x7FG+hkhzFqOE
         vie1lDJH9cUrPuo4la0csUIQ8/3+Se3Jmv/LI6qW6hqnNBVR9wMEmHZjAvuJycSjna69
         bLufEKRZiMJ7DsPex7i0sRowFZpGt6fzkEh2W6PhhW5uWZEtcA4DZAbgL4G0bG7dNFwj
         gc3CJY/7g5mZ1CgxnhAXVFsQ8mcHR5rot6NoGd91372AYt5RojLB2ivzvwoDnari+zGR
         wjQQ==
X-Gm-Message-State: AO0yUKWwTacXQjFWNaf0N1cw2mehDnkeAXoItre4MNmK9QOzIWylagka
        J0avWFi5TjlL6U8y5hWmHzgIvA==
X-Google-Smtp-Source: AK7set9nLnXMHmFqqyYieg9bQ8sIrNZWcVDzNsURR5gg6JT/szxkByE2n/I1Vxa1Aj1Q9fX5wkBDXQ==
X-Received: by 2002:a17:906:fe4c:b0:8aa:be5c:b7c5 with SMTP id wz12-20020a170906fe4c00b008aabe5cb7c5mr8190913ejb.41.1675900078769;
        Wed, 08 Feb 2023 15:47:58 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id 10-20020a170906028a00b008aefb673d33sm111150ejf.55.2023.02.08.15.47.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Feb 2023 15:47:58 -0800 (PST)
Message-ID: <1c266824-7e21-8970-f173-6b7a62abeb9f@linaro.org>
Date:   Thu, 9 Feb 2023 01:47:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 26/27] drm/msm/dpu: split pipe handling from
 _dpu_crtc_blend_setup_mixer
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
 <20230203182132.1307834-27-dmitry.baryshkov@linaro.org>
 <133ba8d8-f52f-42a5-712c-039f225d61fa@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <133ba8d8-f52f-42a5-712c-039f225d61fa@quicinc.com>
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

On 09/02/2023 01:44, Abhinav Kumar wrote:
> 
> 
> On 2/3/2023 10:21 AM, Dmitry Baryshkov wrote:
>> Rework _dpu_crtc_blend_setup_mixer() to split away pipe handling to a
>> separate functon. This is a preparation for the r_pipe support.
>>
>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 86 ++++++++++++++++-------
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h | 10 ++-
>>   2 files changed, 63 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 73e1a8c69ef0..0ca3bc38ff7e 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -400,6 +400,47 @@ static void 
>> _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
>>       }
>>   }
>> +static void _dpu_crtc_blend_setup_pipe(struct drm_crtc *crtc,
>> +                       struct drm_plane *plane,
>> +                       struct dpu_crtc_mixer *mixer,
>> +                       u32 num_mixers,
>> +                       struct dpu_hw_stage_cfg *stage_cfg,
>> +                       enum dpu_stage stage,
>> +                       unsigned int stage_idx,
>> +                       unsigned long *fetch_active,
>> +                       struct dpu_sw_pipe *pipe
>> +                      )
>> +{
>> +    uint32_t lm_idx;
>> +    enum dpu_sspp sspp_idx;
>> +    struct drm_plane_state *state;
>> +
>> +    if (!pipe->sspp)
>> +        return;
>> +
>> +    sspp_idx = pipe->sspp->idx;
>> +
>> +    state = plane->state;
>> +
>> +    DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
>> +             crtc->base.id,
>> +             stage,
>> +             plane->base.id,
>> +             sspp_idx - SSPP_NONE,
>> +             state->fb ? state->fb->base.id : -1);
>> +
>> +    set_bit(sspp_idx, fetch_active);
>> +
>> +    stage_cfg->stage[stage][stage_idx] = sspp_idx;
>> +    stage_cfg->multirect_index[stage][stage_idx] =
>> +                pipe->multirect_index;
>> +
>> +    /* blend config update */
>> +    for (lm_idx = 0; lm_idx < num_mixers; lm_idx++)
>> +        
>> mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
>> +                                    sspp_idx);
> 
> If you just pass the format to this function you can move rest of the 
> for loop also to this function.
> 
> Also, you will be able to add the trace_dpu_crtc_setup_mixer() with 
> complete information.
> 
> trace_dpu_crtc_setup_mixer is currently missing te stage_idx which is 
> important to debug blend issues.

Ack, I'll add it back, thanks for the note.

> 
>> +}
>> +
>>   static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>>       struct dpu_crtc *dpu_crtc, struct dpu_crtc_mixer *mixer,
>>       struct dpu_hw_stage_cfg *stage_cfg)
>> @@ -412,15 +453,12 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>       struct dpu_format *format;
>>       struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>> -    uint32_t stage_idx, lm_idx;
>> -    int zpos_cnt[DPU_STAGE_MAX + 1] = { 0 };
>> +    uint32_t lm_idx;
>>       bool bg_alpha_enable = false;
>>       DECLARE_BITMAP(fetch_active, SSPP_MAX);
>>       memset(fetch_active, 0, sizeof(fetch_active));
>>       drm_atomic_crtc_for_each_plane(plane, crtc) {
>> -        enum dpu_sspp sspp_idx;
>> -
>>           state = plane->state;
>>           if (!state)
>>               continue;
>> @@ -431,39 +469,25 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>           pstate = to_dpu_plane_state(state);
>>           fb = state->fb;
>> -        sspp_idx = pstate->pipe.sspp->idx;
>> -        set_bit(sspp_idx, fetch_active);
>> -
>> -        DRM_DEBUG_ATOMIC("crtc %d stage:%d - plane %d sspp %d fb %d\n",
>> -                crtc->base.id,
>> -                pstate->stage,
>> -                plane->base.id,
>> -                sspp_idx - SSPP_VIG0,
>> -                state->fb ? state->fb->base.id : -1);
>> -
>>           format = 
>> to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>>               bg_alpha_enable = true;
>> -        stage_idx = zpos_cnt[pstate->stage]++;
>> -        stage_cfg->stage[pstate->stage][stage_idx] =
>> -                    sspp_idx;
>> -        stage_cfg->multirect_index[pstate->stage][stage_idx] =
>> -                    pstate->pipe.multirect_index;
>> -
>>           trace_dpu_crtc_setup_mixer(DRMID(crtc), DRMID(plane),
>> -                       state, pstate, stage_idx,
>> +                       state, pstate,
>>                          format->base.pixel_format,
>>                          fb ? fb->modifier : 0);
>> +        _dpu_crtc_blend_setup_pipe(crtc, plane,
>> +                       mixer, cstate->num_mixers,
>> +                       stage_cfg, pstate->stage, 0,
>> +                       fetch_active,
>> +                       &pstate->pipe);
>> +
>>           /* blend config update */
>>           for (lm_idx = 0; lm_idx < cstate->num_mixers; lm_idx++) {
>> -            _dpu_crtc_setup_blend_cfg(mixer + lm_idx,
>> -                        pstate, format);
>> -
>> -            
>> mixer[lm_idx].lm_ctl->ops.update_pending_flush_sspp(mixer[lm_idx].lm_ctl,
>> -                                        sspp_idx);
>> +            _dpu_crtc_setup_blend_cfg(mixer + lm_idx, pstate, format);
>>               if (bg_alpha_enable && !format->alpha_enable)
>>                   mixer[lm_idx].mixer_op_mode = 0;
>> @@ -1297,8 +1321,16 @@ static int _dpu_debugfs_status_show(struct 
>> seq_file *s, void *data)
>>           seq_printf(s, "\tdst x:%4d dst_y:%4d dst_w:%4d dst_h:%4d\n",
>>               state->crtc_x, state->crtc_y, state->crtc_w,
>>               state->crtc_h);
>> -        seq_printf(s, "\tmultirect: mode: %d index: %d\n",
>> +        seq_printf(s, "\tsspp[0]:%d\n",
>> +               pstate->pipe.sspp->idx - SSPP_NONE);
>> +        seq_printf(s, "\tmultirect[0]: mode: %d index: %d\n",
>>               pstate->pipe.multirect_mode, pstate->pipe.multirect_index);
>> +        if (pstate->r_pipe.sspp) {
>> +            seq_printf(s, "\tsspp[1]:%d\n",
>> +                   pstate->r_pipe.sspp->idx - SSPP_NONE);
>> +            seq_printf(s, "\tmultirect[1]: mode: %d index: %d\n",
>> +                   pstate->r_pipe.multirect_mode, 
>> pstate->r_pipe.multirect_index);
>> +        }
>>           seq_puts(s, "\n");
>>       }
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> index 0ad148cc2fb8..5ec4f89e8814 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h
>> @@ -633,9 +633,9 @@ TRACE_EVENT(dpu_enc_phys_vid_irq_ctrl,
>>   TRACE_EVENT(dpu_crtc_setup_mixer,
>>       TP_PROTO(uint32_t crtc_id, uint32_t plane_id,
>>            struct drm_plane_state *state, struct dpu_plane_state *pstate,
>> -         uint32_t stage_idx, uint32_t pixel_format,
>> +         uint32_t pixel_format,
>>            uint64_t modifier),
>> -    TP_ARGS(crtc_id, plane_id, state, pstate, stage_idx,
>> +    TP_ARGS(crtc_id, plane_id, state, pstate,
>>           pixel_format, modifier),
>>       TP_STRUCT__entry(
>>           __field(    uint32_t,        crtc_id        )
>> @@ -643,7 +643,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>>           __field(    uint32_t,        fb_id        )
>>           __field_struct(    struct drm_rect,    src_rect    )
>>           __field_struct(    struct drm_rect,    dst_rect    )
>> -        __field(    uint32_t,        stage_idx    )
>>           __field(    enum dpu_stage,        stage        )
>>           __field(    enum dpu_sspp,        sspp        )
>>           __field(    uint32_t,        multirect_idx    )
>> @@ -657,7 +656,6 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>>           __entry->fb_id = state ? state->fb->base.id : 0;
>>           __entry->src_rect = drm_plane_state_src(state);
>>           __entry->dst_rect = drm_plane_state_dest(state);
>> -        __entry->stage_idx = stage_idx;
>>           __entry->stage = pstate->stage;
>>           __entry->sspp = pstate->pipe.sspp->idx;
>>           __entry->multirect_idx = pstate->pipe.multirect_index;
>> @@ -666,13 +664,13 @@ TRACE_EVENT(dpu_crtc_setup_mixer,
>>           __entry->modifier = modifier;
>>       ),
>>       TP_printk("crtc_id:%u plane_id:%u fb_id:%u src:" DRM_RECT_FP_FMT
>> -          " dst:" DRM_RECT_FMT " stage_idx:%u stage:%d, sspp:%d "
>> +          " dst:" DRM_RECT_FMT " stage:%d, sspp:%d "
>>             "multirect_index:%d multirect_mode:%u pix_format:%u "
>>             "modifier:%llu",
>>             __entry->crtc_id, __entry->plane_id, __entry->fb_id,
>>             DRM_RECT_FP_ARG(&__entry->src_rect),
>>             DRM_RECT_ARG(&__entry->dst_rect),
>> -          __entry->stage_idx, __entry->stage, __entry->sspp,
>> +          __entry->stage, __entry->sspp,
>>             __entry->multirect_idx, __entry->multirect_mode,
>>             __entry->pixel_format, __entry->modifier)
>>   );

-- 
With best wishes
Dmitry

