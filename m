Return-Path: <linux-arm-msm+bounces-73877-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D1BF7B7CDB5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:11:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 7B43732810A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:23:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 575DA302747;
	Wed, 17 Sep 2025 07:21:22 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 980A3303A23;
	Wed, 17 Sep 2025 07:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093682; cv=none; b=WiG1B58nZTybzHE55PgFCR5HKYCX0cIUBkR7VuB5xdRUm2jtrfzWp6GjPd3/8+gb5raQwOi3plM/m2D7n17408KUm5WfQZxJXcGiuHd1fLiwVjwxgyThlnInlw3CZ02dgTxGuovzOpdpWSaC4kFFVsmy1ZKEr8RfvMxY703VZG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093682; c=relaxed/simple;
	bh=vclbm78W33VZdHNBihtes8tEpFczMHG4sPe/5s+9vgs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YGYX/w6frd/iIndPJ7mmY8QV+5kBC0Ojdm6ozNSWhOBpzRsJDEBBihnMLSagEXxPzwkAX8D8nRwsD2YrBaEuTAGte/ZJq+YsGkyzVE42GRnPbYLkWngpNNFNdsWho6+ccKOzcHmeCF+ckRqvgkR3FPUziinL1yC/W2xCKiu7fy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV8y5cxKz9sy2;
	Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JcCnYpbaHND0; Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV8y4BN2z9sy1;
	Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 5AF7A8B766;
	Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id H1xM81UEGxD0; Wed, 17 Sep 2025 09:03:14 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 3D8B68B763;
	Wed, 17 Sep 2025 09:03:12 +0200 (CEST)
Message-ID: <92ccb5be-efea-4dbf-ac87-a3415b0ed3dc@csgroup.eu>
Date: Wed, 17 Sep 2025 09:03:11 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 15/18] net: phy: qca807x: Support SFP through
 phy_port interface
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
 <20250909152617.119554-16-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-16-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> QCA8072/8075 may be used as combo-port PHYs, with Serdes (100/1000BaseX)
>   and Copper interfaces. The PHY has the ability to read the configuration
> it's in.  If the configuration indicates the PHY is in combo mode, allow
> registering up to 2 ports.
> 
> Register a dedicated set of port ops to handle the serdes port, and rely
> on generic phylib SFP support for the SFP handling.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/qcom/qca807x.c | 73 ++++++++++++++--------------------
>   1 file changed, 30 insertions(+), 43 deletions(-)
> 
> diff --git a/drivers/net/phy/qcom/qca807x.c b/drivers/net/phy/qcom/qca807x.c
> index 070dc8c00835..d8f1ce5a7128 100644
> --- a/drivers/net/phy/qcom/qca807x.c
> +++ b/drivers/net/phy/qcom/qca807x.c
> @@ -13,7 +13,7 @@
>   #include <linux/phy.h>
>   #include <linux/bitfield.h>
>   #include <linux/gpio/driver.h>
> -#include <linux/sfp.h>
> +#include <linux/phy_port.h>
>   
>   #include "../phylib.h"
>   #include "qcom.h"
> @@ -643,68 +643,54 @@ static int qca807x_phy_package_config_init_once(struct phy_device *phydev)
>   	return ret;
>   }
>   
> -static int qca807x_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int qca807x_configure_serdes(struct phy_port *port, bool enable,
> +				    phy_interface_t interface)
>   {
> -	struct phy_device *phydev = upstream;
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(support) = { 0, };
> -	phy_interface_t iface;
> +	struct phy_device *phydev = port_phydev(port);
>   	int ret;
> -	DECLARE_PHY_INTERFACE_MASK(interfaces);
>   
> -	sfp_parse_support(phydev->sfp_bus, id, support, interfaces);
> -	iface = sfp_select_interface(phydev->sfp_bus, support);
> +	if (!phydev)
> +		return -ENODEV;
>   
> -	dev_info(&phydev->mdio.dev, "%s SFP module inserted\n", phy_modes(iface));
> -
> -	switch (iface) {
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -	case PHY_INTERFACE_MODE_100BASEX:
> +	if (enable) {
>   		/* Set PHY mode to PSGMII combo (1/4 copper + combo ports) mode */
>   		ret = phy_modify(phydev,
>   				 QCA807X_CHIP_CONFIGURATION,
>   				 QCA807X_CHIP_CONFIGURATION_MODE_CFG_MASK,
>   				 QCA807X_CHIP_CONFIGURATION_MODE_PSGMII_FIBER);
> +		if (ret)
> +			return ret;
>   		/* Enable fiber mode autodection (1000Base-X or 100Base-FX) */
>   		ret = phy_set_bits_mmd(phydev,
>   				       MDIO_MMD_AN,
>   				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION,
>   				       QCA807X_MMD7_FIBER_MODE_AUTO_DETECTION_EN);
> -		/* Select fiber page */
> -		ret = phy_clear_bits(phydev,
> -				     QCA807X_CHIP_CONFIGURATION,
> -				     QCA807X_BT_BX_REG_SEL);
> -
> -		phydev->port = PORT_FIBRE;
> -		break;
> -	default:
> -		dev_err(&phydev->mdio.dev, "Incompatible SFP module inserted\n");
> -		return -EINVAL;
> +		if (ret)
> +			return ret;
>   	}
>   
> -	return ret;
> +	phydev->port = enable ? PORT_FIBRE : PORT_TP;
> +
> +	return phy_modify(phydev, QCA807X_CHIP_CONFIGURATION,
> +			  QCA807X_BT_BX_REG_SEL,
> +			  enable ? 0 : QCA807X_BT_BX_REG_SEL);
>   }
>   
> -static void qca807x_sfp_remove(void *upstream)
> +static const struct phy_port_ops qca807x_serdes_port_ops = {
> +	.configure_mii = qca807x_configure_serdes,
> +};
> +
> +static int qca807x_attach_mii_port(struct phy_device *phydev,
> +				   struct phy_port *port)
>   {
> -	struct phy_device *phydev = upstream;
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
>   
> -	/* Select copper page */
> -	phy_set_bits(phydev,
> -		     QCA807X_CHIP_CONFIGURATION,
> -		     QCA807X_BT_BX_REG_SEL);
> +	port->ops = &qca807x_serdes_port_ops;
>   
> -	phydev->port = PORT_TP;
> +	return 0;
>   }
>   
> -static const struct sfp_upstream_ops qca807x_sfp_ops = {
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.module_insert = qca807x_sfp_insert,
> -	.module_remove = qca807x_sfp_remove,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> -};
> -
>   static int qca807x_probe(struct phy_device *phydev)
>   {
>   	struct device_node *node = phydev->mdio.dev.of_node;
> @@ -745,9 +731,8 @@ static int qca807x_probe(struct phy_device *phydev)
>   
>   	/* Attach SFP bus on combo port*/
>   	if (phy_read(phydev, QCA807X_CHIP_CONFIGURATION)) {
> -		ret = phy_sfp_probe(phydev, &qca807x_sfp_ops);
> -		if (ret)
> -			return ret;
> +		phydev->max_n_ports = 2;
> +
>   		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->supported);
>   		linkmode_set_bit(ETHTOOL_LINK_MODE_FIBRE_BIT, phydev->advertising);
>   	}
> @@ -825,6 +810,7 @@ static struct phy_driver qca807x_drivers[] = {
>   		.get_phy_stats		= qca807x_get_phy_stats,
>   		.set_wol		= at8031_set_wol,
>   		.get_wol		= at803x_get_wol,
> +		.attach_mii_port	= qca807x_attach_mii_port,
>   	},
>   	{
>   		PHY_ID_MATCH_EXACT(PHY_ID_QCA8075),
> @@ -852,6 +838,7 @@ static struct phy_driver qca807x_drivers[] = {
>   		.get_phy_stats		= qca807x_get_phy_stats,
>   		.set_wol		= at8031_set_wol,
>   		.get_wol		= at803x_get_wol,
> +		.attach_mii_port	= qca807x_attach_mii_port,
>   	},
>   };
>   module_phy_driver(qca807x_drivers);


