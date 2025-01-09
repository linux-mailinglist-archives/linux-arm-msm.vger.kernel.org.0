Return-Path: <linux-arm-msm+bounces-44682-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A244A08356
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 00:18:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7DC743A70E3
	for <lists+linux-arm-msm@lfdr.de>; Thu,  9 Jan 2025 23:18:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2B9D82036E2;
	Thu,  9 Jan 2025 23:18:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wc2ve2C5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A90218A6DF
	for <linux-arm-msm@vger.kernel.org>; Thu,  9 Jan 2025 23:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736464728; cv=none; b=SpaxUgUxLxOopRt3u94Yp6QR05QeFaZpGNFwIu8J2XMPR0rehT0GVVqFgG2b8H5wM1dQcGuRlJpuMF8MI9Ye/bTxRmPwiRHd3u+P0xsmtfexkPGdZH0sCP8DObthFToMKS6tKWKmlmQppQfZlVZs54D/clizM0N95mcQFvJ/4wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736464728; c=relaxed/simple;
	bh=jdyLYyzTwTMzmiwi9C7iJxcirV1Bay+fjwYYqPcjTvA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mpRW3v+0Ib1hdBJkZhpNf2kydz0uCqfH8ddwUMOwoLA09jzsM7iQjLQaG0R0ZG/d5tQbBiROk6QZALd0mt2J+O5sSH4SDPETq+NAV63rIk20x98+rfvrytMuf2zlhOUnZ37YMlTffosa1FVrD96Kbj8Mao5UedHpsyI4cFzC260=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wc2ve2C5; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-54020b0dcd2so2455768e87.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 09 Jan 2025 15:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736464724; x=1737069524; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XapNxpFsccSf6+igw52Ot07McadtRVWLAIA+qO3E/9c=;
        b=wc2ve2C5P6HmlKbxNKMi6VOl3pQg+2yzPmGGmFaBvZhqpZqjeLhwI0kAVTVj5rCO6n
         YhlusmIW/u7K3pv1qLgclK10mf6T7+enuKIXuExIFDTnEASJrw04XSQaIddKvvwvm4qQ
         HH+Vmj642cloI06csFDDF7PeRWVVC5VWH9j6ot/NoIL3EMhJfURs/auultCBCGBXuM6A
         jWZ632iTufxpHo4bs3kO72Uh6rkIYNGr4p96ZSGeUB3Wn+aB3XAgxNHtXHBrzeKauZEo
         5/TppS7UXR7ko0X75MO6NELxkGMvLgKEButRRX8ZWIC/e+XLuHPfMPI+rjwkQ6G31srV
         Ja3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736464724; x=1737069524;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XapNxpFsccSf6+igw52Ot07McadtRVWLAIA+qO3E/9c=;
        b=p1ak93G02nUGBOPHPc5flmvQIH6f0xu66/55+0amtPAsjcupaqt/FCbu0Sz8lzFbpy
         aK4x/vOx174zIcuYnVDbyTnKZI79vffG7lxjsfhWKeQfFSlLuOjRJXAnys4QyGzo2y75
         vHSpN0qJcoShLEucSwi0/6n4zysg71fmn3b5R6K9LGBrLS+jlZkFpxLJJAxIZIc4divA
         2RmQBHase/NX9V72CXrFXp3/WxL3AqSfmhsUl9wkFL6azZKd4Ns6htjfPrgbAPsVWHSi
         lQs+Ccuxu1zFcXBjaQw/t2DKuZJPIJEPqBRYJcYr9Ktxh9GCVWjySRYcOiazqiDkId5b
         Zxtg==
X-Forwarded-Encrypted: i=1; AJvYcCVsDY9SJEtUYeelBX2DGrbv4SpKxO5pDFEdbaP7HwoxRPucs+soma1TksUuiEEEdMyMAjdYWk49wq0JMleg@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8vBDZtYtz1IN4+eqvyPvqCHku3R/hvPs2we2xzGeftrjeFVL+
	efkU5+7yEIDdwZdQ6Cz5PyMDmuGpR/r0gBLRxmFKL4gqxHA8d3R8wsWeDBqpBjU=
X-Gm-Gg: ASbGncu9335rPrA3HlnTmhWWjtc/hSezC8baSPRGKvWd7gXvXFBDdC8W4a+tjiLWRdf
	mjGCzGAs8iN7fHqLyD7Qw9s8Cn4qYQNs7eFOvJQFeqzpIfiRC9HYMS9aiJGearRQ6vsbrqcYjfo
	FP60RRICHpMNISXzf00Ix6kDp+09TL421Hjgrip634iGSAetoh+MPhtGojE9iVif8ur/PYkSyEj
	ihQqGc3RalhBwTVvBBA0w3sx4aj9u4qZX1nFp6C1Dtuurd/XOQmJPJQVbKm7+YPlnJddm8VfYRu
	ZGeKkQ103HLwfFKghgHWMV3+SE029uRZMHpv
X-Google-Smtp-Source: AGHT+IEEFUCTvUhZyuZAipODtyZoMLNLhnb3WvFR0ZaFEg/rnc9lvzVvhtcR9bxMLAqRxSFL1w43hw==
X-Received: by 2002:a05:6512:3e20:b0:542:8bf0:2fa3 with SMTP id 2adb3069b0e04-5428bf030ecmr1092454e87.5.1736464724178;
        Thu, 09 Jan 2025 15:18:44 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428be548desm339460e87.107.2025.01.09.15.18.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jan 2025 15:18:41 -0800 (PST)
Date: Fri, 10 Jan 2025 01:18:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Srini Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [PATCH RFC 08/11] drm/msm/dsi: Add support for SM8750
Message-ID: <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>

On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> differences worth noting:
> 
> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
>    offsets were just switched.  Currently these registers are not used
>    in the driver, so the easiest is to document both but keep them
>    commented out to avoid conflict.
> 
> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
>    parents before they are prepared and initial rate is set.  Therefore
>    assigned-clock-parents are not working here and driver is responsible
>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().

Isn't it a description of CLK_SET_PARENT_GATE and/or
CLK_OPS_PARENT_ENABLE ?

> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.h                      |  2 +
>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 25 +++++++
>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |  1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c                 | 80 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 78 +++++++++++++++++++--
>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 14 ++++

Please separate DSI and PHY changes.

>  8 files changed, 197 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..e2a8d6fcc45b6c207a3018ea7c8744fcf34dabd2 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> @@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
>  	},
>  };
>  
> +static const struct msm_dsi_config sm8750_dsi_cfg = {
> +	.io_offset = DSI_6G_REG_SHIFT,
> +	.regulator_data = sm8650_dsi_regulators,
> +	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
> +	.bus_clk_names = dsi_v2_4_clk_names,
> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> +	.io_start = {
> +		{ 0xae94000, 0xae96000 },
> +	},
> +};
> +
>  static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
>  	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
>  	{ .supply = "refgen" },
> @@ -257,6 +268,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
>  	.calc_clk_rate = dsi_calc_clk_rate_6g,
>  };
>  
> +static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
> +	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
> +	.link_clk_enable = dsi_link_clk_enable_6g,
> +	.link_clk_disable = dsi_link_clk_disable_6g,
> +	.clk_init_ver = dsi_clk_init_6g_v2_9,
> +	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
> +	.tx_buf_get = dsi_tx_buf_get_6g,
> +	.tx_buf_put = dsi_tx_buf_put_6g,
> +	.dma_base_get = dsi_dma_base_get_6g,
> +	.calc_clk_rate = dsi_calc_clk_rate_6g,
> +};
> +
>  static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
>  		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
> @@ -300,6 +323,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
>  		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
>  		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
> +		&sm8750_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
>  };
>  
>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> @@ -30,6 +30,7 @@
>  #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
>  #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
>  #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
> +#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
>  
>  #define MSM_DSI_V2_VER_MINOR_8064	0x0
>  
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 2218d4f0c5130a0b13f428e89aa30ba2921da572..ced28ee61eedc0a82da9f1d0792f17ee2a5538c4 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -119,6 +119,15 @@ struct msm_dsi_host {
>  	struct clk *pixel_clk;
>  	struct clk *byte_intf_clk;
>  
> +	/*
> +	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
> +	 * PLL:
> +	 */
> +	struct clk *byte_src_clk;
> +	struct clk *pixel_src_clk;
> +	struct clk *dsi_pll_byte_clk;
> +	struct clk *dsi_pll_pixel_clk;
> +
>  	unsigned long byte_clk_rate;
>  	unsigned long byte_intf_clk_rate;
>  	unsigned long pixel_clk_rate;
> @@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
>  	return ret;
>  }
>  
> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
> +{
> +	struct device *dev = &msm_host->pdev->dev;
> +	int ret;
> +
> +	ret = dsi_clk_init_6g_v2(msm_host);
> +	if (ret)
> +		return ret;
> +
> +	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
> +	if (IS_ERR(msm_host->byte_src_clk))
> +		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
> +				     "can't get byte_src clock\n");
> +
> +	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
> +	if (IS_ERR(msm_host->dsi_pll_byte_clk))
> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
> +				     "can't get dsi_pll_byte clock\n");
> +
> +	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
> +	if (IS_ERR(msm_host->pixel_src_clk))
> +		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
> +				     "can't get pixel_src clock\n");
> +
> +	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
> +	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
> +				     "can't get dsi_pll_pixel clock\n");

How is this going to work in the bonded DSI mode when DSI1 is being fed
by the DSI0 PLL? For existing platforms this is being handled by
changing the parents in DT.

> +
> +	return 0;
> +}
> +
>  static int dsi_clk_init(struct msm_dsi_host *msm_host)
>  {
>  	struct platform_device *pdev = msm_host->pdev;
> @@ -370,6 +411,45 @@ int dsi_link_clk_set_rate_6g(struct msm_dsi_host *msm_host)
>  	return 0;
>  }
>  
> +int dsi_link_clk_set_rate_6g_v2_9(struct msm_dsi_host *msm_host)
> +{
> +	struct device *dev = &msm_host->pdev->dev;
> +	int ret;
> +
> +	/*
> +	 * DSI PHY PLLs have to be enabled to allow reparenting to them and
> +	 * setting the rates of pixel/byte clocks.
> +	 */
> +	ret = clk_prepare_enable(msm_host->dsi_pll_byte_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = clk_prepare_enable(msm_host->dsi_pll_pixel_clk);
> +	if (ret) {
> +		dev_err(dev, "Failed to enable dsi_pll_byte: %d\n", ret);
> +		goto out_disable_byte_clk;
> +	}
> +
> +	ret = clk_set_parent(msm_host->byte_src_clk, msm_host->dsi_pll_byte_clk);
> +	if (ret)
> +		dev_err(dev, "Failed to parent byte_src -> dsi_pll_byte: %d\n", ret);
> +
> +	ret = clk_set_parent(msm_host->pixel_src_clk, msm_host->dsi_pll_pixel_clk);
> +	if (ret)
> +		dev_err(dev, "Failed to parent pixel_src -> dsi_pll_pixel: %d\n", ret);
> +
> +	ret = dsi_link_clk_set_rate_6g(msm_host);
> +
> +	clk_disable_unprepare(msm_host->dsi_pll_pixel_clk);
> +
> +out_disable_byte_clk:
> +	clk_disable_unprepare(msm_host->dsi_pll_byte_clk);
> +
> +	return ret;
> +}
> +
>  int dsi_link_clk_enable_6g(struct msm_dsi_host *msm_host)
>  {
>  	int ret;

-- 
With best wishes
Dmitry

