Return-Path: <linux-arm-msm+bounces-26474-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 1661E933E15
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 15:57:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 660F8B23294
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jul 2024 13:57:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A276E180A88;
	Wed, 17 Jul 2024 13:57:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rHSiBx0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C84E5180A70
	for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 13:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721224654; cv=none; b=ErRS4RcVgf3Aa/e6duVkoyschvtLpJWxcs6saKrjhNDu07cL0dn00VN3ITHix6HVhNr+e2TcXyCMdSZN1Bb6n2Nrhs7EUGmtyaNW07TocR9CfDFX8MvURYhRqj/UQn0QQTkxnMYOHdLxYG6MYz6VGy68m+seTe8WZIr74iSgqo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721224654; c=relaxed/simple;
	bh=mj9lyALcWaNJFJX7S4WRviV1aZ7NNgMIecZZbWmCzDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NhAJMn2pznmlunmaNltkGx9qDwSjb2a4CnfETxlSscaV8/CL8yatV3073vkxEpTchTre4mbuDg8VeOMlaoxM8+7QYjMgP9W/bXte5fGI2Xgy9kpDTJLl3q3i/OnrRPyt70be5u71icIYQHXiddkeCt569UIIgBr6PgIZeti70CM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rHSiBx0O; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ee910d6a9eso7602981fa.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jul 2024 06:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1721224650; x=1721829450; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
        b=rHSiBx0OIORI/pywKENisnriB3hhEZiqmkqnvH4KBDvI6WF1I1gVvE8GyHLgBuGPMo
         TcaoMKFQwULywOYZi5MyxVrkSQMkiRk2tDvQb1ZJT3Klkna7HgIH7yw1HHfCCytqdPje
         2xQTuLtsOWXd+859ZVNRpfdmcN7GRrSv/6f4iIWubpW8QFM0rbQFfCqxOHg1sG937CXv
         uDNCOSmllQ+I7gXTiUwolLedTqcUNcuiuOyLGheh5NB4xshbtKR+S1fW65kJfaXJipZ8
         GsIed3neHP4A2e5mCU3+m2srBL5xxLAzi+fnxDKSYmEfjdggMuTawJLLWa7E9268bmS1
         pN0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721224650; x=1721829450;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mHJbV+bzx4RI8mDOQI+N5X7vHq/DAFW5fyNCzOVzMjI=;
        b=wBbXsN0lqxn4z2SwAi3P3Ztf+RcDj4YypuJ/Uu+kEeqQeKqGUFzv6Bl6RV6E3k8vEf
         suf2FxuV4pr4gvk45EHvmv8M/5YJi06PwyjdhufJai4fYkgYV7k9qnEWq6QZi/VV9UHv
         iZAIsy/9HM0H533XoN7nONYChGqvd+NxB7YaMVFtysfJqazFb4hRSbmFOJKRnmKC3y7g
         yvzOBDRmWykiiEB7cd+hMtEEF3jl7Ctd+KfM3acOXsLp9TAbA3AqxP/PHk/zAot4HEv3
         sX8eLxntAm6sFkak7SRxKFCNPMNG1YpzeoCYXVPZPS1MqqDpCrc1JcvfdkL2l2W5F81S
         +39g==
X-Forwarded-Encrypted: i=1; AJvYcCVfsNlh3tEXHRQA1V7CHV0JkEVRoDxcjAkwh1cSXYmg2VMtKpnoozWaiS/mRN3i2SJJ809C+a0QxFRuIc0OiSKzDk/EhjESnSWvae/6eQ==
X-Gm-Message-State: AOJu0YwR7en/dgPucvPqX7vdAZeHgwEpNDrA9LpgcFrakzgN2MLjLIQh
	qVyoxvdGjYbJSuYZ8E0oN7QdKUdy0HOhPTJepCQCy7rhXc55AQDOdJ+sKi5KjyA=
X-Google-Smtp-Source: AGHT+IG7iDrtCuBBKWvQaoQQbv/0kaeeUtziuz9N7l7vX5y+JvpROqU3u5NL1wFj8j7PpznoM4x7Ww==
X-Received: by 2002:a05:651c:2213:b0:2ec:1df4:589b with SMTP id 38308e7fff4ca-2eefcd61dd7mr7308201fa.1.1721224648985;
        Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2eee19148adsm14501371fa.100.2024.07.17.06.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 06:57:28 -0700 (PDT)
Date: Wed, 17 Jul 2024 16:57:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, Lucas Stach <l.stach@pengutronix.de>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
	Paul Cercueil <paul@crapouillou.net>, Anitha Chrisanthus <anitha.chrisanthus@intel.com>, 
	Edmund Dea <edmund.j.dea@intel.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sandy Huang <hjc@rock-chips.com>, Heiko =?utf-8?Q?St=C3=BCbner?= <heiko@sntech.de>, 
	Andy Yan <andy.yan@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, igt-dev@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-arm-msm@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v4 2/5] drm/drm_property: require DRM_MODE_PROP_IMMUTABLE
 for single-value props
Message-ID: <gbcunf7zmafn5z76mrlgldmsy74s7e6jacv53mgpym2l75uq6h@talxrisbufsw>
References: <20240715-drm-bridge-connector-fix-hdmi-reset-v4-0-61e6417cfd99@linaro.org>
 <20240715-drm-bridge-connector-fix-hdmi-reset-v4-2-61e6417cfd99@linaro.org>
 <20240717-bouncy-horned-mamba-5691b8@houat>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240717-bouncy-horned-mamba-5691b8@houat>

On Wed, Jul 17, 2024 at 03:42:46PM GMT, Maxime Ripard wrote:
> Hi,
> 
> On Mon, Jul 15, 2024 at 09:33:02AM GMT, Dmitry Baryshkov wrote:
> > Document that DRM_MODE_PROP_IMMUTABLE must be set for the properties
> > that are immutable by definition - e.g. ranges with min == max or enums
> > with a single value. This matches the behaviour of the IGT tests, see
> > kms_properties.c / validate_range_prop(), validate_enum_prop(),
> > validate_bitmask_prop().
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> We had a discussion yesterday about it on IRC with Sima, Simon and
> Xaver.
> 
> https://oftc.irclog.whitequark.org/dri-devel/2024-07-16#33374622;
> 
> The conclusion was that it would create an inconsistency between drivers
> on whether a given property is immutable or not, which will lead to more
> troubles for userspace.
> 
> It's not clear why Ville added that check in the first place, so the
> best course of action is to remove the IGT test and get the discussion
> started there.

Ack, I'll work on removing those tests later today.

-- 
With best wishes
Dmitry

