Return-Path: <linux-arm-msm+bounces-40570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B59D9E5BE5
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 17:45:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 096381886EF6
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Dec 2024 16:44:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 305D5226EF1;
	Thu,  5 Dec 2024 16:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Denyvrpf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C650E22579A;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733417012; cv=none; b=bDqyEw6WCz+Yq5+EAKJ8LAPdweiyigRRLvUUSl2uIX+PlJ89vk1cSkHsGLO0ASx2Fp9Ea6ziUFr6QWVayTTvl+QpIGa76RMr+sRrDyIjuuOAtYUsji3gEbLSi09PDjp5dAgRWO1tYVT2IGb3nr8m+YfKOL7yQbNUUNj80CBCWdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733417012; c=relaxed/simple;
	bh=MdqsHWxoEbswm9BrGX6SpwNbcHkCUMsgVrFUDFuO4JM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtihJz8mYtWbgNOdJVkKQWLos4JLOw/CQ4TxpJ9sHm60VkiJPkg/1eqxajbxSMd9UNcUdUL7Cf9MY5OIXhXUZJ2x1s++4S3t2F/5vhhED4z/EVN34QDzQijaeo12ciTznu8JadxUy7QMkl+fzVLXKXHacfTxPFy5DpDXaa8pjEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Denyvrpf; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 51ED8C4CEE2;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733417012;
	bh=MdqsHWxoEbswm9BrGX6SpwNbcHkCUMsgVrFUDFuO4JM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Denyvrpf0tWH62oxZRuwZeV9cAUf7quM7F8qC3nvWM+wA8PpUg8GrE8rX+zLe7hKx
	 YUxvUd93ULGbaCpdFox/yMriOn05fbgq/hSMNHbHPqdKugAgpTRqTlorwTquAJgJKa
	 pKfyk/rkcxMirulLIMF/WfNnVt5KyUsCaXAcVn0+s1kaZomIygajUnxl4CoDlvr1nP
	 gIvSB+aDzuPhF0n4wXEss02OjaaYU+aEq+IGCoTBlkJdyUlQALb8i3mni35++UY6c2
	 gM2Aed4MwzhUXBgazf6V6ShmmmnAXLX/34wCKRmwUQbkBv8sTXgarQptn6cxZLA0iR
	 C0r4LJvxZCWlw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43098E7716D;
	Thu,  5 Dec 2024 16:43:32 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Thu, 05 Dec 2024 17:43:04 +0100
Subject: [PATCH net-next v8 07/15] net: dwmac-intel-plat: Use helper
 rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-upstream_s32cc_gmac-v8-7-ec1d180df815@oss.nxp.com>
References: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
In-Reply-To: <20241205-upstream_s32cc_gmac-v8-0-ec1d180df815@oss.nxp.com>
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
 0x1207@gmail.com, fancer.lancer@gmail.com, 
 "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733417009; l=1284;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=Ku8xMy0eJs5aGJR44zqrL9wRlkD9lntzlgmaMXGJpvg=;
 b=SlpOh7v4nNVm0pLzCwptN0QBO2ldqsCSY8Sf9nSyQhquMj3GTfNs51jbIqb7A69K9Y2Oz4E7Y
 PdHJq4FPfOODeNV5AMzSER5GuG4JDLjTKCNEpQfcqWKrIuUZAvOaO+n
X-Developer-Key: i=jan.petrous@oss.nxp.com; a=ed25519;
 pk=Ke3wwK7rb2Me9UQRf6vR8AsfJZfhTyoDaxkUCqmSWYY=
X-Endpoint-Received: by B4 Relay for jan.petrous@oss.nxp.com/20240922 with
 auth_id=217
X-Original-From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>
Reply-To: jan.petrous@oss.nxp.com

From: "Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>

Utilize a new helper function rgmii_clock().

When in, remove dead code in kmb_eth_fix_mac_speed().

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Jan Petrous (OSS) <jan.petrous@oss.nxp.com>
---
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c | 22 ++++------------------
 1 file changed, 4 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index d94f0a150e93..ddee6154d40b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -31,27 +31,13 @@ struct intel_dwmac_data {
 static void kmb_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct intel_dwmac *dwmac = priv;
-	unsigned long rate;
+	long rate;
 	int ret;
 
-	rate = clk_get_rate(dwmac->tx_clk);
-
-	switch (speed) {
-	case SPEED_1000:
-		rate = 125000000;
-		break;
-
-	case SPEED_100:
-		rate = 25000000;
-		break;
-
-	case SPEED_10:
-		rate = 2500000;
-		break;
-
-	default:
+	rate = rgmii_clock(speed);
+	if (rate < 0) {
 		dev_err(dwmac->dev, "Invalid speed\n");
-		break;
+		return;
 	}
 
 	ret = clk_set_rate(dwmac->tx_clk, rate);

-- 
2.47.0



