Return-Path: <linux-arm-msm+bounces-81942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 50634C60594
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 14:20:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id A08E234A157
	for <lists+linux-arm-msm@lfdr.de>; Sat, 15 Nov 2025 13:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7CCC25F79A;
	Sat, 15 Nov 2025 13:20:37 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 893DF1DC1AB;
	Sat, 15 Nov 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763212837; cv=none; b=aaHOq7oBeIkiME3wls6iKlFQiWKZYayJCRTyKmod55OK7vR76J2RS8Ky1q5YoZbRRpOZlZKsP4aR8D8Uj5VCodBOJoEElnU0cMOAnF2/YCpwn+40X6m79q7MLDyrP8mIUISDwqb58K5RhQjrB7ol0w9i+ZtyYkKiW0M7cGLdV8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763212837; c=relaxed/simple;
	bh=o54UFY+6K+v1+297G9wCZOqlSI6oYJf2E54ulw8FOps=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pj1Z5pHkiyZyTL9yxES4KbOpncqAnC3izTaYwBezirrF5mpukx+GKQEcz/+aFjnfFrcRJ0/8lThXjWJSZvzKLhZmXgnKLx2WisaynfWrYXQJEbZE9sr3NM+tzmYomiJBV1jshYYP9kQlE9OCbnfzopxgp1/23FkeTs+4QQkYSr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4d7v7w1p1Wz9sTL;
	Sat, 15 Nov 2025 13:53:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yP86A2irwuLL; Sat, 15 Nov 2025 13:53:32 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4d7v7w0lMTz9sTK;
	Sat, 15 Nov 2025 13:53:32 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 023658B770;
	Sat, 15 Nov 2025 13:53:32 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id zSve2Ap9yPlL; Sat, 15 Nov 2025 13:53:31 +0100 (CET)
Received: from [192.168.235.99] (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 9B2338B76E;
	Sat, 15 Nov 2025 13:53:30 +0100 (CET)
Message-ID: <fe773f23-fa99-4a43-8d43-97088103923c@csgroup.eu>
Date: Sat, 15 Nov 2025 13:53:30 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 06/15] net: phy: Create a phy_port for
 PHY-driven SFPs
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
 <20251113081418.180557-7-maxime.chevallier@bootlin.com>
From: Christophe Leroy <christophe.leroy@csgroup.eu>
Content-Language: fr-FR
In-Reply-To: <20251113081418.180557-7-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>



Le 13/11/2025 à 09:14, Maxime Chevallier a écrit :
> Some PHY devices may be used as media-converters to drive SFP ports (for
> example, to allow using SFP when the SoC can only output RGMII). This is
> already supported to some extend by allowing PHY drivers to registers
> themselves as being SFP upstream.
> 
> However, the logic to drive the SFP can actually be split to a per-port
> control logic, allowing support for multi-port PHYs, or PHYs that can
> either drive SFPs or Copper.
> 
> To that extent, create a phy_port when registering an SFP bus onto a
> PHY. This port is considered a "serdes" port, in that it can feed data
> to another entity on the link. The PHY driver needs to specify the
> various PHY_INTERFACE_MODE_XXX that this port supports.
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> ---
>   drivers/net/phy/phy_device.c | 24 ++++++++++++++++++++++++
>   drivers/net/phy/phy_port.c   | 14 ++++++++++++++
>   2 files changed, 38 insertions(+)
> 
> diff --git a/drivers/net/phy/phy_device.c b/drivers/net/phy/phy_device.c
> index f48565c3a9b8..3772c68b1dbc 100644
> --- a/drivers/net/phy/phy_device.c
> +++ b/drivers/net/phy/phy_device.c
> @@ -1643,6 +1643,26 @@ static void phy_del_port(struct phy_device *phydev, struct phy_port *port)
>   	phydev->n_ports--;
>   }
>   
> +static int phy_setup_sfp_port(struct phy_device *phydev)
> +{
> +	struct phy_port *port = phy_port_alloc();
> +
> +	if (!port)
> +		return -ENOMEM;
> +
> +	port->parent_type = PHY_PORT_PHY;
> +	port->phy = phydev;
> +
> +	/* The PHY is a media converter, the port connected to the SFP cage
> +	 * is a MII port.
> +	 */
> +	port->is_mii = true;
> +
> +	phy_add_port(phydev, port);
> +
> +	return 0;
> +}
> +
>   /**
>    * phy_sfp_probe - probe for a SFP cage attached to this PHY device
>    * @phydev: Pointer to phy_device
> @@ -1664,6 +1684,10 @@ int phy_sfp_probe(struct phy_device *phydev,
>   		ret = sfp_bus_add_upstream(bus, phydev, ops);
>   		sfp_bus_put(bus);
>   	}
> +
> +	if (phydev->sfp_bus)
> +		ret = phy_setup_sfp_port(phydev);
> +
>   	return ret;
>   }
>   EXPORT_SYMBOL(phy_sfp_probe);
> diff --git a/drivers/net/phy/phy_port.c b/drivers/net/phy/phy_port.c
> index 05455dc487cd..f89f70f83593 100644
> --- a/drivers/net/phy/phy_port.c
> +++ b/drivers/net/phy/phy_port.c
> @@ -132,6 +132,20 @@ void phy_port_update_supported(struct phy_port *port)
>   			port->pairs = max_t(int, port->pairs,
>   					    ethtool_linkmode_n_pairs(mode));
>   
> +	/* Serdes ports supported through SFP may not have any medium set,
> +	 * as they will output PHY_INTERFACE_MODE_XXX modes. In that case, derive
> +	 * the supported list based on these interfaces
> +	 */
> +	if (port->is_mii && linkmode_empty(supported)) {
> +		unsigned long interface, link_caps = 0;
> +
> +		/* Get each interface's caps */
> +		for_each_set_bit(interface, port->interfaces,
> +				 PHY_INTERFACE_MODE_MAX)
> +			link_caps |= phy_caps_from_interface(interface);
> +
> +		phy_caps_linkmodes(link_caps, port->supported);
> +	}
>   }
>   EXPORT_SYMBOL_GPL(phy_port_update_supported);
>   


