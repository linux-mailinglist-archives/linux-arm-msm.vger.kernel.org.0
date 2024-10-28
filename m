Return-Path: <linux-arm-msm+bounces-36219-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 62CAF9B3B74
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:26:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 95A2F1C221B1
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:26:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 09BAF1E32DC;
	Mon, 28 Oct 2024 20:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cf8ffnyz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B01E81E1042;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147128; cv=none; b=XUQj7TEGlr1GM2M+XMXvL00MQVbU1yb7Vw5TE4wJp/tUyW6URN1icnAKuUWd3cCBJBBXFdIYfcMk9teL6il4+Vw4Jo9FFlHutUHMBm8aEHGfNZ73v0zh+ovyuqcR4uhRXjpoXYyvdcmhek61XuGa7gxtkvNnBRWRmKbVCrw7NQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147128; c=relaxed/simple;
	bh=CQdMV8dkq/A9d6yVmrre2V2ErUvyIxE7venx1gnBvdA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=C9rTBIru8U9eJ8aHT+REDrm3Ywo392dh6iXzioA7vzxW1xTZpj4PESLJALfR/L/J09Ok0UP16vWARd2iC0L8/XGAWjelmSqMsxDYmCV9JcHaPk/B383Wgzko0Nd0ArJYufNRgj/ipxGYtwXiqD80UTsmqnOYqdioGAVSVRUyWoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cf8ffnyz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6D7B6C4CEEC;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147128;
	bh=CQdMV8dkq/A9d6yVmrre2V2ErUvyIxE7venx1gnBvdA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cf8ffnyz0NwdfObRPIIyRfTW91wf+5WW0OyzBUOEjVCjo9DtaTThPs7NnDrhsGxM2
	 DEhQhyJAaRUz0bOI6NhdMIk3B0RX6llJ0rY13FZGnc75kuYohKaD417wlM+T4eSYyT
	 aGGh1XWCjx2WFmNEDfPAwR0iI4Ko4+Hmy9RMT0aSrnjRVGuoVi/1DFXwQ6TbffUyCc
	 +nssEeXDdKkZr2oTOu7V0UjGR2jN/3p7J5RQiZBE2B6gWJea3g1OYwW3Tsn6Qoc488
	 sUTsY/JRo0QeH9N1RrGKpPErTmquRwewUjL14O6hbJ+zZqkVTGPFBF02eaYcycze2Q
	 7Dgb09KHZLxtg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6189CD5B149;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:53 +0100
Subject: [PATCH v4 11/16] net: xgene_enet: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-11-03618f10e3e2@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1083;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=ez2eUvox+NA2tsnzDHS2muudXDPXOUk289T76vN/OhU=;
 b=vEL45N1FGJLM+RgRwo1FmE4ffW8cGr8QBpLo+HpPla/E6gxsLRqEF5clGWKNsJcfwmEB/EFdC
 J46TAbaFEPaCIvJL9QEF3u576I1KQoIDnblJTsraa5S119/1WoOQ/RH
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
 drivers/net/ethernet/apm/xgene/xgene_enet_hw.c | 16 +++++-----------
 1 file changed, 5 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
index e641dbbea1e2..b854b6b42d77 100644
--- a/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
+++ b/drivers/net/ethernet/apm/xgene/xgene_enet_hw.c
@@ -421,18 +421,12 @@ static void xgene_enet_configure_clock(struct xgene_enet_pdata *pdata)
 
 	if (dev->of_node) {
 		struct clk *parent = clk_get_parent(pdata->clk);
+		long rate = rgmii_clock(pdata->phy_speed);
 
-		switch (pdata->phy_speed) {
-		case SPEED_10:
-			clk_set_rate(parent, 2500000);
-			break;
-		case SPEED_100:
-			clk_set_rate(parent, 25000000);
-			break;
-		default:
-			clk_set_rate(parent, 125000000);
-			break;
-		}
+		if (rate < 0)
+			rate = 125000000;
+
+		clk_set_rate(parent, rate);
 	}
 #ifdef CONFIG_ACPI
 	else {

-- 
2.46.0



