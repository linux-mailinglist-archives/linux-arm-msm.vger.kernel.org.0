Return-Path: <linux-arm-msm+bounces-39844-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 541719DFF95
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 12:03:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0E5DF2807F5
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 11:03:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E5981F9EA4;
	Mon,  2 Dec 2024 11:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VsPxeusn"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26B461F9407
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Dec 2024 11:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733137395; cv=none; b=LMBEci9gd6KHlM1mabrgewUyHj2/xf+ebQqct8Ij8M4rubpyNYhUSbBKq/kkpAQ6uKHrUrM7FzECWu9rkHLWoJGbhZqNY/t6zHrV/+5K9v8bRLF4QCUfHrBKw36zx/vzcJbh0dm1iQW4AUxVIp2NKF6UB1qwByXFh1SarkZ9kas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733137395; c=relaxed/simple;
	bh=mM8Ty9zubi84Tu0ptmDRpums5gqswtEyzEignt+0538=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QWgpHq0kUehGU4taF0S3H9pb6DQ6VTloJ2a/2TS3OEbN36SlQvdFwkT3vO1Bjaq9h3J3JTGZ6yCelAGFaNn1npOorUjoOgU49E4pvqm8wuoB7NQdzfFtTL/gEZugfC1rUmpKgrpZOQsJoc84uviZoCpBlXJhcoYu4KDYbIkp8PA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VsPxeusn; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-53dd0cb9ce3so3597286e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Dec 2024 03:03:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733137392; x=1733742192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6X4f5B7p/4ISxO7icMRqa8h5IT36sTqoFNtM1b1oYjE=;
        b=VsPxeusnuWB48OSd/L36BqGx1xaXjkIIiTr7sH3/5+V1NLm7rZBA/XDanvAsiunz9E
         YlQ1lGdkKj9UplqzcWI5G/rSB7+F0IrqYv/EkDKuXin/WgmNE5c3DqXykMrDza7y3VzV
         KlU0oF+0l/eF/WzRPzNBygOws1F2/TV6kbZhmwVwLfwZvJ48btA6ZpHwd3Kb9cp/NQ9x
         tLx8M3SDS8lyUy0VV9hlt+KKQaVqCs/faKDFYQWxaig6FCFPdNAtPYg6JlApVn8UqIL4
         75RtLo7q39EvbE2rQIiT4uqnQcMwFFDCDcZq0GfUlEze6LFzlfnfhKieM8SURhaQqGEA
         lhgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733137392; x=1733742192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6X4f5B7p/4ISxO7icMRqa8h5IT36sTqoFNtM1b1oYjE=;
        b=efP5Glt7n2xwMC1FQl6OTfalPMrH8w41x7iB6Rmz6hYxmwFIszCrqmiGiyondfbsrf
         KSmdJ2jQ6zxZHPm5rjpaHgZIyn2roaPK5z248KHYG7GtyOmIMLkGaL6eZAOOg+Xh6p6S
         mhelP6/5XVKZLoZaZyeCBEIpU5Wqk4OYu++xAQ+BLIT01VK0/CIWokroPMSogt43cFB3
         hvUfDz/5hVGD4wlBVRpgFwaLPbNYBkEOQE1w6UWod47b6obya2jVw04ALUwW45ivyPcN
         WC20EurN1qd2xj2rqDLI4/C3ptfYzjiGEfZDD3SClx9fBt8PsacsCUOssLBEo00srTCB
         08OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVc/Gl1FlapFaMYbPbHFqARlQLuhpgVsLesi04uB+jWXk2wlkwcNeQWbu9y8W3SK0MUoUFt3eLz4FMt7ir1@vger.kernel.org
X-Gm-Message-State: AOJu0YzVwC2RXsppO599jpqQVPOZfhXRUVMnaQOjyanrgeBRellEun5y
	AhXTONW1k5I5LrQsuGUZF2RNc/rKnmv1v4kg4lf9uM7anWGSKZDnGklEQNkuY50=
X-Gm-Gg: ASbGncsfeTfQavSLdVxzC1Sw6KkuKsIVf0RA/5y+qOqs3RLJy32K9q+jyMxjdKUUVSf
	3bceTTpfdwwPe9e36lwBoxfwjcyoDFa41XE6ykE8d0Hj6rMJMdT/CyOWwVdS/Np7kWHRFzbFQTS
	1GqGd+mDW7UvJK3zflKAx3CQYQB5v17LbnlzV/dGdMMEBD1zcagWGC7u1pzHj6EoQDtsi2f6wcJ
	1lcmGETZDk3hk5TGExa/KQAAXwd1kTTsbWfL0zZjSxR6JTqmcvLamLlfmw5HYYm3O+Gf5HB0E/N
	RfejlfMEHibq7mN0/tAsiUSbtrzZXQ==
X-Google-Smtp-Source: AGHT+IFGDFefBhtw1PCqTOI5KhQIlj3rWjRnFP/b36RPBBTJEaQRx6orQjZk5ZBCQurK/QAedMSg2Q==
X-Received: by 2002:a05:6512:2385:b0:53d:ed25:fb75 with SMTP id 2adb3069b0e04-53df00d3e65mr7699888e87.15.1733137392309;
        Mon, 02 Dec 2024 03:03:12 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53df646efd9sm1443877e87.143.2024.12.02.03.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Dec 2024 03:03:10 -0800 (PST)
Date: Mon, 2 Dec 2024 13:03:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-samsung-soc@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
	Alain Volmat <alain.volmat@foss.st.com>, Alex Deucher <alexander.deucher@amd.com>, 
	Alim Akhtar <alim.akhtar@samsung.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	David Airlie <airlied@gmail.com>, Harry Wentland <harry.wentland@amd.com>, 
	Inki Dae <inki.dae@samsung.com>, Jani Nikula <jani.nikula@linux.intel.com>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Leo Li <sunpeng.li@amd.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Marijn Suijten <marijn.suijten@somainline.org>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Phong LE <ple@baylibre.com>, 
	Raphael Gallais-Pou <rgallaispou@gmail.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Rob Clark <robdclark@gmail.com>, Robert Foss <rfoss@kernel.org>, 
	Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Sean Paul <sean@poorly.run>, Seung-Woo Kim <sw0312.kim@samsung.com>, 
	Simona Vetter <simona@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Xinhui Pan <Xinhui.Pan@amd.com>
Subject: Re: [PATCH 00/10] drm/connector: add eld_mutex to protect
 connector->eld
Message-ID: <ohbtatnn33jj6y3q4milf4txi4n7yirnny2eefdjddlkn2dnhp@eqjedetct4q3>
References: <20241201-drm-connector-eld-mutex-v1-0-ba56a6545c03@linaro.org>
 <77545786331df8bfaf5fdcb309437358@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77545786331df8bfaf5fdcb309437358@kernel.org>

On Mon, Dec 02, 2024 at 10:19:41AM +0000, Maxime Ripard wrote:
> On Sun, 1 Dec 2024 01:55:17 +0200, Dmitry Baryshkov wrote:
> > The connector->eld is accessed by the .get_eld() callback. This access
> > can collide with the drm_edid_to_eld() updating the data at the same
> > time. Add drm_connector.eld_mutex to protect the data from concurrenct
> > access.
> > 
> > 
> > [ ... ]
> 
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks!

I'm going to post v2 to fix Jani's comment, but what should be the merge
strategy? Merge patches 1-3, 5, 9-10 through drm-misc and the rest (AMD,
i915, MSM, radeon) through the driver trees?

-- 
With best wishes
Dmitry

