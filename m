Return-Path: <linux-arm-msm+bounces-30498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7D9969820
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 11:01:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DC16E1F2275E
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 09:01:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A7B619F10D;
	Tue,  3 Sep 2024 09:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZGIIrONB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E601C7677
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 09:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725354053; cv=none; b=XwUgMs5n18XU5a5tlRaAov0fZaXiQ48Gv1Hm20iJVEW6MQfPCeGyAGVk7+PaoJ+RkVz1cCddPyEcbaSl2UOLN65x3cws+CMLArvEPMPcTd7AHmElH68lEXNo3KEQz4MbQJNfxaHWMvsFJ2yBc6sQLhcWxc9y507zIO4XxlD9/zM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725354053; c=relaxed/simple;
	bh=mfPzwKJiRyttOkztC6CVO2sQkcwB2dc0Wn9oNn8O+is=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ej5v7IH2h9jYXVIyjP0hbAIF9FLYcice3dayKFzVz2w2KNpCvhtdwi2Oea6G/dJz5ATOqu7syB97GYdjcWUQGIXaP6l+Q9T0hZ0Ar1Rg8T1ARO14rYrw+anneOA+Brv3GqFt7pTBnn6DEzonEf9NePpZqJbJka4JwzmSUfu8rOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZGIIrONB; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-6b47ff8a59aso45262397b3.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 02:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725354051; x=1725958851; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IzXI1qraFC32y8PSZHxs3qrZ1v3I2001PgDQyaVPFY8=;
        b=ZGIIrONBjCwZRAlyds1CEAyuPrs9VklZGTyjuhGa3FnAnLypLoMaZS063NszXSgreF
         sq4O/JfnY1Pov5Lo/Im4bKQZCVKdD6aW67DBv75IfLwst5h5wYGVa+YpncKGt+/tSoJd
         lmh7pofizehO1766y5V1p9EHIwVxBVQLLuNfhqGnWiYKQamWzAav0bZR9B61oRsm0qEJ
         OymQBtj0/RrlogQVtV3+za06Gp0rkUvi6E2x5IyFLU1oVVnml3jQEqBdv0CcaS66JHqa
         pwcHkBoYQNLtPbStlhSfIe596efyqlLwrxrXlHjamfnyMqCSg6uH3zyVdjojFnCOiicU
         rlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725354051; x=1725958851;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IzXI1qraFC32y8PSZHxs3qrZ1v3I2001PgDQyaVPFY8=;
        b=oi943ECigGx1tyUvp//w8jLxETd/SL7uZeNFQQOtg7i5L6I5XfrGAL3t0wCeFaGLXV
         7z/gb5TRAd8tSsoZV676O8ts448hTag8+vQKSQhEvq5rwMel9/08PEucNjDTPQcBYwUy
         /0u++yIuq2c4Wc9JCkLn3qcZNUoFsSLhpdo6lBnXBH4ub7J7UzOqeA2hOPlLpIjrSlKK
         3wPfFYo8XW6gmrhi01IH0DU8IHrbIIQJSjDv9+y69mRB6PuiWJDZq91i1haYJFDGVmvU
         qYEP9Vb05C3qLhaYh4zSv+trtYCgKS4w//UOotIr4wcL+NkUti1B5XLL0eLh9LgHn+2k
         hYmA==
X-Forwarded-Encrypted: i=1; AJvYcCUlhOVwViBr8pHjAHj2CK08snHaZRa8etYme1CKNxrwb+WiXycECUyBOf8a/yUGA2dQSXecqoD+z3wkXmv1@vger.kernel.org
X-Gm-Message-State: AOJu0YwgY1Zn/SRWG7cScjS2VrQs/LUs3HvQYIs8tvJAyc5Rx6S5p3bf
	SdoBhkYLAEt2v+OE0Pf0N7UjteQNLWe75BgYJvRy9gqBeAWQ4IoukyYWXLjeBI15p7uGzjDKjD5
	CeA9Lc9eXSSUY77V0UPun9N6ExIz6LgIuZRYYAQ==
X-Google-Smtp-Source: AGHT+IEtqczCdvweUykaC6gAScFx3adGVghBsWc2cZOE9ORfMTjKVTP6UEs2Qza961LkgKnkP3BZH+Lmp9Oru9Wqm7w=
X-Received: by 2002:a05:690c:39c:b0:6b1:735c:a2fc with SMTP id
 00721157ae682-6d40fe14bcdmr140534407b3.27.1725354050728; Tue, 03 Sep 2024
 02:00:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-14-bdb05b4b5a2e@linaro.org>
 <CAA8EJpp5TwzCZ6bpQQzzVBpEwhi28s-fX9wwOtrasCAGDBdykA@mail.gmail.com> <CABymUCOWXUMgA-x8z3DonANYnUqTyJYgoekXTxALK05ihE+tGA@mail.gmail.com>
In-Reply-To: <CABymUCOWXUMgA-x8z3DonANYnUqTyJYgoekXTxALK05ihE+tGA@mail.gmail.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 3 Sep 2024 12:00:40 +0300
Message-ID: <CAA8EJppK=ngrNOXF8EbPubqWFAER6JqWp1z-GXYuL5hdAe_4mg@mail.gmail.com>
Subject: Re: [PATCH 14/21] drm/msm/dpu: Support quad-pipe in SSPP checking
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
=9C=8829=E6=97=A5=E5=91=A8=E5=9B=9B 19:38=E5=86=99=E9=81=93=EF=BC=9A
> >
> > > @@ -1033,13 +1030,10 @@ static int dpu_plane_atomic_check(struct drm_=
plane *plane,
> > >                         return -E2BIG;
> > >                 }
> > >
> > > -               /*
> > > -                * Use multirect for wide plane. We do not support dy=
namic
> > > -                * assignment of SSPPs, so we know the configuration.
> > > -                */
> > >                 pipe->multirect_index =3D DPU_SSPP_RECT_0;
> > >                 pipe->multirect_mode =3D DPU_SSPP_MULTIRECT_PARALLEL;
> > >
> > > +               r_pipe->sspp =3D pipe->sspp;
> >
> > NAK
> >
> I do not understand what's your point here. If multi-rectangle mode is
> used, the 2 sw_pipe share a
> SSPP structure. Otherwise the right half of mixer pair does not work
> and no display on that side,
> because there is no SSPP to handle in r_pipe setup.

r_pipe->sspp is assigned dynamically and it signifies if r_pipe is to
be used or not. Also if the virtual planes are enabled, r_pipe->sspp
can differ from pipe->sspp.

--=20
With best wishes
Dmitry

