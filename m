Return-Path: <linux-arm-msm+bounces-82592-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F01C9C70F87
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 21:07:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id 4AFE32FCC6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 20:06:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5BDFF36E9D8;
	Wed, 19 Nov 2025 20:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="VJlWKAzV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C33936BCFF
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Nov 2025 20:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763582430; cv=none; b=T6vqKPjtlF9zoCed+i1pGl0StMaZBheWUukfTz3hZJVYg1VB2mYPBmm7A3yZrtMCSyi3mmx8Ja4NjsonW3HH7odlDwP5WIvErKGsCfabEcwayoSlF6ldu3n+do108G9bQ8n78g6hjIIpU+z1Qa6DhgH4qgL7KnpRVeB5qkaZUYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763582430; c=relaxed/simple;
	bh=ygnMB0zO5n7LNWTLaftTf7mOpO0kT3kaJ+Cqfp3KG9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=StmLSlTGxLyL6NUjZEz71x7LxLmjoYxsqQcX7lFGbpKnLbuA4lmSgMGdHNK9sK86vp1lZvvJdy5hfFpqQbJ5efU2AiW650+X7PamiA1mIx+zLq7/LdDMm4Bxkit5xvO6KAFrAK8SxIlySc5CV3cD8qEYPjnZp/jhPl1a51m4B8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=VJlWKAzV; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 86A124E417AE;
	Wed, 19 Nov 2025 20:00:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5C24860699;
	Wed, 19 Nov 2025 20:00:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 268F110371A45;
	Wed, 19 Nov 2025 21:00:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763582424; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=q5cHSdBiFQndzU4nTFiD7tW7FCwQQjMLgxuIBfRu/1k=;
	b=VJlWKAzVHzB+dudMki/sFnzGCmXtuJ8iYEpsqnOVE70nltXlHHoibDS9G4Sn1ksH2ibfqr
	doXf0kADWlMdBgCk8rWbCad2IQaAP7MIy3myVUGt9UwZfgsTPeo8vARy1koO5otxMTadYu
	JusuDPbbIJtOQ7G06es7O1ykZU3E/AW4J60y6Ew9/b7s1joTDAbZI/HfQX1xg09qd9ze3U
	QeL5W8lV/QnLog7p56K2HGn6m22VOQwSMIiHSnareI6k4Q2nKMK4rkIw1e7KTe5u+iDkZU
	yPtjmFXfwgjZuvjG1qUke/VFGTpeZogoyEabr14nr9iv0WSLwABuTVuFbXKx/w==
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
Subject: [PATCH net-next v17 15/15] Documentation: networking: Document the phy_port infrastructure
Date: Wed, 19 Nov 2025 20:59:16 +0100
Message-ID: <20251119195920.442860-16-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251119195920.442860-1-maxime.chevallier@bootlin.com>
References: <20251119195920.442860-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

This documentation aims at describing the main goal of the phy_port
infrastructure.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/networking/index.rst    |   1 +
 Documentation/networking/phy-port.rst | 111 ++++++++++++++++++++++++++
 MAINTAINERS                           |   2 +
 3 files changed, 114 insertions(+)
 create mode 100644 Documentation/networking/phy-port.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index 75db2251649b..49fcfa577711 100644
--- a/Documentation/networking/index.rst
+++ b/Documentation/networking/index.rst
@@ -96,6 +96,7 @@ Contents:
    packet_mmap
    phonet
    phy-link-topology
+   phy-port
    pktgen
    plip
    ppp_generic
diff --git a/Documentation/networking/phy-port.rst b/Documentation/networking/phy-port.rst
new file mode 100644
index 000000000000..6e28d9094bce
--- /dev/null
+++ b/Documentation/networking/phy-port.rst
@@ -0,0 +1,111 @@
+.. SPDX-License-Identifier: GPL-2.0
+.. _phy_port:
+
+=================
+Ethernet ports
+=================
+
+This document is a basic description of the phy_port infrastructure,
+introduced to represent physical interfaces of Ethernet devices.
+
+Without phy_port, we already have quite a lot of information about what the
+media-facing interface of a NIC can do and looks like, through the
+:c:type:`struct ethtool_link_ksettings <ethtool_link_ksettings>` attributes,
+which includes :
+
+ - What the NIC can do through the :c:member:`supported` field
+ - What the Link Partner advertises through :c:member:`lp_advertising`
+ - Which features we're advertising through :c:member:`advertising`
+
+We also have info about the number of pairs and the PORT type. These settings
+are built by aggregating together information reported by various devices that
+are sitting on the link :
+
+  - The NIC itself, through the :c:member:`get_link_ksettings` callback
+  - Precise information from the MAC and PCS by using phylink in the MAC driver
+  - Information reported by the PHY device
+  - Information reported by an SFP module (which can itself include a PHY)
+
+This model however starts showing its limitations when we consider devices that
+have more than one media interface. In such a case, only information about the
+actively used interface is reported, and it's not possible to know what the
+other interfaces can do. In fact, we have very little information about whether
+or not there are any other media interfaces.
+
+The goal of the phy_port representation is to provide a way of representing a
+physical interface of a NIC, regardless of what is driving the port (NIC through
+a firmware, SFP module, Ethernet PHY).
+
+Multi-port interfaces examples
+==============================
+
+Several cases of multi-interface NICs have been observed so far :
+
+Internal MII Mux::
+
+  +------------------+
+  | SoC              |
+  |          +-----+ |           +-----+
+  | +-----+  |     |-------------| PHY |
+  | | MAC |--| Mux | |   +-----+ +-----+
+  | +-----+  |     |-----| SFP |
+  |          +-----+ |   +-----+
+  +------------------+
+
+Internal Mux with internal PHY::
+
+  +------------------------+
+  | SoC                    |
+  |          +-----+ +-----+
+  | +-----+  |     |-| PHY |
+  | | MAC |--| Mux | +-----+   +-----+
+  | +-----+  |     |-----------| SFP |
+  |          +-----+       |   +-----+
+  +------------------------+
+
+External Mux::
+
+  +---------+
+  | SoC     |  +-----+  +-----+
+  |         |  |     |--| PHY |
+  | +-----+ |  |     |  +-----+
+  | | MAC |----| Mux |  +-----+
+  | +-----+ |  |     |--| PHY |
+  |         |  +-----+  +-----+
+  |         |     |
+  |    GPIO-------+
+  +---------+
+
+Double-port PHY::
+
+  +---------+
+  | SoC     | +-----+
+  |         | |     |--- RJ45
+  | +-----+ | |     |
+  | | MAC |---| PHY |   +-----+
+  | +-----+ | |     |---| SFP |
+  +---------+ +-----+   +-----+
+
+phy_port aims at providing a path to support all the above topologies, by
+representing the media interfaces in a way that's agnostic to what's driving
+the interface. the struct phy_port object has its own set of callback ops, and
+will eventually be able to report its own ksettings::
+
+             _____      +------+
+            (     )-----| Port |
+ +-----+   (       )    +------+
+ | MAC |--(   ???   )
+ +-----+   (       )    +------+
+            (_____)-----| Port |
+                        +------+
+
+Next steps
+==========
+
+As of writing this documentation, only ports controlled by PHY devices are
+supported. The next steps will be to add the Netlink API to expose these
+to userspace and add support for raw ports (controlled by some firmware, and directly
+managed by the NIC driver).
+
+Another parallel task is the introduction of a MII muxing framework to allow the
+control of non-PHY driver multi-port setups.
diff --git a/MAINTAINERS b/MAINTAINERS
index e0dc230df90e..219c04aab4a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9283,6 +9283,7 @@ F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
+F:	Documentation/networking/phy-port.rst
 F:	Documentation/networking/phy.rst
 F:	drivers/net/mdio/
 F:	drivers/net/mdio/acpi_mdio.c
@@ -17981,6 +17982,7 @@ F:	net/ethtool/phy.c
 NETWORKING [ETHTOOL PHY PORT]
 M:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
+F:	Documentation/networking/phy-port.rst
 F:	drivers/net/phy/phy_port.c
 F:	include/linux/phy_port.h
 K:	struct\s+phy_port|phy_port_
-- 
2.49.0


