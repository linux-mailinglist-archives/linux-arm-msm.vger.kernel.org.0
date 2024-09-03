Return-Path: <linux-arm-msm+bounces-30544-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 560A896A3C6
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 18:10:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 14895286A24
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Sep 2024 16:10:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B435518BBA1;
	Tue,  3 Sep 2024 16:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Wx6v5xKW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C05AF18BB91
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Sep 2024 16:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725379787; cv=none; b=X1N6pNjFm/88XHYotASag/BJkLkQiaSTKAPc5Dw33O3QsaWqQdTtTT8izpebuhU2Kc58zAOZOnatTzV3Ee/9IbNgQDYh/SQn5ZDJITzl+Y7tU7IXsrr7SSrAYuLUp3jo76G22VPwq759cg15zK1D5/W/pa3xtTtnhowJAD4+BlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725379787; c=relaxed/simple;
	bh=jq0wppVOHMajjCB/klidz4rCB87VGjTxCJBr+khhGn8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BzEwy6TNWYJt6pdubcQZfPi/CaMwJLuntl6HfhiBLZU0pmut5gLM5QTjDfIzBb1CfAKfSbMEZDRQlCjIkFBEhI9hsFa50v7MXKjFW8NFiMiP5G2ZPz3rSW4PvAx3seu+RfLvlYUHfA3lSQO+Emr2tTRXDbdU8Uyxhg2q4OM1pZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Wx6v5xKW; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5344ab30508so5945007e87.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Sep 2024 09:09:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725379784; x=1725984584; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pA4+e6iz7B2aVNnWGkq9LpoEssVLpjsdYRVXZGTjr7Y=;
        b=Wx6v5xKWyHBX2AAV3APTSCKCY8AGvPvY8jWYF5pdNREt+ewuiDrG8np24OHjAIH2mv
         6+DVo5s+/RXMR9C3J6DT9th2hBCPNkoDdAPBQqySc0RtUlcaCC75492mtFoHoHWSnVX8
         QxkhY1/P+ZkloqRnDqa12Ur9WVUGSUXcKpw5RQdZ+rBp8ybWtRiiXHuBaelhcmUmlFWa
         a1p3NCHsrda98GEfpmX8POyNvFoo5K9vRzIqQ3x09LhEdbVGnL7EB9HEgoqX9HtMPw+J
         +yN+zNPUv+2WTEEWUvA3gjOokDUfUg4Umpb8h/0NtnLkmUXQdt5PcFhJ/vqkb9WpPRPK
         TDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725379784; x=1725984584;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pA4+e6iz7B2aVNnWGkq9LpoEssVLpjsdYRVXZGTjr7Y=;
        b=lnJaiAFg+BFbmk2ZCc6XQCrxnz4Ox0qdhOoWuB/zjW3nf7O8+tKm7STqug5BLH7USS
         fjK2HCmPvRDi8QkV4Vow2NmhSdPx94L4i/394Uuue/YBLZWKIqwCS8LSL1itGR+YJACV
         2aj1wc6hZFzhTVHJIMRi7gJVZyZpvU4CQkqMI9hQgBbEPlLdN1vWwCLenfz4BrzPAYfR
         aKSjTbcDr34HcrvSKaz4DSXvO5DqxZbL09DtRXplslrDEx7g2+6OVgRRkm6rY09YLmYH
         dExojkq4Dn//tukH0aRGFmrcms/Ufu0fwViCDdXo9gvH+22YtjxWUoNW8vSCWRejpeYw
         OE5g==
X-Forwarded-Encrypted: i=1; AJvYcCU5NvLkXMh6JAamhGTXHEw43vHyx9Kwrnjwx5mOTdvTac3uyeSlhd6lDWNfl2EVmt8iLVOE7yOrZdidzVqF@vger.kernel.org
X-Gm-Message-State: AOJu0YxFqVbrpLD0+3Ml+/bCbSM6a0rU0SopCQXNvl4BSNC8zveyecil
	4Uq2uez4yirEsWCM27cbyHVAjMWaAHDjwykhMVIv9wEoUeIzrkmXWwNFzFlaXZLr75ir0Fdusd6
	kWxHjWQ1uSzyZobGuc3762GDxiMe4kH/Tquam6Q==
X-Google-Smtp-Source: AGHT+IGRHktsRm1HDEhsFIDzbmUbTSXuUPrZPQCHgHDmunk/OKRP5dnXPD28QHNSKkwKkLB34FVrCkcx7HSZCUjaQxg=
X-Received: by 2002:a05:6512:1045:b0:52c:dc56:ce62 with SMTP id
 2adb3069b0e04-5353ebafcbdmr5681695e87.12.1725379783701; Tue, 03 Sep 2024
 09:09:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
 <6kecwqe5npysc3rup5tkij5iepgk3pf5erattfv25caedixaml@6zev3sdwjjbu>
In-Reply-To: <6kecwqe5npysc3rup5tkij5iepgk3pf5erattfv25caedixaml@6zev3sdwjjbu>
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 4 Sep 2024 00:09:29 +0800
Message-ID: <CABymUCM8zu1TY20kuEn7Dt9uDDC0hL9YAimWsTXnxDJeJFuiog@mail.gmail.com>
Subject: Re: [PATCH 03/21] drm/msm/dsi: pass the right width to dsc
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Marijn Suijten <marijn.suijten@somainline.org> =E4=BA=8E2024=E5=B9=B49=E6=
=9C=883=E6=97=A5=E5=91=A8=E4=BA=8C 18:12=E5=86=99=E9=81=93=EF=BC=9A
>
> On 2024-08-29 18:17:32, Jun Nie wrote:
> > Data width for dsc engine is aligned with pipe, not with whole screen
> > width. Because the width may be halved in DSI bonded case.
> >
> > The dsc width is not related to the timing with back front porch in
> > later stage, so update dsc timing earlier.
> >
> > Signed-off-by: Jun Nie <jun.nie@linaro.org>
>
> I already sent a patch for this:
> https://lore.kernel.org/linux-arm-msm/20240417-drm-msm-initial-dualpipe-d=
sc-fixes-v1-2-78ae3ee9a697@somainline.org/
>
> And then came up with a better solution, outlined in:
> https://lore.kernel.org/linux-arm-msm/7fqwkryeumkt7zxsec6va7ys22nfs3tr4rr=
cz323extdz3f6zv@w4uu2lk4uh7v/
>
> Would you mind dropping this patch so that I can send a better solution?

Sure. I am happy with a better solution from you.
>
> > ---
> >  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++-------
> >  1 file changed, 6 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/d=
si/dsi_host.c
> > index 7a4d9c071be5a..5abade8f26b88 100644
> > --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> > +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> > @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host *m=
sm_host, bool is_bonded_dsi)
> >                       return;
> >               }
> >
> > -             dsc->pic_width =3D mode->hdisplay;
> > +             dsc->pic_width =3D hdisplay;
>
> The other part of this already happened in patch 02/21?
>
> - Marijn
>
Patch 02/21 is just for parameter validation, not directly related to
this patch.

-Jun

