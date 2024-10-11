Return-Path: <linux-arm-msm+bounces-34059-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 31DAE999F10
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 10:32:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B731E282102
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:32:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C054A19C57C;
	Fri, 11 Oct 2024 08:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VrFPyN/W"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C421922C4
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 08:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728635532; cv=none; b=p3TW2RVuKJv4hxMTb1Ku/Dk0BXZwc4SWXCH7a1mOaVzHt9A/f9kYgmxsWoPF3/6X7XVU1aMoY49lfSn24sPx9Oa+B0I3dHkdy7bcFeUCEOw7wNtHmPKvHCrUapJYNYDmSx1oBNUwYH/j+cgTcWymRoEmiQr08POvKeTRt288m3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728635532; c=relaxed/simple;
	bh=f4q8CkUvsCA5ahkV7tww7bi8nEEXkzi15ieP9FC0xNg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQi/Pk5gJspTrhvvVWDrFNiS9eSNzwBEBMbrSDyA1ZnMzD/UWIdcdzp31BviEm9j5tHSkVYYcqXuC69bZUe2pqLZvQsB/ScECirlOOHidy2oe4BV9GPyX6QRx9QyANIjJOfciJHqw7oNXhVhWTgZFlKR1S0txUMjVkfo2iSc648=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VrFPyN/W; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6e34339d41bso5875517b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 01:32:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728635530; x=1729240330; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cXVKGFc9gKLnMRLCU5051n+iSbQkjJvfu9suJq/vAoM=;
        b=VrFPyN/Wb53HSBdgDf2wGMXfdLg5vflxG0kgRrgPI7jVY58Wzs9YCGIEsL7dcKaSjc
         BZ/R6QXAJ7yEmEkPyGT+RDSJFFvoPQsEp9N5re3XNL9SW6VTNMqYaK+fQaPM89AcgCy2
         wmoPfYmQ4ntJgADHshQo4dNnA9O3WyQG2MmFDG4KAMtiGjXXUu1W6SlfFeE6pxrsntKN
         aeNnIORbk/wemh1voK6FAUfaaOtiekFXCGsjzho4rVZ1p1yhVyT/WO6rHeORLNFEqQMg
         nWqbQ9FH0OMpz+jT12/Q5mGGSYjUCGSTH5qL/+Jwpo6OK12YHmj/TjN6H6GSMs2WPxdh
         izKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728635530; x=1729240330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cXVKGFc9gKLnMRLCU5051n+iSbQkjJvfu9suJq/vAoM=;
        b=jP8H1HsZ0rC2wZUVzFGybvr69dLValVtGTVieWI3k2r79rmgRJfOmfJjf5YpPemhfe
         lRbKobdZ9qVrcMONYUdzHk67GM2qkCpbMWkMJ/SSYgUI1RnwN4S3RRZvuEaBWem+WpYD
         OJbOVrGOt1xUxXlUbOOxAadneYMXI2LNf9YyXaKM2W3w2Qia/vksr7j54dS1/uz06FYM
         McNbcq0F4zOC0OufpsjfZ2zIEayeBEV/I1JjzBeuDG36FERyy14flGYU/edMrNQEpTpy
         o8YD2QU1+XQBRLsS73xWVeXRJg1IPejdtrewW4XSWgPueX3/5P43wgEBpGd+8BNuE2Yn
         sdag==
X-Forwarded-Encrypted: i=1; AJvYcCXlDe8SvohphE4GBQWk46FgxnEDWF/BrwLl8/b8GhUVCeaASccV1uySE59QNqhMTsmgro/Ux6T+rL6GBHO5@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0P9fKu1x9SQk3AQJUSlxd7iBenoTkLHCZ7RiONZP4fzVC44b
	xrW6s761NiPixlpWCcZyXF7/geyoQ+8mTBkTzuZtbfk0wkbQwOsHXxkDoSLvQfCPEW+k9x7o1ng
	4t1+gAF+3dOUlkdj6MuAMvvmiO9WtG6PvWb22BQ==
X-Google-Smtp-Source: AGHT+IEJUKI65A/rweY0Hux0u/XG69HYFzj47ADpABUJrETKXzH1Ptdn0pcJiE/EizkK2wO4ndQGAf8eKGPjQWg32dQ=
X-Received: by 2002:a05:690c:4148:b0:6e3:1050:5a46 with SMTP id
 00721157ae682-6e3479e0c16mr8544877b3.22.1728635529707; Fri, 11 Oct 2024
 01:32:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-12-76d4f5d413bf@linaro.org>
 <fbqhq7zvusll377oxi4tcr4bpgwhab2xbnfw2izotua5me4ufe@syy4jundvccf> <CABymUCMcKwrUFZ=KJdS852-KkWPaGGigHr2Jo8B17_oZa6HEeA@mail.gmail.com>
In-Reply-To: <CABymUCMcKwrUFZ=KJdS852-KkWPaGGigHr2Jo8B17_oZa6HEeA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 11:31:57 +0300
Message-ID: <CAA8EJpq+8vWaV1ApGimC6E_i4FfOQvgNioV4tK=8eTkMZMiNWA@mail.gmail.com>
Subject: Re: [PATCH v2 12/14] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Oct 2024 at 11:13, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:29=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Oct 09, 2024 at 04:50:25PM GMT, Jun Nie wrote:
> > > Clip plane into pipes per left and right half screen ROI if topology
> > > is quad pipe.
> >
> > Why? Please provide an explanation for the reviewers not knowing the
> > details.
>
> The content of every half of screen is sent out via one interface in
> dual-DSI case. The content for every interface is blended by a LM
> pair, thus no content of any pipe shall cross the LM pair. We need
> to clip plane into pipes per left and right half screen ROI if topology
> is quad pipe.

=3D> commit message.

> >
> > > Then split the clipped rectangle by half if the rectangle
> > > width still exceeds width limit.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  |  7 +++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  6 ++
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 99 +++++++++++++++++++++=
+---------
> > >  3 files changed, 84 insertions(+), 28 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 66f745399a602..d2aca0a9493d5 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -1310,6 +1310,13 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, boo=
l en)
> > >       return 0;
> > >  }
> > >
> > > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)
> >
> > I think the DPU driver uses num_foo rather than foo_num
>
> dpu_crtc_get_num_lm()
> >
> > > +{
> > > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > > +
> > > +     return cstate->num_mixers;
> > > +}
> > > +
> > >  #ifdef CONFIG_DEBUG_FS
> > >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> > >  {
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.h
> > > index 5260e2440f059..ee7cf71f89fc7 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > > @@ -304,4 +304,10 @@ static inline enum dpu_crtc_client_type dpu_crtc=
_get_client_type(
> > >
> > >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> > >
> > > +/**
> > > + * dpu_crtc_get_lm_num - Get mixer number in this CRTC pipeline
> > > + * state: Pointer to drm crtc state object
> > > + */
> > > +unsigned int dpu_crtc_get_lm_num(const struct drm_crtc_state *state)=
;
> > > +
> > >  #endif /* _DPU_CRTC_H_ */
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> > > index 898fc2937954e..480a1b46aba72 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > @@ -837,10 +837,12 @@ static int dpu_plane_atomic_check_nopipe(struct=
 drm_plane *plane,
> > >       struct dpu_kms *kms =3D _dpu_plane_get_kms(&pdpu->base);
> > >       u64 max_mdp_clk_rate =3D kms->perf.max_core_clk_rate;
> > >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane=
_state);
> > > -     struct dpu_sw_pipe_cfg *pipe_cfg;
> > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > +     struct dpu_sw_pipe_cfg pipe_cfg;
> > >       struct drm_rect fb_rect =3D { 0 };
> > > +     const struct drm_display_mode *mode =3D &crtc_state->adjusted_m=
ode;
> > >       uint32_t max_linewidth;
> > > +     u32 lm_num;
> > > +     int lmcfg_id, lmcfg_num;
> > >
> > >       min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> > >       max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > > @@ -863,13 +865,10 @@ static int dpu_plane_atomic_check_nopipe(struct=
 drm_plane *plane,
> > >               return -EINVAL;
> > >       }
> > >
> > > -     /* move the assignment here, to ease handling to another pairs =
later */
> > > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > -     /* state->src is 16.16, src_rect is not */
> > > -     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > > +     lm_num =3D dpu_crtc_get_lm_num(crtc_state);
> > >
> > > -     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > > +     /* state->src is 16.16, src_rect is not */
> > > +     drm_rect_fp_to_int(&pipe_cfg.src_rect, &new_plane_state->src);
> > >
> > >       fb_rect.x2 =3D new_plane_state->fb->width;
> > >       fb_rect.y2 =3D new_plane_state->fb->height;
> > > @@ -884,34 +883,78 @@ static int dpu_plane_atomic_check_nopipe(struct=
 drm_plane *plane,
> > >
> > >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> > >
> > > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > > +     drm_rect_rotate(&pipe_cfg.src_rect,
> > >                       new_plane_state->fb->width, new_plane_state->fb=
->height,
> > >                       new_plane_state->rotation);
> > >
> > > -     if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > > -          _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) =
> max_mdp_clk_rate) {
> > > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linew=
idth) {
> > > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_F=
MT " line:%u\n",
> > > -                                     DRM_RECT_ARG(&pipe_cfg->src_rec=
t), max_linewidth);
> > > -                     return -E2BIG;
> > > +     /*
> > > +      * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mix=
er pair
> > > +      * configs for left and right half screen in case of 4:4:2 topo=
logy.
> > > +      * But we may have 2 rect to split plane with 1 config for 2:2:=
1.
> > > +      * So need to handle super wide plane splitting, and plane on r=
ight half
> > > +      * for quad-pipe case. Check dest rectangle left/right clipping
> > > +      * first, then check super wide rectangle splitting in every ha=
lf next.
> > > +      */
> > > +     lmcfg_num =3D (lm_num + 1) / 2;
> >
> > num_stages?
>
> OK. Then lmcfg_id   ->   stage_id
> >
> > > +     /* iterate mixer configs for this plane, to separate left/right=
 with the id */
> > > +     for (lmcfg_id =3D 0; lmcfg_id < lmcfg_num; lmcfg_id++) {
> > > +             struct drm_rect mixer_rect =3D {lmcfg_id * mode->hdispl=
ay / lmcfg_num, 0,
> > > +                                     (lmcfg_id + 1) * mode->hdisplay=
 / lmcfg_num, mode->vdisplay};
> > > +             int cfg_idx =3D lmcfg_id * PIPES_PER_LM_PAIR;
> > > +             struct dpu_sw_pipe_cfg *cur_pipecfg =3D &pstate->pipe_c=
fg[cfg_idx];
> > > +
> > > +             drm_rect_fp_to_int(&cur_pipecfg->src_rect, &new_plane_s=
tate->src);
> > > +             cur_pipecfg->dst_rect =3D new_plane_state->dst;
> > > +
> > > +             DPU_DEBUG_PLANE(pdpu, "checking src " DRM_RECT_FMT
> > > +                             " vs clip window " DRM_RECT_FMT "\n",
> > > +                             DRM_RECT_ARG(&cur_pipecfg->src_rect),
> > > +                             DRM_RECT_ARG(&mixer_rect));
> > > +
> > > +             /* If this plane does not fall into mixer rect, check n=
ext mixer rect */
> > > +             if (!drm_rect_clip_scaled(&cur_pipecfg->src_rect, &cur_=
pipecfg->dst_rect, &mixer_rect)) {
> > > +                     memset(&pstate->pipe_cfg[cfg_idx], 0, 2 * sizeo=
f(struct dpu_sw_pipe_cfg));
> > > +                     memset(&pstate->pipe[cfg_idx], 0, 2 * sizeof(st=
ruct dpu_sw_pipe));
> > > +                     continue;
> > >               }
> > >
> > > -             *r_pipe_cfg =3D *pipe_cfg;
> > > -             pipe_cfg->src_rect.x2 =3D (pipe_cfg->src_rect.x1 + pipe=
_cfg->src_rect.x2) >> 1;
> > > -             pipe_cfg->dst_rect.x2 =3D (pipe_cfg->dst_rect.x1 + pipe=
_cfg->dst_rect.x2) >> 1;
> > > -             r_pipe_cfg->src_rect.x1 =3D pipe_cfg->src_rect.x2;
> > > -             r_pipe_cfg->dst_rect.x1 =3D pipe_cfg->dst_rect.x2;
> > > -     } else {
> > > -             memset(r_pipe_cfg, 0, sizeof(*r_pipe_cfg));
> > > -     }
> > > +             cur_pipecfg->valid =3D true;
> >
> > ... and checks have been broken up to now. This isn't good.
>
> Will move this patch before the plane checking patch.

You might need to move related chunks as well.

> >
> > > +             cur_pipecfg->dst_rect.x1 -=3D mixer_rect.x1;
> > > +             cur_pipecfg->dst_rect.x2 -=3D mixer_rect.x1;
> > > +
> > > +             DPU_DEBUG_PLANE(pdpu, "Got clip src:" DRM_RECT_FMT " ds=
t: " DRM_RECT_FMT "\n",
> > > +                             DRM_RECT_ARG(&cur_pipecfg->src_rect), D=
RM_RECT_ARG(&cur_pipecfg->dst_rect));
> > > +
> > > +             /* Split super wide rect into 2 rect */
> > > +             if ((drm_rect_width(&cur_pipecfg->src_rect) > max_linew=
idth) ||
> > > +                  _dpu_plane_calc_clk(mode, cur_pipecfg) > max_mdp_c=
lk_rate) {
> > > +                     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D &pstate-=
>pipe_cfg[cfg_idx + 1];
> > > +
> > > +                     if (drm_rect_width(&cur_pipecfg->src_rect) > 2 =
* max_linewidth) {
> > > +                             DPU_DEBUG_PLANE(pdpu, "invalid src " DR=
M_RECT_FMT " line:%u\n",
> > > +                                             DRM_RECT_ARG(&cur_pipec=
fg->src_rect), max_linewidth);
> > > +                             return -E2BIG;
> > > +                     }
> > > +
> > > +                     memcpy(r_pipe_cfg, cur_pipecfg, sizeof(struct d=
pu_sw_pipe_cfg));
> > > +                     cur_pipecfg->src_rect.x2 =3D (cur_pipecfg->src_=
rect.x1 + cur_pipecfg->src_rect.x2) >> 1;
> > > +                     cur_pipecfg->dst_rect.x2 =3D (cur_pipecfg->dst_=
rect.x1 + cur_pipecfg->dst_rect.x2) >> 1;
> >
> > pipe_cfg. If you need, rename the topmost var name.
>
> OK.  pipe_cfg_cur ?

screen_pipe_cfg

>
> >
> > > +                     r_pipe_cfg->src_rect.x1 =3D cur_pipecfg->src_re=
ct.x2;
> > > +                     r_pipe_cfg->dst_rect.x1 =3D cur_pipecfg->dst_re=
ct.x2;
> > > +                     r_pipe_cfg->valid =3D true;
> > > +                     DPU_DEBUG_PLANE(pdpu, "Split super wide plane i=
nto:"
> > > +                                     DRM_RECT_FMT " and " DRM_RECT_F=
MT "\n",
> > > +                                     DRM_RECT_ARG(&cur_pipecfg->src_=
rect),
> > > +                                     DRM_RECT_ARG(&r_pipe_cfg->src_r=
ect));
> > > +             } else {
> > > +                     memset(&pstate->pipe_cfg[cfg_idx + 1], 0, sizeo=
f(struct dpu_sw_pipe_cfg));
> > > +                     memset(&pstate->pipe[cfg_idx + 1], 0, sizeof(st=
ruct dpu_sw_pipe));
> >
> > Please keep using r_pipe_cfg here.
>
> OK, will make r_pipe_cfg a variable in function scope, not bracket scope.
> >
> > > +             }
> > >
> > > -     drm_rect_rotate_inv(&pipe_cfg->src_rect,
> > > -                         new_plane_state->fb->width, new_plane_state=
->fb->height,
> > > -                         new_plane_state->rotation);
> > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0)
> > > -             drm_rect_rotate_inv(&r_pipe_cfg->src_rect,
> > > +             drm_rect_rotate_inv(&cur_pipecfg->src_rect,
> > >                                   new_plane_state->fb->width, new_pla=
ne_state->fb->height,
> > >                                   new_plane_state->rotation);
> > > +     }
> > >
> > >       pstate->needs_qos_remap =3D drm_atomic_crtc_needs_modeset(crtc_=
state);
> > >
> > >
> > > --
> > > 2.34.1
> > >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

