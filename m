Return-Path: <linux-arm-msm+bounces-36216-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F1909B3B70
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 21:26:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B02FF1F22C1B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 28 Oct 2024 20:26:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C3D071E1A25;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jlxIgtu7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709721E0DB2;
	Mon, 28 Oct 2024 20:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730147128; cv=none; b=PngdWeS1mkaZ2CXULAzjtXjgQ0TQIyXUE/j9NeoUoLcAteIPNbcbfExLze2b1k5Ujq9JzTCndVk4R559HQ//aaauhleqDb1439Uc9FAw7OHbWmYBbnqKFaV89GvElC7oz0t2KaxJjzB9tr1tqRFeUL3PaYcKlRw1yc4IDV7b3Co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730147128; c=relaxed/simple;
	bh=JRUUT/tVaHw7QrNHAqa5N8/R1Mo2990bjnD9KKasxCA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MsX1TCgRYZTpfryxeMjmM791pxfq2QsWWDj3XTkyMfkBlqqATin00xI1M5RGuJzhOqi+oOx2e5UbfpBDTNePNVLKnds6hemHxZAYK16/ZFo+DiU8fNd7qmpm/kgsjrwD1NfyrJUfSUrRo1mLr+dfGB1YmaaRZalsAgqDGSsJaRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jlxIgtu7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 96BEDC4CEF7;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730147127;
	bh=JRUUT/tVaHw7QrNHAqa5N8/R1Mo2990bjnD9KKasxCA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=jlxIgtu7V3cPBsySzGHkIQt2Pkpvu7zLFd+Sa//8HjxDN33wfX+tLPfl2Kh3smzyY
	 F3gc/xFON//NvqVkzU3rHdwnuHLd8lNTRdHdy37WzKIGIM/L5sJ9YRFQrE6+vcn8c6
	 xyq/MG97S5pep1MSvjvyj0UPnQ2K1QzV09fXD/0lDdFr+sKLoh9PXwSN1FNYqdrEo1
	 Hy0iG1kPtJPr95Ok0jX21rVclqjlJPZIzGARF4WCXjpka+FQ1q7TNMCTMx2XztO9h6
	 a8wQ0+HbXcOwW4dQknRx1hALSYLUsgeEkJ1oah3Q/YPJIPq8kt2zD+16Y1xpBgggov
	 djzUH3nAaghOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89E78D5B14E;
	Mon, 28 Oct 2024 20:25:27 +0000 (UTC)
From: Jan Petrous via B4 Relay <devnull+jan.petrous.oss.nxp.com@kernel.org>
Date: Mon, 28 Oct 2024 21:24:47 +0100
Subject: [PATCH v4 05/16] net: dwmac-dwc-qos-eth: Use helper rgmii_clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241028-upstream_s32cc_gmac-v4-5-03618f10e3e2@oss.nxp.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730147124; l=1182;
 i=jan.petrous@oss.nxp.com; s=20240922; h=from:subject:message-id;
 bh=o1k5Wm20ojlSERI184m4AqWRyn2wXW8vdr8AE9UuluE=;
 b=oQtSE7tZW80kMP1GQFVE/VJ3DQXVdxUvernNfz8S7tts1H1pzWxYq+pY4H/6cFR/3t/mgQzwK
 VU83o71HrGlDIwsxQJOrzQktrXXZKJkOmQfQ/PQPEbE1cI0wF88D7Jz
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



