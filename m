Return-Path: <linux-arm-msm+bounces-73875-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B4E47B7CDD1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 14:11:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 1CA23326E14
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Sep 2025 07:23:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8BDBA302141;
	Wed, 17 Sep 2025 07:21:13 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B347D2F5A01;
	Wed, 17 Sep 2025 07:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758093673; cv=none; b=fgF25IydAGyZ4+npbYJFk/GmDtR+edTm7Zj3fuLh958HF3KbZuOEypRygTkhnnd2Ra9WpfUKqUd+KY7mqDMA/LQimXSMvIZnlqB+wNMv9MVHGaJ+r8GOLF+HgLT70PsikpJa9H09U/8pzXKhgqnBlOMpyj4v2whyNzRczIIo2WE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758093673; c=relaxed/simple;
	bh=pChRmtp8sfQKZodYX+lJs4oIRRpl9lHJBoq0JlSjSBY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iP9/xEwKT+oQdJqBf7jxNuau3zwXI4GF137QsCJ8lbtPYyM72v+svIA1aUdp0hqy1RhVJeTlfKubYrmQkcDFVhdKekkuQK+CvnGhs285sUHUTgvLNI9qThnEm346aOICubuEj4hZDQRd5h7RRq/AFt4kz7SA14DhSRPDLu5+J2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cRV6W3hgMz9sxl;
	Wed, 17 Sep 2025 09:01:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ziyskpCLw8TX; Wed, 17 Sep 2025 09:01:07 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cRV6W21l8z9sxk;
	Wed, 17 Sep 2025 09:01:07 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 11ABA8B766;
	Wed, 17 Sep 2025 09:01:07 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id XCgn0iC_onSv; Wed, 17 Sep 2025 09:01:06 +0200 (CEST)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 254658B763;
	Wed, 17 Sep 2025 09:01:05 +0200 (CEST)
Message-ID: <7da3983f-1321-49ea-afa4-83126f616b5d@csgroup.eu>
Date: Wed, 17 Sep 2025 09:01:04 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v12 09/18] net: phylink: Move sfp interface
 selection and filtering to phy_caps
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
 <20250909152617.119554-10-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20250909152617.119554-10-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



Le 09/09/2025 à 17:26, Maxime Chevallier a écrit :
> Phylink's helpers to get the interfaces usable on an SFP module based on
> speed and linkmodes can be modes to phy_caps, so that it can benefit to
> PHY-driver SFP support.
> 
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>

> ---
>   drivers/net/phy/phy-caps.h |  6 ++++
>   drivers/net/phy/phy_caps.c | 72 ++++++++++++++++++++++++++++++++++++++
>   drivers/net/phy/phylink.c  | 72 +++++---------------------------------
>   3 files changed, 86 insertions(+), 64 deletions(-)
> 
> diff --git a/drivers/net/phy/phy-caps.h b/drivers/net/phy/phy-caps.h
> index ba81cd75e122..ebed340a2e77 100644
> --- a/drivers/net/phy/phy-caps.h
> +++ b/drivers/net/phy/phy-caps.h
> @@ -66,4 +66,10 @@ void phy_caps_medium_get_supported(unsigned long *supported,
>   				   int lanes);
>   u32 phy_caps_mediums_from_linkmodes(unsigned long *linkmodes);
>   
> +void phy_caps_filter_sfp_interfaces(unsigned long *dst,
> +				    const unsigned long *interfaces);
> +phy_interface_t phy_caps_select_sfp_interface_speed(const unsigned long *interfaces,
> +						    u32 speed);
> +phy_interface_t phy_caps_choose_sfp_interface(const unsigned long *interfaces);
> +
>   #endif /* __PHY_CAPS_H */
> diff --git a/drivers/net/phy/phy_caps.c b/drivers/net/phy/phy_caps.c
> index b38c567ec6ef..e4adc36e0fe3 100644
> --- a/drivers/net/phy/phy_caps.c
> +++ b/drivers/net/phy/phy_caps.c
> @@ -63,6 +63,22 @@ static int speed_duplex_to_capa(int speed, unsigned int duplex)
>   #define for_each_link_caps_desc_speed(cap) \
>   	for (cap = &link_caps[__LINK_CAPA_MAX - 1]; cap >= link_caps; cap--)
>   
> +static const phy_interface_t phy_caps_sfp_interface_preference[] = {
> +	PHY_INTERFACE_MODE_100GBASEP,
> +	PHY_INTERFACE_MODE_50GBASER,
> +	PHY_INTERFACE_MODE_LAUI,
> +	PHY_INTERFACE_MODE_25GBASER,
> +	PHY_INTERFACE_MODE_USXGMII,
> +	PHY_INTERFACE_MODE_10GBASER,
> +	PHY_INTERFACE_MODE_5GBASER,
> +	PHY_INTERFACE_MODE_2500BASEX,
> +	PHY_INTERFACE_MODE_SGMII,
> +	PHY_INTERFACE_MODE_1000BASEX,
> +	PHY_INTERFACE_MODE_100BASEX,
> +};
> +
> +static DECLARE_PHY_INTERFACE_MASK(phy_caps_sfp_interfaces);
> +
>   /**
>    * phy_caps_init() - Initializes the link_caps array from the link_mode_params.
>    *
> @@ -100,6 +116,10 @@ int phy_caps_init(void)
>   		__set_bit(i, link_caps[capa].linkmodes);
>   	}
>   
> +	for (int i = 0; i < ARRAY_SIZE(phy_caps_sfp_interface_preference); ++i)
> +		__set_bit(phy_caps_sfp_interface_preference[i],
> +			  phy_caps_sfp_interfaces);
> +
>   	return 0;
>   }
>   
> @@ -520,3 +540,55 @@ int phy_caps_interface_max_speed(phy_interface_t interface)
>   	return SPEED_UNKNOWN;
>   }
>   EXPORT_SYMBOL_GPL(phy_caps_interface_max_speed);
> +
> +void phy_caps_filter_sfp_interfaces(unsigned long *dst,
> +				    const unsigned long *interfaces)
> +{
> +	phy_interface_and(dst, interfaces, phy_caps_sfp_interfaces);
> +}
> +
> +phy_interface_t
> +phy_caps_select_sfp_interface_speed(const unsigned long *interfaces, u32 speed)
> +{
> +	phy_interface_t best_interface = PHY_INTERFACE_MODE_NA;
> +	phy_interface_t interface;
> +	u32 max_speed;
> +	int i;
> +
> +	for (i = 0; i < ARRAY_SIZE(phy_caps_sfp_interface_preference); i++) {
> +		interface = phy_caps_sfp_interface_preference[i];
> +		if (!test_bit(interface, interfaces))
> +			continue;
> +
> +		max_speed = phy_caps_interface_max_speed(interface);
> +
> +		/* The logic here is: if speed == max_speed, then we've found
> +		 * the best interface. Otherwise we find the interface that
> +		 * can just support the requested speed.
> +		 */
> +		if (max_speed >= speed)
> +			best_interface = interface;
> +
> +		if (max_speed <= speed)
> +			break;
> +	}
> +
> +	return best_interface;
> +}
> +EXPORT_SYMBOL_GPL(phy_caps_select_sfp_interface_speed);
> +
> +phy_interface_t phy_caps_choose_sfp_interface(const unsigned long *interfaces)
> +{
> +	phy_interface_t interface;
> +	size_t i;
> +
> +	interface = PHY_INTERFACE_MODE_NA;
> +	for (i = 0; i < ARRAY_SIZE(phy_caps_sfp_interface_preference); i++)
> +		if (test_bit(phy_caps_sfp_interface_preference[i], interfaces)) {
> +			interface = phy_caps_sfp_interface_preference[i];
> +			break;
> +		}
> +
> +	return interface;
> +}
> +EXPORT_SYMBOL_GPL(phy_caps_choose_sfp_interface);
> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index 091b1ee5c49a..91111ea1b149 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -126,22 +126,6 @@ do {									\
>   })
>   #endif
>   
> -static const phy_interface_t phylink_sfp_interface_preference[] = {
> -	PHY_INTERFACE_MODE_100GBASEP,
> -	PHY_INTERFACE_MODE_50GBASER,
> -	PHY_INTERFACE_MODE_LAUI,
> -	PHY_INTERFACE_MODE_25GBASER,
> -	PHY_INTERFACE_MODE_USXGMII,
> -	PHY_INTERFACE_MODE_10GBASER,
> -	PHY_INTERFACE_MODE_5GBASER,
> -	PHY_INTERFACE_MODE_2500BASEX,
> -	PHY_INTERFACE_MODE_SGMII,
> -	PHY_INTERFACE_MODE_1000BASEX,
> -	PHY_INTERFACE_MODE_100BASEX,
> -};
> -
> -static DECLARE_PHY_INTERFACE_MASK(phylink_sfp_interfaces);
> -
>   /**
>    * phylink_set_port_modes() - set the port type modes in the ethtool mask
>    * @mask: ethtool link mode mask
> @@ -1922,8 +1906,7 @@ static int phylink_validate_phy(struct phylink *pl, struct phy_device *phy,
>   			/* If the PHY is on a SFP, limit the interfaces to
>   			 * those that can be used with a SFP module.
>   			 */
> -			phy_interface_and(interfaces, interfaces,
> -					  phylink_sfp_interfaces);
> +			phy_caps_filter_sfp_interfaces(interfaces, interfaces);
>   
>   			if (phy_interface_empty(interfaces)) {
>   				phylink_err(pl, "SFP PHY's possible interfaces becomes empty\n");
> @@ -2643,34 +2626,16 @@ static phy_interface_t phylink_sfp_select_interface(struct phylink *pl,
>   static phy_interface_t phylink_sfp_select_interface_speed(struct phylink *pl,
>   							  u32 speed)
>   {
> -	phy_interface_t best_interface = PHY_INTERFACE_MODE_NA;
>   	phy_interface_t interface;
> -	u32 max_speed;
> -	int i;
> -
> -	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++) {
> -		interface = phylink_sfp_interface_preference[i];
> -		if (!test_bit(interface, pl->sfp_interfaces))
> -			continue;
> -
> -		max_speed = phy_caps_interface_max_speed(interface);
>   
> -		/* The logic here is: if speed == max_speed, then we've found
> -		 * the best interface. Otherwise we find the interface that
> -		 * can just support the requested speed.
> -		 */
> -		if (max_speed >= speed)
> -			best_interface = interface;
> -
> -		if (max_speed <= speed)
> -			break;
> -	}
> +	interface = phy_caps_select_sfp_interface_speed(pl->sfp_interfaces,
> +							speed);
>   
> -	if (best_interface == PHY_INTERFACE_MODE_NA)
> +	if (interface == PHY_INTERFACE_MODE_NA)
>   		phylink_err(pl, "selection of interface failed, speed %u\n",
>   			    speed);
>   
> -	return best_interface;
> +	return interface;
>   }
>   
>   static void phylink_merge_link_mode(unsigned long *dst, const unsigned long *b)
> @@ -3450,17 +3415,7 @@ static void phylink_sfp_detach(void *upstream, struct sfp_bus *bus)
>   static phy_interface_t phylink_choose_sfp_interface(struct phylink *pl,
>   						    const unsigned long *intf)
>   {
> -	phy_interface_t interface;
> -	size_t i;
> -
> -	interface = PHY_INTERFACE_MODE_NA;
> -	for (i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); i++)
> -		if (test_bit(phylink_sfp_interface_preference[i], intf)) {
> -			interface = phylink_sfp_interface_preference[i];
> -			break;
> -		}
> -
> -	return interface;
> +	return phy_caps_choose_sfp_interface(intf);
>   }
>   
>   static void phylink_sfp_set_config(struct phylink *pl, unsigned long *supported,
> @@ -3737,8 +3692,8 @@ static int phylink_sfp_connect_phy(void *upstream, struct phy_device *phy)
>   	phy_support_asym_pause(phy);
>   
>   	/* Set the PHY's host supported interfaces */
> -	phy_interface_and(phy->host_interfaces, phylink_sfp_interfaces,
> -			  pl->config->supported_interfaces);
> +	phy_caps_filter_sfp_interfaces(phy->host_interfaces,
> +				       pl->config->supported_interfaces);
>   
>   	/* Do the initial configuration */
>   	return phylink_sfp_config_phy(pl, phy);
> @@ -4166,16 +4121,5 @@ void phylink_mii_c45_pcs_get_state(struct mdio_device *pcs,
>   }
>   EXPORT_SYMBOL_GPL(phylink_mii_c45_pcs_get_state);
>   
> -static int __init phylink_init(void)
> -{
> -	for (int i = 0; i < ARRAY_SIZE(phylink_sfp_interface_preference); ++i)
> -		__set_bit(phylink_sfp_interface_preference[i],
> -			  phylink_sfp_interfaces);
> -
> -	return 0;
> -}
> -
> -module_init(phylink_init);
> -
>   MODULE_LICENSE("GPL v2");
>   MODULE_DESCRIPTION("phylink models the MAC to optional PHY connection");


