Return-Path: <linux-arm-msm+bounces-36217-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id B43FC9B3B7C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:26:30 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 78D24282EC1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:26:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D52351E1C36;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ESbE2oFF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A0C81E0DBB;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147128; cv=none; b=mCpKOgeDt1SscHXMpEd5bM++/2V1nyVGLpzFuGZr6hB6rHabOaHkZt2/e8WhY40IPzm278CCXBlaHOzmV3wB6+zhjvGy7ws435ARm87zhVbDXPscP0c0TLNKHrjVE4DrBJ16ZpvmSYZLojKAi43BkDh4yXo5RPxnXr5iBfF7dO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147128; c=relaxed/simple;
	bh=VSzM/Aqzd9ydOVExBs00GoWTm8h9XaWLXTka7dAqxhs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KAGXCw7yo/RDWZQxsqjUuEbgTZxqDpsnMYANtg+WOadv1hU3TjfhuBb9RUjq2SigJz/4cfQSuirnybgA2ut9cfQoa1PZ6hioMOB6JnydScHVeZyeGK1l/PzV3JTCAIUNH3eq7Xha3NwF9Eiof43NPGqOnSA3stIqsmBewzXGX/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ESbE2oFF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 244E8C4CEED;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147128;
	bh=VSzM/Aqzd9ydOVExBs00GoWTm8h9XaWLXTka7dAqxhs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ESbE2oFFZ4YC5RbGAWT9SmLuBvkOxsN+QoaMiUH0P2f/SH7IC20iwXZdcCi8teNlP
	 Kfo60LBlbDGtFJmZE0lpkYwKedm/pFM4TpSFtVymm6Mj8L9GOTi2PAlXEvkQSSUyoc
	 Q6844LUsb6sBYngqitm2an3qOxq9Myd0oVxdpT/RXd71TfrXyTWbK3m79zd15GVUSj
	 +M5FNVk2rXQbP8Et0PtZGilPz3dB54yzPALy3WWiDHnOeh/fyrCF4sccyOh8Az/dY4
	 4Gj4zM+4pWkn+8tZC3JTEaWtaXB0HnnR/8/940UfKGKnevqC67Q5dHegl9j3tlMOC6
	 FbxZ+Ht7cbSTg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 176BCD5B148;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:51 +0100
Subject: [PATCH v4 09/16] net: dwmac-starfive: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-9-03618f10e3e2@oss.nxp.com>
References: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
In-Reply-To: <20241028-upstream_s32cc_gmac-v4-0-03618f10e3e2@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1184;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=YVAUfNddfX6I63XBPKwqSvyB5DYz6NCjgmmbUf+1q5U=;
 b=BNQoqbyvZT9P3j86kVabLJTJzgQIuXduLBqYyOVc+Gr57eySX+k4bMLPlCea2Wnk0yTGB40XE
 Kpa0XUJEeEKCefuPgwqKRWjDXkRskERHGBHAu3AcDeKK9W3sxNzc0n6
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

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
2.46.0



