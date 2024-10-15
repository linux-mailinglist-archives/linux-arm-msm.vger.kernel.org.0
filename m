Return-Path: <linux-arm-msm+bounces-34404-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9495899E0FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 10:27:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 18CA9282E45
	for <lists+linux-arm-msm@lfdr.de>; Tue, 15 Oct 2024 08:27:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 269961CACC9;
	Tue, 15 Oct 2024 08:27:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qiL+6Aep"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f180.google.com (mail-yb1-f180.google.com [209.85.219.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D6391C7617
	for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 08:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728980846; cv=none; b=sjjFaiiye1vpkC2nFk677zCOvb52poXSYZUqMLgjbv/e6TCg0jsZYv0fbNA6hStZGs8gmo/GeBioWLtDIH4vUM3r/I6eC8QBsoMrjuVu2IB+2CaKuJubmHgn21zObmwV3NAuqZH9AvriyCRoEEzVQZlgrrwjmKEnPMGPoqfleWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728980846; c=relaxed/simple;
	bh=2rPMDg9/t/w3G0K3y2gXVBxMKzjXfjCzHeqESJZkYtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnQdrJMI6Zmn9azDjmBTzIfXfEBWWXv2KFMEtWt5eMLu08qG93s2xukbaPAkZJ7JYuuVRKbbfMEzZkqe1TCOU19Sef+DoV+z09bsUwsNEoBDHghk0SGtdnEBjHsZuNtlqBdRGnAzYaXNyr8d+kJwBfBB2IP8JWogGLelH0g127g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=qiL+6Aep; arc=none smtp.client-ip=209.85.219.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f180.google.com with SMTP id 3f1490d57ef6-e290e857d56so4176377276.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 15 Oct 2024 01:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728980843; x=1729585643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kh7NkmDAM9m5O1uSrySh2RZX18Uua/RhFygWOGIe73E=;
        b=qiL+6AepYPevLSJOFp22+tPi2acq+OunVin4e2WNSn48kT/UyiDAZz7vOpUzSR6wpj
         1d7XIiF5BxdoFG15E/NGz0yZvhxmHVGire23CL+nIXZMklcuWSHzsoVkMtZ/NwHvoI7t
         WUkjW0C4IPwWF+roCyOC7IyYalw/28TGM7/AGu7QApaFEanrAED2fMT8C+yOod9iT6OY
         8C9C/YxSqmHtr7D1xxrHEkGA+LD6Wg2lzrti1Yj4OB2JA2YvYhvGJgY2V8TJFYVGWucR
         8uuQE+pyEfUWdQ4/YTTK9lccGnXXQNcsNERRr50FxWk/SfXRTtujCk4B87046TgzNtXW
         T2Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728980843; x=1729585643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Kh7NkmDAM9m5O1uSrySh2RZX18Uua/RhFygWOGIe73E=;
        b=S0n71TePowwcjef+djN7Yz8oqck8YmXmRBLqDWU9TOA8L8w4yWWRQ7B3YoV8NNXJG/
         FR4WQEyEdq1iNKZwxnSnQ2cUA2uSYrFBXdWV7gUJbnP+bgs8WtKc3zehKNkA/kLsbaIo
         Rg1L2GExmc3ZajfLFp+F4Yx0K+fk+kEeHrhrC93fj7FBMn6uYqny0h3BVfQac0DKQGpy
         hJ12Q3F6yNQPkSVsCMleQ3FxyCzbZyaX4gT0CSYEQtz6vJwOcM6AM3kHRUh6UAyjYhQP
         MjPH47nGZ+AU3yJGfTMCeaqhEldiGxDnob+uuNW11ES1y0Rx5I4DLsg8pcsoIAOaKb7T
         pTVw==
X-Forwarded-Encrypted: i=1; AJvYcCX/RJCfh8vbjH31t+nQRJPe5M3JlpjxZZs8eNYZw0zVFYUt8dHcYXYrPkjGW3LfPpPRAixh8+fI0Ewhylme@vger.kernel.org
X-Gm-Message-State: AOJu0YwmBuauJ32uTws2v81bXmDJCG8x7TPLZEctWYywjg22jLjZthBn
	q3g/aQD8H8wqOnKIxe4VH5LNGkycG2nLY3E6C4R+FcFiLC2UiQHVH/EnYiIeI/zxX7EazmbfJFb
	ytfOsV7IWOyw2bUogKoxW8Xy+yWGDUWLWB5D+ZA==
X-Google-Smtp-Source: AGHT+IFkKg4baqyI1mR+ynKg6uqf1M6RVbil+T3rXQaW6Bdg4AXGejHp/kAEANso21Z43EVZ9cmSocT4SYoeks7pIAU=
X-Received: by 2002:a05:6902:1893:b0:e29:2f00:803e with SMTP id
 3f1490d57ef6-e292f00c843mr9386451276.33.1728980843258; Tue, 15 Oct 2024
 01:27:23 -0700 (PDT)
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
 <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
 <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com> <CAA8EJppMu5o7juhKUN2Y_4CRYKtaWN9G01aPU2ZfksE_tzjqCQ@mail.gmail.com>
In-Reply-To: <CAA8EJppMu5o7juhKUN2Y_4CRYKtaWN9G01aPU2ZfksE_tzjqCQ@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 15 Oct 2024 16:27:12 +0800
Message-ID: <CABymUCNbwY5hoaOxydPccFAdbnCQgUMspJLHkNziQyf=NxOj2A@mail.gmail.com>
Subject: Re: [PATCH v2 09/14] drm/msm/dpu: blend pipes per mixer pairs config
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:13=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 11 Oct 2024 at 10:11, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:03=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Fri, 11 Oct 2024 at 09:40, Jun Nie <jun.nie@linaro.org> wrote:
> > > >
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=
=B410=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=
=9A
> > > > >
> > > > > On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > > > > > Blend pipes by set of mixer pair config. The first 2 pipes are =
for left
> > > > > > half screen with the first set of mixer pair config. And the la=
ter 2 pipes
> > > > > > are for right in quad pipe case.
> > > > > >
> > > > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > > > ---
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 +++++++++++++=
+++++-----------
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > > > >  2 files changed, 25 insertions(+), 14 deletions(-)
> > > > > >
> > > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers=
/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > index 43d9817cd858f..66f745399a602 100644
> > > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(str=
uct drm_crtc *crtc,
> > > > > >       const struct msm_format *format;
> > > > > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > > > > >
> > > > > > -     uint32_t lm_idx, i;
> > > > > > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> > > > > >       bool bg_alpha_enable =3D false;
> > > > > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > > > > >
> > > > > > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(s=
truct drm_crtc *crtc,
> > > > > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format=
->alpha_enable)
> > > > > >                       bg_alpha_enable =3D true;
> > > > > >
> > > > > > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > > > -                     if (!pstate->pipe[i].sspp)
> > > > > > -                             continue;
> > > > > > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_=
active);
> > > > > > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > > > > -                                                mixer, cstate-=
>num_mixers,
> > > > > > -                                                pstate->stage,
> > > > > > -                                                format, fb ? f=
b->modifier : 0,
> > > > > > -                                                &pstate->pipe[=
i], i, stage_cfg);
> > > > > > +             /* loop pipe per mixer pair */
> > > > > > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2=
; lm_pair++) {
> > > > > > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++)=
 {
> > > > > > +                             pipe_idx =3D i + lm_pair * PIPES_=
PER_LM_PAIR;
> > > > > > +                             if (!pstate->pipe[pipe_idx].sspp)
> > > > > > +                                     continue;
> > > > > > +                             set_bit(pstate->pipe[pipe_idx].ss=
pp->idx, fetch_active);
> > > > > > +                             _dpu_crtc_blend_setup_pipe(crtc, =
plane,
> > > > > > +                                                        mixer,=
 cstate->num_mixers,
> > > > > > +                                                        pstate=
->stage,
> > > > > > +                                                        format=
, fb ? fb->modifier : 0,
> > > > > > +                                                        &pstat=
e->pipe[pipe_idx], i,
> > > > > > +                                                        &stage=
_cfg[lm_pair]);
> > > > > > +                     }
> > > > > >               }
> > > > > >
> > > > > >               /* blend config update */
> > > > > > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct dr=
m_crtc *crtc)
> > > > > >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> > > > > >       struct dpu_hw_ctl *ctl;
> > > > > >       struct dpu_hw_mixer *lm;
> > > > > > -     struct dpu_hw_stage_cfg stage_cfg;
> > > > > > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
> > > > >
> > > > > After seeing this code, can we define STAGES_PER_PLANE (and
> > > > > also keep PLANES_PER_STAGE defined to 2)?
> > > > >
> > > > Could you elaborate it? Stages describe how many layers to be blend=
ed.
> > > > Plane is a DRM concept that describe a buffer to be display in spec=
ific
> > > > display driver. Plane is already mapped to SSPP/multi-rect in DPU d=
river
> > > >  in blending stage level. So I am confused here.
> > >
> > > We have dpu_hw_stage_cfg, you are adding a second instance of it. So
> > > we now have two stages per plane.
> >
> > So you suggest to replace LM_PAIRS_PER_PLANE with STAGES_PER_PLANE,
> > right? I assume a stage is coupled with a LM pair.
> >
> > But for PLANES_PER_STAGE, I am still confused. A stage or a LM pair can
> > involve many SSPP layers. How it related to planes? Plane is a concepts=
 from
> > higher level.
>
> PIPES_PER_STAGE, excuse me.

Do you mean to keep PIPES_PER_STAGE and do not introduce PIPES_PER_LM_PAIR,
or use both? Looks like they are equal in hardware nature. A stage
structure serves
a mixer pair with 2 pipes. We can use PIPES_PER_LM_PAIR and add comment to
 indicate it, thus avoid defining too many macro.

>
> --
> With best wishes
> Dmitry

