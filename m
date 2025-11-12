Return-Path: <linux-arm-msm+bounces-81354-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B8EEC5118E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 09:25:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2A04B4E2722
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 08:23:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C309D2D6E42;
	Wed, 12 Nov 2025 08:23:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="g3Mg4xdX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB49827EFE9;
	Wed, 12 Nov 2025 08:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762935812; cv=none; b=jn/NL7fjMcpVp5OSTaSbkDkkbGt3thjtee+7+jRf5x6RpWulXzHg9DheLqYmrQPiDTJtyYW+HI7XDszW/eg+GI/HlZXNhJok0Xm6nuL6Vjl10z5qeflDTNQtebQHlb5RDUdPiyaSF21pPMqt4vgtcHnM/gWbdCZxCQQbcIy0TsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762935812; c=relaxed/simple;
	bh=leHrsHC3HX5T+UeIMtqLU31BJdR5MqyeYMo8G7lur0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MVXTYgfBaxdBYam9rMbnh2BKxqhs4IrVc74EujgzzHAxE9OqB2SZ4wQxqpFvx4r04xia9XvrRg454PbSV0CzVERlLkOo84wG6irNv8WNsVPSnoFsJ8h5gIOJBYJ2aLwXxV33+sWwixEYl7vtGukK/oyBafIyijU9nUdiAc/yWVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=g3Mg4xdX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 22F7C4E4165C;
	Wed, 12 Nov 2025 08:23:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E7F976070B;
	Wed, 12 Nov 2025 08:23:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3728B1037196F;
	Wed, 12 Nov 2025 09:23:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762935807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rTnbgSuE6RgEYpYQF2xhT+pvJdvD6WChCNxRoxD+Pr4=;
	b=g3Mg4xdXi7Vo0r1FgrG9Rjot6Ej08ydVfBPOwi8fdXDBWr5eT9S6lnTvA26SsxaTHQ9gx4
	BFaeeJOaIuWS80K+dWG1DJtjToCM74e59oy4iMKORNxT5ehTm7Aw9jIW0q9OjQ9292A7Ki
	Pl4MUmnLn79fRrj9sFOmIkberIWtNCbPlj/sdUydxvgUsd4/XwUV0H7E6dX/B/6Wo104bM
	io/Vmu5l+cCK2zU8bMrnt2Dk6RgfCqQLBohwNnbyt4blColBHfqaVsWwmnjjzL1MpUdx3f
	qyVc/l0tHLVm+gq7dX2oL4rdXTWFHjYKftqfCgZms2gUK2eK9bvvnK5rb734Dg==
Message-ID: <33bad77f-8468-4e4a-a60d-adf9e1145816@bootlin.com>
Date: Wed, 12 Nov 2025 09:23:21 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 03/15] net: phy: Introduce PHY ports
 representation
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
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
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-4-maxime.chevallier@bootlin.com>
 <fc89e17f-c6f5-4a84-8780-737969ed2e22@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <fc89e17f-c6f5-4a84-8780-737969ed2e22@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3



On 11/11/2025 04:53, Andrew Lunn wrote:
>> +/**
>> + * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
>> + * @supported: After this call, contains all possible linkmodes on a given medium,
>> + *	       and with the given number of lanes, or less.
> 
> lanes -> pairs?

indeed :(

> 
>> +	/* The PHY driver might have added, removed or set medium/lanes info,
>> +	 * so update the port supported accordingly.
> 
> lanes -> pairs?

yes true :(
> 
>> +struct phy_port *phy_of_parse_port(struct device_node *dn)
>> +{
>> +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
>> +	enum ethtool_link_medium medium;
>> +	struct phy_port *port;
>> +	const char *med_str;
>> +	u32 pairs = 0, mediums = 0;
>> +	int ret;
>> +
>> +	ret = fwnode_property_read_u32(fwnode, "pairs", &pairs);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
> 
> I think this needs to come later. It is not critical now, but when we
> come to add other medium, it will need moving. If we add say -K, and
> need lanes, we don't want to error out here because pairs is missing.

Ack, I'll relax the check

> 
>> +	ret = fwnode_property_read_string(fwnode, "media", &med_str);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	medium = ethtool_str_to_medium(med_str);
>> +	if (medium == ETHTOOL_LINK_MEDIUM_NONE)
>> +		return ERR_PTR(-EINVAL);
> 
>> +	if (pairs && medium != ETHTOOL_LINK_MEDIUM_BASET) {
>> +		pr_err("pairs property is only compatible with BaseT medium\n");
>> +		return ERR_PTR(-EINVAL);
>> +	}
> 
> This i think needs changing, if medium == ETHTOOL_LINK_MEDIUM_BASET
> then get pairs, and validate it. I would probably also test it is 1,
> 2, or 4.

That's fine by me :) I'll update the binding as well then, as having 3
pairs will never be correct.

Thanks a lot for looking at this !

Maxime

> 
> 	Andrew


