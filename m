Return-Path: <linux-arm-msm+bounces-47335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 68151A2E166
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Feb 2025 00:12:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id BCC087A1454
	for <lists+linux-arm-msm@lfdr.de>; Sun,  9 Feb 2025 23:11:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 664782253A1;
	Sun,  9 Feb 2025 23:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xXv14nIm"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B52C1E130F
	for <linux-arm-msm@vger.kernel.org>; Sun,  9 Feb 2025 23:12:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739142727; cv=none; b=cExVrDZR11Rrp+iM68+0fWh0XR+PXNPP01gxDfamfNNFNH27sGlcig8xHZGpVFa9PNPj9W9MERJvvEM0t+MG/wHEAR24bzh8S3RY4BVEX246y6p9HlRzJyDfIwO2UphmZc4dXW3P1NUPfujbjc3V2dyB8qW9ls+yvWt4IBF3T3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739142727; c=relaxed/simple;
	bh=GkQTtG9hVz8ToxKu6fUNzw7ncBXdXnpvtOjdVioIQEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1JCfm0QhY3knedJA1QBoM3jMvQYOfrUOeLd8XQi7GYcS5QWZbmw0Bfq6C9NSOgdLihkNQHq9737y9AYRDH2phK4KaHw4X3co2VOOhgQD1CaqoEL1o+gmSXY0cdQYLKoZk2Tudzl/urhkQmYN1Ei+2Kpsaaf6I1wRr+siyHGRVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xXv14nIm; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5450cf3ebc2so325255e87.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 09 Feb 2025 15:12:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739142723; x=1739747523; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+vFPwFXM4bR9tYX9V6EFmxAhSw4debbGpPDSv0t249A=;
        b=xXv14nImjQeeCFBzKyfB4yxi3S1BeUz1A1P8CLctwReP4fwpYgGLpEJMFrQJN6w9gX
         513rkpVigJJsfZCUqciHGu2rr7pHXuk37zfRdwVk+9XxJqcYIU0qAfOyaXfR0Ek/R/DT
         N97KHHBUfyccdZtp9+ssDBxwVUpq4KNrs1YzhEKsoRq3sFbHSrz++Gh7i9z+fpEmFOKG
         02UynE46OnjKKEKI+BJ5+r8Spr2348ow6lZoqlONjdd3/bCsEzFv2ympYotXhp0P20Im
         KBxSgtkfvFdTnoHD21ywEHRiK3TxSA2+tpgsEVbJ63wfvMJ6SZQWif5tNk6vLuclZ/e1
         VOfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739142723; x=1739747523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+vFPwFXM4bR9tYX9V6EFmxAhSw4debbGpPDSv0t249A=;
        b=ksvuT5aRiablXUZnH4vefSWA6sFAzrFVU6oM+K/zhQKVCzR5bYSkwGVfRXJyRfuEyb
         gHE3F0C4lyKg9hQM8yx1Y8rX66yFVrgIuHud1s7Lo6DG2/JiEXaHtYOt6UH6LacvJPPg
         bMdcZESDmieWeXnQWZVF0Ll2ojSANYhIoYfgyEy489w0CwfiF8qjWLo+KOjKUMrQyr/+
         u5q6yA8sIQ+gloS4j65Gfcu85VI6bZKKxPV3ZJnVtEI6cm55AuJNj1vxjZTZWozQ1pL6
         HskfM0PaRALluDUFKOVNywvC1MOAorHhc7qDAOI0dHINsfhIbjN/0FftdLshA8D7HCpn
         oexQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0gQpkPHpZim7DPBHBnAoPL+ggYkLFy71q9CWgb9Lutrz7qmXHeR4bT/p2CpsyceiaBedYnSTVZaA6WB7r@vger.kernel.org
X-Gm-Message-State: AOJu0YzeWlSLRHsg3tHrSb/wfk6+E56RSMuUdT4D0dtZy6WLHn48jDah
	lSZ5gxTja8qMFx8DxzTuUtW4DbDxgH7AarytP9o1aAWACD+cUYBVfOlLCVwRAYM=
X-Gm-Gg: ASbGnctRAzQNarmFOZmdBMDSDuHh1e4a1DoYnj+5U5tSFr3xcRvZnQt1ylbgzIptcY1
	jXE0C+7UqNDoYnOQTmaXl3rkx5DWQ/RSHG3+icD36pyMyhzb7fvL9tg+Q1K/YD45KV3UEtNVG6e
	9hFiyoYDATfdVzQsTD85ZLhxKfsmlwFbvJcSn+28Bwqu5FXCjD0B/npvQrPTEmIcA2IJ1OJXP5Z
	335G6u17/JqgVqE6EFJ0lU+Q3+n9wE3Oegpq36shno2Bsn+WOdOQO+D9fpj5ZBv8y6c4a49inmw
	qnfIXDKAbHLFzw0rE10sNb8OIrcUZTmXmR+1pAxwVyUDD8yVNCr7Q7uhXf1s0Xi6MYI9gZA=
X-Google-Smtp-Source: AGHT+IF00rLDAE/Zu8DuAgn3EOiGHavqn93g+Q4K+br4ppdg5/rNEYRwOpkH1xQrqhqfhAl/+SpNmA==
X-Received: by 2002:a05:6512:6c5:b0:545:a89:4dc7 with SMTP id 2adb3069b0e04-5450a894ef0mr906708e87.52.1739142722973;
        Sun, 09 Feb 2025 15:12:02 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450bb646a5sm208604e87.146.2025.02.09.15.12.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Feb 2025 15:12:01 -0800 (PST)
Date: Mon, 10 Feb 2025 01:11:59 +0200
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
Message-ID: <nzm3tokbvho3hxz3e5vblp5ndagfcv5ah3j7gtkqjmt7ynr6f3@v36juvu73i5v>
References: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-0-9a60184fdc36@somainline.org>
 <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250209-drm-msm-initial-dualpipe-dsc-fixes-v2-2-9a60184fdc36@somainline.org>

On Sun, Feb 09, 2025 at 10:42:53PM +0100, Marijn Suijten wrote:
> Ordering issues here cause an uninitialized (default STANDALONE)
> usecase to be programmed (which appears to be a MUX) in some cases
> when msm_dsi_host_register() is called, leading to the slave PLL in
> bonded-DSI mode to source from a clock parent (dsi1vco) that is off.
> 
> This should seemingly not be a problem as the actual dispcc clocks from
> DSI1 that are muxed in the clock tree of DSI0 are way further down, this
> bit still seems to have an effect on them somehow and causes the right
> side of the panel controlled by DSI1 to not function.
> 
> In an ideal world this code is refactored to no longer have such
> error-prone calls "across subsystems", and instead model the "PLL src"
> register field as a regular mux so that changing the clock parents
> programmatically or in DTS via `assigned-clock-parents` has the
> desired effect.
> But for the avid reader, the clocks that we *are* muxing into DSI0's
> tree are way further down, so if this bit turns out to be a simple mux
> between dsiXvco and out_div, that shouldn't have any effect as this
> whole tree is off anyway.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_manager.c | 30 +++++++++++++++++++-----------
>  1 file changed, 19 insertions(+), 11 deletions(-)


Fixes: 57bf43389337 ("drm/msm/dsi: Pass down use case to PHY")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index a210b7c9e5ca281a46fbdb226e25832719a684ea..b93205c034e4acc73d536deeddce6ebd694b4a80 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -74,17 +74,33 @@ static int dsi_mgr_setup_components(int id)
>  	int ret;
>  
>  	if (!IS_BONDED_DSI()) {
> +		/* Set the usecase before calling msm_dsi_host_register(), which would
> +		 * already program the PLL source mux based on a default usecase.
> +		 */
> +		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +
>  		ret = msm_dsi_host_register(msm_dsi->host);
>  		if (ret)
>  			return ret;
> -
> -		msm_dsi_phy_set_usecase(msm_dsi->phy, MSM_DSI_PHY_STANDALONE);
> -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
>  	} else if (other_dsi) {
>  		struct msm_dsi *master_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							msm_dsi : other_dsi;
>  		struct msm_dsi *slave_link_dsi = IS_MASTER_DSI_LINK(id) ?
>  							other_dsi : msm_dsi;
> +
> +		/* PLL0 is to drive both DSI link clocks in bonded DSI mode.
> +		 *
> +		/* Set the usecase before calling msm_dsi_host_register(), which would
> +		 * already program the PLL source mux based on a default usecase.
> +		 */
> +		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> +					MSM_DSI_PHY_MASTER);
> +		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> +					MSM_DSI_PHY_SLAVE);
> +		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> +		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
> +
>  		/* Register slave host first, so that slave DSI device
>  		 * has a chance to probe, and do not block the master
>  		 * DSI device's probe.
> @@ -98,14 +114,6 @@ static int dsi_mgr_setup_components(int id)
>  		ret = msm_dsi_host_register(master_link_dsi->host);
>  		if (ret)
>  			return ret;
> -
> -		/* PLL0 is to drive both 2 DSI link clocks in bonded DSI mode. */
> -		msm_dsi_phy_set_usecase(clk_master_dsi->phy,
> -					MSM_DSI_PHY_MASTER);
> -		msm_dsi_phy_set_usecase(clk_slave_dsi->phy,
> -					MSM_DSI_PHY_SLAVE);
> -		msm_dsi_host_set_phy_mode(msm_dsi->host, msm_dsi->phy);
> -		msm_dsi_host_set_phy_mode(other_dsi->host, other_dsi->phy);
>  	}
>  
>  	return 0;
> 
> -- 
> 2.48.1
> 

-- 
With best wishes
Dmitry

