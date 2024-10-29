Return-Path: <linux-arm-msm+bounces-36338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 16FAC9B53A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 21:31:10 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 997C61F23ED4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Oct 2024 20:31:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 52A88208237;
	Tue, 29 Oct 2024 20:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wiVS2gzL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F523192B74
	for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 20:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730233514; cv=none; b=mndOfNn99tmoMhLgcyZ2hu2gsokzOhLuU5HHxhQtokNJhvmsIRKowrb0AsIJMxnmHrSDE7YAtudqcSEO8gk84mP+zKwSM9jOWBtHm0gtfy3SZYJYgZ59HspWISzPR4cYwpBZcGsseCJsdH7SgZ+hX0F+iHi4OMQkRVN2os+AG8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730233514; c=relaxed/simple;
	bh=Cdq5WzIzYiSL79xJC9IxPZpy+THtLin3kptHx+ymums=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n2Zd5fRmIyxYgEcr5YlKkrHGJvSjoi6x6O9otW80T1Z2Ra/ZTJg9u4VbwWgQRuPpzTRKOTA/KzeXi1mR24nNV5lGHRcp1aUtKm90bV/7D9qi6CCd5KKmAz324eLjmKLHI2XpxK/KBfD1FHtoi08xEibOdCDYX2kArLGWTlnp6Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wiVS2gzL; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-6e9ed5e57a7so25309917b3.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 29 Oct 2024 13:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730233511; x=1730838311; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=mBI2uNkuJz5hUFFer3XXwlG4B2x7GV7bsYE7YJzJyF0=;
        b=wiVS2gzLEp+2GZnv3fI6OOTlhr2VFr3e2DgicBSo3KsgzJXfFJMj7GfygA6mnE6n1I
         mb/ME3t+1dZANdVjtGRgOsreJ5Z8zvntfCfJ/HXPcSLJmX5r3JJ6a/Y/+l1r9Fei2etS
         kxtzdeDklbP5Jt6Vdqom7tdkkwcNC4y5i3mKgrO0H9Tn2GaBHKT4wuaym2dDVQ2X96UG
         ywZEDhyNEjlz4+yyNHIqqWLVO5CMmJOBqUvJtf4Ut55yAvgLiqKsHKerOpBvDKy9Saus
         5cbhVXr+/O6eoK9oYFTGI6Sb5Kcmjp6Ua9+Pu4WLnTCf1wSaaEo4h1gHl1sGifK6jKvp
         aqRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730233511; x=1730838311;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mBI2uNkuJz5hUFFer3XXwlG4B2x7GV7bsYE7YJzJyF0=;
        b=LPpPw1jq1RPBc+6NvOqOVEARxQBrJpBWJjPYkbaEYFciIRWYA6t8CIVyi2wing/p6O
         NyPC2WeTYL4XnG4ylRNAGr6wJw8no+Cd1ff7+9R+NLIQIq07N24voNnNvcfck9wfkFGF
         8YDgiSk4z2GpJJ5LlBpmTml4GWbQ8GPUXNk5878EDysLRztDvmnDllGoYhzJaKEIAnDf
         dKvgwtf0fETnsLRf6pmPGFRe5Usvwm9Cr0u2I2c7Ee5TKSXWDeWCl16hfSp47620nYdX
         JYqEDebOGfWzyvgpOQsOepxnvYYkeQt0f+3xAKb/qxzpi4PuC+r9zwrwz0dPxXS/5/bg
         45EA==
X-Forwarded-Encrypted: i=1; AJvYcCXTVjhlSitz20DDhqnqc6ZfO3ESaOoCfek67Z74cXbVM6VrBZ9mVOH0xSrHKwf4Q7en4Qbi7u4aOvCmfnG3@vger.kernel.org
X-Gm-Message-State: AOJu0YxvF9TIm5QVqZZChdA3L22hrNvb3vg5ve5LDYMlUxbDAIxG/rEn
	WgYuo4JnMSjZZ3lqxKbzLQg1QIbLtIIILT+i4BuEKZsVTvXxmu+eO2fJHbP8RvV+XuQr4VKUNrD
	DTQUAqI5uHC+CBMprAnjoDuPA3HFC5c6PxzmiEg==
X-Google-Smtp-Source: AGHT+IG6cX2wf0btAXPAAKNWp9X+HWlDbdwmWyBjB7hXl2DJFXF4XbNv617o/puLRUgalkZOG9h9QJAkPDP/9SnuOAI=
X-Received: by 2002:a05:690c:d8e:b0:6ea:34b1:62e3 with SMTP id
 00721157ae682-6ea34b1660cmr28135337b3.7.1730233511044; Tue, 29 Oct 2024
 13:25:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241028-msm-dp-rename-v1-0-a2564e9457b0@linaro.org>
 <20241028-msm-dp-rename-v1-2-a2564e9457b0@linaro.org> <3d142f8c-f7b1-45dc-9a4b-d0b16843a8ba@quicinc.com>
In-Reply-To: <3d142f8c-f7b1-45dc-9a4b-d0b16843a8ba@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 29 Oct 2024 22:25:01 +0200
Message-ID: <CAA8EJpqXE4U4nH8yjtYEryJ4ZOmnDxo--+eUm2_AvDymufjVjQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/msm/dp: rename edp_ bridge functions and struct
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Oct 2024 at 20:08, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 10/28/2024 4:49 AM, Dmitry Baryshkov wrote:
> > Follow the estalished prefix and rename eDP bridge symbols to use
> > msm_dp_ prefix, moving the edp to the end of the symbol name.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_drm.c | 36 ++++++++++++++++++------------------
> >   1 file changed, 18 insertions(+), 18 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> > index 6a0840266c0f..ff9ce9b15234 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> > @@ -115,7 +115,7 @@ static const struct drm_bridge_funcs msm_dp_bridge_ops = {
> >       .debugfs_init = msm_dp_bridge_debugfs_init,
> >   };
> >
> > -static int edp_bridge_atomic_check(struct drm_bridge *drm_bridge,
> > +static int msm_dp_bridge_atomic_check_edp(struct drm_bridge *drm_bridge,
> >                                  struct drm_bridge_state *bridge_state,
> >                                  struct drm_crtc_state *crtc_state,
> >                                  struct drm_connector_state *conn_state)
>
> msm_dp_bridge_atomic_check_edp looks a bit odd.
>
> What about just msm_edp_bridge_atomic_check?
>
> Likewise for other edp names.

Yeah, I was torn between these two options. I'll switch to the second one.

-- 
With best wishes
Dmitry

