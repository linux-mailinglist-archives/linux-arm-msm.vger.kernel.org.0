Return-Path: <linux-arm-msm+bounces-66064-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id CF06EB0D927
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 14:16:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 864881C23684
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Jul 2025 12:17:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 598612E1C61;
	Tue, 22 Jul 2025 12:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="JPC3P105"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD9E18C91F;
	Tue, 22 Jul 2025 12:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753186600; cv=none; b=rmDMjCapi42LebAjSBDZiDRo6mR/7r3eSr3Ln+OWT0eGrLm/HlRb3NMLcIvt2LQE/79OQ8w7hr+f8TCK6XlP10hhHgibGqtnw+qS/tynhuzPLqSwxyFsPMQYR29oWZ/BUDo5FdrvvDxPvbMLV3CoAbfcJM9eDOCxctFFjTBQiUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753186600; c=relaxed/simple;
	bh=ZrCPYKYdKuag350xkgQH1YevBtfQ1QQn4mwmky+hTx0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=rxBfBOvTqGPjmtxWlP8/mMqEjn9J5/27ObcLpjK0SaB+sIFcfQ8MIKTbHIpFOLw1kkLYink+fT090EO/mw5hI37kzjQ/cwbMxFBULwSHwGswwAo63zCbYnF4DMKzgvWhEoDQdQMOSfxw5oUZ17/arlUf+AIyb+ur2HwYBzY2jkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=JPC3P105; arc=none smtp.client-ip=217.70.183.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id C142443283;
	Tue, 22 Jul 2025 12:16:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1753186589;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4MFSsbzq4yg0xHtGoAmJ9rIQs5B5Nu4x+IhNNOlLz1E=;
	b=JPC3P105oKNUnBRleevzGAOqxnrBNIegigNNdizDD5P1oVNBRw+WnE9xtivjOoa1bJvi1C
	djQHodwdudOaRp1/Sr+aPZu208zRXVcbkBhRFAyWqMSzq7gyl6TV8R8RgiBGYNi80YOBoo
	vVKlxBcoTpxLmylVDzi6fV8+8Fxjfec1DVO7t6gBMz5kb8G6Aupv9vhoLGYip9kvNK3kKb
	0Je0gdWmp9ynWisgxcQCbaZJW43qjd+cUqnwNe6II+B4WaY73xjyh4UdUPbLVFRqzNpSlt
	1M9rrazwCJeV+svuvY659i0i7JXA78xzgzWehZ1WjNd/LjROshT4qG3WCzGIiQ==
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
	Dimitri Fedrau <dimitri.fedrau@liebherr.com>
Subject: [PATCH net-next v10 00/15] net: phy: Introduce PHY ports representation
Date: Tue, 22 Jul 2025 14:16:05 +0200
Message-ID: <20250722121623.609732-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdejgeekkecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofggtgfgsehtkeertdertdejnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepleefteehteekvddtgeelffejgfffvddvffdugfeiieejfeeghffgkeejgfeuueeinecuffhomhgrihhnpehnvghtuggvvhgtohhnfhdrihhnfhhopdhlphgtrdgvvhgvnhhtshdpkhgvrhhnvghlrdhorhhgnecukfhppeeltddrjeeirdeivddrudejudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpeeltddrjeeirdeivddrudejuddphhgvlhhopehfvgguohhrrgdrrddpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtp
 hhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

Hi everyone,

Here's V10 of the phy_port series. This version doesn't contain any
significant change, it fixes the conflict on the qualcom PHY driver, as
well as aggregates the reviews from Rob, Köry and Christophe (thanks
again).

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

V9: https://lore.kernel.org/netdev/20250717073020.154010-1-maxime.chevallier@bootlin.com/
V8: https://lore.kernel.org/netdev/20250710134533.596123-1-maxime.chevallier@bootlin.com/
v7: https://lore.kernel.org/netdev/20250630143315.250879-1-maxime.chevallier@bootlin.com/
V6: https://lore.kernel.org/netdev/20250507135331.76021-1-maxime.chevallier@bootlin.com/
V5: https://lore.kernel.org/netdev/20250425141511.182537-1-maxime.chevallier@bootlin.com/
V4: https://lore.kernel.org/netdev/20250213101606.1154014-1-maxime.chevallier@bootlin.com/
V3: https://lore.kernel.org/netdev/20250207223634.600218-1-maxime.chevallier@bootlin.com/
RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/

Maxime

Maxime Chevallier (15):
  dt-bindings: net: Introduce the ethernet-connector description
  net: ethtool: common: Indicate that BaseT works on up to 4 lanes
  net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
  net: phy: Introduce PHY ports representation
  net: phy: dp83822: Add support for phy_port representation
  net: phy: Create a phy_port for PHY-driven SFPs
  net: phy: Introduce generic SFP handling for PHY drivers
  net: phy: marvell-88x2222: Support SFP through phy_port interface
  net: phy: marvell: Support SFP through phy_port interface
  net: phy: marvell10g: Support SFP through phy_port
  net: phy: at803x: Support SFP through phy_port interface
  net: phy: qca807x: Support SFP through phy_port interface
  net: phy: Only rely on phy_port for PHY-driven SFP
  net: phy: dp83822: Add SFP support through the phy_port interface
  Documentation: networking: Document the phy_port infrastructure

 .../bindings/net/ethernet-connector.yaml      |  45 +++
 .../devicetree/bindings/net/ethernet-phy.yaml |  18 +
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/phy-port.rst         | 111 ++++++
 MAINTAINERS                                   |   3 +
 drivers/net/phy/Makefile                      |   2 +-
 drivers/net/phy/dp83822.c                     |  78 +++--
 drivers/net/phy/marvell-88x2222.c             |  98 +++---
 drivers/net/phy/marvell.c                     | 100 +++---
 drivers/net/phy/marvell10g.c                  |  47 +--
 drivers/net/phy/phy-caps.h                    |   5 +
 drivers/net/phy/phy_caps.c                    |  58 ++++
 drivers/net/phy/phy_device.c                  | 327 +++++++++++++++++-
 drivers/net/phy/phy_port.c                    | 170 +++++++++
 drivers/net/phy/qcom/at803x.c                 |  64 +---
 drivers/net/phy/qcom/qca807x.c                |  75 ++--
 include/linux/ethtool.h                       |  44 ++-
 include/linux/phy.h                           |  38 +-
 include/linux/phy_port.h                      |  97 ++++++
 include/uapi/linux/ethtool.h                  |  20 ++
 net/ethtool/common.c                          | 267 ++++++++------
 21 files changed, 1279 insertions(+), 389 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-connector.yaml
 create mode 100644 Documentation/networking/phy-port.rst
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

-- 
2.49.0


