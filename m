Return-Path: <linux-arm-msm+bounces-44716-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C7EA08B75
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 10:22:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8771F3AA8D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jan 2025 09:20:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8C401FA15C;
	Fri, 10 Jan 2025 09:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guvQKqJ3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B228209F27
	for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 09:17:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736500669; cv=none; b=aj3AIHQR6drZbf/q063TfBR4/rERuTkUE7vrWKwqdcfI9LH5d2e8eN+q6KzX+5cqW3P9oBc2omnWIPAZEh3DoFZ0+NBVQTZl2DZcerh9NzC+Ocb/4SaKLq7dbjQZ59btn5UV5N19XzhdORBiUEodYIu4pIdlRXC9cqw0bxVl+00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736500669; c=relaxed/simple;
	bh=LQnipfOZb03UEifPI6AZ79Ld+6aUmjdENX6M8cVAclc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OzotroimKv2jY1ENvgs78xFZnqxBdvOqvNsbstS4+3zIi+icKN+BZxl1yPY5Nwi7DlOAKdegw7VSB69LcVDVII6jWfa6CPsTn5mdJhTvYFonh01XVwNGxVcdAzGYOjI2jynzUKNQSDmqqHxDpvNoOaMp+gVvRlMIbdCUUXovoKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guvQKqJ3; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-53f22fd6832so2002048e87.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jan 2025 01:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736500666; x=1737105466; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L2lf5WclkEz+EvG+eiHP21Z389GYrT7IorkLmd4KRl4=;
        b=guvQKqJ3bwIrY5KOSy1dc3wlq2p5RnRwhkHGpwo76q+kEcouIKsxPTimyt97koiBDo
         6I3ncX45Sn1KiunRRhYSxieIIrSNsVfLd+0tBKzStbyoAT7nvVuw7EG19dSe1U2bqt9d
         LSLixW9/7/ERQCY6/wSx6KCF6mIdT2kPt1TTQK4pOpcgfW6kqr3ln/D+S2MH+uMSdx+z
         8hs7GaCQgF1z3Gq8RIN1IU4J7k1y1S69ksC3NiUfWC57doreipYTtlKLbxnh2omBR0D1
         YESr/5oLBka/MV/dwbFaf2sig1PczLVXYKjvbb295z61Jt5FW0c9zqMwVtjNF1P02/dR
         kklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736500666; x=1737105466;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L2lf5WclkEz+EvG+eiHP21Z389GYrT7IorkLmd4KRl4=;
        b=bLu8volrPez5vAeH95Nd62A2oiavmDxSuGEoAcRp4NBVPqknxgZ4ScR0cWq/pcEmDE
         pOiUwYMqqWGXZVGbuTLgA2TVfdIJAaj6sbLr968GJ1S5XCairYLdn8nJop4TQH12WQPQ
         ywqmhDqyZbjzj2vdKIq/1eRo5+l4VOtPnzBUu7vtTKke+nG/GObJoNfnzLeviLlzo+0e
         MoPyNIgOwEJYccc1S39wMd3yrvm8M990FNGyA+kN9w3q1HrJ4KzRKkoPTlh6pUC4BeJU
         4CNUpngo+cLKfxxp6+C+yeyaZIbt4xELUDQ0Ews3XTbe142aAG1AjrMGGfxOfP+pbJz9
         VPaw==
X-Forwarded-Encrypted: i=1; AJvYcCXQIiY/UaW5LlQwRwn3rp6njciXwjEUJgH9rL8EUoBUd9Pz0WI49XiqhG7IJILvAFA9p+ofbdEIqdek7CD7@vger.kernel.org
X-Gm-Message-State: AOJu0YyTkB0v4+VhiAWhTR+5EfNkM6cgcK792axWlRUg1Z3kgjltytjh
	Ca+YYlo7b/Dhyx8O/EHGxbGlsR4UtlaQT51Eu0dNf2O4ZMFEP8RXChvhVnsv5Uk=
X-Gm-Gg: ASbGncteAoFWP+2bQYaeSv0nRDeYIlsvfVn68C7IUSDVZKkdYHZ9UzFX6fI8YpokLVB
	cQE0yTVJA4FFmppfniJ1DrmrRXVsol5niLE2Jb+SuVwskAYXMaMNYmIo/MaDNDRsMlPhPUP9VOk
	AhoEtjPEGcEofqwuvrA7YOioOGNzXRyScU6DGLGGa1Kgu+Rl2DMLaBPuXY1TMJoyRmUZZM+tLMP
	Vx8J6mdGF3YvYQN4u76n9q6tAHfvMwrQvkrxOkhOIWVYthlnkQaYgG7u3QUHFeXAOaO4cVoKbsj
	IYiicTaiCNj7iWeJTZXfYdQlmxDU2M6Mbv23
X-Google-Smtp-Source: AGHT+IG+4qk6lHAL/TkzXeydSTLQvUxuwnokkCUltBuWF9YYEQanPry9PUofIV010QxcJ74yeY5qGQ==
X-Received: by 2002:a05:6512:3a83:b0:540:1b2d:8ef3 with SMTP id 2adb3069b0e04-5428481d30dmr2788001e87.52.1736500665613;
        Fri, 10 Jan 2025 01:17:45 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5428bec0664sm468204e87.193.2025.01.10.01.17.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 01:17:44 -0800 (PST)
Date: Fri, 10 Jan 2025 11:17:42 +0200
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
Message-ID: <7eupqawhdrbjgsj2p7e3ky7uj62m252i6dzkb6y23btocedp3q@qmw72nmbk2c4>
References: <20250109-b4-sm8750-display-v1-0-b3f15faf4c97@linaro.org>
 <20250109-b4-sm8750-display-v1-8-b3f15faf4c97@linaro.org>
 <3p7kjok5jzwvgt7dxuad26xgdkjd52v4gbtuudvgkeoj33skqn@afl2ddtsq7s2>
 <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fc7fdd5-36cd-42e6-af4a-e0e429f9f50b@linaro.org>

On Fri, Jan 10, 2025 at 09:59:26AM +0100, Krzysztof Kozlowski wrote:
> On 10/01/2025 00:18, Dmitry Baryshkov wrote:
> > On Thu, Jan 09, 2025 at 02:08:35PM +0100, Krzysztof Kozlowski wrote:
> >> Add support for DSI PHY v7.0 on Qualcomm SM8750 SoC which comes with two
> >> differences worth noting:
> >>
> >> 1. ICODE_ACCUM_STATUS_LOW and ALOG_OBSV_BUS_STATUS_1 registers - their
> >>    offsets were just switched.  Currently these registers are not used
> >>    in the driver, so the easiest is to document both but keep them
> >>    commented out to avoid conflict.
> >>
> >> 2. DSI PHY PLLs, the parents of pixel and byte clocks, cannot be used as
> >>    parents before they are prepared and initial rate is set.  Therefore
> >>    assigned-clock-parents are not working here and driver is responsible
> >>    for reparenting clocks with proper procedure: see dsi_clk_init_6g_v2_9().
> > 
> > Isn't it a description of CLK_SET_PARENT_GATE and/or
> 
> No - must be gated accross reparent - so opposite.
> 
> > CLK_OPS_PARENT_ENABLE ?
> 
> Yes, but does not work. Probably enabling parent, before
> assigned-clocks-parents, happens still too early:
> 
> [    1.623554] DSI PLL(0) lock failed, status=0x00000000
> [    1.623556] PLL(0) lock failed
> [    1.624650] ------------[ cut here ]------------
> [    1.624651] disp_cc_mdss_byte0_clk_src: rcg didn't update its
> configuration.
> 
> Or maybe something is missing in the DSI PHY PLL driver?

Do you have the no-zero-freq workaround?

> 
> > 
> >>
> >> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> >> ---
> >>  drivers/gpu/drm/msm/dsi/dsi.h                      |  2 +
> >>  drivers/gpu/drm/msm/dsi/dsi_cfg.c                  | 25 +++++++
> >>  drivers/gpu/drm/msm/dsi/dsi_cfg.h                  |  1 +
> >>  drivers/gpu/drm/msm/dsi/dsi_host.c                 | 80 ++++++++++++++++++++++
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.c              |  2 +
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy.h              |  1 +
> >>  drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c          | 78 +++++++++++++++++++--
> >>  .../gpu/drm/msm/registers/display/dsi_phy_7nm.xml  | 14 ++++
> > 
> > Please separate DSI and PHY changes.
> > 
> >>  8 files changed, 197 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> index 7754dcec33d06e3d6eb8a9d55e53f24af073adb9..e2a8d6fcc45b6c207a3018ea7c8744fcf34dabd2 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
> >> @@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
> >>  	},
> >>  };
> >>  
> >> +static const struct msm_dsi_config sm8750_dsi_cfg = {
> >> +	.io_offset = DSI_6G_REG_SHIFT,
> >> +	.regulator_data = sm8650_dsi_regulators,
> >> +	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
> >> +	.bus_clk_names = dsi_v2_4_clk_names,
> >> +	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
> >> +	.io_start = {
> >> +		{ 0xae94000, 0xae96000 },
> >> +	},
> >> +};
> >> +
> >>  static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
> >>  	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
> >>  	{ .supply = "refgen" },
> >> @@ -257,6 +268,18 @@ static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_host_ops = {
> >>  	.calc_clk_rate = dsi_calc_clk_rate_6g,
> >>  };
> >>  
> >> +static const struct msm_dsi_host_cfg_ops msm_dsi_6g_v2_9_host_ops = {
> >> +	.link_clk_set_rate = dsi_link_clk_set_rate_6g_v2_9,
> >> +	.link_clk_enable = dsi_link_clk_enable_6g,
> >> +	.link_clk_disable = dsi_link_clk_disable_6g,
> >> +	.clk_init_ver = dsi_clk_init_6g_v2_9,
> >> +	.tx_buf_alloc = dsi_tx_buf_alloc_6g,
> >> +	.tx_buf_get = dsi_tx_buf_get_6g,
> >> +	.tx_buf_put = dsi_tx_buf_put_6g,
> >> +	.dma_base_get = dsi_dma_base_get_6g,
> >> +	.calc_clk_rate = dsi_calc_clk_rate_6g,
> >> +};
> >> +
> >>  static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
> >>  	{MSM_DSI_VER_MAJOR_V2, MSM_DSI_V2_VER_MINOR_8064,
> >>  		&apq8064_dsi_cfg, &msm_dsi_v2_host_ops},
> >> @@ -300,6 +323,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
> >>  		&sm8550_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >>  	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_8_0,
> >>  		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
> >> +	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
> >> +		&sm8750_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
> >>  };
> >>  
> >>  const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> index 120cb65164c1ba1deb9acb513e5f073bd560c496..859c279afbb0377d16f8406f3e6b083640aff5a1 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
> >> @@ -30,6 +30,7 @@
> >>  #define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
> >>  #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
> >>  #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
> >> +#define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
> >>  
> >>  #define MSM_DSI_V2_VER_MINOR_8064	0x0
> >>  
> >> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> index 2218d4f0c5130a0b13f428e89aa30ba2921da572..ced28ee61eedc0a82da9f1d0792f17ee2a5538c4 100644
> >> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> >> @@ -119,6 +119,15 @@ struct msm_dsi_host {
> >>  	struct clk *pixel_clk;
> >>  	struct clk *byte_intf_clk;
> >>  
> >> +	/*
> >> +	 * Clocks which needs to be properly parented between DISPCC and DSI PHY
> >> +	 * PLL:
> >> +	 */
> >> +	struct clk *byte_src_clk;
> >> +	struct clk *pixel_src_clk;
> >> +	struct clk *dsi_pll_byte_clk;
> >> +	struct clk *dsi_pll_pixel_clk;
> >> +
> >>  	unsigned long byte_clk_rate;
> >>  	unsigned long byte_intf_clk_rate;
> >>  	unsigned long pixel_clk_rate;
> >> @@ -269,6 +278,38 @@ int dsi_clk_init_6g_v2(struct msm_dsi_host *msm_host)
> >>  	return ret;
> >>  }
> >>  
> >> +int dsi_clk_init_6g_v2_9(struct msm_dsi_host *msm_host)
> >> +{
> >> +	struct device *dev = &msm_host->pdev->dev;
> >> +	int ret;
> >> +
> >> +	ret = dsi_clk_init_6g_v2(msm_host);
> >> +	if (ret)
> >> +		return ret;
> >> +
> >> +	msm_host->byte_src_clk = devm_clk_get(dev, "byte_src");
> >> +	if (IS_ERR(msm_host->byte_src_clk))
> >> +		return dev_err_probe(dev, PTR_ERR(msm_host->byte_src_clk),
> >> +				     "can't get byte_src clock\n");
> >> +
> >> +	msm_host->dsi_pll_byte_clk = devm_clk_get(dev, "dsi_pll_byte");
> >> +	if (IS_ERR(msm_host->dsi_pll_byte_clk))
> >> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_byte_clk),
> >> +				     "can't get dsi_pll_byte clock\n");
> >> +
> >> +	msm_host->pixel_src_clk = devm_clk_get(dev, "pixel_src");
> >> +	if (IS_ERR(msm_host->pixel_src_clk))
> >> +		return dev_err_probe(dev, PTR_ERR(msm_host->pixel_src_clk),
> >> +				     "can't get pixel_src clock\n");
> >> +
> >> +	msm_host->dsi_pll_pixel_clk = devm_clk_get(dev, "dsi_pll_pixel");
> >> +	if (IS_ERR(msm_host->dsi_pll_pixel_clk))
> >> +		return dev_err_probe(dev, PTR_ERR(msm_host->dsi_pll_pixel_clk),
> >> +				     "can't get dsi_pll_pixel clock\n");
> > 
> > How is this going to work in the bonded DSI mode when DSI1 is being fed
> > by the DSI0 PLL? For existing platforms this is being handled by
> > changing the parents in DT.
> 
> I don't see the problem - you just put different clock as input in DTS?
> 
> Please trim your replies, so we won't need to keep scrolling to figure
> out that there is nothing more to read.
> 
> Best regards,
> Krzysztof

-- 
With best wishes
Dmitry

