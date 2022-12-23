Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BD515654B9F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Dec 2022 04:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235877AbiLWDMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 22 Dec 2022 22:12:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbiLWDMk (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 22 Dec 2022 22:12:40 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BA1556420
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 19:12:36 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id o6so5429726lfi.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Dec 2022 19:12:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bsf04gE/unfn1bQOs3ZV28sbbvxagn2uxB1k5VEvcXw=;
        b=VKE3sPEq00+uFBR1wUP0d2anZUH3XnNSEWit0xAENbgpiTGLP/Lr0pI5VZrqBLQMCc
         7TN0doYFQpP3gQA78iRM+6ux0clqJTYeFFJVQ+9TVHrH25G3QcyKZdDELWnoa/fnOaiX
         UO1qGA+h/GJi6OZmWzt7UtoVs4CIfUu2kmIY3BRXnJCf/OAXvfmFhUl5vL/aRG/4g+Z0
         Fcj4jAF15xrC761Hoxkp3bHGeziMqikHUBxMoE+wLxIzpAC1GtwKlRbA8dSyPF/+PISr
         86DEzueAptYuebrcZvSyRiAiUQrLnR7FE+iZuf1vsrSr1NKbTf0HE6+AOaOUjUQ6Ji0q
         aL1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bsf04gE/unfn1bQOs3ZV28sbbvxagn2uxB1k5VEvcXw=;
        b=Rbay4jDZ7+2CnV3IyfhmtCuNfZl9cJbeZ8ku2Of78/1H08KA8vjky5tMg7K1FsuhKN
         NT77W9Ep/qNjO3HEtA8Ea1EV9nKeV8IcjIMgBJMYT80PLIc3mtED41gvrHScxK39krjY
         QXx39vLtIsFBopFRCk0LaOThP5RHBUyx45dkvpsGwyIkwyMjxH53eHYXlN1xFf2ZQLO+
         XZceIGLgpeHkTkVbs+YIRjvuntfULbHi0I9ERo+5ondZVOkR0dTuA+M3J8Z1bCd884iC
         o9Fcgs+wRC5sRqtrWt/OAJPXbWrCyazug8Q51yb2+tLQqiyRKUYKZBThuKXUvbonSwqX
         CmQw==
X-Gm-Message-State: AFqh2koucn8T9FgBW0bb/Q6Gp62v0RU4Q4KwcodtkBfKBSjuh5xl2fMT
        Dg2c+WDoxyw8nESxMydFGjyLTA==
X-Google-Smtp-Source: AMrXdXs3kSvnFcd3TXTJu7Cxuftcu/NrSbT+/GCThNklQdJBV8oeo9Da0Ea5xy5IrebGZKGePRUXQw==
X-Received: by 2002:a05:6512:398c:b0:4ac:ec52:e063 with SMTP id j12-20020a056512398c00b004acec52e063mr2501264lfu.29.1671765155077;
        Thu, 22 Dec 2022 19:12:35 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id d17-20020a056512369100b00492dba3c85asm320956lfs.220.2022.12.22.19.12.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Dec 2022 19:12:34 -0800 (PST)
Message-ID: <fd9a9aca-8225-6cd1-ff5e-19f0a39bf49c@linaro.org>
Date:   Fri, 23 Dec 2022 05:12:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [RFC PATCH v2 3/3] drm/msm/dpu: Use color_fill property for DPU
 planes
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        daniel.vetter@ffwll.ch, laurent.pinchart@ideasonboard.com,
        ppaalanen@gmail.com, sebastian.wick@redhat.com,
        wayland-devel@lists.freedesktop.org, ville.syrjala@linux.intel.com
References: <20221222221441.6980-1-quic_jesszhan@quicinc.com>
 <20221222221441.6980-4-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221222221441.6980-4-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 23/12/2022 00:14, Jessica Zhang wrote:
> Initialize and use the color_fill properties for planes in DPU driver. In
> addition, relax framebuffer requirements within atomic commit path and
> add checks for NULL framebuffers. Finally, drop DPU_PLANE_COLOR_FILL_FLAG
> as it's unused.
> 
> Changes since V2:
> - Fixed dropped 'const' warning
> - Dropped use of solid_fill_format
> - Switched to using drm_plane_solid_fill_enabled helper method
> - Added helper to convert color fill to BGR888 (Rob)
> - Added support for solid fill on planes of varying sizes
> - Removed DPU_PLANE_COLOR_FILL_FLAG
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  9 +++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 65 ++++++++++++++---------
>   2 files changed, 49 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321283ff..0695b70ea1b7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -409,6 +409,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   	struct drm_plane_state *state;
>   	struct dpu_crtc_state *cstate = to_dpu_crtc_state(crtc->state);
>   	struct dpu_plane_state *pstate = NULL;
> +	const struct msm_format *fmt;
>   	struct dpu_format *format;
>   	struct dpu_hw_ctl *ctl = mixer->lm_ctl;
>   
> @@ -441,7 +442,13 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   				sspp_idx - SSPP_VIG0,
>   				state->fb ? state->fb->base.id : -1);
>   
> -		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> +		if (pstate->base.fb)
> +			fmt = msm_framebuffer_format(pstate->base.fb);
> +		else
> +			fmt = dpu_get_msm_format(&_dpu_crtc_get_kms(crtc)->base,
> +					DRM_FORMAT_ABGR8888, 0);
> +
> +		format = to_dpu_format(fmt);
>   
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 86719020afe2..51a7507373f7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -44,7 +44,6 @@
>   
>   #define DPU_NAME_SIZE  12
>   
> -#define DPU_PLANE_COLOR_FILL_FLAG	BIT(31)
>   #define DPU_ZPOS_MAX 255
>   
>   /* multirect rect index */
> @@ -105,7 +104,6 @@ struct dpu_plane {
>   	enum dpu_sspp pipe;
>   
>   	struct dpu_hw_pipe *pipe_hw;
> -	uint32_t color_fill;
>   	bool is_error;
>   	bool is_rt_pipe;
>   	const struct dpu_mdss_cfg *catalog;
> @@ -678,6 +676,17 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
>   				&scaler3_cfg);
>   }
>   
> +static uint32_t _dpu_plane_get_fill_color(struct drm_solid_fill solid_fill)
> +{
> +	uint32_t ret = 0;
> +
> +	ret |= ((uint8_t) solid_fill.b) << 16;
> +	ret |= ((uint8_t) solid_fill.g) << 8;
> +	ret |= ((uint8_t) solid_fill.r);
> +
> +	return ret;
> +}
> +
>   /**
>    * _dpu_plane_color_fill - enables color fill on plane
>    * @pdpu:   Pointer to DPU plane object
> @@ -1001,12 +1010,17 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   
>   	dst = drm_plane_state_dest(new_plane_state);
>   
> -	fb_rect.x2 = new_plane_state->fb->width;
> -	fb_rect.y2 = new_plane_state->fb->height;
> +	if (new_plane_state->fb) {
> +		fb_rect.x2 = new_plane_state->fb->width;
> +		fb_rect.y2 = new_plane_state->fb->height;
> +	}
>   
>   	max_linewidth = pdpu->catalog->caps->max_linewidth;
>   
> -	fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +	if (new_plane_state->fb)
> +		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +	else
> +		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
>   
>   	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>   
> @@ -1018,7 +1032,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -EINVAL;
>   
>   	/* check src bounds */
> -	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
> +	} else if (new_plane_state->fb && !dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
>   		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>   				DRM_RECT_ARG(&src));
>   		return -E2BIG;
> @@ -1086,9 +1100,10 @@ void dpu_plane_flush(struct drm_plane *plane)
>   	if (pdpu->is_error)
>   		/* force white frame with 100% alpha pipe output on error */
>   		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> -	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> +	else if (!(plane->state->fb) && drm_plane_solid_fill_enabled(plane->state))

And what if the plane has both fb and solid_fill proprety?

>   		/* force 100% alpha */
> -		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +		_dpu_plane_color_fill(pdpu, _dpu_plane_get_fill_color(plane->state->solid_fill),
> +				0xFF);
>   	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
>   		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
>   		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> @@ -1127,23 +1142,30 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   	struct drm_crtc *crtc = state->crtc;
>   	struct drm_framebuffer *fb = state->fb;
>   	bool is_rt_pipe, update_qos_remap;
> -	const struct dpu_format *fmt =
> -		to_dpu_format(msm_framebuffer_format(fb));
> +	const struct dpu_format *fmt;
>   	struct dpu_hw_pipe_cfg pipe_cfg;
>   
> -	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
> -
> -	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> -
>   	pstate->pending = true;
>   
>   	is_rt_pipe = (dpu_crtc_get_client_type(crtc) != NRT_CLIENT);
>   	_dpu_plane_set_qos_ctrl(plane, false, DPU_PLANE_QOS_PANIC_CTRL);
>   
> -	DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> -			", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> -			crtc->base.id, DRM_RECT_ARG(&state->dst),
> -			(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
> +	/* override for color fill */
> +	if (!fb && drm_plane_solid_fill_enabled(plane->state)) {

And here too.

> +		/* skip remaining processing on color fill */
> +		return;
> +	}
> +
> +	memset(&pipe_cfg, 0, sizeof(struct dpu_hw_pipe_cfg));
> +
> +	fmt = to_dpu_format(msm_framebuffer_format(fb));
> +	_dpu_plane_set_scanout(plane, pstate, &pipe_cfg, fb);
> +
> +	if (fb)
> +		DPU_DEBUG_PLANE(pdpu, "FB[%u] " DRM_RECT_FP_FMT "->crtc%u " DRM_RECT_FMT
> +				", %4.4s ubwc %d\n", fb->base.id, DRM_RECT_FP_ARG(&state->src),
> +				crtc->base.id, DRM_RECT_ARG(&state->dst),
> +				(char *)&fmt->base.pixel_format, DPU_FORMAT_IS_UBWC(fmt));
>   
>   	pipe_cfg.src_rect = state->src;
>   
> @@ -1155,12 +1177,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>   
>   	pipe_cfg.dst_rect = state->dst;
>   
> -	/* override for color fill */
> -	if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG) {
> -		/* skip remaining processing on color fill */
> -		return;
> -	}
> -
>   	if (pdpu->pipe_hw->ops.setup_rects) {
>   		pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
>   				&pipe_cfg,
> @@ -1511,6 +1527,7 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>   
>   	drm_plane_create_alpha_property(plane);
> +	drm_plane_create_solid_fill_property(plane);
>   	drm_plane_create_blend_mode_property(plane,
>   			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>   			BIT(DRM_MODE_BLEND_PREMULTI) |

-- 
With best wishes
Dmitry

