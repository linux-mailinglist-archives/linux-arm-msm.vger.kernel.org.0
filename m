Return-Path: <linux-arm-msm+bounces-34212-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E21AF99BC05
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 23:28:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 12F1A1C20DBD
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Oct 2024 21:28:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 63634154BFE;
	Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MJrbWkN6"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12F1D14B956;
	Sun, 13 Oct 2024 21:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728854878; cv=none; b=YP542/baaXpj4hMy8AAAud+0qUeTG5fYF11bCAnPWcfoFnC93ynXuOJdOQvw6xfuynvt10Y7GFkULEvfgfsjsrs9vwyrL8+kQtWlepgu9Wsi0SDyPWhHHoYXzxheQkZbdMW69JRQryxOsIA6w9XkBUK0h42VNj7TSggwwoAGqP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728854878; c=relaxed/simple;
	bh=EWJy9JeMXDqa/WW/41klR6vUHcsaJ/6zfX1ZyvWYcR8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RE5IpYUiGTgurkjefoR6Hydaqtpcacbz9CNbprHL0lVi0UuYk8/emu8Bh/y/26Nq4MPsGtp3/RGThLsWCnCWMWwIeBgVkx4jY88YWaODxtzgo8hOQhylIwGgMsy4HzduPwjNmGEUkxx+/sWWwT8fp6gYDm9EHbj1iO37XfACb44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MJrbWkN6; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id DC55CC4AF10;
	Sun, 13 Oct 2024 21:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728854877;
	bh=EWJy9JeMXDqa/WW/41klR6vUHcsaJ/6zfX1ZyvWYcR8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MJrbWkN6WvKGakhIwLQh5JDj7SkTTZXA2KKbSiZwJYnttgBUCBX/cVnRDqqMJYXoU
	 zFWJ9aZN2hg2OEGWV+5WR7gKnkCLSECXheEDWlc7nbHqfoph2j4WqQLTe7mh+ypKV5
	 mUEpIndEb8OgV9WlDDWXIt32X0uHXyOfY3ECgyKsR30SOIRLZuSNwQrJZrwGNsvyP0
	 PSODiKKOfoTXytsFYCFbq9JuSxD1r2lIgEkf36ETX3w3ZcQ2fwSXGu7n17hb4i1QLK
	 108kOOK1+j1lq/nF/oxBsGvULZ8ZnO3Sf/dvGEyTzJRaLEZnzFJHXshoh2kfCHLENe
	 K8c6YlMs1XZkA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCFB8CF2597;
	Sun, 13 Oct 2024 21:27:57 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Sun, 13 Oct 2024 23:27:40 +0200
Subject: [PATCH v3 05/16] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241013-upstream_s32cc_gmac-v3-5-d84b5a67b930@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728854875; l=1141;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=eQYl++pRYyUt/vpL0dW1HQTxgdYHPHBLmMCUh0kqWZs=;
 b=VtQ42Zrg7arl8w27JhC5tgzEYRnl0i1EUl8uEo2MfpalG/kxoNvP264eOmI68/QW8sMdvc04o
 P7JUxYyXve1BICndRSEa70tSnAJiJ3qRr8+NWOoQQqkgNW6ZF/AwMjR
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
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index ec924c6c76c6..5080891c33e0 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -181,24 +181,19 @@ static void dwc_qos_remove(struct platform_device *pdev)
 static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
 {
 	struct tegra_eqos *eqos = priv;
-	unsigned long rate = 125000000;
+	long rate = 125000000;
 	bool needs_calibration = false;
 	u32 value;
 	int err;
 
 	switch (speed) {
 	case SPEED_1000:
-		needs_calibration = true;
-		rate = 125000000;
-		break;
-
 	case SPEED_100:
 		needs_calibration = true;
-		rate = 25000000;
-		break;
+		fallthrough;
 
 	case SPEED_10:
-		rate = 2500000;
+		rate = rgmii_clock(speed);
 		break;
 
 	default:

-- 
2.46.0



