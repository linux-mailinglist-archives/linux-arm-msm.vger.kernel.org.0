Return-Path: <linux-arm-msm+bounces-89226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F377D25103
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:51:48 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D3051302F832
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 14:48:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 427DF3557E0;
	Thu, 15 Jan 2026 14:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oUheIc45"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A3234EF06
	for <linux-arm-msm@vger.kernel.org>; Thu, 15 Jan 2026 14:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488530; cv=none; b=XcIhQYoQz88GP91VD+CeW37e2/rAmAFBm2zPNk0EgjoynA5y0tE5EbiYK9FinZ1EjYX64Yz6DLvvJmRXm9+vR1Uef+936m53T18ioSVKiOut3RQXgaoH8ewNa9DvIveSLkvXGKZFNOhLvQcRKgozPTiBFHeea6BJGaL6rXO9SA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488530; c=relaxed/simple;
	bh=/wqLaNcbkoPRXp8u3cwMXDZ7kXCOXFwlXPBCo7HbKnQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=arcXwrU7xMNmxt210oUpVRAMVwpDIF34rmo25/op+/qwFqO8F75f0aKjmKCIKfuImRCG3nB7ScPl86pgDzZl1nPaaUzU77jOlLpyzMOWeUvQV7ZhSD1NCOZ9ZQctl/xLfzxhUkDhjA+wwGphge9FnHz1vU2PHngfpzB+CObDlPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oUheIc45; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E498CC1F1EC;
	Thu, 15 Jan 2026 14:48:18 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A0645606B6;
	Thu, 15 Jan 2026 14:48:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0368510B685B3;
	Thu, 15 Jan 2026 15:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768488524; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+QYowkF0ylQwr81E7dNDCYNQ4alDslj2K3oqmZv522g=;
	b=oUheIc45ljAvwXYhk0Aau0jRxamfAh6xH0rQ4hZbzgdHLYgXV/BtH6dfKAGDefWVtGM4lo
	iaHN8MCwCkmjKP1GF4/BS7krnuSlGSpac7jaH25lzfm6/aQMOFQTQm+NKX3Y/hGOhsaZ/P
	snd1qOC5zqOk5oBGrCwOQIGzRGwc9UAUPWjtzJQyGXzNSbsN7a1a1doSqVOydrHPsa/0nz
	LDNcnsM0eeB1E+PNzjAoI/LO3TCcJs61WnLDcaoxlGHsvaIoqRKE2abbphB2UZnXXNOImm
	XMcheO6zkttudxz3PTioR0vMaAaB79bo7QXKFMj1RE8UETvfKnraWS7O9OBVBQ==
Message-ID: <a91a0937-93cd-40f2-9759-8823fb08f48c@bootlin.com>
Date: Thu, 15 Jan 2026 15:48:40 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 05/14] net: stmmac: add stmmac core serdes
 support
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Russell,

On 14/01/2026 18:45, Russell King (Oracle) wrote:
> Rather than having platform glue implement SerDes PHY support, add it
> to the core driver, specifically to the stmmac integrated PCS driver
> as the SerDes is connected to the integrated PCS.
> 
> Platforms using external PCS can also populate plat->serdes, and the
> core driver will call phy_init() and phy_exit() when the administrative
> state of the interface changes, but the other phy methods will not be
> called.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Unfortunately I have no way to test. But still,

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c |  14 ++-
>  .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  |  38 +++++-
>  .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |   1 +
>  .../ethernet/stmicro/stmmac/stmmac_serdes.c   | 111 ++++++++++++++++++
>  .../ethernet/stmicro/stmmac/stmmac_serdes.h   |  16 +++
>  include/linux/stmmac.h                        |   2 +
>  7 files changed, 180 insertions(+), 4 deletions(-)
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
>  create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
> index c9263987ef8d..a3c2cd5d0c91 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/Makefile
> +++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
> @@ -7,7 +7,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
>  	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
>  	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
>  	      stmmac_xdp.o stmmac_est.o stmmac_fpe.o stmmac_vlan.o \
> -	      stmmac_pcs.o $(stmmac-y)
> +	      stmmac_pcs.o stmmac_serdes.o $(stmmac-y)
>  
>  stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index 24a2555ca329..6c515f9efbe7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -48,6 +48,7 @@
>  #include "stmmac_fpe.h"
>  #include "stmmac.h"
>  #include "stmmac_pcs.h"
> +#include "stmmac_serdes.h"
>  #include "stmmac_xdp.h"
>  #include <linux/reset.h>
>  #include <linux/of_mdio.h>
> @@ -3549,12 +3550,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
>  
>  static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
>  {
> +	dwmac_serdes_power_on(priv);
> +	/* Only sets the SerDes mode if it wasn't already configured. */
> +	dwmac_serdes_init_mode(priv, priv->plat->phy_interface);
>  	phylink_rx_clk_stop_block(priv->phylink);
>  }
>  
>  static void stmmac_clk_rx_i_release(struct stmmac_priv *priv)
>  {
>  	phylink_rx_clk_stop_unblock(priv->phylink);
> +	dwmac_serdes_power_off(priv);
>  }
>  
>  /**
> @@ -4152,10 +4157,14 @@ static int stmmac_open(struct net_device *dev)
>  	if (ret)
>  		goto err_runtime_pm;
>  
> -	ret = __stmmac_open(dev, dma_conf);
> +	ret = dwmac_serdes_init(priv);
>  	if (ret)
>  		goto err_disconnect_phy;
>  
> +	ret = __stmmac_open(dev, dma_conf);
> +	if (ret)
> +		goto err_serdes;
> +
>  	kfree(dma_conf);
>  
>  	/* We may have called phylink_speed_down before */
> @@ -4163,6 +4172,8 @@ static int stmmac_open(struct net_device *dev)
>  
>  	return ret;
>  
> +err_serdes:
> +	dwmac_serdes_exit(priv);
>  err_disconnect_phy:
>  	phylink_disconnect_phy(priv->phylink);
>  err_runtime_pm:
> @@ -4226,6 +4237,7 @@ static int stmmac_release(struct net_device *dev)
>  
>  	__stmmac_release(dev);
>  
> +	dwmac_serdes_exit(priv);
>  	phylink_disconnect_phy(priv->phylink);
>  	pm_runtime_put(priv->device);
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> index 2f826fe7229b..4d1902f3a58f 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
> @@ -1,12 +1,25 @@
>  // SPDX-License-Identifier: GPL-2.0-only
>  #include "stmmac.h"
>  #include "stmmac_pcs.h"
> +#include "stmmac_serdes.h"
>  
>  static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	struct stmmac_priv *priv = spcs->priv;
> +	int ret;
>  
> -	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
> +	ret = dwmac_serdes_power_on(priv);
> +	if (ret)
> +		return ret;
> +
> +	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
> +		ret = dwmac_serdes_set_mode(priv, spcs->interface);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	stmmac_mac_irq_modify(priv, 0, spcs->int_mask);
>  
>  	return 0;
>  }
> @@ -14,8 +27,11 @@ static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
>  static void dwmac_integrated_pcs_disable(struct phylink_pcs *pcs)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	struct stmmac_priv *priv = spcs->priv;
>  
> -	stmmac_mac_irq_modify(spcs->priv, spcs->int_mask, 0);
> +	stmmac_mac_irq_modify(priv, spcs->int_mask, 0);
> +
> +	dwmac_serdes_power_off(priv);
>  }
>  
>  static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
> @@ -32,6 +48,15 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
>  				       bool permit_pause_to_mac)
>  {
>  	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
> +	int ret;
> +
> +	if (spcs->interface != interface) {
> +		ret = dwmac_serdes_set_mode(spcs->priv, interface);
> +		if (ret)
> +			return ret;
> +
> +		spcs->interface = interface;
> +	}
>  
>  	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
>  
> @@ -71,6 +96,7 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
>  			       u32 int_mask)
>  {
>  	struct stmmac_pcs *spcs;
> +	int ret;
>  
>  	spcs = devm_kzalloc(priv->device, sizeof(*spcs), GFP_KERNEL);
>  	if (!spcs)
> @@ -81,6 +107,14 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
>  	spcs->int_mask = int_mask;
>  	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
>  
> +	if (priv->plat->serdes) {
> +		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_SGMII);
> +		if (ret)
> +			dev_warn(priv->device,
> +				 "serdes does not support SGMII: %pe\n",
> +				 ERR_PTR(ret));
> +	}
> +
>  	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
>  
>  	priv->integrated_pcs = spcs;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> index c4e6b242d390..36bf75fdf478 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
> @@ -53,6 +53,7 @@ struct stmmac_pcs {
>  	struct stmmac_priv *priv;
>  	void __iomem *base;
>  	u32 int_mask;
> +	phy_interface_t interface;
>  	struct phylink_pcs pcs;
>  };
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
> new file mode 100644
> index 000000000000..3003e1ae38d2
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
> @@ -0,0 +1,111 @@
> +#include <linux/phy/phy.h>
> +
> +#include "stmmac.h"
> +#include "stmmac_serdes.h"
> +
> +static phy_interface_t dwmac_serdes_phy_modes[] = {
> +	PHY_INTERFACE_MODE_SGMII,
> +	PHY_INTERFACE_MODE_1000BASEX,
> +	PHY_INTERFACE_MODE_2500BASEX
> +};
> +
> +int dwmac_serdes_validate(struct stmmac_priv *priv, phy_interface_t interface)
> +{
> +	return phy_validate(priv->plat->serdes, PHY_MODE_ETHERNET, interface,
> +			    NULL);
> +}
> +
> +int dwmac_serdes_init(struct stmmac_priv *priv)
> +{
> +	size_t i;
> +	int ret;
> +
> +	if (!priv->plat->serdes)
> +		return 0;
> +
> +	/* Encourage good implementation of the SerDes PHY driver, so that
> +	 * we can discover which Ethernet modes the SerDes supports.
> +	 * Unfortunately, some implementations are noisy (bad), others
> +	 * require phy_set_speed() to select the correct speed first
> +	 * (which then reprograms the SerDes, negating the whole point of
> +	 * phy_validate().) Weed out these incompatible implementations.
> +	 */
> +	for (i = 0; i < ARRAY_SIZE(dwmac_serdes_phy_modes); i++) {
> +		ret = phy_validate(priv->plat->serdes, PHY_MODE_ETHERNET,
> +				   dwmac_serdes_phy_modes[i], NULL);
> +		if (ret == 0 || ret == -EOPNOTSUPP)
> +			break;
> +	}
> +
> +	if (ret == -EOPNOTSUPP)
> +		dev_warn(priv->device,
> +			 "SerDes driver does not implement phy_validate()\n");
> +	if (ret) {
> +		/* The SerDes PHY failed validation, refuse to use it. */
> +		dev_warn(priv->device,
> +			 "SerDes driver fails to validate SGMII, 1000BASE-X nor 2500BASE-X\n");
> +		return -EINVAL;
> +	}
> +
> +	ret = phy_init(priv->plat->serdes);
> +	if (ret)
> +		dev_err(priv->device, "failed to initialize SerDes: %pe\n",
> +			ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +int dwmac_serdes_power_on(struct stmmac_priv *priv)
> +{
> +	int ret;
> +
> +	ret = phy_power_on(priv->plat->serdes);
> +	if (ret)
> +		dev_err(priv->device, "failed to power on SerDes: %pe\n",
> +			ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface)
> +{
> +	struct phy *serdes = priv->plat->serdes;
> +
> +	if (phy_get_mode(serdes) == PHY_MODE_ETHERNET)
> +		return 0;
> +
> +	return dwmac_serdes_set_mode(priv, interface);
> +}
> +
> +int dwmac_serdes_set_mode(struct stmmac_priv *priv, phy_interface_t interface)
> +{
> +	struct phy *serdes = priv->plat->serdes;
> +	int ret;
> +
> +	ret = phy_set_mode_ext(serdes, PHY_MODE_ETHERNET, interface);
> +	if (ret)
> +		dev_err(priv->device,
> +			"failed to set SerDes mode %s: %pe\n",
> +			phy_modes(interface), ERR_PTR(ret));
> +
> +	return ret;
> +}
> +
> +void dwmac_serdes_power_off(struct stmmac_priv *priv)
> +{
> +	int ret;
> +
> +	ret = phy_power_off(priv->plat->serdes);
> +	if (ret)
> +		dev_err(priv->device, "failed to power off SerDes: %pe\n",
> +			ERR_PTR(ret));
> +}
> +
> +void dwmac_serdes_exit(struct stmmac_priv *priv)
> +{
> +	int ret = phy_exit(priv->plat->serdes);
> +
> +	if (ret)
> +		dev_err(priv->device, "failed to shutdown SerDes: %pe\n",
> +			ERR_PTR(ret));
> +}
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
> new file mode 100644
> index 000000000000..a31e6c9e0570
> --- /dev/null
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
> @@ -0,0 +1,16 @@
> +#ifndef STMMAC_SERDES_H
> +#define STMMAC_SERDES_H
> +
> +#include <linux/phy.h>
> +
> +struct stmmac_priv;
> +
> +int dwmac_serdes_validate(struct stmmac_priv *priv, phy_interface_t interface);
> +int dwmac_serdes_init(struct stmmac_priv *priv);
> +int dwmac_serdes_power_on(struct stmmac_priv *priv);
> +int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface);
> +int dwmac_serdes_set_mode(struct stmmac_priv *priv, phy_interface_t interface);
> +void dwmac_serdes_power_off(struct stmmac_priv *priv);
> +void dwmac_serdes_exit(struct stmmac_priv *priv);
> +
> +#endif
> diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
> index f1054b9c2d8a..4db506e5cf13 100644
> --- a/include/linux/stmmac.h
> +++ b/include/linux/stmmac.h
> @@ -193,6 +193,7 @@ enum dwmac_core_type {
>  #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
>  
>  struct mac_device_info;
> +struct phy;
>  
>  struct plat_stmmacenet_data {
>  	enum dwmac_core_type core_type;
> @@ -222,6 +223,7 @@ struct plat_stmmacenet_data {
>  	 * that phylink uses.
>  	 */
>  	phy_interface_t phy_interface;
> +	struct phy *serdes;
>  	struct stmmac_mdio_bus_data *mdio_bus_data;
>  	struct device_node *phy_node;
>  	struct fwnode_handle *port_node;


