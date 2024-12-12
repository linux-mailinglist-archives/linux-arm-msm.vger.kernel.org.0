Return-Path: <linux-arm-msm+bounces-41683-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 86B0F9EE1F5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 09:53:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3F12D167742
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Dec 2024 08:53:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6367F20E008;
	Thu, 12 Dec 2024 08:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RfLenfCc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A44020E034
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 08:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733993630; cv=none; b=QfcjHMdXqU+G9sMcz9E1ySXTsz/1lYQCiH4auatOIonCRV1oKMQF/OVLO2xGkJt+d92nNCsqpuVtF5WGrBXikPi1blPkqYrBTagEK1iuz06q45FAGhghzo2z/uIr+HQyT1VZuUjAEN0cjPqJcUejo/pyW71VnZbBhYxeJg1ygSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733993630; c=relaxed/simple;
	bh=CKd3ywzsf/FLM5LCKTkPgpmEbg/LoPi3ffcw+ebqEyc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gNznYb2zp+KDBZ+eEO+NiYUSsXLa5rybrOAtXspzmOoAiSc5S77yesHq7fDHsUb4QaAP9R1cnPXRZxWD6ihPSDeIVqZjvDZy4LKLDvkMgM7ulnoYC59NWUgTaZ/3LGGy/Tg98IA2HYKTp5ftia6IZEYawX/LykteOeJIavEAnQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RfLenfCc; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-6eff4f0d627so3185527b3.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Dec 2024 00:53:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733993627; x=1734598427; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jZEBuK4pOs6c3HTWubegCnIiZHcjHaJUyWhFqCq+52Q=;
        b=RfLenfCcfiwjTlyMiFP061Frazm0cPj4FisT+yTS3IF6H7vRYXAUtyputJcBRJBk8U
         9BhdcU/4x6mBa3B0BKEhia0YXTkdap3epWgAdhmEU+SRV4PXMgQDMQacXhwWPu/Yyi3a
         Or8E23o2RjkA6Sxee/ccOhhEDMWuuzxfUzlxTKY/Z85FO4v4fA1zyWUCyDz1OfaG6LZH
         tu+utnh96rZdjYdR0eDgBIbs5uLKzcVZaaFoEcZz79d5B3GZpeyF2hVF22G6pzv7XbUj
         pqYc2yt9LPWpRneTkMyva2gKmHLXwCpLWq+nFQZZjBY/dobRyH0D8YtPIYQUN7ggh1r+
         wvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733993627; x=1734598427;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZEBuK4pOs6c3HTWubegCnIiZHcjHaJUyWhFqCq+52Q=;
        b=Bj9AtCfYh8uCfv9/zyTkohmVLXa1/O2wFJBBX/E4bAv6g3qaB8iB4Eur3md99o675v
         wBsN7u6u0//AhRIBot14mzFy+mEJAzFpSHti9euefXjrzKIapNruBfN2xsfpisTwRwuX
         vCkh2BF7QxssS4znMj24vFK288kPNnojYDguRjMmc8iINCaTjjxswjx+kWS6+aD9gMCC
         B01yIKLrSTWosw+pFM7rQd5MUmZ0mDJKBiohFCL3/0InK0EGLsDeX5VzRUwwxKrUGqC1
         mP5LU/ok2A5M/pQqo80SW1jPEuMKNNWoO7iwc0F/yZQ5+WwRFgrYXYhUhsVqPVnDGxLW
         7tNg==
X-Forwarded-Encrypted: i=1; AJvYcCVMrqdZMFePvFNzakrPtixhxGQ3+T5Vrfp2wNHXmNFE0YB9IpEgWnWId9f0swcbbRlioS+gVf0P3Lj/Xk6d@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9zKNUzlbYU5t/t1hd7+2gao3IWKa4YX/Gn8UpjUC3LGyfb/I
	WOEWVw2S1e3bpgqLZDmK7ygvy7STIXC9t64pvGC8zj/EoPletQDLWYznvgePfZjbGqUhaJVA1oc
	4QqDSfo1vvmaM/+XkwtJpxVVBh5uM5gtSpNqygw==
X-Gm-Gg: ASbGncsn+Loa7u3vp1znZRMHK59n9cURzIloFyvfcpT+qV4j8yZkY8Lh/2wQp51jT4W
	m/1i5m7ZKESjUoVMcCcObbafslMAoKqUSRrgywA==
X-Google-Smtp-Source: AGHT+IHuMMpUZGzgJIoL8iRVB5xsC/iPL+AehWPaIVJ9O3e0hF+WNkPHFm5l3HR7vE/h6cbNRSKgt6leTQzgEfKxics=
X-Received: by 2002:a05:690c:dd4:b0:6ef:69c4:4dac with SMTP id
 00721157ae682-6f19e4f3f86mr22422457b3.15.1733993627421; Thu, 12 Dec 2024
 00:53:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
 <20241212-fd-dp-audio-fixup-v3-13-0b1c65e7dba3@linaro.org> <3346b2fb-1366-476b-bb52-e42a2170d719@quicinc.com>
In-Reply-To: <3346b2fb-1366-476b-bb52-e42a2170d719@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 10:53:38 +0200
Message-ID: <CAA8EJppthF3aVq0T2FmjLRNySP2pW36QnEXoWt5fFAKh+Nmz5A@mail.gmail.com>
Subject: Re: [PATCH v3 13/14] drm/msm/dp: drop struct msm_dp_panel_in
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Dec 2024 at 05:26, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 12/11/2024 3:41 PM, Dmitry Baryshkov wrote:
> > All other submodules pass arguments directly. Drop struct
> > msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
> > all data to msm_dp_panel_get() directly.
> >
> > Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
> >   drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
> >   drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
> >   3 files changed, 11 insertions(+), 23 deletions(-)
> >
>
> Change not necessarily tied to catalog cleanup, and can be sent
> independently IMO.
>
> > diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> > index cb02d5d5b404925707c737ed75e9e83fbec34f83..a2cdcdac042d63a59ff71aefcecb7f8b22f01167 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_display.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> > @@ -722,9 +722,6 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> >   {
> >       int rc = 0;
> >       struct device *dev = &dp->msm_dp_display.pdev->dev;
> > -     struct msm_dp_panel_in panel_in = {
> > -             .dev = dev,
> > -     };
> >       struct phy *phy;
> >
> >       phy = devm_phy_get(dev, "dp");
> > @@ -765,11 +762,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
> >               goto error_link;
> >       }
> >
> > -     panel_in.aux = dp->aux;
> > -     panel_in.catalog = dp->catalog;
> > -     panel_in.link = dp->link;
> > -
> > -     dp->panel = msm_dp_panel_get(&panel_in);
> > +     dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
> >       if (IS_ERR(dp->panel)) {
> >               rc = PTR_ERR(dp->panel);
> >               DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
> > diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
> > index 25869e2ac93aba0bffeddae9f95917d81870d8cb..49bbcde8cf60ac1b297310a50191135d79b092fb 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_panel.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_panel.c
> > @@ -659,25 +659,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
> >       return 0;
> >   }
> >
> > -struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
> > +struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
> > +                           struct msm_dp_link *link, struct msm_dp_catalog *catalog)
> >   {
>
> so this API, takes a filled input panel, makes a msm_dp_panel out of it
> by filling out more information on top of what was already passed in and
> returns a msm_dp_panel.
>
> So IOW, converts a msm_dp_panel_in to msm_dp_panel.
>
> What is the gain by passing individual params rather than passing them
> as a struct instead? Isnt it better to have it within that struct to
> show the conversion and moreover we dont have to pass in 4 arguments
> instead of 1.

We gain uniformity. All other modules use params. And, as pointed out
by Maxime during HDMI Codec reviews, it's easier to handle function
params - it makes it more obvious that one of the params got missing.

-- 
With best wishes
Dmitry

