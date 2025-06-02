Return-Path: <linux-arm-msm+bounces-60049-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 06C7CACAC15
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 11:54:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id DAAC6188F2E1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Jun 2025 09:54:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 411BE1EF0BA;
	Mon,  2 Jun 2025 09:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UTDSKe4L"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED31E9915;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748858006; cv=none; b=ard/vRBuOC92fUQFdTb/rp98/0DRrHK1EX+m7Uw0npq/xpfupLYVoBUZd0Jw0L7Gk06NWo7YbXcOI9fhqeS5xJxsrcsF9ygL8kDLBQK6hYW0Yc0uj3CV3aM7pCuLXBOJC6K9iP+M7y1WJxxh0HgseKjhrvYFDlAiaCVP7H5/5uo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748858006; c=relaxed/simple;
	bh=o9XnE86p7e/+vKba6ZL/A7DxDymIWvcFNdXSEZJcqKI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uaWX5lVOqrl5wdzhs9at5LI2SuwE4zgThMB1mPfkUUcXnhKSzYxkIXdizrZSclZEP9zz+Yg/8mJ9/7GlU4xOglzdXBFXvBOhdJqkK+538FuIFFL6q/GGlScgS9xgkdxqvyXl5cy6XXchwvhSYd643pYQJd0ItARPoNNk7s2Wjlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UTDSKe4L; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6EC04C4CEF8;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748858005;
	bh=o9XnE86p7e/+vKba6ZL/A7DxDymIWvcFNdXSEZJcqKI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=UTDSKe4LpdTDKea9JoNcDm4H46IeMtz+MP9+TYqG1+V2G813bAp68kBIGOz3rFe7i
	 Q+gOOjFu1Vj3gg81C8eHyd5bWZrvVItlVvEt/092pek/orjWNVXhwtLlaMBX22mMoo
	 9X9uIaAnkvHWcbvYNhrs28fcm0jtYgUOucxEDqbVQHjzIxLtz4rIH46d4zRluiL99W
	 77USKPLCqER2nJQKVf3yOC5mg0MSxh5KfWRJlk7Gz5czjnNOotFcE+KWUkgQrhscrH
	 IRPfOqp+mZkwFm7VunvTfYeGIEmHOO3YlKaFJVTxQ2bpZdWT8WuhR2eFilt4HF+9JK
	 q405S7yHiFB0A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62106C54FB3;
	Mon,  2 Jun 2025 09:53:25 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Mon, 02 Jun 2025 13:53:15 +0400
Subject: [PATCH v3 3/5] net: phy: qcom: at803x: Add Qualcomm IPQ5018
 Internal PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250602-ipq5018-ge-phy-v3-3-421337a031b2@outlook.com>
References: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
In-Reply-To: <20250602-ipq5018-ge-phy-v3-0-421337a031b2@outlook.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748858002; l=10020;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=fAqFmmrHS9SwsM+fagAKrdxW+B0gISXJNK2eufuTxAE=;
 b=1jEHfObbPpTzD9u2xb3aLh2JCIWIEBj6p3owC+sbqV/tBUJSxEBUkZ3yujhZbZkD6f3o7dzsg
 BY7hczqevTIB/gueIq+n2Xh/P23r4LsgsUzmTaLfq5poRWQdJWsFCfN
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

The PHY supports 10/100/1000 mbps link modes, CDT, auto-negotiation and
802.3az EEE.

Let's add support for this PHY in the at803x driver as it falls within
the Qualcomm Atheros OUI.

Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/phy/qcom/Kconfig  |   2 +-
 drivers/net/phy/qcom/at803x.c | 185 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 178 insertions(+), 9 deletions(-)

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
index 26350b962890b0321153d74758b13d817407d094..c148e245b5391c5da374ace8609dcdfd8284732d 100644
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
@@ -108,6 +115,50 @@
 /* disable hibernation mode */
 #define AT803X_DISABLE_HIBERNATION_MODE		BIT(2)
 
+#define IPQ5018_PHY_FIFO_CONTROL		0x19
+#define IPQ5018_PHY_FIFO_RESET			GENMASK(1, 0)
+
+#define IPQ5018_PHY_DEBUG_EDAC			0x4380
+#define IPQ5018_PHY_MMD1_MDAC			0x8100
+#define IPQ5018_PHY_DAC_MASK			GENMASK(15, 8)
+
+/* MDAC and EDAC values for short cable length */
+#define IPQ5018_PHY_DEBUG_EDAC_VAL		0x10
+#define IPQ5018_PHY_MMD1_MDAC_VAL		0x10
+
+#define IPQ5018_PHY_MMD1_MSE_THRESH1		0x1000
+#define IPQ5018_PHY_MMD1_MSE_THRESH2		0x1001
+#define IPQ5018_PHY_PCS_AZ_CTRL1		0x8008
+#define IPQ5018_PHY_PCS_AZ_CTRL2		0x8009
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL3	0x8074
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL4	0x8075
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL5	0x8076
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL6	0x8077
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL7	0x8078
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL9	0x807a
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL13	0x807e
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL14	0x807f
+
+#define IPQ5018_PHY_MMD1_MSE_THRESH1_VAL	0xf1
+#define IPQ5018_PHY_MMD1_MSE_THRESH2_VAL	0x1f6
+#define IPQ5018_PHY_PCS_AZ_CTRL1_VAL		0x7880
+#define IPQ5018_PHY_PCS_AZ_CTRL2_VAL		0xc8
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL3_VAL	0xc040
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL4_VAL	0xa060
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL5_VAL	0xc040
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL6_VAL	0xa060
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL7_VAL	0xc24c
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL9_VAL	0xc060
+#define IPQ5018_PHY_PCS_CDT_THRESH_CTRL13_VAL	0xb060
+#define IPQ5018_PHY_PCS_NEAR_ECHO_THRESH_VAL	0x90b0
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
@@ -133,6 +184,11 @@ struct at803x_context {
 	u16 led_control;
 };
 
+struct ipq5018_priv {
+	struct reset_control *rst;
+	bool set_short_cable_dac;
+};
+
 static int at803x_write_page(struct phy_device *phydev, int page)
 {
 	int mask;
@@ -987,6 +1043,105 @@ static int at8035_probe(struct phy_device *phydev)
 	return at8035_parse_dt(phydev);
 }
 
+static int ipq5018_cable_test_start(struct phy_device *phydev)
+{
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL3,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL3_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL4,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL4_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL5,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL5_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL6,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL6_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL7,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL7_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL9,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL9_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL13,
+		      IPQ5018_PHY_PCS_CDT_THRESH_CTRL13_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_CDT_THRESH_CTRL3,
+		      IPQ5018_PHY_PCS_NEAR_ECHO_THRESH_VAL);
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
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_AZ_CTRL1,
+		      IPQ5018_PHY_PCS_AZ_CTRL1_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_AZ_CTRL2,
+		      IPQ5018_PHY_PCS_AZ_CTRL2_VAL);
+
+	/* set MSE threshold values */
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MSE_THRESH1,
+		      IPQ5018_PHY_MMD1_MSE_THRESH1_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MSE_THRESH2,
+		      IPQ5018_PHY_MMD1_MSE_THRESH2_VAL);
+
+	/* PHY DAC values are optional and only set in a PHY to PHY link architecture */
+	if (priv->set_short_cable_dac) {
+		/* setting MDAC (Multi-level Digital-to-Analog Converter) in MMD1 */
+		phy_modify_mmd(phydev, MDIO_MMD_PMAPMD, IPQ5018_PHY_MMD1_MDAC,
+			       IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_MMD1_MDAC_VAL);
+
+		/* setting EDAC (Error-detection and Correction) in debug register */
+		at803x_debug_reg_mask(phydev, IPQ5018_PHY_DEBUG_EDAC,
+				      IPQ5018_PHY_DAC_MASK, IPQ5018_PHY_DEBUG_EDAC_VAL);
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
+	int ret;
+
+	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
+	if (!priv)
+		return -ENOMEM;
+
+	priv->set_short_cable_dac = of_property_read_bool(dev->of_node,
+							  "qcom,dac-preset-short-cable");
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
@@ -1078,6 +1233,19 @@ static struct phy_driver at803x_driver[] = {
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
@@ -1104,6 +1272,7 @@ static const struct mdio_device_id __maybe_unused atheros_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(ATH8032_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH8035_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH9331_PHY_ID) },
+	{ PHY_ID_MATCH_EXACT(IPQ5018_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA9561_PHY_ID) },
 	{ }
 };

-- 
2.49.0



