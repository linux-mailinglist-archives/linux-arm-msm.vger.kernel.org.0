Return-Path: <linux-arm-msm+bounces-81550-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D077C563D3
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 09:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 340EC3BA438
	for <lists+linux-arm-msm@lfdr.de>; Thu, 13 Nov 2025 08:18:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D346633D6D5;
	Thu, 13 Nov 2025 08:15:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mphzuckN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CCE33CE9B;
	Thu, 13 Nov 2025 08:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763021709; cv=none; b=RaMjgam8pWuWOOCfOMEysWgEZZI3Rd17ij8Wud2t76i/h6Dgt4zkGituU0yf+ePbX9aBhlYOd+F6krjUt1/qjiLQFZvju29WftmFSz5CvZFaMzMKcZmOsp3vNv0bUAGYEZEZLPCVTn3qjeZZ/MrM/g1xmn2zRQPkwVkIPSoCbGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763021709; c=relaxed/simple;
	bh=jDHc3RYKd/rI5pIOtsfSVxFIKI4XyWAdE7iTzFF3m08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dbw9zlYZwV0KMvnO59LPTQWXF+G/G/9RpRs0scdljCtoa+NFXCqfjSy4A+zl1Ez8KnYo0i+Cpc7iJrIsgt2u5vI1xU3VRRRVt5mPV+LTWInq7ljCkzygvIFtHR/xxkjWHsJeEiCiR2bW0uYLaXC2zd2z79f5dszsuxIlbNQNF1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mphzuckN; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 411F8C0F57C;
	Thu, 13 Nov 2025 08:14:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id E9B1C6068C;
	Thu, 13 Nov 2025 08:15:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 209A3102F2329;
	Thu, 13 Nov 2025 09:15:03 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763021705; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=YnNYO8L0BtsvOyJ4nBTDQ1EVaFXptqjUY4bRGjzlUhw=;
	b=mphzuckNQeISxLV/xn55U7tt683OopHKoi6XojkmYf5EtIlWYcZ4oUk9qm7DvBseBRy5UL
	WWVD2XsO8oOiuIZl9mYHt/NAG2wJTCjHpnITLgTX/NXaDHXGhgNC30YRZrdJMMSuB2cT1I
	KCAJRK8DuTi78HvLj8o5aSms85ua+SQoR7YtE6dxygIz8KDM/rJIOFtdhfM3dv7vu1XP4E
	zw6g12RTkCbWS5KjtXYuGQJ4RUcOPzkTBHhifbi2wPCEPifmEbLoxu138yhaTnTtW9pJoP
	zoK39ullKSQrzDXv5dFdysobvyXmMNsTp6v4rzRZLMpHYgbwWLUfwajBUvwa+A==
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
Subject: [PATCH net-next v16 14/15] net: phy: dp83822: Add SFP support through the phy_port interface
Date: Thu, 13 Nov 2025 09:14:16 +0100
Message-ID: <20251113081418.180557-15-maxime.chevallier@bootlin.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
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
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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


