Return-Path: <linux-arm-msm+bounces-30483-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5ED396962D
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:53:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 28B11B25AB3
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 07:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B9021DAC56;
	Tue,  3 Sep 2024 07:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GjHKZ+YO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBDE1D54D3
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 07:53:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725350024; cv=none; b=L7c9V96BYQJpIICz9uSfCnh+KjcdD+ULV0JbtSmkFA3iRAi2kJlkRZvA6ZAoMwZ4ZgZ1DvefRBnuoypPU15yoYugwEOvxJUgY0TWWdnCkP/7CvAPeFJk1oN7n86Zrd9ZBG6WbY86oe6pPviVyyT1A9KC6ml0m0/wn73Z7Gc820s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725350024; c=relaxed/simple;
	bh=+5EkCZDdq4bYzPniFMWinHrUffWZ2gH/8K50PC29olo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EG72kXvOdm0CEaluK8WlHtTbdb1gEt+YGcG4XDePz/gIqs6cwxoo2SBb9aocWFBmMi359tPJiGYV13KYFVRzuFNQzCAsfEckHHMhZJsQdXMLSEyYovwUwN0RNi3gfYl8pvnvqyo497twruVAtSPJwhKDLrs46J5j4oM1aWJji8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GjHKZ+YO; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53560b2b444so442235e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 00:53:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725350021; x=1725954821; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TiTMt1SzeO5kHwfa3dwDdOON7oza5zp3pck2Zjm9J0=;
        b=GjHKZ+YOMV3ukld+ziHtp80PZS3s3FDCPQdhymbIOzi3tB5bx1iMn3A2LwJticN7cF
         opJivDVcHA2ZFrtfqpjWQoSH/Elerq5RnG7cWXiTjhNSIFbsMeqPhGXG+nXz3WYecgAq
         aVh4PmPJtvxhb9fqufEMLAq59ozff8Sc9ZIt4FhhWvosYNmvH9LRj2sD31R6HZ5Ptth/
         0h/PaJzTdXTJ3Q/uk6XMky4BBLn7gUZQLqdMEnV1b4VK/8H8decW0x7q/iznhuqBlNYg
         f23nSjlU/yExj4ORO4w3BAMG5r1d/YKxSV4Dng30Uxz72UrJsab0elZF6fYfy5a9MZa9
         pZBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725350021; x=1725954821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7TiTMt1SzeO5kHwfa3dwDdOON7oza5zp3pck2Zjm9J0=;
        b=YfEHTV7IKGCgnLSpqsWWCNxWmAwouHdv/n+dvzQ5Q9GkF8ct+hXdDzzRXTriE/nuC5
         VlgXAaqyoiO9KZyvCTuyI5z3c6QLNvqLZdJqVlpJlqIAoPJxREXuQcxuIZnQaf0v5TWC
         G+3WNl5gx25Wkngoz7zOfZ+m8YPKFhqPdbIA5tUH8hT9/ZgTIxUPx1UfI7UBe5PN39O/
         +bvNYb2qK0bVNsieN1gaC7agLdM3ZPg/vaG2AEvWLqOWNZ7xHJD8SDJt6hsEaV35Eqyn
         4JVczNFlHOga6uE/m4oYwOXpot6OC/p/Vy9gy2re1WQwtGw1eeDbnGQqy7ltcE9UgumH
         E0oA==
X-Forwarded-Encrypted: i=1; AJvYcCXeooXcwuG8FtGwE1jV+kq0bx3mWxXqFLyeMlE6AyUga0/O0RtxLujtgg2uZryzIR+l4WDsqfIEe3EkBGmh@vger.kernel.org
X-Gm-Message-State: AOJu0Ywt6JvAcgnsrLhItRyjZ0AB82hZKhsZsiaXgSg05BFJa5H6ShVu
	JVVfwtMw9nTfV0GZ5kV0Jgr/wz53H7B34aQc/n6Ba+4Xwf7juenUUjp33qjIpRYkg5Bq2U/jDuT
	j16AdbEZJ/TzWHyVcMFatSKJCvjtWZwP1BkzOlA==
X-Google-Smtp-Source: AGHT+IGljCALoD43cpdVsnf1cgnSW+In5Nh90jpKkYsvDMlPUGx4lQ4sUScj5CVZgYFOB0fdFJZ+sIsTscH3uyMYYB4=
X-Received: by 2002:a05:6512:3e1d:b0:52f:1b08:d2d8 with SMTP id
 2adb3069b0e04-535462f75c9mr3898824e87.7.1725350019128; Tue, 03 Sep 2024
 00:53:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-18-bdb05b4b5a2e@linaro.org>
 <CAA8EJpoj6vs1JsDWgqof9Ogt-0Zq6hUpuaK42YwByDGrpUopnw@mail.gmail.com>
In-Reply-To: <CAA8EJpoj6vs1JsDWgqof9Ogt-0Zq6hUpuaK42YwByDGrpUopnw@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 3 Sep 2024 15:53:27 +0800
Message-ID: <CABymUCOOWSSUnk3wdh4bKiOJb8k44_F2-ik9MeKuB1kF66576A@mail.gmail.com>
Subject: Re: [PATCH 18/21] drm/msm/dpu: blend pipes by left and right
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:51=E5=86=99=E9=81=93=EF=BC=9A
>
> On Thu, 29 Aug 2024 at 13:21, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Blend pipes by left and right. The first 2 pipes are for
> > left half screen and the later 2 pipes are for right in quad
> > pipe case.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 13 +++++++++++--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 +++++++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c  | 19 +++++++++++++++++--
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h  |  4 +++-
> >  4 files changed, 38 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm=
/msm/disp/dpu1/dpu_crtc.c
> > index 3b3cd17976082..8fd56f8f2851f 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -574,8 +574,17 @@ static void _dpu_crtc_blend_setup(struct drm_crtc =
*crtc)
> >                         mixer[i].mixer_op_mode,
> >                         ctl->idx - CTL_0);
> >
> > -               ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->idx,
> > -                       &stage_cfg);
> > +               /*
> > +                * call dpu_hw_ctl_setup_blendstage() to blend layers p=
er stage cfg.
> > +                * There is 4 mixers at most. The first 2 are for the l=
eft half, and
> > +                * the later 2 are for the right half.
> > +                */
> > +               if (cstate->num_mixers =3D=3D 4 && i >=3D 2)
> > +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->=
idx,
> > +                               &stage_cfg, true);
> > +               else
> > +                       ctl->ops.setup_blendstage(ctl, mixer[i].hw_lm->=
idx,
> > +                               &stage_cfg, false);
> >         }
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 76793201b984e..5d927f23e35b2 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -2049,9 +2049,13 @@ static void dpu_encoder_helper_reset_mixers(stru=
ct dpu_encoder_phys *phys_enc)
> >                 if (phys_enc->hw_ctl->ops.update_pending_flush_mixer)
> >                         phys_enc->hw_ctl->ops.update_pending_flush_mixe=
r(ctl, hw_mixer[i]->idx);
> >
> > -               /* clear all blendstages */
> > -               if (phys_enc->hw_ctl->ops.setup_blendstage)
> > -                       phys_enc->hw_ctl->ops.setup_blendstage(ctl, hw_=
mixer[i]->idx, NULL);
> > +               /* clear all blendstages in both left and right */
> > +               if (phys_enc->hw_ctl->ops.setup_blendstage) {
> > +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> > +                               hw_mixer[i]->idx, NULL, false);
> > +                       phys_enc->hw_ctl->ops.setup_blendstage(ctl,
> > +                               hw_mixer[i]->idx, NULL, true);
> > +               }
> >         }
> >  }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_hw_ctl.c
> > index 602dfad127c2a..2072d18520326 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
> > @@ -478,12 +478,13 @@ static const struct ctl_blend_config ctl_blend_co=
nfig[][2] =3D {
> >  };
> >
> >  static void dpu_hw_ctl_setup_blendstage(struct dpu_hw_ctl *ctx,
> > -       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg)
> > +       enum dpu_lm lm, struct dpu_hw_stage_cfg *stage_cfg, bool right)
> >  {
> >         struct dpu_hw_blk_reg_map *c =3D &ctx->hw;
> >         u32 mix, ext, mix_ext;
> >         u32 mixercfg[5] =3D { 0 };
> >         int i, j;
> > +       int pipe_start, pipe_end;
> >         int stages;
> >         int pipes_per_stage;
> >
> > @@ -502,13 +503,27 @@ static void dpu_hw_ctl_setup_blendstage(struct dp=
u_hw_ctl *ctx,
> >         if (!stage_cfg)
> >                 goto exit;
> >
> > +       /*
> > +        * For quad pipe case, blend pipes in right side separately. Ot=
herwise,
> > +        * all content is on the left half by defaut (no splitting case=
).
> > +        */
> > +       if (!right) {
>
> I think the approach to set PIPES_PER_STAGE to 4 is incorrect. It
> complicates the code too much. Instead please use two separate
> instances, each one representing a single LM pair and corresponding
> set of SW pipes. Yes, you'd have to iterate over them manually.
> However I think it's also going to make code simpler.

OK. I can explore this method.
>
> > +               pipe_start =3D 0;
> > +               pipe_end =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ? 2=
 : 1;
>
> pipe_end =3D pipes_per_stage
>
> > +       } else {
> > +               pipe_start =3D 2;
> > +               pipe_end =3D PIPES_PER_STAGE;
>
> So, the right part always has 2 pipes? What if the
> DPU_MIXER_SOURCESPLIT isn't supported?

Yeah, the case is missed. It should be like this for the right half:
pipe_start =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ? 2 : 1;
pipe_end =3D pipes_per_stage =3D=3D PIPES_PER_STAGE ? PIPES_PER_STAGE : 2;


>
>
> > +       }
> > +
> > +       DRM_DEBUG_ATOMIC("blend lm %d on the %s side\n", lm - LM_0,
> > +                        right ? "right" : "left");
> >         for (i =3D 0; i <=3D stages; i++) {
> >                 /* overflow to ext register if 'i + 1 > 7' */
> >                 mix =3D (i + 1) & 0x7;
> >                 ext =3D i >=3D 7;
> >                 mix_ext =3D (i + 1) & 0xf;
> >
> > -               for (j =3D 0 ; j < pipes_per_stage; j++) {
> > +               for (j =3D pipe_start; j < pipe_end; j++) {
> >                         enum dpu_sspp_multirect_index rect_index =3D
> >                                 stage_cfg->multirect_index[i][j];
> >                         enum dpu_sspp pipe =3D stage_cfg->stage[i][j];
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h b/drivers/gpu/d=
rm/msm/disp/dpu1/dpu_hw_ctl.h
> > index 557ec9a924f81..2dac7885fc5e7 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h
> > @@ -25,6 +25,8 @@ struct dpu_hw_ctl;
> >  /**
> >   * struct dpu_hw_stage_cfg - blending stage cfg
> >   * @stage : SSPP_ID at each stage
> > + *          The first 2 in PIPES_PER_STAGE(4) are for the first SSPP.
> > + *          The 3rd/4th in PIPES_PER_STAGE(4) are for the 2nd SSPP.
> >   * @multirect_index: index of the rectangle of SSPP.
> >   */
> >  struct dpu_hw_stage_cfg {
> > @@ -243,7 +245,7 @@ struct dpu_hw_ctl_ops {
> >          * @cfg       : blend stage configuration
> >          */
> >         void (*setup_blendstage)(struct dpu_hw_ctl *ctx,
> > -               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg);
> > +               enum dpu_lm lm, struct dpu_hw_stage_cfg *cfg, bool righ=
t);
> >
> >         void (*set_active_pipes)(struct dpu_hw_ctl *ctx,
> >                 unsigned long *fetch_active);
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry

