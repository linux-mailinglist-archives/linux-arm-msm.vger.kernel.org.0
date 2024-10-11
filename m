Return-Path: <linux-arm-msm+bounces-34038-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF87999D71
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 09:07:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7E5481C21E7B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Oct 2024 07:07:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC6520967E;
	Fri, 11 Oct 2024 07:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iEhpSdm5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D938635
	for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 07:06:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728630416; cv=none; b=fLvE+UTH7pOKnWQ8GINceXauhmCYqNqmJQBX9WTFIOrrib/DVOESwE4O2W0gvbZiwaEyO5kKWg4ihXJgRF83weWOq5zIz5aqQQlTr9sL0P+xX1tI8CqIlz4iE7sJvWty2Xn7ETkeytUPH4UEBTOJVdQ3Obx6ZS3KKXC2oK0kaqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728630416; c=relaxed/simple;
	bh=OUEq0owwHAkCt3sxN/Mq8rka0fcPjesIj/2Td3oVAH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iHmJVkyu34pboArfZsoBHRlUgZNYzTa56IEUzbi43gM4xEppAjf3bPQM9G2BCqLQZwu+nU8UbNOansi8xyyOhZGZGNzM24qsNw5FsCBFjFK5X1kW+4KXg03+bNaOYefTIaWnxfxJXizWi44BfnxBj/lsxwr0CRoxgThYQdsxuqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iEhpSdm5; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-6dbb24ee2ebso20636927b3.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Oct 2024 00:06:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728630412; x=1729235212; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KbDvhzRE0GcC1Dd4Kqw9/lX4StqtF0AG6/j/dYmGN1o=;
        b=iEhpSdm53iy/7JIxasQ7kLL4P2inSpX9JSGpxEF9oPcwJiiw1u5jk1GdWIvQKGHH1Q
         h42hzWALmMGeE/Wi3u69kPa/D4VvK9aG1imEoRRCz48y7FMd19gvLCokxPeHL/wtNTGw
         Kz8t7DRAkTSLrT+KZOowbnPMPPta/S4mZ0fp7ZQ6jIcy9Nx0gu604F1gzqDx/+O+7Q2N
         7mLGQhTR7fNbCdgLVnZLN5D84QFSQNWM9bn0B8JUJpJKAm6qlC1s0JUUMlui9SChdAzO
         pRhcNvX/jNhkj2imx1hTVphZCl2DvOh6FrFJHzP9pdcUTytZm7JqqE27JKANCDkgPnrk
         i/Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728630412; x=1729235212;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KbDvhzRE0GcC1Dd4Kqw9/lX4StqtF0AG6/j/dYmGN1o=;
        b=gh22Jl2KQrfhjGpryBSuyUttjRrRmD9Ul0ti3ypiKBzByk4z/xX3wMQUICPWI0qoLb
         JeiK1SM8DY6KBLcb9bqG+pTf7kBnwy2eW2+VZHq40WIA/rtwhv8RXFYXqCPYlcIH5lNz
         TUlL5Yk0aHSIAgaiggJslPJktT+hmgzzxZZZnRxPgi4DBj7epesND1wjbelezXn9mqR0
         D8BBuela0SigKuPk6KoAx2ZBse7Z2IDV4U+A1xyxhSiG9SC4bZ53UMOpmpNkcl9JGT4P
         3mSSrQMs5dTAqYCKIH78hyKtcmeEtUJHb8Huemgj3jgwYIl/PiIw9KtLmqaf9PPMxqtL
         Qtug==
X-Forwarded-Encrypted: i=1; AJvYcCVPUui6NCgBdiLe++deYtkZMYsAtrL6VenRPmcsLVNh6nExg2Zj4d5tswElQnnbwFAKgkmUCAVzUyGYobHf@vger.kernel.org
X-Gm-Message-State: AOJu0Ywlpzz8NGwKVaWmLQqVLI3VUFxqZM1c0yroGfP7uNa1ww5U2yoD
	tBYOyfgCnI6axhG0J7uDVPytIzHU2rCzfkJdYotO+YH9C7sxkF+hZD/dpu1EcDGrrzkvltSDNex
	fiWP/JLWLF7N3lzjYL4TDpYOMFinxnl25eJPxGA==
X-Google-Smtp-Source: AGHT+IGAqFf1aCWRylzQD2egBbLwi3qRNqcNEIYZaTvmCmq4ukOzJTKIvCqu2AgBinqdnGTEhCOpEXxLoURFTP8BrkA=
X-Received: by 2002:a05:690c:fc7:b0:6e2:b263:1045 with SMTP id
 00721157ae682-6e3477befe2mr12970867b3.6.1728630412570; Fri, 11 Oct 2024
 00:06:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
 <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-8-76d4f5d413bf@linaro.org>
 <n7bkvvxph2wxaxf2s7vonj273ouonlb2nisl7n7ora6j5stnlv@tt3v3uawwh2q> <CABymUCPV+bu-MNGCRp_0A+jC9Z6hY3XRm4vZ5Ju2XxT5YuRzPA@mail.gmail.com>
In-Reply-To: <CABymUCPV+bu-MNGCRp_0A+jC9Z6hY3XRm4vZ5Ju2XxT5YuRzPA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 11 Oct 2024 10:06:41 +0300
Message-ID: <CAA8EJpprO9pZ7bRf5HDA7-8UYKn5RiK2Yg9eW1NTYSEAE8ZDFw@mail.gmail.com>
Subject: Re: [PATCH v2 08/14] drm/msm/dpu: update mixer number info earlier
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 11 Oct 2024 at 09:30, Jun Nie <jun.nie@linaro.org> wrote:
>
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> =E4=BA=8E2024=E5=B9=B410=
=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B 21:12=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Wed, Oct 09, 2024 at 04:50:21PM GMT, Jun Nie wrote:
> > > Update mixer number info earlier so that the plane nopipe check
> > > can have the info to clip the plane. Otherwise, the first nonpipe
> > > check will have mixer number as 0 and plane is not checked.
> > >
> > > Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > > ---
> > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 11 ++++++++++-
> > >  1 file changed, 10 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gp=
u/drm/msm/disp/dpu1/dpu_encoder.c
> > > index dfe282c607933..68655c8817bf8 100644
> > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > > @@ -638,6 +638,7 @@ static int dpu_encoder_virt_atomic_check(
> > >       struct dpu_global_state *global_state;
> > >       struct drm_framebuffer *fb;
> > >       struct drm_dsc_config *dsc;
> > > +     struct dpu_crtc_state *cstate;
> > >       int ret =3D 0;
> > >
> > >       if (!drm_enc || !crtc_state || !conn_state) {
> > > @@ -662,6 +663,8 @@ static int dpu_encoder_virt_atomic_check(
> > >       dsc =3D dpu_encoder_get_dsc_config(drm_enc);
> > >
> > >       topology =3D dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mod=
e, crtc_state, dsc);
> > > +     cstate =3D to_dpu_crtc_state(crtc_state);
> > > +     cstate->num_mixers =3D topology.num_lm;
> > >
> > >       /*
> > >        * Use CDM only for writeback or DP at the moment as other inte=
rfaces cannot handle it.
> > > @@ -1170,7 +1173,13 @@ static void dpu_encoder_virt_atomic_mode_set(s=
truct drm_encoder *drm_enc,
> > >       }
> > >
> > >       cstate->num_dscs =3D num_dsc;
> > > -     cstate->num_mixers =3D num_lm;
> > > +     if (cstate->num_mixers !=3D num_lm) {
> > > +             if (!cstate->num_mixers)
> > > +                     DPU_ERROR_ENC(dpu_enc,
> > > +                                   "mixer number %d is not as expect=
ed %d\n",
> > > +                                   num_lm, cstate->num_mixers);
> > > +             cstate->num_mixers =3D num_lm;
> > > +     }
> >
> > Is it a possible case or just defensive coding?
>
> The value is initialized beforehand only in virtual plane case. So we
> still need this
> for non virtual plane case.

It looks better if it's handled in the non-virtual code instead.

--=20
With best wishes
Dmitry

