Return-Path: <linux-arm-msm+bounces-88001-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 50C2DD03EBC
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:38:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ED3B333F32A7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:17:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2DFBA38F932;
	Thu,  8 Jan 2026 08:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="qGk5sPyZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D32D52FBE02;
	Thu,  8 Jan 2026 08:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859263; cv=none; b=m55H37q8VahfsFzBeJE4lhiNoP1anqcuRczzIFryxg7sCZP+UG8bJjqK4buAgyfe8Bk3IP9SoD2aA0HPe36l4qMUSMIF6iOLqcpKQnquBQ8h0Fxy3md24h0i33gi+6p2/MBuirJI+c/0zvbjyqfXjuLv7p+7mEuwmybIg77xxzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859263; c=relaxed/simple;
	bh=Y0/DlcIcvj51rhEJJzgqqx15uc5MydQxybGXptrbVc4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=kvMhAnQlOkquzYVl9epZyl4D1a8CwczRSRCxmnhn6wELP8+6VuEMp+QOb9OU2WNXZQ/QDWdt2Cz/OYka1B3dp+QKz6vACQiLUt6+eaZkxZ6vFkg/BgBdC+y17Yix1dHpkrMO3JRJ5BFE/NUjKTd9B2X66SUaWcYkIa0R3NUyulE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=qGk5sPyZ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5C79D4E41FED;
	Thu,  8 Jan 2026 08:00:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2ECF0606B6;
	Thu,  8 Jan 2026 08:00:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 7337D103C84E2;
	Thu,  8 Jan 2026 09:00:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767859252; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding; bh=OlYVlM16PAGaUnTav0SYLhyhYluF+11pbMgNtp51dBk=;
	b=qGk5sPyZH3HcgTFB5BUDOm+K522QJ4CteqH4eAIvI7U5LY2nQuLvN2vC63e65kyLJBX2YJ
	6wT3EzbkEIUuhzQa7wrfI44LfOaRMWsNG9X4m5DEGgeOA8hQ9RC+ROmvu5DjAb5Q6jLedU
	TIx6MhPOy19DiXEek+cfn/a05S5Ru8oJtmFKciz+CpmTDq/bJKXI4AAZBEkjvla+8CiZ2n
	vqefhKdoxhIi5aXftPxZzvPZpGs2M8GND38WM1vOw0rz4MzH/TWdd3ZPW6QWuRcxrA061l
	yazB41jU3OsXAWqvopzZ0G38q5yOGpdO/KNekG3ZbXtc/HBkqFXQ/IsEdXy3rg==
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: davem@davemloft.net
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	thomas.petazzoni@bootlin.com,
	Andrew Lunn <andrew@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-arm-kernel@lists.infradead.org,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Herve Codina <herve.codina@bootlin.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	=?UTF-8?q?K=C3=B6ry=20Maincent?= <kory.maincent@bootlin.com>,
	=?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	=?UTF-8?q?Nicol=C3=B2=20Veronese?= <nicveronese@gmail.com>,
	Simon Horman <horms@kernel.org>,
	mwojtas@chromium.org,
	Antoine Tenart <atenart@kernel.org>,
	devicetree@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Romain Gantois <romain.gantois@bootlin.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
	Tariq Toukan <tariqt@nvidia.com>
Subject: [PATCH net-next v22 00/14]  net: phy: Introduce PHY ports representation
Date: Thu,  8 Jan 2026 09:00:25 +0100
Message-ID: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

Hi everyone,

This is v22 of the phy_port work. Main items from this versions are :

 - Rebase on net-next :)
 - Removed a "contains" keyword in the binding
 - Added a comment for phy_port SFP implementation

Patch 1 now lacks DT maintainer ACK,
Patches 2 and 3 lack PHY maintainer ACK

As a remainder, a few important notes :

 - This is only a first phase. It instantiates the port, and leverage
   that to make the MAC <-> PHY <-> SFP usecase simpler.

 - Next phase will deal with controlling the port state, as well as the
   netlink uAPI for that.

 - The end-goal is to enable support for complex port MUX. This
   preliminary work focuses on PHY-driven ports, but this will be
   extended to support muxing at the MII level (Multi-phy, or compo PHY
   + SFP as found on Turris Omnia for example).

 - The naming is definitely not set in stone. I named that "phy_port",
   but this may convey the false sense that this is phylib-specific.
   Even the word "port" is not that great, as it already has several
   different meanings in the net world (switch port, devlink port,
   etc.). I used the term "connector" in the binding.

A bit of history on that work :

The end goal that I personnaly want to achieve is :

            + PHY - RJ45
            | 
 MAC - MUX -+ PHY - RJ45

After many discussions here on netdev@, but also at netdevconf[1] and
LPC[2], there appears to be several analoguous designs that exist out
there.

[1] : https://netdevconf.info/0x17/sessions/talk/improving-multi-phy-and-multi-port-interfaces.html
[2] : https://lpc.events/event/18/contributions/1964/ (video isn't the
right one)

Take the MAchiatobin, it has 2 interfaces that looks like this :

 MAC - PHY -+ RJ45
            |
	    + SFP - Whatever the module does

Now, looking at the Turris Omnia, we have :


 MAC - MUX -+ PHY - RJ45
            |
	    + SFP - Whatever the module does

We can find more example of this kind of designs, the common part is
that we expose multiple front-facing media ports. This is what this
current work aims at supporting. As of right now, it does'nt add any
support for muxing, but this will come later on.

This first phase focuses on phy-driven ports only, but there are already
quite some challenges already. For one, we can't really autodetect how
many ports are sitting behind a PHY. That's why this series introduces a
new binding. Describing ports in DT should however be a last-resort
thing when we need to clear some ambiguity about the PHY media-side.

The only use-cases that we have today for multi-port PHYs are combo PHYs
that drive both a Copper port and an SFP (the Macchiatobin case). This
in itself is challenging and this series only addresses part of this
support, by registering a phy_port for the PHY <-> SFP connection. The
SFP module should in the end be considered as a port as well, but that's
not yet the case.

However, because now PHYs can register phy_ports for every media-side
interface they have, they can register the capabilities of their ports,
which allows making the PHY-driver SFP case much more generic.

Let me know what you think, I'm all in for discussions :)

Regards,

Changes in v22:
 - remove 'contains' in DT binding, as per AI review
 - Added a comment indicating that phy_port parameters will be
   initialized eventually, as per AI review.

Changes in v21:
 - Drop unused variable in marvell10g.c
 - Address Russell's comments on 100BaseTX and 1000BaseX in commit logs

Changes in V20:
 - Drop dp83822 SFP support, untested for too long
 - Fix some cleanup sequences following claude's review

Changes in v19:
 - Rebase on net-next, add the 4 new 1600G linkmodes

Changes in v18:
 - Added a missing 'static' when declaring the medium names.

Changes in v17:
 - Moved the medium names to patch 3
 - Moved some mediums helpers out of uapi, and the logic into
   net/ethtool/common.c instead of inline functions in headers
 - Added a MAINTAINERS entry
 - Aggregated reviews/tests
 - Rebased on net-next

Changes in v16:
 - From Andrew, relaxed the check on the number of pairs so that we only
   fail when baseT is missing pairs
 - Add a check for either 1, 2 or 4 pairs
 - Lots of typos (mostly lanes -> pairs)
 - Added Andrew's review tags (thanks again)
 - From Rob, added an "else" statement in the ethernet-connector binding
 - Changed the node name for ethernet connectors to be decimal

Changes in V15:
 - Update bindings, docs and code to use pairs instead of lanes
 - Make pairs only relevant for BaseT

Changes in V14:
 - Fixed kdoc
 - Use the sfp module_caps feature.

Changes in V13:
 - Added phy_caps support for interface selection
 - Aggregated tested-by tags

Changes in V12:
 - Moved some of phylink's internal helpers to phy_caps for reuse in
   phylib
 - Fixed SFP interface selection
 - Added Rob's review and changes in patch 6

Changes in V11:
 - The ti,fiber-mode property was deprecated in favor of the
   ethernet-connector binding
 - The .attach_port was split into an MDI and an MII version
 - I added the warning back in the AR8031 PHY driver
 - There is now an init-time check on the number of lanes associated to
   every linkmode, making sure the number of lanes is above or equal to
   the minimum required
 - Various typos were fixed all around
 - We no longer use sfp_select_interface() for SFP interface validation

Changes in V10:
 - Rebase on net-next
 - Fix a typo reported by Köry
 - Aggregate all reviews
 - Fix the conflict on the qcom driver

Changes in V9:
 - Removed maxItems and items from the connector binding
 - Fixed a typo in the binding

Changes in V8:
 - Added maxItems on the connector media binding
 - Made sure we parse a single medium
 - Added a missing bitwise macro

Changes in V7:
 - Move ethtool_medium_get_supported to phy_caps
 - support combo-ports, each with a given set of supported modes
 - Introduce the notion of 'not-described' ports

Changes in V6:

 - Fixed kdoc on patch 3
 - Addressed a missing port-ops registration for the Marvell 88x2222
   driver
 - Addressed a warning reported by Simon on the DP83822 when building
   without CONFIG_OF_MDIO

Changes in V5 :

 - renamed the bindings to use the term "connector" instead of "port"
 - Rebased, and fixed some issues reported on the 83822 driver
 - Use phy_caps

Changes in V4 :

 - Introduced a kernel doc
 - Reworked the mediums definitions in patch 2
 - QCA807x now uses the generic SFP support
 - Fixed some implementation bugs to build the support list based on the
   interfaces supported on a port

V21: https://lore.kernel.org/netdev/20251129082228.454678-1-maxime.chevallier@bootlin.com/
V20: https://lore.kernel.org/r/20251127171800.171330-1-maxime.chevallier@bootlin.com
V19: https://lore.kernel.org/r/20251122124317.92346-1-maxime.chevallier@bootlin.com
V18: https://lore.kernel.org/r/20251120205508.553909-1-maxime.chevallier@bootlin.com
V17: https://lore.kernel.org/all/20251119195920.442860-1-maxime.chevallier@bootlin.com/
V16: https://lore.kernel.org/all/20251113081418.180557-2-maxime.chevallier@bootlin.com/
V15: https://lore.kernel.org/all/20251106094742.2104099-1-maxime.chevallier@bootlin.com/
V14: https://lore.kernel.org/netdev/20251013143146.364919-1-maxime.chevallier@bootlin.com/
V13: https://lore.kernel.org/netdev/20250921160419.333427-1-maxime.chevallier@bootlin.com/
V12: https://lore.kernel.org/netdev/20250909152617.119554-1-maxime.chevallier@bootlin.com/
V11: https://lore.kernel.org/netdev/20250814135832.174911-1-maxime.chevallier@bootlin.com/
V10: https://lore.kernel.org/netdev/20250722121623.609732-1-maxime.chevallier@bootlin.com/
V9: https://lore.kernel.org/netdev/20250717073020.154010-1-maxime.chevallier@bootlin.com/
V8: https://lore.kernel.org/netdev/20250710134533.596123-1-maxime.chevallier@bootlin.com/
v7: https://lore.kernel.org/netdev/20250630143315.250879-1-maxime.chevallier@bootlin.com/
V6: https://lore.kernel.org/netdev/20250507135331.76021-1-maxime.chevallier@bootlin.com/
V5: https://lore.kernel.org/netdev/20250425141511.182537-1-maxime.chevallier@bootlin.com/
V4: https://lore.kernel.org/netdev/20250213101606.1154014-1-maxime.chevallier@bootlin.com/
V3: https://lore.kernel.org/netdev/20250207223634.600218-1-maxime.chevallier@bootlin.com/
RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/

Maxime Chevallier (14):
  dt-bindings: net: Introduce the ethernet-connector description
  net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
  net: phy: Introduce PHY ports representation
  net: phy: dp83822: Add support for phy_port representation
  dt-bindings: net: dp83822: Deprecate ti,fiber-mode
  net: phy: Create a phy_port for PHY-driven SFPs
  net: phy: Introduce generic SFP handling for PHY drivers
  net: phy: marvell-88x2222: Support SFP through phy_port interface
  net: phy: marvell: Support SFP through phy_port interface
  net: phy: marvell10g: Support SFP through phy_port
  net: phy: at803x: Support SFP through phy_port interface
  net: phy: qca807x: Support SFP through phy_port interface
  net: phy: Only rely on phy_port for PHY-driven SFP
  Documentation: networking: Document the phy_port infrastructure

 .../bindings/net/ethernet-connector.yaml      |  56 +++
 .../devicetree/bindings/net/ethernet-phy.yaml |  18 +
 .../devicetree/bindings/net/ti,dp83822.yaml   |   9 +-
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/phy-port.rst         | 111 ++++++
 MAINTAINERS                                   |  10 +
 drivers/net/phy/Makefile                      |   2 +-
 drivers/net/phy/dp83822.c                     |  71 ++--
 drivers/net/phy/marvell-88x2222.c             |  94 ++---
 drivers/net/phy/marvell.c                     |  92 ++---
 drivers/net/phy/marvell10g.c                  |  49 ++-
 drivers/net/phy/phy-caps.h                    |   5 +
 drivers/net/phy/phy-core.c                    |   6 +
 drivers/net/phy/phy_caps.c                    |  65 ++++
 drivers/net/phy/phy_device.c                  | 345 +++++++++++++++++-
 drivers/net/phy/phy_port.c                    | 212 +++++++++++
 drivers/net/phy/qcom/at803x.c                 |  77 ++--
 drivers/net/phy/qcom/qca807x.c                |  72 ++--
 include/linux/ethtool.h                       |  36 +-
 include/linux/phy.h                           |  63 +++-
 include/linux/phy_port.h                      |  99 +++++
 net/ethtool/common.c                          | 287 +++++++++------
 22 files changed, 1394 insertions(+), 386 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
 create mode 100644 Documentation/networking/phy-port.rst
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

-- 
2.49.0


