Return-Path: <linux-arm-msm+bounces-83625-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B64C8F5C3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 16:53:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5F7183AADBD
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Nov 2025 15:53:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECC6D26F471;
	Thu, 27 Nov 2025 15:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="SRifIZWG"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F662848A1;
	Thu, 27 Nov 2025 15:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764258808; cv=none; b=P+M9ZjoQr8P2EQXaDrnqs133XeBVe81WTA+UDwvlssqSOKZaYkibV2XQ6dNp/JuRQ47z1zT8O2i+w0HMgb0SgyEVzjkuViR/oya5IJvbCkjY7Q0JZv2jqOd3LxaxfSeZxPHw8vwaaIqBGUrp9cuYzlB/JDtw/sXDbrsmgLV1YMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764258808; c=relaxed/simple;
	bh=rK2KwfrvBPEpgA9hWJzguqqxRWvL/W4k8CPLHGAY3/4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sGQsobAaJUWWAL2dlIE5FfriNjqd1s2jq3jkAXSsMkKSxXpLFnDKf5mCSV7h23V6iorKr3C2GgbcLdMfejQ4zD6HJvHoNpwsWnCAypYUW2l2/cUxp6FuRHINThj8HtyL4F2B0U4JF2C1xW1/ccCjAFaKBKT00OIDkfi9u5/aQIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=SRifIZWG; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2B4F94E41920;
	Thu, 27 Nov 2025 15:53:24 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFFE560722;
	Thu, 27 Nov 2025 15:53:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7F920102F22BB;
	Thu, 27 Nov 2025 16:53:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764258802; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=2Rw6TftW3B8BdAwcO8ZQu/yV0dYlFicEK27SeVGYhCc=;
	b=SRifIZWGiHsOQRV2FhdLxYG96JwfrLbaL+B87ln83GelLjA44JKzajqJk5Jea40Lt2kXpD
	Wl+Ydys+dSFYSA1LUmn8z0lKpVOt9Yj7ik2qNgEDEhT751O4i5pkKr0MOgiY1pAItxPLE9
	6ZfnMWEVsiBXEiPkVJGy7LkcgNtiJNm3b/LrRHj0ztJJads+aM80QhT//K4aNCbrIOcDqz
	svPAuQDR68V7SvzJ8muY8NAKBS5x5HPWNGUc2BChdGS2GhZyHp3Nb4q8HtNWXV1zzak4cO
	6lJbEPfJIIMakVaYsl48Jrj5tLzpG9bbfGFsQIUhTX48XM2qSBWuBes+OUqu7Q==
Message-ID: <f753719e-2370-401d-a001-821bdd5ee838@bootlin.com>
Date: Thu, 27 Nov 2025 16:53:12 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v19 00/15] net: phy: Introduce PHY ports
 representation
To: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Chris Mason <clm@meta.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Tariq Toukan <tariqt@nvidia.com>
References: <20251122124317.92346-1-maxime.chevallier@bootlin.com>
 <20251126190035.2a4e0558@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251126190035.2a4e0558@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hi Chris,

On 27/11/2025 04:00, Jakub Kicinski wrote:
> On Sat, 22 Nov 2025 13:42:59 +0100 Maxime Chevallier wrote:
>> This is v19 of the phy_port work. Patches 2 and 3 lack PHY maintainers reviews.
>>
>> This v19 has no changes compared to v18, but patch 2 was rebased on top
>> of the recent 1.6T linkmodes.
>>
>> Thanks for everyone's patience and reviews on that work ! Now, the
>> usual blurb for the series description.
> 
> Hopefully we can still make v6.19, but we hooked up Claude Code review
> to patchwork this week, and it points out some legit issues here :(
> Some look transient but others are definitely legit, please look thru
> this:
> 
> https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574

I was told by Paolo to reach out with any feedback on the LLM reviews :

First, I find the whole thing pretty accurate in the reviews, congrats.

I did find one review that's not totally accurate :

https://netdev-ai.bots.linux.dev/ai-review.html?id=5388d317-98c9-458e-8655-d60f31112574#patch-7

Extract from the comment :


--------x8----------------------------------------------------------------------

> @@ -473,89 +473,70 @@ static int mv2222_config_init(struct phy_device *phydev)
>  	return 0;
>  }
>
> -static int mv2222_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int mv2222_configure_serdes(struct phy_port *port, bool enable,
> +				   phy_interface_t interface)
>  {
> -	struct phy_device *phydev = upstream;
> -	const struct sfp_module_caps *caps;
> -	phy_interface_t sfp_interface;
> +	struct phy_device *phydev = port_phydev(port);
>  	struct mv2222_data *priv;
> -	struct device *dev;
> -	int ret;
> +	int ret = 0;
>
>  	priv = phydev->priv;
> -	dev = &phydev->mdio.dev;
> -
> -	caps = sfp_get_module_caps(phydev->sfp_bus);
> -
> -	phydev->port = caps->port;
> -	sfp_interface = sfp_select_interface(phydev->sfp_bus, caps->link_modes);
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
> -	linkmode_and(priv->supported, phydev->supported, caps->link_modes);
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
>  	}
>
>  	return ret;
>  }
>
> -static void mv2222_sfp_remove(void *upstream)
> -{
> -	struct phy_device *phydev = upstream;
> -	struct mv2222_data *priv;
> -
> -	priv = phydev->priv;
> -
> -	priv->line_interface = PHY_INTERFACE_MODE_NA;
> -	linkmode_zero(priv->supported);
> -	phydev->port = PORT_NONE;
> -}
             ^^^^

Does priv->line_interface need to be reset when enable is false? The
old mv2222_sfp_remove() explicitly set it to PHY_INTERFACE_MODE_NA,
but the new code leaves it at whatever value was set during the last
module insertion. Functions like mv2222_config_aneg() check whether
priv->line_interface equals PHY_INTERFACE_MODE_NA to determine if a
module is present.

--------x8----------------------------------------------------------------------


Looking at the call-sites, we can see that when the .configure_mii port ops is
called with enabled = false, the interface is always PHY_INTERFACE_MODE_NA.

Looks like the potential problem was identified correctly, but it failed to see
that this can't ever happen. It's a bit tricky I guess, as the call-site in question
is introduced by a previous patch in the same series though.

Maxime

