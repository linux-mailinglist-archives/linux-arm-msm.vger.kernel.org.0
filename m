Return-Path: <linux-arm-msm+bounces-66770-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B9014B12C93
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 23:13:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E232A173629
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jul 2025 21:13:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6DC342877C9;
	Sat, 26 Jul 2025 21:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="luNGpmio"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBBE1B042E;
	Sat, 26 Jul 2025 21:13:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753564395; cv=none; b=ax8RXjLfdYrNCemQz7jKeOeMU8Y8pUgIUIjtS/OfJb6q/dBpkdYlKPkjXNP881I+0S4BL+gjMNAmL8hRrwDCdJQPsqanwWj6c+iD9gd2/mDMI0eRrpCcMwugb4igHpKzveKrWqVmihrCtxFY3mvjrc8lj3W4WMzC7125dXo9idw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753564395; c=relaxed/simple;
	bh=uBK7vKVA+aBU/y8CADD378XUXbQ+wkRLC2mznqc09gA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yqlq428Kg7TB51tMPPyklJheZLK4iBPRuEasV1TnC1AIW/UwIMXYeb3pvmB7HR7bYyanATRF8+jmI3VdjmWJNmJq/oYAdzlMXW8aEEB9QzCv+RfKXHZTPe83WGYV2FU7eSRLeYMVME1YalxlL9zxukGQArNxaBsG1HC/j6Ela0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=luNGpmio; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=oN1NrAW261b86ZUeNpGM6q+x3KcN+7d15I3+AJgrHOY=; b=luNGpmioPBr0uMy4T/tCmgay6L
	KqG3m7j58qZ9pvRfa1O3kjUxJZxO7UcnM1d+QxW7catY21Iq2A+31U+BolNxmDgSx1eN4fzPrrloR
	Oyc8kmwomosJV6g8AQd2NmJ6vCAETRmHiHliWhQFjxnG6eRZpZMp2nzpJyg4zAXnpuB4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1ufmCU-002y47-Cy; Sat, 26 Jul 2025 23:13:02 +0200
Date: Sat, 26 Jul 2025 23:13:02 +0200
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
Subject: Re: [PATCH net-next v10 09/15] net: phy: marvell: Support SFP
 through phy_port interface
Message-ID: <4be84db1-7999-46a2-8157-68b8039a31cd@lunn.ch>
References: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
 <20250722121623.609732-10-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722121623.609732-10-maxime.chevallier@bootlin.com>

> -static int m88e1510_sfp_insert(void *upstream, const struct sfp_eeprom_id *id)
> +static int mv88e1510_port_configure_serdes(struct phy_port *port, bool enable,

The naming convention in this driver is to use m88, not mv88.

	Andrew

