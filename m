Return-Path: <linux-arm-msm+bounces-39000-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A10E9D78D3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 23:44:39 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 71EFA16368C
	for <lists+linux-arm-msm@lfdr.de>; Sun, 24 Nov 2024 22:44:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2C56191F84;
	Sun, 24 Nov 2024 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dO1OK+CH"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5A618FC70;
	Sun, 24 Nov 2024 22:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732488195; cv=none; b=pv8AKtQ1AswR8/GUtaCjRVBUxSY+yPHjR3FOBKtkyKeZQ2wZw0OgRtNBjS4avMHGQrDFMkP9zTyS8kVhx4JTns2M8gc/KlT/sa4wngCLhOfDoxGmtIyrCLSoVWf4yGJfSbiIWTZEa4+IlKRpZpWmv943uOwA1kO820dXlFLe2s0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732488195; c=relaxed/simple;
	bh=F4cbjF/9M6ITcKCkPhkzEDR5HNiIhwkdl+T79A6mE8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XqsicqAEOyI2lx346s+/sQU0268qNAquuc9ina6Jw16qTHlMXvsEf7e++ykllIr4wzul43/EqPYjlDqHp9hqFKBFVmERkJjbsAJ20GoD+ieIJwhg0l5P+OFst8+EYRaXVMHID9xuUIAGMNrY/Iwn3iIUKnqNfQewqh1OXVIEqmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dO1OK+CH; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B04F2C4CEFC;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732488194;
	bh=F4cbjF/9M6ITcKCkPhkzEDR5HNiIhwkdl+T79A6mE8Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dO1OK+CHRIdhUEKNX152EQe6yz1gpuk0jYB+JYyrquDutn4mIgCzmZF5KRa6ECRNh
	 Fmd3Hk2DeXmRmOQP1DbNFzjKNJoQtnvDObNd5On+Molg1phcI3N47JjdL6TbM7/fql
	 v9Kj4L7VW6XOD9fVep1QrS0IQFs/DXmGe562rLof2JNgrKMSDIKDvF6wTlrNO/ynuG
	 Tsi0atkBSVrdOIt+ZsIIQ4rxyzuPQuUF9qtvDSqb0hOZGoEvv1agNw8GJpo99IhXYx
	 w6ZMjSs0S8jTfgeBZTMDUqOUafIRBdEt/IjdwtBAn3NRMMRo8tSai7tCCG62+A1z2X
	 8bX2A+z4XhvoA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB7CD3B7C1;
	Sun, 24 Nov 2024 22:43:14 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 24 Nov 2024 23:42:43 +0100
Subject: [PATCH RFC net-next v6 12/15] net: dwmac-sti: Use helper
 rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-upstream_s32cc_gmac-v6-12-dc5718ccf001@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732488190; l=2017;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=E3dKlyRUyP013sEwa3YoW1YOIguttVezMK0ReGNP/J8=;
 b=7TI9v5gtH2+5g+ELTpHWN8eoSrIn96kvVzQMjpQ1goz/OqMYGm8aibb0Nlkrxap2hSB6FoSZZ
 Jb5xHhKopt5ChRc+N67Pf6oDqDHiU6a3BPeD4hgYAmLLZ5Cbu+HtJX2
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Reviewed-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index a6ff02d905a9..eabc4da9e1a9 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -21,10 +21,7 @@
 
 #include "stmmac_platform.h"
 
-#define DWMAC_125MHZ	125000000
 #define DWMAC_50MHZ	50000000
-#define DWMAC_25MHZ	25000000
-#define DWMAC_2_5MHZ	2500000
 
 #define IS_PHY_IF_MODE_RGMII(iface)	(iface == PHY_INTERFACE_MODE_RGMII || \
 			iface == PHY_INTERFACE_MODE_RGMII_ID || \
@@ -140,7 +137,7 @@ static void stih4xx_fix_retime_src(void *priv, u32 spd, unsigned int mode)
 	struct sti_dwmac *dwmac = priv;
 	u32 src = dwmac->tx_retime_src;
 	u32 reg = dwmac->ctrl_reg;
-	u32 freq = 0;
+	long freq = 0;
 
 	if (dwmac->interface == PHY_INTERFACE_MODE_MII) {
 		src = TX_RETIME_SRC_TXCLK;
@@ -153,19 +150,14 @@ static void stih4xx_fix_retime_src(void *priv, u32 spd, unsigned int mode)
 		}
 	} else if (IS_PHY_IF_MODE_RGMII(dwmac->interface)) {
 		/* On GiGa clk source can be either ext or from clkgen */
-		if (spd == SPEED_1000) {
-			freq = DWMAC_125MHZ;
-		} else {
+		freq = rgmii_clock(spd);
+
+		if (spd != SPEED_1000 && freq > 0)
 			/* Switch to clkgen for these speeds */
 			src = TX_RETIME_SRC_CLKGEN;
-			if (spd == SPEED_100)
-				freq = DWMAC_25MHZ;
-			else if (spd == SPEED_10)
-				freq = DWMAC_2_5MHZ;
-		}
 	}
 
-	if (src == TX_RETIME_SRC_CLKGEN && freq)
+	if (src == TX_RETIME_SRC_CLKGEN && freq > 0)
 		clk_set_rate(dwmac->clk, freq);
 
 	regmap_update_bits(dwmac->regmap, reg, STIH4XX_RETIME_SRC_MASK,

-- 
2.47.0



