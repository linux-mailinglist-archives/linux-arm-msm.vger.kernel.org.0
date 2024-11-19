Return-Path: <linux-arm-msm+bounces-38336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 960D69D28E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 16:02:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5AEA4281D7F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Nov 2024 15:02:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 87C861D0DF2;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AaarjyLg"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33F6122067;
	Tue, 19 Nov 2024 15:01:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732028465; cv=none; b=sPsmpxeKiqTt9tIqaJH2srAp+746QgiHi/MifM9qV3F6wkug8to6lxadL1IjmnVWcIM179gA+huNHyloQBGa9MAmErXja77cm2lpy2VLLTZnyDXUz+cWoY0ua2u/xwyym11esr7valwxQRfoTDqAhYl71PnsTYbzXDDtCl8FLFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732028465; c=relaxed/simple;
	bh=vGm8hB4/TmiszLf3bN85rR5cGy6kkIlZPmQ53rGOh3A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IEx3rgmkrhEydR37eBifBGEit0gx4exaV24RER4Y5LUeDlLjymvN/+sq1cmc+sa8CtLBdEiIpuQsUK50Dhgk0jlRDHf+WDAbR81emjmov5uN9yj3kaTrmWIYtwxgZvi0a6zBJNAv/55IgOLk2wMo4ZFcDYzac0a5HsHMPTCR3wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AaarjyLg; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id D27EAC4CED7;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732028464;
	bh=vGm8hB4/TmiszLf3bN85rR5cGy6kkIlZPmQ53rGOh3A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=AaarjyLgg6oCB49a2uPBY4p14sbonxiS+m0nRJo7XhliAbN/naZ1/X1lXo0na8jWs
	 lv4cV5mZUe8jdH4/cP9xPBBdlFmisN5sxLz5hqeUIcUQo2fsuUz0x61B3hbDyGob0U
	 xGFuVCArfxvmiAtoTXG4JlVcj8TGAoqCuY1ikW183cuL4GbUpCIx+mr5QK0w8aT7Zh
	 EsTHghaLxVv2t5pjnMk4ahJ23HKDTM5P1kelTwp6+lzPDPYoh/QxAF1VQcK/ZfjZOs
	 Pvf9FhZu5wH/oL5TGEa6vRE+GRspQ00goHhpSkw8fvgvKvJj6/1zAhNf8C6c3lfLcW
	 alFNg8V1rQRhw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A64D44166;
	Tue, 19 Nov 2024 15:01:04 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Tue, 19 Nov 2024 16:00:17 +0100
Subject: [PATCH v5 11/16] net: xgene_enet: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241119-upstream_s32cc_gmac-v5-11-7dcc90fcffef@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732028461; l=1126;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=5u/M7E6Kz6sq/3FES3HGKltEz82lb2lsX0TwarooLQI=;
 b=I2sS6+ZpuCoSD34wTzDfurzGofqnJ+HMEz/fYxG6rNuFV1NQ5qcTjw+f8QevvHxV7tVt5UQe+
 5RXFZ/W2w37A+g8Nn32B6SfBxCREbO6oW1HPtuAsQfoQI1HbHtx/5Gt
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
2.47.0



