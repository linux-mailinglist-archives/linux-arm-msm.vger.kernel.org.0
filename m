Return-Path: <linux-arm-msm+bounces-39957-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3519E0E62
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 23:03:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E925B2827F0
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Dec 2024 22:03:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 268531DF993;
	Mon,  2 Dec 2024 22:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bz/JxYz3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBAD31DF759;
	Mon,  2 Dec 2024 22:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733177025; cv=none; b=IHX8GTB/S4nUSG3VYZ1mw25gPQ2wCXC/LCDLfMNwL/ro/eeE6lFlfBvVsDFddM2DZhbTPwomcUl+obGJrSt3G6+uzUTLsDs7XjUBLz4rDYDCiU76huiJT9d3y53v2lWvYoe1iTuXWQGZ7WJFuyZsREkHIovdRvLKaU1yWw+D4Ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733177025; c=relaxed/simple;
	bh=qT18XtbzllFJO6K/EGbpIUkVOz74iHPo6IUZe3P4fQc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lVZzlvyRmsdPfTyhGnxGXHtPzK5jx1/GX4tJL0WE/tgm8u9dYcWc3G/V7mbKB9tdJ0FhtJtwpd62XCXXeRsaqtmYjWJR2KiRhC3lvdlVMnkZgYmizIOgmnyEpDb4AKL3UHFd27fqJuipFQEUXF6MeV2wz7/JVeuErg6YW8eA7NA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bz/JxYz3; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 83AB3C4AF15;
	Mon,  2 Dec 2024 22:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733177024;
	bh=qT18XtbzllFJO6K/EGbpIUkVOz74iHPo6IUZe3P4fQc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=bz/JxYz3eyi1DhpbrkglrRzAgfLElTXav/19j3GXNtp9SZKMkT0FbRY4kdp/8LZkc
	 iQZ6sWk6qhKcy5iPHVNu150Hq+ybHvOrrexkJ7axObU7AAF8dRPn5jRrFWt1LDWmt7
	 w+31n7cHdbE/wf6G9niNqiYv5fHO5d7swxbpmJpAz+g3U3+o6ep/8d9uIn5GeQTEal
	 B7mvhWI+P3l54DcUQLiGcraB7ibaDn1sM3Sw3Bmj2k8I/gruj2d5ek5yMdi0w62KJs
	 UXkFboGXWZQTGEiOGHJwpXyOlkIp/Iud7FZM0u1XRPEygZ86pX2uKSfW31fLhuMPxx
	 7JCZLiSzH9wgw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 742CCE69E92;
	Mon,  2 Dec 2024 22:03:44 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 02 Dec 2024 23:03:43 +0100
Subject: [PATCH net-next v7 04/15] net: phy: Add helper for mapping RGMII
 link speed to clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-upstream_s32cc_gmac-v7-4-bc3e1f9f656e@oss.nxp.com>
References: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
In-Reply-To: <20241202-upstream_s32cc_gmac-v7-0-bc3e1f9f656e@oss.nxp.com>
To: Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Emil Renner Berthing <kernel@esmil.dk>, 
 Minda Chen <minda.chen@starfivetech.com>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Iyappan Subramanian <iyappan@os.amperecomputing.com>, 
 Keyur Chudgar <keyur@os.amperecomputing.com>, 
 Quan Nguyen <quan@os.amperecomputing.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Giuseppe Cavallaro <peppe.cavallaro@st.com>, 
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 0x1207@gmail.com, fancer.lancer@gmail.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733177022; l=1509;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=3exSjKEVuojsQxBeLN9HdAigOEc+2YUOvrl9BYstKAs=;
 b=G3P71RfPl33hdVrDlllnb16IbsYPoOcbVUfjx5BRK9sLuAk1f23ksXhvEFKSyHDK31XhRAOK2
 U1oVgeCKwORDNS5e53cGGVvj7ThJyNr6urmK7ABSgVasVuimT0ur8iv
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The RGMII interface supports three data rates: 10/100 Mbps
and 1 Gbps. These speeds correspond to clock frequencies
of 2.5/25 MHz and 125 MHz, respectively.

Many Ethernet drivers, including glues in stmmac, follow
a similar pattern of converting RGMII speed to clock frequency.

To simplify code, define the helper rgmii_clock(speed)
to convert connection speed to clock frequency.

Suggested-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 include/linux/phy.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index 563c46205685..a746f056ed57 100644
--- a/include/linux/phy.h
+++ b/include/linux/phy.h
@@ -298,6 +298,29 @@ static inline const char *phy_modes(phy_interface_t interface)
 	}
 }
 
+/**
+ * rgmii_clock - map link speed to the clock rate
+ * @speed: link speed value
+ *
+ * Description: maps RGMII supported link speeds
+ * into the clock rates.
+ *
+ * Returns: clock rate or negative errno
+ */
+static inline long rgmii_clock(int speed)
+{
+	switch (speed) {
+	case SPEED_10:
+		return 2500000;
+	case SPEED_100:
+		return 25000000;
+	case SPEED_1000:
+		return 125000000;
+	default:
+		return -EINVAL;
+	}
+}
+
 #define PHY_INIT_TIMEOUT	100000
 #define PHY_FORCE_TIMEOUT	10
 

-- 
2.47.0



