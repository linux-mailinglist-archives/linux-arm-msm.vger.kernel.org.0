Return-Path: <linux-arm-msm+bounces-77031-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DD108BD39A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 16:38:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 934CA3BDEA0
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Oct 2025 14:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 37731309EFC;
	Mon, 13 Oct 2025 14:33:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="1OciSsQ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7615C309F04;
	Mon, 13 Oct 2025 14:33:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760366022; cv=none; b=RAXMWhmDNOtLmfudK9aINyA5E1bd9P0P3T6300JofyIqkxUgLZ3fHrIBiKQfqnHrv6OZ2vgQEKazVbbGs7MLxBWOEz0NfVSD0IXBTvTGE1YMTAhaACtTPkkNmXNC/s/9KlvWafUbYvPOyRNY9uELFwZoWsg8xzEcK2AxFIMxW8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760366022; c=relaxed/simple;
	bh=iZl8tqn5LprLuabLFXX9n2eq44tf5EIa8uMNG4aQCco=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sYMCAd2wAh/veLhi3MJ/dY9ezXAbHuZRw4GyzdLTT/g777buWBIEW+vogFGFpHr6nDZZ52fDWpMpQ04UBfT8HXbV99AwNmFkGgsGkBxIYSBElUxmYh/TiM24/R0h2y+kZac3PiZz4EXvEE21DowRqdETRebVafMkxmZwce3pASE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=1OciSsQ+; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 2E4ADC093AF;
	Mon, 13 Oct 2025 14:33:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 208C0606C6;
	Mon, 13 Oct 2025 14:33:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4D6B0102F226C;
	Mon, 13 Oct 2025 16:33:32 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760366017; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VMInU4rf/tUHep9iM23mnZEBLwbcWZpRZ70zqhXUaBY=;
	b=1OciSsQ+kLsaKJwONMjLwRMzuq9dU5MKYX8+xaW1RJbuE1tkj7ZDYaFNqlxamZ3w6fruo4
	FwfNRHFBERs/+fy8d0fpepW1BB5kNN7b8zhhxdBvlPPLiAOdPceAE1G86zOZOL6qyTgXW0
	Uo4iiyd3OxUYgPGvd3Sr8YAjYGa41YEl8jXaI/uoT4vsZlLCiDZzZRwnG8p4zZNI2SoxhB
	T8TfgWt2JyWsZTVomokWkPQm85/+mfzk6owOjuigmmnETCiDg1m4CBTudoJuWYqcmAcgZB
	MgQw2DLs0QjdbbEWn+TFjHQsHYaDmL1oD7u3Kc3xYHJvbl9UhkUWh9BcBOH+tQ==
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
Subject: [PATCH net-next v14 15/16] net: phy: dp83822: Add SFP support through the phy_port interface
Date: Mon, 13 Oct 2025 16:31:41 +0200
Message-ID: <20251013143146.364919-16-maxime.chevallier@bootlin.com>
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

The DP83822 can support 100BaseFX. This mode was only accessible through
custom DT properties, but there also exist SFP modules that support
these modes. As this only requires setting the relevant supported
interface in the driver, expose the port capability with the new
phy_port API, allowing SFP support.

Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Tested-by: Oleksij Rempel <o.rempel@pengutronix.de>
Tested-by: Florian Fainelli <florian.fainelli@broadcom.com>
Tested-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index c6e5b7244658..94036e5af242 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -980,6 +980,13 @@ static int dp83822_attach_mdi_port(struct phy_device *phydev,
 		}
 	}
 
+	/* If attached from SFP, is_mii is set, but not the mediums. */
+	if (port->is_mii)
+		dp83822->fx_enabled = true;
+
+	if (dp83822->fx_enabled)
+		__set_bit(PHY_INTERFACE_MODE_100BASEX, port->interfaces);
+
 	return 0;
 }
 
-- 
2.49.0


