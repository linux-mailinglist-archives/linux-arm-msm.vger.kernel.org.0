Return-Path: <linux-arm-msm+bounces-47878-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E356A33C51
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 11:16:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A667D1888569
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Feb 2025 10:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AB8F2135CD;
	Thu, 13 Feb 2025 10:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="oOQOoYeP"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A24C420C025;
	Thu, 13 Feb 2025 10:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739441783; cv=none; b=AkmUmT/pLLAaComk5U9SeBUpEbrDqmVMd4JAb0Lv4WP+zmLbgWNwQAX1/ZnvJbaAas7o5Kh7kxCsHvLNfgiC5aKP9gpPJ7kRi1GfHmoDSMgYU/SFBrKyP6TtaqD5EgXRk6fqJc4rPI5hI5A3sNV8VCjjOTLrntbzBSX8V6qYVqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739441783; c=relaxed/simple;
	bh=NcxdzWaFRtm5hhlVZy52tBSn68g2eLjuGIVy0kExevU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=eCiJsYjbxnUj9WJV1w8l2mrabLZujNuVJBydwBA2dasgYvgLcVlU3rG4zckQXTQEV1SBQfH99uaZrg09/4g7YoK9Uax1Tvmj4DVv3yFHd0DTyvKTtlkUyH1XHqlaxclGCBVFkko1elF0CpAymQA2DTApqm1iqt4wpuIBAhjkV9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=oOQOoYeP; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 56E08432C6;
	Thu, 13 Feb 2025 10:16:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1739441771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=9o2+omNdwl7pn+f9aJf2ReLfcgZBqtNSCIp/aB+UDhY=;
	b=oOQOoYePI2BHFr6aw/VTMKuNcoE88uLFPhw81iQYXyoRdqtvMiqClnKI5O+uD1dXoeCYbT
	utRhYYScgER3ZiJYXgM0KHQzF9zNDY8Q1sMR6Q8Pdyp3TPXEbFzul9RiQUiTxQdt9OCVag
	D+eVhIhpS6Lz846fUvIwjnIGxtzEJpn0vhp9hfR7q8T+5QarPPRyweULqmCvqpfeDHp1nK
	2XfZIpejbNrdMW2BA6pJp0hGpDEC2XE8rSdMmzC9qFzj5tm6bUyz/XCi8KYkMtS+eGbrxh
	13BBY76uBsucjpVwwnWy33g3jNtPwsKbbs0H9qsLdo9xZuscvQe/iPm5fKsCUw==
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
	Sean Anderson <seanga2@gmail.com>
Subject: [PATCH net-next v4 00/15] Introduce an ethernet port representation
Date: Thu, 13 Feb 2025 11:15:48 +0100
Message-ID: <20250213101606.1154014-1-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdegieehudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfelieehgfffiefftdffiedvheefteehkedukefgteffteevffeuueejiedtveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegstgdvudemkeekleelmeehgedttgemvgehlegvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemsggtvddumeekkeelleemheegtdgtmegvheelvgdphhgvlhhopehfvgguohhrrgdrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepfedvpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrtghpt
 hhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello everyone,

This is V4 of the series introducing the phy_port infrastructure.

Previous version was incorrectly labeled V1, all previous versions can
be found here :

V3: https://lore.kernel.org/netdev/20250207223634.600218-1-maxime.chevallier@bootlin.com/
RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/

The goal of that work is to lay the ground for multi-port devices,
either using multi-port PHY devices, or MII-side multiplexers.

for now, that series only focuses on the PHY device aspect, and includes
no uAPI and no muxing support yet.

The key points from that series are :

 - The introduction of a dedicated object to represent a port
 - The introduciton of a new binding to represent these ports in
   devicetree, to accurately describe multi-port devices
 - The support of ports for PHY devices, including PHY-drivert SFP
   busses through a generic phylib set of upstream ops
 - The MAINTAINERS file was updated to account for the new files
 - Some documentation :)

Changes in V4 :

 - Introduced a kernel doc
 - Reworked the mediums definitions in patch 2
 - QCA807x now uses the generic SFP support
 - Fixed some implementation bugs to build the support list based on the
   interfaces supported on a port

Maxime Chevallier (15):
  net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
  net: ethtool: Export the link_mode_params definitions
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
  dt-bindings: net: Introduce the phy-port description

 .../devicetree/bindings/net/ethernet-phy.yaml |  18 +
 .../bindings/net/ethernet-port.yaml           |  47 +++
 Documentation/networking/index.rst            |   1 +
 Documentation/networking/phy-port.rst         | 111 +++++++
 MAINTAINERS                                   |   3 +
 drivers/net/phy/Makefile                      |   2 +-
 drivers/net/phy/dp83822.c                     |  71 ++--
 drivers/net/phy/marvell-88x2222.c             |  96 +++---
 drivers/net/phy/marvell.c                     | 100 +++---
 drivers/net/phy/marvell10g.c                  |  37 +--
 drivers/net/phy/phy_device.c                  | 312 +++++++++++++++++-
 drivers/net/phy/phy_port.c                    | 176 ++++++++++
 drivers/net/phy/phylink.c                     |  32 ++
 drivers/net/phy/qcom/at803x.c                 |  64 +---
 drivers/net/phy/qcom/qca807x.c                |  75 ++---
 include/linux/ethtool.h                       |  73 ++++
 include/linux/phy.h                           |  38 ++-
 include/linux/phy_port.h                      |  92 ++++++
 include/linux/phylink.h                       |   2 +
 net/ethtool/common.c                          | 250 ++++++++------
 net/ethtool/common.h                          |   7 -
 21 files changed, 1218 insertions(+), 389 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-port.yaml
 create mode 100644 Documentation/networking/phy-port.rst
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

-- 
2.48.1


