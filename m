Return-Path: <linux-arm-msm+bounces-79688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FECEC20391
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 14:24:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 8B6041A27D1C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 13:24:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 929CA2EC088;
	Thu, 30 Oct 2025 13:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="mxWg7ClH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABA6F2E0938;
	Thu, 30 Oct 2025 13:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761830658; cv=none; b=b0En6qtyQyUhUlNSgaj5S8gGkuHZ+ImSa/BLGfBVgL35kIusq44slieR99JQ5C0t2wzWd5G1iOV3AHH5dAgLrgRb2QqmYgGFvvDX9uOL93/cUL01u3WLMgMp71KfVpSXDEJGR5xeJXnRY+HhUXZK0bVBin9UVvsf0x8arVUHgOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761830658; c=relaxed/simple;
	bh=lZ4jwTDbPAeWp/de4k6f0sgkZG4Y3dvhkwYwZh4vyvU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gYXkOoGqmpkH3/nZeH/Gv5FiG+TZpE/vJXqLENQJQtsEzvqCQHqlN8UnEPtUbEm92E3CfB06F9DWLhQ8GDAUZVFxDH48lteKqDi15m61dpb/Mcr4og2Ub1rKh8RMy7LKom4BIKdl0McdM2KWUqLEGcfKbXl9qMXnIgg0Wh+N90g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=mxWg7ClH; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=r0Y78kjdZB9qurE4MI+T/bMh3arrMfi+mi377H2n21A=; b=mxWg7ClHfEhUgZHomS6qMqLvp9
	6ISViMZNpFt3HbNMjk9qghTjF2k4C4AXKtzrhaSuDVol3/fCO7yeYt7Zcdq/G3OBtG38CpzIcAWSe
	bzUDf/Awohi+40E83mPY+KCLaVzZQ/YqLi2dPog9b+fLbn1F9K016vIidzE2A9aInk30=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vESd7-00CVeI-OG; Thu, 30 Oct 2025 14:23:53 +0100
Date: Thu, 30 Oct 2025 14:23:53 +0100
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
Message-ID: <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-2-maxime.chevallier@bootlin.com>
 <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>

On Thu, Oct 30, 2025 at 01:13:14PM +0100, Maxime Chevallier wrote:
> Hi,
> 
> > @@ -313,5 +324,12 @@ examples:
> >                      default-state = "keep";
> >                  };
> >              };
> > +            /* Fast Ethernet port, with only 2 pairs wired */
> > +            mdi {
> > +                connector-0 {
> > +                    lanes = <2>;
> > +                    media = "BaseT";
> > +                };
> > +            };
> >          };
> >      };
> 
> As Andrew suggest clearly differentiating "lanes" and "pairs", do we
> want this difference to also affect the binding ?
> 
> I still think "lanes" makes some level of sense here, but at least
> the doc will need updating.

How do you define MDI?

For copper, one possibility is an RJ-45 plug/socket, and you have
twisted pairs, 2 or 4 of them.

Some people are old enough to remember 10Base2, using a coaxial cable
and BNC connectors. Would you consider that a pair? A lane?

How about an SFF, a soldered down module. Its MDI interface is likely
to be 2 fibre strands. But consider so called bidi modules, which use
one fibre, and two different wavelengths of light.

Or an SFP, where you have no idea what the MDI is until you plug it in
and read the EEPROM.

Do we need to be able to describe all the different MDI? Do we maybe
need to look at the media property to decide it is an RJ-45 connector
so there should be a pairs property? Or the media is -KS, so there
should be a lanes property for the number of PCS lanes on the PCB?

This needs further discussion, what are you actually trying to
represent here?

	Andrew

