Return-Path: <linux-arm-msm+bounces-33870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BBF289987B4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 15:29:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5CCEC283AA6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 13:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 099631C9DFA;
	Thu, 10 Oct 2024 13:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ojjqJL/q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBC091C68B2
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 13:29:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728566971; cv=none; b=C14Tg35KtME3mQcZcJvtN3ulARF/JDOXkFYPKXXds8e0W5xTtdMqJXLCrdGxNaM2JnhDPU8oJEOz/KSQxXTkMoyUJMfLxQ+EqEdXabQOb4VlZGg15VURxpoUzS25k/edkvMuwkw90ryHlQox++VjZmSGCjpPpbQhhK/PgqeGazs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728566971; c=relaxed/simple;
	bh=8O3bS7Nh8L1/0UqHv7/Np2KbSxTu/gTSt7f9I6tsAhg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Uvjs2MSIsr+q2Ng+Q9aoAdtAFC30UjHJVaFu3l+g8FVVM/XJtrcZyaIdkNQ8gb+C4B6EhpoE8edGRwEIxsc5tZUn8q4CKv5xyq9XcX3QbdKlfI/aKaY+lUqH2JeOZd4OtcCov1Kk8crzjpyz20HGeHE5Y+jbYSPlpO3JOnVEM50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ojjqJL/q; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2facf00b0c7so19344991fa.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 06:29:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728566968; x=1729171768; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=aIRrb2wEe1hj9N3JMi3Dpdq5hzianelOOR87NEysFh8=;
        b=ojjqJL/qzVrPhjX7n9x+6IDZuREVHkwZbuGLU4EMVUTfFN1c88vWPCBUbPMeti+pgM
         94DYSCcQ3doCpGhiCnOAxJ//4he3boXxsZTH9rzSEsbiCUKjIxn2lLr3OLMx8IT+THs1
         ds3W3AAyssECIGc7LrKVrBp48RzR0yptGAc7MJYh4n+tHFepk1xkGbMenvlNJAQizNga
         dVNF0m5r3AZObCeoK511xPJRjhprlKQhKY65OEysr28lwclauClzo9sGfg+pdgezAcl0
         WUXiV/njJc0QsTHnKyCgzuB0iH9cgnbzplqVbWxv1oiQNx241+Ud2an9JsGvYMRpieqz
         2Igg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728566968; x=1729171768;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aIRrb2wEe1hj9N3JMi3Dpdq5hzianelOOR87NEysFh8=;
        b=Fi8M9zEyuDKzNVC9q4528nEw8TZt4F8wQvnxFweopgsQ7m1IpFABJxGqY61HaZsfOv
         UDYPaGSYW+/uAPrNv8a2bN3B2PRFGoOl5FuGOFHe6rt4CTfDc+ggXDP1f63BOAG3dh8j
         z7zG1MSz6gIIcUW31G+n6mN3Rf0YVHJEaeRZpeCSPsRsldetucE4YftbfkR/mZEyxPhn
         oAS+z4PNVcmMe2N8z1HB2sItWf/WvW5cEwll/2zKQIMIa7VFxpqcpu7WJ4a5fGBnPUD1
         JyXCG7ZqgjdDUt0fC/ZysneTgx/0xzxEGmD+GSRFDaEkbEoR8ydGEn8F8uVNdQfjxrvk
         x5sg==
X-Forwarded-Encrypted: i=1; AJvYcCUMn04xobdxURbk7NsB90telcQf6vurAGufDYhTUr8gef6WuLs+EQ9bYA2VBfUehdEXmSvH/9hnzIRTIIJx@vger.kernel.org
X-Gm-Message-State: AOJu0YxxWjimHAPep6WbIMMUOft0tEvRPQcbbqzV7mQkbnL5C7Y8D0ku
	2cdtNx0sQu89bSpa2oihnI3xB54hEwo4ArhXxRiDuhLgfnyz04xLjvzGebwfsxE=
X-Google-Smtp-Source: AGHT+IGMe8PYLFKDdJ+rZpvGWnekbe6xbW3i8IXiFfzFUZoZ5UqBHRrrc/oUIH85ZxmH4Lx2PbhaBQ==
X-Received: by 2002:a05:6512:10c9:b0:539:a2e0:4e94 with SMTP id 2adb3069b0e04-539c98964afmr997624e87.30.1728566967869;
        Thu, 10 Oct 2024 06:29:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539cb905177sm253339e87.250.2024.10.10.06.29.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Oct 2024 06:29:26 -0700 (PDT)
Date: Thu, 10 Oct 2024 16:29:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 12/14] drm/msm/dpu: support plane splitting in
 quad-pipe case
Message-ID: <fbqhq7zvusll377oxi4tcr4bpgwhab2xbnfw2izotua5me4ufe@syy4jundvccf>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-12-76d4f5d413bf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-12-76d4f5d413bf@linaro.org>

On Wed, Oct 09, 2024 at 04:50:25PM GMT, Jun Nie wrote:
> Clip plane into pipes per left and right half screen ROI if topology
> is quad pipe.

Why? Please provide an explanation for the reviewers not knowing the
details.

> Then split the clipped rectangle by half if the rectangle
> width still exceeds width limit.
> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 +++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  6 ++
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 99 ++++++++++++++++++++++---------
>  3 files changed, 84 insertions(+), 28 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> index 66f745399a602..d2aca0a9493d5 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> @@ -1310,6 +1310,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool en)
>  	return 0;
>  }
>  
> +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)

I think the DPU driver uses num_foo rather than foo_num

> +{
> +	struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> +
> +	return cstate->num_mixers;
> +}
> +
>  #ifdef CONFIG_DEBUG_FS
>  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
>  {
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> index 5260e2440f059..ee7cf71f89fc7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> @@ -304,4 +304,10 @@ static inline enum dpu_crtc_client_type dpu_crtc_get_client_type(
>  
>  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
>  
> +/**
> + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> + * state: Pointer to drm crtc state object
> + */
> +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state);
> +
>  #endif /* _DPU_CRTC_H_ */
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 898fc2937954e..480a1b46aba72 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -837,10 +837,12 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>  	struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>  	u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
>  	struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -	struct dpu_sw_pipe_cfg *pipe_cfg;
> -	struct dpu_sw_pipe_cfg *r_pipe_cfg;
> +	struct dpu_sw_pipe_cfg pipe_cfg;
>  	struct drm_rect fb_rect = { 0 };
> +	const struct drm_display_mode *mode = &crtc_state->adjusted_mode;
>  	uint32_t max_linewidth;
> +	u32 lm_num;
> +	int lmcfg_id, lmcfg_num;
>  
>  	min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
>  	max_scale = MAX_DOWNSCALE_RATIO << 16;
> @@ -863,13 +865,10 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>  		return -EINVAL;
>  	}
>  
> -	/* move the assignment here, to ease handling to another pairs later */
> -	pipe_cfg = &pstate->pipe_cfg[0];
> -	r_pipe_cfg = &pstate->pipe_cfg[1];
> -	/* state->src is 16.16, src_rect is not */
> -	drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> +	lm_num = dpu_crtc_get_lm_num(crtc_state);
>  
> -	pipe_cfg->dst_rect = new_plane_state->dst;
> +	/* state->src is 16.16, src_rect is not */
> +	drm_rect_fp_to_int(&pipe_cfg.src_rect, &new_plane_state->src);
>  
>  	fb_rect.x2 = new_plane_state->fb->width;
>  	fb_rect.y2 = new_plane_state->fb->height;
> @@ -884,34 +883,78 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>  
>  	max_linewidth = pdpu->catalog->caps->max_linewidth;
>  
> -	drm_rect_rotate(&pipe_cfg->src_rect,
> +	drm_rect_rotate(&pipe_cfg.src_rect,
>  			new_plane_state->fb->width, new_plane_state->fb->height,
>  			new_plane_state->rotation);
>  
> -	if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> -	     _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> -		if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> -			DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> -					DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> -			return -E2BIG;
> +	/*
> +	 * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer pair
> +	 * configs for left and right half screen in case of 4:4:2 topology.
> +	 * But we may have 2 rect to split plane with 1 config for 2:2:1.
> +	 * So need to handle super wide plane splitting, and plane on right half
> +	 * for quad-pipe case. Check dest rectangle left/right clipping
> +	 * first, then check super wide rectangle splitting in every half next.
> +	 */
> +	lmcfg_num = (lm_num + 1) / 2;

num_stages?

> +	/* iterate mixer configs for this plane, to separate left/right with the id */
> +	for (lmcfg_id = 0; lmcfg_id < lmcfg_num; lmcfg_id++) {
> +		struct drm_rect mixer_rect = {lmcfg_id * mode->hdisplay / lmcfg_num, 0,
> +					(lmcfg_id + 1) * mode->hdisplay / lmcfg_num, mode->vdisplay};
> +		int cfg_idx = lmcfg_id * PIPES_PER_LM_PAIR;
> +		struct dpu_sw_pipe_cfg *cur_pipecfg = &pstate->pipe_cfg[cfg_idx];
> +
> +		drm_rect_fp_to_int(&cur_pipecfg->src_rect, &new_plane_state->src);
> +		cur_pipecfg->dst_rect = new_plane_state->dst;
> +
> +		DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> +				" vs clip window " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&cur_pipecfg->src_rect),
> +				DRM_RECT_ARG(&mixer_rect));
> +
> +		/* If this plane does not fall into mixer rect, check next mixer rect */
> +		if (!drm_rect_clip_scaled(&cur_pipecfg->src_rect, &cur_pipecfg->dst_rect, &mixer_rect)) {
> +			memset(&pstate->pipe_cfg[cfg_idx], 0, 2 * sizeof(struct dpu_sw_pipe_cfg));
> +			memset(&pstate->pipe[cfg_idx], 0, 2 * sizeof(struct dpu_sw_pipe));
> +			continue;
>  		}
>  
> -		*r_pipe_cfg = *pipe_cfg;
> -		pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> -		pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> -		r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> -		r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> -	} else {
> -		memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> -	}
> +		cur_pipecfg->valid = true;

... and checks have been broken up to now. This isn't good.

> +		cur_pipecfg->dst_rect.x1 -= mixer_rect.x1;
> +		cur_pipecfg->dst_rect.x2 -= mixer_rect.x1;
> +
> +		DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " dst: " DRM_RECT_FMT "\n",
> +				DRM_RECT_ARG(&cur_pipecfg->src_rect), DRM_RECT_ARG(&cur_pipecfg->dst_rect));
> +
> +		/* Split super wide rect into 2 rect */
> +		if ((drm_rect_width(&cur_pipecfg->src_rect) > max_linewidth) ||
> +		     _dpu_plane_calc_clk(mode, cur_pipecfg) > max_mdp_clk_rate) {
> +			struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[cfg_idx + 1];
> +
> +			if (drm_rect_width(&cur_pipecfg->src_rect) > 2 * max_linewidth) {
> +				DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> +						DRM_RECT_ARG(&cur_pipecfg->src_rect), max_linewidth);
> +				return -E2BIG;
> +			}
> +
> +			memcpy(r_pipe_cfg, cur_pipecfg, sizeof(struct dpu_sw_pipe_cfg));
> +			cur_pipecfg->src_rect.x2 = (cur_pipecfg->src_rect.x1 + cur_pipecfg->src_rect.x2) >> 1;
> +			cur_pipecfg->dst_rect.x2 = (cur_pipecfg->dst_rect.x1 + cur_pipecfg->dst_rect.x2) >> 1;

pipe_cfg. If you need, rename the topmost var name.

> +			r_pipe_cfg->src_rect.x1 = cur_pipecfg->src_rect.x2;
> +			r_pipe_cfg->dst_rect.x1 = cur_pipecfg->dst_rect.x2;
> +			r_pipe_cfg->valid = true;
> +			DPU_DEBUG_PLANE(pdpu, "Split super wide plane into:"
> +					DRM_RECT_FMT " and " DRM_RECT_FMT "\n",
> +					DRM_RECT_ARG(&cur_pipecfg->src_rect),
> +					DRM_RECT_ARG(&r_pipe_cfg->src_rect));
> +		} else {
> +			memset(&pstate->pipe_cfg[cfg_idx + 1], 0, sizeof(struct dpu_sw_pipe_cfg));
> +			memset(&pstate->pipe[cfg_idx + 1], 0, sizeof(struct dpu_sw_pipe));

Please keep using r_pipe_cfg here.

> +		}
>  
> -	drm_rect_rotate_inv(&pipe_cfg->src_rect,
> -			    new_plane_state->fb->width, new_plane_state->fb->height,
> -			    new_plane_state->rotation);
> -	if (drm_rect_width(&r_pipe_cfg->src_rect) != 0)
> -		drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> +		drm_rect_rotate_inv(&cur_pipecfg->src_rect,
>  				    new_plane_state->fb->width, new_plane_state->fb->height,
>  				    new_plane_state->rotation);
> +	}
>  
>  	pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
>  
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

