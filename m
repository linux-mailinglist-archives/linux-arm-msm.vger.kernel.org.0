Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ADB1966088E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Jan 2023 21:57:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229552AbjAFU5u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Jan 2023 15:57:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236074AbjAFU5f (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Jan 2023 15:57:35 -0500
Received: from alexa-out-sd-02.qualcomm.com (alexa-out-sd-02.qualcomm.com [199.106.114.39])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A224B73E22
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Jan 2023 12:57:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1673038654; x=1704574654;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=61+SEf+oPcvKAgojoT90tIn/526pppIhCSstbGUkZIo=;
  b=e0le+JJtv5fJu4d1itjkcAhrMrJtrmNSEW/iR5nl1PJtOPFxD1oqQHei
   uHWUnvl2ErJDDVz7agAxaK+5tYk0UQ8ksLJ+hwcX5e585lsB52MNoogb+
   /7xB/7fJevHaH7aaB/YdEZMiG7tRedx+2P5HGTkEi+r2kTmcpx5nLM2Fp
   A=;
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 06 Jan 2023 12:57:34 -0800
X-QCInternal: smtphost
Received: from nasanex01b.na.qualcomm.com ([10.46.141.250])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2023 12:57:34 -0800
Received: from [10.110.20.194] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 12:57:30 -0800
Message-ID: <60af746f-e88a-c78f-de36-7409a13006de@quicinc.com>
Date:   Fri, 6 Jan 2023 12:57:29 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [Freedreno] [RFC PATCH v3 3/3] drm/msm/dpu: Use color_fill
 property for DPU planes
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        <freedreno@lists.freedesktop.org>
CC:     <sebastian.wick@redhat.com>, <ppaalanen@gmail.com>,
        <linux-arm-msm@vger.kernel.org>, <quic_abhinavk@quicinc.com>,
        <dri-devel@lists.freedesktop.org>, <swboyd@chromium.org>,
        <daniel.vetter@ffwll.ch>, <robdclark@gmail.com>,
        <seanpaul@chromium.org>, <laurent.pinchart@ideasonboard.com>,
        <contact@emersion.fr>, <wayland-devel@lists.freedesktop.org>,
        <ville.syrjala@linux.intel.com>
References: <20230104234036.636-1-quic_jesszhan@quicinc.com>
 <20230104234036.636-4-quic_jesszhan@quicinc.com>
 <d352312a-9916-934c-0a1c-e79b7eb3c7e6@linaro.org>
From:   Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <d352312a-9916-934c-0a1c-e79b7eb3c7e6@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-Spam-Status: No, score=-7.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/4/2023 6:16 PM, Dmitry Baryshkov wrote:
> On 05/01/2023 01:40, Jessica Zhang wrote:
>> Initialize and use the color_fill properties for planes in DPU driver. In
>> addition, relax framebuffer requirements within atomic commit path and
>> add checks for NULL framebuffers. Finally, drop DPU_PLANE_COLOR_FILL_FLAG
>> as it's unused.
>>
>> Changes since V2:
>> - Fixed dropped 'const' warning
>> - Dropped use of solid_fill_format
>> - Switched to using drm_plane_solid_fill_enabled helper method
>> - Added helper to convert color fill to BGR888 (Rob)
>> - Added support for solid fill on planes of varying sizes
>> - Removed DPU_PLANE_COLOR_FILL_FLAG
>>
>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++-
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 65 ++++++++++++++---------
>>   2 files changed, 49 insertions(+), 25 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 13ce321283ff..0695b70ea1b7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -409,6 +409,7 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>       struct drm_plane_state *state;
>>       struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>>       struct dpu_plane_state *pstate = NULL;
>> +    const struct msm_format *fmt;
>>       struct dpu_format *format;
>>       struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>> @@ -441,7 +442,13 @@ static void _dpu_crtc_blend_setup_mixer(struct 
>> drm_crtc *crtc,
>>                   sspp_idx - SSPP_VIG0,
>>                   state->fb ? state->fb->base.id : -1);
>> -        format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
>> +        if (pstate->base.fb)
>> +            fmt = msm_framebuffer_format(pstate->base.fb);
>> +        else
>> +            fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
>> +                    DRM_FORMAT_ABGR8888, 0);
>> +
>> +        format = to_dpu_format(fmt);
>>           if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>>               bg_alpha_enable = true;
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c 
>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> index 86719020afe2..51a7507373f7 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
>> @@ -44,7 +44,6 @@
>>   #define DPU_NAME_SIZE  12
>> -#define DPU_PLANE_COLOR_FILL_FLAG    BIT(31)
>>   #define DPU_ZPOS_MAX 255
>>   /* multirect rect index */
>> @@ -105,7 +104,6 @@ struct dpu_plane {
>>       enum dpu_sspp pipe;
>>       struct dpu_hw_pipe *pipe_hw;
>> -    uint32_t color_fill;
>>       bool is_error;
>>       bool is_rt_pipe;
>>       const struct dpu_mdss_cfg *catalog;
>> @@ -678,6 +676,17 @@ static void _dpu_plane_setup_scaler(struct 
>> dpu_plane *pdpu,
>>                   &scaler3_cfg);
>>   }
>> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill 
>> solid_fill)
>> +{
>> +    uint32_t ret = 0;
>> +
>> +    ret |= ((uint8_t) solid_fill.b) << 16;
>> +    ret |= ((uint8_t) solid_fill.g) << 8;
>> +    ret |= ((uint8_t) solid_fill.r);
>> +
>> +    return ret;
>> +}
>> +
>>   /**
>>    * _dpu_plane_color_fill - enables color fill on plane
>>    * @pdpu:   Pointer to DPU plane object
>> @@ -1001,12 +1010,17 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>       dst = drm_plane_state_dest(new_plane_state);
>> -    fb_rect.x2 = new_plane_state->fb->width;
>> -    fb_rect.y2 = new_plane_state->fb->height;
>> +    if (new_plane_state->fb) {
>> +        fb_rect.x2 = new_plane_state->fb->width;
>> +        fb_rect.y2 = new_plane_state->fb->height;
>> +    }
>>       max_linewidth = pdpu->catalog->caps->max_linewidth;
>> -    fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +    if (new_plane_state->fb)
>> +        fmt = 
>> to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
>> +    else
>> +        fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> 
> I think this should be more explicit:
> 
> if (solid_fill)
>     fmt = dpu_get_dpu_format(...)
> else
>     fmt = to_dpu_format(msm_framebuffer_format(...).
> 
> And in the _dpu_crtc_blend_setup_mixer() too.

Hi Dmitry,

Noted.

> 
> Maybe the code can be extracted to a helper.
> 
>>       min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>> @@ -1018,7 +1032,7 @@ static int dpu_plane_atomic_check(struct 
>> drm_plane *plane,
>>           return -EINVAL;
>>       /* check src bounds */
>> -    } else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
>> +    } else if (new_plane_state->fb && !dpu_plane_validate_src(&src, 
>> &fb_rect, min_src_size)) {
>>           DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>>                   DRM_RECT_ARG(&src));
>>           return -E2BIG;
>> @@ -1086,9 +1100,10 @@ void dpu_plane_flush(struct drm_plane *plane)
>>       if (pdpu->is_error)
>>           /* force white frame with 100% alpha pipe output on error */
>>           _dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
>> -    else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
>> +    else if (!(plane->state->fb) && 
>> drm_plane_solid_fill_enabled(plane->state))
>>           /* force 100% alpha */
>> -        _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>> +        _dpu_plane_color_fill(pdpu, 
>> _dpu_plane_get_fill_color(plane->state->solid_fill),
>> +                0xFF);
> 
> I'd push alpha into _dpu_plane_get_fill_color(). Then adding alpha 
> support would be more transparent.

Acked.

> 
>>       else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
>>           const struct dpu_format *fmt = 
>> to_dpu_format(msm_framebuffer_format(plane->state->fb));
>>           const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, 
>> fmt);
>> @@ -1127,23 +1142,30 @@ static void 
>> dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>>       struct drm_crtc *crtc = state->crtc;
>>       struct drm_framebuffer *fb = state->fb;
>>       bool is_rt_pipe, update_qos_remap;
>> -    const struct dpu_format *fmt =
>> -        to_dpu_format(msm_framebuffer_format(fb));
>> +    const struct dpu_format *fmt;
>>       struct dpu_hw_pipe_cfg pipe_cfg;
>> -    memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>> -
>> -    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
>> -
>>       pstate->pending = true;
>>       is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>>       _dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
>> -    DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> -            ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> -            crtc->base.id, DRM_RECT_ARG(&state->dst),
>> -            (char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>> +    /* override for color fill */
>> +    if (!fb && drm_plane_solid_fill_enabled(plane->state)) {
>> +        /* skip remaining processing on color fill */
>> +        return;
>> +    }
>> +
>> +    memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
>> +
>> +    fmt = to_dpu_format(msm_framebuffer_format(fb));
>> +    _dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> 
> This change deserves a comment somewhere (in the commit message?). 
> Beforehand the driver tried to set the scanout/layout for the COLOR_FILL 
> case. You have changed this.

Sounds good.

Thanks,

Jessica Zhang

> 
>> +
>> +    if (fb)
>> +        DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " 
>> DRM_RECT_FMT
>> +                ", %4.4s ubwc %d\n", fb->base.id, 
>> DRM_RECT_FP_ARG(&state->src),
>> +                crtc->base.id, DRM_RECT_ARG(&state->dst),
>> +                (char *)&fmt->base.pixel_format, 
>> DPU_FORMAT_IS_UBWC(fmt));
>>       pipe_cfg.src_rect = state->src;
>> @@ -1155,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct 
>> drm_plane *plane)
>>       pipe_cfg.dst_rect = state->dst;
>> -    /* override for color fill */
>> -    if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
>> -        /* skip remaining processing on color fill */
>> -        return;
>> -    }
>> -
>>       if (pdpu->pipe_hw->ops.setup_rects) {
>>           pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
>>                   &pipe_cfg,
>> @@ -1511,6 +1527,7 @@ struct drm_plane *dpu_plane_init(struct 
>> drm_device *dev,
>>           DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>>       drm_plane_create_alpha_property(plane);
>> +    drm_plane_create_solid_fill_property(plane);
>>       drm_plane_create_blend_mode_property(plane,
>>               BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>>               BIT(DRM_MODE_BLEND_PREMULTI) |
> 
> -- 
> With best wishes
> Dmitry
> 
