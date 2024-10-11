Return-Path: <linux-arm-msm+bounces-34043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E5FD999D88
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:11:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 901511C217FE
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:11:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8999D209F46;
	Fri, 11 Oct 2024 07:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZYyKo7wn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC3B7DDA9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 07:11:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630697; cv=none; b=QOKe5gxjdXSrjXbjBPy0QKerMxJZv5TcWq7Pf7AL0vgQT/qbZQjHTrici6cpcgP7J1fh+hqpuwsDSbameYv/W5C9ReoFOvtzMGUYADT7aP2VmSzw+khndyqjK2Z78W6wlIz93Mcrijb/ieylu58BIA1GPoL97SUwpsO7XBJpkuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630697; c=relaxed/simple;
	bh=u4DSDZEMcG6GrJB85cC/atcJAc7+M3tA/CvP/AlQ8aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ij7afT+BAe7XGvYVNnZwfgFAN4ANt/OK8y+1b0Qed28cISU1Y3m1PKGolK7g0scFIBTynoaMDM2M+Hfr9LNzwHldyNH8giMQGG8erEzjhcxPBVOBzSkOjtjL5K2TiEwGQF2M1PwpkyuJnFydJr/taFZOWgzxOSftJv3SZQWAGQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZYyKo7wn; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e232e260c2so15999057b3.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 00:11:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728630695; x=1729235495; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C40ackh5+59lB1uChyWsBrhuu/xdrVHdO52LObajoJw=;
        b=ZYyKo7wnhYO/KX50/pgTf2KE6ta83/IgCRoSXcu1piwJOJYOh7PcMYzoiQ18k5j012
         IG4RkvX1tSmYyKyi83YVka0x5JTuzv2yC3HPVqZA/NCZtsWovKMczYIAD4rIp19ubiZ6
         4e/OwA6UGqb35/32RwqmGW7pasdpoQL4D51QXejW4LyUOdcmJx9G1Jf8H7qdZYtfoDJr
         WqyOhjlfbOO6gB2gji4lDPEwCjGanK1jnS/gMzGIEYbesMyAT2tRxn8go/Jew9S70nvT
         oEam7YBgkS2J11Oku/jpkLHbHqOunrmII83WyP/eWloIt5u7Qif0FtH/KhhlPDsSyoAD
         uUlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630695; x=1729235495;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C40ackh5+59lB1uChyWsBrhuu/xdrVHdO52LObajoJw=;
        b=fxIcb8SYcZtNVWQ8+zzBP33xD9y6gJl2bwk+PRb/tNoXfOlsx+vL+PFfXK/91CpHqr
         sJe0ITpm/TLH8edxd13zi69K6dOAXMGxZdfjxdmAKE9LDRQUlYFE9wPmv7JK1mxTCkcT
         I2YFCxN4m9kgx5n220HuAVXxDd2C/l5txJx41TCDI5OrVqQSw0MjgoqfEyuYw7FIACi7
         p7W2HfOozzTV8MzLlmEmC4d1QA348gkiGDPQrtKCBjMxroVjrMubKaOUb9hD37zKYzfp
         WiezIyI1TAlchNJauOVuasoezLu5QLzi3cswpPYI1/Zs1SguGpgKCIObYFNtmvepzaue
         6W9Q==
X-Forwarded-Encrypted: i=1; AJvYcCUtiPaEC//oHkO3MRfPtLH/Sh6KJVOfSnCi4Y8je47GxBJPIZ8fbU36OIo+sF2BP3BJa4XSgClIxhbAMxoY@vger.kernel.org
X-Gm-Message-State: AOJu0Ywk/l9l+bDXg+sQCk5OKu7cT0f2E2JzH9F4S+KN/oJC9jBMvo8d
	8PWJss3yDzzw4KoN4AtMkvfet8Jpk9IttzcxNhZLqK9E+4mMy5/pDeExD6L/jR80dk4wkdcPdW2
	vXHistz+IBHUHtXMu+Y+M4m3cB8byXJK848I4qw==
X-Google-Smtp-Source: AGHT+IGvh5dFeky+lN+LmTHTQrH7uCEZJuHJCuRHT6jJhmDL0yhXs+9P2KQ/px0KPGexmiSUFGpY1NS+sjiOtH64V1o=
X-Received: by 2002:a05:690c:d8a:b0:6e2:11e4:2f58 with SMTP id
 00721157ae682-6e3477c063emr9833107b3.7.1728630694861; Fri, 11 Oct 2024
 00:11:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
 <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com> <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
In-Reply-To: <CAA8EJpovnEq_ciO0YmiREhwvxv6yGKnRMPx5=6G7R+Ob6Hy_hA@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 15:11:23 +0800
Message-ID: <CABymUCPdu5+iz-amwv_O999sLUOmUMczo_v=1aUpJGpHo5f8CA@mail.gmail.com>
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
=9C=8811=E6=97=A5=E5=91=A8=E4=BA=94 15:03=E5=86=99=E9=81=93=EF=BC=9A
>
> On Fri, 11 Oct 2024 at 09:40, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > > > Blend pipes by set of mixer pair config. The first 2 pipes are for =
left
> > > > half screen with the first set of mixer pair config. And the later =
2 pipes
> > > > are for right in quad pipe case.
> > > >
> > > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 +++++++++++++++++=
+-----------
> > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> > > >  2 files changed, 25 insertions(+), 14 deletions(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_crtc.c
> > > > index 43d9817cd858f..66f745399a602 100644
> > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct =
drm_crtc *crtc,
> > > >       const struct msm_format *format;
> > > >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> > > >
> > > > -     uint32_t lm_idx, i;
> > > > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> > > >       bool bg_alpha_enable =3D false;
> > > >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> > > >
> > > > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struc=
t drm_crtc *crtc,
> > > >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->al=
pha_enable)
> > > >                       bg_alpha_enable =3D true;
> > > >
> > > > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > -                     if (!pstate->pipe[i].sspp)
> > > > -                             continue;
> > > > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_acti=
ve);
> > > > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > > > -                                                mixer, cstate->num=
_mixers,
> > > > -                                                pstate->stage,
> > > > -                                                format, fb ? fb->m=
odifier : 0,
> > > > -                                                &pstate->pipe[i], =
i, stage_cfg);
> > > > +             /* loop pipe per mixer pair */
> > > > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2; lm=
_pair++) {
> > > > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > > > +                             pipe_idx =3D i + lm_pair * PIPES_PER_=
LM_PAIR;
> > > > +                             if (!pstate->pipe[pipe_idx].sspp)
> > > > +                                     continue;
> > > > +                             set_bit(pstate->pipe[pipe_idx].sspp->=
idx, fetch_active);
> > > > +                             _dpu_crtc_blend_setup_pipe(crtc, plan=
e,
> > > > +                                                        mixer, cst=
ate->num_mixers,
> > > > +                                                        pstate->st=
age,
> > > > +                                                        format, fb=
 ? fb->modifier : 0,
> > > > +                                                        &pstate->p=
ipe[pipe_idx], i,
> > > > +                                                        &stage_cfg=
[lm_pair]);
> > > > +                     }
> > > >               }
> > > >
> > > >               /* blend config update */
> > > > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_cr=
tc *crtc)
> > > >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> > > >       struct dpu_hw_ctl *ctl;
> > > >       struct dpu_hw_mixer *lm;
> > > > -     struct dpu_hw_stage_cfg stage_cfg;
> > > > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
> > >
> > > After seeing this code, can we define STAGES_PER_PLANE (and
> > > also keep PLANES_PER_STAGE defined to 2)?
> > >
> > Could you elaborate it? Stages describe how many layers to be blended.
> > Plane is a DRM concept that describe a buffer to be display in specific
> > display driver. Plane is already mapped to SSPP/multi-rect in DPU drive=
r
> >  in blending stage level. So I am confused here.
>
> We have dpu_hw_stage_cfg, you are adding a second instance of it. So
> we now have two stages per plane.

So you suggest to replace LM_PAIRS_PER_PLANE with STAGES_PER_PLANE,
right? I assume a stage is coupled with a LM pair.

But for PLANES_PER_STAGE, I am still confused. A stage or a LM pair can
involve many SSPP layers. How it related to planes? Plane is a concepts fro=
m
higher level.

> --
> With best wishes
> Dmitry

