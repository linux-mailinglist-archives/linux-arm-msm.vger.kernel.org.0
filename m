Return-Path: <linux-arm-msm+bounces-82751-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E575C764C1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 22:01:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 57E894E5121
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 21:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9687C3A5E79;
	Thu, 20 Nov 2025 20:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="PyGvrDcT"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 696FC3A1D03;
	Thu, 20 Nov 2025 20:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763672180; cv=none; b=t++27rw4F1gRLNIXhgrAZ6po9QWEXGoJOKy+5SkdWwpjqJAqOz3hb1liNhx2+2gX3QCjndT3K94tH13/jC0p+Buh+6eg4KspgqD80HVqZPBmokOZmE/2On2tK/u1lLY1g1laK4/p4cEGoGqfWkuHaXbltfgO9ZfzDAEoaDhg43k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763672180; c=relaxed/simple;
	bh=ygnMB0zO5n7LNWTLaftTf7mOpO0kT3kaJ+Cqfp3KG9Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rfzfj6wG9pvQDapB+q53+uHA+/UBM6MyMznGdrANTBm5nUHjTSJsTyb3IN99xq6PDYTbq/Ak06r/p3CS/9109WiF/hQo1/2nh+ChsSmySAiEgVzvRc4VfV4U95zpLlv6w5tUpEnfL7H11U62zvNA4GC50RtaUaB2SIpzeCo6GwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=PyGvrDcT; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 33EA41A1C5E;
	Thu, 20 Nov 2025 20:56:17 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 021AD606F6;
	Thu, 20 Nov 2025 20:56:17 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAEF710371BCD;
	Thu, 20 Nov 2025 21:56:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763672175; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=q5cHSdBiFQndzU4nTFiD7tW7FCwQQjMLgxuIBfRu/1k=;
	b=PyGvrDcT7ypsyJNjzh+XF97vqWLiE8UgFZwD7LM7RTXeyL/4Df4ybgKbJIgSfHMiszYoBL
	RfnisJjNgq3dKPJCUn7XNHa3V1ufBk7zvdiGLs4jfrCS6TfteYrpdnbZqXIldeMej/LavL
	T7NtNIm7wrzUnuluFWffTovgBZQrO5kdnQ+W05WXlw52dR909gOg58d8+g+zu5kBwtVHEH
	OwWlRLHVmeD40/q91gRspHwa+bDPPrQaf/OZLfPru6WG84weJYyQafqnPhtfzR1ZKsbla6
	8cVAo7zOrWuBoUomfUFq/LGqUJyXQ/KiNqnCl5WgLjV9gJTkXCUkN4jgCFT+Yw==
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
Subject: [PATCH net-next v18 15/15] Documentation: networking: Document the phy_port infrastructure
Date: Thu, 20 Nov 2025 21:55:05 +0100
Message-ID: <20251120205508.553909-16-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251120205508.553909-1-maxime.chevallier@bootlin.com>
References: <20251120205508.553909-1-maxime.chevallier@bootlin.com>
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


