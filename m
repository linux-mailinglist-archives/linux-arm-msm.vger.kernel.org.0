Return-Path: <linux-arm-msm+bounces-45252-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 159E0A137B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 11:21:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8DF003A6432
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Jan 2025 10:20:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1254C1DACA7;
	Thu, 16 Jan 2025 10:21:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yN5Sj6/I"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4653C1ACED3
	for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 10:20:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737022862; cv=none; b=ub6KMrvc5USAMXIHSbq3VaSDmXkx8D+zTpE1BxZwH3Zk6NhX8uL2uUS/ekLaiAoxv85B5R9eZn7m2hmGMXHm2O/g5qP0jI4A9NA58yo0UfpJXLM/9oLKqFLd4FBec5tVc0r1uzaJ1wJ9N0vnNpCqpkLW4iZDGnY/15PIrXRxbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737022862; c=relaxed/simple;
	bh=T4Nc4YlAWmtWangQGmhx1fyVeDng7D8e9KE+TDzHOBQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HPNgxLjBbMc6HUkaZncqsS8u9MvqsaJoxWF2SIa2p9THIHnfJ/d6YBYT4mQ3UuyIsFuKKctLoCozlRKd1kbAjKDz2xSfPfRXIzJuoOIHgONLKEFr1oOMypDfOs8oi39H3TQNz8VpeeRhEvg8/3lf/iOeS7McERY5qOmDLL++wdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yN5Sj6/I; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3a0acba5feso1042760276.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 16 Jan 2025 02:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737022859; x=1737627659; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7DkUZUbj/ATaAxon4iCq4sCI+LL6thiT8O47/n2k8g=;
        b=yN5Sj6/IvLBLWHbEU3fqdmWLfJRYDzQV3x9FvvYBKUbswNc2Y2vD8/GtSDKLPJVNqS
         kXfAvD3VlEN+tFL02P3sM4sS5xgumk+ndXFIvcIsj15pbvA5ocuarAKXHNJWDkbTAOeB
         j5c1AHFJnchvhWH0nEg63Aa0spY3NyByE+LJtnTOvUyju86uOXNu4wWt+z0FsMmP46LB
         94sdZTD8RBxR3+oXKCfIdeQdhcI4dyQIQt9B1jOoD8NrdsqLlMSMRnJUA+norW8fiYvs
         35QbgVdlMdG7ZZI3p1ReVNcw7DskbEgR4yv4DrR/2og0larObKhe1lyD698UAeejF4Wx
         kKMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737022859; x=1737627659;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g7DkUZUbj/ATaAxon4iCq4sCI+LL6thiT8O47/n2k8g=;
        b=heYwG64GfEQa8AJensGyJUBqvJYWBkrn8byXYTikkuYy8pgZGAn696Kf3B5avOkKau
         jlrinrpFGT1aBfH8UScTGjDRPTPzWugUQ9VaNSIsPGhDtoWKjyz0tXQZFlHFLNJPDdlA
         b0JuAeOD89esKC5K5AQAkTUmcJMujymwaNVw9S8EcqhFObWqV5lADVBVMUTAApALROi9
         kAf+dbYDck3Oybm1krbMS3ledfiaF6UajnAOqQdX56Y3EZ0uMC/SU5AHZgM4UEOOu57B
         DnWLqCBZBy/ruLR2M+bzJL2DviH4uQYv/lPiJnpcYnM9UBu/xwM52I4SnnNcufMoNpt6
         zv4Q==
X-Forwarded-Encrypted: i=1; AJvYcCU/DTfjXovb4mL+UqC8eaqPq86NVuMUBOzN/3E09VmRReqvaqXurLe29jPDKXxbnNXfBpNy8AcEEWOhITQX@vger.kernel.org
X-Gm-Message-State: AOJu0YxnVgXlOZ5FOxYlEwgxGaem/M3iol2MSzmRaueR25PrkCqxpjEr
	dIS51GMrr9KFkQMtaS0b4FNJ9XrsD+Cr76e2y7DMWJb+3A797A0Iy2oAsvZdJc+UhsnHaTot/cV
	yhv3NkUVwiKkAXF2wrILz3O0LYi0DLawWzhd0Eg==
X-Gm-Gg: ASbGnct822rzOP/CARokIhInsXlC9ty7HRiC8LXJ9YUN0LWNlOp5ISjh1N4+YogtkPf
	HNbWQQaCSfgXYIajIjaFgHS66FvFYPf84FjBFWuzhCQ8=
X-Google-Smtp-Source: AGHT+IGyCMbjXZdTOVnwyorJlpEKK9VZ01ILglYWYTK3rI+DrE1DS4wgQEyFOwdQqzNqzGND2YrsXMopmJEmI3c4WO0=
X-Received: by 2002:a05:6902:1209:b0:e57:8814:1399 with SMTP id
 3f1490d57ef6-e5788141813mr6542584276.44.1737022859049; Thu, 16 Jan 2025
 02:20:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
 <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-13-74749c6eba33@linaro.org>
 <ohq35qtnnas5oqiqycn3floji3auuvwitdy43geve6nce5xxq4@4gsyikmqbbh3>
In-Reply-To: <ohq35qtnnas5oqiqycn3floji3auuvwitdy43geve6nce5xxq4@4gsyikmqbbh3>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 18:20:48 +0800
X-Gm-Features: AbW1kvbPuG7qHikMwfEFiV0M8nqpsgbeobnZt2UlzDMxMzlnc8vtQ4GuZXujalA
Message-ID: <CABymUCNMe7egDjOfExA8AOqjtkjHHLPspibG6OZMhzHmvn6W+g@mail.gmail.com>
Subject: Re: [PATCH v4 13/16] drm/msm/dpu: support plane splitting in
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B41=E6=
=9C=8816=E6=97=A5=E5=91=A8=E5=9B=9B 16:14=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, Jan 16, 2025 at 03:26:02PM +0800, Jun Nie wrote:
> > The content of every half of screen is sent out via one interface in
> > dual-DSI case. The content for every interface is blended by a LM
> > pair in quad-pipe case, thus a LM pair should not blend any content
> > that cross the half of screen in this case. Clip plane into pipes per
> > left and right half screen ROI if topology is quad pipe case.
> >
> > The clipped rectangle on every half of screen will be split further
> > by half if its width still exceeds limit.
>
> futher handled by two pipes if its width exceeds a limit for a single
> pipe.

Accepted.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  11 +++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h    |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |   2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 138 +++++++++++++++++++-=
--------
> >  4 files changed, 112 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 5ae640da53fbf..a900220deeb35 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1361,6 +1361,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >       return 0;
> >  }
> >
> > +/**
> > + * dpu_crtc_get_num_lm - Get mixer number in this CRTC pipeline
> > + * @state: Pointer to drm crtc state object
> > + */
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state)
> > +{
> > +     struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(state);
> > +
> > +     return cstate->num_mixers;
> > +}
> > +
> >  #ifdef CONFIG_DEBUG_FS
> >  static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >  {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index 0b148f3ce0d7a..b14bab2754635 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_ge=
t_client_type(
> >
> >  void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > +
> >  #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_hw_sspp.h
> > index 56a0edf2a57c6..39fe338e76691 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
> > @@ -145,11 +145,13 @@ struct dpu_hw_pixel_ext {
> >   *             such as decimation, flip etc to program this field
> >   * @dest_rect: destination ROI.
> >   * @rotation: simplified drm rotation hint
> > + * @valid: notify that this pipe and config is in use
> >   */
> >  struct dpu_sw_pipe_cfg {
> >       struct drm_rect src_rect;
> >       struct drm_rect dst_rect;
> >       unsigned int rotation;
> > +     bool valid;
>
> Commit message doesn't describe why this is necessary at all. Why isn't
> it enough to check pipe->sspp as the code has been doing up to this
> point?

We test non-zero width of r_pipe or check pipe->sspp to decide whether
to allocate SSPP and go thru the routine for the r_pipe when we have 2
pipes at most. With 4 pipes, it is a bit complex to handle it this way beca=
use
the 2rd and the 4th pipes may be not valid when splitting the plane. A vali=
d
flag is more straightforward for later handling.

>
> >  };
> >
> >  /**
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 3795576e2eedd..4bcd7b1a05c16 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -831,8 +831,12 @@ static int dpu_plane_atomic_check_nosspp(struct dr=
m_plane *plane,
> >       struct dpu_plane_state *pstate =3D to_dpu_plane_state(new_plane_s=
tate);
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> >       struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     struct dpu_sw_pipe_cfg init_pipe_cfg;
> >       struct drm_rect fb_rect =3D { 0 };
> > +     const struct drm_display_mode *mode =3D &crtc_state->adjusted_mod=
e;
> >       uint32_t max_linewidth;
> > +     u32 num_lm;
> > +     int stage_id, num_stages;
> >
> >       min_scale =3D FRAC_16_16(1, MAX_UPSCALE_RATIO);
> >       max_scale =3D MAX_DOWNSCALE_RATIO << 16;
> > @@ -855,13 +859,10 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> >               return -EINVAL;
> >       }
> >
> > -     /* move the assignment here, to ease handling to another pairs la=
ter */
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -     /* state->src is 16.16, src_rect is not */
> > -     drm_rect_fp_to_int(&pipe_cfg->src_rect, &new_plane_state->src);
> > +     num_lm =3D dpu_crtc_get_num_lm(crtc_state);
> >
> > -     pipe_cfg->dst_rect =3D new_plane_state->dst;
> > +     /* state->src is 16.16, src_rect is not */
> > +     drm_rect_fp_to_int(&init_pipe_cfg.src_rect, &new_plane_state->src=
);
> >
> >       fb_rect.x2 =3D new_plane_state->fb->width;
> >       fb_rect.y2 =3D new_plane_state->fb->height;
> > @@ -886,35 +887,93 @@ static int dpu_plane_atomic_check_nosspp(struct d=
rm_plane *plane,
> >
> >       max_linewidth =3D pdpu->catalog->caps->max_linewidth;
> >
> > -     drm_rect_rotate(&pipe_cfg->src_rect,
> > +     drm_rect_rotate(&init_pipe_cfg.src_rect,
> >                       new_plane_state->fb->width, new_plane_state->fb->=
height,
> >                       new_plane_state->rotation);
> >
> > -     if ((drm_rect_width(&pipe_cfg->src_rect) > max_linewidth) ||
> > -          _dpu_plane_calc_clk(&crtc_state->adjusted_mode, pipe_cfg) > =
max_mdp_clk_rate) {
> > -             if (drm_rect_width(&pipe_cfg->src_rect) > 2 * max_linewid=
th) {
> > -                     DPU_DEBUG_PLANE(pdpu, "invalid src " DRM_RECT_FMT=
 " line:%u\n",
> > -                                     DRM_RECT_ARG(&pipe_cfg->src_rect)=
, max_linewidth);
> > -                     return -E2BIG;
> > +     /*
> > +      * We have 1 mixer pair cfg for 1:1:1 and 2:2:1 topology, 2 mixer=
 pair
> > +      * configs for left and right half screen in case of 4:4:2 topolo=
gy.
> > +      * But we may have 2 rect to split wide plane that exceeds limit =
with 1
> > +      * config for 2:2:1. So need to handle both wide plane splitting,=
 and
> > +      * plane on right half for quad-pipe case. Check dest rectangle
>
> only on the right side?

Yeah, below shall be better.
So need to handle both wide plane splitting, and two halves of screen split=
ting
for quad-pipe case.
>
> > +      * left/right clipping first, then check wide rectangle splitting=
 in
> > +      * every half next.
> > +      */
> > +     num_stages =3D (num_lm + 1) / 2;
>
> --
> With best wishes
> Dmitry

