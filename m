Return-Path: <linux-arm-msm+bounces-34224-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 15A6599BC24
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 23:29:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id BEF9A1F22743
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 21:29:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 76692165EF2;
	Sun, 13 Oct 2024 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gpqDgtor"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D51C0156F27;
	Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728854878; cv=none; b=SoG09Ef5XAXCKH9KRTg1awYFJU0NNjKdRV6bHpHf1FmFk6OgJmasbc4pLOHTN3t8GI/HPwETTEo+G9gm2g40ZSXIIc+XDgkb3mu97WqaYJ0S+fGZq5vL9246MBtI4UEeBYQcWHQNgmmZ2cMUlwEgs7maIL5KtgFy3TABEksTz5s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728854878; c=relaxed/simple;
	bh=miuoZAxa8gH/3bOfvp1cMVTbaTxNFTSxZIfvFfwUPUM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fc4VA9zSWtI9O8h1whEGYLVm8b2VdFfZ+zP1Ak5ndfJy5+hZUfUidiSHFc3kRl1zI7jzkxiHT9br3Bb9Uqs4025xnTXGxioFICM6Y9b8jsUGcqFwrU3VAFF4sbbv6NhseQuGMQGUdPmlfdI+pMno27xyie6OsxX+tNSOpLc6rPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gpqDgtor; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 85FEAC4CEFE;
	Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728854878;
	bh=miuoZAxa8gH/3bOfvp1cMVTbaTxNFTSxZIfvFfwUPUM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=gpqDgtorCPHLTzB65xW4+ivkmoVlzkK71rhjOT+774g5oMj1gSxIRH6GEbqfNujWf
	 63FoJReOsZelpYbJYcuehpTf0Sx9tH5fMBKvR5MEN1zJL02E9MwGUVIwnw+czLiysR
	 GTxtYPq+R5h3NhnkIJXxTLqblNjrTugsqg7ZbAA1ZlXtKoyC8GV9BqXMev4FDtA01G
	 NzBUM8WP6pc6CvtzsKMH8NSuXzPgXOH8MDRR73ccyu8rfmQiuaWeHjY272kjS8TGP3
	 SUbNebZ4aEnvnNQIsH0oPKziewb1zD4WtXzr7TL+8HD2WceiQFw8qT2CdZ5wyGZpoD
	 d+zyNHbVhu+Vw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B4E5CF2591;
	Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 13 Oct 2024 23:27:47 +0200
Subject: [PATCH v3 12/16] net: dwmac-sti: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-upstream_s32cc_gmac-v3-12-d84b5a67b930@oss.nxp.com>
References: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
In-Reply-To: <20241013-upstream_s32cc_gmac-v3-0-d84b5a67b930@oss.nxp.com>
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728854875; l=1868;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=JMTOl/4Rkgg8MzRxHwxEln56QmjXWHwbotmJcc4tZQA=;
 b=YhJIILVd9Eay9lSSnwFd64FJMwW3HOTjRBkTyLBmu9udYHtKm6H8zZSWkYwVISN+20AT+3McJ
 LyJfpw+HRj8BWnbs1e/dU/Jdsh+79q4Fyt735099z8GRUObyNjJiwOL
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

???

Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c | 18 +++++-------------
 1 file changed, 5 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index 4445cddc4cbe..0b02d079360d 100644
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
2.46.0



