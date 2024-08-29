Return-Path: <linux-arm-msm+bounces-29999-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E85F96433A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 13:38:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E8584284608
	for <lists+linux-arm-msm@lfdr.de>; Thu, 29 Aug 2024 11:38:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EBD7419148D;
	Thu, 29 Aug 2024 11:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aCPHQ6eJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131961BC4E
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 11:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724931501; cv=none; b=WqgNX1KyT2h6orLLLHRP89WwpfXKIoqyax0l1feywmt5RyKAZGIfpzy7Cpo931kiEqPyLvk2ivT+5Pqikn238a1sp2TT5SmL1Yu66+QBnQaaAdF+QIYd4pZXKM3KlS+OJOllKf1JN2SWjiA8eCpXBvC8gb8eIXvVL8zHTGYhsM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724931501; c=relaxed/simple;
	bh=sAqxDssG2hUzCsznN5QQ4NJdr3fxj/p/yD8yzAk1mKY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TGK67dzYGMh309twsmghaySIRbKbPJG5JRSW42BU7DFAaw3CCdDu8fAr3U44/5YRjIg6kk5iEabIrafrPGrkdnUJt6bwsa08mZ8EdttjcogZXQx9zevmLwLyFdYR0CzMZpeZ54zD+sEiGE9gym4FOuURxvH0rhchJWAoL6h4AVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aCPHQ6eJ; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-e16582cb9f9so432182276.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Aug 2024 04:38:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724931499; x=1725536299; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5xrA5JIScAJNAxNi++FV2D+NsqZDXM2fowkG+0TvI+Y=;
        b=aCPHQ6eJk62vXQZzgp69eVa1DbYMyII8O/jjU+zxEfSedby18UwBRWRWuuwhS+MbwW
         nRa/xqXpDywg+d/Lrx5mEKgSbtnN15a+3jE88Gy3PYxL2fo3Ifqp4mLlpAQW08QMWLvv
         dt2CfGvP4PHPaCt4dII2D63w5iyoua4eJar1fScY4dywvNWE0ZgalY03TelwZ4cqJYtC
         VX0IUfA6Px0WuSWfpN1o3eOQbLa0ieoD1vVfrm6NJv8PVWBz3obmRJtfgGvMSHShisW7
         5KfVQGJ7ErdQaEb5mt3+eTVsyW8WaMX1ZsfqGZS0fnci7UK7GnUaxTPR9YRSOkdWhjBF
         Lj0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724931499; x=1725536299;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5xrA5JIScAJNAxNi++FV2D+NsqZDXM2fowkG+0TvI+Y=;
        b=o9ePoGlCZNxEv8osRZcaYUYKoPSvD7MoeDvVHIurnV8heDeJWWdQFttIR8iLJKvXXI
         0XuHLaHVDzzIpwfiBEFWbLd8OFjOWI4DDH8z9q2zMa5xHDU38Snsa2B9ByB/JKtsTc14
         IS4yQy2KMi/JSBHumvk9rQpwkiyOMtvRqa1VkWXtDdmMTn8gTC3mN/My+AKvlk7c2i6g
         zfC52sRnAckAH/5pX/EshqH4X2u6kmfaekm6vl9TVDoXmCakpyj8a+Bx+X3Q5r4kc0+f
         dl8AaElVvRcmO3XzvW31SRTRlRuCcyLH5EJmGbV8VwlbF0QGQgQHH4KLBRRQZVJ3VXai
         WmOQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIftLQ0QN3wqLP7eaHQa/2OKEUvWG5TxU2eCxnJ1ihQzDjcV9Jw+OiMTggMyQDhOckQkPgOaamNJYofk7M@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5C7SGvP/ImPdOnIa06223LGhdxy6AdPXs11OIr7RXP1PlDrVH
	QkwhF9kWDnhE5KktTZc7CN2X+Fm5YjD+zqFIM52+rbntzorZ5fKhncSyqi+fzIAhUIlqTgnbJ1R
	UbZibDu7Lq5IngK6opLszO2Qi78uHhKAzclk0Ig==
X-Google-Smtp-Source: AGHT+IE8ArmNS0unbJoKUInpYCOA6IvrbcNO0CGeVhh4esEWs6+xbLygq4z4qqnuCJH4Ls1bO6F0PfxgRxlJ6R41Gdc=
X-Received: by 2002:a05:6902:707:b0:e11:446b:d43b with SMTP id
 3f1490d57ef6-e1a5c667cedmr2047797276.16.1724931498789; Thu, 29 Aug 2024
 04:38:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 14:38:07 +0300
Message-ID: <CAA8EJpp5TwzCZ6bpQQzzVBpEwhi28s-fX9wwOtrasCAGDBdykA@mail.gmail.com>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Support quad-pipe in SSPP checking
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
> Support quad-pipe in SSPP checking with unified method
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 108 ++++++++++++++----------------
>  1 file changed, 51 insertions(+), 57 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> index 4df7cfed4d230..78bf8f0292f62 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -738,12 +738,40 @@ static int dpu_plane_check_inline_rotation(struct dpu_plane *pdpu,
>  static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
>                 struct dpu_sw_pipe *pipe,
>                 struct dpu_sw_pipe_cfg *pipe_cfg,
> -               const struct msm_format *fmt,
> -               const struct drm_display_mode *mode)
> +               const struct drm_display_mode *mode,
> +               struct drm_plane_state *new_plane_state)
>  {
>         uint32_t min_src_size;
>         struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
>         int ret;
> +       const struct msm_format *fmt;
> +       uint32_t supported_rotations;
> +       const struct dpu_sspp_cfg *pipe_hw_caps;
> +       const struct dpu_sspp_sub_blks *sblk;
> +
> +       pipe_hw_caps = pipe->sspp->cap;
> +       sblk = pipe->sspp->cap->sblk;
> +
> +       /*
> +        * We already have verified scaling against platform limitations.
> +        * Now check if the SSPP supports scaling at all.
> +        */
> +       if (!sblk->scaler_blk.len &&
> +           ((drm_rect_width(&new_plane_state->src) >> 16 !=
> +             drm_rect_width(&new_plane_state->dst)) ||
> +            (drm_rect_height(&new_plane_state->src) >> 16 !=
> +             drm_rect_height(&new_plane_state->dst))))
> +               return -ERANGE;
> +
> +       fmt = msm_framebuffer_format(new_plane_state->fb);
> +
> +       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> +
> +       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> +               supported_rotations |= DRM_MODE_ROTATE_90;
> +
> +       pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> +                                                  supported_rotations);
>
>         min_src_size = MSM_FORMAT_IS_YUV(fmt) ? 2 : 1;
>
> @@ -886,8 +914,7 @@ static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
>         return 0;
>  }
>
> -static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe *pipe,
> -                                                  struct dpu_sw_pipe_cfg *pipe_cfg,
> +static int dpu_plane_is_multirect_parallel_capable(struct dpu_sw_pipe_cfg *pipe_cfg,
>                                                    const struct msm_format *fmt,
>                                                    uint32_t max_linewidth)
>  {
> @@ -916,49 +943,19 @@ static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
>                 drm_atomic_get_new_plane_state(state, plane);
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> -       struct dpu_sw_pipe *pipe = &pstate->pipe;
> -       struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -       const struct msm_format *fmt;
> -       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> -       uint32_t supported_rotations;
> -       const struct dpu_sspp_cfg *pipe_hw_caps;
> -       const struct dpu_sspp_sub_blks *sblk;
> -       int ret = 0;
> -
> -       pipe_hw_caps = pipe->sspp->cap;
> -       sblk = pipe->sspp->cap->sblk;
> -
> -       /*
> -        * We already have verified scaling against platform limitations.
> -        * Now check if the SSPP supports scaling at all.
> -        */
> -       if (!sblk->scaler_blk.len &&
> -           ((drm_rect_width(&new_plane_state->src) >> 16 !=
> -             drm_rect_width(&new_plane_state->dst)) ||
> -            (drm_rect_height(&new_plane_state->src) >> 16 !=
> -             drm_rect_height(&new_plane_state->dst))))
> -               return -ERANGE;
> -
> -       fmt = msm_framebuffer_format(new_plane_state->fb);
> -
> -       supported_rotations = DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0;
> -
> -       if (pipe_hw_caps->features & BIT(DPU_SSPP_INLINE_ROTATION))
> -               supported_rotations |= DRM_MODE_ROTATE_90;
> -
> -       pipe_cfg->rotation = drm_rotation_simplify(new_plane_state->rotation,
> -                                                  supported_rotations);
> -       r_pipe_cfg->rotation = pipe_cfg->rotation;
> -
> -       ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> -                                         &crtc_state->adjusted_mode);
> -       if (ret)
> -               return ret;
> +       struct dpu_sw_pipe *pipe;
> +       struct dpu_sw_pipe_cfg *pipe_cfg;
> +       int ret = 0, i;
>
> -       if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> -               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> -                                                 &crtc_state->adjusted_mode);
> +       for (i = 0; i < PIPES_PER_STAGE; i++) {
> +               pipe = &pstate->pipe[i];
> +               pipe_cfg = &pstate->pipe_cfg[i];
> +               if (!pipe_cfg->visible || !pipe->sspp)
> +                       break;
> +               DPU_DEBUG_PLANE(pdpu, "pipe %d is in use, validate it\n", i);
> +               ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg,
> +                                                 &crtc_state->adjusted_mode,
> +                                                 new_plane_state);
>                 if (ret)
>                         return ret;
>         }
> @@ -975,10 +972,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>         struct dpu_plane *pdpu = to_dpu_plane(plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
>         struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> -       struct dpu_sw_pipe *pipe = &pstate->pipe;
> -       struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> -       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> -       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> +       struct dpu_sw_pipe *pipe = &pstate->pipe[0];
> +       struct dpu_sw_pipe *r_pipe = &pstate->pipe[1];
> +       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg[0];
> +       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->pipe_cfg[1];
>         const struct drm_crtc_state *crtc_state = NULL;
>
>         if (new_plane_state->crtc)
> @@ -1033,13 +1030,10 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
>                         return -E2BIG;
>                 }
>
> -               /*
> -                * Use multirect for wide plane. We do not support dynamic
> -                * assignment of SSPPs, so we know the configuration.
> -                */
>                 pipe->multirect_index = DPU_SSPP_RECT_0;
>                 pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>
> +               r_pipe->sspp = pipe->sspp;

NAK

>                 r_pipe->multirect_index = DPU_SSPP_RECT_1;
>                 r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
>         }
> @@ -1056,7 +1050,7 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>                 drm_atomic_get_old_plane_state(state, plane);
>         struct dpu_plane_state *pstate = to_dpu_plane_state(plane_state);
>         struct drm_crtc_state *crtc_state;
> -       int ret;
> +       int ret, i;
>
>         if (plane_state->crtc)
>                 crtc_state = drm_atomic_get_new_crtc_state(state,
> @@ -1071,8 +1065,8 @@ static int dpu_plane_virtual_atomic_check(struct drm_plane *plane,
>                  * resources are freed by dpu_crtc_assign_plane_resources(),
>                  * but clean them here.
>                  */
> -               pstate->pipe.sspp = NULL;
> -               pstate->r_pipe.sspp = NULL;
> +               for (i = 0; i < PIPES_PER_STAGE; i++)
> +                       pstate->pipe[i].sspp = NULL;
>
>                 return 0;
>         }
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry

