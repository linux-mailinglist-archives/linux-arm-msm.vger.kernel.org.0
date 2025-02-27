Return-Path: <linux-arm-msm+bounces-49592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D35A472FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 03:36:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 960243A75B6
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2025 02:35:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E80FC17A319;
	Thu, 27 Feb 2025 02:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="aTScbvWN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1661AAA1F
	for <linux-arm-msm@vger.kernel.org>; Thu, 27 Feb 2025 02:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740623307; cv=none; b=de/yH5tN6p/Bg39XbgcsU6yji5sB8fX2Ahbg6vQYXUZZ7qpu8N3EWWVjWzpZVafGoUxM7gOTu6b8tPIkSktSZW7of3VQrQd638TPeoG3e3VfrOMQ7wlXx9REq1XexGF3wcGhZ7s0/0JFoRvOxdoMUcqGm/CjDV545hlpBFYr+rI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740623307; c=relaxed/simple;
	bh=2IwoeShS+8777w8LDDQfPZRiiO4sQ2jgRVSu5V6asJo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AOreP7DQfrP9myV3VQrAy32p1ptNlj0fZQfzh06JKrnp754C1+SIn1HG72i0a1JvnzvzWzg3ItfmBNNy9HSCWwe8M134L6WJray0nHlDZHdeZdtOswpoakqKIR/mTO/NsG4/XemZWvyEVMwl0G+bVgg7w3aCekZzz5wVvRsraxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=aTScbvWN; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-6f47ed1f40dso3989567b3.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 26 Feb 2025 18:28:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740623305; x=1741228105; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+EB7jWQq3Iu7TdeP82WsXONnAIkEWSfpBjeFLTA7Wo=;
        b=aTScbvWNbSQ8Xt145keXgyCbs/QcwrE3BV+czlMmJ0ouvzAGE0Z2g80mAF4pq0qMNe
         ejkXKkwEMPXm7T4pzMIf9PI7FCdtFhaov+TIO91GUTbNvyjnM73nPLJqUKYpEGWWL26U
         c0DEfV4N/pkpGiNmCJcw+DRM3jdgoqrPmyZmIv9VoOVN+p6eHxRHMx/JUm9rBUZvgMdE
         FsRTbgTPTqCJm1uBUpOxtcfbrAOu+vmlH9LC7POnEWpH9CxCyKZtQmlCeZxv9jJtxg0k
         +5PrikpOldd4tBuv8VfPKE9J9H8kGjVJhR1kM9KoU6XXdO8MpJ8a6ETYa4TlbAiSSjmC
         L8GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740623305; x=1741228105;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c+EB7jWQq3Iu7TdeP82WsXONnAIkEWSfpBjeFLTA7Wo=;
        b=iCs1/FSxcy7U8l3u9yIw1de6vT5d/OK6mfIcFeD/wSAXa3YfnnZqZdnZM7VS/foB01
         ayUE9hGnF9tBAhaR48al6UCdmtXBWXefx8eRMApvVlv1rvvTs3tsySMIVZdqgd8Hkh7w
         MoKclVSct4bOJlxcEshYAgtcVVoH5sw14uUHmfI0BVsUJEk7OQz0RFBD7DwzQ9+FSqhl
         y30KalNRWNTkoEA9Gj/TDtCfFJO4tj6qH6P/i5z+9L0XI2wrxIaQF3lZMjbNtSwouvDN
         aVTNJzFEj9ko6lL5uLsW2TOXeCUtncTcGyiaNan0HGGTOWrToFu51ZO3Zn+/P6ADa1sc
         jaNg==
X-Forwarded-Encrypted: i=1; AJvYcCULWi4eDsL9GDleByN+p12kaoSEi9GsLPKkuD77AtAQNwT2P6dz28KE0r9itgaSaVLyCpth3p5Z3RrJrYhh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5JEdH/0cW5v/XJjqjcBLJyyNtFRBOHJlN1PwWZQXru9yk+Qgn
	n2IZD2KyRru8ncKGUtTZK/yjMbN1NK24IKbbySMBgm1rpG4dv9PBkdy8DcD7WP/H0gDZuppeCTW
	o999EmyK2fCKZsMjnqUVjYpOy9oZ6wrC6SA7fuQ==
X-Gm-Gg: ASbGnctzlo6lRXkgg49cKWWeumZKVbZGLzl8ORnqbcKP0vAtUB5k2NKumCHzXg2HtzI
	d2/Bn9XtNx3dIhvd96b4hANPGecuB2FNfQ06eJXTSZaPuIqLDwSxgsgixTHEtUt+vTNx40s0vSZ
	BCbuhDQoigRr4Y
X-Google-Smtp-Source: AGHT+IHhKVv5dpkq2UeaSqfSnOfcnlnL6TuQCTD4cvyqPrVQAnRggzlLiwOq7tVlPrhQrKcF2Ctgc6WlCJhUeowZ8ds=
X-Received: by 2002:a05:690c:6c10:b0:6fd:3f9e:b7d6 with SMTP id
 00721157ae682-6fd3f9eb9c3mr2401957b3.19.1740623305059; Wed, 26 Feb 2025
 18:28:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
 <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
 <ca42d2b4-4b0c-48a8-abd5-d34486e62d8e@quicinc.com>
In-Reply-To: <ca42d2b4-4b0c-48a8-abd5-d34486e62d8e@quicinc.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 27 Feb 2025 10:28:14 +0800
X-Gm-Features: AQ5f1JowVzqP1uaVaUOXlAlEzt4gxmePpg27yhK9u6HxV3R8B1XKq0mTgeziKYc
Message-ID: <CABymUCMLH7Sk4fcyAXFXiYN=egfNvEjtJgrUWgeN2+dMpHPdBw@mail.gmail.com>
Subject: Re: [PATCH v7 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jessica Zhang <quic_jesszhan@quicinc.com> =E4=BA=8E2025=E5=B9=B42=E6=9C=882=
7=E6=97=A5=E5=91=A8=E5=9B=9B 02:10=E5=86=99=E9=81=93=EF=BC=9A
>
>
>
> On 2/26/2025 4:31 AM, Jun Nie wrote:
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
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++++++--=
---------
> >   3 files changed, 58 insertions(+), 26 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 0a053c5888262d863a1e549e14e3aa40a80c3f06..9405453cbf5d852e72a5f95=
4cd8c6aed3a222723 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -1366,6 +1366,17 @@ int dpu_crtc_vblank(struct drm_crtc *crtc, bool =
en)
> >       return 0;
> >   }
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
> >   #ifdef CONFIG_DEBUG_FS
> >   static int _dpu_debugfs_status_show(struct seq_file *s, void *data)
> >   {
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.h
> > index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d0=
9e11a43b9b4cf4153 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h
> > @@ -264,4 +264,6 @@ static inline enum dpu_crtc_client_type dpu_crtc_ge=
t_client_type(
> >
> >   void dpu_crtc_frame_event_cb(struct drm_crtc *crtc, u32 event);
> >
> > +unsigned int dpu_crtc_get_num_lm(const struct drm_crtc_state *state);
> > +
> >   #endif /* _DPU_CRTC_H_ */
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/dr=
m/msm/disp/dpu1/dpu_plane.c
> > index d67f2ad20b4754ca4bcb759a65a39628b7236b0f..d1d6c91ed0f8e1c62b757ca=
42546fbc421609f72 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> > @@ -1112,11 +1112,10 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >       struct dpu_rm_sspp_requirements reqs;
> >       struct dpu_plane_state *pstate;
> >       struct dpu_sw_pipe *pipe;
> > -     struct dpu_sw_pipe *r_pipe;
> >       struct dpu_sw_pipe_cfg *pipe_cfg;
> > -     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +     struct dpu_plane *pdpu =3D to_dpu_plane(plane);
> >       const struct msm_format *fmt;
> > -     int i;
> > +     int i, num_lm, stage_id, num_stages;
> >
> >       if (plane_state->crtc)
> >               crtc_state =3D drm_atomic_get_new_crtc_state(state,
> > @@ -1124,11 +1123,6 @@ static int dpu_plane_virtual_assign_resources(st=
ruct drm_crtc *crtc,
> >
> >       pstate =3D to_dpu_plane_state(plane_state);
> >
> > -     pipe =3D &pstate->pipe[0];
> > -     r_pipe =3D &pstate->pipe[1];
> > -     pipe_cfg =3D &pstate->pipe_cfg[0];
> > -     r_pipe_cfg =3D &pstate->pipe_cfg[1];
> > -
> >       for (i =3D 0; i < PIPES_PER_PLANE; i++)
> >               pstate->pipe[i].sspp =3D NULL;
> >
> > @@ -1142,24 +1136,49 @@ static int dpu_plane_virtual_assign_resources(s=
truct drm_crtc *crtc,
> >
> >       reqs.rot90 =3D drm_rotation_90_or_270(plane_state->rotation);
> >
> > -     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global_state, cr=
tc, &reqs);
> > -     if (!pipe->sspp)
> > -             return -ENODEV;
> > -
> > -     if (!dpu_plane_try_multirect_parallel(pipe, pipe_cfg, r_pipe, r_p=
ipe_cfg,
> > -                                           pipe->sspp,
> > -                                           msm_framebuffer_format(plan=
e_state->fb),
> > -                                           dpu_kms->catalog->caps->max=
_linewidth)) {
> > -             /* multirect is not possible, use two SSPP blocks */
> > -             r_pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, global=
_state, crtc, &reqs);
> > -             if (!r_pipe->sspp)
> > -                     return -ENODEV;
> > -
> > -             pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -             pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > -
> > -             r_pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > -             r_pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +     num_lm =3D dpu_crtc_get_num_lm(crtc_state);
>
> Hi Jun,
>
> Just wondering, why not use dpu_rm_get_assigned_resources() here instead
> of adding a new *_get_num_lm() API?
>
> Thanks,
>
> Jessica Zhang
>
It is overkill to loop over allocated resource to just get the number.
That's comments
from Dmitry if I am not wrong.

Regards,
Jun

