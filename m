Return-Path: <linux-arm-msm+bounces-73874-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34BF9B7CC58
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:09:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 80A7D1C022B6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:23:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4270F3016F0;
	Wed, 17 Sep 2025 07:21:08 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76DEE301706;
	Wed, 17 Sep 2025 07:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093668; cv=none; b=J5X3Y5yWcjwdYn5sfH2HEDzsEJywaRla7JyUv1IiZWaRdw3bMHoZRPwhHkdtBhEkOQv8WuuaCFSle9HGv5SQTwafodoTWiToeoOz6XDtL1sKVVFYVdDFSfWCMrNxx9bFpWnTvsMyTcZ/70/E7JwfnMqteC/P0xNoYzW8JWoC26M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093668; c=relaxed/simple;
	bh=wi+BDfWniz+fSNMJHWDEUuouEGlVejipe4WyWSspWJ0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qykvxYH+thxY5M32/qpNJEOb1Rza25tDsog3PTX2oCL5zRtvZXPkK3do2AbJctnhLRa+R7PtFr11wjh683YopZqNPbsqkzMo7d2vzgxqfureZzKGju5e0DZHM6EXAHDOgt9eTDK8d4EqAnk8jLt1HZCeaVBKbTPSmILswR8YntY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV546dq9z9sxc;
	Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z46yxuCUCYXC; Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV544zDlz9sxb;
	Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7C9518B766;
	Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id u3lJUXBftTCg; Wed, 17 Sep 2025 08:59:52 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 36D288B763;
	Wed, 17 Sep 2025 08:59:51 +0200 (CEST)
Message-ID: <2b3f5f44-0629-4fc0-a70a-dc949a3edc0c@csgroup.eu>
Date: Wed, 17 Sep 2025 08:59:50 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 05/18] net: phy: dp83822: Add support for
 phy_port representation
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
 <20250909152617.119554-6-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-6-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> With the phy_port representation introduced, we can use .attach_port to
> populate the port information based on either the straps or the
> ti,fiber-mode property. This allows simplifying the probe function and
> allow users to override the strapping configuration.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/dp83822.c | 72 +++++++++++++++++++++++++--------------
>   1 file changed, 46 insertions(+), 26 deletions(-)
> 
> diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
> index 33db21251f2e..c6e5b7244658 100644
> --- a/drivers/net/phy/dp83822.c
> +++ b/drivers/net/phy/dp83822.c
> @@ -11,6 +11,7 @@
>   #include <linux/module.h>
>   #include <linux/of.h>
>   #include <linux/phy.h>
> +#include <linux/phy_port.h>
>   #include <linux/netdevice.h>
>   #include <linux/bitfield.h>
>   
> @@ -811,17 +812,6 @@ static int dp83822_of_init(struct phy_device *phydev)
>   	int i, ret;
>   	u32 val;
>   
> -	/* Signal detection for the PHY is only enabled if the FX_EN and the
> -	 * SD_EN pins are strapped. Signal detection can only enabled if FX_EN
> -	 * is strapped otherwise signal detection is disabled for the PHY.
> -	 */
> -	if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> -		dp83822->fx_signal_det_low = device_property_present(dev,
> -								     "ti,link-loss-low");
> -	if (!dp83822->fx_enabled)
> -		dp83822->fx_enabled = device_property_present(dev,
> -							      "ti,fiber-mode");
> -
>   	if (!device_property_read_string(dev, "ti,gpio2-clk-out", &of_val)) {
>   		if (strcmp(of_val, "mac-if") == 0) {
>   			dp83822->gpio2_clk_out = DP83822_CLK_SRC_MAC_IF;
> @@ -950,6 +940,49 @@ static int dp83822_read_straps(struct phy_device *phydev)
>   	return 0;
>   }
>   
> +static int dp83822_attach_mdi_port(struct phy_device *phydev,
> +				   struct phy_port *port)
> +{
> +	struct dp83822_private *dp83822 = phydev->priv;
> +	int ret;
> +
> +	if (port->mediums) {
> +		if (phy_port_is_fiber(port))
> +			dp83822->fx_enabled = true;
> +	} else {
> +		ret = dp83822_read_straps(phydev);
> +		if (ret)
> +			return ret;
> +
> +#if IS_ENABLED(CONFIG_OF_MDIO)
> +		if (dp83822->fx_enabled && dp83822->fx_sd_enable)
> +			dp83822->fx_signal_det_low =
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,link-loss-low");
> +
> +		/* ti,fiber-mode is still used for backwards compatibility, but
> +		 * has been replaced with the mdi node definition, see
> +		 * ethernet-port.yaml
> +		 */
> +		if (!dp83822->fx_enabled)
> +			dp83822->fx_enabled =
> +				device_property_present(&phydev->mdio.dev,
> +							"ti,fiber-mode");
> +#endif /* CONFIG_OF_MDIO */
> +
> +		if (dp83822->fx_enabled) {
> +			port->lanes = 1;
> +			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASEF);
> +		} else {
> +			/* This PHY can only to 100BaseTX max, so on 2 lanes */
> +			port->lanes = 2;
> +			port->mediums = BIT(ETHTOOL_LINK_MEDIUM_BASET);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>   static int dp8382x_probe(struct phy_device *phydev)
>   {
>   	struct dp83822_private *dp83822;
> @@ -968,27 +1001,13 @@ static int dp8382x_probe(struct phy_device *phydev)
>   
>   static int dp83822_probe(struct phy_device *phydev)
>   {
> -	struct dp83822_private *dp83822;
>   	int ret;
>   
>   	ret = dp8382x_probe(phydev);
>   	if (ret)
>   		return ret;
>   
> -	dp83822 = phydev->priv;
> -
> -	ret = dp83822_read_straps(phydev);
> -	if (ret)
> -		return ret;
> -
> -	ret = dp83822_of_init(phydev);
> -	if (ret)
> -		return ret;
> -
> -	if (dp83822->fx_enabled)
> -		phydev->port = PORT_FIBRE;
> -
> -	return 0;
> +	return dp83822_of_init(phydev);
>   }
>   
>   static int dp83826_probe(struct phy_device *phydev)
> @@ -1172,6 +1191,7 @@ static int dp83822_led_hw_control_get(struct phy_device *phydev, u8 index,
>   		.led_hw_is_supported = dp83822_led_hw_is_supported,	\
>   		.led_hw_control_set = dp83822_led_hw_control_set,	\
>   		.led_hw_control_get = dp83822_led_hw_control_get,	\
> +		.attach_mdi_port = dp83822_attach_mdi_port		\
>   	}
>   
>   #define DP83825_PHY_DRIVER(_id, _name)				\


