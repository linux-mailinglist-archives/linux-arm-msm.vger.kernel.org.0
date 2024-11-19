Return-Path: <linux-arm-msm+bounces-38337-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 279C39D28E8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:02:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E17A9281BF4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:02:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90E9E1D0E01;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PvIvqPmM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DEA71D07AB;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028465; cv=none; b=NW5cvya2KOtDx2TLQforps4oor47ylkP3PDhuLXl/ciui+giPiIa/HcbJVNeyy5DliBYrRD6vnI5rq7pVWH7vIvpyT/O/duvOyKieHD5W5BxEmy7h+han9HV83DEXmwkr7YWLsqHKfUzATK7NBpbDc5q7gcUEfovqnJ3KedUAAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028465; c=relaxed/simple;
	bh=iVihXo58CtO4IGuy+SiR8hXCaTbK3CdRsA01yVjIYGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ARMNc+E1S4ldhwblVZvrSU87f4v4Umqg8qor+R0pi6hb0u3yMxq5+5N8bSoiZZW3Zot8APXYSs6qk3w/YxrGlMLLg9MPgSJbwS+IImtslRWz6JtP5InUsWLFAiwqBxwb0QxgPboNaIddNZGxHlTQyOTxXZ3HXf3YJen4PVRAFAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PvIvqPmM; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B7051C4CECF;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028464;
	bh=iVihXo58CtO4IGuy+SiR8hXCaTbK3CdRsA01yVjIYGk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PvIvqPmMxmJo18fVQIHoXLMG6dyx0Xb0jHu5FCH6LGuuKkEgNwCzZwelJZlcE8PbH
	 yNIDD4OQKXlDu8zXMshJC4cwJJXnwvYic/nKEYrO80F2UuLLFXF3cA/Y6ZELWCzEPR
	 1/nEaYetKnDif2UR6qAYoMxPDlk1jH5G3h04//cmfR+oe0lROlFYeMG6tsPB1N9ckJ
	 b8gY+lmD1bRukfVXReCXxm/pikN6CSVMEIKn3hw3+WSkZD7DBWb9aJ1AVMU9KhREFE
	 1RQRN3mrSXvNKrpDyFYD9qySS1KU55TTFRILoV2u4WG14kIwVEdHaBQOuPTX8/z1qt
	 9EWLuwKCiJr0Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4BCBD44167;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:15 +0100
Subject: [PATCH v5 09/16] net: dwmac-starfive: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-upstream_s32cc_gmac-v5-9-7dcc90fcffef@oss.nxp.com>
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=1227;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=bBoQpMQEMIZkvVLzY+cPIJeDILU+K5uktEDmkyEIirY=;
 b=VykuawcU4fgIfqEBtyRRZ3cazgs4UBBxKbDLVqgpAhgUdP/6Qn1gegY5BEGZUKsyvr94YnXk7
 rww5Y7nRP/7BWX2sZ6Amd/iuP7+bGvy0dogXTu0If44pwpnfdW8qdEO
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c | 19 ++++---------------
 1 file changed, 4 insertions(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 4e1076faee0c..d80461a721c1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -34,24 +34,13 @@ struct starfive_dwmac {
 static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct starfive_dwmac *dwmac = priv;
-	unsigned long rate;
+	long rate;
 	int err;
 
-	rate = clk_get_rate(dwmac->clk_tx);
-
-	switch (speed) {
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-	case SPEED_100:
-		rate = 25000000;
-		break;
-	case SPEED_10:
-		rate = 2500000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dwmac->dev, "invalid speed %u\n", speed);
-		break;
+		return;
 	}
 
 	err = clk_set_rate(dwmac->clk_tx, rate);

-- 
2.47.0



