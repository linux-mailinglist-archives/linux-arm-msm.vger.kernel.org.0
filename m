Return-Path: <linux-arm-msm+bounces-80562-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8576BC39F49
	for <lists+linux-arm-msm@lfdr.de>; Thu, 06 Nov 2025 10:58:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E803BAF36
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Nov 2025 09:52:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17B1D314B93;
	Thu,  6 Nov 2025 09:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Rm90rUTX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C41314A6D
	for <linux-arm-msm@vger.kernel.org>; Thu,  6 Nov 2025 09:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762422530; cv=none; b=pW3pwvhtFimFwjDEyAvYJblUdDDIxglOrH6rm26wcRYTROAtxOyUNWWbgySYQcpVoF3Xdm6hzirh0bR1ObTByWYnHefIUFyLx53IdQ2RpRw+YFZMnM0m6bIDuCeLP5PuYvosh6Stb/+Yh9ByC8FglyeMLvEi3mPkG3k2OI/fUQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762422530; c=relaxed/simple;
	bh=9NlM1Bn14f7wxaJKHpS5BCVRp0TeER0/UFu0cVmExXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AVxNTOuCeRby0Yu0wm/WsHl91REt2PqJ2/v6DdXMnf/p8c/Ld0Eaf8mE/vOiPyR56ewUTpq3g3pqW0LRubBQ4CDwEZrLY2ICWjyftiq0xMpD+oXStPhnL3Meyw3e5S7o9Ib5ZuotlqzPLSKYiyemFSWTet8mevdR4UbDTUmShw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Rm90rUTX; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id D15F64E41563;
	Thu,  6 Nov 2025 09:48:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A54256068C;
	Thu,  6 Nov 2025 09:48:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 92F421185081C;
	Thu,  6 Nov 2025 10:48:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1762422526; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=fmp4wafkdiIV9RPs6myiZuo5+ItcdF0jCaL0ZPt2pEA=;
	b=Rm90rUTXX/a/59DoOes3+Lj/wxongYZRRILzvl7nInUjluEJggIQIoguqdsC8JeMkOUmnX
	zoskFk6tzeRr8hHwE3r0XfWsnXJ2r35RYH6enGZPdNpVtd/bDdbnnI+xcRB4QamkkMwZwl
	DMclHXBOyf/hAfwrg9h3vWk1w60ECGHoKYwqgSmqO0JYWGiFpVj49USxepX2KT4bB8iGxe
	6E9bThX8fS6OYDkIiF6KXusJKFvZFdF2vxeSPgkElfwSoUtQkIAcMyS4lB5WSRGhi8qZFJ
	rAxCyCWujyn0S0o6UI++qdFVPLJJ2gKGgNC/C1UASaexq7Qo0iyTczJmHJGKVg==
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
Subject: [PATCH net-next v15 14/15] net: phy: dp83822: Add SFP support through the phy_port interface
Date: Thu,  6 Nov 2025 10:47:39 +0100
Message-ID: <20251106094742.2104099-15-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
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
Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
---
 drivers/net/phy/dp83822.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/phy/dp83822.c b/drivers/net/phy/dp83822.c
index c012dfab3171..f31b6d974d22 100644
--- a/drivers/net/phy/dp83822.c
+++ b/drivers/net/phy/dp83822.c
@@ -979,6 +979,13 @@ static int dp83822_attach_mdi_port(struct phy_device *phydev,
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


