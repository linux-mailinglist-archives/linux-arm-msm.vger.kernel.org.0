Return-Path: <linux-arm-msm+bounces-67244-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A0B39B16FDF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 12:52:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 932A24E7C4B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 10:52:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 399B42BD5BF;
	Thu, 31 Jul 2025 10:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XdLBImUD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25A6FF4FA
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 10:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753959161; cv=none; b=F6vl2flYNguBJYBeEStUKVChPeDPf/H57gYQa3SHYvatfNMH1Dqo1ewYFYic/6Fkp91o6nYqLpTBvhWagI4OvzST/UUpfHqAUPlrQnB/gCYe61t7oT+tcfam6jcsldyZ+nRACaaM4qA/kRLxfgq9vwlk+2odQVQWRkMThGKpUqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753959161; c=relaxed/simple;
	bh=VL3VFuQgNeBGI92xGmBCF5wmqrBH0JWWZ/JVBOBtTw0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IuKEQAu6vCv0MAndKv82Bh0GbLTz0L7ILyRNtxRnMdi4SnhfwiTsWFI3kfNXgbGT7XtGkzSzeK4XbJVKZBb8jNg3QPQMEX5H1q831jtfz0vbyIaviVBpIJTUhtmTB/yKZ3yF4sm04P+JdIDPLMlSnAx4M88rCsRk4e0jnkH+RA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XdLBImUD; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-71b52d6d1e3so7584667b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 03:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753959158; x=1754563958; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sj/cic72rW3vzkgaoo3LbEi14h1ZdonLVH0p9rxyNnY=;
        b=XdLBImUDNQpbainiLCX4/A845jHk+8usRb//SMzLdMAlZ+h47/96yRN4Jp17Tpw/yV
         xGpKNkrNE2TQd42XzPHqledPHgRY76BbrKjn2AS7zMnccnVkszUU2eBKrwbnITs64voe
         gL9xr2TKmLpJ0EhoDWoU4QZ9h70rFlOa7XtWHyI7C5iBL4mAdGtELyR8GkVHcmneiI0Q
         W0GZ8zZRA7wpCxD4Ybnh6jXkzR8Hih5ob0Isq1IFDbk+JEN+penpZlDNe4/iZ/nCjwOA
         9TuPKFthUIkP6JeQHyKGdP4APSoUrKFaHzJzY58W+fgR6oMJTcneWGzVjS4aRAbcDkrf
         azoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753959158; x=1754563958;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sj/cic72rW3vzkgaoo3LbEi14h1ZdonLVH0p9rxyNnY=;
        b=q/cwx7jUzEK4St7v3NJmZMici9yD/5vZbX4WK7Gqi3cjfIfoYyDb6pPc3biqSy4m9t
         mE5vWsHE9yBS7fKOVNab2kH6+dvawobImB3968gP3b+o1/FG0umjB17Iw7TeBZJiYO5s
         l9BEgZmbKbrnx2hqR5+uqtL2mDwM+Uqi9Vo+Jgh65cfrxGiLuSvn5AxsDmcRdnjOz1lz
         WDGRi1iFQq0WZGPaBG3RnRZX+oci1yyU627kZhev8NHfAVA9YAdz+MXmSwJeWAqIK5Ze
         vEoYfje3iUK2bcuvHRp0rcednPD14BQ8VUKoWU2T/vDY/ls12R+0HVGhgVcmYPcfZue8
         tbKA==
X-Forwarded-Encrypted: i=1; AJvYcCUSHRwr+FIh/E7chn0n7v+TmCeVjlzN/GVIWEvHB1yxWzVTaJTVhF4+1gT/rwB89/Avyjc8ltza8IxU7jS/@vger.kernel.org
X-Gm-Message-State: AOJu0YxX1wyjMlfr0Bo6GTPRfyLutvYPypE/GkGqHpz64dri3zSTZgcp
	w8M6rkkkhXG/TicMfa1U3vWLTF2URUboVU7HEc6yGp6EfmeD6awQl9asNs16Cn7SNyzYZrhrLj0
	HzdTeMKnBd75FqVVcnMpO4qQT13O3aOZNlojyY9EW1g3D+sp5uL5R6n4alw==
X-Gm-Gg: ASbGncvg8uP/68qZ33fgg1fF4awLt+kurqrmVdfRVlKBTZxGe7MeFoJd5hTFhU3q6jx
	BfYuIZe3cFDc6skzJl+MFAfgbZx8PlPlXwG8ckPrXoxkvx1HnrXelYNJOZ9UJAqeBGgq9BbZjbf
	m0pYujHHfPqLSX5+n4xPDf362Y+GiwGnPW44PY6JCqr8MWa4pbvoZvMe+TDbl76A9b0uhFONznl
	/izviAqn+eNEsffoQ==
X-Google-Smtp-Source: AGHT+IHR/XhhCQrku5Wtt42Uzh/v8VDjDa79z/Pt9EIzsoR3dvddrg+UUlc63lIi9/3QIboav8AxkR0sSCS4QFuaMxg=
X-Received: by 2002:a05:6902:1204:b0:e8f:d693:9ab with SMTP id
 3f1490d57ef6-e8fd6930e27mr1286944276.13.1753959157975; Thu, 31 Jul 2025
 03:52:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org> <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
In-Reply-To: <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 31 Jul 2025 18:52:26 +0800
X-Gm-Features: Ac12FXy4uMWg6MVwlItUiDaEBwOnGEiMYLHy6vqLkyh8oXU__oPmyxki3UUHino
Message-ID: <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com>
Subject: Re: [PATCH v13 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
7=E6=9C=8831=E6=97=A5=E5=91=A8=E5=9B=9B 02:52=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
> > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > quad-pipe usage scenarios require four pipes and involve configuring
> > two stages. In quad-pipe case, the first two pipes share a set of
> > mixer configurations and enable multi-rect mode when certain
> > conditions are met. The same applies to the subsequent two pipes.
> >
> > Assign SSPPs to the pipes in each stage using a unified method and
> > to loop the stages accordingly.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++----=
--------
> >  1 file changed, 99 insertions(+), 61 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f460=
d62901dced65e3a9e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capable=
(struct dpu_hw_sspp *sspp,
> >  }
> >
> >
> > +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_state =
*pstate,
> > +                                            struct dpu_sw_pipe **singl=
e_pipe,
> > +                                            struct dpu_sw_pipe_cfg **s=
ingle_pipe_cfg,
> > +                                            int stage_index)
> > +{
> > +     int pipe_idx, i, valid_pipe =3D 0;
> > +
> > +     for (i =3D 0; i < PIPES_PER_STAGE; i++) {
>
> Why do you need to loop here? Is there a case when pipe 0 is not
> assigned, but pipe 1 is?

Loop the pipe in a stage to count the valid pipes. If there are 2 valid
pipes in stage of the current plane, this function will return false.
Or you prefer the below coding?

1029         pipe_idx =3D stage_index * PIPES_PER_STAGE;
1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) !=3D =
0 &&
1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
1].src_rect) =3D=3D 0) {
1032                         if (single_pipe)
1033                                 *single_pipe =3D &pstate->pipe[pipe_id=
x];
1034                         if (single_pipe_cfg)
1035                                 *single_pipe_cfg =3D
&pstate->pipe_cfg[pipe_idx];
1036                 return true;
1037         }
1038
1039         return false;

>
> > +             pipe_idx =3D stage_index * PIPES_PER_STAGE + i;
> > +             if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) =
!=3D 0) {
> > +                     valid_pipe++;
> > +                     if (valid_pipe > 1)
> > +                             return false;
> > +
> > +                     if (single_pipe)
> > +                             *single_pipe =3D &pstate->pipe[pipe_idx];
> > +                     if (single_pipe_cfg)
> > +                             *single_pipe_cfg =3D &pstate->pipe_cfg[pi=
pe_idx];
> > +             }
> > +     }
> > +
> > +     return valid_pipe =3D=3D 1;
> > +}
> > +
> >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >                                      struct drm_atomic_state *state,
> >                                      const struct drm_crtc_state *crtc_=
state)
> > @@ -1023,17 +1047,20 @@ static bool dpu_plane_try_multirect_parallel(st=
ruct dpu_sw_pipe *pipe, struct dp
> >  static int dpu_plane_try_multirect_shared(struct dpu_plane_state *psta=
te,
> >                                         struct dpu_plane_state *prev_ad=
jacent_pstate,
> >                                         const struct msm_format *fmt,
> > -                                       uint32_t max_linewidth)
> > +                                       uint32_t max_linewidth, int sta=
ge_index)
> >  {
> > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     struct dpu_sw_pipe *prev_pipe =3D &prev_adjacent_pstate->pipe[0];
> > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg =3D &prev_adjacent_pstate->=
pipe_cfg[0];
> > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> >       const struct msm_format *prev_fmt =3D msm_framebuffer_format(prev=
_adjacent_pstate->base.fb);
> >       u16 max_tile_height =3D 1;
> >
> > -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> > +     if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
> > +                                             &pipe_cfg, stage_index))
> > +             return false;
> > +
> > +     if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
> > +                                             &prev_pipe, &prev_pipe_cf=
g,
> > +                                             stage_index) ||
> >           prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> >               return false;
> >
> > @@ -1048,11 +1075,6 @@ static int dpu_plane_try_multirect_shared(struct=
 dpu_plane_state *pstate,
> >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> >               max_tile_height =3D max(max_tile_height, prev_fmt->tile_h=
eight);
> >
> > -     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > -
> > -     r_pipe->sspp =3D NULL;
> > -
> >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &=
&
> >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_li=
newidth) &&
> >           (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 ||
> > @@ -1181,36 +1203,69 @@ static int dpu_plane_virtual_atomic_check(struc=
t drm_plane *plane,
> >       return 0;
> >  }
> >
> > +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pipe=
,
> > +                                           struct dpu_sw_pipe_cfg *pip=
e_cfg,
> > +                                           struct drm_plane_state *pla=
ne_state,
> > +                                           struct dpu_global_state *gl=
obal_state,
> > +                                           struct drm_crtc *crtc,
> > +                                           struct dpu_rm_sspp_requirem=
ents *reqs)
> > +{
> > +     struct drm_plane *plane =3D plane_state->plane;
> > +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > +     struct dpu_sw_pipe *r_pipe =3D pipe + 1;
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D pipe_cfg + 1;
> > +
> > +     if (drm_rect_width(&pipe_cfg->src_rect) !=3D 0) {
> > +             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global_s=
tate, crtc, reqs);
> > +             if (!pipe->sspp)
> > +                     return -ENODEV;
> > +             pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +             pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +     }
> > +
> > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_pi=
pe_cfg,
> > +                                           pipe->sspp,
> > +                                           msm_framebuffer_format(plan=
e_state->fb),
> > +                                           dpu_kms->catalog->caps->max=
_linewidth))
> > +             goto stage_assinged;
> > +
> > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> > +             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global=
_state, crtc, reqs);
> > +             if (!r_pipe->sspp)
> > +                     return -ENODEV;
> > +             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +     }
> > +
> > +stage_assinged:
> > +     return 0;
> > +}
> > +
> >  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc,
> >                                             struct dpu_global_state *gl=
obal_state,
> >                                             struct drm_atomic_state *st=
ate,
> >                                             struct drm_plane_state *pla=
ne_state,
> > -                                           struct drm_plane_state *pre=
v_adjacent_plane_state)
> > +                                           struct drm_plane_state **pr=
ev_adjacent_plane_state)
> >  {
> >       const struct drm_crtc_state *crtc_state =3D NULL;
> >       struct drm_plane *plane =3D plane_state->plane;
> >       struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >       struct dpu_rm_sspp_requirements reqs;
> > -     struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > +     struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_PER_=
PLANE];
> >       struct dpu_sw_pipe *pipe;
> > -     struct dpu_sw_pipe *r_pipe;
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> >       const struct msm_format *fmt;
> > -     int i;
> > +     int i, ret;
> >
> >       if (plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >                                                          plane_state->c=
rtc);
> >
> >       pstate =3D to_dpu_plane_state(plane_state);
> > -     prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> > -             to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> > -
> > -     pipe =3D &pstate->pipe[0];
> > -     r_pipe =3D &pstate->pipe[1];
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > +     for (i =3D 0; i < STAGES_PER_PLANE; i++)
> > +             prev_adjacent_pstate[i] =3D prev_adjacent_plane_state[i] =
?
> > +                     to_dpu_plane_state(prev_adjacent_plane_state[i]) =
: NULL;
> >
> >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >               pstate->pipe[i].sspp =3D NULL;
> > @@ -1225,42 +1280,27 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >
> >       reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> >
> > -     if (drm_rect_width(&r_pipe_cfg->src_rect) =3D=3D 0) {
> > -             if (!prev_adjacent_pstate ||
> > -                 !dpu_plane_try_multirect_shared(pstate, prev_adjacent=
_pstate, fmt,
> > -                                                 dpu_kms->catalog->cap=
s->max_linewidth)) {
> > -                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, =
global_state, crtc, &reqs);
> > -                     if (!pipe->sspp)
> > -                             return -ENODEV;
> > -
> > -                     r_pipe->sspp =3D NULL;
> > +     for (i =3D 0; i < STAGES_PER_PLANE; i++) {
> > +             if (!prev_adjacent_pstate[i])
> > +                     goto assignment;
> >
> > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > -
> > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > -             }
> > -     } else {
> > -             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global_s=
tate, crtc, &reqs);
> > -             if (!pipe->sspp)
> > -                     return -ENODEV;
> > -
> > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_p=
ipe, r_pipe_cfg,
> > -                                                   pipe->sspp,
> > -                                                   msm_framebuffer_for=
mat(plane_state->fb),
> > -                                                   dpu_kms->catalog->c=
aps->max_linewidth)) {
> > -                     /* multirect is not possible, use two SSPP blocks=
 */
> > -                     r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm=
, global_state, crtc, &reqs);
> > -                     if (!r_pipe->sspp)
> > -                             return -ENODEV;
> > +             if (dpu_plane_try_multirect_shared(pstate, prev_adjacent_=
pstate[i], fmt,
> > +                                                dpu_kms->catalog->caps=
->max_linewidth,
> > +                                                i))
> > +                     continue;
>
>
> if (prev_adjacent_pstate[i] &&
>     dpu_plane_try_multirect_shared())
>         continue;
>
> No need for the goto.

Right, it will be simpler.
>
> >
> > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +assignment:
> > +             if (dpu_plane_get_single_pipe_in_stage(pstate, NULL, NULL=
, i))
> > +                     prev_adjacent_plane_state[i] =3D plane_state;
> >
> > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > -             }
> > +             pipe =3D &pstate->pipe[i * PIPES_PER_STAGE];
> > +             pipe_cfg =3D &pstate->pipe_cfg[i * PIPES_PER_STAGE];
> > +             ret =3D dpu_plane_assign_resource_in_stage(pipe, pipe_cfg=
,
> > +                                                      plane_state,
> > +                                                      global_state,
> > +                                                      crtc, &reqs);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > @@ -1273,7 +1313,7 @@ int dpu_assign_plane_resources(struct dpu_global_=
state *global_state,
> >                              unsigned int num_planes)
> >  {
> >       unsigned int i;
> > -     struct drm_plane_state *prev_adjacent_plane_state =3D NULL;
> > +     struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PLAN=
E] =3D { NULL };
> >
> >       for (i =3D 0; i < num_planes; i++) {
> >               struct drm_plane_state *plane_state =3D states[i];
> > @@ -1284,11 +1324,9 @@ int dpu_assign_plane_resources(struct dpu_global=
_state *global_state,
> >
> >               int ret =3D dpu_plane_virtual_assign_resources(crtc, glob=
al_state,
> >                                                            state, plane=
_state,
> > -                                                          prev_adjacen=
t_plane_state);
> > +                                                          &prev_adjace=
nt_plane_state[0]);
>
> It's exactly the prev_adjacent_plane_state.

Yes, I will change it.

>
> >               if (ret)
> >                       break;
> > -
> > -             prev_adjacent_plane_state =3D plane_state;
> >       }
> >
> >       return 0;
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

