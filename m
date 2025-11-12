Return-Path: <linux-arm-msm+bounces-81414-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 259ABC527F9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 14:35:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 918703AEEBF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Nov 2025 13:25:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DA10F337BAE;
	Wed, 12 Nov 2025 13:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="dA3ow4En"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ACEB30C34A;
	Wed, 12 Nov 2025 13:25:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762953923; cv=none; b=G6QKt1HGO08hpLHQ2eVcuHrZ6CqnsZ5pcxE1O4ZnuXDSjI5HQS/ukQdsfZcw1Cjz0y0Jsgqk/4o5+SzcFeeHJK4HAGeAIQO6dTq7xNjrE2p/e85jWw9XsXQ8sDAvM11hD1SFfWEQE5AGhCUYWhdN2k0GYcdNKQvD+PRStNW0lNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762953923; c=relaxed/simple;
	bh=O7/lmhrEnSM5nvlYJelxb/eMu9DoLXJrh4JFzJ/R9NI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AOiIwaar2a1GZp5mG209ceNCLfTduDyjGxWlWXBOftUpU34KbeuMZtOJdagt5K7bXTYxv/Tr07FELg2W6tSUKCgaPXu3Ww+C/3pja5Si6Xz0GVNfa3viHPpKZJ46TKsgZ/atcpHy5qiSkhIlG2Goy451I+9DnJXulw9PuZPW9AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=dA3ow4En; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UaY7KqekpaEMhTYRhO2ZoYZ8i2O52YuClMxZhBCoR7I=; b=dA3ow4EnKu9JWOlLIY40GL+xLV
	5mYhKMR9yXmdr4PTcNUsQlOWynfniRaBzrDNzML+nZF4S39boswZrujC6IreXKOO6ODGPgjY2DYFq
	+msb2tpUCrG/SPk4gvhuPLYVTatZLpD2JUQ+4QoYXkB5bvBn1xs5/9BJcHjab9lkxuvI=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vJAqQ-00DkWD-BY; Wed, 12 Nov 2025 14:25:06 +0100
Date: Wed, 12 Nov 2025 14:25:06 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Rob Herring <robh@kernel.org>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
	Jakub Kicinski <kuba@kernel.org>,
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
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v15 01/15] dt-bindings: net: Introduce the
 ethernet-connector description
Message-ID: <dd29e395-8074-4259-8563-062e5e1b6216@lunn.ch>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-2-maxime.chevallier@bootlin.com>
 <20251112124355.GA1269790-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251112124355.GA1269790-robh@kernel.org>

> > +  pairs:
> > +    description:
> > +      Defines the number of BaseT pairs that are used on the connector.
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> 
> Constraints? Wouldn't 4 pairs be the max?

[1, 2, 4];

	Andrew

