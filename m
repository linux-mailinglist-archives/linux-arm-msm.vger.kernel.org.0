Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0FA61227C
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Oct 2022 13:40:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiJ2LkL (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 29 Oct 2022 07:40:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiJ2LkK (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 29 Oct 2022 07:40:10 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3D67356F5
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 04:40:07 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id o4so11326507ljp.8
        for <linux-arm-msm@vger.kernel.org>; Sat, 29 Oct 2022 04:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YpYAy4kUwBisHPG0bgp/3+BykX9QkCEBFng/28SK//0=;
        b=OqVpwH7Yyd9TRd1xbnu9NbWruAWfy6SKnLc0qXaT2D/xhpzw8vWijwh2yG8S4BRAZT
         fWI4xtcbIptG3lAhRtZBoUYKo9dH7vKTXQPgF7sY2N+6vUELuzf33VuUK+ZbEvDXCPO7
         UbxnEqNm9yOVAzPB0sYGMgx7Cn15697VdybrEqqsm99q9sNY0fn7HTp6aOFqzQNmVWuA
         1mlzQ0vjHvkRnWoAOmvzR30oVeCBQGboHbYgbP3sBy2kkC5qOOkIzyZ+QYSAFdPi8iPu
         qqWjtuRvVN53+8e6bJbHWhzIPpDLF+Md2MKju4RC9mL/nYhhrJXcW5zJxU5o297zWZYm
         Mp8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpYAy4kUwBisHPG0bgp/3+BykX9QkCEBFng/28SK//0=;
        b=RXK09hlaf95vc92m2ykzko7h/lb8RuQ84mZXTY+73zgeFlPcyjtgwEs72kI1oOzBCy
         mcUv7xMaCRP46Wl4kKKIXIGQfPwyqjPGMN+EamM1Cho7caAHfL2eQ0uG+beWMGOosNG4
         R4yaZXr30+kTOpjg4Z7UVMDwZ/WQkQGgNbPRW4ByAW2N39ieBV/AyvrWAOEV0A2Mhsl9
         7EZA8Ojz/96Inhh/Ht9pOqKGyno+KI32TzdI7GczOgiZjtnde0v9MagHSBMoJqP6Moag
         3tyjnMTI/Z6yZAtNKyuV8qIoG49X/cgmXuAwAob2eszjhXIRAC89O4jIlZRcYIef2b1z
         +bcw==
X-Gm-Message-State: ACrzQf1KnWq3ebsHUWJPKNdkGStu3LHdncF8hUgJyTb7MOdV0uRQKwO6
        uzw21l4C/Pw5kiQeisfyXay89w==
X-Google-Smtp-Source: AMsMyM5iQ/rsf6Wn0iri4GPi435dMNqAKBPhepGZAMQXUvXKf6xlX9mnmKtW4XUh3oJawkPYgWeKmg==
X-Received: by 2002:a2e:9c88:0:b0:277:139e:6a3d with SMTP id x8-20020a2e9c88000000b00277139e6a3dmr1474017lji.527.1667043606341;
        Sat, 29 Oct 2022 04:40:06 -0700 (PDT)
Received: from [10.27.10.248] ([195.165.23.90])
        by smtp.gmail.com with ESMTPSA id u25-20020a199219000000b00498fe38ea0fsm249033lfd.174.2022.10.29.04.40.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 29 Oct 2022 04:40:06 -0700 (PDT)
Message-ID: <b8c09f74-2e2f-48ac-d5d6-ef1e94ed9b09@linaro.org>
Date:   Sat, 29 Oct 2022 14:40:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC PATCH 3/3] drm/msm/dpu: Use color_fill property for DPU
 planes
Content-Language: en-GB
To:     Jessica Zhang <quic_jesszhan@quicinc.com>,
        freedreno@lists.freedesktop.org
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        robdclark@gmail.com, seanpaul@chromium.org, swboyd@chromium.org,
        quic_abhinavk@quicinc.com, contact@emersion.fr,
        daniel.vetter@ffwll.ch, laurent.pinchart@ideasonboard.com
References: <20221028225952.160-1-quic_jesszhan@quicinc.com>
 <20221028225952.160-4-quic_jesszhan@quicinc.com>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20221028225952.160-4-quic_jesszhan@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 29/10/2022 01:59, Jessica Zhang wrote:
> Initialize and use the color_fill properties for planes in DPU driver. In
> addition, relax framebuffer requirements within atomic commit path and
> add checks for NULL framebuffers.
> 
> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> ---
>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 ++-
>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 66 ++++++++++++++---------
>   2 files changed, 48 insertions(+), 25 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 13ce321283ff..157698b4f234 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -441,7 +441,12 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_crtc *crtc,
>   				sspp_idx - SSPP_VIG0,
>   				state->fb ? state->fb->base.id : -1);
>   
> -		format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> +		if (pstate->base.fb)
> +			format = to_dpu_format(msm_framebuffer_format(pstate->base.fb));
> +		else if (state->color_fill && !state->color_fill_format)
> +			format = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);

As I wrote in the review of the earlier patch, this disallows using 
black as the plane fill colour. Not to mention that using ABGR should be 
explicit rather than implicit.

> +		else
> +			format = dpu_get_dpu_format(state->color_fill_format);
>   
>   		if (pstate->stage == DPU_STAGE_BASE && format->alpha_enable)
>   			bg_alpha_enable = true;
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 658005f609f4..f3be37e97b64 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -103,7 +103,6 @@ struct dpu_plane {
>   	enum dpu_sspp pipe;
>   
>   	struct dpu_hw_pipe *pipe_hw;
> -	uint32_t color_fill;
>   	bool is_error;
>   	bool is_rt_pipe;
>   	const struct dpu_mdss_cfg *catalog;
> @@ -697,7 +696,10 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   	 * select fill format to match user property expectation,
>   	 * h/w only supports RGB variants
>   	 */
> -	fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> +	if (plane->state->color_fill && !plane->state->color_fill_format)
> +		fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> +	else
> +		fmt = dpu_get_dpu_format(plane->state->color_fill_format);
>   
>   	/* update sspp */
>   	if (fmt && pdpu->pipe_hw->ops.setup_solidfill) {
> @@ -720,6 +722,10 @@ static int _dpu_plane_color_fill(struct dpu_plane *pdpu,
>   					fmt, DPU_SSPP_SOLID_FILL,
>   					pstate->multirect_index);
>   
> +		/* skip remaining processing on color fill */
> +		if (!plane->state->fb)
> +			return 0;
> +
>   		if (pdpu->pipe_hw->ops.setup_rects)
>   			pdpu->pipe_hw->ops.setup_rects(pdpu->pipe_hw,
>   					&pipe_cfg,
> @@ -999,12 +1005,21 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> +	if (new_plane_state->fb) {
> +		fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> +	} else if (new_plane_state->color_fill) {
> +		if (new_plane_state->color_fill_format)
> +			fmt = dpu_get_dpu_format(new_plane_state->color_fill_format);
> +		else
> +			fmt = dpu_get_dpu_format(DRM_FORMAT_ABGR8888);
> +	}
>   
>   	min_src_size = DPU_FORMAT_IS_YUV(fmt) ? 2 : 1;
>   
> @@ -1016,7 +1031,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>   		return -EINVAL;
>   
>   	/* check src bounds */
> -	} else if (!dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
> +	} else if (new_plane_state->fb && !dpu_plane_validate_src(&src, &fb_rect, min_src_size)) {
>   		DPU_DEBUG_PLANE(pdpu, "invalid source " DRM_RECT_FMT "\n",
>   				DRM_RECT_ARG(&src));
>   		return -E2BIG;
> @@ -1084,9 +1099,9 @@ void dpu_plane_flush(struct drm_plane *plane)
>   	if (pdpu->is_error)
>   		/* force white frame with 100% alpha pipe output on error */
>   		_dpu_plane_color_fill(pdpu, 0xFFFFFF, 0xFF);
> -	else if (pdpu->color_fill & DPU_PLANE_COLOR_FILL_FLAG)
> +	else if (!(plane->state->fb) && plane->state->color_fill)
>   		/* force 100% alpha */
> -		_dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
> +		_dpu_plane_color_fill(pdpu, plane->state->color_fill, 0xFF);
>   	else if (pdpu->pipe_hw && pdpu->pipe_hw->ops.setup_csc) {
>   		const struct dpu_format *fmt = to_dpu_format(msm_framebuffer_format(plane->state->fb));
>   		const struct dpu_csc_cfg *csc_ptr = _dpu_plane_get_csc(pdpu, fmt);
> @@ -1125,23 +1140,30 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
> +	if (!fb && plane->state->color_fill) {
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
> @@ -1153,12 +1175,6 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
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
> @@ -1509,6 +1525,8 @@ struct drm_plane *dpu_plane_init(struct drm_device *dev,
>   		DPU_ERROR("failed to install zpos property, rc = %d\n", ret);
>   
>   	drm_plane_create_alpha_property(plane);
> +	drm_plane_create_color_fill_property(plane);
> +	drm_plane_create_color_fill_format_property(plane);
>   	drm_plane_create_blend_mode_property(plane,
>   			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
>   			BIT(DRM_MODE_BLEND_PREMULTI) |

-- 
With best wishes
Dmitry

