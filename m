Return-Path: <linux-arm-msm+bounces-42406-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD189F3D67
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 23:24:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C285B169250
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Dec 2024 22:24:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FECF1D63C0;
	Mon, 16 Dec 2024 22:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="icv5nbRE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A81D6188
	for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 22:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734387850; cv=none; b=Atr0PuyJsXkLgJ5y902ZDHxm0bB3CqnzNHPNtcB9d6q9F0424Uw/x5aveQzuJRh0ihRKBRHAntMRTqJE7OjKrZTadYK+sOnxPUQdOGNCj3S+aQGlc+JF/GSPQ3fuvW0ASv915SwRArVmSFU2jLPuWcY1RdUbEaNpqN/90yi4oLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734387850; c=relaxed/simple;
	bh=6LviHM/ru+IiuAWvPxDcpbR5i9G5GNycZOjMe7v7LE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WGJ3vO6ObCgkRLZR9uADWHizNeQGeCcPx5gQnZvuVEvbaPLpTwzK/L6iN17tFJEFLfUMT82Q4zG8omvuOIX6XtjQwSi9AU51enVSrGHmBoynAIhyFInrRRB9Z63UzMmRx0s1gsMX/Y+t35HcMwVKFudOzOJmbtGnYyx/VK8UxVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=icv5nbRE; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30227ccf803so50105371fa.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 16 Dec 2024 14:24:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734387846; x=1734992646; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=t7TrH1UvKd3oaC2SonGHzYdfePQRSyRbTdYf+pidBv8=;
        b=icv5nbRELljnWh65VM/rnDRMpP++K5x32IWvvLdp9PR+bmzWqL7hTdL83Seu3085iO
         5Ou65SUgUVgyajGDSPZ4p8/Xlk+9/S0ucN0CZ+bz65ce72dODbLSglsJsZ80kipUkzjt
         guAZEsWZW6ivwdiye9IRLefWAgnMdX2WUIDtX8czKXMPdiCkCEH53jyIltC1RgM1E9SY
         8x0GpPtJ7P8qea11ZGcEKVyQ25cVkqfLsqpeMnjrcmUft0eCWhr47vlJTdIdzxd0VEHC
         BaHlNswNynZ6XfB3qVHBVi77bQkdZcjBidQ3DHJ6pxPxCiGhGXUL+vJ/xMxGCYzQ/3xY
         fj4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734387846; x=1734992646;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t7TrH1UvKd3oaC2SonGHzYdfePQRSyRbTdYf+pidBv8=;
        b=AcKoNhO6Fd2zlQrDJ5KXGxO6MiOIVgGGcwAZdL5PsCdc2z5lgRdI6+keXKKZjArJ54
         +f9j6ylrEshp4jPcy4cYqkfMVSlVE1xCgWoxMES9uvS5xAJwigObGdG4RPWUm4c1oPsg
         aF0JuQtp8cC7aH5rVodOPy1VQteDoaGmZQZUABEWDvfAC+yFs3Q9QLGrN2nx9F5Az94/
         ws2LfsOYcy+/pIn2H469VWDKQ61T1J3tEJHWcc8F+63Spwxdp1H6fVYPIUPIppKAzcnf
         7eleEH/aSU0tZEVw7W1H2cKd8LQRPfOpJO9WQlcBevxbSXvi876dbqCqS1vKZjhYDDay
         sVZg==
X-Forwarded-Encrypted: i=1; AJvYcCUZlvKNCVAi7nFCIeO6gPWu1FDBqYJjUiJZ6vKdu8UOdJFu1BXyV+ce/RhQfS7dQXJJn24jrBO0KoC/JaNo@vger.kernel.org
X-Gm-Message-State: AOJu0YzCWDQooZtvtkjxZJhngMYmxRb4Zq45BMI0xWmzSXh11ta1x8t4
	gi/q8HC7n5GMgXTq7h03qnDvFFOkFpDcHRQQeOdqC2yVK+ZEThEM3AkHsO7M4gg85/cpUwt3A9I
	J
X-Gm-Gg: ASbGnct0UTAgS+Cm0UppIKLHkmJUso6BRKtCW4HFMbBWFxe7rze3OTMUVe8cqcKoWZj
	iDlqPVxC29p6aDwKKuy3odZEobSCUNwfCeYQebG+j2DHAAAKF7Vi457BxV1HKHjwAGhze4U+jDu
	MHPlZq6BMnxWvJ2W9HiecM011+9WnMWRiDlRths30lzK+zWv7xWjAX/QGejBT7NW4HU+BxD/0H7
	EQz2gWC+KLXGP4HRK9e78fX2DqtXh1X6g/yj4SeIFqAmtfkZzh9TyuHr3URL4PlrPA1P0lvazQj
	C9wRWQ1loWHivHcQITHXSS4OjRirxB/B51Rz
X-Google-Smtp-Source: AGHT+IGVrNsBIuWVRv0FfM+cys7dHh0GLTm6LZ/EdLm6AhlrYBZqk0DuZoUJzXDknWjG4LoS58j5OA==
X-Received: by 2002:a05:651c:1a0b:b0:2ff:cb47:3c77 with SMTP id 38308e7fff4ca-3025459d373mr53682521fa.26.1734387846495;
        Mon, 16 Dec 2024 14:24:06 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303441a43desm10440181fa.98.2024.12.16.14.24.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 14:24:05 -0800 (PST)
Date: Tue, 17 Dec 2024 00:24:03 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Paloma Arellano <quic_parellan@quicinc.com>, 
	Douglas Anderson <dianders@chromium.org>, Stephen Boyd <swboyd@chromium.org>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 02/16] drm/msm/dp: use msm_dp_utils_pack_sdp_header()
 for audio packets
Message-ID: <wfgn4oomnlsgckazp6z2cqoj5lk76gd5wmphrg6kwiomfvo2j2@rinnzg2ml7is>
References: <20241216-fd-dp-audio-fixup-v4-0-f8d1961cf22f@linaro.org>
 <20241216-fd-dp-audio-fixup-v4-2-f8d1961cf22f@linaro.org>
 <0cbe48cd-b830-444a-8de0-529343d86192@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cbe48cd-b830-444a-8de0-529343d86192@quicinc.com>

On Mon, Dec 16, 2024 at 11:32:57AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/15/2024 2:44 PM, Dmitry Baryshkov wrote:
> > Use msm_dp_utils_pack_sdp_header() and call msm_dp_write_link() directly
> > to program audio packet data. Use 0 as Packet ID, as it was not
> > programmed earlier.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 268 ++++++------------------------------
> >   drivers/gpu/drm/msm/dp/dp_catalog.c |  71 ++++++++++
> >   drivers/gpu/drm/msm/dp/dp_catalog.h |  10 ++
> >   3 files changed, 122 insertions(+), 227 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> > index 5cbb11986460d1e4ed1890bdf66d0913e013083c..46fbf8601eea8e43a152049dfd1dc1d77943d922 100644
> > --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> > +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> > @@ -14,6 +14,7 @@
> >   #include "dp_catalog.h"
> >   #include "dp_audio.h"
> >   #include "dp_panel.h"
> > +#include "dp_reg.h"
> 
> This change still does reg writes through catalog. Why do you need to
> include dp_reg.h here?

A leftover from the previous patchset.

> 
> >   #include "dp_display.h"
> >   #include "dp_utils.h"

-- 
With best wishes
Dmitry

