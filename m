Return-Path: <linux-arm-msm+bounces-77032-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 15592BD39F9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:41:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E3BEF4F4D5F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:36:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 97E8F30AAC6;
	Mon, 13 Oct 2025 14:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="S2HBNXsW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA1F30AAB8;
	Mon, 13 Oct 2025 14:33:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366028; cv=none; b=HyAVsR1DSmejKT1DItvoRiNTPZqzXrRnoo3nF+veAcrtnLY2XQod60xBmy3ob2eZw8mXUi8Rlj2wLMXcv9AtGu35+xzbmM3U5SQ/1LEf2PJ8SiKtOfWVkbjXI+VaaHwURuO69fY/nf6iyGopQZ8W2JTMTYMcbRqk1YO49Kv/Mmw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366028; c=relaxed/simple;
	bh=/U6Fp535lPjS5GxZuQF0XzDtD/xrAxAByiwBOSU2jR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pohybO39jVbJvxJGxjg5vrufpiOU6k9Qd7WQCIPqTvJCRbbNTM8jHTF2z75PP7nuOLM7HcGRDUxjsiMDE+mQ8amxQX5jdGxwktn3IhBoSNXKkYgEiQk6ZYn6Vr4RZKigwyzXIB/1fO0m0MxChqzMjN9gtRiboUrHVYZfQ0OIH2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=S2HBNXsW; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F15554E4106D;
	Mon, 13 Oct 2025 14:33:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C67B9606C6;
	Mon, 13 Oct 2025 14:33:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 0D9DB102F226E;
	Mon, 13 Oct 2025 16:33:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760366023; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=nE3OKB8b5gjCrkgY5q1yDgAHSuS7Wg8YQ15DbcFszSQ=;
	b=S2HBNXsWiIWlnRdNiU+1StrCF7BtMJ8q92R9BX4HVNYpq6oIsdecdzLN3r3/Owg3QwYCHa
	rEGQCCQSOst05ktH/pQSfstv/Qu1MRwJPg7GSD20wOKBiV/XiIkB04Aaemmhs0hBQ/zpDc
	FDe+gnGn9Ng3Ifl0Mnjx7bx91fdRi4+ByFwqt1xEuXnCO21gCV6E1WgnPm6ebky2R0rwy7
	Li5d4e42QiTV927zb9G7Vd/Y6n/e6rpg5bh1o1XyIp3uF+HW8Od7SmLZ2is9MhYbbHddDo
	jQLD2naDDlc+mnzy2FbXQICh/DVrUEDBhjAhFq7n2EktHeTx1MtuKFqV5lS2Wg==
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
	Florian Fainelli <florian.fainelli@broadcom.com>
Subject: [PATCH net-next v14 16/16] Documentation: networking: Document the phy_port infrastructure
Date: Mon, 13 Oct 2025 16:31:42 +0200
Message-ID: <20251013143146.364919-17-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
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
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 Documentation/networking/index.rst    |   1 +
 Documentation/networking/phy-port.rst | 111 ++++++++++++++++++++++++++
 MAINTAINERS                           |   1 +
 3 files changed, 113 insertions(+)
 create mode 100644 Documentation/networking/phy-port.rst

diff --git a/Documentation/networking/index.rst b/Documentation/networking/index.rst
index c775cababc8c..915c27977756 100644
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
index 000000000000..6d9d46ebe438
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
+We also have info about the number of lanes and the PORT type. These settings
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
+other interfaces can do. In fact, we have very few information about whether or
+not there are any other media interfaces.
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
index ddd04d11ad65..05dc9ed637cf 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9272,6 +9272,7 @@ F:	Documentation/devicetree/bindings/net/ethernet-connector.yaml
 F:	Documentation/devicetree/bindings/net/ethernet-phy.yaml
 F:	Documentation/devicetree/bindings/net/mdio*
 F:	Documentation/devicetree/bindings/net/qca,ar803x.yaml
+F:	Documentation/networking/phy-port.rst
 F:	Documentation/networking/phy.rst
 F:	drivers/net/mdio/
 F:	drivers/net/mdio/acpi_mdio.c
-- 
2.49.0


