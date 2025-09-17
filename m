Return-Path: <linux-arm-msm+bounces-73870-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 516B7B7CAAE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B86154E2750
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:21:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 45F552F5A38;
	Wed, 17 Sep 2025 07:20:48 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5B5992F5A23;
	Wed, 17 Sep 2025 07:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093648; cv=none; b=Dx5DQ2yXzKkXRHqFhwuJGaPh1Kv9W4OVOtC45OZ+znkBEqM9wi23KYSIdguiZkk52E/m1ffVZOr/g/CNFkzgPHMAgbgACBse2aGkO3R368QbUvZsjUqcryCPHHKSiKppcVVJDs6BZ2MgQQjCqky8GNUV616baJupd0WF0wQZMcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093648; c=relaxed/simple;
	bh=zP02Bdpl7rKOLlKOpVTWMbCwIVijzTFggDEIg7F26Mg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=NBfkyZ1IjsJBeVhCnKSR2reHn6DeOF7ANHLr1/W4MjO9ktrqjZEsum0tEX2ncDHONueO3Kp+NVFu+K7Lw8fNpVMSxLPU9aoclt65sb1AIUzHzxlxnSUqucBbFqOiIinRL3zncgDHoHzZZHnm8MmTclwUkePsIj+JZfAN72iBxrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV7G2B3mz9sxn;
	Wed, 17 Sep 2025 09:01:46 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhKxO5CHxhmP; Wed, 17 Sep 2025 09:01:46 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV7G0dLTz9sxm;
	Wed, 17 Sep 2025 09:01:46 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id DD86A8B766;
	Wed, 17 Sep 2025 09:01:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id uunUJtSsEZNt; Wed, 17 Sep 2025 09:01:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 8FD918B763;
	Wed, 17 Sep 2025 09:01:44 +0200 (CEST)
Message-ID: <09bdcede-a6e6-4fee-8cd1-d351ed64ca58@csgroup.eu>
Date: Wed, 17 Sep 2025 09:01:44 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 11/18] net: phy: marvell-88x2222: Support SFP
 through phy_port interface
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
 <20250909152617.119554-12-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-12-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> The 88x2222 PHY from Marvell only supports serialised modes as its
> line-facing interfaces. Convert that driver to the generic phylib SFP
> handling.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/marvell-88x2222.c | 95 +++++++++++++------------------
>   1 file changed, 38 insertions(+), 57 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell-88x2222.c b/drivers/net/phy/marvell-88x2222.c
> index fad2f54c1eac..ba1bbb6c63d6 100644
> --- a/drivers/net/phy/marvell-88x2222.c
> +++ b/drivers/net/phy/marvell-88x2222.c
> @@ -13,7 +13,7 @@
>   #include <linux/mdio.h>
>   #include <linux/marvell_phy.h>
>   #include <linux/of.h>
> -#include <linux/sfp.h>
> +#include <linux/phy_port.h>
>   #include <linux/netdevice.h>
>   
>   /* Port PCS Configuration */
> @@ -473,90 +473,70 @@ static int mv2222_config_init(struct phy_device *phydev)
>   	return 0;
>   }
>   
> -static int mv2222_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int mv2222_configure_serdes(struct phy_port *port, bool enable,
> +				   phy_interface_t interface)
>   {
> -	DECLARE_PHY_INTERFACE_MASK(interfaces);
> -	struct phy_device *phydev = upstream;
> -	phy_interface_t sfp_interface;
> +	struct phy_device *phydev = port_phydev(port);
>   	struct mv2222_data *priv;
> -	struct device *dev;
> -	int ret;
> -
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_supported) = { 0, };
> +	int ret = 0;
>   
>   	priv = phydev->priv;
> -	dev = &phydev->mdio.dev;
> -
> -	sfp_parse_support(phydev->sfp_bus, id, sfp_supported, interfaces);
> -	phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_supported);
> -	sfp_interface = sfp_select_interface(phydev->sfp_bus, sfp_supported);
> -
> -	dev_info(dev, "%s SFP module inserted\n", phy_modes(sfp_interface));
> +	priv->line_interface = interface;
>   
> -	if (sfp_interface != PHY_INTERFACE_MODE_10GBASER &&
> -	    sfp_interface != PHY_INTERFACE_MODE_1000BASEX &&
> -	    sfp_interface != PHY_INTERFACE_MODE_SGMII) {
> -		dev_err(dev, "Incompatible SFP module inserted\n");
> +	if (enable) {
> +		linkmode_and(priv->supported, phydev->supported, port->supported);
>   
> -		return -EINVAL;
> -	}
> -
> -	priv->line_interface = sfp_interface;
> -	linkmode_and(priv->supported, phydev->supported, sfp_supported);
> +		ret = mv2222_config_line(phydev);
> +		if (ret < 0)
> +			return ret;
>   
> -	ret = mv2222_config_line(phydev);
> -	if (ret < 0)
> -		return ret;
> +		if (mutex_trylock(&phydev->lock)) {
> +			ret = mv2222_config_aneg(phydev);
> +			mutex_unlock(&phydev->lock);
> +		}
>   
> -	if (mutex_trylock(&phydev->lock)) {
> -		ret = mv2222_config_aneg(phydev);
> -		mutex_unlock(&phydev->lock);
> +	} else {
> +		linkmode_zero(priv->supported);
>   	}
>   
>   	return ret;
>   }
>   
> -static void mv2222_sfp_remove(void *upstream)
> +static void mv2222_port_link_up(struct phy_port *port)
>   {
> -	struct phy_device *phydev = upstream;
> -	struct mv2222_data *priv;
> -
> -	priv = phydev->priv;
> -
> -	priv->line_interface = PHY_INTERFACE_MODE_NA;
> -	linkmode_zero(priv->supported);
> -	phydev->port = PORT_NONE;
> -}
> -
> -static void mv2222_sfp_link_up(void *upstream)
> -{
> -	struct phy_device *phydev = upstream;
> +	struct phy_device *phydev = port_phydev(port);
>   	struct mv2222_data *priv;
>   
>   	priv = phydev->priv;
>   	priv->sfp_link = true;
>   }
>   
> -static void mv2222_sfp_link_down(void *upstream)
> +static void mv2222_port_link_down(struct phy_port *port)
>   {
> -	struct phy_device *phydev = upstream;
> +	struct phy_device *phydev = port_phydev(port);
>   	struct mv2222_data *priv;
>   
>   	priv = phydev->priv;
>   	priv->sfp_link = false;
>   }
>   
> -static const struct sfp_upstream_ops sfp_phy_ops = {
> -	.module_insert = mv2222_sfp_insert,
> -	.module_remove = mv2222_sfp_remove,
> -	.link_up = mv2222_sfp_link_up,
> -	.link_down = mv2222_sfp_link_down,
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> +static const struct phy_port_ops mv2222_port_ops = {
> +	.link_up = mv2222_port_link_up,
> +	.link_down = mv2222_port_link_down,
> +	.configure_mii = mv2222_configure_serdes,
>   };
>   
> +static int mv2222_attach_mii_port(struct phy_device *phydev, struct phy_port *port)
> +{
> +	port->ops = &mv2222_port_ops;
> +
> +	__set_bit(PHY_INTERFACE_MODE_10GBASER, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
> +
> +	return 0;
> +}
> +
>   static int mv2222_probe(struct phy_device *phydev)
>   {
>   	struct device *dev = &phydev->mdio.dev;
> @@ -592,7 +572,7 @@ static int mv2222_probe(struct phy_device *phydev)
>   	priv->line_interface = PHY_INTERFACE_MODE_NA;
>   	phydev->priv = priv;
>   
> -	return phy_sfp_probe(phydev, &sfp_phy_ops);
> +	return 0;
>   }
>   
>   static struct phy_driver mv2222_drivers[] = {
> @@ -609,6 +589,7 @@ static struct phy_driver mv2222_drivers[] = {
>   		.suspend = mv2222_suspend,
>   		.resume = mv2222_resume,
>   		.read_status = mv2222_read_status,
> +		.attach_mii_port = mv2222_attach_mii_port,
>   	},
>   };
>   module_phy_driver(mv2222_drivers);


