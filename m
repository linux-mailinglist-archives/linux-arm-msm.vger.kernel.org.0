Return-Path: <linux-arm-msm+bounces-30004-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F889643A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:57:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 58422B20FDD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:57:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3EC2A18DF99;
	Thu, 29 Aug 2024 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAkGeC/t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f176.google.com (mail-yb1-f176.google.com [209.85.219.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FFD19474
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724932620; cv=none; b=m/A/Pab8899+rjT2gFSVbfcAzvHr5hHHVQc8ir9eoSSBoWpYTCY4HbPdf8Bw/rXr3HoFnkUnMrloDFAaL4BhF9e2VcCmWLRTX2Owh0/S/+5riP7CI2k1iNEOWLC/wsddcPRpgE48WJdt1T0iJ0Rim1UL+ssQnODwoWDEBx1tpFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724932620; c=relaxed/simple;
	bh=VxJ9dMU++Ls2qlsEBKBKG6zg7GEw01iWD+74F/pVjXU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kJgdsIwCASqWBxA9MCfJqkcMryULykzyyvQ8EFRVOnIvjmi25YhOuX6NQnFDXowH7nR9n1kAK+bUUFiVakWiXx67OC3SS5ESzkZiWM52yprdDQCvdGJhXR01A7csrhjrC44JBfhgW0QyDWCEWXIcT+HbE9dip5QmE9+q4cuyNDw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAkGeC/t; arc=none smtp.client-ip=209.85.219.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f176.google.com with SMTP id 3f1490d57ef6-e13c23dbabdso541814276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724932617; x=1725537417; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VGKYfZEA8ueSbdLkY5s5hU0jXKcQn2uFCbYV0qNbbxA=;
        b=MAkGeC/txqV4doYf/VGVEfEPoVewExilz6p5b1w/eTrrVoANJmvwvuvvUK6lF4WTjS
         tFG4BkA5C5L93nCt7Ppc1L2vGO4wJy2gtysMmYqUoaEREy9zl9S3kTV/XrnZg1IYU5gS
         CDGLCwaXsjs3AMHsy0dac9o/mu2BbxLWeA0O8BG6xhmuFzv4jCdggCdc3ES8TqjKWpd+
         4mdWn+8k++EA8HiJu/3f74G/GZjJyOGz1NNVcUPV1BDNftnsWlVRAF/GTy5vprXbfLmq
         p60SFwW8tjb2hRPjGUNDlvawMzubOs0mM4dQVq0uXLx8km/V4Bqxw9medG4xgUFnXtiT
         mbfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724932617; x=1725537417;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VGKYfZEA8ueSbdLkY5s5hU0jXKcQn2uFCbYV0qNbbxA=;
        b=Hlik+5Zfd39jY01qGPqNlhR71I8oGAGlcUFhEUCsXLGLzh4R22AaY9HMLyyUDcJ9No
         om62BBmxRE/Uq2y2ayzx75CdK4F+zJus0ynDg6TGw59YE02Ja5x4S2oOe4TVdlbBFuUd
         QgWrr6/aKXxczedp6hlPAuXrqgMtqhaytYKm9yzcqosggeFlGZMLyQqvOXcSiUdGluCV
         fbSq8F2lZ6xIE1dKQjumtg/MHiljN+HRSzwJYMZroQJ63EXS1RzadPN8DSkVrlDkpzWV
         KbGBGIkloLle1WVPyoSxbKriOr+pK7JZl2iXIgWbPER7YgJe306iDQNb84jUCjLG0ZIw
         84vg==
X-Forwarded-Encrypted: i=1; AJvYcCXk9zMbrjCZybBl4G8OrAXY9BX5F1yHu/7u4aFIol5rZz8Tkixl4swXEoe54woWkNJIOjhoX0dB9mteLhcG@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6j4IKngH/S5bgeKXHJ0Eoc4++eHMWVYV/Sey443s9HKY/bIG
	SnmdDVBhl0Pc1Htcz4OQ7gvfTCwpGW1go+IHbfB397/0B75ILEPLpwRzACWPVxCDnR1QFUCYZPQ
	4RGJg2wIiItMIDvW4cDj2mzCmmoD2agu1k3XxxA==
X-Google-Smtp-Source: AGHT+IHXnArOKRKkv9aDeckq+KbsCjyogedUlTLo8qkAGBwyIvTaY1QBhm0kJiL7fKWjsTr1H+Cwlshy/HqGzV5bPpI=
X-Received: by 2002:a05:6902:1002:b0:e11:7d82:9a88 with SMTP id
 3f1490d57ef6-e1a5af0b5d9mr2601279276.42.1724932617145; Thu, 29 Aug 2024
 04:56:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-20-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-20-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:56:46 +0300
Message-ID: <CAA8EJpoN-rWiKj37-9QGRVOJSXd0sk7kKbmO8VJEHQoyse6s3w@mail.gmail.com>
Subject: Re: [PATCH 20/21] drm/msm/dpu: support quad pipe in general operations
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 29 Aug 2024 at 13:21, Jun Nie <jun.nie@linaro.org> wrote:
>
> Support quad pipe in general operations with unified method.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 87 +++++++++++++++++--------------
>  1 file changed, 47 insertions(+), 40 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index c38c1bedd40fb..c3ea97b4ce439 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -619,6 +619,7 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>         struct msm_drm_private *priv = plane->dev->dev_private;
>         struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>         u32 fill_color = (color & 0xFFFFFF) | ((alpha & 0xFF) << 24);
> +       int i;
>
>         DPU_DEBUG_PLANE(pdpu, "\n");
>
> @@ -632,12 +633,11 @@ static void _dpu_plane_color_fill(struct dpu_plane *pdpu,
>                 return;
>
>         /* update sspp */
> -       _dpu_plane_color_fill_pipe(pstate, &pstate->pipe, &pstate->pipe_cfg.dst_rect,
> -                                  fill_color, fmt);
> -
> -       if (pstate->r_pipe.sspp)
> -               _dpu_plane_color_fill_pipe(pstate, &pstate->r_pipe, &pstate->r_pipe_cfg.dst_rect,
> -                                          fill_color, fmt);
> +       for (i = 0; i < PIPES_PER_STAGE; i++)
> +               if (pstate->pipe[i].sspp)
> +                       _dpu_plane_color_fill_pipe(pstate, &pstate->pipe[i],
> +                                                  &pstate->pipe_cfg[i].dst_rect,
> +                                                  fill_color, fmt);
>  }
>
>  static int dpu_plane_prepare_fb(struct drm_plane *plane,
> @@ -1279,8 +1279,11 @@ void dpu_plane_flush(struct drm_plane *plane)
>                 /* force 100% alpha */
>                 _dpu_plane_color_fill(pdpu, pdpu->color_fill, 0xFF);
>         else {
> -               dpu_plane_flush_csc(pdpu, &pstate->pipe);
> -               dpu_plane_flush_csc(pdpu, &pstate->r_pipe);
> +               int i;
> +
> +               for (i = 0; i < PIPES_PER_STAGE; i++)
> +                       if (pstate->pipe_cfg[i].visible)
> +                               dpu_plane_flush_csc(pdpu, &pstate->pipe[i]);
>         }
>
>         /* flag h/w flush complete */
> @@ -1380,20 +1383,17 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct drm_plane_state *state = plane->state;
>         struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -       struct dpu_sw_pipe *pipe = &pstate->pipe;
> -       struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
>         struct drm_crtc *crtc = state->crtc;
>         struct drm_framebuffer *fb = state->fb;
>         bool is_rt_pipe;
>         const struct msm_format *fmt =
>                 msm_framebuffer_format(fb);
> -       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +       struct dpu_sw_pipe_cfg *pipe_cfg;
>         struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>         struct msm_gem_address_space *aspace = kms->base.aspace;
>         struct dpu_hw_fmt_layout layout;
>         bool layout_valid = false;
> -       int ret;
> +       int ret, i;
>
>         ret = dpu_format_populate_layout(aspace, fb, &layout);
>         if (ret)
> @@ -1412,28 +1412,28 @@ static void dpu_plane_sspp_atomic_update(struct drm_plane *plane)
>                         crtc->base.id, DRM_RECT_ARG(&state->dst),
>                         &fmt->pixel_format, MSM_FORMAT_IS_UBWC(fmt));
>
> -       dpu_plane_sspp_update_pipe(plane, pipe, pipe_cfg, fmt,
> -                                  drm_mode_vrefresh(&crtc->mode),
> -                                  layout_valid ? &layout : NULL);
> -
> -       if (r_pipe->sspp) {
> -               dpu_plane_sspp_update_pipe(plane, r_pipe, r_pipe_cfg, fmt,
> -                                          drm_mode_vrefresh(&crtc->mode),
> -                                          layout_valid ? &layout : NULL);
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               if (pstate->pipe_cfg[i].visible && pstate->pipe[i].sspp)
> +                       dpu_plane_sspp_update_pipe(plane, &pstate->pipe[i],
> +                                                  &pstate->pipe_cfg[i], fmt,
> +                                                  drm_mode_vrefresh(&crtc->mode),
> +                                                  layout_valid ? &layout : NULL);
>         }
>
>         if (pstate->needs_qos_remap)
>                 pstate->needs_qos_remap = false;
>
> -       pstate->plane_fetch_bw = _dpu_plane_calc_bw(pdpu->catalog, fmt,
> -                                                   &crtc->mode, pipe_cfg);
> -
> -       pstate->plane_clk = _dpu_plane_calc_clk(&crtc->mode, pipe_cfg);
> -
> -       if (r_pipe->sspp) {
> -               pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt, &crtc->mode, r_pipe_cfg);
> +       pstate->plane_fetch_bw = 0;
> +       pstate->plane_clk = 0;
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               pipe_cfg = &pstate->pipe_cfg[i];
> +               if (pipe_cfg->visible) {
> +                       pstate->plane_fetch_bw += _dpu_plane_calc_bw(pdpu->catalog, fmt,
> +                                                                   &crtc->mode, pipe_cfg);
>
> -               pstate->plane_clk = max(pstate->plane_clk, _dpu_plane_calc_clk(&crtc->mode, r_pipe_cfg));
> +                       pstate->plane_clk = max(pstate->plane_clk,
> +                                               _dpu_plane_calc_clk(&crtc->mode, pipe_cfg));
> +               }
>         }
>  }
>
> @@ -1441,17 +1441,21 @@ static void _dpu_plane_atomic_disable(struct drm_plane *plane)
>  {
>         struct drm_plane_state *state = plane->state;
>         struct dpu_plane_state *pstate = to_dpu_plane_state(state);
> -       struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> +       struct dpu_sw_pipe *pipe;
> +       int i;
>
> -       trace_dpu_plane_disable(DRMID(plane), false,
> -                               pstate->pipe.multirect_mode);
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               pipe = &pstate->pipe[i];
> +               if (pipe->multirect_index == DPU_SSPP_RECT_1) {

No, the code isn't equivalent.

> +                       trace_dpu_plane_disable(DRMID(plane), false,
> +                                               pstate->pipe[i - 1].multirect_mode);
>
> -       if (r_pipe->sspp) {
> -               r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> -               r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> +                       pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> +                       pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
>
> -               if (r_pipe->sspp->ops.setup_multirect)
> -                       r_pipe->sspp->ops.setup_multirect(r_pipe);
> +                       if (pipe->sspp && pipe->sspp->ops.setup_multirect)
> +                               pipe->sspp->ops.setup_multirect(pipe);
> +               }
>         }
>
>         pstate->pending = true;
> @@ -1607,14 +1611,17 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(plane->state);
>         struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> +       int i;
>
>         if (!pdpu->is_rt_pipe)
>                 return;
>
>         pm_runtime_get_sync(&dpu_kms->pdev->dev);
> -       _dpu_plane_set_qos_ctrl(plane, &pstate->pipe, enable);
> -       if (pstate->r_pipe.sspp)
> -               _dpu_plane_set_qos_ctrl(plane, &pstate->r_pipe, enable);
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               if (!pstate->pipe_cfg[i].visible)
> +                       break;

continue, not break.

> +               _dpu_plane_set_qos_ctrl(plane, &pstate->pipe[i], enable);
> +       }
>         pm_runtime_put_sync(&dpu_kms->pdev->dev);
>  }
>  #endif
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

