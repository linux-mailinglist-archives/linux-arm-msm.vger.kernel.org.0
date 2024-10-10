Return-Path: <linux-arm-msm+bounces-33831-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8710699829E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 11:42:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 16E041F24FE8
	for <lists+linux-arm-msm@lfdr.de>; Thu, 10 Oct 2024 09:42:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F31318DF65;
	Thu, 10 Oct 2024 09:42:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MoqewcXm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726191B5337
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 09:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728553359; cv=none; b=UI8KSOn3ZHaK3lVKLdZ60CjgfDjlvv2pgzNDgJMcYoqmFoTzSAIjD0Y8yXKdTmCvD9oDVrwubBW/bY8w4lTcm14NvydG2h6BM2MPVMAomtHA+ad8WtMztQvg/Y3WQ3ptaUIad+S08t77C8r6ja32KgcV8Swf3wIH+bkr6FgcQlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728553359; c=relaxed/simple;
	bh=qw7bxAwcUEvG6rzmDxAgT3vcA69UNv8FW+zgV5hbTxA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sZeIPM5akDlzeVd/d695ZxBsAfC2KFiqYt0QVHtswADGnhgY3g2xxjwRw1LY3mP1rqXPq64b6crEOm0PpLQbpukJMlMtxCLuXFUhRKoiRz23igKoa+bTO2BYf2bK+QBCnbKm8nCtpUg/fh1mlWYp5pDdp2VYxQwgzH0BTggN9T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MoqewcXm; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-6e2346f164cso6917187b3.3
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Oct 2024 02:42:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728553355; x=1729158155; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2AFuEM5iQK1BFg24WS6aJ9H/ndfdGGqBiQFPKLr/iwg=;
        b=MoqewcXmHKBen+R9/q7pADloLoGELuAWTo/D5V401PmjR9UO2c1AMZv6MBBaRwi/vF
         ey49Hj7fyMDz9m6v/3PlIykvDkJTgZedTTFyIKnuZ9YyqcHxmbuxYqAeAHEUCZOPt7ZG
         geXFY2jWPPnjB0IPQttuOnzu0eVzNVWx9ZAwv3+/G1HEZmvPqz2UuKDsfPC6XbhXpjbf
         IVxM27YQFE0yfLft8LJ1X5CmXkW9aU747rjH4e2ev9eTf5tpIqLdarZIBGGT+mAASlNP
         sqRMJBhgnhuJAviu+FMJlAF/PqwgLZSA0TudKOiDpu7JI0JK9eX03JQsZGmUgwyH5NQ2
         JT4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728553355; x=1729158155;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2AFuEM5iQK1BFg24WS6aJ9H/ndfdGGqBiQFPKLr/iwg=;
        b=AY2WbOwnNMB21wOdk3Va7L0IZc1J1AFGmDYsqIxrIudOASrTLATwJznsFnny1WGSj9
         ZEIPvX/U/24G+1lENRCew9cfkSPySkHOZBBsgHDoY/W4Zvk+t8SyWAwUbeVFibgh9IqS
         guc2UmAhnJZ9jRyMsyXV554PT7VN+p2APaB0NJZxVZuEF/f90vEy+Dq2nc+/F4iQee3Q
         G7bzyJ8ZUmcdm3loGxuiMoiMiff2J6qShoG50jCd+WIMnKd65447PGf49nytBKQCt62e
         bSnjhf7bKU+piPiNHVECRBEwZ3Ds6EZK13EQ0YCja29i1L1V3dbA25S4YUzNX++3CLWY
         0NOA==
X-Forwarded-Encrypted: i=1; AJvYcCUsKhaLok87VAH+kY6YGGCApR0Cbk8+MYUK3Bm8ey8FVwpoSz/UxigBA42TKB3zMWfXUSc7OP2ZVNFkgV5X@vger.kernel.org
X-Gm-Message-State: AOJu0YwKbOhkvPBAO8BN9ypdtkLbznOF0FWuALjaRb3+xcfLJ0rzoykW
	TRZZANdp5XOZYOqOqyYfNzj3MNEV806Kt1BYID0s6r9v+u0JdK3CKDm+vXUGQZzvRWHAncf0diQ
	ASrmLjL3SlJewccn5mUsm1mS1psuvKbu7jb/boA==
X-Google-Smtp-Source: AGHT+IGmAQ12ZK/exUtgQunkQD9Pba+qYyFly3uEDHGNZP0eC+XCxiqyJ8v2g1NWX+u+g414abxOj3NfbQ9kYJQAxO4=
X-Received: by 2002:a05:690c:2f08:b0:6db:da26:e8c6 with SMTP id
 00721157ae682-6e322491509mr49597547b3.44.1728553355429; Thu, 10 Oct 2024
 02:42:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-0-139511076a9f@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-20-v1-2-139511076a9f@linaro.org>
 <CAA8EJpr-B2OZbn5_6dUnojf9ZTXkVcE2nUL1QHohTmk0Qa+bPg@mail.gmail.com> <CABymUCMAsXFz4tMdNexxU8UVGu_khcD6EE+KBt=5EHmKbXvG5A@mail.gmail.com>
In-Reply-To: <CABymUCMAsXFz4tMdNexxU8UVGu_khcD6EE+KBt=5EHmKbXvG5A@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 10 Oct 2024 12:42:24 +0300
Message-ID: <CAA8EJpqv84EPWysZKhATthybZ5ODutNq9mJ0SO2HpzqruaR=+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm/msm/dpu: configure DSC per number in use
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 10 Oct 2024 at 04:47, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 06:10=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, 9 Oct 2024 at 09:39, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Only 2 DSC engines are allowed, or no DSC is involved currently.
> >
> > Can't parse this phrase.
>
> How about this:
> If DSC is enabled, the only case is with 2 DSC engines so far.

Just:

Currently if DSC support is requested, the driver only supports using
2 DSC blocks.

>
>
> >
> > > We need 4 DSC in quad-pipe topology in future. So let's only configur=
e
> > > DSC engines in use, instread of maximum number of DSC engines.
> >
> > Nit: instead
>
> Yep.
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 13 ++++++++-----
> > >  1 file changed, 8 insertions(+), 5 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 39700b13e92f3..e8400b494687c 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -1871,10 +1871,13 @@ static void dpu_encoder_dsc_pipe_cfg(struct d=
pu_hw_ctl *ctl,
> > >                 ctl->ops.update_pending_flush_dsc(ctl, hw_dsc->idx);
> > >  }
> > >
> > > -static void dpu_encoder_prep_dsc(struct dpu_encoder_virt *dpu_enc,
> > > -                                struct drm_dsc_config *dsc)
> > > +static void dpu_encoder_prep_dsc(struct drm_encoder *drm_enc)
> > >  {
> > >         /* coding only for 2LM, 2enc, 1 dsc config */
> > > +       struct dpu_encoder_virt *dpu_enc =3D to_dpu_encoder_virt(drm_=
enc);
> > > +       struct dpu_crtc_state *cstate =3D to_dpu_crtc_state(drm_enc->=
crtc->state);
> > > +       struct drm_dsc_config *dsc =3D dpu_enc->dsc;
> >
> > Why? This doesn't seem to be related to num_dscs introduction.
>
> You mean the comments above these 3 lines? Yeah, it should be removed.

No, I mean that this whole chunk isn't related to the num_dsc support.
There is no need to change function arguments.

> >
> > > +       int num_dsc =3D cstate->num_dscs;
> > >         struct dpu_encoder_phys *enc_master =3D dpu_enc->cur_master;
> > >         struct dpu_hw_ctl *ctl =3D enc_master->hw_ctl;
> > >         struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
> >
> > [...]
> >
> > > @@ -1953,7 +1956,7 @@ void dpu_encoder_prepare_for_kickoff(struct drm=
_encoder *drm_enc)
> > >         }
> > >
> > >         if (dpu_enc->dsc)
> > > -               dpu_encoder_prep_dsc(dpu_enc, dpu_enc->dsc);
> > > +               dpu_encoder_prep_dsc(drm_enc);
> > >  }
> > >
> > >  bool dpu_encoder_is_valid_for_commit(struct drm_encoder *drm_enc)
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

