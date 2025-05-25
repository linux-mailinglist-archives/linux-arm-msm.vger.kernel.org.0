Return-Path: <linux-arm-msm+bounces-59345-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 33787AC3617
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 19:56:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 44CA43B3DFE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 25 May 2025 17:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0921B25E824;
	Sun, 25 May 2025 17:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PhFrxy/B"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D6A25A2DA;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748195768; cv=none; b=CETwPJIBL908b0xSoL+4cQuU1oEi0Ua1BQkpgM7n++fEHfpjDAv8lzGsCG/L+7jqkxTGZvv8wvLEAH9z2/6mWL9MTY8iG7shhyoFogwuDN+5bglYhpDhn2kit9+THmOZ2wCRSAGrt5T+InDUhjPsN2Z+9/GOCoYddUv1pT/C/BE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748195768; c=relaxed/simple;
	bh=AKJIKHwqfg6frSKU+vRiCmR7f/Zj8aVNbWSz09oX9do=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SeeIZJcgffhMSQGv8PmAuylwgrxvWI3DsIFl3mBIPTxsqXnOgu1MxgYLzG6d9X+4n1CVJAfVtCXV6EplqUmh4kZkCUxMlhJxzGAS+kzbTIAtnsZL2soXl59TQAqgq/28fUD1fFOBUwTQsXSGI7PFljSs1olZBROP2KD3kyjQvOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PhFrxy/B; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3C5B8C4CEF5;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748195768;
	bh=AKJIKHwqfg6frSKU+vRiCmR7f/Zj8aVNbWSz09oX9do=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=PhFrxy/BGXdBznmC2FEPLnhJCSLEHjtlTwV3ktwF6Z5c796SJmcmFj5hUNkoBY1sx
	 P1nzZfgdQfHrJH2vKQPYQQQvG9HYJlpToRNaiW1b6Ga6IegFa8TnCBzejwW96s6MYe
	 zLPivNcmzm9jHrr6WQjc80YYKpZqlE1u784mvtWuW/hfOr0KbdfQDq6u590ONgCruk
	 CyzTptlUE6XXuZDCtEnCWWkElta37jVD0QzvkH5d+ygRdJsa0LQCZLXq3mtXiqPxCt
	 5Y6zVTDty+d9QcdLezWYPc91sQ31Djud3uKNay8kmcdfvAbBrD1UPuTVo2Wxm3uiUm
	 tYuCkLn8c8hrA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BFE7C5AE59;
	Sun, 25 May 2025 17:56:08 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Sun, 25 May 2025 21:56:06 +0400
Subject: [PATCH 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018 Internal
 PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250525-ipq5018-ge-phy-v1-3-ddab8854e253@outlook.com>
References: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
In-Reply-To: <20250525-ipq5018-ge-phy-v1-0-ddab8854e253@outlook.com>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-clk@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748195765; l=11080;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=wRbrnAUbRsi2zrpJq8AScaHZAsdMnDBTOHmfUPma2Lg=;
 b=4hx6HRG5ILfGlbXja0Vlly/aGVN4irzQlMfisrrBdDyyZDux5VXggXFo8tH2sGcZn3LY87DHS
 liBV/7/YBRiAiWu4ag0a8/oGFwyJHMNEHmVTg4sVzrXbsBFGds7yB+x
X-Developer-Key: i=george.moussalem@outlook.com; a=ed25519;
 pk=/PuRTSI9iYiHwcc6Nrde8qF4ZDhJBlUgpHdhsIjnqIk=
X-Endpoint-Received: by B4 Relay for george.moussalem@outlook.com/20250321
 with auth_id=364
X-Original-From: George Moussalem <george.moussalem@outlook.com>
Reply-To: george.moussalem@outlook.com

From: George Moussalem <george.moussalem@outlook.com>

The IPQ5018 SoC contains a single internal Gigabit Ethernet PHY which
provides an MDI interface directly to an RJ45 connector or an external
switch over a PHY to PHY link.

The internal LDO in the SoC itself needs to be enabled in TCSR to supply
low voltages powering the common ethernet block found in the SoC which
is required by the PHY.

Let's add support for this PHY found in the at803x driver as it falls
within the Qualcomm Atheros OUI.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/phy/qcom/Kconfig  |   2 +-
 drivers/net/phy/qcom/at803x.c | 221 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 214 insertions(+), 9 deletions(-)

diff --git a/drivers/net/phy/qcom/Kconfig b/drivers/net/phy/qcom/Kconfig
index 570626cc8e14d3e6615f74a6377f0f7c9f723e89..84239e08a8dfa466b0a7b2a5ec724a168b692cd2 100644
--- a/drivers/net/phy/qcom/Kconfig
+++ b/drivers/net/phy/qcom/Kconfig
@@ -7,7 +7,7 @@ config AT803X_PHY
 	select QCOM_NET_PHYLIB
 	depends on REGULATOR
 	help
-	  Currently supports the AR8030, AR8031, AR8033, AR8035 model
+	  Currently supports the AR8030, AR8031, AR8033, AR8035, IPQ5018 model
 
 config QCA83XX_PHY
 	tristate "Qualcomm Atheros QCA833x PHYs"
diff --git a/drivers/net/phy/qcom/at803x.c b/drivers/net/phy/qcom/at803x.c
index 26350b962890b0321153d74758b13d817407d094..1e30ccbee74e6463be8db9a7819e5f2e7031ebab 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -7,19 +7,24 @@
  * Author: Matus Ujhelyi <ujhelyi.m@gmail.com>
  */
 
-#include <linux/phy.h>
-#include <linux/module.h>
-#include <linux/string.h>
-#include <linux/netdevice.h>
+#include <linux/bitfield.h>
+#include <linux/clk.h>
+#include <linux/clk-provider.h>
 #include <linux/etherdevice.h>
 #include <linux/ethtool_netlink.h>
-#include <linux/bitfield.h>
-#include <linux/regulator/of_regulator.h>
-#include <linux/regulator/driver.h>
-#include <linux/regulator/consumer.h>
+#include <linux/mfd/syscon.h>
+#include <linux/module.h>
+#include <linux/netdevice.h>
 #include <linux/of.h>
+#include <linux/phy.h>
 #include <linux/phylink.h>
+#include <linux/regmap.h>
+#include <linux/regulator/consumer.h>
+#include <linux/regulator/driver.h>
+#include <linux/regulator/of_regulator.h>
+#include <linux/reset.h>
 #include <linux/sfp.h>
+#include <linux/string.h>
 #include <dt-bindings/net/qca-ar803x.h>
 
 #include "qcom.h"
@@ -96,6 +101,8 @@
 #define ATH8035_PHY_ID				0x004dd072
 #define AT8030_PHY_ID_MASK			0xffffffef
 
+#define IPQ5018_PHY_ID				0x004dd0c0
+
 #define QCA9561_PHY_ID				0x004dd042
 
 #define AT803X_PAGE_FIBER			0
@@ -108,6 +115,46 @@
 /* disable hibernation mode */
 #define AT803X_DISABLE_HIBERNATION_MODE		BIT(2)
 
+#define IPQ5018_PHY_FIFO_CONTROL		0x19
+#define IPQ5018_PHY_FIFO_RESET			GENMASK(1, 0)
+
+#define IPQ5018_PHY_DEBUG_EDAC			0x4380
+#define IPQ5018_PHY_MMD1_MDAC			0x8100
+#define IPQ5018_PHY_DAC_MASK			GENMASK(15, 8)
+
+#define IPQ5018_PHY_MMD1_MSE_THRESH1		0x1000
+#define IPQ5018_PHY_MMD1_MSE_THRESH2		0x1001
+#define IPQ5018_PHY_MMD3_AZ_CTRL1		0x8008
+#define IPQ5018_PHY_MMD3_AZ_CTRL2		0x8009
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL3	0x8074
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL4	0x8075
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL5	0x8076
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL6	0x8077
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL7	0x8078
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL9	0x807a
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL13	0x807e
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL14	0x807f
+
+#define IPQ5018_PHY_MMD1_MSE_THRESH1_VAL	0xf1
+#define IPQ5018_PHY_MMD1_MSE_THRESH2_VAL	0x1f6
+#define IPQ5018_PHY_MMD3_AZ_CTRL1_VAL		0x7880
+#define IPQ5018_PHY_MMD3_AZ_CTRL2_VAL		0xc8
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL3_VAL	0xc040
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL4_VAL	0xa060
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL5_VAL	0xc040
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL6_VAL	0xa060
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL7_VAL	0xc24c
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL9_VAL	0xc060
+#define IPQ5018_PHY_MMD3_CDT_THRESH_CTRL13_VAL	0xb060
+#define IPQ5018_PHY_MMD3_NEAR_ECHO_THRESH_VAL	0x90b0
+
+#define IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE		0x1
+#define IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_MASK	GENMASK(7, 4)
+#define IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_DEFAULT	0x50
+#define IPQ5018_PHY_DEBUG_ANA_DAC_FILTER	0xa080
+
+#define IPQ5018_TCSR_ETH_LDO_READY		BIT(0)
+
 MODULE_DESCRIPTION("Qualcomm Atheros AR803x PHY driver");
 MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_LICENSE("GPL");
@@ -133,6 +180,14 @@ struct at803x_context {
 	u16 led_control;
 };
 
+struct ipq5018_priv {
+	int num_clks;
+	struct clk_bulk_data *clks;
+	struct reset_control *rst;
+	u32 mdac;
+	u32 edac;
+};
+
 static int at803x_write_page(struct phy_device *phydev, int page)
 {
 	int mask;
@@ -987,6 +1042,142 @@ static int at8035_probe(struct phy_device *phydev)
 	return at8035_parse_dt(phydev);
 }
 
+static inline int ipq5018_cmnblk_enable(struct device *dev)
+{
+	unsigned int offset;
+	struct regmap *tcsr;
+
+	tcsr = syscon_regmap_lookup_by_phandle_args(dev->of_node, "qca,eth-ldo-ready",
+						    1, &offset);
+	if (IS_ERR(tcsr))
+		return PTR_ERR(tcsr);
+
+	return regmap_set_bits(tcsr, offset, IPQ5018_TCSR_ETH_LDO_READY);
+}
+
+static int ipq5018_cable_test_start(struct phy_device *phydev)
+{
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_CDT_THRESH_CTRL3,
+		      IPQ5018_PHY_MMD3_CDT_THRESH_CTRL3_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_CDT_THRESH_CTRL4,
+		      IPQ5018_PHY_MMD3_CDT_THRESH_CTRL4_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_CDT_THRESH_CTRL5,
+		      IPQ5018_PHY_MMD3_CDT_THRESH_CTRL5_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_CDT_THRESH_CTRL6,
+		      IPQ5018_PHY_MMD3_CDT_THRESH_CTRL6_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_CDT_THRESH_CTRL7,
+		      IPQ5018_PHY_MMD3_CDT_THRESH_CTRL7_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_CDT_THRESH_CTRL9,
+		      IPQ5018_PHY_MMD3_CDT_THRESH_CTRL9_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_CDT_THRESH_CTRL13,
+		      IPQ5018_PHY_MMD3_CDT_THRESH_CTRL13_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_CDT_THRESH_CTRL3,
+		      IPQ5018_PHY_MMD3_NEAR_ECHO_THRESH_VAL);
+
+	/* we do all the (time consuming) work later */
+	return 0;
+}
+
+static int ipq5018_config_init(struct phy_device *phydev)
+{
+	struct ipq5018_priv *priv = phydev->priv;
+	u16 val = 0;
+
+	/*
+	 * set LDO efuse: first temporarily store ANA_DAC_FILTER value from
+	 * debug register as it will be reset once the ANA_LDO_EFUSE register
+	 * is written to
+	 */
+	val = at803x_debug_reg_read(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER);
+	at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE,
+			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_MASK,
+			      IPQ5018_PHY_DEBUG_ANA_LDO_EFUSE_DEFAULT);
+	at803x_debug_reg_write(phydev, IPQ5018_PHY_DEBUG_ANA_DAC_FILTER, val);
+
+	/* set 8023AZ CTRL values */
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_AZ_CTRL1,
+		      IPQ5018_PHY_MMD3_AZ_CTRL1_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_MMD3_AZ_CTRL2,
+		      IPQ5018_PHY_MMD3_AZ_CTRL2_VAL);
+
+	/* set MSE threshold values */
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MSE_THRESH1,
+		      IPQ5018_PHY_MMD1_MSE_THRESH1_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MSE_THRESH2,
+		      IPQ5018_PHY_MMD1_MSE_THRESH2_VAL);
+
+	if (priv->mdac && priv->edac) {
+		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
+		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
+			       IPQ5018_PHY_DAC_MASK, priv->mdac);
+
+		/* setting EDAC (Error-detection and Correction) in debug register */
+		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
+				      IPQ5018_PHY_DAC_MASK, priv->edac);
+	}
+
+	return 0;
+}
+
+static void ipq5018_link_change_notify(struct phy_device *phydev)
+{
+	mdiobus_modify_changed(phydev->mdio.bus, phydev->mdio.addr,
+			       IPQ5018_PHY_FIFO_CONTROL, IPQ5018_PHY_FIFO_RESET,
+			       phydev->link ? IPQ5018_PHY_FIFO_RESET : 0);
+}
+
+static int ipq5018_probe(struct phy_device *phydev)
+{
+	struct device *dev = &phydev->mdio.dev;
+	struct ipq5018_priv *priv;
+	u32 mdac, edac = 0;
+	int ret, cnt;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	/* PHY DAC values are optional and only set in a PHY to PHY link architecture */
+	cnt = of_property_count_u32_elems(dev->of_node, "qca,dac");
+	if (cnt == 2) {
+		ret = of_property_read_u32_index(dev->of_node, "qca,dac", 0, &mdac);
+		if (!ret)
+			priv->mdac = mdac;
+
+		ret = of_property_read_u32_index(dev->of_node, "qca,dac", 1, &edac);
+		if (!ret)
+			priv->edac = edac;
+	}
+
+	ret = ipq5018_cmnblk_enable(dev);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable LDO controller to CMN BLK");
+
+	priv->num_clks = devm_clk_bulk_get_all(dev, &priv->clks);
+	if (priv->num_clks < 0)
+		return dev_err_probe(dev, priv->num_clks,
+				     "failed to acquire clocks\n");
+
+	ret = clk_bulk_prepare_enable(priv->num_clks, priv->clks);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "failed to enable clocks\n");
+
+	priv->rst = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR_OR_NULL(priv->rst))
+		return dev_err_probe(dev, PTR_ERR(priv->rst),
+				     "failed to acquire reset\n");
+
+	ret = reset_control_reset(priv->rst);
+	if (ret)
+		return dev_err_probe(dev, ret, "failed to reset\n");
+
+	phydev->priv = priv;
+
+	return 0;
+}
+
 static struct phy_driver at803x_driver[] = {
 {
 	/* Qualcomm Atheros AR8035 */
@@ -1078,6 +1269,19 @@ static struct phy_driver at803x_driver[] = {
 	.read_status		= at803x_read_status,
 	.soft_reset		= genphy_soft_reset,
 	.config_aneg		= at803x_config_aneg,
+}, {
+	PHY_ID_MATCH_EXACT(IPQ5018_PHY_ID),
+	.name			= "Qualcomm Atheros IPQ5018 internal PHY",
+	.flags			= PHY_IS_INTERNAL | PHY_POLL_CABLE_TEST,
+	.probe			= ipq5018_probe,
+	.config_init		= ipq5018_config_init,
+	.link_change_notify	= ipq5018_link_change_notify,
+	.read_status		= at803x_read_status,
+	.config_intr		= at803x_config_intr,
+	.handle_interrupt	= at803x_handle_interrupt,
+	.cable_test_start	= ipq5018_cable_test_start,
+	.cable_test_get_status	= qca808x_cable_test_get_status,
+	.soft_reset		= genphy_soft_reset,
 }, {
 	/* Qualcomm Atheros QCA9561 */
 	PHY_ID_MATCH_EXACT(QCA9561_PHY_ID),
@@ -1104,6 +1308,7 @@ static const struct mdio_device_id __maybe_unused atheros_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(ATH8032_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH8035_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH9331_PHY_ID) },
+	{ PHY_ID_MATCH_EXACT(IPQ5018_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA9561_PHY_ID) },
 	{ }
 };

-- 
2.49.0



