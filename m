Return-Path: <linux-arm-msm+bounces-73873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AE1B7CAB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:07:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id BEA3D4E2CD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:22:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26F6830103B;
	Wed, 17 Sep 2025 07:21:03 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 39C4E2FFFBF;
	Wed, 17 Sep 2025 07:21:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093663; cv=none; b=QPhINWhFx5GilFTXhW/e8qi+JAbVl2ei9Bvitm7uvPUWYTLWTS/tQlDavHTJLw9RMCaUumUyPA9AM/843+o1UdvIF4dLbNFqGnL/sFdNxoO9VmTG92pwlMZTt4Pn5KxSqFoYi5g2FpsmNv2C8ougPXTyonmZTwxo3SJ31MqAOYY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093663; c=relaxed/simple;
	bh=nFzqA5g3aYlkgH3ruL3eEoTR59cyDhBtX7Pf5luMH0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZUD08GpN/OvBAiHG7MfXdqewyxG8lkAWo0Rim+2Oq9WxnOAong+L2BtlA9mUS+bOfuEW8ufxpCNH0xZgRVM8RAJbGdrKHC5oPTj4OiS9/tnZ0kc3uJkJwunNlftlWO3cz6K4Mo5XhjeHLDXLder8m5ZRlXMBwr7q2E6AwoLJ9sA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV7c6r5Bz9sxq;
	Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bdYov1DU9pDS; Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV7c53qMz9sxm;
	Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 771578B766;
	Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id vC-MlbVpWJHu; Wed, 17 Sep 2025 09:02:04 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 28FA88B763;
	Wed, 17 Sep 2025 09:02:03 +0200 (CEST)
Message-ID: <e7c1245c-49d6-4a5d-b8c0-0312b80c9c3f@csgroup.eu>
Date: Wed, 17 Sep 2025 09:02:02 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 12/18] net: phy: marvell: Support SFP through
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
 <20250909152617.119554-13-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-13-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> Convert the Marvell driver (especially the 88e1512 driver) to use the
> phy_port interface to handle SFPs. This means registering a
> .attach_port() handler to detect when a serdes line interface is used
> (most likely, and SFP module).
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/marvell.c | 94 ++++++++++++++-------------------------
>   1 file changed, 33 insertions(+), 61 deletions(-)
> 
> diff --git a/drivers/net/phy/marvell.c b/drivers/net/phy/marvell.c
> index 623292948fa7..467cf94e2d7f 100644
> --- a/drivers/net/phy/marvell.c
> +++ b/drivers/net/phy/marvell.c
> @@ -29,10 +29,10 @@
>   #include <linux/ethtool.h>
>   #include <linux/ethtool_netlink.h>
>   #include <linux/phy.h>
> +#include <linux/phy_port.h>
>   #include <linux/marvell_phy.h>
>   #include <linux/bitfield.h>
>   #include <linux/of.h>
> -#include <linux/sfp.h>
>   
>   #include <linux/io.h>
>   #include <asm/irq.h>
> @@ -3561,42 +3561,38 @@ static int marvell_probe(struct phy_device *phydev)
>   	return marvell_hwmon_probe(phydev);
>   }
>   
> -static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int m88e1510_port_configure_serdes(struct phy_port *port, bool enable,
> +					  phy_interface_t interface)
>   {
> -	DECLARE_PHY_INTERFACE_MASK(interfaces);
> -	struct phy_device *phydev = upstream;
> -	phy_interface_t interface;
> +	struct phy_device *phydev = port_phydev(port);
>   	struct device *dev;
>   	int oldpage;
>   	int ret = 0;
>   	u16 mode;
>   
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(supported) = { 0, };
> -
>   	dev = &phydev->mdio.dev;
>   
> -	sfp_parse_support(phydev->sfp_bus, id, supported, interfaces);
> -	interface = sfp_select_interface(phydev->sfp_bus, supported);
> +	if (enable) {
> +		switch (interface) {
> +		case PHY_INTERFACE_MODE_1000BASEX:
> +			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
>   
> -	dev_info(dev, "%s SFP module inserted\n", phy_modes(interface));
> +			break;
> +		case PHY_INTERFACE_MODE_100BASEX:
> +			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX;
>   
> -	switch (interface) {
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_1000X;
> +			break;
> +		case PHY_INTERFACE_MODE_SGMII:
> +			mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
>   
> -		break;
> -	case PHY_INTERFACE_MODE_100BASEX:
> -		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_100FX;
> +			break;
> +		default:
> +			dev_err(dev, "Incompatible SFP module inserted\n");
>   
> -		break;
> -	case PHY_INTERFACE_MODE_SGMII:
> -		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII_SGMII;
> -
> -		break;
> -	default:
> -		dev_err(dev, "Incompatible SFP module inserted\n");
> -
> -		return -EINVAL;
> +			return -EINVAL;
> +		}
> +	} else {
> +		mode = MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII;
>   	}
>   
>   	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
> @@ -3613,49 +3609,24 @@ static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
>   
>   error:
>   	return phy_restore_page(phydev, oldpage, ret);
> -}
> -
> -static void m88e1510_sfp_remove(void *upstream)
> -{
> -	struct phy_device *phydev = upstream;
> -	int oldpage;
> -	int ret = 0;
> -
> -	oldpage = phy_select_page(phydev, MII_MARVELL_MODE_PAGE);
> -	if (oldpage < 0)
> -		goto error;
> -
> -	ret = __phy_modify(phydev, MII_88E1510_GEN_CTRL_REG_1,
> -			   MII_88E1510_GEN_CTRL_REG_1_MODE_MASK,
> -			   MII_88E1510_GEN_CTRL_REG_1_MODE_RGMII);
> -	if (ret < 0)
> -		goto error;
> -
> -	ret = __phy_set_bits(phydev, MII_88E1510_GEN_CTRL_REG_1,
> -			     MII_88E1510_GEN_CTRL_REG_1_RESET);
>   
> -error:
> -	phy_restore_page(phydev, oldpage, ret);
> +	return 0;
>   }
>   
> -static const struct sfp_upstream_ops m88e1510_sfp_ops = {
> -	.module_insert = m88e1510_sfp_insert,
> -	.module_remove = m88e1510_sfp_remove,
> -	.attach = phy_sfp_attach,
> -	.detach = phy_sfp_detach,
> -	.connect_phy = phy_sfp_connect_phy,
> -	.disconnect_phy = phy_sfp_disconnect_phy,
> +static const struct phy_port_ops m88e1510_serdes_port_ops = {
> +	.configure_mii = m88e1510_port_configure_serdes,
>   };
>   
> -static int m88e1510_probe(struct phy_device *phydev)
> +static int m88e1510_attach_mii_port(struct phy_device *phy_device,
> +				    struct phy_port *port)
>   {
> -	int err;
> +	port->ops = &m88e1510_serdes_port_ops;
>   
> -	err = marvell_probe(phydev);
> -	if (err)
> -		return err;
> +	__set_bit(PHY_INTERFACE_MODE_SGMII, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX, port->interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
>   
> -	return phy_sfp_probe(phydev, &m88e1510_sfp_ops);
> +	return 0;
>   }
>   
>   static struct phy_driver marvell_drivers[] = {
> @@ -3915,7 +3886,7 @@ static struct phy_driver marvell_drivers[] = {
>   		.driver_data = DEF_MARVELL_HWMON_OPS(m88e1510_hwmon_ops),
>   		.features = PHY_GBIT_FIBRE_FEATURES,
>   		.flags = PHY_POLL_CABLE_TEST,
> -		.probe = m88e1510_probe,
> +		.probe = marvell_probe,
>   		.config_init = m88e1510_config_init,
>   		.config_aneg = m88e1510_config_aneg,
>   		.read_status = marvell_read_status,
> @@ -3941,6 +3912,7 @@ static struct phy_driver marvell_drivers[] = {
>   		.led_hw_is_supported = m88e1318_led_hw_is_supported,
>   		.led_hw_control_set = m88e1318_led_hw_control_set,
>   		.led_hw_control_get = m88e1318_led_hw_control_get,
> +		.attach_mii_port = m88e1510_attach_mii_port,
>   	},
>   	{
>   		.phy_id = MARVELL_PHY_ID_88E1540,


