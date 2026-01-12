Return-Path: <linux-arm-msm+bounces-88619-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id CD9A3D15255
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 21:01:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5388B30051BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:01:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B5286310647;
	Mon, 12 Jan 2026 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cmRTtpW0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92DCD2E7BDC;
	Mon, 12 Jan 2026 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248106; cv=none; b=duOR7oBu+EgP6ybMIaXfN2czHBuejYe82vUXjS3Iq64/oXT+TtMgkXYlozC2PuzGnhhwJngStL3C6EIbKupCJcG3zdJ18yx1l3LuT/BNjG42B6wKjZHifYAR2HPN5uScNTumIW6/ghKz4fiJd4Z+uci2xbtmRCph/ncpQbTFMkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248106; c=relaxed/simple;
	bh=iAzLbGMDXQfuE3s4KFa2lQ8l5bKVW/+TK+/FOv2Eho4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ELjSNVRcvGgJrp6r0rp5xvx9DCiGF5qw9A1PSpCy/sXjGjvVWwnzhUwb94MbKxeje2ly73fA3iXXAtKIcIb5djAlW9NwF75tG6x8OaJZuBCYyRhdf4rAV09w1ne6e+52OIFrrxTiTpUQd3zaDdxhVprPeliEcEFR/DbdMEzN0Qc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cmRTtpW0; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05D75C116D0;
	Mon, 12 Jan 2026 20:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768248106;
	bh=iAzLbGMDXQfuE3s4KFa2lQ8l5bKVW/+TK+/FOv2Eho4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cmRTtpW0cY4oNrQtvYdKlC26VlGGgiFUrlh1ys7lAGIXsBImtcv9fbxXcfAzv35w6
	 GaCEUXCJJ9DajEsHvVfLZlvLZ1o8g6qhe8jqJP+I/v0W28Qb9X04J0DxlQpqYlF1rk
	 rqauQh08FgmsrE9N/Oh9DsGa2zX+Yjq3nhAh4wzrFOzlAxNMN2z97cm3vvzlatqYDl
	 rI0tZFsJuf7kCtx/pneTrvKh4BS4Plk3xYDOusK3NsxRQhiyXUjXXEm/FpNgVh0eSj
	 bQVUcZUGC3N7QtGsIFi7QPeyQ9vHl8/wPphA6UsoUUdaq3V+JCwd7EA6oyM9cOfoMh
	 pGUKXhKqAJiBQ==
Date: Mon, 12 Jan 2026 20:01:40 +0000
From: Simon Horman <horms@kernel.org>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
Message-ID: <aWVTJL_G__7IQTBn@horms.kernel.org>
References: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
 <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>

On Mon, Jan 12, 2026 at 06:11:29PM +0000, Russell King (Oracle) wrote:
> Set the RGMII link clock using the set_clk_tx_rate() method rather than
> coding it into the .fix_mac_speed() method. This simplifies ethqos's
> ethqos_fix_mac_speed().
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 19 +++++++++----------
>  1 file changed, 9 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 869f924f3cde..d6df3ca757be 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -102,7 +102,6 @@ struct qcom_ethqos {
>  	void __iomem *rgmii_base;
>  	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
>  
> -	unsigned int link_clk_rate;
>  	struct clk *link_clk;
>  	struct phy *serdes_phy;
>  	int serdes_speed;
> @@ -174,19 +173,18 @@ static void rgmii_dump(void *priv)
>  		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
>  }
>  
> -static void
> -ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
> +static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
> +				  phy_interface_t interface, int speed)
>  {
> +	struct qcom_ethqos *ethqos = bsp_priv;
>  	long rate;
>  
> -	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
> -		return;
> +	if (!phy_interface_mode_is_rgmii(interface))
> +		return 0;
>  
>  	rate = rgmii_clock(speed);
>  	if (rate > 0)
> -		ethqos->link_clk_rate = rate * 2;
> -
> -	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
> +		clk_set_rate(ethqos->link_clk, rate * 2);

Hi Russell,

An int needs to be returned here.

>  }
>  
>  static void

-- 
pw-bot: cr

