Return-Path: <linux-arm-msm+bounces-82489-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B9EC6E4AC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 12:43:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id B6B374EACF1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:35:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D2B23538B2;
	Wed, 19 Nov 2025 11:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="W26B/AMN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4D7D3538BD;
	Wed, 19 Nov 2025 11:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552102; cv=none; b=rlsvdVVdNjSR6A5NmR6QxQcwLuvyFg6zx/Qtgr0mMaehuw/OZUxNnxp0x6EA6PMIs1eZb/+XWiTWjFs+boOsLL/0zBNHvKCSYDYcbL91qSLp/8boRjWxUPhwafgS2OaDMMMxZBTmjZm01xJUmiieKteh4R97oBxekEWNVaZGxBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552102; c=relaxed/simple;
	bh=ued/OLZVSZ3qa7KDwkGn5q8ng1WZDCV2dHcbch63ilU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=sdMRp+AQM0u5v91wvuMhu8XU9oW2VWcMno8gD2BOQaoXt7OwCFxiRrfp7AJjLwR8HNbLJmLpI+hgTZ5W2aLwtM9K/tC7jGf6hIt496AMlamqPbwTGf0VTa8/8HnC0ZWzDBxN/T5MD6BXweQtMw2RXc/hvRHv1le9/T4eN4v3Yt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=W26B/AMN; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GWzMethokdpZI+SsJLAJYK1d0eO55qfB9UauitgyfGY=; b=W26B/AMNDejL6IhR5H6kaoi6Hs
	1XLDgz7biPhv2IKoJcxtWxVJBLAjjOHnNFpm78EL1VKOcHy3bi6rzeLBJazrPV6/m92YMFpRO1ilz
	Y34YtAkoUjrqoFMxZ/RIggELkYc7jf564LyxlU1AiuywIcKCRW/zXHiAmNg9kToorgxLc3H6/Y3NK
	EUC2pVPWXWs3wqpUAAXn2Fx18VT3Z6zSct8qZnC568+8+rgtgKcpFb1uG83v3dmPvwPEJVyPMJlju
	YgooAXD50rDccOCZrIZL7KN4yPYL6Fdh/dnNQk+qJsfi82jNINvnyeCiNorI3j+H4VKc9J7ptYxJv
	PpHY17dg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:49008 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLgSa-000000004ba-0pCL;
	Wed, 19 Nov 2025 11:34:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLgSZ-0000000FMrW-0cEu;
	Wed, 19 Nov 2025 11:34:51 +0000
In-Reply-To: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 3/3] net: stmmac: qcom-ethqos: use
 read_poll_timeout_atomic()
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLgSZ-0000000FMrW-0cEu@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 19 Nov 2025 11:34:51 +0000

Use read_poll_timeout_atomic() to poll the rgmii registers rather than
open-coding the polling.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 44 ++++++-------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index cdaf02471d3a..13cddd56d71f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -311,7 +311,6 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	int retry = 1000;
 	u32 val;
 
 	/* Set CDR_EN */
@@ -337,15 +336,10 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	}
 
 	/* Wait for CK_OUT_EN clear */
-	do {
-		val = rgmii_readl(ethqos, SDCC_HC_REG_DLL_CONFIG);
-		val &= SDCC_DLL_CONFIG_CK_OUT_EN;
-		if (!val)
-			break;
-		mdelay(1);
-		retry--;
-	} while (retry > 0);
-	if (!retry)
+	if (read_poll_timeout_atomic(rgmii_readl, val,
+				     !(val & SDCC_DLL_CONFIG_CK_OUT_EN),
+				     1000, 1000000, false,
+				     ethqos, SDCC_HC_REG_DLL_CONFIG))
 		dev_err(dev, "Clear CK_OUT_EN timedout\n");
 
 	/* Set CK_OUT_EN */
@@ -353,16 +347,10 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 		      SDCC_HC_REG_DLL_CONFIG);
 
 	/* Wait for CK_OUT_EN set */
-	retry = 1000;
-	do {
-		val = rgmii_readl(ethqos, SDCC_HC_REG_DLL_CONFIG);
-		val &= SDCC_DLL_CONFIG_CK_OUT_EN;
-		if (val)
-			break;
-		mdelay(1);
-		retry--;
-	} while (retry > 0);
-	if (!retry)
+	if (read_poll_timeout_atomic(rgmii_readl, val,
+				     val & SDCC_DLL_CONFIG_CK_OUT_EN,
+				     1000, 1000000, false,
+				     ethqos, SDCC_HC_REG_DLL_CONFIG))
 		dev_err(dev, "Set CK_OUT_EN timedout\n");
 
 	/* Set DDR_CAL_EN */
@@ -531,8 +519,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	volatile u32 dll_lock;
-	unsigned int i, retry = 1000;
+	unsigned int i;
+	u32 val;
 
 	/* Reset to POR values and enable clk */
 	for (i = 0; i < ethqos->num_por; i++)
@@ -582,14 +570,10 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 				      SDCC_USR_CTL);
 
 		/* wait for DLL LOCK */
-		do {
-			mdelay(1);
-			dll_lock = rgmii_readl(ethqos, SDC4_STATUS);
-			if (dll_lock & SDC4_STATUS_DLL_LOCK)
-				break;
-			retry--;
-		} while (retry > 0);
-		if (!retry)
+		if (read_poll_timeout_atomic(rgmii_readl, val,
+					     val & SDC4_STATUS_DLL_LOCK,
+					     1000, 1000000, true,
+					     ethqos, SDC4_STATUS))
 			dev_err(dev, "Timeout while waiting for DLL lock\n");
 	}
 
-- 
2.47.3


