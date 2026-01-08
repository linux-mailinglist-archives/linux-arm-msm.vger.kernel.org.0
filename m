Return-Path: <linux-arm-msm+bounces-88120-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 37B64D04A03
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 18:01:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 8E59630754A5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 16:54:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 975192F6904;
	Thu,  8 Jan 2026 16:53:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="o6ybf19F"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DDF62DC792;
	Thu,  8 Jan 2026 16:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767891228; cv=none; b=HQnDexXtm5vBZY+HC/Ot2vxjFNEImcWuuT/aIThMnKXpMwGjzi6cqqnw2t25upHXSZ9drUpbOnWiEqAqEOSPM10zvFU1bIHl3ZArNvwDx0E/k0G2oS6joItCmbUD6mIwFXDiXaBR9z7Kyfn4IV38rjKiVwgPRHvDMk9MTe1ueLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767891228; c=relaxed/simple;
	bh=H6ZzK5qb8nWtFLSe4fdBJd3Sr6s7l07yqSi7M31fQTU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewQnuSUfY7sWw/fd/aj+F93tCqDIhQfmm56/A4R2i97eCdPB491G0wFmQrLyCEXg+JTA240kTYDlroM+81sxRxUNgXDebTmVUCI/dvGHhhs4G3FQbuAj3DN7S6dYtsGkc4dZXhSxuifcd0mPcGtdUIU5lBy7WTDrDKaynmpCFks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=o6ybf19F; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=3siOpUNTPvOetSwU3kkXTXaIQvHOmBaMe0L2dosaTxU=; b=o6ybf19FQhA2/H0eXyYAWhtYCg
	E8J7QNNibSepM+CpqXDcjTCEXSDmnR7+vAORpbZk4kTZVsegRNEgFkFKinfF9y0Z2M4cnpsdnuDzL
	I2rpUSBEqhBNs9pXdH3OOo7nj6AT4CkgeTF8RlYKVLskcyCD3aEgYDT3wNANa9m+a3ws=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vdtGL-001zEW-Ds; Thu, 08 Jan 2026 17:53:29 +0100
Date: Thu, 8 Jan 2026 17:53:29 +0100
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
	Tariq Toukan <tariqt@nvidia.com>
Subject: Re: [PATCH net-next v22 02/14] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
Message-ID: <b8da3ec2-0775-4d81-8867-4993325a1e6c@lunn.ch>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
 <20260108080041.553250-3-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108080041.553250-3-maxime.chevallier@bootlin.com>

On Thu, Jan 08, 2026 at 09:00:27AM +0100, Maxime Chevallier wrote:
> In an effort to have a better representation of Ethernet ports,
> introduce enumeration values representing the various ethernet Mediums.
> 
> This is part of the 802.3 naming convention, for example :
> 
> 1000 Base T 4
>  |    |   | |
>  |    |   | \_ pairs (4)
>  |    |   \___ Medium (T == Twisted Copper Pairs)
>  |    \_______ Baseband transmission
>  \____________ Speed
> 
>  Other example :
> 
> 10000 Base K X 4
>            | | \_ lanes (4)
>            | \___ encoding (BaseX is 8b/10b while BaseR is 66b/64b)
>            \_____ Medium (K is backplane ethernet)
> 
> In the case of representing a physical port, only the medium and number
> of pairs should be relevant. One exception would be 1000BaseX, which is
> currently also used as a medium in what appears to be any of 1000BaseSX,
> 1000BaseCX, 1000BaseLX, 1000BaseEX, 1000BaseBX10 and some other.
> 
> This was reflected in the mediums associated with the 1000BaseX linkmode.
> 
> These mediums are set in the net/ethtool/common.c lookup table that
> maintains a list of all linkmodes with their number of pairs, medium,
> encoding, speed and duplex.
> 
> One notable exception to this is 100BaseT Ethernet. It emcompasses 100BaseTX,
> which is a 2-pairs protocol but also 100BaseT4, that will also work on 4-pairs
> cables. As we don't make a disctinction between these,  the lookup table
> contains 2 sets of pair numbers, indicating the min number of pairs for a
> protocol to work and the "nominal" number of pairs as well.
> 
> Another set of exceptions are linkmodes such 100000baseLR4_ER4, where
> the same link mode seems to represent 100GBaseLR4 and 100GBaseER4. The
> macro __DEFINE_LINK_MODE_PARAMS_MEDIUMS is here used to populate the
> .mediums bitfield with all appropriate mediums.
> 
> Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

