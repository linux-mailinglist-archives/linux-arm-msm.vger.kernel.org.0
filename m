Return-Path: <linux-arm-msm+bounces-81943-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 834FDC6059A
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 14:21:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3AC3F3AE410
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 13:21:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A690A2BDC19;
	Sat, 15 Nov 2025 13:20:42 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8AF451DC1AB;
	Sat, 15 Nov 2025 13:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763212842; cv=none; b=nnSzSazOQy2TR+kRJD7eozZkkjjF+RymA0GJHH85wOdbmx/UaVGLd1tUAYRZXL88Q6a1RdJamaXM8Tc61Abvye2ygpu/VUsbWtIwRxCaxl+BKCzNDOsBFIr7+HFBAg3o3N5tmzhKqUZ8zK20GWbcakaVVjTNq/MWZT7gn75ezy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763212842; c=relaxed/simple;
	bh=+jLfIsFreEacPTXqdxgthqnVeMFoq4cXA/3sdf1BocQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tCD7/3IxfDa6UJ/mfrMhkCfGiKKnFX+3x/ToLvnfzuKHUpaIQblmot5HNb/HAQKCZaUFg43xpTlJayqmguDOHWZJ87jx0dmQ6dhqKrAkJiqw66WqkBqsn9BHH5Ckmz3iji3BuC5BrReB5RSxmCQarkaRcR4myXUFDmT85e5VSUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d7v8R5jXWz9sTQ;
	Sat, 15 Nov 2025 13:53:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tZEQQDyXYcmK; Sat, 15 Nov 2025 13:53:59 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d7v8R4hHjz9sTM;
	Sat, 15 Nov 2025 13:53:59 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 89F228B770;
	Sat, 15 Nov 2025 13:53:59 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id 9vCcXMXMl0bv; Sat, 15 Nov 2025 13:53:59 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2AE538B76E;
	Sat, 15 Nov 2025 13:53:58 +0100 (CET)
Message-ID: <9422f22e-ba04-4479-a8fc-a136b9642165@csgroup.eu>
Date: Sat, 15 Nov 2025 13:53:57 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 10/15] net: phy: marvell10g: Support SFP
 through phy_port
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
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-11-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251113081418.180557-11-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 13/11/2025 à 09:14, Maxime Chevallier a écrit :
> Convert the Marvell10G driver to use the generic SFP handling, through a
> dedicated .attach_port() handler to populate the port's supported
> interfaces.
> 
> As the 88x3310 supports multiple MDI, the .attach_port() logic handles
> both SFP attach with 10GBaseR support, and support for the "regular"
> port that usually is a BaseT port.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/marvell10g.c | 52 ++++++++++++++++++++++--------------
>   drivers/net/phy/phy_port.c   | 44 ++++++++++++++++++++++++++++++
>   include/linux/phy_port.h     |  1 +
>   3 files changed, 77 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell10g.c b/drivers/net/phy/marvell10g.c
> index 8fd42131cdbf..d4cace758fe8 100644
> --- a/drivers/net/phy/marvell10g.c
> +++ b/drivers/net/phy/marvell10g.c
> @@ -28,7 +28,7 @@
>   #include <linux/hwmon.h>
>   #include <linux/marvell_phy.h>
>   #include <linux/phy.h>
> -#include <linux/sfp.h>
> +#include <linux/phy_port.h>
>   #include <linux/netdevice.h>
>   
>   #define MV_PHY_ALASKA_NBT_QUIRK_MASK	0xfffffffe
> @@ -463,35 +463,35 @@ static int mv3310_set_edpd(struct phy_device *phydev, u16 edpd)
>   	return err;
>   }
>   
> -static int mv3310_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int mv3310_attach_mii_port(struct phy_device *phydev,
> +				  struct phy_port *port)
>   {
> -	struct phy_device *phydev = upstream;
> -	const struct sfp_module_caps *caps;
> -	phy_interface_t iface;
> +	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
> +	return 0;
> +}
>   
> -	caps = sfp_get_module_caps(phydev->sfp_bus);
> -	iface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
> +static int mv3310_attach_mdi_port(struct phy_device *phydev,
> +				  struct phy_port *port)
> +{
> +	/* This PHY can do combo-ports, i.e. 2 MDI outputs, usually one
> +	 * of them going to an SFP and the other one to a RJ45
> +	 * connector. If we don't have any representation for the port
> +	 * in DT, and we are dealing with a non-SFP port, then we
> +	 * mask the port's capabilities to report BaseT-only modes
> +	 */
> +	if (port->not_described)
> +		return phy_port_restrict_mediums(port,
> +						 BIT(ETHTOOL_LINK_MEDIUM_BASET));
>   
> -	if (iface != PHY_INTERFACE_MODE_10GBASER) {
> -		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> -		return -EINVAL;
> -	}
>   	return 0;
>   }
>   
> -static const struct sfp_upstream_ops mv3310_sfp_ops = {
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> -	.module_insert = mv3310_sfp_insert,
> -};
> -
>   static int mv3310_probe(struct phy_device *phydev)
>   {
>   	const struct mv3310_chip *chip = to_mv3310_chip(phydev);
>   	struct mv3310_priv *priv;
>   	u32 mmd_mask = MDIO_DEVS_PMAPMD | MDIO_DEVS_AN;
> +	DECLARE_PHY_INTERFACE_MASK(interfaces);
>   	int ret;
>   
>   	if (!phydev->is_c45 ||
> @@ -542,9 +542,13 @@ static int mv3310_probe(struct phy_device *phydev)
>   	if (ret)
>   		return ret;
>   
> +	__set_bit(PHY_INTERFACE_MODE_10GBASER, interfaces);
> +
>   	chip->init_supported_interfaces(priv->supported_interfaces);
>   
> -	return phy_sfp_probe(phydev, &mv3310_sfp_ops);
> +	phydev->max_n_ports = 2;
> +
> +	return 0;
>   }
>   
>   static void mv3310_remove(struct phy_device *phydev)
> @@ -1405,6 +1409,8 @@ static struct phy_driver mv3310_drivers[] = {
>   		.set_loopback	= genphy_c45_loopback,
>   		.get_wol	= mv3110_get_wol,
>   		.set_wol	= mv3110_set_wol,
> +		.attach_mii_port = mv3310_attach_mii_port,
> +		.attach_mdi_port = mv3310_attach_mdi_port,
>   	},
>   	{
>   		.phy_id		= MARVELL_PHY_ID_88X3310,
> @@ -1424,6 +1430,8 @@ static struct phy_driver mv3310_drivers[] = {
>   		.set_tunable	= mv3310_set_tunable,
>   		.remove		= mv3310_remove,
>   		.set_loopback	= genphy_c45_loopback,
> +		.attach_mii_port = mv3310_attach_mii_port,
> +		.attach_mdi_port = mv3310_attach_mdi_port,
>   	},
>   	{
>   		.phy_id		= MARVELL_PHY_ID_88E2110,
> @@ -1444,6 +1452,8 @@ static struct phy_driver mv3310_drivers[] = {
>   		.set_loopback	= genphy_c45_loopback,
>   		.get_wol	= mv3110_get_wol,
>   		.set_wol	= mv3110_set_wol,
> +		.attach_mii_port = mv3310_attach_mii_port,
> +		.attach_mdi_port = mv3310_attach_mdi_port,
>   	},
>   	{
>   		.phy_id		= MARVELL_PHY_ID_88E2110,
> @@ -1462,6 +1472,8 @@ static struct phy_driver mv3310_drivers[] = {
>   		.set_tunable	= mv3310_set_tunable,
>   		.remove		= mv3310_remove,
>   		.set_loopback	= genphy_c45_loopback,
> +		.attach_mii_port = mv3310_attach_mii_port,
> +		.attach_mdi_port = mv3310_attach_mdi_port,
>   	},
>   };
>   
> diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
> index f89f70f83593..d9099196f870 100644
> --- a/drivers/net/phy/phy_port.c
> +++ b/drivers/net/phy/phy_port.c
> @@ -149,6 +149,50 @@ void phy_port_update_supported(struct phy_port *port)
>   }
>   EXPORT_SYMBOL_GPL(phy_port_update_supported);
>   
> +/**
> + * phy_port_filter_supported() - Make sure that port->supported match port->mediums
> + * @port: The port to filter
> + *
> + * After updating a port's mediums to a more restricted subset, this helper will
> + * make sure that port->supported only contains linkmodes that are compatible
> + * with port->mediums.
> + */
> +static void phy_port_filter_supported(struct phy_port *port)
> +{
> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0 };
> +	int i;
> +
> +	for_each_set_bit(i, &port->mediums, __ETHTOOL_LINK_MEDIUM_LAST)
> +		phy_caps_medium_get_supported(supported, i, port->pairs);
> +
> +	linkmode_and(port->supported, port->supported, supported);
> +}
> +
> +/**
> + * phy_port_restrict_mediums - Mask away some of the port's supported mediums
> + * @port: The port to act upon
> + * @mediums: A mask of mediums to support on the port
> + *
> + * This helper allows removing some mediums from a port's list of supported
> + * mediums, which occurs once we have enough information about the port to
> + * know its nature.
> + *
> + * Returns: 0 if the change was donne correctly, a negative value otherwise.
> + */
> +int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums)
> +{
> +	/* We forbid ending-up with a port with empty mediums */
> +	if (!(port->mediums & mediums))
> +		return -EINVAL;
> +
> +	port->mediums &= mediums;
> +
> +	phy_port_filter_supported(port);
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL_GPL(phy_port_restrict_mediums);
> +
>   /**
>    * phy_port_get_type() - get the PORT_* attribute for that port.
>    * @port: The port we want the information from
> diff --git a/include/linux/phy_port.h b/include/linux/phy_port.h
> index 550c3f4ab19f..0ef0f5ce4709 100644
> --- a/include/linux/phy_port.h
> +++ b/include/linux/phy_port.h
> @@ -92,6 +92,7 @@ static inline bool phy_port_is_fiber(struct phy_port *port)
>   }
>   
>   void phy_port_update_supported(struct phy_port *port);
> +int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums);
>   
>   int phy_port_get_type(struct phy_port *port);
>   


