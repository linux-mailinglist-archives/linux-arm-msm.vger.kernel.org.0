Return-Path: <linux-arm-msm+bounces-36226-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 071129B3B8B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:27:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B192F1F22C4D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:27:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 03AA41F7565;
	Mon, 28 Oct 2024 20:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mXiL75m+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38BBB1EE009;
	Mon, 28 Oct 2024 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147129; cv=none; b=fZxT+Uu6qS6OULZtyuZLnfCWMaD/si5UbjCFJyRtWDpv9yrmyxVcomrqFEM4b9CIQOzGsXAQciP6lEingsPiOsxMPRtVFo3dubpE4RMZpmsPZhEg+b7go9zEcbhnDMKICVULEyv7CFrKhJAOzX21yWgtf1yyoxs7qYTac7CZuIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147129; c=relaxed/simple;
	bh=GkMDbekZjB413spSTR0VjgfWteczHDggEgGysKXOZNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TyFOZrGRK7SntoZ/rLNjoM3MRYzTV9ZZYeT1O2Qne48iopp6aMwbKQ6nOr5x3U/3epTEP0Feugq0XWaE0H5XyhIvXZO+kvT5G7ZqR8TF5eVZDCZwmwhWf7WNAwI5u0si66LjwKHAZLVJpchcXJ56u2Ad4OIitouXrloTRUO1cJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mXiL75m+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 01E3BC4CEE7;
	Mon, 28 Oct 2024 20:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147129;
	bh=GkMDbekZjB413spSTR0VjgfWteczHDggEgGysKXOZNM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mXiL75m+E7K8jMEWIDyuSqebPihtWwF+37c9GSBFVphIYJPXs7Hls4umuBzGO8xyp
	 oOrUAycEYWUGuIovCuxndtWC8li5P5iTkne29rKP4C2cQrbnP2JmOXfXvSDLrl7i3b
	 3aM0ScUt04nmfnsv395mwpuXHtoLucOqQXN1mH20WZty17vT1Rs/0vSAdWE3Rh4Sy4
	 48lTbgc5FcKseURg5PFklQ+RZPNOuctBxBKDdjHsM9MhCXQhF49QgwkFt0Z1+WQp+1
	 WdJDX47zBffGlkj9cWvRsPxi9irNqLwVln3pi0+I+FNGlDOud17aF0d8fDKRZw1bwZ
	 y0GSB/mArNVPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3279D5B154;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:58 +0100
Subject: [PATCH v4 16/16] net: stmmac: dwmac-s32: Read PTP clock rate when
 ready
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-16-03618f10e3e2@oss.nxp.com>
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 Andrei Botila <andrei.botila@nxp.org>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1605;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=LsZsEsLk0S5TfmlHZCV6HTyBWNimPqjm1epTUQoYEEY=;
 b=UQ0dGVjkzm5GF1d8SPLrApbJm5eP1wcEFzCOmIZsO2S6Axeju/ihEdVNgR5Ymfi+y/1JYAjtu
 8gaokdVXYkrAPmWNLUbafaETbKpSQPUHkt0TuYOSgaxtqsEpslpq/0U
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

The PTP clock is read by stmmac_platform during DT parse.
On S32G/R the clock is not ready and returns 0. Postpone
reading of the clock on PTP init.

Co-developed-by: Andrei Botila <andrei.botila@nxp.org>
Signed-off-by: Andrei Botila <andrei.botila@nxp.org>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
Reviewed-by: Jacob Keller <jacob.e.keller@intel.com>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index fba221c37594..da2cdcfd0529 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -140,6 +140,18 @@ static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 		dev_err(gmac->dev, "Can't set tx clock\n");
 }
 
+static void s32_dwmac_ptp_clk_freq_config(struct stmmac_priv *priv)
+{
+	struct plat_stmmacenet_data *plat = priv->plat;
+
+	if (!plat->clk_ptp_ref)
+		return;
+
+	plat->clk_ptp_rate = clk_get_rate(plat->clk_ptp_ref);
+
+	netdev_dbg(priv->dev, "PTP rate %lu\n", plat->clk_ptp_rate);
+}
+
 static int s32_dwmac_probe(struct platform_device *pdev)
 {
 	struct plat_stmmacenet_data *plat;
@@ -195,6 +207,7 @@ static int s32_dwmac_probe(struct platform_device *pdev)
 	plat->init = s32_gmac_init;
 	plat->exit = s32_gmac_exit;
 	plat->fix_mac_speed = s32_fix_mac_speed;
+	plat->ptp_clk_freq_config = s32_dwmac_ptp_clk_freq_config;
 
 	plat->bsp_priv = gmac;
 

-- 
2.46.0



