Return-Path: <linux-arm-msm+bounces-27740-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 170FD9452BE
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 20:32:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 990B01F22E09
	for <lists+linux-arm-msm@lfdr.de>; Thu,  1 Aug 2024 18:32:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 711B614884F;
	Thu,  1 Aug 2024 18:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MxqTD7ki"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB7D328DB;
	Thu,  1 Aug 2024 18:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722537160; cv=none; b=CghPrVeMJF+kiT+AKHsNykUVIukKxhaqt23kGJKfhPKr6J+GsziD5zfQzTXBL7KQB3idKhoNKjmOpa4xyAKRuL92e77FBteD8KK7k5++HpVw+vTqf/0GXFjLTMb1KTuGmcfyYz+4E2jO1W95gwAtfy6egX8pCVikpn4hfYPQOUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722537160; c=relaxed/simple;
	bh=CFrtLjp03d0/5Z/vBCK+uDrsTMHkNli3gx9G54CM/tM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZv0VDuL6YnY2oBa+Q1Zq3moCP3BYWiQrmqG9DOu5zVks19kgAPPlNbNUIiR2hGK/Q9CogyM4KmefgY9axBqorjLYyoZQiq/DvwfBMdE3wPRFpq9LL12H6mo0xAH/zjIAqXbvsFEnfMsC2J8hS0bHp6JL9XfBlqNW+8DHfyhBxE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MxqTD7ki; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-52efa9500e0so8902743e87.3;
        Thu, 01 Aug 2024 11:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722537157; x=1723141957; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YjpiM/JH7S8LWRVE7YLqvdV+nTZJioe44+jRr0wOwbc=;
        b=MxqTD7kiWfozj0cyjzkP9E4M9DpaO9wjoX4GqdYxV78j6wb6VTIKDJg6e0szGqwkZG
         7NJH4yZq+E3YvYtQJOkVOHaeWgbgEFqjr5HOByuE4KjEH6DX95mLJesvNz/PIvPrDoD2
         Ud0BC7FAPbtXZMrIcUFxp1dwLWcpzhJ1v6Ne40chXQsEPQqg1zScLyUAlCDTcXcuVJZd
         mOz2hFMXMu9GES5xSGhWBqMaoNvLAHHkvIJDrBszZI2KJTHlK+kawYHR1pLCrWBj+OOF
         og8QFGw8SjoH/k56XZTzYGLfC4rUy2uRPtSysx5TEr3REOosKSXIcRKvBIxiSbzHYRDY
         Ks/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722537157; x=1723141957;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YjpiM/JH7S8LWRVE7YLqvdV+nTZJioe44+jRr0wOwbc=;
        b=J9a/BegEj07Q2CTHkaV9YHfZRmPH5yFOwRYCxmK25duBG+xOfmZNsSfZnH3e081u+A
         QdG7StDglQvXiA9buqXbhtumM37DE9adVkvy+R+FHR4F6JMI474KGaqCN56WgPfsLoLR
         1hGykVtpOEUJmXDP3KzRyuvw9dzwgQFIw7xmaVuooKK2ioKYBfR/O1IJpZRPPJOF2urD
         qXpm45aEE5rKWJQzSTOtnxWMQeG7bB5oxb5Wrla/50uX+ujCAdwey8qsl6PUttTbvMS4
         rpO3N4+aIlCtC85kjm7bLIrSR/8GQZffDpcZhb56DId9EFBK26ZUbsI1XUah686nxo0B
         pFqg==
X-Forwarded-Encrypted: i=1; AJvYcCUvxPceHTgC2OqEsKL725i0OLj/v5n8dXq55jg3szzvI3Rqdk86KktVBlcxYGaCCpSQvLWvjvnrp+u0ut5re1Di9N4Mu2iFksK3NmD0zrKTqfko2SVjEkWHmZhaAzdaQ9cwMekKcWjfuDNvlGEitvyrsj9IgICyX5JzWaeq0ZOpoYbCEGBCbnc65YcXf0M504YlU92FsC3Im8a9zH2No+I=
X-Gm-Message-State: AOJu0YyYhINAT3eA9iZqdiIPICUI/+nPBBF+8I30d1hsTAfZxLMshL4p
	HxcxObjRq1S6LGivwrmVTCu1bBTIb4a1ZIQ2vyLOlQpSL0H52J7n
X-Google-Smtp-Source: AGHT+IHyjAIc9z6mb3z8s2OoSVvIC24e2n+qUC5/avSJWdohMby92u7QqWKA4Trni8XGQlr6sXK4uA==
X-Received: by 2002:a05:6512:3088:b0:52e:9fd3:f0ca with SMTP id 2adb3069b0e04-530bb38530amr535233e87.33.1722537156286;
        Thu, 01 Aug 2024 11:32:36 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-530bba1102bsm26619e87.97.2024.08.01.11.32.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Aug 2024 11:32:35 -0700 (PDT)
Date: Thu, 1 Aug 2024 21:32:32 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu <joabreu@synopsys.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Bhupesh Sharma <bhupesh.sharma@linaro.org>, kernel@quicinc.com, 
	Andrew Halaney <ahalaney@redhat.com>, Andrew Lunn <andrew@lunn.ch>, linux-arm-msm@vger.kernel.org, 
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4 2/2] net: stmmac: Add interconnect support
Message-ID: <zsdjc53fxh44bpra5cfishtvmyok2rprbtnbthimnu6quxkxyj@kvtijkxylwb3>
References: <20240708-icc_bw_voting_from_ethqos-v4-0-c6bc3db86071@quicinc.com>
 <20240708-icc_bw_voting_from_ethqos-v4-2-c6bc3db86071@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240708-icc_bw_voting_from_ethqos-v4-2-c6bc3db86071@quicinc.com>

Hi Sagar

On Mon, Jul 08, 2024 at 02:30:01PM -0700, Sagar Cheluvegowda wrote:
> Add interconnect support to vote for bus bandwidth based
> on the current speed of the driver.
> Adds support for two different paths - one from ethernet to
> DDR and the other from CPU to ethernet, Vote from each
> interconnect client is aggregated and the on-chip interconnect
> hardware is configured to the most appropriate bandwidth profile.
> 
> Suggested-by: Andrew Halaney <ahalaney@redhat.com>
> Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h          |  1 +
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c     |  8 ++++++++
>  drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c | 12 ++++++++++++
>  include/linux/stmmac.h                                |  2 ++
>  4 files changed, 23 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index b23b920eedb1..56a282d2b8cd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -21,6 +21,7 @@
>  #include <linux/ptp_clock_kernel.h>
>  #include <linux/net_tstamp.h>
>  #include <linux/reset.h>
> +#include <linux/interconnect.h>
>  #include <net/page_pool/types.h>
>  #include <net/xdp.h>
>  #include <uapi/linux/bpf.h>
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b3afc7cb7d72..ec7c61ee44d4 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -985,6 +985,12 @@ static void stmmac_fpe_link_state_handle(struct stmmac_priv *priv, bool is_up)
>  	}
>  }
>  
> +static void stmmac_set_icc_bw(struct stmmac_priv *priv, unsigned int speed)
> +{

> +	icc_set_bw(priv->plat->axi_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));
> +	icc_set_bw(priv->plat->ahb_icc_path, Mbps_to_icc(speed), Mbps_to_icc(speed));

I've got two questions in this regard:

1. Don't we need to call icc_enable()/icc_disable() in someplace in
the driver? For instance the CPU-MEM path must be enabled before even
the stmmac_dvr_probe() is called, otherwise the CSR won't be
accessible. Right? For the same reason the CPU-MEM bandwidth should be
set in sync with that.

2. Why is the CPU-MAC speed is specified to match the Ethernet link
speed? It doesn't seem reasonable. It's the CSR's access speed and
should be done as fast as possible. Shouldn't it?

> +}
> +
>  static void stmmac_mac_link_down(struct phylink_config *config,
>  				 unsigned int mode, phy_interface_t interface)
>  {
> @@ -1080,6 +1086,8 @@ static void stmmac_mac_link_up(struct phylink_config *config,
>  	if (priv->plat->fix_mac_speed)
>  		priv->plat->fix_mac_speed(priv->plat->bsp_priv, speed, mode);
>  
> +	stmmac_set_icc_bw(priv, speed);
> +
>  	if (!duplex)
>  		ctrl &= ~priv->hw->link.duplex;
>  	else
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> index 54797edc9b38..201f9dea6da9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_platform.c
> @@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
>  	}
>  
> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "mac-mem");
> +	if (IS_ERR(plat->axi_icc_path)) {
> +		ret = ERR_CAST(plat->axi_icc_path);
> +		goto error_hw_init;
> +	}
> +
> +	plat->ahb_icc_path = devm_of_icc_get(&pdev->dev, "cpu-mac");
> +	if (IS_ERR(plat->ahb_icc_path)) {
> +		ret = ERR_CAST(plat->ahb_icc_path);
> +		goto error_hw_init;
> +	}
> +
>  	plat->stmmac_rst = devm_reset_control_get_optional(&pdev->dev,
>  							   STMMAC_RESOURCE_NAME);
>  	if (IS_ERR(plat->stmmac_rst)) {
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index f92c195c76ed..385f352a0c23 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -283,6 +283,8 @@ struct plat_stmmacenet_data {
>  	struct reset_control *stmmac_rst;
>  	struct reset_control *stmmac_ahb_rst;
>  	struct stmmac_axi *axi;

> +	struct icc_path *axi_icc_path;

The MAC<->MEM interface isn't always AXI (it can be AHB or custom) and

> +	struct icc_path *ahb_icc_path;

the CPU<->MAC isn't always AHB (it can also be APB, AXI, custom). So
the more generic naming would be:

axi_icc_path -> dma_icc_path
and
ahb_icc_path -> csr_icc_path

-Serge(y)

>  	int has_gmac4;
>  	int rss_en;
>  	int mac_port_sel_speed;
> 
> -- 
> 2.34.1
> 
> 

