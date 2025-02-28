Return-Path: <linux-arm-msm+bounces-49849-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 18263A49A0B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 13:56:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 1DD113B3B32
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2025 12:56:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8674E26B2DE;
	Fri, 28 Feb 2025 12:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oklBksJg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FD6726B2C2
	for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740747386; cv=none; b=F4lP3yzL7qyGcpt9AonGCI4ztvSIfozvgyNcnmLKWw85sFiErG21rNtr6cri5hL3IEX7ikzQ7TaqGNs+rKCMhslsSseQ3TXMbvdYMTcy4GtkOfbWqt5OD0wx83ZOoOdhpAHvWCEVSB0kRSXVOf40qODwueIDg7RyH0TJsxmt1b0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740747386; c=relaxed/simple;
	bh=QcUuATZDqaDCzqXNwCHDnbt5KpfVTBt3fQo8n4omq/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cm9W9V5jQ6BPmfdwxtjrtNJGEIxbyF+iJ43nq+LJcQrwzCbbvt9CsqOGb2Ckoxu9HTHiKARtdZUYUFQOIfRcDd6OOCFsYZs9HvayFQuSrg7ACKfDuMB2zoxn/m5aCf7MXGAMtYrf6a8P8ppFsQguGGvB4KJELlruqIqzXP5w994=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oklBksJg; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e3c8ae3a3b2so1563261276.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Feb 2025 04:56:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740747382; x=1741352182; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTGCywFA/lKJ54Foy65iVuZAtehZv+71I6e9CYX3m94=;
        b=oklBksJgi/CG2HzA97Dv7IM8uvDXc66qa/iJ2Ftv7R7RfG0DYtIbMdgXuzgRGAfnAo
         v59Tu13cW3LCZ+cDLUsYLwd8mRjLYHdSCUCjkIvEDUmW3hN10okMrbxkSszD8n9iOzqZ
         WV3wHUmOsiE5AP33cw0KI4gSufp+14HibCmlnygx+W7buI+dQVftQHWcGEy2yKOZWZhd
         W97tBRCDRVkECpkIWTlFaDv9/kzMgEY2qbxKXJoPMuIyKLgDXUtoma2YChCMB8kpZtFe
         0K29jtjX+MdfrxfUttmgPP/8qm+bFSMUWsbww7Ve+JefhfF4msEJ9BIANbl8Zh14oX72
         Gh4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740747382; x=1741352182;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTGCywFA/lKJ54Foy65iVuZAtehZv+71I6e9CYX3m94=;
        b=f9Hb/h6LHVFTWZqxP1kkZbsX0mLw3S3T/iyKvj8OKznV4tybWACSnyhjMKdXZywuvi
         U5U4CwIkXDYCZ+TUAxM4M5LYaAk0GpfirxP+5s2Gi5Sp4Qqu0d4n5xMbqDQNWJS97jCm
         SsA7mkFMNXJs4/xvfHHQ7FJGmBfnJTmFNFBDQqagM0Q/a1VvNJ9wzAujNQamIRSmkCv4
         IlON1E5iieCLVdIZ+5FmVYvXu8yuZ+q3gxCqtv8bnp2kh/48TE67UUmGUGMvNuixWmUc
         fxccB3ALNsiM+PLCm87i3YVfvjDBrV26MqLW5iGY5DqANe/w39LfDWMLfkBfDWkUlNBR
         wfqA==
X-Forwarded-Encrypted: i=1; AJvYcCWHo6R31qSMcDQNtp93X9wDwDvfv/1agsThDiW6fPZN9BrHXbHXUeTxQDquknBzdzCcFq1gyoXFVkhxtdIA@vger.kernel.org
X-Gm-Message-State: AOJu0YwSFgQzsFdf4CoZzMpo1uAy8CNhced0i9q8KvpkOGoAvEC/DvPj
	Z3UVESYcs7hBmfPPNOY2NniUi85h1TvvjzEZ82eqyzHTc7K6c85bfaveLVypjoYfUUOUsqIJl5m
	1x+CHV9KlUe0k32JCQJyuLHTeVpLrsHk/3Z3Q1Q==
X-Gm-Gg: ASbGncssTXFcdY0R/U5dDG+PPUuVq0ysWOujNHV9f3UKuDna/Rl7oW/i7CRdYHSlSBW
	GOABGPxhOj69UiBjGdnrO+bfyA8fw933lCbv0By6JgHdZp8hoCWvd1fkdi4NGsPpnD8YnyFHKcl
	gf6iYAIv0=
X-Google-Smtp-Source: AGHT+IEgx8PWrXk4YwKsz1DBhe40DKB5Jr6qJyXMx6+X/MoJZz0+V/5dbn2iAtmsHRF32R5oGfjBLaMrRbF4zGOeWbI=
X-Received: by 2002:a05:6902:26c9:b0:e60:983e:f3d6 with SMTP id
 3f1490d57ef6-e60b2eb2a54mr3178855276.22.1740747382106; Fri, 28 Feb 2025
 04:56:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-0-8d5f5f426eb2@linaro.org>
 <20250226-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v7-13-8d5f5f426eb2@linaro.org>
 <ca2xiobwbga3bet6u4ktsyo62p2l7vvzetkyzkr7ovu6soo4fb@uprexbwa7z6w>
In-Reply-To: <ca2xiobwbga3bet6u4ktsyo62p2l7vvzetkyzkr7ovu6soo4fb@uprexbwa7z6w>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 28 Feb 2025 20:56:11 +0800
X-Gm-Features: AQ5f1JqP-1M6CXkD__nuPqEW9QDJY_QB45QigdFKQ_yi2VAR4ssCX691WtTs-2E
Message-ID: <CABymUCMuEY5XGyVuZ4OXLKenawRSTWn6Mk6VgBtz0-0oCMPC_A@mail.gmail.com>
Subject: Re: [PATCH v7 13/15] drm/msm/dpu: support SSPP assignment for
 quad-pipe case
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jessica Zhang <quic_jesszhan@quicinc.com>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2025=E5=B9=B42=E6=
=9C=8828=E6=97=A5=E5=91=A8=E4=BA=94 12:39=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Feb 26, 2025 at 08:31:02PM +0800, Jun Nie wrote:
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
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c  | 11 +++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h  |  2 +
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c | 71 ++++++++++++++++++++---=
--------
> >  3 files changed, 58 insertions(+), 26 deletions(-)
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
> > index 0b148f3ce0d7af80ec4ffcd31d8632a5815b16f1..b14bab2754635953da402d0=
9e11a43b9b4cf4153 100644
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
> > +     num_stages =3D (num_lm + 1) / 2;
> > +     for (stage_id =3D 0; stage_id < num_stages; stage_id++) {
> > +             for (i =3D stage_id * PIPES_PER_STAGE; i < (stage_id + 1)=
 * PIPES_PER_STAGE; i++) {
> > +                     struct dpu_sw_pipe *r_pipe;
> > +                     struct dpu_sw_pipe_cfg *r_pipe_cfg;
> > +
> > +                     pipe =3D &pstate->pipe[i];
> > +                     pipe_cfg =3D &pstate->pipe_cfg[i];
> > +
> > +                     if (drm_rect_width(&pipe_cfg->src_rect) =3D=3D 0)
> > +                             break;
> > +
> > +                     pipe->sspp =3D dpu_rm_reserve_sspp(&dpu_kms->rm, =
global_state, crtc, &reqs);
> > +                     if (!pipe->sspp)
> > +                             return -ENODEV;
> > +
> > +                     /* use solo SSPP for the 2nd pipe in pipe pair */
> > +                     if (i % PIPES_PER_STAGE !=3D 0)
> > +                             goto use_solo_sspp;
>
> With this in place, do we need the nested loops? Wouldn't it be enough
> to loop through the all pipes in a single run, as this condition will
> force solo SSPP for the second pipes?

Yeah, the internal loop for the 2 pipe in the stage can be expanded
and assign SSPP
directly if fail to use multi-rect mode. Will work on that.


Jun

>
> > +
> > +                     /*
> > +                      * Check multi-rect opportunity for the 2nd pipe =
in the
> > +                      * pair. SSPP multi-rect mode cross mixer pairs i=
s not
> > +                      * supported.
> > +                      */
> > +                     r_pipe =3D &pstate->pipe[i + 1];
> > +                     r_pipe_cfg =3D &pstate->pipe_cfg[i + 1];
> > +
> > +                     if (drm_rect_width(&r_pipe_cfg->src_rect) !=3D 0 =
&&
> > +                         dpu_plane_try_multirect_parallel(pipe, pipe_c=
fg, r_pipe, r_pipe_cfg,
> > +                                                           pipe->sspp,
> > +                                                           msm_framebu=
ffer_format(plane_state->fb),
> > +                                                           dpu_kms->ca=
talog->caps->max_linewidth)) {
> > +                             i++;
> > +                             continue;
> > +                     }
> > +use_solo_sspp:
> > +                     pipe->multirect_index =3D DPU_SSPP_RECT_SOLO;
> > +                     pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_NONE;
> > +                     DPU_DEBUG_PLANE(pdpu, "allocating sspp_%d for pip=
e %d.\n",
> > +                                     pipe->sspp->idx - SSPP_NONE, i);
> > +             }
> >       }
> >
> >       return dpu_plane_atomic_check_sspp(plane, state, crtc_state);
> >
> > --
> > 2.34.1
> >
>
> --
> With best wishes
> Dmitry

