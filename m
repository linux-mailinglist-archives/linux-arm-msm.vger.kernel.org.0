Return-Path: <linux-arm-msm+bounces-34045-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CC7F999D9C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:13:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 008701F24C2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:13:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8A536209670;
	Fri, 11 Oct 2024 07:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GrweT7X/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D46B920899B
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 07:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630801; cv=none; b=BanfGcLiSAQ8QvYU+YEJ/8LWhksWxzRB2M8cH/3H0Z3YytkBIUb6OyZItk9h+G8LvvCbN5PM44Qydalz2hJVvH4rvgJKmQZSWBmi6uQkBS6+197hfDzo4kYHo41ZxIabcfCP8GzoGVndpeg1+Agtd1FijWYscRR652hveTO5W0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630801; c=relaxed/simple;
	bh=9qXYyL221GKrspzBu5mePpBszokIB5ntvBcKiRaOX/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mbOkQTZqpFUj70DOvyDweQ/Tl5IKRJ/h5WPq0NTmcoN4026d+431jcznQTgkC5LGe3n50sdfrh8JchYprWJr5liP+J3FujKpyjKbB380SIcA5q6/r7qF2XYFHKNdiC8tgZ+zi7ZsVQADbXL0N8yI+3IpzHdtf5jC0irBZXB1SPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GrweT7X/; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-6e2d36343caso14265497b3.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 00:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728630798; x=1729235598; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pVy3cXzl86sH2JLHgiFtJxWYGEOPC7pnAO5jIndLRl4=;
        b=GrweT7X/sFiizTvThbS5VqX+H3MS3AKtjY7OvRHPUuUKoDbtUN8ONRYrQ2LK/4v+Hu
         SKYMAg4OC4P3w749VsFI6WIaon45MsuphIuRS25X2GicZf7w9cmMzPbauIvrlAJX2C47
         q+1vA8tSVo6S4qZuBTtx0DZZLE9vTdwDNdVLu1KI4hNxiW0AFKNRrcohmS2v9RxJqMMt
         TkXVDzr9+WLhob75WN6VMgSvDqGMDISrtzozelYvwyGL2G9Fbp35NfpD6ktReqUKIfVy
         EhfPHqLPTTjfMGSoWqqeE3y27PTjqspIo72wARH6nsUoXyPodXtyNqu10A05wbW7tLxQ
         gqSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630798; x=1729235598;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pVy3cXzl86sH2JLHgiFtJxWYGEOPC7pnAO5jIndLRl4=;
        b=OJOpZfeCcK2mhis+FdZpZpsjY4o4e/6kbPFuX2wV+WcsbnhgEH4vErzCL/cT9aYCGx
         xlFbbhNbuRIVpngKhyGA7mCQq2M8iLuYyaL76GooVUgdc5Kiu7QNqXO3MbplZnhXOjSl
         s0v4oN+5/HA7tChUxA4hqf4Zdd3L8vIuc7slFBSnTsV3blQQhBRcN0CRvBtFW0phrqB4
         T5U9x4qhxcRDOrNoWiUxLI/w9N/ubhH9/l+nRzT32Q70JgTNttE8LGDJOEMd+5ld+fnY
         Pv/YEu9T78l0XtxTxs79Dl/vqYE00sO1IQrDtatNcEzKX2IRUZJh6IsJSyD2ATw0br/r
         CQ0w==
X-Forwarded-Encrypted: i=1; AJvYcCUKPc3W8CCVK1JgTaFyIGIZHt5bDtAaAqdAjzN8DpM3hebf+VDwa4nvAGEdf9DLXEIzH9N6hPIsZD/fho/E@vger.kernel.org
X-Gm-Message-State: AOJu0YxZiy3ylTw9589ppA5/RzZY0PYYWhyzPncVBGxQQiZBv1P9ol94
	y6tNf/b48dp2EziicMG0qFPVYag/ZW+OmcGbXxDULIZdp8Epldvlgzp7Vi2+fltejgxralDIgiF
	rLIhno6owyTIYRUFv21Mjs2LZQNm6EXK73o07Vw==
X-Google-Smtp-Source: AGHT+IGDBtidaBjCA+V6TUtDSxl4XAawtegW2WS9EFKGFvRhSXTvKYz5awzj9XJntrNJqGu2AzyUvSFjTEPgOfOXMps=
X-Received: by 2002:a05:690c:6085:b0:6e3:15ad:a560 with SMTP id
 00721157ae682-6e3479b858amr12310937b3.12.1728630797790; Fri, 11 Oct 2024
 00:13:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
 <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
 <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com> <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com>
In-Reply-To: <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 10:13:07 +0300
Message-ID: <CAA8EJppMu5o7juhKUN2Y_4CRYKtaWN9G01aPU2ZfksE_tzjqCQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/msm/dpu: blend pipes per mixer pairs config
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Oct 2024 at 10:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:03=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Fri, 11 Oct 2024 at 09:40, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B4=
10=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=9A
> > > >
> > > > On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > > > > Blend pipes by set of mixer pair config. The first 2 pipes are fo=
r left
> > > > > half screen with the first set of mixer pair config. And the late=
r 2 pipes
> > > > > are for right in quad pipe case.
> > > > >
> > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > ---
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 +++++++++++++++=
+++-----------
> > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > >  2 files changed, 25 insertions(+), 14 deletions(-)
> > > > >
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/g=
pu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index 43d9817cd858f..66f745399a602 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struc=
t drm_crtc *crtc,
> > > > >       const struct msm_format *format;
> > > > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > > > >
> > > > > -     uint32_t lm_idx, i;
> > > > > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> > > > >       bool bg_alpha_enable =3D false;
> > > > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > > > >
> > > > > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(str=
uct drm_crtc *crtc,
> > > > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->=
alpha_enable)
> > > > >                       bg_alpha_enable =3D true;
> > > > >
> > > > > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > > -                     if (!pstate->pipe[i].sspp)
> > > > > -                             continue;
> > > > > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_ac=
tive);
> > > > > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > > > -                                                mixer, cstate->n=
um_mixers,
> > > > > -                                                pstate->stage,
> > > > > -                                                format, fb ? fb-=
>modifier : 0,
> > > > > -                                                &pstate->pipe[i]=
, i, stage_cfg);
> > > > > +             /* loop pipe per mixer pair */
> > > > > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2; =
lm_pair++) {
> > > > > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > > +                             pipe_idx =3D i + lm_pair * PIPES_PE=
R_LM_PAIR;
> > > > > +                             if (!pstate->pipe[pipe_idx].sspp)
> > > > > +                                     continue;
> > > > > +                             set_bit(pstate->pipe[pipe_idx].sspp=
->idx, fetch_active);
> > > > > +                             _dpu_crtc_blend_setup_pipe(crtc, pl=
ane,
> > > > > +                                                        mixer, c=
state->num_mixers,
> > > > > +                                                        pstate->=
stage,
> > > > > +                                                        format, =
fb ? fb->modifier : 0,
> > > > > +                                                        &pstate-=
>pipe[pipe_idx], i,
> > > > > +                                                        &stage_c=
fg[lm_pair]);
> > > > > +                     }
> > > > >               }
> > > > >
> > > > >               /* blend config update */
> > > > > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_=
crtc *crtc)
> > > > >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> > > > >       struct dpu_hw_ctl *ctl;
> > > > >       struct dpu_hw_mixer *lm;
> > > > > -     struct dpu_hw_stage_cfg stage_cfg;
> > > > > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
> > > >
> > > > After seeing this code, can we define STAGES_PER_PLANE (and
> > > > also keep PLANES_PER_STAGE defined to 2)?
> > > >
> > > Could you elaborate it? Stages describe how many layers to be blended=
.
> > > Plane is a DRM concept that describe a buffer to be display in specif=
ic
> > > display driver. Plane is already mapped to SSPP/multi-rect in DPU dri=
ver
> > >  in blending stage level. So I am confused here.
> >
> > We have dpu_hw_stage_cfg, you are adding a second instance of it. So
> > we now have two stages per plane.
>
> So you suggest to replace LM_PAIRS_PER_PLANE with STAGES_PER_PLANE,
> right? I assume a stage is coupled with a LM pair.
>
> But for PLANES_PER_STAGE, I am still confused. A stage or a LM pair can
> involve many SSPP layers. How it related to planes? Plane is a concepts f=
rom
> higher level.

PIPES_PER_STAGE, excuse me.

--=20
With best wishes
Dmitry

