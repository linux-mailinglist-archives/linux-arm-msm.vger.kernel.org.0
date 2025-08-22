Return-Path: <linux-arm-msm+bounces-70350-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A82CB314E0
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:14:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A6EE0AA52BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:10:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 720F12C028E;
	Fri, 22 Aug 2025 10:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1D3gQZVH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0C427EFF1;
	Fri, 22 Aug 2025 10:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755857384; cv=none; b=BPjCsMPvOCltZ0jN3Fsa+lXrsnPNAlS4fxbxSoZkjbCB2c0EwQJS5SGmOi4YOqq6Ob62xF3rDyiHPhXDzYgFkPUUkQXfOqT0sw6aZ1x9t7FS8qsl764vtRt2Tnz58qFATL1BUrNdvsVAt6WOMboJ4J3+EcXCB81xEIefjGpQXuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755857384; c=relaxed/simple;
	bh=A8seymhPD/UjqZ8mH0/ODm0W3dD3W2Dvk1eT3zcM94A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mJch+Z33axP9xIOLvGgcqPRL0QCPuCnLtObU0KdEmHfX6WhwJbrYjn4siaPgj+4Jq2wE90vxNETddMagZmk0B7Aw08j/Kb7NzbVKzbt9IQE/GUOWtjXfb784gvZsMzpQ9dPv0TyA29Lc+64Fow+35gXrxPq+YbDbt8/+5faV4eE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1D3gQZVH; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 960AA4E40BA0;
	Fri, 22 Aug 2025 10:09:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 671B8604AD;
	Fri, 22 Aug 2025 10:09:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 064AF1C22CE69;
	Fri, 22 Aug 2025 12:09:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1755857378; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=6cVjVZ5wfnye80ZbXrAniO6QjKQrZFpfgRoqYcTlg4w=;
	b=1D3gQZVHT49ReUfvBPoqsjhy5kAYBmEOOV3UyYLH7mKyxQqQDOi+nlP4rdGSfeKwuE7Hfr
	0whhtCYevKSVM1zUub/qm+jbfOsQDsKCC3ry8/raGb19f+gru2PjyJ0f6lVSet5hj3AigZ
	D/eSO0D57bC9mxgTjJLpLte7t/2xEH2JMjm1HpdvoOyCkL4A/AQo4RcU+vqy16i2k0yDtl
	uZgasz8gZ1WPKGx2JxF4/y4rcL6DObniEvDvHYFNjdgBMtr4FCozKZhXhObVB19MYYpSu/
	03d2cX2haqW3hwkWm0vEqOCPaz8NZUEHqVb/JEUWSeYn/eDjGazviSoFtIQ50A==
Message-ID: <a30d00cd-9148-423b-a3e5-b11d6c5c270b@bootlin.com>
Date: Fri, 22 Aug 2025 12:09:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v10 07/15] net: phy: Introduce generic SFP
 handling for PHY drivers
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-8-maxime.chevallier@bootlin.com>
 <aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aIX35MUxx-OkvX4G@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3

Hello Russell,

I'm re-replying here even though a more recent version was sent, as I 
realise I forgot to fully address that.

On 27/07/2025 11:56, Russell King (Oracle) wrote:
> On Tue, Jul 22, 2025 at 02:16:12PM +0200, Maxime Chevallier wrote:
>> +static int phy_sfp_module_insert(void *upstream, const struct sfp_eeprom_id *id)
>> +{
>> +	struct phy_device *phydev = upstream;
>> +	struct phy_port *port = phy_get_sfp_port(phydev);
>> +
>> +	__ETHTOOL_DECLARE_LINK_MODE_MASK(sfp_support);
>> +	DECLARE_PHY_INTERFACE_MASK(interfaces);
>> +	phy_interface_t iface;
>> +
>> +	linkmode_zero(sfp_support);
>> +
>> +	if (!port)
>> +		return -EINVAL;
>> +
>> +	sfp_parse_support(phydev->sfp_bus, id, sfp_support, interfaces);
>> +
>> +	if (phydev->n_ports == 1)
>> +		phydev->port = sfp_parse_port(phydev->sfp_bus, id, sfp_support);
>> +
>> +	linkmode_and(sfp_support, port->supported, sfp_support);
>> +
>> +	if (linkmode_empty(sfp_support)) {
>> +		dev_err(&phydev->mdio.dev, "incompatible SFP module inserted\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	iface = sfp_select_interface(phydev->sfp_bus, sfp_support);
> 
> I've been moving phylink away from using sfp_select_interface() because
> it requires two stages of translation - one from the module capabilties
> to linkmodes, and then linkmodes to interfaces.
> 
> sfp_parse_support() now provides the interfaces that the optical module
> supports, and the possible interfaces that a copper module _might_
> support (but we don't know for certain about that until we discover a
> PHY.)
> 
> The only place in phylink where this function continues to be used is
> when there's an optical module which supports multiple different
> speeds, and we need to select it based on the advertising mask provided
> by userspace. Everywhere else shouldn't use this function, but should
> instead use the interfaces returned from sfp_parse_support().
> 

In any case, we'll eventually have to select one of the interfaces if 
there are multiple matches from the sfp_parse_support. phylink maintains 
a sorted list of interfaces used as a preference, I think we should use 
the same list for phy-driver SFP. I'm thinking about moving 
phylink_choose_sfp_interface() in the sfp code, would you be OK with that ?

Maxime


