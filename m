Return-Path: <linux-arm-msm+bounces-38991-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id D2A799D78BB
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 23:43:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 551F8B23AB8
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 22:43:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8E7E18BC19;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="shGXhO9q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7095B17F4F6;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732488194; cv=none; b=oKfKx7NIEyiYMWVOtXJ11J3OCnTpQX9yBASNbxLW0a9O3f6e3nqq5KzGilEhdFRPjsYmzL/X4itcV29eBybkQXuVvouZNJmqgBY2zR6qLeiWZF+9PJANRSmyr7wB9W1eFk14vK9vQ9QVXejCbNEvRn8dKrVxNzZ3Y6S1XMefAGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732488194; c=relaxed/simple;
	bh=ASdzTe34Z+d59Brp4wy1vpf4xly9YpxzqxiqU7BbVP0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mDZNarFmRwinZMIAy5AqS3PEOUZwiebrNderK+AVY4eHDVOEYz28U2d/4xFBCnAJJAvQi0Pj9V1ZlSLVsCD53M9swI4jk1MFudxC1cVu5reYfFOZEcp0e00gfaSWBIyvA4ByHMTFp4krRCZzvCQwyYK+SHuotabTGkK8TXYo7jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=shGXhO9q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EDF25C4CEE2;
	Sun, 24 Nov 2024 22:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732488194;
	bh=ASdzTe34Z+d59Brp4wy1vpf4xly9YpxzqxiqU7BbVP0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=shGXhO9qj4Vod1iK+HMfXSDtqQM9s5/H9cVNvy9RVzvhnza9IjZ027ogdED4byS5t
	 s+MJfWb+EDnSjLCrQE2wkRMpy2r+OT48KiIvxre5hd/5jRTpuVzNTGxXvleFFsPJ/s
	 twNYGcGnOdfSSA4U92WGbF+F1BfSSTx/aUIHBvq4PQDUQFMgjgmiU+yahbdvA2m3BP
	 OwzxwkFlUzZuQyGMhKzAMDNxInvEU0t75cAPpm0UB+6r/9H+SXmRUZ+u0b+E1UutWI
	 xX+WUhbR06ib5z6Rv1oYqcUunJUV5uebXwulyGyLs5F+WHyZqfwE2Yi1KUDX4nKw7n
	 ZgYsYAVZZsJSw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9EED3B7C4;
	Sun, 24 Nov 2024 22:43:13 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 24 Nov 2024 23:42:35 +0100
Subject: [PATCH RFC net-next v6 04/15] net: phy: Add helper for mapping
 RGMII link speed to clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-upstream_s32cc_gmac-v6-4-dc5718ccf001@oss.nxp.com>
References: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
In-Reply-To: <20241124-upstream_s32cc_gmac-v6-0-dc5718ccf001@oss.nxp.com>
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732488190; l=1509;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=fpWmpczGATKRZSZUfvD41WjUjGR83jNPIPJUZeOtjsk=;
 b=n+FUBIb08C4MW29U1TwIN+jAnwb5gQDX3x+iM8uBEh3wGvLkmbG8sYsamLmxZ3aCohoJLLMAT
 Zv6nMCNB+zzDPC7y7MBxFnFTGp/4Qv7JsyO2YTO7YrQKqRXCBCU24Ks
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
index 77c6d6451638..9d0717ccd5c0 100644
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



