Return-Path: <linux-arm-msm+bounces-21829-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 290DA8FDA8A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 01:32:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8949E1F25D8B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Jun 2024 23:32:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9C10A15F400;
	Wed,  5 Jun 2024 23:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DYue8bSl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56443C28
	for <linux-arm-msm@vger.kernel.org>; Wed,  5 Jun 2024 23:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717630358; cv=none; b=Lq2WXXwCkRh2kbJB2FTTEbZby3e2KVx8meDftXu2Z9ZpTxzpanP2cf5gQnzsdZTtYyNPyh5Izpk24BW9jIhoij0kHlUGUgQPgJQrc/WJZimE6wNPMU4ydYrp/eJlWde6nA5ffDBVd66HyMUL8tRf8wHvJHgmDLV80DqNN3BoThg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717630358; c=relaxed/simple;
	bh=QGMbBoj1+jG3HUAefvag+49v3wPlJUNq4H5hRpLC5is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWzFCQsEjT7cHT0Vtt0SVDsBPleNn0NpMjVEp0gJj0TH7f53/BoorJHHiLCk+yElyJ/Pq15vycUQkf2wQ5HePVTsn0mVh5zsf9i4DJFe7gsAiPLJlh8Ga1wVcTz2MmrMt08fB+z1+sCnVRxwt/d/bkob49hs+nauYne+RlKsod0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DYue8bSl; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2c284095ea6so318638a91.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 05 Jun 2024 16:32:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717630356; x=1718235156; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kcTxi7vXRpk6QhfkYEFpMcgHU8yMQKGob0a5GzBdgPo=;
        b=DYue8bSlxtLk1et4FBTrWYmzqWAGWt/DgggiqbxJ/PDGpwzH4a0P4C5jWN9NaN1Fsp
         IQ/xFTKuoiYkOPj8JgwP+TIpzXhKvqKKkhRKxjm1d/R16UcQRMssZogUObjtCMPC+l0N
         n5+RZeg5tkMvQmQFJlpiyKTY5ZB/0u6NZgDcuQaG2BZbNau/kpOlMtCE5SzYqpbadO+5
         W6PoUfRtmfVMqMSmtgqiBMt0+AI9yKgQp2qzzZPeqsQ1g8jWF/s4msUd3bFb/1mIi66B
         ilzKYuxaocUUE2/AlGDEM00J1YUI2e4zkXgPaeflQGs7t0u33eNWk0zwBvZRg9aS5JMH
         Nwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717630356; x=1718235156;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kcTxi7vXRpk6QhfkYEFpMcgHU8yMQKGob0a5GzBdgPo=;
        b=TV5SD1E3Fu0t7y8ywpqjJJRVn5blrW3aJN654wHbrOoFetZkF1hOrzCWlZvjvFvAlO
         B5wOAKRdL0z0FVuokNF6Z1j3zxKCCfcFuboA8SfFcsR5zkiwOiURGCnN/TQ2qAUF4gpQ
         hVSNuM51G2+wLJsOqCM74WG7ckhC3qP07yLoReHW1BN/493MauW1Cg+CDNj+DNuzG1y9
         +u8Ml4FdtVsmIm7XW1eWb/6rk0dEyQ2UhfYTo21gclOn7fNi1duqLrOYpc33mVso7PWD
         E2HgEPAuc82qCYf4FrIro5S4hOnJHPG4GW3c+GJ6wPNIrGtHOXfxDKEbBTwhJd43FTIz
         S8dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCoqF5DSsSnjLt2eFjQL8jOd/Re/NFKO9vJXJMWMAWYArugsutElc3GkctRU6V0ymHCI12b/OrXr70RzvAWEDzH8jq4zHMa+p/9Xh1Fg==
X-Gm-Message-State: AOJu0YyZ1IywS/cZCehlvX9Tv5TXEhiaiKv31dvvmUzJMlccgedJzI8B
	iTc+rxNnT+OCaDiCdtXkuF4GB0cdL/pEwCqhLlYm0thGIRi4MgF3mlcrjX+R3s+g8qIrnM8Tem6
	1bsusIjXVSI/D32FZNo3MxcanfDd/5RqVnG1xknU3do0Qc+68
X-Google-Smtp-Source: AGHT+IE0Ik1o959wlPTZHQGPDSzovNBFgrxoQuKeM2biwIurd8qu3eXjwVbFeCAuym46Cd1Y8cQKdbLtzEdFu1Oxes4=
X-Received: by 2002:a17:90a:c253:b0:2bf:e9cd:c858 with SMTP id
 98e67ed59e1d1-2c27db11a6fmr3676411a91.17.1717630355706; Wed, 05 Jun 2024
 16:32:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
 <20240314000216.392549-7-dmitry.baryshkov@linaro.org> <627dd526-2b56-2ecb-9011-4ec08bab454f@quicinc.com>
In-Reply-To: <627dd526-2b56-2ecb-9011-4ec08bab454f@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 6 Jun 2024 02:32:23 +0300
Message-ID: <CAA8EJpp+NvoTMZdVNivqe0_nQd3PChSND7ojqa+Ee3nMdWcQGQ@mail.gmail.com>
Subject: Re: [PATCH v4 06/13] drm/msm/dpu: split dpu_plane_atomic_check()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Stephen Boyd <swboyd@chromium.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 6 Jun 2024 at 02:19, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 5:02 PM, Dmitry Baryshkov wrote:
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
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 184 ++++++++++++++--------
> >   1 file changed, 117 insertions(+), 67 deletions(-)
> >
>
> One thing which seemed odd to me is even dpu_plane_atomic_check_nopipe()
> does use pipe_cfg even though its named "nopipe".
>
> Perhaps were you targetting a split of SW planes vs SSPP atomic_check?
>
> I tried applying this patch on top of msm-next to more closely review
> the split up but it does not apply. So, I will review this patch a
> little better after it is re-spun. But will proceed with remaining patches.
>
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > index 6360052523b5..187ac2767a2b 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -788,50 +788,22 @@ static int dpu_plane_atomic_check_pipe(struct dpu_plane *pdpu,
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
> > -     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > -     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > -     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > -     const struct drm_crtc_state *crtc_state = NULL;
> > -     const struct dpu_format *fmt;
> >       struct dpu_sw_pipe_cfg *pipe_cfg = &pstate->pipe_cfg;
> >       struct dpu_sw_pipe_cfg *r_pipe_cfg = &pstate->r_pipe_cfg;
> >       struct drm_rect fb_rect = { 0 };
> >       uint32_t max_linewidth;
> > -     unsigned int rotation;
> > -     uint32_t supported_rotations;
> > -     const struct dpu_sspp_cfg *pipe_hw_caps;
> > -     const struct dpu_sspp_sub_blks *sblk;
> >
> > -     if (new_plane_state->crtc)
> > -             crtc_state = drm_atomic_get_new_crtc_state(state,
> > -                                                        new_plane_state->crtc);
> > -
> > -     pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > -     r_pipe->sspp = NULL;
> > -
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
> > -             min_scale = 1 << 16;
> > -             max_scale = 1 << 16;
> > -     }
> > +     min_scale = FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > +     max_scale = MAX_DOWNSCALE_RATIO << 16;
> >
> >       ret = drm_atomic_helper_check_plane_state(new_plane_state, crtc_state,
> >                                                 min_scale,
> > @@ -844,11 +816,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> > @@ -872,8 +839,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >               return -E2BIG;
> >       }
> >
> > -     fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> > -
> >       max_linewidth = pdpu->catalog->caps->max_linewidth;
> >
> >       drm_rect_rotate(&pipe_cfg->src_rect,
> > @@ -882,6 +847,83 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> > +     const struct dpu_format *fmt;
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
> > +     pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +     pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +     r_pipe->multirect_index = DPU_SSPP_RECT_SOLO;
> > +     r_pipe->multirect_mode = DPU_SSPP_MULTIRECT_NONE;
> > +
> > +     fmt = to_dpu_format(msm_framebuffer_format(new_plane_state->fb));
> > +
> > +     max_linewidth = pdpu->catalog->caps->max_linewidth;
> > +
> > +     ret = dpu_plane_atomic_check_pipe(pdpu, pipe, pipe_cfg, fmt,
> > +                                       &crtc_state->adjusted_mode);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (r_pipe_cfg->src_rect.x1 != 0) {
> >               /*
> >                * In parallel multirect case only the half of the usual width
> >                * is supported for tiled formats. If we are here, we know that
> > @@ -895,12 +937,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> > @@ -922,26 +958,6 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
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
> > @@ -964,11 +980,45 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
> >       }
> >
> >       pstate->rotation = rotation;
> > -     pstate->needs_qos_remap = drm_atomic_crtc_needs_modeset(crtc_state);
> >
> >       return 0;
> >   }
> >
> > +static int dpu_plane_atomic_check(struct drm_plane *plane,
> > +                               struct drm_atomic_state *state)
> > +{
> > +     struct drm_plane_state *new_plane_state = drm_atomic_get_new_plane_state(state,
> > +                                                                              plane);
> > +     int ret = 0;
> > +     struct dpu_plane *pdpu = to_dpu_plane(plane);
> > +     struct dpu_plane_state *pstate = to_dpu_plane_state(new_plane_state);
> > +     struct dpu_kms *dpu_kms = _dpu_plane_get_kms(plane);
> > +     struct dpu_sw_pipe *pipe = &pstate->pipe;
> > +     struct dpu_sw_pipe *r_pipe = &pstate->r_pipe;
> > +     const struct drm_crtc_state *crtc_state = NULL;
> > +
> > +     if (new_plane_state->crtc)
> > +             crtc_state = drm_atomic_get_new_crtc_state(state,
> > +                                                        new_plane_state->crtc);
> > +
> > +     if (pdpu->pipe != SSPP_NONE) {
>
> This check was not present iirc, why did you have to add this?
> RM will return the same SSPP unless freed. So why this additional check?

If pdpu->pipe is not SSPP_NONE, then virtual planes are disabled and
there is a fixed 1:1 relationship between planes and SSPP blocks.

>
> > +             pipe->sspp = dpu_rm_get_sspp(&dpu_kms->rm, pdpu->pipe);
> > +             r_pipe->sspp = NULL;
> > +     }
> > +
> > +     if (!pipe->sspp)
> > +             return -EINVAL;
> > +
> > +     ret = dpu_plane_atomic_check_nopipe(plane, new_plane_state, crtc_state);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (!new_plane_state->visible)
> > +             return 0;
> > +
> > +     return dpu_plane_atomic_check_pipes(plane, state, crtc_state);
> > +}
> > +
> >   static void dpu_plane_flush_csc(struct dpu_plane *pdpu, struct dpu_sw_pipe *pipe)
> >   {
> >       const struct dpu_format *format =



-- 
With best wishes
Dmitry

