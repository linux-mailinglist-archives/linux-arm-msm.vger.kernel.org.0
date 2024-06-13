Return-Path: <linux-arm-msm+bounces-22633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FA9907AA9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 20:13:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 914131F22FF3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Jun 2024 18:13:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 276AD14A617;
	Thu, 13 Jun 2024 18:13:34 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay08.th.seeweb.it (relay08.th.seeweb.it [5.144.164.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B714A4F0;
	Thu, 13 Jun 2024 18:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.144.164.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718302414; cv=none; b=IfZHp+tdZ15gogJutcxmtrij4hiUY2PTuzGoCT43wLMW+Tora/u0ag/h8HlRlatmDyYxsPGWKXm0Tb7S5uxgW7M51cuzygcbJcs8/RMyNRk5LZV/y6vp+rdRORYr3+x0Jl1iVinbtBUXKbYakz8YM0SFAl8ssKXZ3+rAWWgLkTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718302414; c=relaxed/simple;
	bh=R9G/iVhcDfA1lGL6QDOiiogTU7f4is5RdE8+WhJDX8Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RP3lIFLPtsHvJz9kjJcUeO2AhyqmR4zAx7ACzu0vrHkArCBo8sNO5OLfWS0SV62ahykIR4wJEeVOHUllO/ktI9aQBzBzhoNusPAxhHD05ZgH5z/BG4fwW5KOXQhlGxK3k30tHnggh/s0uQ6r78SYyogWEjzdgzasMLukFPL6N2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org; spf=pass smtp.mailfrom=somainline.org; arc=none smtp.client-ip=5.144.164.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=somainline.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=somainline.org
Received: from SoMainline.org (94-211-6-86.cable.dynamic.v4.ziggo.nl [94.211.6.86])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 206573EFF6;
	Thu, 13 Jun 2024 20:05:40 +0200 (CEST)
Date: Thu, 13 Jun 2024 20:05:38 +0200
From: Marijn Suijten <marijn.suijten@somainline.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
	Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>, 
	Daniel Vetter <daniel@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krishna Manikandan <quic_mkrishn@quicinc.com>, 
	linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 3/8] drm/msm/dsi: drop unused GPIOs handling
Message-ID: <5wu7wdoxudmmbovopsdgdvdyrufddo6juiomvoelcic5eqctn7@zgc2qqtscxnz>
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-3-67a0116b5366@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240613-dpu-handle-te-signal-v2-3-67a0116b5366@linaro.org>

On 2024-06-13 20:05:06, Dmitry Baryshkov wrote:
> Neither disp-enable-gpios nor disp-te-gpios are defined in the schema.
> None of the board DT files use those GPIO pins. Drop them from the
> driver.

What's worse, when people set disp-te-gpios the
devm_gpiod_get_optional("disp-te", GPIOD_IN) below resets the typical mdp_vsync
function via pinctrl to the IN function, causing vsync signals to be lost and
the MDP hardware to fall back to half the requested refresh rate since commit
da9e7b7696d8 ("drm/msm/dpu: Correctly configure vsync tearcheck for command
mode").

> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>

> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 37 -------------------------------------
>  1 file changed, 37 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index a50f4dda5941..c4d72562c95a 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -7,7 +7,6 @@
>  #include <linux/delay.h>
>  #include <linux/dma-mapping.h>
>  #include <linux/err.h>
> -#include <linux/gpio/consumer.h>
>  #include <linux/interrupt.h>
>  #include <linux/mfd/syscon.h>
>  #include <linux/of.h>
> @@ -130,9 +129,6 @@ struct msm_dsi_host {
>  
>  	unsigned long src_clk_rate;
>  
> -	struct gpio_desc *disp_en_gpio;
> -	struct gpio_desc *te_gpio;
> -
>  	const struct msm_dsi_cfg_handler *cfg_hnd;
>  
>  	struct completion dma_comp;
> @@ -1613,28 +1609,6 @@ static irqreturn_t dsi_host_irq(int irq, void *ptr)
>  	return IRQ_HANDLED;
>  }
>  
> -static int dsi_host_init_panel_gpios(struct msm_dsi_host *msm_host,
> -			struct device *panel_device)
> -{
> -	msm_host->disp_en_gpio = devm_gpiod_get_optional(panel_device,
> -							 "disp-enable",
> -							 GPIOD_OUT_LOW);
> -	if (IS_ERR(msm_host->disp_en_gpio)) {
> -		DBG("cannot get disp-enable-gpios %ld",
> -				PTR_ERR(msm_host->disp_en_gpio));
> -		return PTR_ERR(msm_host->disp_en_gpio);
> -	}
> -
> -	msm_host->te_gpio = devm_gpiod_get_optional(panel_device, "disp-te",
> -								GPIOD_IN);
> -	if (IS_ERR(msm_host->te_gpio)) {
> -		DBG("cannot get disp-te-gpios %ld", PTR_ERR(msm_host->te_gpio));
> -		return PTR_ERR(msm_host->te_gpio);
> -	}
> -
> -	return 0;
> -}
> -
>  static int dsi_host_attach(struct mipi_dsi_host *host,
>  					struct mipi_dsi_device *dsi)
>  {
> @@ -1651,11 +1625,6 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>  	if (dsi->dsc)
>  		msm_host->dsc = dsi->dsc;
>  
> -	/* Some gpios defined in panel DT need to be controlled by host */
> -	ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
> -	if (ret)
> -		return ret;
> -
>  	ret = dsi_dev_attach(msm_host->pdev);
>  	if (ret)
>  		return ret;
> @@ -2422,9 +2391,6 @@ int msm_dsi_host_power_on(struct mipi_dsi_host *host,
>  	dsi_sw_reset(msm_host);
>  	dsi_ctrl_enable(msm_host, phy_shared_timings, phy);
>  
> -	if (msm_host->disp_en_gpio)
> -		gpiod_set_value(msm_host->disp_en_gpio, 1);
> -
>  	msm_host->power_on = true;
>  	mutex_unlock(&msm_host->dev_mutex);
>  
> @@ -2454,9 +2420,6 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host)
>  
>  	dsi_ctrl_disable(msm_host);
>  
> -	if (msm_host->disp_en_gpio)
> -		gpiod_set_value(msm_host->disp_en_gpio, 0);
> -
>  	pinctrl_pm_select_sleep_state(&msm_host->pdev->dev);
>  
>  	cfg_hnd->ops->link_clk_disable(msm_host);
> 
> -- 
> 2.39.2
> 

