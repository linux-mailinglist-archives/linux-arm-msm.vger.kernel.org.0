Return-Path: <linux-arm-msm+bounces-36220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 422029B3B73
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0CB991F22C23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:26:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 140E21E7C1A;
	Mon, 28 Oct 2024 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1q8JgJY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48181E104A;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147128; cv=none; b=WkNXM4XWyPQdjYCFL/q+KCGjoatUEdYUgY/Mg+T3WVEYyRPY+AwMSux9QtURWawHdKTJD+cMhpe2AMIQVnKIwH1iem/JapZ67msY4qQgtI8/D1ONFNJdw2fxbSBUUiUu7pVo9sNKisJTkSyvnGbJmUgXLgRopJZeRdhvDClHs9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147128; c=relaxed/simple;
	bh=XeWbUqW/+n7Y7W09gE65f3ElGGk8pXK2D2Agi9k8Udw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mncEnKD6Ej8PKiESWuQYnTJ2qkj/M+9esnIAt4gBeDC6X6FCeZSsZgYs87OWbqvZwdCkWylOkhkwyB6B5nmlYhMQx3Stw3S2kzHShO5MW+LeqG71jOM89qDkk9DjGgGOYhmLwetgsLYEB2i/jJJ8+FJ/JrWmcjFhM8o88+cOEmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1q8JgJY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CF1AC4CEE9;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147128;
	bh=XeWbUqW/+n7Y7W09gE65f3ElGGk8pXK2D2Agi9k8Udw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=D1q8JgJYYEpMVU+3S0Tv3xMqVFqqkVLmvFOPox3AYRD6jmA4rdHkNILi1k4gYghNZ
	 Cr34UGdd3omZPPRRq5Uy4qsTv1TJmDGCfGN4Nge5Wdqe3Tav/gGbLYOMg0lw9SvtaU
	 T99BawblYIBtZ1p1BZ5dLq+W8SIzbn4/PbjV3X5S+PpfP6aFw1t7ImPKcDF/mLkKdm
	 K6l/skNVlNdC9ioP6ygXoZ59YJ8jnUH9FT8XykG2fKrHWl7q4cRU4KVBFFOkYQVly0
	 Z2k+yHiAlmtHHK6iQWqm4LFjd6jWBxSadC0umccqccGvlltUrJJ3AVcv+bSpX88JQ0
	 6qAS3IYjVCkYg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F40ECD5B14E;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:50 +0100
Subject: [PATCH v4 08/16] net: dwmac-rk: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-8-03618f10e3e2@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1665;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=p818FBc7h3Q76HlCUWlShPBCXFvDmTCoSOPi3/tS6SA=;
 b=TJVMimqq1u4CFzpQYu/wodYi6KnQAaB6hrxTPbXvNPBkFoqi9J1Ilc7N3I9KL7asfPVO6W4r7
 lT3pA9y1zYrAOGU2wIYg0abWf4aLHoDZEKmnyOE0yv4rsGjyJLUvOHv
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c | 30 ++++++--------------------
 1 file changed, 6 insertions(+), 24 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index 50073bdade46..2fd650b3bc5c 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1079,20 +1079,11 @@ static void rk3568_set_gmac_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
-	unsigned long rate;
+	long rate;
 	int ret;
 
-	switch (speed) {
-	case 10:
-		rate = 2500000;
-		break;
-	case 100:
-		rate = 25000000;
-		break;
-	case 1000:
-		rate = 125000000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dev, "unknown speed value for GMAC speed=%d", speed);
 		return;
 	}
@@ -1540,20 +1531,11 @@ static void rv1126_set_rgmii_speed(struct rk_priv_data *bsp_priv, int speed)
 {
 	struct clk *clk_mac_speed = bsp_priv->clks[RK_CLK_MAC_SPEED].clk;
 	struct device *dev = &bsp_priv->pdev->dev;
-	unsigned long rate;
+	long rate;
 	int ret;
 
-	switch (speed) {
-	case 10:
-		rate = 2500000;
-		break;
-	case 100:
-		rate = 25000000;
-		break;
-	case 1000:
-		rate = 125000000;
-		break;
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dev, "unknown speed value for RGMII speed=%d", speed);
 		return;
 	}

-- 
2.46.0



