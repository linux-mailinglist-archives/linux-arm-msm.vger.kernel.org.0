Return-Path: <linux-arm-msm+bounces-29820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 779F896308A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 20:59:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 03C2A1F21A0C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 28 Aug 2024 18:59:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D5B5E1A706D;
	Wed, 28 Aug 2024 18:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gf/7+6b7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE6101AAE0D
	for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 18:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724871558; cv=none; b=L7yn5T8pfKFAu9/bj3eggGFVi/CT12SpHIyk8yzYZo8Py0HEeNmze2Kb5wqJaNOntlU08sVzlogDZa0Dpo/vupPEIpHnEXYf2/JPDAYklMytUn3o8ii2kB4WkC5piyX0ck4mW71V7ycT+d/LWlgSsovUNmTBLZO5dSJgJ8MDnnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724871558; c=relaxed/simple;
	bh=Cf0aYlesUgj3BWLZP21osLxTDgoSZ+lMvxK4f8SDoSw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gjrAhy0Hv0jo4dbWRtMuYQ08ZevfD/z3COUFTr5HgskYdexbf0mDTqf4EGGKSX1xDGUfc8G78/UhYanrlfVnJLbYHVdn3Q2bhlI0e8474Th/gW9jmX06CB7TJmsG6eKXL5WdB220oC0pWlRklzIv/ym4DlcU5javJjyMwq75vAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gf/7+6b7; arc=none smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-6b4412fac76so60671147b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 28 Aug 2024 11:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724871556; x=1725476356; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qmcz+7+UGxQfEMaPBC8TElShVt8OVL3UlwAoYiyx/aU=;
        b=gf/7+6b7EtVt5MU1eHCB7XGHke0s+kK7gOAvyTi45q1aPThwX6E1aG98hdEtnVCWNr
         IljatqeJnk8EP2rjHuWpQ0E6On2FR/JB4yTmExYXOCLI1d+IzSgrLjMUlUHzYcAKdzzT
         BeBqsRfjSSFAzSuWIyrZhSaZJ/x0YhQdWzIT8W/CjvrT9wA89/CWS8XgNF05vWMotI58
         Zz/qWES0VOTx1JWmcaNCtG9Es4FCoScrmIfA3F+elqADA6lIvsk7F5sLf0WT9wRz0ksr
         VJyYUYzf3aVbZWnxYLzCvR8Ilt7KLkDZMebGdin0aaRDXXIyfnE0JtsrhfqM0lAL/gPz
         +UZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724871556; x=1725476356;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qmcz+7+UGxQfEMaPBC8TElShVt8OVL3UlwAoYiyx/aU=;
        b=CH4RMBZtvzRbH2GAa7lCLG7Vsvta4bKy/NdRQJRETd6amWkdfd7eZSHgCWcwvtN/Yj
         0vOVcTdV9YIYgkGGW7de1lYzRR03cicrltIxxnk7/8hvKPEYWOFyUx7Qxh4eN7qNVXwF
         swBfBF6FS1UYs7sVQi6idpHe2kLNGl8o1p0kJva9//6Msmuim6CAUJGjWj5h6Y8cPpRK
         ulNJjfa4A6sixZgK1tMw4UpgfS6K5wbWmwWTYWoM38aJEO/lBtvlFoj2YenvLzh6gTru
         VpBlTeTSyICSdSZZXNsKWDFtWC+Sm7P2mm53pyXtoVYJqhNndLTnm4qGFbiLji0qnstr
         8uIg==
X-Forwarded-Encrypted: i=1; AJvYcCUd2Ju/Db6MuLiDiH8ONCTT6Ts/1XcJxyj5OS4e0M9JCaXlDB+T0U5k+mC6K77bLSDd+NmV9xoEsa9cxpiW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1nJq/TLCRB6FIb86IM/bK4BCI94HhTQollzpW0Qt+BagycX/f
	SWHQ1tJ0TWNICzqbRaIgO5fd4xPK0YqXiTvMgd1cVNVMJo9496ylXNMCqdto0ubAjCKh4xAjaos
	JCOx6GO6zZZqshGVQ7+yfnCdlrfUAZI7IMJDSwg==
X-Google-Smtp-Source: AGHT+IFUq92P2cDjPZ43R3Ejt1MApPBYLwyypx+rFCUZNhBlIjXtfAWoSXy+tv9q3lvlh7GVDWFBRpIvNEAiNvguYZ4=
X-Received: by 2002:a05:690c:10d:b0:6ad:bf4f:1bc3 with SMTP id
 00721157ae682-6d277c6ec56mr2918277b3.32.1724871555468; Wed, 28 Aug 2024
 11:59:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240627-dpu-virtual-wide-v5-0-5efb90cbb8be@linaro.org>
 <20240627-dpu-virtual-wide-v5-8-5efb90cbb8be@linaro.org> <1facdd7c-b15d-4d91-b96a-5b3b72dbad66@quicinc.com>
In-Reply-To: <1facdd7c-b15d-4d91-b96a-5b3b72dbad66@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 28 Aug 2024 21:59:04 +0300
Message-ID: <CAA8EJpr_wCAO5fw+ZbbuPUtnJFms+Q-X02ekWEGCnvuxcHKbqQ@mail.gmail.com>
Subject: Re: [PATCH v5 08/12] drm/msm/dpu: split dpu_plane_atomic_check()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 28 Aug 2024 at 21:27, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/26/2024 2:46 PM, Dmitry Baryshkov wrote:
> > Split dpu_plane_atomic_check() function into two pieces:
> >
> > dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
> > without touching the associated pipe,
> >
> > and
> >
> > dpu_plane_atomic_check_pipes(), which takes into account used pipes.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 178 +++++++++++++++++++-----------
> >   1 file changed, 112 insertions(+), 66 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 115c1bd77bdd..9b9fe28052ad 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -788,49 +788,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >   #define MAX_UPSCALE_RATIO   20
> >   #define MAX_DOWNSCALE_RATIO 4
> >
> > -static int dpu_plane_atomic_check(struct drm_plane *plane,
> > -                               struct drm_atomic_state *state)
> > +static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
> > +                                      struct drm_plane_state *new_plane_state,
> > +                                      const struct drm_crtc_state *crtc_state)
> >   {
> > -     struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> > -                                                                              plane);
> >       int ret = 0, min_scale, max_scale;
> >       struct dpu_plane *pdpu = to_dpu_plane(plane);
> >       struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> >       u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> >       struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > -     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > -     const struct drm_crtc_state *crtc_state = NULL;
> > -     const struct msm_format *fmt;
> >       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> >       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >       struct drm_rect fb_rect = { 0 };
> >       uint32_t max_linewidth;
> > -     unsigned int rotation;
> > -     uint32_t supported_rotations;
> > -     const struct dpu_sspp_cfg *pipe_hw_caps;
> > -     const struct dpu_sspp_sub_blks *sblk;
> > -
> > -     if (new_plane_state->crtc)
> > -             crtc_state = drm_atomic_get_new_crtc_state(state,
> > -                                                        new_plane_state->crtc);
> > -
> > -     pipe->sspp = dpu_rm_get_sspp(&kms->rm, pdpu->pipe);
> > -     r_pipe->sspp = NULL;
> >
> > -     if (!pipe->sspp)
> > -             return -EINVAL;
> > -
> > -     pipe_hw_caps = pipe->sspp->cap;
> > -     sblk = pipe->sspp->cap->sblk;
> > -
> > -     if (sblk->scaler_blk.len) {
> > -             min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > -             max_scale = MAX_DOWNSCALE_RATIO << 16;
> > -     } else {
> > -             min_scale = DRM_PLANE_NO_SCALING;
> > -             max_scale = DRM_PLANE_NO_SCALING;
> > -     }
> > +     min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > +     max_scale = MAX_DOWNSCALE_RATIO << 16;
> >
> >       ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >                                                 min_scale,
> > @@ -843,11 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       if (!new_plane_state->visible)
> >               return 0;
> >
> > -     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > -     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > -
> >       pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> >       if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> >               DPU_ERROR("> %d plane stages assigned\n",
> > @@ -871,8 +839,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               return -E2BIG;
> >       }
> >
> > -     fmt = msm_framebuffer_format(new_plane_state->fb);
> > -
> >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> >       drm_rect_rotate(&pipe_cfg->src_rect,
> > @@ -881,6 +847,78 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >
> >       if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> >            _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> > +             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > +                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > +                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > +                     return -E2BIG;
> > +             }
> > +
> > +             *r_pipe_cfg = *pipe_cfg;
> > +             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > +             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > +             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > +             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> > +     } else {
> > +             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> > +     }
> > +
>
> This is the part I am not able to fully understand. Assignment of
> r_pipe_cfg is also pipe related so why should that move to
> dpu_plane_atomic_check_nopipe(). It should be part of
> dpu_plane_atomic_check_pipe().

Because it happens before possible pipe / rectangle allocation. These
values are further used to assign resources.

>
> > +     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > +                         new_plane_state->fb->width, new_plane_state->fb->height,
> > +                         new_plane_state->rotation);
> > +     if (r_pipe_cfg->src_rect.x1 != 0)
> > +             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > +                                 new_plane_state->fb->width, new_plane_state->fb->height,
> > +                                 new_plane_state->rotation);
> > +
> > +     pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> > +
> > +     return 0;
> > +}
> > +
> > +static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
> > +                                     struct drm_atomic_state *state,
> > +                                     const struct drm_crtc_state *crtc_state)
> > +{
> > +     struct drm_plane_state *new_plane_state =
> > +             drm_atomic_get_new_plane_state(state, plane);
> > +     struct dpu_plane *pdpu = to_dpu_plane(plane);
> > +     struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > +     const struct msm_format *fmt;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> > +     uint32_t max_linewidth;
> > +     unsigned int rotation;
> > +     uint32_t supported_rotations;
> > +     const struct dpu_sspp_cfg *pipe_hw_caps;
> > +     const struct dpu_sspp_sub_blks *sblk;
> > +     int ret = 0;
> > +
> > +     pipe_hw_caps = pipe->sspp->cap;
> > +     sblk = pipe->sspp->cap->sblk;
> > +
> > +     /*
> > +      * We already have verified scaling against platform limitations.
> > +      * Now check if the SSPP supports scaling at all.
> > +      */
> > +     if (!sblk->scaler_blk.len &&
> > +         ((drm_rect_width(&new_plane_state->src) >> 16 !=
> > +           drm_rect_width(&new_plane_state->dst)) ||
> > +          (drm_rect_height(&new_plane_state->src) >> 16 !=
> > +           drm_rect_height(&new_plane_state->dst))))
> > +             return -ERANGE;
> > +
>
> Should this part be retained under dpu_plane_atomic_check_nopipe()?
>
> This is also not pipe dependent.

No, it uses sblk->scaler_blk, so it depends on the actual SSPP being
used for this pipe.

>
> > +     fmt = msm_framebuffer_format(new_plane_state->fb);
> > +
> > +     max_linewidth = pdpu->catalog->caps->max_linewidth;
> > +
> > +     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> > +                                       &crtc_state->adjusted_mode);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (drm_rect_width(&r_pipe_cfg->src_rect) != 0) {
> >               /*
> >                * In parallel multirect case only the half of the usual width
> >                * is supported for tiled formats. If we are here, we know that
> > @@ -894,12 +932,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >                       return -E2BIG;
> >               }
> >
> > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> > -                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> > -                     return -E2BIG;
> > -             }
> > -
> >               if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> >                   drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> >                   (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> > @@ -921,26 +953,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               r_pipe->multirect_index = DPU_SSPP_RECT_1;
> >               r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> >
> > -             *r_pipe_cfg = *pipe_cfg;
> > -             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> > -             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> > -             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> > -             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> > -     }
> > -
> > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > -                         new_plane_state->fb->width, new_plane_state->fb->height,
> > -                         new_plane_state->rotation);
> > -     if (r_pipe->sspp)
> > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > -                                 new_plane_state->fb->width, new_plane_state->fb->height,
> > -                                 new_plane_state->rotation);
> > -
> > -     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
> > -     if (ret)
> > -             return ret;
> > -
> > -     if (r_pipe->sspp) {
> >               ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> >                                                 &crtc_state->adjusted_mode);
> >               if (ret)
> > @@ -963,11 +975,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       }
> >
> >       pstate->rotation = rotation;
>
> The dpu_plane_check_inline_rotation() is also pipe independent. So even
> that goes to dpu_plane_atomic_check_nopipe()?

It also depends on the sblk if I remember correctly. Also note that
the next patch moves it to check_pipe().

>
> > -     pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> >
> >       return 0;
> >   }
> >
>
> <snip>
>


-- 
With best wishes
Dmitry

