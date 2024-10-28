Return-Path: <linux-arm-msm+bounces-36215-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 335C09B3B6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:26:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 57C691C221A7
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:26:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C2EDF1E133E;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qeX0+YaK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE9B1E0DB1;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147128; cv=none; b=ZrKFOuIg00JpSpXh5Q9sCGX/4MOxtc0Ra/ioWzSozzudfncY0hIkuJ92JcfEG9vC/1M0utqsnCLD+TYCaOpw9WHKMwTqNGSeK2t2EtbNqoIIzVaqNcerh2QGQwcFHNA/EJvNkY2nM8cHaTpioJK3dZ4KMqDm8f2LtyFmnXNphF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147128; c=relaxed/simple;
	bh=x9YYgAZ15JSdW22tDM7dkLfbcgZsmaNFRbtvGLiwf60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=bwVvAw5/PWNCpSFmRnrwop8be0xSEhfvbY+5TLNlL/Jhit6361JYviL2gA6Rv4qxSUqUlNzgvKD6rUcWeIn97xTI8kmKnDs7Rxfb1GbGWw3s/b2kRMvnDcCKf5qZ1ziMIPqe2ktnlA4R+F97y9P3FrdsYxdAoo8xFBI7X985gLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qeX0+YaK; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id B38C0C4CEF8;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147127;
	bh=x9YYgAZ15JSdW22tDM7dkLfbcgZsmaNFRbtvGLiwf60=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qeX0+YaK8EbVPzaFglwKWjf4e90hXL/NMsU4JTxbLbzhY2Zcx27fFvwlTHqsAEtnA
	 eMGYpZPs/xPAdGJKbAwVGbh15e0/OlflrAQiLwgyqQjc+ErPLZi7fFQ6DFE1cOU0oS
	 t2HvmT0YTd0+/XnDJjGCQaIa3a9lMOV9Mwq8kURAwoXzRks9TpMRxCR/9nt1cSjgeu
	 ZIVgUbm5tMxKpviqOtVSkOKnP9/oSlDpT3GMi41MwugVjkTHGyYG2twJzBba3NBnRQ
	 xKZtCXOEJcVrf6RVuxDTQvFUOvorsgFSFmmvzWac5/EpuNobq+rNYljsyc7CgER+lx
	 8dx4XiYQ4Gs6w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A570ED5B149;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:48 +0100
Subject: [PATCH v4 06/16] net: dwmac-imx: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-6-03618f10e3e2@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1268;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=iLIsHvY+x5Xnx4GgOZhbVwuJPAuV0YL5laW2VrNYkBI=;
 b=xd40CP+YeaOmxmAXuqWIJ9bMLTDflKP9iPgxiFx/G1P2Bqk1kRHR9qzDm2YPIjQC/Dh2JsBwb
 8tu9gDPZSXxAmZnehRbnfBs1n+H7hWG5tl1jyz/t09h1oN/uAgrsUn9
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 6b65420e11b5..4147b56d40e1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -186,7 +186,7 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct imx_priv_data *dwmac = priv;
-	unsigned long rate;
+	long rate;
 	int err;
 
 	plat_dat = dwmac->plat_dat;
@@ -196,17 +196,8 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
 	    (plat_dat->mac_interface == PHY_INTERFACE_MODE_MII))
 		return;
 
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
 		return;
 	}

-- 
2.46.0



