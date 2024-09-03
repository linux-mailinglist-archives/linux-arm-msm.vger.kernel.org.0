Return-Path: <linux-arm-msm+bounces-30499-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id A7050969865
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 11:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 226381F24253
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:12:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A491C19F43F;
	Tue,  3 Sep 2024 09:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hkRypRFg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D50D91C7669
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 09:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354732; cv=none; b=OxHMni711ROSILkz4u5QFH9fIG67pIk8FQ75G0sTimTB5Dzd/FnoN/0vx50H23+QRNRze9O87A2Cnn1L4jzLeBP94KgBB6oA0v8qwjXSip0qt4pQdatbvJbn9ZsLNzhrUf1mzt24oOzOqEsrfc61TSF74SD4OWjH3IgvePO7bjU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354732; c=relaxed/simple;
	bh=c9SWNMOdI4wz5Bxpr8d8dPvOcivg8ND1GRCeKkchZOo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UdPQLwYOsNDGoUcQ1pNUGVwc2de0hY6I9UcaRqb5LnTB2KeJ1VG6QWEicN8Kexey3zK41+3nfpZEGAxSKKgnibtmm3Rp4eTyd26ZrI0i2Pvg/bo0GN8Gdo8QBCCYbhSvD3RiyEYtKOF6/i2TD+sHtd7HmgcvILPedykPn+jdRgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hkRypRFg; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6b6b9867faaso41893007b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 02:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725354730; x=1725959530; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V/ta3uuFBPiaBh9lCEDL9Di51UHek4DoFtVES2+06H0=;
        b=hkRypRFg2j3ZygN1EPjHGW741QpqZTJYewE9A5HPZDN256gvZc8OLxjWtR90HZLzgV
         lBIfsREcP2iXnXEfncHyvUhToeY2jCY62AB0APVJIpWr4B68uG27TVLl5E9VvckxzMsY
         L+iEUEhq04bCd+C1P/WZ+OUh+EGKmJuabHTS2hAYJZ2Utktze7IyKtlc0acQX+dA63L/
         jD4QK+lPJ+WSDHDWew29K+VAWJgVMUmXbdhLlxIuVNYk+xDSLiiLlAMVVLgX/NxmSVcN
         OXZJ5vNG66AnVspwSlgobpyUt3coJTv2GEmeQyQDU2G9MvoCn3+eqEAumRzqZwND6ZgK
         IltA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725354730; x=1725959530;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V/ta3uuFBPiaBh9lCEDL9Di51UHek4DoFtVES2+06H0=;
        b=L8mvuB+228LK6qe7o4AZXJAzTl+hZ+0Wo7z/UQIEEKutl5S65MgOiedTi/nKeMmh7d
         b+cPCXisyYtgd/Y12kz35b2zENL71QFWw2nQdJqlVyRJABwmOutAIR4y8aeYuMlsdUtR
         +91P8agCMHIyfXYJHPzph/sgpFG1x/Bnm3kvNd+YC4UHKADc3YwbPePATBnkhft2nj/r
         PwmHT5pwhDchIbKsxHYMzapScDKoaoj9qRqWy6G9N9/Bs7GpPbjVHUb7IIzFSE5r2a4w
         hB7dfRgizhFJArg/HWMw47aqnSdkmHKKPrYJrl1WNDmd6bZ0oDy8XmFS6G3l0j+UUzk9
         h/fw==
X-Forwarded-Encrypted: i=1; AJvYcCVAna6rzJzBGaT1NtA1Lq5zaqak6XkGQzTPWTlU9wgu0tnTYR01oh87ndw+jhjhKwrBXOVw005hpz/BryaQ@vger.kernel.org
X-Gm-Message-State: AOJu0YzdT0G0gNPmm1grNh3npDeKfWUNhIhh9mt0H7NWIAlddrUvaK0Q
	lrgvIhD3YjdlvLTsM+Sket/G5qpAQFIY6I6Il8C0mBE90hwzg4uRfzbdFUsBx1VEVl53nNb+0Nm
	MZNXDPvEQaarMra2sIYcTUq6/j8/IhFtsm+JDDA==
X-Google-Smtp-Source: AGHT+IEb9jQ5qw60pC+3SsofsZgMNd8KJnoJD/AFd0pFQMqyVKD5minDKNeHUibGRXpas1sBxOmrGY3L1DJDYOVo5lc=
X-Received: by 2002:a05:690c:6703:b0:6ae:528f:be36 with SMTP id
 00721157ae682-6d40dc7b873mr165283987b3.12.1725354729654; Tue, 03 Sep 2024
 02:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-18-bdb05b4b5a2e@linaro.org>
 <CAA8EJpoj6vs1JsDWgqof9Ogt-0Zq6hUpuaK42YwByDGrpUopnw@mail.gmail.com> <CABymUCOOWSSUnk3wdh4bKiOJb8k44_F2-ik9MeKuB1kF66576A@mail.gmail.com>
In-Reply-To: <CABymUCOOWSSUnk3wdh4bKiOJb8k44_F2-ik9MeKuB1kF66576A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 12:11:58 +0300
Message-ID: <CAA8EJppd36417E2vprowz9UJZ5C+WgPPacbY91PFoa2fjSvkXg@mail.gmail.com>
Subject: Re: [PATCH 18/21] drm/msm/dpu: blend pipes by left and right
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 3 Sept 2024 at 10:53, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:51=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:21, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Blend pipes by left and right. The first 2 pipes are for
> > > left half screen and the later 2 pipes are for right in quad
> > > pipe case.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++++---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 19 +++++++++++++++++--
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  4 +++-
> > >  4 files changed, 38 insertions(+), 8 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_crtc.c
> > > index 3b3cd17976082..8fd56f8f2851f 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > @@ -574,8 +574,17 @@ static void _dpu_crtc_blend_setup(struct drm_crt=
c *crtc)
> > >                         mixer[i].mixer_op_mode,
> > >                         ctl->idx - CTL_0);
> > >
> > > -               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > > -                       &stage_cfg);
> > > +               /*
> > > +                * call dpu_hw_ctl_setup_blendstage() to blend layers=
 per stage cfg.
> > > +                * There is 4 mixers at most. The first 2 are for the=
 left half, and
> > > +                * the later 2 are for the right half.
> > > +                */
> > > +               if (cstate->num_mixers =3D=3D 4 && i >=3D 2)
> > > +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm=
->idx,
> > > +                               &stage_cfg, true);
> > > +               else
> > > +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm=
->idx,
> > > +                               &stage_cfg, false);
> > >         }
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 76793201b984e..5d927f23e35b2 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -2049,9 +2049,13 @@ static void dpu_encoder_helper_reset_mixers(st=
ruct dpu_encoder_phys *phys_enc)
> > >                 if (phys_enc->hw_ctl->ops.update_pending_flush_mixer)
> > >                         phys_enc->hw_ctl->ops.update_pending_flush_mi=
xer(ctl, hw_mixer[i]->idx);
> > >
> > > -               /* clear all blendstages */
> > > -               if (phys_enc->hw_ctl->ops.setup_blendstage)
> > > -                       phys_enc->hw_ctl->ops.setup_blendstage(ctl, h=
w_mixer[i]->idx, NULL);
> > > +               /* clear all blendstages in both left and right */
> > > +               if (phys_enc->hw_ctl->ops.setup_blendstage) {
> > > +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> > > +                               hw_mixer[i]->idx, NULL, false);
> > > +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> > > +                               hw_mixer[i]->idx, NULL, true);
> > > +               }
> > >         }
> > >  }
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > index 602dfad127c2a..2072d18520326 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > > @@ -478,12 +478,13 @@ static const struct ctl_blend_config ctl_blend_=
config[][2] =3D {
> > >  };
> > >
> > >  static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> > > -       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
> > > +       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg, bool righ=
t)
> > >  {
> > >         struct dpu_hw_blk_reg_map *c =3D &ctx->hw;
> > >         u32 mix, ext, mix_ext;
> > >         u32 mixercfg[5] =3D { 0 };
> > >         int i, j;
> > > +       int pipe_start, pipe_end;
> > >         int stages;
> > >         int pipes_per_stage;
> > >
> > > @@ -502,13 +503,27 @@ static void dpu_hw_ctl_setup_blendstage(struct =
dpu_hw_ctl *ctx,
> > >         if (!stage_cfg)
> > >                 goto exit;
> > >
> > > +       /*
> > > +        * For quad pipe case, blend pipes in right side separately. =
Otherwise,
> > > +        * all content is on the left half by defaut (no splitting ca=
se).
> > > +        */
> > > +       if (!right) {
> >
> > I think the approach to set PIPES_PER_STAGE to 4 is incorrect. It
> > complicates the code too much. Instead please use two separate
> > instances, each one representing a single LM pair and corresponding
> > set of SW pipes. Yes, you'd have to iterate over them manually.
> > However I think it's also going to make code simpler.
>
> OK. I can explore this method.
> >
> > > +               pipe_start =3D 0;
> > > +               pipe_end =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ?=
 2 : 1;
> >
> > pipe_end =3D pipes_per_stage
> >
> > > +       } else {
> > > +               pipe_start =3D 2;
> > > +               pipe_end =3D PIPES_PER_STAGE;
> >
> > So, the right part always has 2 pipes? What if the
> > DPU_MIXER_SOURCESPLIT isn't supported?
>
> Yeah, the case is missed. It should be like this for the right half:
> pipe_start =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ? 2 : 1;
> pipe_end =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ? PIPES_PER_STAGE : 2=
;

Well, we can be better than that and use
pipe_start =3D left ? 0 : 2
pipe_end =3D pipe_start + pipes_per_stage;

>
>
> >
> >
> > > +       }
> > > +
> > > +       DRM_DEBUG_ATOMIC("blend lm %d on the %s side\n", lm - LM_0,
> > > +                        right ? "right" : "left");
> > >         for (i =3D 0; i <=3D stages; i++) {
> > >                 /* overflow to ext register if 'i + 1 > 7' */
> > >                 mix =3D (i + 1) & 0x7;
> > >                 ext =3D i >=3D 7;
> > >                 mix_ext =3D (i + 1) & 0xf;
> > >
> > > -               for (j =3D 0 ; j < pipes_per_stage; j++) {
> > > +               for (j =3D pipe_start; j < pipe_end; j++) {
> > >                         enum dpu_sspp_multirect_index rect_index =3D
> > >                                 stage_cfg->multirect_index[i][j];
> > >                         enum dpu_sspp pipe =3D stage_cfg->stage[i][j]=
;
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > index 557ec9a924f81..2dac7885fc5e7 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > > @@ -25,6 +25,8 @@ struct dpu_hw_ctl;
> > >  /**
> > >   * struct dpu_hw_stage_cfg - blending stage cfg
> > >   * @stage : SSPP_ID at each stage
> > > + *          The first 2 in PIPES_PER_STAGE(4) are for the first SSPP=
.
> > > + *          The 3rd/4th in PIPES_PER_STAGE(4) are for the 2nd SSPP.
> > >   * @multirect_index: index of the rectangle of SSPP.
> > >   */
> > >  struct dpu_hw_stage_cfg {
> > > @@ -243,7 +245,7 @@ struct dpu_hw_ctl_ops {
> > >          * @cfg       : blend stage configuration
> > >          */
> > >         void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
> > > -               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
> > > +               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg, bool ri=
ght);
> > >
> > >         void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
> > >                 unsigned long *fetch_active);
> > >
> > > --
> > > 2.34.1
> > >
> >
> >
> > --
> > With best wishes
> > Dmitry



--=20
With best wishes
Dmitry

