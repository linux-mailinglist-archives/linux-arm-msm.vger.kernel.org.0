Return-Path: <linux-arm-msm+bounces-21865-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C84F38FE1AF
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 10:55:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 545601F23A27
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 08:55:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E925013BACD;
	Thu,  6 Jun 2024 08:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YiddkBjC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E30B713BC2F
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Jun 2024 08:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717664020; cv=none; b=Hr9+9dPtWnfGmAOpoqW6epKG8Vy2DC38EFqKJtSpl5P6X8H6C0cen5NuuiwGtFftyQ3eYnCmXFHOpBWIF61U/cWvJxhK5AL5Fy4hsQSa37+q1eqUt8kkCFC5sUQH6YVjFQGLQFIlBSh+p92k+tkop0sykxPSg0Coc7OgeDFk2TE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717664020; c=relaxed/simple;
	bh=vLxqq+0y9i3E5nTHZVUBHRgCWoaO1e8SADnMeJBryLA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ewrU/hUF5P0Kg0QtTl29gAuNDOer8+NoRhqD4ZkH7tCXm2lDPG1m7Lx20GY4YVLX8z1YPC69Azk+q/5j88g8Vp+/Ns19CDZnGHg132eJb3QCIwg3TJ9kAUSYs2YfytlOvebh2hZ1aCVkjDD3ANWNCEIPQw/lEmxfChXUkOJlKYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=YiddkBjC; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-62a0c011d53so6907767b3.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 06 Jun 2024 01:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717664018; x=1718268818; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PhAS1nhlGs/xcasCWLRYZQ1F/YtBZWOU6JgAV3gVAfk=;
        b=YiddkBjCfIB5gNtDTT6Qsl1WkWYnn4CAZliCAzvKz+xZKk7mrt2ihIM3B38LaPRn3Q
         FmCUEBAL45JN8+k7+f98M/2bM9nAueueyLodm05634/lQOUEBd5kb2dxaSC7XwPPGCuM
         wUHHSbx5N0pFk5SDpgp8C26Lz5mJDcXwgvM2zG9A0eh5QiS+GFGynApdYn5hsV75r7zb
         9sB63o7INiu1o9A1WZ7/qGtWaTUzxLw374p7dq6PLRLtPeA1kfmN6TXTdynmGUgz2Ufh
         nPn5u6ANNssfx1T5cnfXanEZvvlQDKrPqRIVvY2vbKPx6VARhs0uu/xDRLqhB00EADwT
         B7HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717664018; x=1718268818;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PhAS1nhlGs/xcasCWLRYZQ1F/YtBZWOU6JgAV3gVAfk=;
        b=w3IVosflc/aOWsCm73ZcEnM42VSqcb1vhzF6QCiKYz0CUJO3MeI+uFTQwGeyaykkvF
         e0W9t81jc5ioTwvtClRRy0t5P4tTIlHtOQZXwzoPlljYaGml085ft5sKR9TSAjwJXPrd
         21AAXbX14M74vlk3J+odUa9wdRGMz8hW7UAxpdETLgdjWLjg5bfSUiiy31a6ekrKZJ4s
         Uu2ZyaqVe+kXIUeVIq+grdjy25XOOsiWhAwxedvYd01rLKRgAx+apQT2+oOmOEaezF32
         nMim+G4JMxqPbmmgEPwTSkM4mQzj0Q1GrSosa6mi6aIM60NYrkBQuRqA0kB/CkIR9MSo
         VrMw==
X-Forwarded-Encrypted: i=1; AJvYcCUezRFkExCtbwnSx9cb/DfJT6fwgUNhXl/cQlMcbkaFqS9u89BSADcwH1CXk9S51+uAOJfO/1/ieKPaXtMyK8P/1AyUdvSFeM6caCKS6g==
X-Gm-Message-State: AOJu0YxksNmkPJamQV/cV0hNvCV1kmQfQXBCjRQJHxjrptsQhtLYqGCK
	kzjx1ofSXvkeaCOO+g3S+Zw2nuR9Ksz7I/J1Ax2rd8UXx7WHUNU9bLxCAtXik6VPoxNBO++OXTa
	/Lw55fEnMXXhcJq71+MNVxLJouaReUIjGYeXkmw==
X-Google-Smtp-Source: AGHT+IHeAW7bgvW7UAEMzK9Drk62QI65oJ6jjbIhFKUgQpUtAbnLLIZwA+X2iSvh5XLCqLsITW8JQc48FjyoJfy2TKI=
X-Received: by 2002:a81:a8c2:0:b0:62c:c696:5631 with SMTP id
 00721157ae682-62cc696573bmr24972777b3.13.1717664017619; Thu, 06 Jun 2024
 01:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-7-dmitry.baryshkov@linaro.org> <627dd526-2b56-2ecb-9011-4ec08bab454f@quicinc.com>
 <CAA8EJpp+NvoTMZdVNivqe0_nQd3PChSND7ojqa+Ee3nMdWcQGQ@mail.gmail.com> <1c107933-2180-fcd2-06f2-61eb7108b6b0@quicinc.com>
In-Reply-To: <1c107933-2180-fcd2-06f2-61eb7108b6b0@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jun 2024 11:53:26 +0300
Message-ID: <CAA8EJpp7DL+hpTUgmzsKciXg8ZEZ5BFy8ALiH0CbFmWb058HCw@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] drm/msm/dpu: split dpu_plane_atomic_check()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Jun 2024 at 02:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/5/2024 4:32 PM, Dmitry Baryshkov wrote:
> > On Thu, 6 Jun 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> >>
> >>
> >>
> >> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
> >>> Split dpu_plane_atomic_check() function into two pieces:
> >>>
> >>> dpu_plane_atomic_check_nopipe() performing generic checks on the pstate,
> >>> without touching the associated pipe,
> >>>
> >>> and
> >>>
> >>> dpu_plane_atomic_check_pipes(), which takes into account used pipes.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >>> ---
> >>>    drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 184 ++++++++++++++--------
> >>>    1 file changed, 117 insertions(+), 67 deletions(-)
> >>>
> >>
> >> One thing which seemed odd to me is even dpu_plane_atomic_check_nopipe()
> >> does use pipe_cfg even though its named "nopipe".
> >>
> >> Perhaps were you targetting a split of SW planes vs SSPP atomic_check?
> >>
> >> I tried applying this patch on top of msm-next to more closely review
> >> the split up but it does not apply. So, I will review this patch a
> >> little better after it is re-spun. But will proceed with remaining patches.
> >>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> index 6360052523b5..187ac2767a2b 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> @@ -788,50 +788,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
> >>>    #define MAX_UPSCALE_RATIO   20
> >>>    #define MAX_DOWNSCALE_RATIO 4
> >>>
> >>> -static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>> -                               struct drm_atomic_state *state)
> >>> +static int dpu_plane_atomic_check_nopipe(struct drm_plane *plane,
> >>> +                                      struct drm_plane_state *new_plane_state,
> >>> +                                      const struct drm_crtc_state *crtc_state)
> >>>    {
> >>> -     struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> >>> -                                                                              plane);
> >>>        int ret = 0, min_scale, max_scale;
> >>>        struct dpu_plane *pdpu = to_dpu_plane(plane);
> >>>        struct dpu_kms *kms = _dpu_plane_get_kms(&pdpu->base);
> >>>        u64 max_mdp_clk_rate = kms->perf.max_core_clk_rate;
> >>>        struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> >>> -     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> >>> -     struct dpu_sw_pipe *pipe = &pstate->pipe;
> >>> -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> >>> -     const struct drm_crtc_state *crtc_state = NULL;
> >>> -     const struct dpu_format *fmt;
> >>>        struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> >>>        struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >>>        struct drm_rect fb_rect = { 0 };
> >>>        uint32_t max_linewidth;
> >>> -     unsigned int rotation;
> >>> -     uint32_t supported_rotations;
> >>> -     const struct dpu_sspp_cfg *pipe_hw_caps;
> >>> -     const struct dpu_sspp_sub_blks *sblk;
> >>>
> >>> -     if (new_plane_state->crtc)
> >>> -             crtc_state = drm_atomic_get_new_crtc_state(state,
> >>> -                                                        new_plane_state->crtc);
> >>> -
> >>> -     pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> >>> -     r_pipe->sspp = NULL;
> >>> -
> >>> -     if (!pipe->sspp)
> >>> -             return -EINVAL;
> >>> -
> >>> -     pipe_hw_caps = pipe->sspp->cap;
> >>> -     sblk = pipe->sspp->cap->sblk;
> >>> -
> >>> -     if (sblk->scaler_blk.len) {
> >>> -             min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> >>> -             max_scale = MAX_DOWNSCALE_RATIO << 16;
> >>> -     } else {
> >>> -             min_scale = 1 << 16;
> >>> -             max_scale = 1 << 16;
> >>> -     }
> >>> +     min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> >>> +     max_scale = MAX_DOWNSCALE_RATIO << 16;
> >>>
> >>>        ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >>>                                                  min_scale,
> >>> @@ -844,11 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>        if (!new_plane_state->visible)
> >>>                return 0;
> >>>
> >>> -     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >>> -     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >>> -     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >>> -     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >>> -
> >>>        pstate->stage = DPU_STAGE_0 + pstate->base.normalized_zpos;
> >>>        if (pstate->stage >= pdpu->catalog->caps->max_mixer_blendstages) {
> >>>                DPU_ERROR("> %d plane stages assigned\n",
> >>> @@ -872,8 +839,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>                return -E2BIG;
> >>>        }
> >>>
> >>> -     fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> >>> -
> >>>        max_linewidth = pdpu->catalog->caps->max_linewidth;
> >>>
> >>>        drm_rect_rotate(&pipe_cfg->src_rect,
> >>> @@ -882,6 +847,83 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>
> >>>        if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> >>>             _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > max_mdp_clk_rate) {
> >>> +             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> >>> +                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> >>> +                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> >>> +                     return -E2BIG;
> >>> +             }
> >>> +
> >>> +             *r_pipe_cfg = *pipe_cfg;
> >>> +             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> >>> +             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> >>> +             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> >>> +             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> >>> +     } else {
> >>> +             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> >>> +     }
> >>> +
> >>> +     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> >>> +                         new_plane_state->fb->width, new_plane_state->fb->height,
> >>> +                         new_plane_state->rotation);
> >>> +     if (r_pipe_cfg->src_rect.x1 != 0)
> >>> +             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> >>> +                                 new_plane_state->fb->width, new_plane_state->fb->height,
> >>> +                                 new_plane_state->rotation);
> >>> +
> >>> +     pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> >>> +
> >>> +     return 0;
> >>> +}
> >>> +
> >>> +static int dpu_plane_atomic_check_pipes(struct drm_plane *plane,
> >>> +                                     struct drm_atomic_state *state,
> >>> +                                     const struct drm_crtc_state *crtc_state)
> >>> +{
> >>> +     struct drm_plane_state *new_plane_state =
> >>> +             drm_atomic_get_new_plane_state(state, plane);
> >>> +     struct dpu_plane *pdpu = to_dpu_plane(plane);
> >>> +     struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> >>> +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> >>> +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> >>> +     const struct dpu_format *fmt;
> >>> +     struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> >>> +     struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >>> +     uint32_t max_linewidth;
> >>> +     unsigned int rotation;
> >>> +     uint32_t supported_rotations;
> >>> +     const struct dpu_sspp_cfg *pipe_hw_caps;
> >>> +     const struct dpu_sspp_sub_blks *sblk;
> >>> +     int ret = 0;
> >>> +
> >>> +     pipe_hw_caps = pipe->sspp->cap;
> >>> +     sblk = pipe->sspp->cap->sblk;
> >>> +
> >>> +     /*
> >>> +      * We already have verified scaling against platform limitations.
> >>> +      * Now check if the SSPP supports scaling at all.
> >>> +      */
> >>> +     if (!sblk->scaler_blk.len &&
> >>> +         ((drm_rect_width(&new_plane_state->src) >> 16 !=
> >>> +           drm_rect_width(&new_plane_state->dst)) ||
> >>> +          (drm_rect_height(&new_plane_state->src) >> 16 !=
> >>> +           drm_rect_height(&new_plane_state->dst))))
> >>> +             return -ERANGE;
> >>> +
> >>> +     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >>> +     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >>> +     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> >>> +     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> >>> +
> >>> +     fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> >>> +
> >>> +     max_linewidth = pdpu->catalog->caps->max_linewidth;
> >>> +
> >>> +     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> >>> +                                       &crtc_state->adjusted_mode);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     if (r_pipe_cfg->src_rect.x1 != 0) {
> >>>                /*
> >>>                 * In parallel multirect case only the half of the usual width
> >>>                 * is supported for tiled formats. If we are here, we know that
> >>> @@ -895,12 +937,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>                        return -E2BIG;
> >>>                }
> >>>
> >>> -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewidth) {
> >>> -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT " line:%u\n",
> >>> -                                     DRM_RECT_ARG(&pipe_cfg->src_rect), max_linewidth);
> >>> -                     return -E2BIG;
> >>> -             }
> >>> -
> >>>                if (drm_rect_width(&pipe_cfg->src_rect) != drm_rect_width(&pipe_cfg->dst_rect) ||
> >>>                    drm_rect_height(&pipe_cfg->src_rect) != drm_rect_height(&pipe_cfg->dst_rect) ||
> >>>                    (!test_bit(DPU_SSPP_SMART_DMA_V1, &pipe->sspp->cap->features) &&
> >>> @@ -922,26 +958,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>                r_pipe->multirect_index = DPU_SSPP_RECT_1;
> >>>                r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_PARALLEL;
> >>>
> >>> -             *r_pipe_cfg = *pipe_cfg;
> >>> -             pipe_cfg->src_rect.x2 = (pipe_cfg->src_rect.x1 + pipe_cfg->src_rect.x2) >> 1;
> >>> -             pipe_cfg->dst_rect.x2 = (pipe_cfg->dst_rect.x1 + pipe_cfg->dst_rect.x2) >> 1;
> >>> -             r_pipe_cfg->src_rect.x1 = pipe_cfg->src_rect.x2;
> >>> -             r_pipe_cfg->dst_rect.x1 = pipe_cfg->dst_rect.x2;
> >>> -     }
> >>> -
> >>> -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> >>> -                         new_plane_state->fb->width, new_plane_state->fb->height,
> >>> -                         new_plane_state->rotation);
> >>> -     if (r_pipe->sspp)
> >>> -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> >>> -                                 new_plane_state->fb->width, new_plane_state->fb->height,
> >>> -                                 new_plane_state->rotation);
> >>> -
> >>> -     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt, &crtc_state->adjusted_mode);
> >>> -     if (ret)
> >>> -             return ret;
> >>> -
> >>> -     if (r_pipe->sspp) {
> >>>                ret = dpu_plane_atomic_check_pipe(pdpu, r_pipe, r_pipe_cfg, fmt,
> >>>                                                  &crtc_state->adjusted_mode);
> >>>                if (ret)
> >>> @@ -964,11 +980,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>>        }
> >>>
> >>>        pstate->rotation = rotation;
> >>> -     pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> >>>
> >>>        return 0;
> >>>    }
> >>>
> >>> +static int dpu_plane_atomic_check(struct drm_plane *plane,
> >>> +                               struct drm_atomic_state *state)
> >>> +{
> >>> +     struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> >>> +                                                                              plane);
> >>> +     int ret = 0;
> >>> +     struct dpu_plane *pdpu = to_dpu_plane(plane);
> >>> +     struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> >>> +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> >>> +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> >>> +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> >>> +     const struct drm_crtc_state *crtc_state = NULL;
> >>> +
> >>> +     if (new_plane_state->crtc)
> >>> +             crtc_state = drm_atomic_get_new_crtc_state(state,
> >>> +                                                        new_plane_state->crtc);
> >>> +
> >>> +     if (pdpu->pipe != SSPP_NONE) {
> >>
> >> This check was not present iirc, why did you have to add this?
> >> RM will return the same SSPP unless freed. So why this additional check?
> >
> > If pdpu->pipe is not SSPP_NONE, then virtual planes are disabled and
> > there is a fixed 1:1 relationship between planes and SSPP blocks.
> >
>
> True, pdpu->pipe is currently assigned in dpu_plane_init(), so we will
> always be hitting this condition.
>
> Perhaps the patches later on are changing that, so shouldnt this part
> come along with those?

Ack, I'll move it to patch 5.

>
> >>
> >>> +             pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> >>> +             r_pipe->sspp = NULL;
> >>> +     }
> >>> +
> >>> +     if (!pipe->sspp)
> >>> +             return -EINVAL;
> >>> +
> >>> +     ret = dpu_plane_atomic_check_nopipe(plane, new_plane_state, crtc_state);
> >>> +     if (ret)
> >>> +             return ret;
> >>> +
> >>> +     if (!new_plane_state->visible)
> >>> +             return 0;
> >>> +
> >>> +     return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
> >>> +}
> >>> +
> >>>    static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> >>>    {
> >>>        const struct dpu_format *format =
> >
> >
> >



-- 
With best wishes
Dmitry

