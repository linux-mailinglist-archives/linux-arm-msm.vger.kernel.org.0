Return-Path: <linux-arm-msm+bounces-73868-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id E9D39B7CC17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C0B9A1C0002A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:21:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9A0362C0F61;
	Wed, 17 Sep 2025 07:20:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E77921B19D;
	Wed, 17 Sep 2025 07:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093637; cv=none; b=iZCPU0+s3ayl0y2JyE+/sthEJokwpmrcIs2DZNIAEpUShQ2EmhHJSod3JT+7eL5recIuEojsYOqSuoLHCDr//UtvDdfNxO6q2/lFZJV4lbLpHMMWCKAexaraFu6at+deUbZ2JimNZuKUTAXGiKVJ6ux4RFBhOw+23IkqZWnma9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093637; c=relaxed/simple;
	bh=eAIl0DwNMJOtfw6IWY6RbGkrXh2+vvM9eENcc0HkwRo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jW75da4vvYpmcB3DCfabWGNVwUHJWpWXaoSDs9tqalbm977KN1GuxoYS34TWWjLLiIcVdJtALqJn2x+fEQ5IWM/s4Pewm+iSWrN4QUpVKlm6TPThIiYel0ST8GuOpuiVNcNifaYz/gAjtXjGV36YVXlgWKjC5QvdwEH/DaG6YsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV6547rDz9sxj;
	Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0jycUt0D3HEs; Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV652Pthz9sxg;
	Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 24D818B766;
	Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id X30wXOSaiMnX; Wed, 17 Sep 2025 09:00:45 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id BAB618B763;
	Wed, 17 Sep 2025 09:00:43 +0200 (CEST)
Message-ID: <4b67331e-823e-4fac-9af7-35c11f996ae5@csgroup.eu>
Date: Wed, 17 Sep 2025 09:00:43 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 08/18] net: phylink: Move
 phylink_interface_max_speed to phy_caps
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
 <20250909152617.119554-9-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-9-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> The phylink_interface_max_speed() retrieves the max achievable speed
> on a MII interface. This logic needs to be re-used in other parts of the
> PHY stack, let's move it to phy_caps as it already contains most of the
> interface attribute accessors.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/phy-caps.h |  1 +
>   drivers/net/phy/phy_caps.c | 80 +++++++++++++++++++++++++++++++++++
>   drivers/net/phy/phylink.c  | 87 ++------------------------------------
>   3 files changed, 85 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
> index 01df1bdc1516..ba81cd75e122 100644
> --- a/drivers/net/phy/phy-caps.h
> +++ b/drivers/net/phy/phy-caps.h
> @@ -49,6 +49,7 @@ void phy_caps_linkmode_max_speed(u32 max_speed, unsigned long *linkmodes);
>   bool phy_caps_valid(int speed, int duplex, const unsigned long *linkmodes);
>   void phy_caps_linkmodes(unsigned long caps, unsigned long *linkmodes);
>   unsigned long phy_caps_from_interface(phy_interface_t interface);
> +int phy_caps_interface_max_speed(phy_interface_t interface);
>   
>   const struct link_capabilities *
>   phy_caps_lookup_by_linkmode(const unsigned long *linkmodes);
> diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
> index e4efd5c477b4..b38c567ec6ef 100644
> --- a/drivers/net/phy/phy_caps.c
> +++ b/drivers/net/phy/phy_caps.c
> @@ -440,3 +440,83 @@ u32 phy_caps_mediums_from_linkmodes(unsigned long *linkmodes)
>   	return mediums;
>   }
>   EXPORT_SYMBOL_GPL(phy_caps_mediums_from_linkmodes);
> +
> +/**
> + * phy_caps_interface_max_speed() - get the maximum speed of a phy interface
> + * @interface: phy interface mode defined by &typedef phy_interface_t
> + *
> + * Determine the maximum speed of a phy interface. This is intended to help
> + * determine the correct speed to pass to the MAC when the phy is performing
> + * rate matching.
> + *
> + * Return: The maximum speed of @interface
> + */
> +int phy_caps_interface_max_speed(phy_interface_t interface)
> +{
> +	switch (interface) {
> +	case PHY_INTERFACE_MODE_100BASEX:
> +	case PHY_INTERFACE_MODE_REVRMII:
> +	case PHY_INTERFACE_MODE_RMII:
> +	case PHY_INTERFACE_MODE_SMII:
> +	case PHY_INTERFACE_MODE_REVMII:
> +	case PHY_INTERFACE_MODE_MII:
> +	case PHY_INTERFACE_MODE_MIILITE:
> +		return SPEED_100;
> +
> +	case PHY_INTERFACE_MODE_TBI:
> +	case PHY_INTERFACE_MODE_MOCA:
> +	case PHY_INTERFACE_MODE_RTBI:
> +	case PHY_INTERFACE_MODE_1000BASEX:
> +	case PHY_INTERFACE_MODE_1000BASEKX:
> +	case PHY_INTERFACE_MODE_TRGMII:
> +	case PHY_INTERFACE_MODE_RGMII_TXID:
> +	case PHY_INTERFACE_MODE_RGMII_RXID:
> +	case PHY_INTERFACE_MODE_RGMII_ID:
> +	case PHY_INTERFACE_MODE_RGMII:
> +	case PHY_INTERFACE_MODE_PSGMII:
> +	case PHY_INTERFACE_MODE_QSGMII:
> +	case PHY_INTERFACE_MODE_QUSGMII:
> +	case PHY_INTERFACE_MODE_SGMII:
> +	case PHY_INTERFACE_MODE_GMII:
> +		return SPEED_1000;
> +
> +	case PHY_INTERFACE_MODE_2500BASEX:
> +	case PHY_INTERFACE_MODE_10G_QXGMII:
> +		return SPEED_2500;
> +
> +	case PHY_INTERFACE_MODE_5GBASER:
> +		return SPEED_5000;
> +
> +	case PHY_INTERFACE_MODE_XGMII:
> +	case PHY_INTERFACE_MODE_RXAUI:
> +	case PHY_INTERFACE_MODE_XAUI:
> +	case PHY_INTERFACE_MODE_10GBASER:
> +	case PHY_INTERFACE_MODE_10GKR:
> +	case PHY_INTERFACE_MODE_USXGMII:
> +		return SPEED_10000;
> +
> +	case PHY_INTERFACE_MODE_25GBASER:
> +		return SPEED_25000;
> +
> +	case PHY_INTERFACE_MODE_XLGMII:
> +		return SPEED_40000;
> +
> +	case PHY_INTERFACE_MODE_50GBASER:
> +	case PHY_INTERFACE_MODE_LAUI:
> +		return SPEED_50000;
> +
> +	case PHY_INTERFACE_MODE_100GBASEP:
> +		return SPEED_100000;
> +
> +	case PHY_INTERFACE_MODE_INTERNAL:
> +	case PHY_INTERFACE_MODE_NA:
> +	case PHY_INTERFACE_MODE_MAX:
> +		/* No idea! Garbage in, unknown out */
> +		return SPEED_UNKNOWN;
> +	}
> +
> +	/* If we get here, someone forgot to add an interface mode above */
> +	WARN_ON_ONCE(1);
> +	return SPEED_UNKNOWN;
> +}
> +EXPORT_SYMBOL_GPL(phy_caps_interface_max_speed);
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index c7cb95aa8007..091b1ee5c49a 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -218,85 +218,6 @@ static unsigned int phylink_interface_signal_rate(phy_interface_t interface)
>   	}
>   }
>   
> -/**
> - * phylink_interface_max_speed() - get the maximum speed of a phy interface
> - * @interface: phy interface mode defined by &typedef phy_interface_t
> - *
> - * Determine the maximum speed of a phy interface. This is intended to help
> - * determine the correct speed to pass to the MAC when the phy is performing
> - * rate matching.
> - *
> - * Return: The maximum speed of @interface
> - */
> -static int phylink_interface_max_speed(phy_interface_t interface)
> -{
> -	switch (interface) {
> -	case PHY_INTERFACE_MODE_100BASEX:
> -	case PHY_INTERFACE_MODE_REVRMII:
> -	case PHY_INTERFACE_MODE_RMII:
> -	case PHY_INTERFACE_MODE_SMII:
> -	case PHY_INTERFACE_MODE_REVMII:
> -	case PHY_INTERFACE_MODE_MII:
> -	case PHY_INTERFACE_MODE_MIILITE:
> -		return SPEED_100;
> -
> -	case PHY_INTERFACE_MODE_TBI:
> -	case PHY_INTERFACE_MODE_MOCA:
> -	case PHY_INTERFACE_MODE_RTBI:
> -	case PHY_INTERFACE_MODE_1000BASEX:
> -	case PHY_INTERFACE_MODE_1000BASEKX:
> -	case PHY_INTERFACE_MODE_TRGMII:
> -	case PHY_INTERFACE_MODE_RGMII_TXID:
> -	case PHY_INTERFACE_MODE_RGMII_RXID:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
> -	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_PSGMII:
> -	case PHY_INTERFACE_MODE_QSGMII:
> -	case PHY_INTERFACE_MODE_QUSGMII:
> -	case PHY_INTERFACE_MODE_SGMII:
> -	case PHY_INTERFACE_MODE_GMII:
> -		return SPEED_1000;
> -
> -	case PHY_INTERFACE_MODE_2500BASEX:
> -	case PHY_INTERFACE_MODE_10G_QXGMII:
> -		return SPEED_2500;
> -
> -	case PHY_INTERFACE_MODE_5GBASER:
> -		return SPEED_5000;
> -
> -	case PHY_INTERFACE_MODE_XGMII:
> -	case PHY_INTERFACE_MODE_RXAUI:
> -	case PHY_INTERFACE_MODE_XAUI:
> -	case PHY_INTERFACE_MODE_10GBASER:
> -	case PHY_INTERFACE_MODE_10GKR:
> -	case PHY_INTERFACE_MODE_USXGMII:
> -		return SPEED_10000;
> -
> -	case PHY_INTERFACE_MODE_25GBASER:
> -		return SPEED_25000;
> -
> -	case PHY_INTERFACE_MODE_XLGMII:
> -		return SPEED_40000;
> -
> -	case PHY_INTERFACE_MODE_50GBASER:
> -	case PHY_INTERFACE_MODE_LAUI:
> -		return SPEED_50000;
> -
> -	case PHY_INTERFACE_MODE_100GBASEP:
> -		return SPEED_100000;
> -
> -	case PHY_INTERFACE_MODE_INTERNAL:
> -	case PHY_INTERFACE_MODE_NA:
> -	case PHY_INTERFACE_MODE_MAX:
> -		/* No idea! Garbage in, unknown out */
> -		return SPEED_UNKNOWN;
> -	}
> -
> -	/* If we get here, someone forgot to add an interface mode above */
> -	WARN_ON_ONCE(1);
> -	return SPEED_UNKNOWN;
> -}
> -
>   static struct {
>   	unsigned long mask;
>   	int speed;
> @@ -430,7 +351,7 @@ static unsigned long phylink_get_capabilities(phy_interface_t interface,
>   					      int rate_matching)
>   {
>   	unsigned long link_caps = phy_caps_from_interface(interface);
> -	int max_speed = phylink_interface_max_speed(interface);
> +	int max_speed = phy_caps_interface_max_speed(interface);
>   	unsigned long caps = MAC_SYM_PAUSE | MAC_ASYM_PAUSE;
>   	unsigned long matched_caps = 0;
>   
> @@ -1529,7 +1450,7 @@ static void phylink_link_up(struct phylink *pl,
>   		 * the link_state) to the interface speed, and will send
>   		 * pause frames to the MAC to limit its transmission speed.
>   		 */
> -		speed = phylink_interface_max_speed(link_state.interface);
> +		speed = phy_caps_interface_max_speed(link_state.interface);
>   		duplex = DUPLEX_FULL;
>   		rx_pause = true;
>   		break;
> @@ -1539,7 +1460,7 @@ static void phylink_link_up(struct phylink *pl,
>   		 * the link_state) to the interface speed, and will cause
>   		 * collisions to the MAC to limit its transmission speed.
>   		 */
> -		speed = phylink_interface_max_speed(link_state.interface);
> +		speed = phy_caps_interface_max_speed(link_state.interface);
>   		duplex = DUPLEX_HALF;
>   		break;
>   	}
> @@ -2732,7 +2653,7 @@ static phy_interface_t phylink_sfp_select_interface_speed(struct phylink *pl,
>   		if (!test_bit(interface, pl->sfp_interfaces))
>   			continue;
>   
> -		max_speed = phylink_interface_max_speed(interface);
> +		max_speed = phy_caps_interface_max_speed(interface);
>   
>   		/* The logic here is: if speed == max_speed, then we've found
>   		 * the best interface. Otherwise we find the interface that


