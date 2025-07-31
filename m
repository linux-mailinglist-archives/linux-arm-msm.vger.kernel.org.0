Return-Path: <linux-arm-msm+bounces-67259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6C9B17406
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 17:37:32 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 519FB1893CEB
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Jul 2025 15:37:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B513197A6C;
	Thu, 31 Jul 2025 15:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ynag0YfK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE419142E7C
	for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 15:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753976248; cv=none; b=fCqaEQmPIjodNxjdRMpB4PM15UQloW8lnBsbFk3jleQ3uftzAjP5XXz8MQUoyJ2GsmWSbmFcAv940gZJnHx7q/43habBdKNcbziNUTNLpW0qzkq6qNchh5tNGLcoHgZ9kw6sbKtoSgvYoL+PU+yTB+0GgA4Ygm76t+zspL3mmqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753976248; c=relaxed/simple;
	bh=e1K/T8Eh+XatxlZbEXKLBW5RFTbvMh6J5oJVOky2mu0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Gv8CSVEpH6rc+EC4AK+jrx0/ja2peamlyJDTG/lPIIrkI0AJxtBCdzgkd/RAjRqdV2VfNaU9i4JwUUQESU4YBpqKV2AqgmGFFW1G7TKeaUdq/BEGf/oqkmFDB1GjYAYMIFeFB5RrOX7Ho39qP+9uCxUyJm37pcgemWl/jTUvEls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ynag0YfK; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-71a01fea746so11780867b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 31 Jul 2025 08:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1753976246; x=1754581046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x7//2LzAKu11HmoEGbibQ1LX9NI1hrz/gXY6C8TmT6w=;
        b=Ynag0YfKkht4OylPPg9WqXVKQirjlkR06IpifzBw16dBt6HmpBtxJOsqBGWmK98JRr
         EA4oclLIxEcGmVmVaTZ9B0jRQGE5KJ06gP5qdFhfRTLJWRA3N6o7n5f5S5qLOe9qO+m1
         nEZ5qEk3lIrdrAuR0iTY5liOkWrvfrz5Db+3PLauNQ7QKrWw+J1Q1kIXEaE6+3CPeEOF
         REY2YIzqFsVSRselvIJNmuLVjZhdBP5PkZPsTGNvsZ06eVxAhZrEZvrBHmUFeXUUsmxs
         Z8QofejrgbCGodq8Ebe2uEQnSopUqAlfUbv+vyFguB8fA5txtzxSWCqkrBzwvFFd+Cy3
         tOGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753976246; x=1754581046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x7//2LzAKu11HmoEGbibQ1LX9NI1hrz/gXY6C8TmT6w=;
        b=Wbu/I7wRj1t/DYE7VqtlybLtrLO2dXo30HhMGYnkgx1SiuzTS68+d/ieeJJh8DcWIM
         ahtkO2+ejA50WJ90JwKEoSSyTgdRtOVJhwH7Rs2l4SwCSSano4/5OYedLCFqGdvux/do
         Du4dpMxCzHFnxdLxqE8Jo32Th3GvylXHNufG7vORQnN7Cf3/2qStd4+GS3qw6Jrn81D1
         UA1EQkERc2ZIPOo6YSasrODBedrfPzpOXoar/GirDyCR98LtQ9ZOgijvu1AGwiQa6vsW
         W20sXPuPFyGvH2EOaBUSSdRl3HQWjyP+I4jGS4kPVEwNl+xqlz7HfPSkGvgPV/P+ON27
         R5Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWjw2ekv3P6VyQEOTcMOTkYWKssBJ56nMziWYQgaJfZkeijv+xX6vRRhOJh65XYukqQOuC/b+eVMMxMVyj4@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/q/jiXoyWvx7gsFTyS+9aaapw7lJnlg3BqzMVTkET5vQokffi
	wGcM4wjryVzyBUBRbHKVUCtknRZcZTUbUNsHc22Bg+sSdNRRt+96QIRaL6mMxeuEWoKaeV2H6oM
	HmX9PuYwwuBeor8V6UbVawB9s7OJpe1uEnPbZ6PfkLQ==
X-Gm-Gg: ASbGncv0PaVrT34UrQaDO2z2za0f3bodPfT/zKI1KYBAMdpd9tqT3haBbcBIgxEqhaP
	eBmVAx6XZLayjYb5r9II/ZmujqMozOJ7f2YjUx4LxWmF+f+ABA5mH2cu4zIgfXKyKN7NXz0vGF+
	vk6NY3x2vsTU4MbludQ6c5lc5QTixaiRxaS9GSol/RQk2aTdqgDsy2pQ6OcxJFVWJLe0Wy9vnsj
	5g0k+kFsug+3GD/7w==
X-Google-Smtp-Source: AGHT+IESBL+nOLlOE1iMeOWQoaaI0PhLxmwK6WF01fgWpmssAArTOZ70Ah0OCxEGX5/X5yW+9NpNjRDV5p3xQYmyuXU=
X-Received: by 2002:a05:690c:f05:b0:71a:2dc9:a203 with SMTP id
 00721157ae682-71a469cc8f0mr107199247b3.25.1753976245620; Thu, 31 Jul 2025
 08:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
 <20250728-v6-16-rc2-quad-pipe-upstream-v13-10-954e4917fe4f@linaro.org>
 <4dpeif7wynynbsccbhc253wkshuylnsjslsosmrnyld3bmot5l@yqrmpln44qe2>
 <CABymUCMa06E0zavQsKeDw_rjTW5F9o4ancxWuQynMO3wsHKFwA@mail.gmail.com> <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
In-Reply-To: <4c492060-cdde-43c6-8351-d969b0f9322b@oss.qualcomm.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 31 Jul 2025 23:37:14 +0800
X-Gm-Features: Ac12FXwaPDf1p1H6FfT2KsXBNP7Dmag-L9T8Z8cb67--3eJcqBUWEQApLgw6zMw
Message-ID: <CABymUCO63-V7MoWpgCTEV_8R_4rVHM-1=eyRP34=OdKGpYSLDQ@mail.gmail.com>
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
7=E6=9C=8831=E6=97=A5=E5=91=A8=E5=9B=9B 22:22=E5=86=99=E9=81=93=EF=BC=9A
>
> On 31/07/2025 13:52, Jun Nie wrote:
> > Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> =E4=BA=8E2025=E5=
=B9=B47=E6=9C=8831=E6=97=A5=E5=91=A8=E5=9B=9B 02:52=E5=86=99=E9=81=93=EF=BC=
=9A
> >>
> >> On Mon, Jul 28, 2025 at 09:14:34PM +0800, Jun Nie wrote:
> >>> Currently, SSPPs are assigned to a maximum of two pipes. However,
> >>> quad-pipe usage scenarios require four pipes and involve configuring
> >>> two stages. In quad-pipe case, the first two pipes share a set of
> >>> mixer configurations and enable multi-rect mode when certain
> >>> conditions are met. The same applies to the subsequent two pipes.
> >>>
> >>> Assign SSPPs to the pipes in each stage using a unified method and
> >>> to loop the stages accordingly.
> >>>
> >>> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> >>> ---
> >>>   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 160 ++++++++++++++++++-=
-----------
> >>>   1 file changed, 99 insertions(+), 61 deletions(-)
> >>>
> >>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_plane.c
> >>> index 55429f29a4b95594771d930efe42aaa4126f6f07..e1e16a8d5ac55ba52a0f4=
60d62901dced65e3a9e 100644
> >>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> >>> @@ -959,6 +959,30 @@ static int dpu_plane_is_multirect_parallel_capab=
le(struct dpu_hw_sspp *sspp,
> >>>   }
> >>>
> >>>
> >>> +static bool dpu_plane_get_single_pipe_in_stage(struct dpu_plane_stat=
e *pstate,
> >>> +                                            struct dpu_sw_pipe **sin=
gle_pipe,
> >>> +                                            struct dpu_sw_pipe_cfg *=
*single_pipe_cfg,
> >>> +                                            int stage_index)
> >>> +{
> >>> +     int pipe_idx, i, valid_pipe =3D 0;
> >>> +
> >>> +     for (i =3D 0; i < PIPES_PER_STAGE; i++) {
> >>
> >> Why do you need to loop here? Is there a case when pipe 0 is not
> >> assigned, but pipe 1 is?
> >
> > Loop the pipe in a stage to count the valid pipes. If there are 2 valid
> > pipes in stage of the current plane, this function will return false.
> > Or you prefer the below coding?
> >
> > 1029         pipe_idx =3D stage_index * PIPES_PER_STAGE;
> > 1030         if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect) !=
=3D 0 &&
> > 1031             drm_rect_width(&pstate->pipe_cfg[pipe_idx +
> > 1].src_rect) =3D=3D 0) {
>
> Yes, this is better from my POV. But the bigger question is why do you
> need it at all? What is wrong with the existing check? Can it be that
> pipe0 is not used, but pipe1 is used?

There is no case that pipe0 is not used, but pipe1 is used. Existing check
does not filter the plane which contains single pipe in a stage, which can
be a candidate for SSPP sharing. If the stage contains 2 valid pipes or
no valid pipes, it is skipped in dpu_plane_try_multirect_shared(), or it is
skipped to be stored in prev_adjacent_plane_state[].

>
> > 1032                         if (single_pipe)
>
> You don't need these ifs. You always pass a valid pointer.

OK, a valid pointer can be passed though the return value may not be needed=
.
>
> > 1033                                 *single_pipe =3D &pstate->pipe[pip=
e_idx];
> > 1034                         if (single_pipe_cfg)
> > 1035                                 *single_pipe_cfg =3D
> > &pstate->pipe_cfg[pipe_idx];
> > 1036                 return true;
> > 1037         }
> > 1038
> > 1039         return false;
> >
> >>
> >>> +             pipe_idx =3D stage_index * PIPES_PER_STAGE + i;
> >>> +             if (drm_rect_width(&pstate->pipe_cfg[pipe_idx].src_rect=
) !=3D 0) {
> >>> +                     valid_pipe++;
> >>> +                     if (valid_pipe > 1)
> >>> +                             return false;
> >>> +
> >>> +                     if (single_pipe)
> >>> +                             *single_pipe =3D &pstate->pipe[pipe_idx=
];
> >>> +                     if (single_pipe_cfg)
> >>> +                             *single_pipe_cfg =3D &pstate->pipe_cfg[=
pipe_idx];
> >>> +             }
> >>> +     }
> >>> +
> >>> +     return valid_pipe =3D=3D 1;
> >>> +}
> >>> +
> >>>   static int dpu_plane_atomic_check_sspp(struct drm_plane *plane,
> >>>                                       struct drm_atomic_state *state,
> >>>                                       const struct drm_crtc_state *cr=
tc_state)
> >>> @@ -1023,17 +1047,20 @@ static bool dpu_plane_try_multirect_parallel(=
struct dpu_sw_pipe *pipe, struct dp
> >>>   static int dpu_plane_try_multirect_shared(struct dpu_plane_state *p=
state,
> >>>                                          struct dpu_plane_state *prev=
_adjacent_pstate,
> >>>                                          const struct msm_format *fmt=
,
> >>> -                                       uint32_t max_linewidth)
> >>> +                                       uint32_t max_linewidth, int s=
tage_index)
> >>>   {
> >>> -     struct dpu_sw_pipe *pipe =3D &pstate->pipe[0];
> >>> -     struct dpu_sw_pipe *r_pipe =3D &pstate->pipe[1];
> >>> -     struct dpu_sw_pipe_cfg *pipe_cfg =3D &pstate->pipe_cfg[0];
> >>> -     struct dpu_sw_pipe *prev_pipe =3D &prev_adjacent_pstate->pipe[0=
];
> >>> -     struct dpu_sw_pipe_cfg *prev_pipe_cfg =3D &prev_adjacent_pstate=
->pipe_cfg[0];
> >>> +     struct dpu_sw_pipe *pipe, *prev_pipe;
> >>> +     struct dpu_sw_pipe_cfg *pipe_cfg, *prev_pipe_cfg;
> >>>        const struct msm_format *prev_fmt =3D msm_framebuffer_format(p=
rev_adjacent_pstate->base.fb);
> >>>        u16 max_tile_height =3D 1;
> >>>
> >>> -     if (prev_adjacent_pstate->pipe[1].sspp !=3D NULL ||
> >>> +     if (!dpu_plane_get_single_pipe_in_stage(pstate, &pipe,
> >>> +                                             &pipe_cfg, stage_index)=
)
> >>> +             return false;
> >>> +
> >>> +     if (!dpu_plane_get_single_pipe_in_stage(prev_adjacent_pstate,
> >>> +                                             &prev_pipe, &prev_pipe_=
cfg,
> >>> +                                             stage_index) ||
> >>>            prev_pipe->multirect_mode !=3D DPU_SSPP_MULTIRECT_NONE)
> >>>                return false;
> >>>
> >>> @@ -1048,11 +1075,6 @@ static int dpu_plane_try_multirect_shared(stru=
ct dpu_plane_state *pstate,
> >>>        if (MSM_FORMAT_IS_UBWC(prev_fmt))
> >>>                max_tile_height =3D max(max_tile_height, prev_fmt->til=
e_height);
> >>>
> >>> -     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>> -
> >>> -     r_pipe->sspp =3D NULL;
> >>> -
> >>>        if (dpu_plane_is_parallel_capable(pipe_cfg, fmt, max_linewidth=
) &&
> >>>            dpu_plane_is_parallel_capable(prev_pipe_cfg, prev_fmt, max=
_linewidth) &&
> >>>            (pipe_cfg->dst_rect.x1 >=3D prev_pipe_cfg->dst_rect.x2 ||
> >>> @@ -1181,36 +1203,69 @@ static int dpu_plane_virtual_atomic_check(str=
uct drm_plane *plane,
> >>>        return 0;
> >>>   }
> >>>
> >>> +static int dpu_plane_assign_resource_in_stage(struct dpu_sw_pipe *pi=
pe,
> >>> +                                           struct dpu_sw_pipe_cfg *p=
ipe_cfg,
> >>> +                                           struct drm_plane_state *p=
lane_state,
> >>> +                                           struct dpu_global_state *=
global_state,
> >>> +                                           struct drm_crtc *crtc,
> >>> +                                           struct dpu_rm_sspp_requir=
ements *reqs)
> >>> +{
> >>> +     struct drm_plane *plane =3D plane_state->plane;
> >>> +     struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >>> +     struct dpu_sw_pipe *r_pipe =3D pipe + 1;
> >>> +     struct dpu_sw_pipe_cfg *r_pipe_cfg =3D pipe_cfg + 1;
> >>> +
> >>> +     if (drm_rect_width(&pipe_cfg->src_rect) !=3D 0) {
> >>> +             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global=
_state, crtc, reqs);
> >>> +             if (!pipe->sspp)
> >>> +                     return -ENODEV;
> >>> +             pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> +             pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>> +     }
> >>> +
> >>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 &&
> >>> +         dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_=
pipe_cfg,
> >>> +                                           pipe->sspp,
> >>> +                                           msm_framebuffer_format(pl=
ane_state->fb),
> >>> +                                           dpu_kms->catalog->caps->m=
ax_linewidth))
> >>> +             goto stage_assinged;
> >>> +
> >>> +     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0) {
> >>> +             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, glob=
al_state, crtc, reqs);
> >>> +             if (!r_pipe->sspp)
> >>> +                     return -ENODEV;
> >>> +             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> +             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> >>> +     }
> >>> +
> >>> +stage_assinged:
> >>> +     return 0;
> >>> +}
> >>> +
> >>>   static int dpu_plane_virtual_assign_resources(struct drm_crtc *crtc=
,
> >>>                                              struct dpu_global_state =
*global_state,
> >>>                                              struct drm_atomic_state =
*state,
> >>>                                              struct drm_plane_state *=
plane_state,
> >>> -                                           struct drm_plane_state *p=
rev_adjacent_plane_state)
> >>> +                                           struct drm_plane_state **=
prev_adjacent_plane_state)
> >>>   {
> >>>        const struct drm_crtc_state *crtc_state =3D NULL;
> >>>        struct drm_plane *plane =3D plane_state->plane;
> >>>        struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
> >>>        struct dpu_rm_sspp_requirements reqs;
> >>> -     struct dpu_plane_state *pstate, *prev_adjacent_pstate;
> >>> +     struct dpu_plane_state *pstate, *prev_adjacent_pstate[STAGES_PE=
R_PLANE];
> >>>        struct dpu_sw_pipe *pipe;
> >>> -     struct dpu_sw_pipe *r_pipe;
> >>>        struct dpu_sw_pipe_cfg *pipe_cfg;
> >>> -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> >>>        const struct msm_format *fmt;
> >>> -     int i;
> >>> +     int i, ret;
> >>>
> >>>        if (plane_state->crtc)
> >>>                crtc_state =3D drm_atomic_get_new_crtc_state(state,
> >>>                                                           plane_state=
->crtc);
> >>>
> >>>        pstate =3D to_dpu_plane_state(plane_state);
> >>> -     prev_adjacent_pstate =3D prev_adjacent_plane_state ?
> >>> -             to_dpu_plane_state(prev_adjacent_plane_state) : NULL;
> >>> -
> >>> -     pipe =3D &pstate->pipe[0];
> >>> -     r_pipe =3D &pstate->pipe[1];
> >>> -     pipe_cfg =3D &pstate->pipe_cfg[0];
> >>> -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> >>> +     for (i =3D 0; i < STAGES_PER_PLANE; i++)
> >>> +             prev_adjacent_pstate[i] =3D prev_adjacent_plane_state[i=
] ?
> >>> +                     to_dpu_plane_state(prev_adjacent_plane_state[i]=
) : NULL;
> >>>
> >>>        for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >>>                pstate->pipe[i].sspp =3D NULL;
> >>> @@ -1225,42 +1280,27 @@ static int dpu_plane_virtual_assign_resources=
(struct drm_crtc *crtc,
> >>>
> >>>        reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> >>>
> >>> -     if (drm_rect_width(&r_pipe_cfg->src_rect) =3D=3D 0) {
> >>> -             if (!prev_adjacent_pstate ||
> >>> -                 !dpu_plane_try_multirect_shared(pstate, prev_adjace=
nt_pstate, fmt,
> >>> -                                                 dpu_kms->catalog->c=
aps->max_linewidth)) {
> >>> -                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm=
, global_state, crtc, &reqs);
> >>> -                     if (!pipe->sspp)
> >>> -                             return -ENODEV;
> >>> -
> >>> -                     r_pipe->sspp =3D NULL;
> >>> +     for (i =3D 0; i < STAGES_PER_PLANE; i++) {
> >>> +             if (!prev_adjacent_pstate[i])
> >>> +                     goto assignment;
> >>>
> >>> -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> >>> -
> >>> -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> >>> -             }
> >>> -     } else {
> >>> -             pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global=
_state, crtc, &reqs);
> >>> -             if (!pipe->sspp)
> >>> -                     return -ENODEV;
> >>> -
> >>> -             if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r=
_pipe, r_pipe_cfg,
> >>> -                                                   pipe->sspp,
> >>> -                                                   msm_framebuffer_f=
ormat(plane_state->fb),
> >>> -                                                   dpu_kms->catalog-=
>caps->max_linewidth)) {
> >>> -                     /* multirect is not possible, use two SSPP bloc=
ks */
> >>> -                     r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->=
rm, global_state, crtc, &reqs);
> >>> -                     if (!r_pipe->sspp)
> >>> -                             return -ENODEV;
> >>> +             if (dpu_plane_try_multirect_shared(pstate, prev_adjacen=
t_pstate[i], fmt,
> >>> +                                                dpu_kms->catalog->ca=
ps->max_linewidth,
> >>> +                                                i))
> >>> +                     continue;
> >>
> >>
> >> if (prev_adjacent_pstate[i] &&
> >>      dpu_plane_try_multirect_shared())
> >>          continue;
> >>
> >> No need for the goto.
> >
> > Right, it will be simpler.
> >>
> >>>
> >>> -                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NON=
E;
> >>> +assignment:
> >>> +             if (dpu_plane_get_single_pipe_in_stage(pstate, NULL, NU=
LL, i))
> >>> +                     prev_adjacent_plane_state[i] =3D plane_state;
> >>>
> >>> -                     r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> >>> -                     r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_N=
ONE;
> >>> -             }
> >>> +             pipe =3D &pstate->pipe[i * PIPES_PER_STAGE];
> >>> +             pipe_cfg =3D &pstate->pipe_cfg[i * PIPES_PER_STAGE];
> >>> +             ret =3D dpu_plane_assign_resource_in_stage(pipe, pipe_c=
fg,
> >>> +                                                      plane_state,
> >>> +                                                      global_state,
> >>> +                                                      crtc, &reqs);
> >>> +             if (ret)
> >>> +                     return ret;
> >>>        }
> >>>
> >>>        return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >>> @@ -1273,7 +1313,7 @@ int dpu_assign_plane_resources(struct dpu_globa=
l_state *global_state,
> >>>                               unsigned int num_planes)
> >>>   {
> >>>        unsigned int i;
> >>> -     struct drm_plane_state *prev_adjacent_plane_state =3D NULL;
> >>> +     struct drm_plane_state *prev_adjacent_plane_state[STAGES_PER_PL=
ANE] =3D { NULL };
> >>>
> >>>        for (i =3D 0; i < num_planes; i++) {
> >>>                struct drm_plane_state *plane_state =3D states[i];
> >>> @@ -1284,11 +1324,9 @@ int dpu_assign_plane_resources(struct dpu_glob=
al_state *global_state,
> >>>
> >>>                int ret =3D dpu_plane_virtual_assign_resources(crtc, g=
lobal_state,
> >>>                                                             state, pl=
ane_state,
> >>> -                                                          prev_adjac=
ent_plane_state);
> >>> +                                                          &prev_adja=
cent_plane_state[0]);
> >>
> >> It's exactly the prev_adjacent_plane_state.
> >
> > Yes, I will change it.
> >
> >>
> >>>                if (ret)
> >>>                        break;
> >>> -
> >>> -             prev_adjacent_plane_state =3D plane_state;
> >>>        }
> >>>
> >>>        return 0;
> >>>
> >>> --
> >>> 2.34.1
> >>>
> >>
> >> --
> >> With best wishes
> >> Dmitry
>
>
> --
> With best wishes
> Dmitry

