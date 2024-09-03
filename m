Return-Path: <linux-arm-msm+bounces-30494-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 71FA9969758
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 10:39:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 215EA285950
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 08:39:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 253D51D417C;
	Tue,  3 Sep 2024 08:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRnDmP24"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 650EA2101B6
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 08:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725352746; cv=none; b=qPWpTS84H8awisADeOEhtZfMa4S/wxzq77O6lFd4hSTF9cKgm2mx4pfJ1N72Bmcn3rYz4oZZn+rJwHDoFYhCJvjWY6P298Bz7bPioqW4BpiFBMN49moTXqI+6UdwfTGAsua2DISZYuv5ORKo6HxxYsgaFzhF8prKbvocTkg3mvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725352746; c=relaxed/simple;
	bh=e5af9rbtMfwPdCktmF2EBrBC1PCNX5lMnFWNNZ5dkfs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCgZs04WXVbq+lOcRDwLqjMmaD+9QDPKgncWX41umAZBtOVjInLOgR84zCEXbA9aM4QuBLtKukdYujH3V0ut6orp4g5V7uorq0IWBR//FgISh3hXfHypaOX6HitX9aB4D5FzY527nzAmweuqlUSXJ7frERCA1lBnh0wWuM03hN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRnDmP24; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-6d9f65f9e3eso11771277b3.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 01:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725352743; x=1725957543; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SM1WY9R0jnBXvCH2B20Ux18/9VPyZZGXYMi6xyrsvoY=;
        b=cRnDmP24nfHUAsMeFjCxTtr/g/8HBiO7ktSOd1AqE+v+JfLd6sk6u/71jlXL7sdIRR
         KBF76ihLP4gIgZjkDNrL6SQDKjxHomcdNlol2A71VVAJzwuOyLePMElI/f0bxmMSJ3f9
         K2XxbXt5T5GQR36BXENSRQhnoXODEwgdcPrMQuK0aTc0tQczRrv+rbrOCWuGxh3loQCR
         n+iesaFiYkNj7B+yz7BT7FJV8SE+Xkg68kMkuODjMsdm0pm2AdDSsDTY6GKtO7gHiWHR
         eIab2zXMXU7wbEF75YodqLzkZfqa4oc3TqZuOGyoFyVyCNQFc1YHAqhaPUXiRbjAFt1L
         B++A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725352743; x=1725957543;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SM1WY9R0jnBXvCH2B20Ux18/9VPyZZGXYMi6xyrsvoY=;
        b=Dyn0syCHoS7dd4Ic760q306ZUsApLKwCyLtu34W3zFxnu5HCVuw713UEGmd80lOmMf
         Uft0QzvOdIcIrA9M1vgOmRsaVnANRUn0oX47O4NkCE7Wls4xYP53KUgtrTCrdaDUXL19
         Qk6Pn0lrqrMCPaOWwrdma/M5si5SRzbihLC9mA7a73pVZgRXwkk3Q0XfX2pZXhmOFyVj
         fii2uht1yLelwm3ssD2byYfis7zXA4aHUpPTSL+uRQRbDcNPDOGG1MlA1ht0tReT/hmY
         zvUH2zbfFWrV0QaOe7yhOao/oMKX/Ld1VIvYxhZnxPkl6D4eOxlxcniATCUQPlWRHww1
         Sg5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWF41y4yB1PJMHlylBk9TKAfuO3Ubk5Pm2CZprDSRfHLvSStcf+1u3+5ZdPR5PiYI7rbc3a1TIdJp+gy8U4@vger.kernel.org
X-Gm-Message-State: AOJu0YzBXnjxdyuayiT8fBcWt96is7Sv9Zuf010ORW+XApgYvECCZjOL
	9XK+WyxwNBSqtmGU8gnSLVTJudoR//Gxd3PoOOThxRiVeVnf6sY7Ad07MIeWve4U5w2KQDr3nxB
	6PwkhScVh8AsHZmdiGpS6G7Q2Y9ynx5KhsBoUnQ==
X-Google-Smtp-Source: AGHT+IFbM1gU4uS9xIx6y43JcKI8YAURVYh6pDj9pYXO/pSHTCFGSGpn1z9v/8HVe+Fc4cpzOy4crENudRNUXfcTqTk=
X-Received: by 2002:a05:690c:ed6:b0:65f:77c3:63a0 with SMTP id
 00721157ae682-6d40dd7035amr137045667b3.7.1725352743184; Tue, 03 Sep 2024
 01:39:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-7-bdb05b4b5a2e@linaro.org>
 <CAA8EJpqZjO9rfVgVkhyCpg9qfyc13MHtz=RRhZG6ihMsVM+bSA@mail.gmail.com> <CABymUCMCjYfXBOqXcLGZvH6CxU7Z_Qq1kKioZGC8PCORjtJM8Q@mail.gmail.com>
In-Reply-To: <CABymUCMCjYfXBOqXcLGZvH6CxU7Z_Qq1kKioZGC8PCORjtJM8Q@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 11:38:52 +0300
Message-ID: <CAA8EJpr1YxwFE5k3F3wjP2Gtf9H7ve7751OwJp3dVNKYiGsnZA@mail.gmail.com>
Subject: Re: [PATCH 07/21] drm/msm/dpu: Support dynamic DSC number
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

On Tue, 3 Sept 2024 at 10:48, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B48=E6=
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:10=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Thu, 29 Aug 2024 at 13:20, Jun Nie <jun.nie@linaro.org> wrote:
> > >
> > > Do not assume DSC number as 2. Because there are 4 DSC in
> > > quad pipe case.
> >
> > Please expand the commit message. You prefer brevity, but your
> > comments lack clarifications.
>
> Is below message OK?
>
> Current DSC number is fixed to 2 for any DSC usage case. While there are
> more usage case that involve different number of DSC engine, such 4 in
> quad-pipe case with bonded-DSI scenario. So retrieve the real number with
> this change.

Please rewrite the last sentence. See
Documentation/process/submitting-patches.rst "Describe your changes".

>
> >
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 4 ++--
> > >  1 file changed, 2 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index 6bdd9c21ff3ed..05b203be2a9bc 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -553,9 +553,9 @@ bool dpu_encoder_use_dsc_merge(struct drm_encoder=
 *drm_enc)
> > >                 if (dpu_enc->phys_encs[i])
> > >                         intf_count++;
> > >
> > > -       /* See dpu_encoder_get_topology, we only support 2:2:1 topolo=
gy */
> > > +       /* DSC and mixer are mapped 1:1, so reuse the mixer number */
> >
> > Why? DSCmerge is a valid topology even if it is not supported yet.
>
> DSC merge is already supported in 2:2:1 topology without this patch
> set. This change
> is to get real DSC number in 4:4:2 topology, so that DSC merge can be
> enabled for the
> case.

Yep, 3DMerge, not DSC Merge. Basically the comment about 1:1 is
incorrect. See sde_rm.h

Also it's "number of mixers", not "mixer number" (two different things).

>
> >
> > >         if (dpu_enc->dsc)
> > > -               num_dsc =3D 2;
> > > +               num_dsc =3D dpu_crtc_get_lm_num(drm_enc->crtc->state)=
;
> > >
> > >         return (num_dsc > 0) && (num_dsc > intf_count);
> > >  }
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

