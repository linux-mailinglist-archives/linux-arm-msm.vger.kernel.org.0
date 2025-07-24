Return-Path: <linux-arm-msm+bounces-66409-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C4E8B0FE88
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 03:56:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5DF023A131A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jul 2025 01:56:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EEF82192B66;
	Thu, 24 Jul 2025 01:56:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nWvoHc5H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5E6328399
	for <linux-arm-msm@vger.kernel.org>; Thu, 24 Jul 2025 01:56:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753322197; cv=none; b=SBTT0tHemHMNRMHLiZGCC1HSSCVD6fZeWclA44vQgkiYjbttkzhuSwsg3Ft1Ygw86G/Xl4L94jz22czqd9TFeM3iNVt8EvAmHtKq6PLnTVcDdteswKFdCiDuMtVePurxhCdLDPnfFAljEMYkq0NXP3feAks+uSq9cjarBt7T7aM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753322197; c=relaxed/simple;
	bh=88eVhsWBrhwxUxwnkw20APa33djZPp+dMXtlFKhWZpU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PQymXmOT4lzN3TA46onexFulMB/RzDWTfWElk9dXp1GSpU7vOIGYgeDHIGUAHQUN+JdB69nA8Rzf/krU57JvYDa70RTaLxY3OyT2kxFGqrZIiEJ/D+1BVfOQb9EJWHES3ULXp4OgzO0d+1VcH9pMQ+kekijNSqzkGAcde9tdZRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nWvoHc5H; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e8bbb02b887so335974276.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Jul 2025 18:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753322194; x=1753926994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YOLfWvZXIi1bXtQsm6sEiFLMn1a8WPbYK1vjSZWD4IQ=;
        b=nWvoHc5HizdihS85TqL4/fjrGw0FZdgoUIELcnZgq9EldKwAqnrc3TiK7ISsysPU0H
         T5wpCI/3iSVKOm3V76fF1T7NsntBJwikZGrg5YhXjuo3xWS2KUAfWgEnfSQy0s2nVjnV
         W6ymc20IZuVj0gqzAyBvkj+/xHjBiTgcTeIkYPHrGALNITA7JYsFKQjs7ddmB7/ySo+e
         +jrRPG9eM9xD1ka4RIh55cUDbXN5Zqn2p+Kn6dlmRlbaKgcmYH7NZ6pU679haBQsJL2S
         Xr0P1YWvLU3R2N7H2ptv/lNqNq5HETlKQPR2Azvlk0CNiUbZz6jX1mVtCIv8q44Nxnmz
         uzYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753322194; x=1753926994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YOLfWvZXIi1bXtQsm6sEiFLMn1a8WPbYK1vjSZWD4IQ=;
        b=unYTg8P/3H4Jo/bdLPTUdxRdQgzEGsK1bYlDDdjH3SQ28YtgkE1pjhdrgleV1l/2Ar
         fhLUeNgz+JxpZ7ogzBmdNwPDE350eb6q6qdaqU8xF2oQ0QG3ZTE0torKS1f+/wXqL9AL
         kbv4dov1DO/gIos3F7gPJXfgQ/oLQgqEgFCtdM12gCD48nHlalhsqtv0sd9NB0lcJk0U
         7rgDQDwDuY8BTfVnTx8yRJjVbhYnbIgVD9Ar3O66PG1Dq7V+W2XXXqgP1S6pDynCEmfB
         /Fmv5STN5EK+dxNViO+DWjjBQ1jXCEdkhvwTwg72ME4vYdQG+7rx4tz7bwjhkyfYGY6Y
         Xi7w==
X-Forwarded-Encrypted: i=1; AJvYcCVGoBpOR/ZYp69Hq1vI5mqKESq1GFn0/ZZekmpSmaYD44PsaQzQqK3b2fqHnVEdfOKuZq/R+Vrb9mzXbKh2@vger.kernel.org
X-Gm-Message-State: AOJu0YxRyCkkmYQyQZ2xTZHTi9EZ6P748yi3Eoa/HaZNeFj7RAhg3IDs
	MdTnFFWwDntG0mbr2jLPoHOW6qpHgcpPOpV5nAjZbPn4BUWOvCzql1q3ZQFzmv0I826dmElErmZ
	Aiqna3ToSk1oyARmAb+rcjzXMR0ZZBzNXmkrMHSyo6w==
X-Gm-Gg: ASbGnctRys08WvQl9aejnLvmLhnXhkpRTvQ5QsNtuL6JaBeIOyXpQdC/+y1DD78ATWD
	bzqwSZ7uTmnNiVHH8WIhrZppdvjgzQI5Z5V5wduxiNuV0Ue9NpgYHyBoek2dzkq9mOwrePlILwX
	3sElrYAnphR+bB6vwN68owotOspHOH5pb47ncIIg7aqlZ9v2My7j9EE798ZZp6fd0jiRw3XZQUa
	4IxMhVd8X6tALNc/Q==
X-Google-Smtp-Source: AGHT+IE3aNPu4epCKeBz9TfCW7Jg6WVpqjMnhJsKdNXfaxWgU6NabDiWgLOJJ6GhLV96ByPIrDZSCFE6rARdNR3ARMg=
X-Received: by 2002:a05:690c:7084:b0:708:be8b:841e with SMTP id
 00721157ae682-719b433cbb2mr69994687b3.36.1753322193618; Wed, 23 Jul 2025
 18:56:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
 <20250707-v6-16-rc2-quad-pipe-upstream-v12-10-67e3721e7d83@linaro.org>
 <khu6gwzn7gulubwoshdutl4d2nu3c6exnkv4cimjljc5wbxf7l@ho4gxsolq3hn>
 <CABymUCPhjugvyQ2KQabjTn3XNEDRSnQgRX5te-tHKT8hBLPdMQ@mail.gmail.com> <bxual3dbzffgbe6vziwumaqpyxrnjbvnljy2pg2o5mtgixufbm@mjvg5em2xklf>
In-Reply-To: <bxual3dbzffgbe6vziwumaqpyxrnjbvnljy2pg2o5mtgixufbm@mjvg5em2xklf>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 24 Jul 2025 09:56:21 +0800
X-Gm-Features: Ac12FXx1caG2qAaxZT0HB5wYp9EX_aKTJtG2R6dSGdEAkMaAeQ9pAlH_ISLWYKU
Message-ID: <CABymUCOgnOMTM=XYEMbE_8h_x+zeC1OnMKGMH5ZEP+Zuhz4PKw@mail.gmail.com>
Subject: Re: [PATCH v12 10/12] drm/msm/dpu: support SSPP assignment for
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
7=E6=9C=8822=E6=97=A5=E5=91=A8=E4=BA=8C 20:04=E5=86=99=E9=81=93=EF=BC=9A
>
> On Mon, Jul 21, 2025 at 04:06:13PM +0800, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B47=E6=9C=8819=E6=97=A5=E5=91=A8=E5=85=AD 18:09=E5=86=99=E9=81=93=EF=BC=
=9A
> > >
> > > On Mon, Jul 07, 2025 at 02:18:05PM +0800, Jun Nie wrote:
> > > > Currently, SSPPs are assigned to a maximum of two pipes. However,
> > > > quad-pipe usage scenarios require four pipes and involve configurin=
g
> > > > two stages. In quad-pipe case, the first two pipes share a set of
> > > > mixer configurations and enable multi-rect mode when certain
> > > > conditions are met. The same applies to the subsequent two pipes.
> > > >
> > > > Assign SSPPs to the pipes in each stage using a unified method and
> > > > to loop the stages accordingly.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 143 ++++++++++++++++++=
+-----------
> > > >  1 file changed, 89 insertions(+), 54 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_plane.c
> > > > index 149e7066480b07f9f6d422748d89ffd6f9416f33..ecfebf7a2406d659300=
75cc2a4b8a8a7d40b3d3c 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > > > @@ -954,6 +954,30 @@ static int dpu_plane_is_multirect_parallel_cap=
able(struct dpu_hw_sspp *sspp,
> > > >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_line=
width);
> > > >  }
> > > >
> > > > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *psta=
te,
> > > > +                                   struct dpu_sw_pipe **single_pip=
e,
> > > > +                                   struct dpu_sw_pipe_cfg **single=
_pipe_cfg,
> > > > +                                   int *stage_index)
> > > > +{
> > > > +     int stage_idx, pipe_idx, i, valid_pipe =3D 0;
> > > > +
> > > > +     for (stage_idx =3D 0; stage_idx < STAGES_PER_PLANE; stage_idx=
++) {
> > > > +             for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> > > > +                     pipe_idx =3D stage_idx * PIPES_PER_STAGE + i;
> > > > +                     if (drm_rect_width(&pstate->pipe_cfg[pipe_idx=
].src_rect) !=3D 0) {
> > > > +                             valid_pipe++;
> > > > +                             if (valid_pipe > 1)
> > > > +                                     return false;
> > > > +
> > > > +                             *single_pipe =3D &pstate->pipe[pipe_i=
dx];
> > > > +                             *single_pipe_cfg =3D &pstate->pipe_cf=
g[pipe_idx];
> > > > +                             *stage_index =3D stage_idx;
> > > > +                     }
> > > > +             }
> > > > +     }
> > > > +
> > > > +     return valid_pipe =3D=3D 1;
> > > > +}
> > > >
> > > >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> > > >                                      struct drm_atomic_state *state=
,
> > > > @@ -1021,18 +1045,23 @@ static int dpu_plane_try_multirect_shared(s=
truct dpu_plane_state *pstate,
> > > >                                         const struct msm_format *fm=
t,
> > > >                                         uint32_t max_linewidth)
> > > >  {
> > > > -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> > > > -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> > > > -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > -     struct dpu_sw_pipe *prev_pipe =3D &prev_adjacent_pstate->pipe=
[0];
> > > > -     struct dpu_sw_pipe_cfg *prev_pipe_cfg =3D &prev_adjacent_psta=
te->pipe_cfg[0];
> > > > +     struct dpu_sw_pipe *pipe, *prev_pipe;
> > > > +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> > > >       const struct msm_format *prev_fmt =3D msm_framebuffer_format(=
prev_adjacent_pstate->base.fb);
> > > > +     int stage_index, prev_stage_index;
> > > >       u16 max_tile_height =3D 1;
> > > >
> > > > -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> > > > +     if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, &sta=
ge_index))
> > > > +             return false;
> > > > +
> > > > +     if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pi=
pe,
> > > > +                                    &prev_pipe_cfg, &prev_stage_in=
dex) ||
> > > >           prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> > > >               return false;
> > > >
> > > > +     if (stage_index !=3D prev_stage_index)
> > > > +             return false;
> > >
> > > This should be handled other way around: save N pstates and then loop
> > > over stage indices. If there is no rect at the corresponding stage fo=
r a
> > > plane, skip assignment (and use prev_adjacent_pstate for the next pla=
ne).
> >
> > You mean dpu_plane_virtual_assign_resources() shall notify its caller
> > dpu_assign_plane_resources() to skip updating prev_adjacent_plane_state
> > if dpu_plane_try_multirect_shared() return false? If so, we can add an
> > argument "bool pipe_shared" in dpu_plane_virtual_assign_resources() to
> > get the status. But that is an optimization to share pipes across multi=
ple
> > planes. Can we add new patches based on current patch set later?
> >
> > Or my understanding is not aligned with your thoughts?
>
> Not quite. I think we need to store all NUM_STAGES 'prev_adjancent' state=
s and
> update them as the driver loops through the stages for each plane.
>

I see. So the prev_adjacent_plane_state in dpu_assign_plane_resources()
shall be converted into an array, and map to prev_adjacent_pstate[N] in
dpu_plane_virtual_assign_resources(). Then check new single pipe plane
vs every member in the prev_adjacent_pstate[N] to confirm stage index is
aligned before sharing SSPP.  Right?

If so, that is the optimization for the dual stage case. It does not introd=
uce
regression to the existing single stage case with current implementation.
Can we just merge this patch first, then add the optimization for the
dual stages case in new patch set? As this patch set focus on quad-pipe
with 2 stages, without hurting existing usage cases. And it changes lots
of code and involve rebase effort from time to time. While the optimization
for the dual stage case will limit the change in plane, though several revi=
ew
cycle may be needed.

Regards,
Jun

> > > > +
> > > >       if (!dpu_plane_is_multirect_capable(pipe->sspp, pipe_cfg, fmt=
) ||
> > > >           !dpu_plane_is_multirect_capable(prev_pipe->sspp, prev_pip=
e_cfg, prev_fmt))
> > > >               return false;
> > > > @@ -1043,11 +1072,6 @@ static int dpu_plane_try_multirect_shared(st=
ruct dpu_plane_state *pstate,
> > > >       if (MSM_FORMAT_IS_UBWC(prev_fmt))
> > > >               max_tile_height =3D max(max_tile_height, prev_fmt->ti=
le_height);
> > > >
> > > > -     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > > -
> > > > -     r_pipe->sspp =3D NULL;
> > > > -
> > > >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidt=
h) &&
> > > >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, ma=
x_linewidth) &&
> > > >           (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 ||
> > > > @@ -1176,6 +1200,44 @@ static int dpu_plane_virtual_atomic_check(st=
ruct drm_plane *plane,
> > > >       return 0;
> > > >  }
> > > >
> > > > +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *=
pipe,
> > > > +                                           struct dpu_sw_pipe_cfg =
*pipe_cfg,
> > > > +                                           struct drm_plane_state =
*plane_state,
> > > > +                                           struct dpu_global_state=
 *global_state,
> > > > +                                           struct drm_crtc *crtc,
> > > > +                                           struct dpu_rm_sspp_requ=
irements *reqs)
> > > > +{
> > > > +     struct drm_plane *plane =3D plane_state->plane;
> > > > +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > > > +     struct dpu_sw_pipe *r_pipe =3D pipe + 1;
> > > > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D pipe_cfg + 1;
> > > > +
> > > > +     if (drm_rect_width(&pipe_cfg->src_rect) !=3D 0) {
> > > > +             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, glob=
al_state, crtc, reqs);
> > > > +             if (!pipe->sspp)
> > > > +                     return -ENODEV;
> > > > +     }
> > > > +
> > > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> > > > +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, =
r_pipe_cfg,
> > > > +                                           pipe->sspp,
> > > > +                                           msm_framebuffer_format(=
plane_state->fb),
> > > > +                                           dpu_kms->catalog->caps-=
>max_linewidth)) {
> > > > +             goto stage_assinged;
> > > > +     }
> > > > +
> > > > +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> > > > +             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, gl=
obal_state, crtc, reqs);
> > > > +             if (!r_pipe->sspp)
> > > > +                     return -ENODEV;
> > > > +             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > +             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > > > +     }
> > > > +
> > > > +stage_assinged:
> > > > +     return 0;
> > > > +}
> > > > +
> > > >  static int dpu_plane_virtual_assign_resources(struct drm_crtc *crt=
c,
> > > >                                             struct dpu_global_state=
 *global_state,
> > > >                                             struct drm_atomic_state=
 *state,
> > > > @@ -1188,11 +1250,9 @@ static int dpu_plane_virtual_assign_resource=
s(struct drm_crtc *crtc,
> > > >       struct dpu_rm_sspp_requirements reqs;
> > > >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> > > >       struct dpu_sw_pipe *pipe;
> > > > -     struct dpu_sw_pipe *r_pipe;
> > > >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > > > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > > >       const struct msm_format *fmt;
> > > > -     int i;
> > > > +     int i, stage_id, ret;
> > > >
> > > >       if (plane_state->crtc)
> > > >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > > > @@ -1202,11 +1262,6 @@ static int dpu_plane_virtual_assign_resource=
s(struct drm_crtc *crtc,
> > > >       prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> > > >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> > > >
> > > > -     pipe =3D &pstate->pipe[0];
> > > > -     r_pipe =3D &pstate->pipe[1];
> > > > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > > > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > > > -
> > > >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> > > >               pstate->pipe[i].sspp =3D NULL;
> > > >
> > > > @@ -1220,44 +1275,24 @@ static int dpu_plane_virtual_assign_resourc=
es(struct drm_crtc *crtc,
> > > >
> > > >       reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> > > >
> > > > -     if (drm_rect_width(&r_pipe_cfg->src_rect) =3D=3D 0) {
> > > > -             if (!prev_adjacent_pstate ||
> > > > -                 !dpu_plane_try_multirect_shared(pstate, prev_adja=
cent_pstate, fmt,
> > > > -                                                 dpu_kms->catalog-=
>caps->max_linewidth)) {
> > > > -                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->=
rm, global_state, crtc, &reqs);
> > > > -                     if (!pipe->sspp)
> > > > -                             return -ENODEV;
> > > > -
> > > > -                     r_pipe->sspp =3D NULL;
> > > > -
> > > > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> > > > -
> > > > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOL=
O;
> > > > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT=
_NONE;
> > > > -             }
> > > > -     } else {
> > > > -             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, glob=
al_state, crtc, &reqs);
> > > > -             if (!pipe->sspp)
> > > > -                     return -ENODEV;
> > > > -
> > > > -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg,=
 r_pipe, r_pipe_cfg,
> > > > -                                                   pipe->sspp,
> > > > -                                                   msm_framebuffer=
_format(plane_state->fb),
> > > > -                                                   dpu_kms->catalo=
g->caps->max_linewidth)) {
> > > > -                     /* multirect is not possible, use two SSPP bl=
ocks */
> > > > -                     r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms=
->rm, global_state, crtc, &reqs);
> > > > -                     if (!r_pipe->sspp)
> > > > -                             return -ENODEV;
> > > > -
> > > > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > > > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> > > > +     if (prev_adjacent_pstate &&
> > > > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_psta=
te, fmt,
> > > > +                                         dpu_kms->catalog->caps->m=
ax_linewidth)) {
> > > > +             goto assigned;
> > > > +     }
> > > >
> > > > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOL=
O;
> > > > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT=
_NONE;
> > > > -             }
> > > > +     for (stage_id =3D 0; stage_id < STAGES_PER_PLANE; stage_id++)=
 {
> > > > +             pipe =3D &pstate->pipe[stage_id * PIPES_PER_STAGE];
> > > > +             pipe_cfg =3D &pstate->pipe_cfg[stage_id * PIPES_PER_S=
TAGE];
> > > > +             ret =3D dpu_plane_assign_resource_in_stage(pipe, pipe=
_cfg,
> > > > +                                                      plane_state,
> > > > +                                                      global_state=
,
> > > > +                                                      crtc, &reqs)=
;
> > > > +             if (ret)
> > > > +                     return ret;
> > > >       }
> > > >
> > > > +assigned:
> > > >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> > > >  }
> > > >
> > > >
> > > > --
> > > > 2.34.1
> > > >
> > >
> > > --
> > > With best wishes
> > > Dmitry
>
> --
> With best wishes
> Dmitry

