Return-Path: <linux-arm-msm+bounces-47189-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E960FA2D095
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 23:36:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 0EAAE3A53C8
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Feb 2025 22:36:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D0291C6FE3;
	Fri,  7 Feb 2025 22:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Oj5IOMmD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 212251AF0AF;
	Fri,  7 Feb 2025 22:36:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738967804; cv=none; b=HbFAbsriWoxisoT1TRlh2oKrPJGIYPcXeugkzNYv4URmfP4Sqz1Ax7RmE8rmQNM8U8q3QwPWCvJYnhVBFleayBSxXm66y817PxT1WOwFkbXPQnPU0ChMVqVMnpduqH3EEm+HFi9AkO5WenAvJ3fnSmZ7nq4dLXanFu+zVbG7ULM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738967804; c=relaxed/simple;
	bh=JcPOtbgbKeDaS4DvcJp6F3ci6cvBPUftD+2nYWb9K1E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NdGyAU3fKs0GJblTyzvhVgOR89oHT1axQ23ps4/KRXHEz4B1apZ0Oq2JTy5gK8YhDtrUZOJMwDGPEH2DACz2iirF+cYtdV/wPF4i4njgtNJaQn8qEWILSJHYsz+VhRwM462kPkdKeasIPZaoMIZidQ6Fwniri+W0FBuyiNHae94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Oj5IOMmD; arc=none smtp.client-ip=217.70.183.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE0081F764;
	Fri,  7 Feb 2025 22:36:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1738967799;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=aeS9ms0L/tpy0n1PyXfynu+TBzCT9lzEY+i6oauUQKM=;
	b=Oj5IOMmDX3kJNTk6si1ypIGg5ODDeMPmZ7Smh8p/n0bbkkI1rsvFHU6vY5tSXTAuOn/fAj
	DnU6cvpm08V1lqYu+Wuf9Auc/M0Ab1jZMg0z+C2AjqkyCdBcxz3PY/tk6fKSwGCcDrGKkD
	5N+GZXPMhAs3dQtfbik07mSFeiEOrmeVtDBx6axecHiLIecZ5vWqxLZeSfTydgFn8jNFc4
	0OvhN1D/S7KdtwEKORRiSdXoiXGFrailNB8vsbo/ximndRZH7TBLDD4uOimdnNI+fatlwd
	3d3FoDTcXM5rLwE2QAZsBNkX3wOfPkeBy/y8UL4rhe4yycCo/ahctvdYCO0fJw==
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
	Romain Gantois <romain.gantois@bootlin.com>
Subject: [PATCH net-next 00/13] Introduce an ethernet port representation
Date: Fri,  7 Feb 2025 23:36:19 +0100
Message-ID: <20250207223634.600218-1-maxime.chevallier@bootlin.com>
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
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftdehtdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepofgrgihimhgvucevhhgvvhgrlhhlihgvrhcuoehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeejhfelieehgfffiefftdffiedvheefteehkedukefgteffteevffeuueejiedtveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvrgdtudemtggsudelmeekugegtgemlehftddtmegttgeftgemgeelfhegmeefieehheemsgehjeegnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepvdgrtddumegtsgduleemkegugegtmeelfhdttdemtggtfegtmeeglehfgeemfeeiheehmegsheejgedphhgvlhhopehfvgguohhrrgdquddrhhhomhgvpdhmrghilhhfrhhomhepmhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomhdpnhgspghrtghpthhtohepvdelpdhrtghpthhtohepuggrvhgvmhesuggrvhgvmhhlohhfthdrnhgvthdprhgtphhtthhopehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhrt
 ghpthhtohepnhgvthguvghvsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqrghrmhdqmhhsmhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghomhdprhgtphhtthhopegrnhgurhgvfieslhhunhhnrdgthhdprhgtphhtthhopehkuhgsrgeskhgvrhhnvghlrdhorhhg
X-GND-Sasl: maxime.chevallier@bootlin.com

Hello everyone,

This series follows the 2 RFC that were sent a few weeks ago :
RFC V2: https://lore.kernel.org/netdev/20250122174252.82730-1-maxime.chevallier@bootlin.com/
RFC V1: https://lore.kernel.org/netdev/20241220201506.2791940-1-maxime.chevallier@bootlin.com/

The goal of this series is to introduce an internal way of representing
the "outputs" of ethernet devices, for now only focusing on PHYs.

This allows laying the groundwork for multi-port devices support (both 1
PHY 2 ports, or more exotic setups with 2 PHYs in parallel, or MII
multiplexers).

Compared to the RFCs, this series tries to properly support SFP,
especially PHY-driven SFPs through special phy_ports named "serdes"
ports. They have the particularity of outputing a generic interface,
that feeds into another component (usually, an SFP cage and therefore an
SFP module).

This allows getting a fairly generic PHY-driven SFP support (MAC-driven
SFP is handled by phylink).

This series doesn't address PHY-less interfaces (bare MAC devices, MACs
with embedded PHYs not driven by phylink, or MAC connected to optical
SFPs) to stay within the 15 patches limit, nor does it include the uAPI
part that exposes these ports to userspace.

I've kept the cover short, much more details can be found in the RFC
covers.

Thanks everyone,

Maxime

Maxime Chevallier (13):
  net: ethtool: Introduce ETHTOOL_LINK_MEDIUM_* values
  net: ethtool: Export the link_mode_params definitions
  net: phy: Introduce PHY ports representation
  net: phy: dp83822: Add support for phy_port representation
  net: phy: Create a phy_port for PHY-driven SFPs
  net: phy: Intrduce generic SFP handling for PHY drivers
  net: phy: marvell-88x2222: Support SFP through phy_port interface
  net: phy: marvell: Support SFP through phy_port interface
  net: phy: marvell10g: Support SFP through phy_port
  net: phy: at803x: Support SFP through phy_port interface
  net: phy: Only rely on phy_port for PHY-driven SFP
  net: phy: dp83822: Add SFP support through the phy_port interface
  dt-bindings: net: Introduce the phy-port description

 .../devicetree/bindings/net/ethernet-phy.yaml |  18 +
 .../bindings/net/ethernet-port.yaml           |  47 +++
 drivers/net/phy/Makefile                      |   2 +-
 drivers/net/phy/dp83822.c                     |  71 ++--
 drivers/net/phy/marvell-88x2222.c             |  96 +++---
 drivers/net/phy/marvell.c                     | 100 +++---
 drivers/net/phy/marvell10g.c                  |  37 +--
 drivers/net/phy/phy_device.c                  | 307 +++++++++++++++++-
 drivers/net/phy/phy_port.c                    | 176 ++++++++++
 drivers/net/phy/phylink.c                     |  32 ++
 drivers/net/phy/qcom/at803x.c                 |  64 +---
 include/linux/ethtool.h                       |  73 +++++
 include/linux/phy.h                           |  39 ++-
 include/linux/phy_port.h                      |  92 ++++++
 include/linux/phylink.h                       |   2 +
 net/ethtool/common.c                          | 231 ++++++-------
 net/ethtool/common.h                          |   7 -
 17 files changed, 1048 insertions(+), 346 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/net/ethernet-port.yaml
 create mode 100644 drivers/net/phy/phy_port.c
 create mode 100644 include/linux/phy_port.h

-- 
2.48.1


