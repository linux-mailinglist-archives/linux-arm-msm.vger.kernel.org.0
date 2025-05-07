Return-Path: <linux-arm-msm+bounces-57160-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C8EAAE212
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 16:10:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6073217F2FE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 May 2025 14:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4A5F628FFC0;
	Wed,  7 May 2025 13:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Fekx+S32"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18DC28FAAA;
	Wed,  7 May 2025 13:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746626061; cv=none; b=IhXhOWVRfMXh6Hy0RV0t5JzULhIYfB/I/bfUUuh27rtTG2gxsIp02BkMjJr5eVB3juOB0q4hLQ2xZARl4au9H83LJswbP2ejckU1FfjvvIHHkUHljkNvLMeYk1MKTeRKFV5Y+tnHQUQ7ztCyAHvGqcpxc73ORitQ2tdO7eJG2h0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746626061; c=relaxed/simple;
	bh=O5z/BQY1q1d5BGcnK4t8C3VeUk339DGeSWJDfh+cNwk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=exyugdLeO0wsjgnih6xv1ZOtWvGm+1zBpxVzfhjqwZiMvETRY3iw+/gNuc2Edc89PelrBI0IVTy5+MhJ0LEUKiykI+yvvwJNJqKsoD/zbFKl3fZ10BiBXda+Yau/37TP0Wyd7gYBw1LYY6CNWmWYenw4UC92Ci6FDkunvI3dH1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Fekx+S32; arc=none smtp.client-ip=217.70.183.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: by mail.gandi.net (Postfix) with ESMTPSA id 57D5543B3A;
	Wed,  7 May 2025 13:54:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1746626057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSutRnMqUMIEXyOwAwOUviPfYiWGrZpRNWmDiwUL5nI=;
	b=Fekx+S32dfTTViEYWwJ7hUKNLkkB7ewwhXKxjEhNO1w9gTQGWcrd3xAlkpEiQnlGzLth8Z
	eJi4mu08QHvIw3YBjOST+dIS2mJ9qJCCOfXd0uFfMQXucuq3Hmr6a2UqCAwMUBbmHw76Vi
	6KK8K+yGiXU34dolLqMhJonL1s/WIm9kG0e86JwuFt6qbdabvxm2EqZR0hpCTKlsWBH2xt
	P3BEA+FoUqfcBVpFz83U7XIRgzuDN9KJJKWOYBbaG0e7Uv2vxnP2glJX9JeObVK3WMcQMd
	GEIz0tWmmSKE4OUVn3926NAgLbGsLofkjMjt2HlAATN5r1FWubS1PNwwJ8flyQ==
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
Subject: [PATCH net-next v6 13/14] net: phy: dp83822: Add SFP support through the phy_port interface
Date: Wed,  7 May 2025 15:53:29 +0200
Message-ID: <20250507135331.76021-14-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
References: <20250507135331.76021-1-maxime.chevallier@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvkeejtdefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhmvgcuvehhvghvrghllhhivghruceomhgrgihimhgvrdgthhgvvhgrlhhlihgvrhessghoohhtlhhinhdrtghomheqnecuggftrfgrthhtvghrnhepveegtdffleffleevueellefgjeefvedvjefhheegfefgffdvfeetgeevudetffdtnecukfhppedvrgdtvdemkeeggedtmehfhedtsgemfedvheemrgeigeefmedufheiugemfhgvrgegmeegsgduieenucevlhhushhtvghrufhiiigvpedutdenucfrrghrrghmpehinhgvthepvdgrtddvmeekgeegtdemfhehtdgsmeefvdehmegrieegfeemudhfiegumehfvggrgeemgegsudeipdhhvghlohepvdgrtddvqdekgeegtddqfhehtdgsqddtfedvhedqrgeigeefqddufheiugdqfhgvrgegqdegsgduiedrrhgvvhdrshhfrhdrnhgvthdpmhgrihhlfhhrohhmpehmrgigihhmvgdrtghhvghvrghllhhivghrsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefuddprhgtphhtthhopegurghvvghmsegurghvvghmlhhofhhtrdhnvghtpdhrtghpthhtohepmhgrgihimhgvrdgthhgvv
 hgrlhhlihgvrhessghoohhtlhhinhdrtghomhdprhgtphhtthhopehnvghtuggvvhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdgrrhhmqdhmshhmsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhrtghpthhtoheprghnughrvgifsehluhhnnhdrtghhpdhrtghpthhtohepkhhusggrsehkvghrnhgvlhdrohhrgh
X-GND-Sasl: maxime.chevallier@bootlin.com

The DP83822 can support 100BaseFX. This mode was only accessible through
custom DT properties, but there also exist SFP modules that support
these modes. As this only requires setting the relevant supported
interface in the driver, expose the port capability with the new
phy_port API, allowing SFP support.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index a0b4ebddd484..194de35bd064 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -982,6 +982,13 @@ static int dp83822_attach_port(struct phy_device *phydev, struct phy_port *port)
 		}
 	}
 
+	/* If attached from SFP, is_serdes is set, but not the mediums. */
+	if (port->is_serdes)
+		dp83822->fx_enabled = true;
+
+	if (dp83822->fx_enabled)
+		__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
+
 	return 0;
 }
 
-- 
2.49.0


