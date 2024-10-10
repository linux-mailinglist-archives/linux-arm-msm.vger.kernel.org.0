Return-Path: <linux-arm-msm+bounces-33753-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 73EA3997A44
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 03:47:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 77A5C1C21FF4
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 01:47:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17125224EF;
	Thu, 10 Oct 2024 01:47:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ExeoKNjp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57718179A3
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 01:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728524838; cv=none; b=PFp3vVYfSuI1NYvMYNDRAzTHIcm5ZKobs9zcGmFg/dj+rTjSNsGrGsb/mPOyGkSLNWXBZy8GGkC849fx4NmdG1hJV9W4SQvfZFj+s4lqlksROYaLL/AH0bxEoR3jqaHsYYvcn8/n13CzyO0OvWRo3erizukFjRGPKcN7y1f9kcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728524838; c=relaxed/simple;
	bh=zwHJ6Cto7VTHLKrulxBYuyq+JRK+W1sqQawSdpa9UTo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Op+RECTA0lPlGJV256ld6dWnRpgFMP+leOdDiLsEAwAGenO1nnzRlZ5JtBw2IIBmaCBZ1x3riIAXSQnTArAlFSQF6YrcQICFjUZZsXyRmzXOmpY/0QysRVAb60mTKkxr3EQhkEuH8EU1lZ/tUWwDPR1p6bu91VNg7NARlKlZEfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ExeoKNjp; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6e2e4d16c2fso4438137b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 09 Oct 2024 18:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728524835; x=1729129635; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdcTNAl/zNhJjLlHdVeR2ByMa+E2JXdIstKxPRioi6g=;
        b=ExeoKNjpSvNa5/5ikNe010igdw3grxhC6v6klWnJ1oVg18GrhWLJ33Ym2I2sHnBikm
         55bKVDssBzP/ceAbD0WYIfh6RtdDBvG5E8nI+fC1nPEe2Kgs08yOXH35qhi45KBLvouu
         WrCKDttDnSqx4ZXzs3p+ZvEhAGHV8h5H9+EzMgpUPhPyE6BtebV2sjxKWRBYUn1zMDqt
         NpacXZi9G13zrJpAfvOXMUAs6/Yxh3trOYUuRnReECXzdB6yy4FmdmV2J4C/Q0CJRiBV
         GRzgbZvw4ETks3k3r7qnLu8XwL7w4RM9IFxhAXaop0vj9lv2oQkkZj+qEhCYSY0NA82g
         VwDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728524835; x=1729129635;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdcTNAl/zNhJjLlHdVeR2ByMa+E2JXdIstKxPRioi6g=;
        b=mDTbFK5uddw8T4dSNovTWn2EHVuG3MmUI1i6IqQQxgBrRaBEcWavubsOD/PaPKVzgD
         lH5mVbi4R18VDFaoYn0Tcklf/arp7Fkbm8rCiNtDS6yaSJRefivtwVaD+OttPbJtXfOu
         qmqDE8yajHMc/7FgU6ZHiiQQyn3o25d7ufSyUd9UL9EFpyJc7S8ND9PApepcLqqoHWkN
         eA036UUaRak5DL0gmlcXt0PwhyeWK6gA0SRqnflz1m511e1lDIvv3obsdawf4MGblPHu
         yln98lqqsic3/n8VUsRN0BS077AvCMAwBLnIRr09DNUYV7a4/n6UqfEowf3RODjWoEA6
         BhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCWebbuhz4Vc/57bJweOJ91M4RjyxlSzIWJkl3ypAi+fQO/i53rzM5tsvlNeFZKLTtBpgmIHpMKjzDfi7CZh@vger.kernel.org
X-Gm-Message-State: AOJu0YzMKP6ftQctRuWZjUa6aBvBQqsTuXM0JJ9t66Ax3BIilPEWZqNr
	fcNmX64BeM5uUqL4LskqXDwrimSKkLdoFaYH4gv/0S+LXG7cK6MpQxjGEhb2eEQKpIDp80lJg7f
	hHa9j4E/8Ok1J9o/MWIJqUfFmFi49AwnfPcGeXKsE6O9PyJ6ArC2T6qJ1Y5U=
X-Google-Smtp-Source: AGHT+IEXCaAqs23+faG84Xbw0uLAys4Y42dQjl9KJR547/GRJW2/9mYWarS+Ua7dASs4AVA+2dWVFy8+L5nX5SMGZDE=
X-Received: by 2002:a05:690c:d8e:b0:6e3:21a9:d3c2 with SMTP id
 00721157ae682-6e32210dfe7mr45994217b3.8.1728524835161; Wed, 09 Oct 2024
 18:47:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
 <CAA8EJpr-B2OZbn5_6dUnojf9ZTXkVcE2nUL1QHohTmk0Qa+bPg@mail.gmail.com>
In-Reply-To: <CAA8EJpr-B2OZbn5_6dUnojf9ZTXkVcE2nUL1QHohTmk0Qa+bPg@mail.gmail.com>
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 10 Oct 2024 09:47:04 +0800
Message-ID: <CABymUCMAsXFz4tMdNexxU8UVGu_khcD6EE+KBt=5EHmKbXvG5A@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=E6=
=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 06:10=E5=86=99=E9=81=93=EF=BC=9A
>
> On Wed, 9 Oct 2024 at 09:39, Jun Nie <jun.nie@linaro.org> wrote:
> >
> > Only 2 DSC engines are allowed, or no DSC is involved currently.
>
> Can't parse this phrase.

How about this:
If DSC is enabled, the only case is with 2 DSC engines so far.


>
> > We need 4 DSC in quad-pipe topology in future. So let's only configure
> > DSC engines in use, instread of maximum number of DSC engines.
>
> Nit: instead

Yep.
>
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
> >  1 file changed, 8 insertions(+), 5 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/=
drm/msm/disp/dpu1/dpu_encoder.c
> > index 39700b13e92f3..e8400b494687c 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct dpu=
_hw_ctl *ctl,
> >                 ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
> >  }
> >
> > -static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> > -                                struct drm_dsc_config *dsc)
> > +static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
> >  {
> >         /* coding only for 2LM, 2enc, 1 dsc config */
> > +       struct dpu_encoder_virt *dpu_enc =3D to_dpu_encoder_virt(drm_en=
c);
> > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(drm_enc->cr=
tc->state);
> > +       struct drm_dsc_config *dsc =3D dpu_enc->dsc;
>
> Why? This doesn't seem to be related to num_dscs introduction.

You mean the comments above these 3 lines? Yeah, it should be removed.
>
> > +       int num_dsc =3D cstate->num_dscs;
> >         struct dpu_encoder_phys *enc_master =3D dpu_enc->cur_master;
> >         struct dpu_hw_ctl *ctl =3D enc_master->hw_ctl;
> >         struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
>
> [...]
>
> > @@ -1953,7 +1956,7 @@ void dpu_encoder_prepare_for_kickoff(struct drm_e=
ncoder *drm_enc)
> >         }
> >
> >         if (dpu_enc->dsc)
> > -               dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
> > +               dpu_encoder_prep_dsc(drm_enc);
> >  }
> >
> >  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
> >
> > --
> > 2.34.1
> >
>
>
> --
> With best wishes
> Dmitry

