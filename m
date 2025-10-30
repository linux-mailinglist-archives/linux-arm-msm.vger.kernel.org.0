Return-Path: <linux-arm-msm+bounces-79643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AAE8C1F7DF
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 11:20:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id DF6814E2C0B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Oct 2025 10:20:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 64FA434214F;
	Thu, 30 Oct 2025 10:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HUYE+L+l"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67CC4DF71;
	Thu, 30 Oct 2025 10:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761819640; cv=none; b=H7pqwq8Szt4i77WjXzPpyqc8OvCXFJMpAtQjDowdBeB5f1bpoKXcykKf0cqlPDtuVLSwnFLNqncsh/F/Ptlyi5YehKtl+/lWkMhsDSHWk5JCkTh2E47YC1yq2aSBQASZNYwfSr9rHdkqwvTKNOZ7YyYd4QUffzkTM2IHGsYdIAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761819640; c=relaxed/simple;
	bh=wZjI85gc9ds4oQnAVEj16miooQY7I47A8VGPHhee+JU=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=ti5BUWtm0LnXUbhx2urLJqnRUvZ+wl1zSn2xLdfDa5wfQ+aFKZFAMVn1Llz9ut3nTHGXquqcwGzSlwLpbKZQd3gKHI52dD8qQw2iyCwhD2QMJ5dZ4bQBvEHfJmtUIqiESK6oYmt/1ipW1uzvVDNTkxKizvMbH5RG68K6pBQcOmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HUYE+L+l; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Om8QogJvG48OeHmfYzHSM2+A2/jNKspDMEUl+aS+ED4=; b=HUYE+L+lroDttVxCJDA1cv5R9Z
	hBxZq/tXa2zO7c0xlkBkj7hu9fAtMC8+pnobfxc/qw+F0eax+pdXGDWZ3amnLHWZrHOJW9CSKEwjP
	baSkOW8c2QcDJYA6ejxNPHebRAnH074DnOi0YQjAsyTMEVu6FHwl/hHMP63Bv6+5MGs2Mjktu4jL1
	l+Js+F96qZKqTYbZo0frPvDWuO7Fj6R8dsGOLcKP+yuntpffsYjJANa6R2Qc1t0ejQ+qkxih5HXNv
	fXgfgdwbbwqkdQqbVheyKS6vEICr+bHRLVPl6YaopllL/tdBiJpXISqtZbZF/AcUY5xg9yHDMW1++
	nEN+OHfA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33222 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vEPlh-000000005Vd-14RR;
	Thu, 30 Oct 2025 10:20:33 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vEPlg-0000000CFHY-282A;
	Thu, 30 Oct 2025 10:20:32 +0000
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
Subject: [PATCH net-next v2] net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
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
Message-Id: <E1vEPlg-0000000CFHY-282A@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 30 Oct 2025 10:20:32 +0000

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

Konrad states:

Without any additional knowledge, the register description says:

2500: B14=1 B15=0
1000: B14=0 B15=0
 100: B14=1 B15=1
  10: B14=0 B15=1

Tested-by: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: added tested-by/reviewed-by, added additional comments from Konrad
w.r.t. the register description to commit description (which is the
reason for resending.)

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


