Return-Path: <linux-arm-msm+bounces-34025-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0754B999CD2
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 08:40:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 42F141F2147E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 06:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DACED1FCC75;
	Fri, 11 Oct 2024 06:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5vw7eGW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22167199FB9
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 06:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728628814; cv=none; b=OorWOi9ZL2EN4KjDDQGdsWvS+9eAOsImvndpu6Xz28r1Dr7nkRMRODrpo4R3EoCoTeluqCDhbfuLWzGZ4fwhwF/imkZHm4wWkoRzHOkvMQGssiSNmj/ug60xjsGl51IRycnjg7rZmEMDuv5x1bnUhNb052RPtjgD0LFFMNvZqS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728628814; c=relaxed/simple;
	bh=hYksWLHXILV+Jh4QWVWtjIqUuNtdq6Nw7BA7xixW0zI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bf9qvblfkIRgRJSwqQ6o8t1PDTk9N5xZlyz/2c1SxkRzW1WKAxQVRu7ClSjv87siGK8xkhtQ3QMepwlCC0SALMBi7gEqF4psYzgHWdbXr7DCbrxiB7UPf0zHboksYj/ZSXm8WBVlA/AR4D/hp/g9zRKINrh/qgIyKnC+EiLn55A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5vw7eGW; arc=none smtp.client-ip=209.85.219.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-e2923d5b87aso161704276.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 23:40:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728628812; x=1729233612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qfSM9AJ7ULCOORqVQMeKLRHN4Z/ZES4kfQKS10nrPyo=;
        b=g5vw7eGW+BSFapUHdA8nk5SBRdkE1RvAVfoI2FDBqHzZ38sYTPme0Ls73h7YPuRUQe
         FTpl9Zg8m21gyecpwzhKwu5zyZwGH08PghatpXcfX3i0P0JGijWn7RCr/AARL7yGGk3P
         uhHe6m8slACfJSJ2g4e8yBoALWrdGJ8V6bkAAut+F4HnEWVlOm0xxyyGd7E3Zz2JhC9m
         IyIs73syySHRKlACMlzyW5qWKk3grvYLhONdyyScjrTFryoSgoGAYj8h3GdhOp3dKznx
         4WsvJhYHhmxf8iF5wMFc1kSggZWnL/0E2aL/7AHfu1hnuTY6wL/Ux4UC6Fh5K2SAgXdG
         SjOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728628812; x=1729233612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qfSM9AJ7ULCOORqVQMeKLRHN4Z/ZES4kfQKS10nrPyo=;
        b=kLjPK8rqOLzEelZTHOZ5Ejza7XD1NYr3Ddi5LTAf37hsXM8rB0NEeSw6DuHSSsaaPd
         W1DFVC6wrOQVsYo2s7IE5ZfgBXwtpFF3wDg6XdSKbUTTar0CATomT6fkigvBdjU07vz2
         M7seqWRlQyteSaSWpnKox+0OChGvRlcXmrjzQ1FH/Hye/DWFmis0EeD8f/yn7zJN2Htl
         EikdbbtNlgIRUcom31uAJTZjw6bh7rpRubfTS5PD8qDX7TE79iI4RoWhITm6VrE5S9H1
         E/f8zoMN7goDh18hYKXXBVzVpxM8TbV+NFtfHnz6iTiUbAuNgzAgQbQRqW0Y0jHOz28y
         aebA==
X-Forwarded-Encrypted: i=1; AJvYcCVuSy/l7NffSM5hsO0JvNB8RTA9TwEZ9Mh47fyIcDxGbFbNYXj3/grKVwJeOYf+ZZIxnmiThAMEHXSE2gaG@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/TxaG1k8zY2FXV65CTwLt9TEr+U7UR9b/Vbk8y9nFRPfKPE8J
	y8eVfTd4r+VVa0WpFioDUHyu/rF6tY/INE9/fgsKNQSQZHu4y2pd2THoQtjtKkS0B82cOg3bmU6
	eZiPODYaW+B+c/pNMJqvcBosbOvEx7RZDXdwaRw==
X-Google-Smtp-Source: AGHT+IEp7H558OS0vMf/lCfx7nv2J5NRDmMZ5UvSeTPYRs3ovFyldfgKvbQdJiW43i1yheMmuw+j0rRtlg+9hMGjFZg=
X-Received: by 2002:a05:6902:1003:b0:e28:ead2:2270 with SMTP id
 3f1490d57ef6-e2919def5dbmr941314276.41.1728628812086; Thu, 10 Oct 2024
 23:40:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-9-76d4f5d413bf@linaro.org>
 <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
In-Reply-To: <zig5zuf6hjcrkwmsdiahtzz3t3mxrmwxj65l43xij3zhfcyidn@fuisasnavvo3>
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 11 Oct 2024 14:40:00 +0800
Message-ID: <CABymUCP7bVBSWXCNp33x_B8KaZSFU-Dx+bU5ctkgDGXrzURrXQ@mail.gmail.com>
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
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:15=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, Oct 09, 2024 at 04:50:22PM GMT, Jun Nie wrote:
> > Blend pipes by set of mixer pair config. The first 2 pipes are for left
> > half screen with the first set of mixer pair config. And the later 2 pi=
pes
> > are for right in quad pipe case.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 38 ++++++++++++++++++---=
--------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h |  1 +
> >  2 files changed, 25 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 43d9817cd858f..66f745399a602 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -442,7 +442,7 @@ static void _dpu_crtc_blend_setup_mixer(struct drm_=
crtc *crtc,
> >       const struct msm_format *format;
> >       struct dpu_hw_ctl *ctl =3D mixer->lm_ctl;
> >
> > -     uint32_t lm_idx, i;
> > +     uint32_t lm_idx, lm_pair, i, pipe_idx;
> >       bool bg_alpha_enable =3D false;
> >       DECLARE_BITMAP(fetch_active, SSPP_MAX);
> >
> > @@ -463,15 +463,20 @@ static void _dpu_crtc_blend_setup_mixer(struct dr=
m_crtc *crtc,
> >               if (pstate->stage =3D=3D DPU_STAGE_BASE && format->alpha_=
enable)
> >                       bg_alpha_enable =3D true;
> >
> > -             for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > -                     if (!pstate->pipe[i].sspp)
> > -                             continue;
> > -                     set_bit(pstate->pipe[i].sspp->idx, fetch_active);
> > -                     _dpu_crtc_blend_setup_pipe(crtc, plane,
> > -                                                mixer, cstate->num_mix=
ers,
> > -                                                pstate->stage,
> > -                                                format, fb ? fb->modif=
ier : 0,
> > -                                                &pstate->pipe[i], i, s=
tage_cfg);
> > +             /* loop pipe per mixer pair */
> > +             for (lm_pair =3D 0; lm_pair < PIPES_PER_PLANE / 2; lm_pai=
r++) {
> > +                     for (i =3D 0; i < PIPES_PER_LM_PAIR; i++) {
> > +                             pipe_idx =3D i + lm_pair * PIPES_PER_LM_P=
AIR;
> > +                             if (!pstate->pipe[pipe_idx].sspp)
> > +                                     continue;
> > +                             set_bit(pstate->pipe[pipe_idx].sspp->idx,=
 fetch_active);
> > +                             _dpu_crtc_blend_setup_pipe(crtc, plane,
> > +                                                        mixer, cstate-=
>num_mixers,
> > +                                                        pstate->stage,
> > +                                                        format, fb ? f=
b->modifier : 0,
> > +                                                        &pstate->pipe[=
pipe_idx], i,
> > +                                                        &stage_cfg[lm_=
pair]);
> > +                     }
> >               }
> >
> >               /* blend config update */
> > @@ -503,7 +508,7 @@ static void _dpu_crtc_blend_setup(struct drm_crtc *=
crtc)
> >       struct dpu_crtc_mixer *mixer =3D cstate->mixers;
> >       struct dpu_hw_ctl *ctl;
> >       struct dpu_hw_mixer *lm;
> > -     struct dpu_hw_stage_cfg stage_cfg;
> > +     struct dpu_hw_stage_cfg stage_cfg[LM_PAIRS_PER_PLANE];
>
> After seeing this code, can we define STAGES_PER_PLANE (and
> also keep PLANES_PER_STAGE defined to 2)?
>
Could you elaborate it? Stages describe how many layers to be blended.
Plane is a DRM concept that describe a buffer to be display in specific
display driver. Plane is already mapped to SSPP/multi-rect in DPU driver
 in blending stage level. So I am confused here.

-  Jun

