Return-Path: <linux-arm-msm+bounces-81160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 620CDC4B5D9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 04:54:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 12C5C4E43C7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Nov 2025 03:54:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1A952FE592;
	Tue, 11 Nov 2025 03:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="NdhlIjcY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C794266B6F;
	Tue, 11 Nov 2025 03:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762833252; cv=none; b=DQBJCQr3buGaIwNLlDgnZpKrD3f3DEXsumOGQWR8//qPaTs2M+l/uS+FfUC0V5V57eslPkrywrtEj3t8PC6eSbAq5VT4QF+y26q3plgHvqupWT7zIFdxVAC3KtXdk+bL+uIhoIhcKq8NDRlBIdnSmUW+IkGNyOustrcrxeV4qeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762833252; c=relaxed/simple;
	bh=xG1D2/iIJr6gmPOw38mwNgX5wn6K9a2USlFYepCuMxU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQf7s9n/4Aw8Pgc5JWBHyLFo4lh00tPiMLUJh0KxYkCGdqH/I4lSKEqjLG70MkJXv/RZmn1jXae6ElEGzN/w8qN5VFXg7E0ZISxgYp+cKVMsojM1q5RFdQnt5DwvGSjXH47ApWHeoJCfqtNsXP7vNIRRTLoIuIvqEX+gGkd65zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=NdhlIjcY; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=h4kespPJAX780SRcbkhss/5F3BwJsDQHjd1c+gCxX18=; b=NdhlIjcYaZoiEC6QhpeYMvI82X
	OLGLdJmjw2jTpUXThEJJqgXr21OzxIYhDvnrnzQe6hvmNvo61GWoQGeaXTcEDL/OwbH9chfIewjaL
	MR+/cSqqChZcvgA1yoNrcqvQpd8swZ6MIcViFz6v5NtbrMtVrvG35X2J9BK70jjIKtZI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vIfS4-00DaTH-Mx; Tue, 11 Nov 2025 04:53:52 +0100
Date: Tue, 11 Nov 2025 04:53:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?iso-8859-1?Q?K=F6ry?= Maincent <kory.maincent@bootlin.com>,
	Marek =?iso-8859-1?Q?Beh=FAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?iso-8859-1?Q?Nicol=F2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v15 03/15] net: phy: Introduce PHY ports
 representation
Message-ID: <fc89e17f-c6f5-4a84-8780-737969ed2e22@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-4-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251106094742.2104099-4-maxime.chevallier@bootlin.com>

> +/**
> + * phy_caps_medium_get_supported() - Returns linkmodes supported on a given medium
> + * @supported: After this call, contains all possible linkmodes on a given medium,
> + *	       and with the given number of lanes, or less.

lanes -> pairs?

> +	/* The PHY driver might have added, removed or set medium/lanes info,
> +	 * so update the port supported accordingly.

lanes -> pairs?

> +struct phy_port *phy_of_parse_port(struct device_node *dn)
> +{
> +	struct fwnode_handle *fwnode = of_fwnode_handle(dn);
> +	enum ethtool_link_medium medium;
> +	struct phy_port *port;
> +	const char *med_str;
> +	u32 pairs = 0, mediums = 0;
> +	int ret;
> +
> +	ret = fwnode_property_read_u32(fwnode, "pairs", &pairs);
> +	if (ret)
> +		return ERR_PTR(ret);
> +

I think this needs to come later. It is not critical now, but when we
come to add other medium, it will need moving. If we add say -K, and
need lanes, we don't want to error out here because pairs is missing.

> +	ret = fwnode_property_read_string(fwnode, "media", &med_str);
> +	if (ret)
> +		return ERR_PTR(ret);
> +
> +	medium = ethtool_str_to_medium(med_str);
> +	if (medium == ETHTOOL_LINK_MEDIUM_NONE)
> +		return ERR_PTR(-EINVAL);

> +	if (pairs && medium != ETHTOOL_LINK_MEDIUM_BASET) {
> +		pr_err("pairs property is only compatible with BaseT medium\n");
> +		return ERR_PTR(-EINVAL);
> +	}

This i think needs changing, if medium == ETHTOOL_LINK_MEDIUM_BASET
then get pairs, and validate it. I would probably also test it is 1,
2, or 4.

	Andrew

