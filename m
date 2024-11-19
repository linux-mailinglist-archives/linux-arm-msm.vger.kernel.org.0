Return-Path: <linux-arm-msm+bounces-38331-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 21BE29D28E1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:02:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7E01AB2C2E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:01:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1C7B91D043D;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Cjb8vBoW"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5D31CF293;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028464; cv=none; b=BVCLI/Li7xfkZrneu54nDsFOPn/aOIVfvGO9nDpWDFwWBr85pxaUYHDEpPnuDDsvJmr4H4K7jya66/4tYKpJXUS720wBgSvsAsYsNoJZ0SUA9CdJp3Ka7a/fQb4+5RvEuTRSqxOr5o9gT7ZpZIJy0WT0vzAMkOH16qOdaGzdQZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028464; c=relaxed/simple;
	bh=6xMLlIpSN0JBvla5nTP1dqcG6Ed1UwqOOxwMgbKzQ0A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qACUdn8nTWYYt53dcb0ucMcsolR5gZMP09Go6us95tVuEl99RYC5rywVPbs7zLQMh+2PfTkhXZntbL+yKrsrvFm/GUNzAXibW92N1v0oFKYoCEpTH6NtGxk8MeHORoqn1M4LFVIzR9P8VqANK1DYsR0WqI2JbG0rhzLK4ZVFP+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Cjb8vBoW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4F7F5C4CEE0;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028464;
	bh=6xMLlIpSN0JBvla5nTP1dqcG6Ed1UwqOOxwMgbKzQ0A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Cjb8vBoWvTq7UCm8IA2PWVqLbNSVrqjByOM5WR/sCrWEg+eGO7VD85jZmsotPVpL+
	 JMSzlg5q1ty/1SFQUGC7VRDSam04nEeag4ccEUbPCj1LjPX5Dn1bLOZ5h/cAbWLSIS
	 pV8pUMxb0sLr5aJrxrTIWXRqBaugh7U6RhWz0o834ZzuF4LSnIaZoGMKIB7ifAnEC3
	 5xgM49YuW69HyCqvMkDbt/3uLeEQK5sU9ff29wmwhDQrxQiMEXH5UktmsOvuZes5QV
	 1Q9ABK+pa3veCWQpGYnVV7vBGFo/gvOGyi/6a3SV9EouZpO/xwn2E6eMpC4HSWwphB
	 OfPgczluSJb7w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43740D44166;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:10 +0100
Subject: [PATCH v5 04/16] net: phy: Add helper for mapping RGMII link speed
 to clock rate
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-upstream_s32cc_gmac-v5-4-7dcc90fcffef@oss.nxp.com>
References: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
In-Reply-To: <20241119-upstream_s32cc_gmac-v5-0-7dcc90fcffef@oss.nxp.com>
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
 Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org, imx@lists.linux.dev, 
 devicetree@vger.kernel.org, NXP S32 Linux Team <s32@nxp.com>, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=1444;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=9P0ry2iOu969sx+k09VLkaOhf19TsKhJriPqamf/d5Q=;
 b=3x1pZvA190M4/JSVKA6683Fqp6WmSzqEWmYvvett/32O9XyIAaAkbscj0re5YlXILhFY1HZEn
 +qAywTHv1c2BOioB2wL4dAHT4KiTNVvLwyHWaBz2kKoAR8J4QSJ4x9D
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
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 include/linux/phy.h | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/include/linux/phy.h b/include/linux/phy.h
index a98bc91a0cde..e28c971d7616 100644
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



