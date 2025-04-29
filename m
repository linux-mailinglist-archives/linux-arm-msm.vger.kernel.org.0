Return-Path: <linux-arm-msm+bounces-56107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34456AA0900
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 12:58:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0B47D1B658AE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 10:58:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1E58D2C10A2;
	Tue, 29 Apr 2025 10:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L37KPNWE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4860C2C1098;
	Tue, 29 Apr 2025 10:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745924251; cv=none; b=FsHGo1t6tXRTuLfA6rKmDGEyBd/sCclt6/SAf9P3LWrMRHoPtGWYL4t8cmF2dJJDdUyiyojJUvXZegJnjWexRR+ADYe4pm/xWS5S/xyCj9mnrHuSTVsm3Vbt1RIsyk9kOqUNeUDUtIFuH443dCsT+lasD+5zOzvihU+5Lqe0K5g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745924251; c=relaxed/simple;
	bh=Uvtd6fy4RCGG//kBsfKgM+4FFLLpycksKJkZw5rqC0Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vFuQ8rLschOfo8DNg0pdOvV/T2J5oVWpIZrvpEmYrffB6xRfK6B0zwzHnxtPFzhmPiZqbpsPK0QbeNCbWq87cg4qwlMw12auYSOcThuBKi/BIkkoJHPkgG+lTSLX320+7uO6nbNBq2VzVvaF21cNeYCJ9hsrX2jNq5Dk+aMJSRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L37KPNWE; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-43d2d952eb1so38625475e9.1;
        Tue, 29 Apr 2025 03:57:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745924247; x=1746529047; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Uvtd6fy4RCGG//kBsfKgM+4FFLLpycksKJkZw5rqC0Q=;
        b=L37KPNWEJek24kTksiYtJqmdvDbimj0ZH9vRAdgfOhYojc7aTcWKmOHJGDEZbyTkO7
         MamAJILCTtp0JmquVgp2q+dmqkBGUnlSLuvMN4szGBkwyHhWqFg9yxZ8Q7xYLaKsMLmA
         lrDK4WMaX1+vl03X1SEscsoGtVbkFf/KNkBPfNaY31hbYkaX+mow8PCXdSQ0R5VnX1zh
         1viito69Rx5dcH4DLcLPQWnqa0LzjGYzrn9mqaEefF7ju0154FHwUnJ/1GapbZpV1oLD
         ZYBr7bjuWcKY/QQFOoO4hM7NRe60N1XOHvpEwgSkm7ntyvFGn/vPZ41ckTj4jjPZuowI
         f5MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745924247; x=1746529047;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uvtd6fy4RCGG//kBsfKgM+4FFLLpycksKJkZw5rqC0Q=;
        b=PPyhLz2r9nhdpKPu8Mb0BonZZuAYPyC32uxUkMB4yUF4yO1hfgEyi7NannkY7cVmIc
         dMfAxagsqqfXscqMJVd8twxtybnUPHGMC4hiATUEuwXmXXuWl3vyAcdYwjkPeIDg4YJu
         8zf+NIiPBO6S0+MFCWUZOSrhzckdFeHRzSsrU04AD/0I0ZKaZwFILbBPwFTEmwt5o0u1
         X1kmYjPeLkrBQDGyhtwUwaCRCvyayTukfg36LhU8IE5OW2mQKFu3vMJBOXg/RNZdmmMj
         BaEty1u4U0vYYOGWUghVk9U8PrkS68I6wYflNuZQ+th+kMjhkZ9Yy/EYDHhmUlAYDyCm
         uR2Q==
X-Forwarded-Encrypted: i=1; AJvYcCVKHw6vuYZUIyWBhiCX9qdwU2LoMZcHSP+l6zPlZoPRHMVlgwufv5BmkiFIwz6ebKyptCVqKuW8zh9fvosK@vger.kernel.org, AJvYcCXdFN7xeIajSW6esb1N5ohbqLkbaq5O3brg+ztraEP7wgp/b5PEQM6skSQIafVbVfLyEInTTUHXlD+03ykB@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7bx3IyYRjjCZqvrHr9yo1ZaAEHYeyhfY9ZsUmzXSqcDtEO9mF
	LhE/4ELjlFFgUudG+vzCr8hBZ+ezZwc8+TqrP08n84bmh3riGPavkfRVLwDEemxUBRaxrj1X2jT
	shCZ695Z+zxoa2XDIeFKvBOZjLWmBzHEWgA==
X-Gm-Gg: ASbGncvoGDsEJ+kg6wwj6UyCUlOJ1l/P9OFXnRg2qfsqJLqRNxsmLyDF/i6FCl7RJQ1
	6k6mB9CE1YTn4nS2GMMA+aemUMLGHYbJzluMZpzFja54xzS0ZjCWBeVjjUA2y46yQljlrLhcpce
	D2TuR0ngZnAEF3u1jQVQqg7g==
X-Google-Smtp-Source: AGHT+IHirYlnb/J0Rw491chdfeUL8F8I4KZrN9hJ04U8tCSV4ragmKxqYNjWe5UdaZyFQMvJteyrgFv9C6magoKSZoE=
X-Received: by 2002:a05:600c:1550:b0:43d:79:ae1b with SMTP id
 5b1f17b1804b1-441ad3b5ea9mr23239755e9.14.1745924247107; Tue, 29 Apr 2025
 03:57:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250417021349.148911-1-alex.vinarskis@gmail.com>
 <aA8yFI2Bvm-lFJTl@hovoldconsulting.com> <CAMcHhXpmii=Rc9YVeKXaB17mYv0piSFs02K=0r8kWe5tQGk7eA@mail.gmail.com>
 <aA94yOjsayZHNDpx@hovoldconsulting.com> <aA+N8YHX0DZ6h9Uj@linaro.org>
 <aBB-gl150GVaZPn5@hovoldconsulting.com> <aBCE3wSG2g5pp7jg@linaro.org> <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
In-Reply-To: <aBCH4oo7dbG8ajvP@hovoldconsulting.com>
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
Date: Tue, 29 Apr 2025 12:57:16 +0200
X-Gm-Features: ATxdqUFvmRK5viywa4f0WLPi0f48GWdtHCGAXUyP3eWhlaokJqLCQWixu2VChH0
Message-ID: <CAMcHhXrDEVrM4fEyMwZ9TDgqgY=s_mTcKZMacCoUuZ2fa8FhWg@mail.gmail.com>
Subject: Re: drm/msm/dp: Introduce link training per-segment for LTTPRs
To: Johan Hovold <johan@kernel.org>
Cc: Abel Vesa <abel.vesa@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	dmitry.baryshkov@oss.qualcomm.com, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, laurentiu.tudor1@dell.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 29 Apr 2025 at 10:03, Johan Hovold <johan@kernel.org> wrote:
>
> On Tue, Apr 29, 2025 at 10:50:55AM +0300, Abel Vesa wrote:
> > On 25-04-29 09:23:46, Johan Hovold wrote:
> > > On Mon, Apr 28, 2025 at 05:17:21PM +0300, Abel Vesa wrote:
> > > > On 25-04-28 14:47:04, Johan Hovold wrote:
> > > > > On Mon, Apr 28, 2025 at 11:06:39AM +0200, Aleksandrs Vinarskis wrote:
> > > > > > On Mon, 28 Apr 2025 at 09:45, Johan Hovold <johan@kernel.org> wrote:
>
> > > > > > > Does this mean that the incomplete LTTPR support in 6.15-rc1 broke
> > > > > > > adapters or docks with retimers in transparent mode?
>
> > > Ok, but my concern is if they may have worked in a default transparent
> > > mode.
> >
> > But if they are by default in transparent mode, doing the setup to
> > transparent mode will not break it in any way.
>
> It looks like it will, see below.
>
> > > > X13s doesn't have LTTPRs on-board so when reading the caps, LTTPRs count
> > > > would return 0 and none of the of the transparent/non-transparent setup
> > > > would happen.
> > >
> > > But this is the crux; does any off-board LTTPRs in transparent mode add
> > > to the count or not? If they don't, how would you ever learn that there
> > > are any LTTPRs? If they do, it seems we may have a problem here.
> >
> > Count gets increased either way. It doesn't matter if they are in
> > transparent mode or not.
>
> Thanks for confirming. So then it seems we do have a problem as since
> 6.15-rc1 drm_dp_lttpr_init() will switch all LTTPRs to non-transparent
> mode.

In this case, let me add Fixes to the entire series. Do you think we
could land it in 6.15-rcX then? The second option proposed to roll
back current LTTPR support and wait until 6.16 will completely break
DP output on all X1E, so it's very undesirable.

This series was tested quite a bit on at least the X1E/X1P devices,
both with and without docking stations, as it is also (v2 iirc) part
of Ubuntu's concept tree since little over a month ago. You have
confirmed that x13s also works with this change but without a docking
station. If someone could confirm that x13s with this change does work
with a docking station as well, it would be safe to merge the entire
series as fix to 6.15, correct? I could reach out on #aarch64-laptops,
perhaps someone has both x13s (or another qcom-based non X1(E) device)
and a docking station.

Thanks,
Alex

>
> Johan

