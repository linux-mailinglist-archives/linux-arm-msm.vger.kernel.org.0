Return-Path: <linux-arm-msm+bounces-34227-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3380199BC2F
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 23:29:43 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EC1832816D7
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 21:29:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 089641990D3;
	Sun, 13 Oct 2024 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOBQviP8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7BB18453E;
	Sun, 13 Oct 2024 21:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728854879; cv=none; b=Yujhdl/M31VDNB11SMCtNRHH7YTQRr4NdteZEU01o3hwAiYtZW+NAoPytVfiRGqL0K4aVj7g/NMMwYxCH+vjQ8r8bPYz0tLOV9JkP718E+Gp2t57Q6ZL4EqaLbX/OIBdEge90jH8AW9fSu1qETe/8C2LDLkQByaWQXCQ4krzkUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728854879; c=relaxed/simple;
	bh=B8D4rtkDCUvIgkAJnwHDrRoK8VWaANfpHt6JnSqvkNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YXnpbBOxc8MisM50i1dHAloZlllck4WDNbF6MQXMMG57qFtY4sQT0yFoAcx2a2yKPppMMOqPu/GqtllW80KYSZW7ncPRamXSLRsxQP26Fi56TmOpEYJ2jSU0yoY16YVMe1PG/ZgWWAyqbrzcM0JuSLKFpGWCxs/uVn0qDkYS7Gs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOBQviP8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DD119C4AF0D;
	Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728854878;
	bh=B8D4rtkDCUvIgkAJnwHDrRoK8VWaANfpHt6JnSqvkNo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QOBQviP8pMyYkocR/dYrePt3TOxF4ryOhIhqa7EhFJ+oZKOXdFimXxr3Z8xlRkHDl
	 3gpA26xp/W//S5FmRR+H8heZsOICERBXxEtwI4HqDenNgdYcP2bwih8folFnqWd6If
	 rI6ygSGPlP4WEjnmJX4Rts00i8Iqd/EGOzL0AalOubPmQ1MV2ryaCdBy1zqi7Lqek3
	 OJD42OnQW+EHMPPTTSZUaqE4ELQpZhpx9di5QlFxV4OOgt6xNnjyJqFhsYWjzVjHIR
	 wwXjR0HOBzHMViLTGv//IqsRBIb40n3AOOgU57o0jaZw2Z5Dl4HQ0PWTpTlg0kl24H
	 r8rnt5g4UVXwQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD547CF2591;
	Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 13 Oct 2024 23:27:51 +0200
Subject: [PATCH v3 16/16] net: stmmac: dwmac-s32: Read PTP clock rate when
 ready
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-upstream_s32cc_gmac-v3-16-d84b5a67b930@oss.nxp.com>
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
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>, 
 Andrei Botila <andrei.botila@nxp.org>, 
 Jacob Keller <jacob.e.keller@intel.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728854875; l=1605;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=yghcsP0rT1E+KchKPuX8DbIOCwUwU33DKX66yshrGiI=;
 b=rlFKSP5vX/qcXmdlWd4FXmmlRdEmQ1yeJaLvdVoYW0pouWkcfUFvPcxCrMwVsedbS365JSzZB
 h+dQP6P/jtsBNIya5JLVNWMXWpGB7PDdgKlyqw+3OjugSO34ce4lc7a
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
index aedd6bf80684..3daf282d8da7 100644
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



