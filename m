Return-Path: <linux-arm-msm+bounces-26507-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D772A93449D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 18 Jul 2024 00:11:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 156101C213CB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 22:11:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AEF3481D5;
	Wed, 17 Jul 2024 22:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UuxXmvNr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E7855886
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 22:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721254296; cv=none; b=nXawMm+U2ouxrjW73aoodUq/vynsvrG3ckgRYnKfRSm2vmO5HjgI+SWDGlJwI1FXdofMkGoSJo3rQNqPG1N7bB9iJG4LQy4ifM8zWXbsmwRNnkAZ84pOX82wFFRAle5aETErA4EELNoV+tY8BdS4lYGI8yWU2Jrm26SCd4BAKfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721254296; c=relaxed/simple;
	bh=mN46T/B5S0+VZbxv+QTvO7CnblMS2+dX0N0FDtySNaI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1s26jy9vzQkLBLSz1dtl/qziMVhmyzznaWGMIGgm1ysT4v3KzCBUx3yFLTmX1OnOzS97O+KjGs9iIO14j72m2Ly6xxQNOapH4EC3a+VMcUNYWY+zu3KexH0ur+qK90aCwgGWQv2/PBFWYdazI6pw2BRh61Co5qNkE5ypMbY15o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UuxXmvNr; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-2eea8ea8c06so3028221fa.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 15:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721254289; x=1721859089; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+YdknVgUnt+O5pCK+EMdo/Gub1e64a/mmcVnpk3pt8s=;
        b=UuxXmvNrvkxiKsqOLkrF01r+DRzTBr7CtcU1mU0l7kplkA3w3KN4VbjhQIbfRHCnjA
         CZti63WNCQodUOUiZ2WMOfyep9LyU6ul1edba/UJwWAf+ueR28r7l5vBa1T5dBWWdzXP
         kHvuqn8SEqUVf7oE4Q/t2xseGnvW3ZznH4IyQJOguSn9z06BUKlrd66DI3OCI6em9Vf/
         Bw3tltn0ArpjhCYd6bWVhvqlsC0W5Dguo7BK0o6OLLTB2ZG1SOUDTKKGvc4oG8XL44Kw
         AdRo3HbUlvcJFJZ9NqcOPRCk2DGzCe+LP5dT4s81oU/e8RD5TWY/LlvhGtdv+WIaKWAr
         tGbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721254289; x=1721859089;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YdknVgUnt+O5pCK+EMdo/Gub1e64a/mmcVnpk3pt8s=;
        b=IHFFQsJz2j0x5aMg/co4TvXjwEqT4dPTLVqCH747dSypyXobjQVQMGos+KZZqJe5ie
         bvSVAw6eZxIs6NsyeGxhBv6Sblu+IVIovjjZKIdauocET8zaKypEEKtX9mGnjrsP8E2K
         UQXluE3VNq+u38cmG6AWWngEPbuQlpTeA9AB9NcVgBWx7lXKbb7td5kB6oL60OVHSo15
         2KTtpleVw2Y1fyW6a9LE69ggOgpa3+P1S4aF7pgzJ0tspMvWiYCBjOpJYyYcd85Hjr61
         FjnwE+Aa3CALO5P2LlNd6e8qlf6C1nDB98eDW88q8bErBQmVyozXM6L4mlyCvsNNcjGp
         UHcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmg/VDoSCXvTWV9KkuRLafQQgg2TaiJ0DRSSmyQ8Zlv0X/0xsIG6ZCNmZPJvLmgVcwm6AAsoyZ8iL29Pj3+UnKVfAvL3+WN2W+iy0wEg==
X-Gm-Message-State: AOJu0YyJlN0O14pCYxSIqIvDpB7oOcbGUk/Hb0K0Ryx0aJ0ntE2g6jr1
	68h47qMRaEKZhquD7Y3wC1a1siCNBg4IIiFOQmHD49iW+XuAsXbzREZrPBuqTbc=
X-Google-Smtp-Source: AGHT+IFqxbDhjqt1SFKpp0mp6NjBvSH2RuOSJ/cJ9Xo8lyQSMxmjHBeRbrP7BDO0diRgPwW3eRF5UA==
X-Received: by 2002:a05:651c:235:b0:2ee:8c8d:d9dd with SMTP id 38308e7fff4ca-2ef05d24f2dmr3860471fa.36.1721254288711;
        Wed, 17 Jul 2024 15:11:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ef05dbb5ccsm700231fa.121.2024.07.17.15.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 15:11:28 -0700 (PDT)
Date: Thu, 18 Jul 2024 01:11:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	Rob Clark <robdclark@chromium.org>, Douglas Anderson <dianders@chromium.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <quic_jesszhan@quicinc.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [RFC] drm/panel/simple-edp: Add Samsung ATNA45DC02
Message-ID: <d23yw632nypm3erlx2tdxgyyiysmg4wl6en6q5daupc3yeczxe@pqzibea7ya6w>
References: <20240717215847.5310-1-robdclark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717215847.5310-1-robdclark@gmail.com>

On Wed, Jul 17, 2024 at 02:58:46PM GMT, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Just a guess on the panel timings, but they appear to work.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
> This adds the panel I have on my lenovo yoga slim 7x laptop.  I couldn't
> find any datasheet so timings is just a guess.  But AFAICT everything
> works fine.

Could you please add EDID to the commit message?

> 
>  drivers/gpu/drm/panel/panel-edp.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-edp.c b/drivers/gpu/drm/panel/panel-edp.c
> index 38e5178f55ac..411b7218af55 100644
> --- a/drivers/gpu/drm/panel/panel-edp.c
> +++ b/drivers/gpu/drm/panel/panel-edp.c
> @@ -1966,6 +1966,8 @@ static const struct edp_panel_entry edp_panels[] = {
>  	EDP_PANEL_ENTRY('S', 'H', 'P', 0x153a, &delay_200_500_e50, "LQ140T1JH01"),
>  	EDP_PANEL_ENTRY('S', 'H', 'P', 0x154c, &delay_200_500_p2e100, "LQ116M1JW10"),
>  
> +	EDP_PANEL_ENTRY('S', 'D', 'C', 0x4189, &delay_100_500_e200, "ATNA45DC02-0"),
> +
>  	EDP_PANEL_ENTRY('S', 'T', 'A', 0x0100, &delay_100_500_e200, "2081116HHD028001-51D"),
>  
>  	{ /* sentinal */ }
> -- 
> 2.45.2
> 

-- 
With best wishes
Dmitry

