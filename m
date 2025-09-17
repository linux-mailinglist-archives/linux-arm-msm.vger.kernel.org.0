Return-Path: <linux-arm-msm+bounces-73876-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id BB383B7CC39
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:09:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E805A1C04632
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 220A5302767;
	Wed, 17 Sep 2025 07:21:18 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5EC5D302747;
	Wed, 17 Sep 2025 07:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093678; cv=none; b=Kc86pCZpK1aidRpWgbRQL1FseCBFNv7WyjkCcqAUblK6o4LIcs5A4tEN8mI4zkkmahcF3Q1MURMgONEOCOjU8QEzbI24wL2u888SsBJTF8DvfDuk3K5Tde1iG4qRIrVsBE8YU19dTzRdfvws8kxs7Z4MYFF7BIoF46GkXtxtli0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093678; c=relaxed/simple;
	bh=eN4LTQCpcLNb8vziYtirj+8aePgbLBZVX2LOcWgb+tA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jOCtUEyENBuRggt6oG3r7BsZVBghTRiQlJAPQb6eILjFD+lqo9QnpTw5RZzw9LL6ue8e0J7NQHLQapR1MdBZWd5eJi110P6CAU6NAfaWpxKOA1h/P9d+G2it2ipQJykYVwOC/hyBfYMfxWTzG3PzvqblGaneTt4JozsahKqqrGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV8W3R1Zz9sxv;
	Wed, 17 Sep 2025 09:02:51 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CVnqebdcPkXT; Wed, 17 Sep 2025 09:02:51 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV8W1Z4xz9sxt;
	Wed, 17 Sep 2025 09:02:51 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id F067A8B766;
	Wed, 17 Sep 2025 09:02:50 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id rbAZU3ojzuv2; Wed, 17 Sep 2025 09:02:50 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id A4F568B763;
	Wed, 17 Sep 2025 09:02:49 +0200 (CEST)
Message-ID: <586c0c4c-e1e8-4413-b9e1-53301fad7ab4@csgroup.eu>
Date: Wed, 17 Sep 2025 09:02:49 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 14/18] net: phy: at803x: Support SFP through
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
 <20250909152617.119554-15-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-15-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> Convert the at803x driver to use the generic phylib SFP handling, via a
> dedicated .attach_port() callback, populating the supported interfaces.
> 
> As these devices are limited to 1000BaseX, a workaround is used to also
> support, in a very limited way, copper modules. This is done by
> supporting SGMII but limiting it to 1G full duplex (in which case it's
> somewhat compatible with 1000BaseX).
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/qcom/at803x.c | 78 ++++++++++++++---------------------
>   1 file changed, 32 insertions(+), 46 deletions(-)
> 
> diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
> index 51a132242462..2995b08bac96 100644
> --- a/drivers/net/phy/qcom/at803x.c
> +++ b/drivers/net/phy/qcom/at803x.c
> @@ -20,7 +20,7 @@
>   #include <linux/of.h>
>   #include <linux/phylink.h>
>   #include <linux/reset.h>
> -#include <linux/sfp.h>
> +#include <linux/phy_port.h>
>   #include <dt-bindings/net/qca-ar803x.h>
>   
>   #include "qcom.h"
> @@ -769,58 +769,44 @@ static int at8031_register_regulators(struct phy_device *phydev)
>   	return 0;
>   }
>   
> -static int at8031_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int at803x_configure_mii(struct phy_port *port, bool enable,
> +				phy_interface_t interface)
>   {
> -	struct phy_device *phydev = upstream;
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(phy_support);
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
> -	DECLARE_PHY_INTERFACE_MASK(interfaces);
> -	phy_interface_t iface;
> -
> -	linkmode_zero(phy_support);
> -	phylink_set(phy_support, 1000baseX_Full);
> -	phylink_set(phy_support, 1000baseT_Full);
> -	phylink_set(phy_support, Autoneg);
> -	phylink_set(phy_support, Pause);
> -	phylink_set(phy_support, Asym_Pause);
> -
> -	linkmode_zero(sfp_support);
> -	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
> -	/* Some modules support 10G modes as well as others we support.
> -	 * Mask out non-supported modes so the correct interface is picked.
> -	 */
> -	linkmode_and(sfp_support, phy_support, sfp_support);
> +	struct phy_device *phydev = port_phydev(port);
>   
> -	if (linkmode_empty(sfp_support)) {
> -		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
> -		return -EINVAL;
> -	}
> +	if (interface == PHY_INTERFACE_MODE_SGMII)
> +		dev_warn(&phydev->mdio.dev,
> +			 "module may not function if 1000Base-X not supported\n");
> +
> +	return 0;
> +}
>   
> -	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> +static const struct phy_port_ops at803x_port_ops = {
> +	.configure_mii = at803x_configure_mii,
> +};
>   
> -	/* Only 1000Base-X is supported by AR8031/8033 as the downstream SerDes
> -	 * interface for use with SFP modules.
> -	 * However, some copper modules detected as having a preferred SGMII
> -	 * interface do default to and function in 1000Base-X mode, so just
> -	 * print a warning and allow such modules, as they may have some chance
> -	 * of working.
> +static int at8031_attach_mii_port(struct phy_device *phydev,
> +				  struct phy_port *port)
> +{
> +	linkmode_zero(port->supported);
> +	phylink_set(port->supported, 1000baseX_Full);
> +	phylink_set(port->supported, 1000baseT_Full);
> +	phylink_set(port->supported, Autoneg);
> +	phylink_set(port->supported, Pause);
> +	phylink_set(port->supported, Asym_Pause);
> +
> +	/* This device doesn't really support SGMII. However, do our best
> +	 * to be compatible with copper modules (that usually require SGMII),
> +	 * in a degraded mode as we only allow 1000BaseT Full
>   	 */
> -	if (iface == PHY_INTERFACE_MODE_SGMII)
> -		dev_warn(&phydev->mdio.dev, "module may not function if 1000Base-X not supported\n");
> -	else if (iface != PHY_INTERFACE_MODE_1000BASEX)
> -		return -EINVAL;
> +	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
> +
> +	port->ops = &at803x_port_ops;
>   
>   	return 0;
>   }
>   
> -static const struct sfp_upstream_ops at8031_sfp_ops = {
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.module_insert = at8031_sfp_insert,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> -};
> -
>   static int at8031_parse_dt(struct phy_device *phydev)
>   {
>   	struct device_node *node = phydev->mdio.dev.of_node;
> @@ -841,8 +827,7 @@ static int at8031_parse_dt(struct phy_device *phydev)
>   		return ret;
>   	}
>   
> -	/* Only AR8031/8033 support 1000Base-X for SFP modules */
> -	return phy_sfp_probe(phydev, &at8031_sfp_ops);
> +	return 0;
>   }
>   
>   static int at8031_probe(struct phy_device *phydev)
> @@ -1173,6 +1158,7 @@ static struct phy_driver at803x_driver[] = {
>   	.set_tunable		= at803x_set_tunable,
>   	.cable_test_start	= at8031_cable_test_start,
>   	.cable_test_get_status	= at8031_cable_test_get_status,
> +	.attach_mii_port	= at8031_attach_mii_port,
>   }, {
>   	/* Qualcomm Atheros AR8032 */
>   	PHY_ID_MATCH_EXACT(ATH8032_PHY_ID),


