Return-Path: <linux-arm-msm+bounces-82488-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B9F7C6E464
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 12:41:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id E62F734A461
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:35:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 66242354715;
	Wed, 19 Nov 2025 11:34:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HlBRYreZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F61E3538B5;
	Wed, 19 Nov 2025 11:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552096; cv=none; b=Ep49C3ScDO4yYv7od9wXLjmzsgV7LLTVRpu97j7tvGKBdVRa8dbQ0P3YZVxGrILlcjHR7JD+rBARYEEIPtuk6pDDxajxayrKWwPazoyTm/pdoRWW9kRCJsiM04MTlvqLM0lkq2ukz7XKnhL8ZYQjizYiMgy6XotSAHHPYYyVPIw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552096; c=relaxed/simple;
	bh=/ZCpFmwMUFv4hdL8mlaY/7fFlm9IwOjbRrkPoHbqdJc=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=OJT6JuAZ46S+mbDgwwWK9yCBy75j4i0mmQqdrgjqMC3Lyiv0OLYYFW2pJ+piZE/2WrHXF+n0RJIrpZhmnFgszYrdXJ5DD2Dd4jObBVlqpBEYnBf+Q0KOaQPDhy1KTjCZgFOl8URIsUojGMCi7KrVWQrHV5tBs5OChmJOEeCtG/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HlBRYreZ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=hiwoImn/5AVeh8r7pc+FBPpqFG3zcvMGEXS9c9ImoQE=; b=HlBRYreZ49jjMxmv3s1CzOOchZ
	E6H0dZTqWOoS1P6Q7sMRJHGkF9UBMTAo0w7xDxqgT3YKJ1ncT2Av7s5fjl2Q+bZ0kAx57ZKzp3JF2
	LNjLgjvz5NHKTV5EN4bMS4eXqfc9b4P6aQ7tz4lXXjHtEIWKtzMebp8164J9XXMrk2iO/xBo6xpQ8
	tXdwrGbW1Drr9jga6K/G+JNfohoOzQAf6ael0GG7riHj4iXifxsonLMmBeRy66KC7AWEo7cJs+yFh
	/8ldcqC7VFa0SjQeiNuu2dwJp2byrPk4oJeS5ObaDMJ+7e4FyLPy12JLwVeCOuwTWgbxxuTS2bn0a
	LOm9zjoQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44956 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLgSU-000000004bK-3F31;
	Wed, 19 Nov 2025 11:34:46 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLgSU-0000000FMrL-0EZT;
	Wed, 19 Nov 2025 11:34:46 +0000
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
Subject: [PATCH net-next 2/3] net: stmmac: qcom-ethqos: add rgmii set/clear
 functions
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLgSU-0000000FMrL-0EZT@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 19 Nov 2025 11:34:46 +0000

The driver has a lot of bit manipulation of the RGMII registers. Add
a pair of helpers to set bits and clear bits, converting the various
calls to rgmii_updatel() as appropriate.

Most of the change was done via this sed script:

/rgmii_updatel/ {
	N
	/,$/N
	/mask, / ! {
		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)\2,\s+|rgmii_setmask(\1|
		s|rgmii_updatel\(([^,]*,\s+([^,]*),\s+)0,\s+|rgmii_clrmask(\1|
		s|^\s+$||
	}
}

and then formatting tweaked where necessary.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 187 +++++++++---------
 1 file changed, 89 insertions(+), 98 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index ae3cf163005b..cdaf02471d3a 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -137,6 +137,18 @@ static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
 	rgmii_writel(ethqos, temp, offset);
 }
 
+static void rgmii_setmask(struct qcom_ethqos *ethqos, u32 mask,
+			  unsigned int offset)
+{
+	rgmii_updatel(ethqos, mask, mask, offset);
+}
+
+static void rgmii_clrmask(struct qcom_ethqos *ethqos, u32 mask,
+			  unsigned int offset)
+{
+	rgmii_updatel(ethqos, mask, 0, offset);
+}
+
 static void rgmii_dump(void *priv)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -194,8 +206,7 @@ qcom_ethqos_set_sgmii_loopback(struct qcom_ethqos *ethqos, bool enable)
 static void ethqos_set_func_clk_en(struct qcom_ethqos *ethqos)
 {
 	qcom_ethqos_set_sgmii_loopback(ethqos, true);
-	rgmii_updatel(ethqos, RGMII_CONFIG_FUNC_CLK_EN,
-		      RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
+	rgmii_setmask(ethqos, RGMII_CONFIG_FUNC_CLK_EN, RGMII_IO_MACRO_CONFIG);
 }
 
 static const struct ethqos_emac_por emac_v2_3_0_por[] = {
@@ -304,27 +315,25 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 	u32 val;
 
 	/* Set CDR_EN */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CDR_EN,
-		      SDCC_DLL_CONFIG_CDR_EN, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_CDR_EN, SDCC_HC_REG_DLL_CONFIG);
 
 	/* Set CDR_EXT_EN */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CDR_EXT_EN,
-		      SDCC_DLL_CONFIG_CDR_EXT_EN, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_CDR_EXT_EN,
+		      SDCC_HC_REG_DLL_CONFIG);
 
 	/* Clear CK_OUT_EN */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CK_OUT_EN,
-		      0, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_clrmask(ethqos, SDCC_DLL_CONFIG_CK_OUT_EN,
+		      SDCC_HC_REG_DLL_CONFIG);
 
 	/* Set DLL_EN */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
-		      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,  SDCC_HC_REG_DLL_CONFIG);
 
 	if (!ethqos->has_emac_ge_3) {
-		rgmii_updatel(ethqos, SDCC_DLL_MCLK_GATING_EN,
-			      0, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_clrmask(ethqos, SDCC_DLL_MCLK_GATING_EN,
+			      SDCC_HC_REG_DLL_CONFIG);
 
-		rgmii_updatel(ethqos, SDCC_DLL_CDR_FINE_PHASE,
-			      0, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_clrmask(ethqos, SDCC_DLL_CDR_FINE_PHASE,
+			      SDCC_HC_REG_DLL_CONFIG);
 	}
 
 	/* Wait for CK_OUT_EN clear */
@@ -340,8 +349,8 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 		dev_err(dev, "Clear CK_OUT_EN timedout\n");
 
 	/* Set CK_OUT_EN */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CK_OUT_EN,
-		      SDCC_DLL_CONFIG_CK_OUT_EN, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_CK_OUT_EN,
+		      SDCC_HC_REG_DLL_CONFIG);
 
 	/* Wait for CK_OUT_EN set */
 	retry = 1000;
@@ -357,12 +366,12 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 		dev_err(dev, "Set CK_OUT_EN timedout\n");
 
 	/* Set DDR_CAL_EN */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
-		      SDCC_DLL_CONFIG2_DDR_CAL_EN, SDCC_HC_REG_DLL_CONFIG2);
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_CAL_EN,
+		      SDCC_HC_REG_DLL_CONFIG2);
 
 	if (!ethqos->has_emac_ge_3) {
-		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
-			      0, SDCC_HC_REG_DLL_CONFIG2);
+		rgmii_clrmask(ethqos, SDCC_DLL_CONFIG2_DLL_CLOCK_DIS,
+			      SDCC_HC_REG_DLL_CONFIG2);
 
 		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_MCLK_FREQ_CALC,
 			      0x1A << 10, SDCC_HC_REG_DLL_CONFIG2);
@@ -370,8 +379,7 @@ static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SEL,
 			      BIT(2), SDCC_HC_REG_DLL_CONFIG2);
 
-		rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
-			      SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG2_DDR_TRAFFIC_INIT_SW,
 			      SDCC_HC_REG_DLL_CONFIG2);
 	}
 
@@ -392,8 +400,8 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		phase_shift = RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN;
 
 	/* Disable loopback mode */
-	rgmii_updatel(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
-		      0, RGMII_IO_MACRO_CONFIG2);
+	rgmii_clrmask(ethqos, RGMII_CONFIG2_TX_TO_RX_LOOPBACK_EN,
+		      RGMII_IO_MACRO_CONFIG2);
 
 	/* Determine if this platform wants loopback enabled after programming */
 	if (ethqos->rgmii_config_loopback_en)
@@ -402,29 +410,26 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 		loopback = 0;
 
 	/* Select RGMII, write 0 to interface select */
-	rgmii_updatel(ethqos, RGMII_CONFIG_INTF_SEL,
-		      0, RGMII_IO_MACRO_CONFIG);
+	rgmii_clrmask(ethqos, RGMII_CONFIG_INTF_SEL,  RGMII_IO_MACRO_CONFIG);
 
 	switch (speed) {
 	case SPEED_1000:
-		rgmii_updatel(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      0, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      RGMII_CONFIG_POS_NEG_DATA_SEL,
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
 			      RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      RGMII_CONFIG_PROG_SWAP, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
-			      0, RGMII_IO_MACRO_CONFIG2);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_setmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_setmask(ethqos, RGMII_CONFIG_PROG_SWAP,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
 
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
 			      phase_shift, RGMII_IO_MACRO_CONFIG2);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      0, RGMII_IO_MACRO_CONFIG2);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-			      RGMII_CONFIG2_RX_PROG_SWAP,
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
+			      RGMII_IO_MACRO_CONFIG2);
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 			      RGMII_IO_MACRO_CONFIG2);
 
 		/* PRG_RCLK_DLY = TCXO period * TCXO_CYCLES_CNT / 2 * RX delay ns,
@@ -439,87 +444,78 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 			rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
 				      57, SDCC_HC_REG_DDR_CONFIG);
 		}
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
-			      SDCC_DDR_CONFIG_PRG_DLY_EN,
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
 			      loopback, RGMII_IO_MACRO_CONFIG);
 		break;
 
 	case SPEED_100:
-		rgmii_updatel(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      RGMII_CONFIG_BYPASS_TX_ID_EN,
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
 			      RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      0, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      0, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
-			      0, RGMII_IO_MACRO_CONFIG2);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
 			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_2,
 			      BIT(6), RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      0, RGMII_IO_MACRO_CONFIG2);
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
+			      RGMII_IO_MACRO_CONFIG2);
 
 		if (ethqos->has_emac_ge_3)
-			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_CONFIG2_RX_PROG_SWAP,
+			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_IO_MACRO_CONFIG2);
 		else
-			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      0, RGMII_IO_MACRO_CONFIG2);
+			rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_IO_MACRO_CONFIG2);
 
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
-			      SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
 			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
-			      SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
 			      loopback, RGMII_IO_MACRO_CONFIG);
 		break;
 
 	case SPEED_10:
-		rgmii_updatel(ethqos, RGMII_CONFIG_DDR_MODE,
-			      RGMII_CONFIG_DDR_MODE, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
-			      RGMII_CONFIG_BYPASS_TX_ID_EN,
+		rgmii_setmask(ethqos, RGMII_CONFIG_DDR_MODE,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_setmask(ethqos, RGMII_CONFIG_BYPASS_TX_ID_EN,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
 			      RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_POS_NEG_DATA_SEL,
-			      0, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG_PROG_SWAP,
-			      0, RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
-			      0, RGMII_IO_MACRO_CONFIG2);
+		rgmii_clrmask(ethqos, RGMII_CONFIG_PROG_SWAP,
+			      RGMII_IO_MACRO_CONFIG);
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_DATA_DIVIDE_CLK_SEL,
+			      RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG2_TX_CLK_PHASE_SHIFT_EN,
 			      phase_shift, RGMII_IO_MACRO_CONFIG2);
 		rgmii_updatel(ethqos, RGMII_CONFIG_MAX_SPD_PRG_9,
 			      BIT(12) | GENMASK(9, 8),
 			      RGMII_IO_MACRO_CONFIG);
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
-			      0, RGMII_IO_MACRO_CONFIG2);
+		rgmii_clrmask(ethqos, RGMII_CONFIG2_RSVD_CONFIG15,
+			      RGMII_IO_MACRO_CONFIG2);
 		if (ethqos->has_emac_ge_3)
-			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      RGMII_CONFIG2_RX_PROG_SWAP,
+			rgmii_setmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
 				      RGMII_IO_MACRO_CONFIG2);
 		else
-			rgmii_updatel(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
-				      0, RGMII_IO_MACRO_CONFIG2);
+			rgmii_clrmask(ethqos, RGMII_CONFIG2_RX_PROG_SWAP,
+				      RGMII_IO_MACRO_CONFIG2);
 		/* Write 0x5 to PRG_RCLK_DLY_CODE */
 		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_CODE,
 			      (BIT(29) | BIT(27)), SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
-			      SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
 			      SDCC_HC_REG_DDR_CONFIG);
-		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
-			      SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
+		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
 			      SDCC_HC_REG_DDR_CONFIG);
 		rgmii_updatel(ethqos, RGMII_CONFIG_LOOPBACK_EN,
 			      loopback, RGMII_IO_MACRO_CONFIG);
@@ -547,12 +543,12 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	/* Initialize the DLL first */
 
 	/* Set DLL_RST */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_RST,
-		      SDCC_DLL_CONFIG_DLL_RST, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_RST,
+		      SDCC_HC_REG_DLL_CONFIG);
 
 	/* Set PDN */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN,
-		      SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
+	rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN,
+		      SDCC_HC_REG_DLL_CONFIG);
 
 	if (ethqos->has_emac_ge_3) {
 		if (speed == SPEED_1000) {
@@ -566,21 +562,18 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	}
 
 	/* Clear DLL_RST */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_RST, 0,
-		      SDCC_HC_REG_DLL_CONFIG);
+	rgmii_clrmask(ethqos, SDCC_DLL_CONFIG_DLL_RST, SDCC_HC_REG_DLL_CONFIG);
 
 	/* Clear PDN */
-	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_PDN, 0,
-		      SDCC_HC_REG_DLL_CONFIG);
+	rgmii_clrmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
 
 	if (speed != SPEED_100 && speed != SPEED_10) {
 		/* Set DLL_EN */
-		rgmii_updatel(ethqos, SDCC_DLL_CONFIG_DLL_EN,
-			      SDCC_DLL_CONFIG_DLL_EN, SDCC_HC_REG_DLL_CONFIG);
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_DLL_EN,
+			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set CK_OUT_EN */
-		rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CK_OUT_EN,
-			      SDCC_DLL_CONFIG_CK_OUT_EN,
+		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_CK_OUT_EN,
 			      SDCC_HC_REG_DLL_CONFIG);
 
 		/* Set USR_CTL bit 26 with mask of 3 bits */
@@ -631,15 +624,13 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 
 	switch (speed) {
 	case SPEED_2500:
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
 		ethqos_set_serdes_speed(ethqos, SPEED_2500);
 		ethqos_pcs_set_inband(priv, false);
 		break;
 	case SPEED_1000:
-		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
-			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
+		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
 		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
-- 
2.47.3


