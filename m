Return-Path: <linux-arm-msm+bounces-60154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 48EDEACC940
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 16:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BBFCB166C71
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Jun 2025 14:37:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B0C923816C;
	Tue,  3 Jun 2025 14:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IgCtFXRh"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606DA239561
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Jun 2025 14:37:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961472; cv=none; b=BkBImteNepgKLMqDThMjxhtQlASCaxQZiSS3AB93sYC06PgWs2ohuZ7bsuXLw76vTknV5su5kFVBJ7Y3r5X55SEzE1aFEXuQGyVwXk5bHSe2ZtzSjgcP9sZJohuKXmH/WFmtD7ieLTgWPDDA5a8fyYdiZk1cDhcdEY67Upbm818=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961472; c=relaxed/simple;
	bh=Yq0XsnKKIOJo+oq739yCgtdvIAq0p6mg1G3hLoHWoQ4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gFfJ4ic4+kGXeGUnRkJJ9xfT38i6E2mnbQ4uGKPk+ptucxpCYNOvZGgNXBuCrxTJP2FyuTOmKfSNrLmDrCaLosGFRXmxBjqEY+CYUA2WzoCp4/xnarZJKC1dec8j+Y7rMuQ4NFuRo5TmDlJ/3RwG/bLbc5Yz5wzWpusw7o+PJGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IgCtFXRh; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-70e5d953c0bso63414947b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Jun 2025 07:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748961469; x=1749566269; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzeESyUaIBZBqYNDo6SFtnpaNhypT6hjENGewoqN1qg=;
        b=IgCtFXRhb0UcaN0hZV2zgRu2+zg5OTqWVPjGnVHH6+NPPhvEZFVGcfy+g6aFAhq0FN
         kmjcqRsH0jqMZrBTpeidwQmMcF73vd1pDyJyFQEq5254pQW3Fou3raBTs+oO+OVpUtee
         qeCHbZ/ywaSFGVuVFfeIuI6QhED02A5WQTaPzjwpSPL6iK5IHXv418hY4GIeCAAW/5DT
         jQqSc8stCvjPNfCVZq4pEGxAKdmnG6sLMAjZWePwG8Q8QgVYSbOteB557ALMbml2/qF6
         pou24idwa6mynByHZN20XgOAdd6B9nRAXeSirCfSHe1DvQbK2zbUeIDxbL0jf2j8magt
         y1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961469; x=1749566269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzeESyUaIBZBqYNDo6SFtnpaNhypT6hjENGewoqN1qg=;
        b=hYJR8U/T0SYIuz+6AF3N7C3XAtjOno9SpbG4QK+zpDzIkVJoKEvtGqxxytOQqm/lru
         ZbG/jKhX43nEto4P0cOWFjbT7axW5dHI/Yg/KXcOKdk/4CcWMFojSPjZbKn/6bv/0z4g
         iF1PA/w+e//NvdQxJpbWQB2EJ+KGJFDmMN6iPf+siss+oxS+VG69JrFBda7oGtHIn9Kw
         AVinSG6iHJICl/geLb7UIcNSu8X/rIMPsvsTg6ows6fFDtBJN22mH4imj0tSeuFdlbGW
         1fYRdgxqIX0m0n3/4o90H70tjbcttXy+Etj8UVyzuwVFcNj8LLesDOLaGyMw5S2sLvvz
         1GZQ==
X-Forwarded-Encrypted: i=1; AJvYcCUxXzTUvP8u0UbJ0Zxzcb9jIBbGptGPiukBbYzRiTCJMk9XZg0Lc7opLVnVv2siKLkYrBwO7l3HMwY17Mnv@vger.kernel.org
X-Gm-Message-State: AOJu0YxqMeTrFlGYJyV56jhwdOt16kPhiyk/YwaY84DjhObPktrzFuLG
	p8osViOAB9gU3rGEPioVtG03goy9G8x2Hez8Ug9Z7Hs/MPiztwFv4a7DaulwRYQRG2gEje0Izq5
	UKKvx8QZBeBugTSYvYFUZmNH16lJZjhHq6QbV1iOIyw==
X-Gm-Gg: ASbGncstWizw1D2Luknxtw6rmNn9WibfNw0PC7L2y8jpdGXrDNhWzYUHhX/SXQhwWyY
	X2MWtTQElz4vdx19g5PgSjaloJuwgR7jJSIwNuaNDGAnWpz3mJ3QeG2oNqpkRwCMjtaZILRD2Tp
	7VqRiFAhNrjY+D+BvLLTtlQiTHiAIFC2momVvTvZflxcZprcNFvBa0TE7bYTDVv5/X3kqiEhak2
	Yj/6Q==
X-Google-Smtp-Source: AGHT+IGbJbyfySz4oyx64rgd6YpgRxhrjburjJOx4K3Q2scX/+jXbjO0mZVAbxTq/9BfA3cSSujjvsCXxL1o6IW6tsk=
X-Received: by 2002:a05:690c:46ca:b0:70e:142d:9c6e with SMTP id
 00721157ae682-71057d22a1dmr229834307b3.32.1748961469084; Tue, 03 Jun 2025
 07:37:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
 <20250603-v6-15-quad-pipe-upstream-v11-10-c3af7190613d@linaro.org> <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
In-Reply-To: <dsgnmzswhpht4bewf5wld774riqxffojboujxdf4smutuzmuye@ugyhzv6m7mve>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Jun 2025 22:37:37 +0800
X-Gm-Features: AX0GCFvT9Z3YKQ7OkM4UVgq33vsp0wDpZsLMqF2k69pPCR2HlGMAc5C5t9chGDg
Message-ID: <CABymUCPqypTPh=Ao9PN44eq2_TXODhHd3EtSDeG+J0DcXQN6Eg@mail.gmail.com>
Subject: Re: [PATCH v11 10/12] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=B9=B4=
6=E6=9C=883=E6=97=A5=E5=91=A8=E4=BA=8C 18:21=E5=86=99=E9=81=93=EF=BC=9A
>
> On Tue, Jun 03, 2025 at 03:10:09PM +0800, Jun Nie wrote:
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
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 148 +++++++++++++++++++---=
--------
> >  1 file changed, 94 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index 0bb153a71353ca9eaca138ebbee4cd699414771d..501b6a1bad4a1fee832f15e=
fa7caec136a669da5 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -961,6 +961,33 @@ static int dpu_plane_is_multirect_parallel_capable=
(struct dpu_hw_sspp *sspp,
> >               dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidt=
h);
> >  }
> >
> > +static bool dpu_plane_get_single_pipe(struct dpu_plane_state *pstate,
> > +                                   struct dpu_sw_pipe **single_pipe,
> > +                                   struct dpu_sw_pipe_cfg **single_pip=
e_cfg,
> > +                                   bool config_pipe)
>
> Could you please describe, what does this function do? Why is it
> returning the pipe or configuring a pipe?

It search all pipes. If there is only one valid pipe, return it via
pointer and function returns true.
If the config_pipe flag is set, multirect_index and multirect_mode are
also initialized. See below.
>
> > +{
> > +     int i, valid_pipe =3D 0;
> > +     struct dpu_sw_pipe *pipe;
> > +
> > +     for (i =3D 0; i < PIPES_PER_PLANE; i++) {
> > +             if (drm_rect_width(&pstate->pipe_cfg[i].src_rect) !=3D 0)=
 {
> > +                     valid_pipe++;
> > +                     if (valid_pipe > 1)
> > +                             return false;
> > +                     *single_pipe =3D &pstate->pipe[i];
> > +                     *single_pipe_cfg =3D &pstate->pipe_cfg[i];
> > +             } else {
> > +                     if (!config_pipe)
> > +                             continue;
> > +                     pipe =3D &pstate->pipe[i];
> > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +                     pipe->sspp =3D NULL;
> > +             }
> > +     }
> > +
> > +     return true;
> > +}
> >
> >  static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >                                      struct drm_atomic_state *state,
> > @@ -1028,15 +1055,15 @@ static int dpu_plane_try_multirect_shared(struc=
t dpu_plane_state *pstate,
> >                                         const struct msm_format *fmt,
> >                                         uint32_t max_linewidth)
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
> > +     if (!dpu_plane_get_single_pipe(pstate, &pipe, &pipe_cfg, true))
> > +             return false;
> > +
> > +     if (!dpu_plane_get_single_pipe(prev_adjacent_pstate, &prev_pipe, =
&prev_pipe_cfg, false) ||
> >           prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> >               return false;
> >
> > @@ -1050,11 +1077,6 @@ static int dpu_plane_try_multirect_shared(struct=
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

Flag in dpu_plane_get_single_pipe() replace the initialization here.

> >       if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth) &=
&
> >           dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max_li=
newidth) &&
> >           (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 ||
> > @@ -1183,6 +1205,51 @@ static int dpu_plane_virtual_atomic_check(struct=
 drm_plane *plane,
> >       return 0;
> >  }
> >
> > +static int dpu_plane_try_multirect_in_stage(struct dpu_sw_pipe *pipe,
> > +                                         struct dpu_sw_pipe_cfg *pipe_=
cfg,
> > +                                         struct drm_plane_state *plane=
_state,
> > +                                         struct dpu_global_state *glob=
al_state,
> > +                                         struct drm_crtc *crtc,
> > +                                         struct dpu_rm_sspp_requiremen=
ts *reqs)
> > +{
> > +     struct drm_plane *plane =3D plane_state->plane;
> > +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> > +     struct dpu_sw_pipe *r_pipe =3D pipe + 1;
> > +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D pipe_cfg + 1;
> > +     int i;
> > +
> > +     for (i =3D 0; i < PIPES_PER_STAGE; i++, pipe++, pipe_cfg++) {
> > +             if (drm_rect_width(&pipe_cfg->src_rect) =3D=3D 0)
> > +                     continue;
> > +
> > +             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global_s=
tate, crtc, reqs);
> > +             if (!pipe->sspp)
> > +                     return -ENODEV;
> > +
> > +             /*
> > +              * If current pipe is the first pipe in a stage, check
> > +              * multi-rect opportunity for the 2nd pipe in the stage.
> > +              * SSPP multi-rect mode cross stage is not supported.
> > +              */
> > +             if (!i &&
>
> Unroll the loop. I think I've asked a similar change in the review of
> the previous patch.

I had thought you want to abstract handling to stage into a dedicated funct=
ion,
not aware you want to remove loop. Will do that in next version.
>
> > +                 drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> > +                 dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pi=
pe, r_pipe_cfg,
> > +                                                   pipe->sspp,
> > +                                                   msm_framebuffer_for=
mat(plane_state->fb),
> > +                                                   dpu_kms->catalog->c=
aps->max_linewidth)) {
> > +                     goto stage_assinged;
> > +             } else {
> > +                     /* multirect is not possible, use dedicated SSPP =
*/
> > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +             }
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
> > @@ -1195,11 +1262,9 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       struct dpu_rm_sspp_requirements reqs;
> >       struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> >       struct dpu_sw_pipe *pipe;
> > -     struct dpu_sw_pipe *r_pipe;
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> >       const struct msm_format *fmt;
> > -     int i;
> > +     int i, stage_id, ret;
> >
> >       if (plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > @@ -1209,11 +1274,6 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >       prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> >               to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> >
> > -     pipe =3D &pstate->pipe[0];
> > -     r_pipe =3D &pstate->pipe[1];
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -
> >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >               pstate->pipe[i].sspp =3D NULL;
> >
> > @@ -1227,44 +1287,24 @@ static int dpu_plane_virtual_assign_resources(s=
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
> > -
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
> > -
> > -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +     if (prev_adjacent_pstate &&
> > +         dpu_plane_try_multirect_shared(pstate, prev_adjacent_pstate, =
fmt,
> > +                                         dpu_kms->catalog->caps->max_l=
inewidth)) {
>
> And this needs to take care of LMs. prev_adjacent_pstate should be
> per-stage, otherwise you can end up sharing the SSPPs between stages
> (which is not allowed).

Thanks for the reminder! I do miss the case here. Will get stage_id of 2
single pipes of 2 plane and check them to confirm whether SSPP can be share=
d.

>
> > +             goto assigned;
> > +     }
> >
> > -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> > -             }
> > +     for (stage_id =3D 0; stage_id < STAGES_PER_PLANE; stage_id++) {
> > +             pipe =3D &pstate->pipe[stage_id * PIPES_PER_STAGE];
> > +             pipe_cfg =3D &pstate->pipe_cfg[stage_id * PIPES_PER_STAGE=
];
> > +             ret =3D dpu_plane_try_multirect_in_stage(pipe, pipe_cfg,
> > +                                                    plane_state,
> > +                                                    global_state,
> > +                                                    crtc, &reqs);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> > +assigned:
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >  }
> >
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

