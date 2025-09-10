Return-Path: <linux-arm-msm+bounces-72941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F487B513C4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 12:22:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 0887E468479
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Sep 2025 10:22:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3C0ED260587;
	Wed, 10 Sep 2025 10:22:24 +0000 (UTC)
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B4D931577D
	for <linux-arm-msm@vger.kernel.org>; Wed, 10 Sep 2025 10:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757499744; cv=none; b=gSZWlZ4awpLVB6rZNdXfpXF5txJK/Ag/WudXsRQsOfoTOXUjkBKhz5scc5MA7bQwENZ5R/kSgI6ZQtH4Mm+cQSQqPVKk/d3uAJwnBx0Foe0EOOiUrJlh4w4Q6ir6BT1yXlUvOs//hhExyl/pASqVBcQ5ulncAw31CRL7u2pbhd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757499744; c=relaxed/simple;
	bh=gCrhSKTKnrQGcLPzm5DuCFymX8YOrCHheQo2jue2Yb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ce4a5TlbcDU+q+0sfyct1gSiTE41TKa1rXUjcsHul9bFVZowIBytnvXskKAncrVoTTfs3em2pOplqtvjOzwGqXjFseZyeUZHrtqWHJGpZFg9wMFc034wODf8oGJCC1bpVOYP3NepoEZJxJlj0j/do7dKewGaD13oe6utJAXfbMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ore@pengutronix.de>)
	id 1uwHxn-000523-Em; Wed, 10 Sep 2025 12:22:07 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uwHxj-000Zhz-2x;
	Wed, 10 Sep 2025 12:22:03 +0200
Received: from ore by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ore@pengutronix.de>)
	id 1uwHxj-00GE50-2Q;
	Wed, 10 Sep 2025 12:22:03 +0200
Date: Wed, 10 Sep 2025 12:22:03 +0200
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?utf-8?B?S8O2cnk=?= Maincent <kory.maincent@bootlin.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>,
	=?utf-8?Q?Nicol=C3=B2?= Veronese <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: Re: [PATCH net-next v12 00/18] net: phy: Introduce PHY ports
 representation
Message-ID: <aMFRSz9K5AkrwtMb@pengutronix.de>
References: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250909152617.119554-1-maxime.chevallier@bootlin.com>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ore@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-msm@vger.kernel.org

Hi Maxime,

I tested this series on top of net-next against lan78xx. No visible
regressions for existing setup:
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>

On Tue, Sep 09, 2025 at 05:25:56PM +0200, Maxime Chevallier wrote:
> Hi everyone,
> 
> Here is a V12 for the phy_port work, aiming at representing the
> connectors and outputs of PHY devices.
> 
> Last round was 16 patches, and now 18, if needed I can split some
> patches out such as the 2 phylink ones.
> 
> this V12 address the SFP interface selection for PHY driver SFPs, as
> commented by Russell on v10.
> 
> This and Rob's review on the dp83822 patch are the only changes.
> 
> As a remainder, a few important notes :
> 
>  - This is only a first phase. It instantiates the port, and leverage
>    that to make the MAC <-> PHY <-> SFP usecase simpler.
> 
>  - Next phase will deal with controlling the port state, as well as the
>    netlink uAPI for that.
> 
>  - The end-goal is to enable support for complex port MUX. This
>    preliminary work focuses on PHY-driven ports, but this will be
>    extended to support muxing at the MII level (Multi-phy, or compo PHY
>    + SFP as found on Turris Omnia for example).
> 
>  - The naming is definitely not set in stone. I named that "phy_port",
>    but this may convey the false sense that this is phylib-specific.
>    Even the word "port" is not that great, as it already has several
>    different meanings in the net world (switch port, devlink port,
>    etc.). I used the term "connector" in the binding.
> 
> A bit of history on that work :
> 
> The end goal that I personnaly want to achieve is :
> 
>             + PHY - RJ45
>             | 
>  MAC - MUX -+ PHY - RJ45
> 
> After many discussions here on netdev@, but also at netdevconf[1] and
> LPC[2], there appears to be several analoguous designs that exist out
> there.
> 
> [1] : https://netdevconf.info/0x17/sessions/talk/improving-multi-phy-and-multi-port-interfaces.html
> [2] : https://lpc.events/event/18/contributions/1964/ (video isn't the
> right one)
> 
> Take the MAchiatobin, it has 2 interfaces that looks like this :
> 
>  MAC - PHY -+ RJ45
>             |
> 	    + SFP - Whatever the module does
> 
> Now, looking at the Turris Omnia, we have :
> 
> 
>  MAC - MUX -+ PHY - RJ45
>             |
> 	    + SFP - Whatever the module does
> 
> We can find more example of this kind of designs, the common part is
> that we expose multiple front-facing media ports. This is what this
> current work aims at supporting. As of right now, it does'nt add any
> support for muxing, but this will come later on.
> 
> This first phase focuses on phy-driven ports only, but there are already
> quite some challenges already. For one, we can't really autodetect how
> many ports are sitting behind a PHY. That's why this series introduces a
> new binding. Describing ports in DT should however be a last-resort
> thing when we need to clear some ambiguity about the PHY media-side.
> 
> The only use-cases that we have today for multi-port PHYs are combo PHYs
> that drive both a Copper port and an SFP (the Macchiatobin case). This
> in itself is challenging and this series only addresses part of this
> support, by registering a phy_port for the PHY <-> SFP connection. The
> SFP module should in the end be considered as a port as well, but that's
> not yet the case.
> 
> However, because now PHYs can register phy_ports for every media-side
> interface they have, they can register the capabilities of their ports,
> which allows making the PHY-driver SFP case much more generic.
> 
> Let me know what you think, I'm all in for discussions :)
> 
> Regards,
> 
> Changes in V12:
>  - Moved some of phylink's internal helpers to phy_caps for reuse in
>    phylib
>  - Fixed SFP interface selection
>  - Added Rob's review and changes in patch 6
> 
> Changes in V11:
>  - The ti,fiber-mode property was deprecated in favor of the
>    ethernet-connector binding
>  - The .attach_port was split into an MDI and an MII version
>  - I added the warning back in the AR8031 PHY driver
>  - There is now an init-time check on the number of lanes associated to
>    every linkmode, making sure the number of lanes is above or equal to
>    the minimum required
>  - Various typos were fixed all around
>  - We no longer use sfp_select_interface() for SFP interface validation
> 
> Changes in V10:
>  - Rebase on net-next
>  - Fix a typo reported by Köry
>  - Aggregate all reviews
>  - Fix the conflict on the qcom driver
> 
> Changes in V9:
>  - Removed maxItems and items from the connector binding
>  - Fixed a typo in the binding
> 
> Changes in V8:
>  - Added maxItems on the connector media binding
>  - Made sure we parse a single medium
>  - Added a missing bitwise macro
> 
> Changes in V7:
>  - Move ethtool_medium_get_supported to phy_caps
>  - support combo-ports, each with a given set of supported modes
>  - Introduce the notion of 'not-described' ports
> 
> Changes in V6:
> 
>  - Fixed kdoc on patch 3
>  - Addressed a missing port-ops registration for the Marvell 88x2222
>    driver
>  - Addressed a warning reported by Simon on the DP83822 when building
>    without CONFIG_OF_MDIO
> 
> Changes in V5 :
> 
>  - renamed the bindings to use the term "connector" instead of "port"
>  - Rebased, and fixed some issues reported on the 83822 driver
>  - Use phy_caps
> 
> Changes in V4 :
> 
>  - Introduced a kernel doc
>  - Reworked the mediums definitions in patch 2
>  - QCA807x now uses the generic SFP support
>  - Fixed some implementation bugs to build the support list based on the
>    interfaces supported on a port
> 
> V11:https://lore.kernel.org/netdev/20250814135832.174911-1-maxime.chevallier@bootlin.com/
> V10: https://lore.kernel.org/netdev/20250722121623.609732-1-maxime.chevallier@bootlin.com/
> V9: https://lore.kernel.org/netdev/20250717073020.154010-1-maxime.chevallier@bootlin.com/
> V8: https://lore.kernel.org/netdev/20250710134533.596123-1-maxime.chevallier@bootlin.com/
> v7: https://lore.kernel.org/netdev/20250630143315.250879-1-maxime.chevallier@bootlin.com/
> V6: https://lore.kernel.org/netdev/20250507135331.76021-1-maxime.chevallier@bootlin.com/
> V5: https://lore.kernel.org/netdev/20250425141511.182537-1-maxime.chevallier@bootlin.com/
> V4: https://lore.kernel.org/netdev/20250213101606.1154014-1-maxime.chevallier@bootlin.com/
> V3: https://lore.kernel.org/netdev/20250207223634.600218-1-maxime.chevallier@bootlin.com/
> RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
> RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/
> 
> Maxime
> 
> Maxime Chevallier (18):
>   dt-bindings: net: Introduce the ethernet-connector description
>   net: ethtool: common: Indicate that BaseT works on up to 4 lanes
>   net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
>   net: phy: Introduce PHY ports representation
>   net: phy: dp83822: Add support for phy_port representation
>   dt-bindings: net: dp83822: Deprecate ti,fiber-mode
>   net: phy: Create a phy_port for PHY-driven SFPs
>   net: phylink: Move phylink_interface_max_speed to phy_caps
>   net: phylink: Move sfp interface selection and filtering to phy_caps
>   net: phy: Introduce generic SFP handling for PHY drivers
>   net: phy: marvell-88x2222: Support SFP through phy_port interface
>   net: phy: marvell: Support SFP through phy_port interface
>   net: phy: marvell10g: Support SFP through phy_port
>   net: phy: at803x: Support SFP through phy_port interface
>   net: phy: qca807x: Support SFP through phy_port interface
>   net: phy: Only rely on phy_port for PHY-driven SFP
>   net: phy: dp83822: Add SFP support through the phy_port interface
>   Documentation: networking: Document the phy_port infrastructure
> 
>  .../bindings/net/ethernet-connector.yaml      |  45 +++
>  .../devicetree/bindings/net/ethernet-phy.yaml |  18 +
>  .../devicetree/bindings/net/ti,dp83822.yaml   |  10 +-
>  Documentation/networking/index.rst            |   1 +
>  Documentation/networking/phy-port.rst         | 111 ++++++
>  MAINTAINERS                                   |   3 +
>  drivers/net/phy/Makefile                      |   2 +-
>  drivers/net/phy/dp83822.c                     |  79 +++--
>  drivers/net/phy/marvell-88x2222.c             |  95 ++---
>  drivers/net/phy/marvell.c                     |  94 ++---
>  drivers/net/phy/marvell10g.c                  |  54 +--
>  drivers/net/phy/phy-caps.h                    |  12 +
>  drivers/net/phy/phy-core.c                    |   6 +
>  drivers/net/phy/phy_caps.c                    | 216 +++++++++++
>  drivers/net/phy/phy_device.c                  | 334 +++++++++++++++++-
>  drivers/net/phy/phy_port.c                    | 194 ++++++++++
>  drivers/net/phy/phylink.c                     | 157 +-------
>  drivers/net/phy/qcom/at803x.c                 |  78 ++--
>  drivers/net/phy/qcom/qca807x.c                |  73 ++--
>  include/linux/ethtool.h                       |  44 ++-
>  include/linux/phy.h                           |  63 +++-
>  include/linux/phy_port.h                      |  99 ++++++
>  include/uapi/linux/ethtool.h                  |  20 ++
>  net/ethtool/common.c                          | 267 ++++++++------
>  24 files changed, 1541 insertions(+), 534 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
>  create mode 100644 Documentation/networking/phy-port.rst
>  create mode 100644 drivers/net/phy/phy_port.c
>  create mode 100644 include/linux/phy_port.h
> 
> -- 
> 2.49.0
> 
> 
> 

-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

