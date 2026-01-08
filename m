Return-Path: <linux-arm-msm+bounces-88014-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DBD9D03C23
	for <lists+linux-arm-msm@lfdr.de>; Thu, 08 Jan 2026 16:19:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9FC34300FEF5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  8 Jan 2026 15:16:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E25863939C3;
	Thu,  8 Jan 2026 08:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mihCs/HQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA88636B06F;
	Thu,  8 Jan 2026 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767859331; cv=none; b=jSXAzCfYGGMFrwlzLuFZb6UbcqaXJdAU3nPVieabWFOCDV/FAgl3tmXATskvWGK8PQ6w2NvdVEDih178C31Z7qE4CKNCM/f7MhsGKK0SEO3FiAwtAKgvbMwVHj2Oj2EdtWmSKxqCbFekd3OprlniJyzosX1mvjM9vIKRLF4OVKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767859331; c=relaxed/simple;
	bh=DL2wp9m/jrvz4EPXlaFeoy2wi5xsUsIwl+3lteU7AKE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l9ABH7qDDDCsCdLN8UtPzsIunzYwjynUgKm2nvK1+1DPKCouQ+qCEk7Clq7DX4rNEqOyDyqciNfiFYZwqzyzanoAUfrNeFMiLouQOTtJ5sn+BqeICL0xgIr1WKjDZwsywfEohZe0tfADjUMFuZ7diPSnzUSASeyG5o6+6U2nBCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mihCs/HQ; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 14794C1ECB1;
	Thu,  8 Jan 2026 08:01:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 40CA3606B6;
	Thu,  8 Jan 2026 08:01:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01C3A103C84E2;
	Thu,  8 Jan 2026 09:01:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767859306; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=E1q3uw+pHa1UqxVB+fQZSPcIhfLYFt9biACpDySMngM=;
	b=mihCs/HQ/gqBPCinF13I6uLPpvLKbW6nsc+Joakes3Z0iiAlNtX24YOIlcXB5STBnZY6hP
	KtqnA5qhaYPVg72zKB+1tMPupN+ejJjG81iWTWcWjwVzs/twaUm4ncE+gETLUX+/yz4xDX
	oA2RgmSnHCe7rSpXcG71MK/k6OU9qh8OJeTROO+WE8q+rPWIr/42GLRfCZHciUtzoNhei/
	z4YRwAah5ME9bAj8s8sWK1PuzSz9KMYvelAy3OdTih1VpxhYuqFI8796ClD7GRwIiWjDEQ
	6rTzUesS8hRQEZlAo7/BiFAMH8XyYzgrAyVB5XnbZKW93V21TuTE9OxKefeWjw==
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
Subject: [PATCH net-next v22 14/14] Documentation: networking: Document the phy_port infrastructure
Date: Thu,  8 Jan 2026 09:00:39 +0100
Message-ID: <20260108080041.553250-15-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
References: <20260108080041.553250-1-maxime.chevallier@bootlin.com>
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
index 63a525e4bde7..a4122b717783 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9398,6 +9398,7 @@ F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
+F:	Documentation/networking/phy-port.rst
 F:	Documentation/networking/phy.rst
 F:	drivers/net/mdio/
 F:	drivers/net/mdio/acpi_mdio.c
@@ -18213,6 +18214,7 @@ F:	net/ethtool/phy.c
 NETWORKING [ETHTOOL PHY PORT]
 M:	Maxime Chevallier <maxime.chevallier@bootlin.com>
 F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
+F:	Documentation/networking/phy-port.rst
 F:	drivers/net/phy/phy_port.c
 F:	include/linux/phy_port.h
 K:	struct\s+phy_port|phy_port_
-- 
2.49.0


