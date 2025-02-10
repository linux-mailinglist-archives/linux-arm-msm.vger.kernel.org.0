Return-Path: <linux-arm-msm+bounces-47429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79723A2EFA6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 15:24:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B1C9F1884FC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 14:24:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF2EE2528E9;
	Mon, 10 Feb 2025 14:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vxl1HXsG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1D4C2528EB
	for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 14:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739197488; cv=none; b=XQDItDGPvkUa4slnR7/K29kSijbox08SsZYPCq3ZZFBMyXW3Tlf6wBw5vPP1toiRcQtGsIB7lgx7wAk7l5QmjRDWJEXViFgtiNhLSS2JlIQFESKzysGaLrc1X5+VZd6sPYbgUPhjXux51LrdU+v6KgqtGSo6eKdoBskCENlcQsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739197488; c=relaxed/simple;
	bh=MlzTlURcRazNKRPERcpu3wWUiDsFAtTTqDclBmXqKAs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Us0tuJDZ8vdKT0srfM4w08lmu3wQR8+iLhNaULL6P7OuTXNLahvwVupasb7dEw+klZzWNEC+I+Dt322X1pRDTUEIqyo1sK2TnU9cIIYF08WR9SpBFVLddhaIGH93FWrtyOHcb8ja6/zGcjf8RgvqHy9cO8Gwib3H2cZg+m3Siqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vxl1HXsG; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5450b91da41so1104711e87.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 10 Feb 2025 06:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739197485; x=1739802285; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rXTOeRR1tSy6DIJNpPaZKkX1fXiI12lzCj4/r2SjPr8=;
        b=Vxl1HXsGRFJgA10jD8qY2rdx1WSujjTGe7uqrc19jbJgltu0xz8WvseaP3USiQIQmF
         lURRcVHcjxmlbtTbbIAFJynLtnM+8MGN8JsljvPQ+obGjcK2w4Xxjv/6tM34lqNIZfR1
         iOVkXhLX4ywG6aPXBqf61wBVSNIz17W7VtTTRL/NZIDHfKxBqxyr5NfcQ8I+u4to8gvb
         l9lEkS38Z2CLPzq/ISJlazBNpn3sAcKjrxHIg6c89smvZrGqDF+zSs3J5eGRGZWqQLD9
         AyI9FDC99VNY4UYjtpHchU0QgAI78Cvye4hgudQ1xQfCTX3SZEBmEVHB2FM0xFIpkd1B
         nSqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739197485; x=1739802285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rXTOeRR1tSy6DIJNpPaZKkX1fXiI12lzCj4/r2SjPr8=;
        b=PzvA2+fpzFKU6hAn4A7Cb4DSrtrmTYZs0tsAx6FBDT/UMAI7G6DEqBxZ/5rg1ap8RF
         pRpH+zL9IyueeOmz1BayQGhdTfnlUm5DOnfH9fCp72Z2xRy+Y4eyMJytA6/cemQlQv57
         dPT/+JqYeGObUzS4jayPsyIMn3b4OKKgqFbrBz8oXax7UmhalT6RLjkp0LK0IeFY6SVI
         d4ANFQnLF6uZdXF6IlEn5Oqt0n7ZCjyE4JtaFS2IyaihvycHyyTdkURo/VJ0ltXY/5UD
         GsLNBW9k2NUyD+aTdWeIO4stUM1e4LZpRhxY5xm6x6gHaFZ1z9wEjzGLas9eL9iHupTf
         Crog==
X-Forwarded-Encrypted: i=1; AJvYcCW3F3DQIj5VtT/6/kAqllqpjz7QlxBn5oPZ2Ci/YRXEzhpRtU+UQBwEt0DaTc4dttZ05EvqOUy4HmUucGF8@vger.kernel.org
X-Gm-Message-State: AOJu0YymmoNGMOyXQ/TcB6KoGckWGaIA6/eA7HIcSE23MRR6axDTOG+b
	n6Q7lO0QJvh4WRNcuTQQk/nZB9Z6jcVZtN3HG2QuLRx9J6AIJFdGvwOnGXVFp1M=
X-Gm-Gg: ASbGncsXJVsRGiABTJ+yGQmrQO7JjptTzZXeCQ8Iqdn/R/83yzPCrRidpm25f000kVj
	09rqSaQbeZsX3hZqPEeld6QSIt69JwTt5UqLUAdglsNlxVFkcvYA1Vzj468WA1ZC7it0XjSGf+R
	DEJbAN3TzSYoFTaOaz+BQibrEdBWqa25D8Pm/j/PapxaIaJI+ZqB/e2NI5p4RY8haQAqyDzxnis
	qP3EvedBzd9Vz6enW8AlOuh0s4qPnqOerzQqYoGWMi6BqJoC0pV5qraihOiiZvnY/I0fSm74T5W
	+5fy6GM4lSmYABInRLKxKwV4aAUhTXuj0JvhGmRcg4OrqmZvFhdaDXSu7yxcyJnod/Ki9nU=
X-Google-Smtp-Source: AGHT+IELaktaXJDIQE5h3TJtIdi4mlctf8TeZ8f9LCc0ZKKRgqhqCKUX1/reDvwqcfshWriFj4Hheg==
X-Received: by 2002:a05:6512:2384:b0:545:d45:3958 with SMTP id 2adb3069b0e04-5450d4539a2mr1325590e87.31.1739197484772;
        Mon, 10 Feb 2025 06:24:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105bfe6fsm1261556e87.110.2025.02.10.06.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 06:24:44 -0800 (PST)
Date: Mon, 10 Feb 2025 16:24:42 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Vinod Koul <vkoul@kernel.org>, Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	Jordan Crouse <jordan@cosmicpenguin.net>, ~postmarketos/upstreaming@lists.sr.ht, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Martin Botka <martin.botka@somainline.org>, 
	Jami Kettunen <jami.kettunen@somainline.org>, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v2 2/3] drm/msm/dsi: Set PHY usescase (and mode) before
 registering DSI host
Message-ID: <x4jced57uhdfnq4d7tdqsozxbdosu2fcmsjlqtuuvh25ltx2rc@2eqsa7e4vcdv>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
 <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
 <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <vsxfi43d7rxh5xxc7ctivjslf6w4yy5iprqpqid3u3diylrtwd@wayafjlgzz7v>

On Mon, Feb 10, 2025 at 01:54:29PM +0100, Marijn Suijten wrote:
> On 2025-02-10 01:11:59, Dmitry Baryshkov wrote:
> > On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> > > Ordering issues here cause an uninitialized (default STANDALONE)
> > > usecase to be programmed (which appears to be a MUX) in some cases
> > > when msm_dsi_host_register() is called, leading to the slave PLL in
> > > bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> > > 
> > > This should seemingly not be a problem as the actual dispcc clocks from
> > > DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> > > bit still seems to have an effect on them somehow and causes the right
> > > side of the panel controlled by DSI1 to not function.
> > > 
> > > In an ideal world this code is refactored to no longer have such
> > > error-prone calls "across subsystems", and instead model the "PLL src"
> > > register field as a regular mux so that changing the clock parents
> > > programmatically or in DTS via `assigned-clock-parents` has the
> > > desired effect.
> > > But for the avid reader, the clocks that we *are* muxing into DSI0's
> > > tree are way further down, so if this bit turns out to be a simple mux
> > > between dsiXvco and out_div, that shouldn't have any effect as this
> > > whole tree is off anyway.
> > > 
> > > Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> > > ---
> > >  drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
> > >  1 file changed, 19 insertions(+), 11 deletions(-)
> > 
> > 
> > Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
> 
> I'm not exactly confident about that.  Abhinav pointed out in
> https://gitlab.freedesktop.org/drm/msm/-/issues/41#note_2375646 that
> msm_dsi_host_register() was not supposed to be enabling the PHY, which I
> provided a counter-stacktrace for to show that is indeed the case.
> 
> Either this was always a problem that's only become visible now (and it's an
> issue with that patch), or a different change causes msm_dsi_host_register()
> to enable the PHY and program the usecase too early?

As currently usecase is being programmed after the DSI host being
registered, there might be a race condition between panel driver probe
_and_ usecase programming.

> 
> What do you think?
> 
> - Marijn
> 
> > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > 
> > > 
> > > diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
> > > --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> > > @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
> > >  	int ret;
> > >  
> > >  	if (!IS_BONDED_DSI()) {
> > > +		/* Set the usecase before calling msm_dsi_host_register(), which would
> > > +		 * already program the PLL source mux based on a default usecase.
> > > +		 */
> > > +		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> > > +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > +
> > >  		ret = msm_dsi_host_register(msm_dsi->host);
> > >  		if (ret)
> > >  			return ret;
> > > -
> > > -		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> > > -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > >  	} else if (other_dsi) {
> > >  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > >  							msm_dsi : other_dsi;
> > >  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
> > >  							other_dsi : msm_dsi;
> > > +
> > > +		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> > > +		 *
> > > +		/* Set the usecase before calling msm_dsi_host_register(), which would
> > > +		 * already program the PLL source mux based on a default usecase.
> > > +		 */
> > > +		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > > +					MSM_DSI_PHY_MASTER);
> > > +		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > > +					MSM_DSI_PHY_SLAVE);
> > > +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> > > +
> > >  		/* Register slave host first, so that slave DSI device
> > >  		 * has a chance to probe, and do not block the master
> > >  		 * DSI device's probe.
> > > @@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
> > >  		ret = msm_dsi_host_register(master_link_dsi->host);
> > >  		if (ret)
> > >  			return ret;
> > > -
> > > -		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> > > -		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> > > -					MSM_DSI_PHY_MASTER);
> > > -		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> > > -					MSM_DSI_PHY_SLAVE);
> > > -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> > > -		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> > >  	}
> > >  
> > >  	return 0;
> > > 
> > > -- 
> > > 2.48.1
> > > 
> > 
> > -- 
> > With best wishes
> > Dmitry

-- 
With best wishes
Dmitry

