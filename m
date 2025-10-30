Return-Path: <linux-arm-msm+bounces-79701-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A2DFCC20CDC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 16:01:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 737583B5312
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 15:01:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B82542DF126;
	Thu, 30 Oct 2025 15:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="s7j2QD18"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149922DA759;
	Thu, 30 Oct 2025 15:01:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761836504; cv=none; b=Z++fzE56MceQ9DclFEGr83t1d1CsvdpZi2Apd2HKqsU7R0SP6SETEv2xbddvszI8/cjUT9MlB7zsIdsM6yBOWamOmddCY1YgOMdP8Apz68Z+cTzSF7k64mSd56FyFOscFKdiiSQ8dXRuhxh8cXss7Y0Zzy1UmsJ6Zhg7jFMC+zs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761836504; c=relaxed/simple;
	bh=HoI9A5dBBG/SP18tn0qdYgJCPMwIZpw/yCunp7reoSE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GuxtjlSmQThPicJV0jlJuD/XKJ2uhX77Xrpz4gVb8p/Rzjn4pjHYRPp/Ae5f43t58adeCC8Rk+dwQzuWIzV0bB6MU3Z8VJqMDGS5U63Hl+e+V58LwzhX+vBawJMorggNrmw+n0LzIO04FgXvZthJjQwzD/K1sau8cf3WNtW1MhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=s7j2QD18; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=Ev+WYGcskpqGIIHF3ivwDxrnkr+tx39eqoXSZQFeHS4=; b=s7j2QD18Ifk5JJ5i3kDidFZBGP
	1ZSafhgxrWn784jyyT40jnXFTQXSOup0KQKwY0Qo//PIMODPXAD/K0lT2Jo6jU1ML+h1zR92GcqOD
	kXNyTJI+rAUedXLIAnw9SP//oUMikCeIIXltq+lT5vdFqrocJ7jb1+VOe3Zua8Y0+qmg=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vEU9W-00CWJa-69; Thu, 30 Oct 2025 16:01:26 +0100
Date: Thu, 30 Oct 2025 16:01:26 +0100
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: Re: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <b8561c97-483f-4f43-897c-4bc3a4b916b4@lunn.ch>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-2-maxime.chevallier@bootlin.com>
 <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
 <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
 <7a611937-a2af-4780-9b88-cf9f282f88b3@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7a611937-a2af-4780-9b88-cf9f282f88b3@bootlin.com>

> So that being said, an option could be to only focus on pairs, only
> for medium = BaseT, and ditch the "lanes" terminology, at least when
> it comes to the DT bindings.
> 
> Does that sound good ?

That sounds reasonable.

In the binding, maybe try to express that we might in the future
extend it. You can do that with conditionals. medium is required.  If
medium = BaseT then pairs is required. That leaves it open, e.g. in
the future we could add medium = BaseKS, and require that has lanes.

	Andrew

