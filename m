Return-Path: <linux-arm-msm+bounces-79412-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id AA82EC19A46
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 11:18:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 1F3C1341A93
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Oct 2025 10:18:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E50BA2F3C12;
	Wed, 29 Oct 2025 10:18:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0h1FDTdv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDD1293C42;
	Wed, 29 Oct 2025 10:18:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761733126; cv=none; b=H/ur7x0lHYtPd7n9UjJcpENWqc4nH3jPEtrJLaunimOt8/OOsP4F6ExBvUe4OhPaUlDK3btxp0qZtwC9lI+1jovADreB1q4O1hzvA6hEie48wFPGpiogXtFfLlNVA3OoxKl3rQNxdTDZ60Pj2NdyxGDCsc2eL4KL0fJ5AhOzzGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761733126; c=relaxed/simple;
	bh=M/ne5Sm3q1T76eXGGurXPYwMs14MR3gGT493slaVYXM=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=jIxXGz4LTWJ7PD2vzTriHX1Q7k74Ld3XXqLPbGk3lgsrWR20WH9C3VbTTJTph482hkrPtRfcDqq+3CugKrMOEp0SS7Dte9hBmqT3fDi/8LbUisYak0KuiSG9posHch9J8lGTdZ8GSuGWC5g+7FBUsWb6E/eE638FfNU2H4yl2KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0h1FDTdv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ivQTAJdjlNQXx4yqMKe2TxxnGOw9c8SxcOdTDcKyyJs=; b=0h1FDTdvpBf4x5YCrBkBRPjtkH
	JUbCMdPlvzMwk1811mKWU9YA9beSs0SmZKGNUftBy88sS4gidOFnFQagnQCBkEfAsuIpm1lR0evXX
	H0ASISuF2HYuFHwZUaH7vj8WU87gO8WQLr/l5tr+Pp5phBgxnKRh9AbeYzq+5ciiDyyNY7TjHd+Fz
	xg5U/94BNh+y6jyp9IWhL8SO8kCQz/1hr6dJkgxCzJng8miO+r8f5yzWs2w8WHNE2y7aYiJo3Vwo3
	HpHXhh8b3zhH0tfeUBx8faUlSZrNw4nDvufdxyDKiFDyomH9irdoaNzshXzrEXhXVvOU7KIyzCWXr
	wX8WJf8A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:39186 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vE3GG-000000004EQ-3nmA;
	Wed, 29 Oct 2025 10:18:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vE3GG-0000000CCuC-0ac9;
	Wed, 29 Oct 2025 10:18:36 +0000
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
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
Subject: [PATCH net-next] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
 modification
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vE3GG-0000000CCuC-0ac9@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 29 Oct 2025 10:18:36 +0000

When operating in "SGMII" mode (Cisco SGMII or 2500BASE-X), qcom-ethqos
modifies the MAC control register in its ethqos_configure_sgmii()
function, which is only called from one path:

stmmac_mac_link_up()
+- reads MAC_CTRL_REG
+- masks out priv->hw->link.speed_mask
+- sets bits according to speed (2500, 1000, 100, 10) from priv->hw.link.speed*
+- ethqos_fix_mac_speed()
|  +- qcom_ethqos_set_sgmii_loopback(false)
|  +- ethqos_update_link_clk(speed)
|  `- ethqos_configure(speed)
|     `- ethqos_configure_sgmii(speed)
|        +- reads MAC_CTRL_REG,
|        +- configures PS/FES bits according to speed
|        `- writes MAC_CTRL_REG as the last operation
+- sets duplex bit(s)
+- stmmac_mac_flow_ctrl()
+- writes MAC_CTRL_REG if changed from original read
...

As can be seen, the modification of the control register that
stmmac_mac_link_up() overwrites the changes that ethqos_fix_mac_speed()
does to the register. This makes ethqos_configure_sgmii()'s
modification questionable at best.

Analysing the values written, GMAC4 sets the speed bits as:
speed_mask = GMAC_CONFIG_FES | GMAC_CONFIG_PS
speed2500 = GMAC_CONFIG_FES                     B14=1 B15=0
speed1000 = 0                                   B14=0 B15=0
speed100 = GMAC_CONFIG_FES | GMAC_CONFIG_PS     B14=1 B15=1
speed10 = GMAC_CONFIG_PS                        B14=0 B15=1

Whereas ethqos_configure_sgmii():
2500: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
1000: clears ETHQOS_MAC_CTRL_PORT_SEL           B14=X B15=0
100: sets ETHQOS_MAC_CTRL_PORT_SEL |            B14=1 B15=1
          ETHQOS_MAC_CTRL_SPEED_MODE
10: sets ETHQOS_MAC_CTRL_PORT_SEL               B14=0 B15=1
    clears ETHQOS_MAC_CTRL_SPEED_MODE

Thus, they appear to be doing very similar, with the exception of the
FES bit (bit 14) for 1G and 2.5G speeds.

Given that stmmac_mac_link_up() will write the MAC_CTRL_REG after
ethqos_configure_sgmii(), remove the unnecessary update in the
glue driver's ethqos_configure_sgmii() method, simplifying the code.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
Ayaan, please can you also test this patch? I believe that this
code is unnecessary as per the analysis in the commit message.
Thanks.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index d1e48b524d7a..1a616a71c36a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -76,10 +76,6 @@
 #define RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL	BIT(6)
 #define RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN	BIT(5)
 
-/* MAC_CTRL_REG bits */
-#define ETHQOS_MAC_CTRL_SPEED_MODE		BIT(14)
-#define ETHQOS_MAC_CTRL_PORT_SEL		BIT(15)
-
 /* EMAC_WRAPPER_SGMII_PHY_CNTRL1 bits */
 #define SGMII_PHY_CNTRL1_SGMII_TX_TO_RX_LOOPBACK_EN	BIT(3)
 
@@ -632,13 +628,9 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct net_device *dev = platform_get_drvdata(ethqos->pdev);
 	struct stmmac_priv *priv = netdev_priv(dev);
-	int val;
-
-	val = readl(ethqos->mac_base + MAC_CTRL_REG);
 
 	switch (speed) {
 	case SPEED_2500:
-		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
@@ -646,7 +638,6 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 		ethqos_pcs_set_inband(priv, false);
 		break;
 	case SPEED_1000:
-		val &= ~ETHQOS_MAC_CTRL_PORT_SEL;
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
@@ -654,13 +645,10 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
-		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
-		val |= ETHQOS_MAC_CTRL_PORT_SEL;
-		val &= ~ETHQOS_MAC_CTRL_SPEED_MODE;
 		rgmii_updatel(ethqos, RGMII_CONFIG_SGMII_CLK_DVDR,
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
@@ -670,9 +658,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 		break;
 	}
 
-	writel(val, ethqos->mac_base + MAC_CTRL_REG);
-
-	return val;
+	return 0;
 }
 
 static int ethqos_configure(struct qcom_ethqos *ethqos, int speed)
-- 
2.47.3


