Return-Path: <linux-arm-msm+bounces-61164-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA60AD80A5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 03:55:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 870481E3009
	for <lists+linux-arm-msm@lfdr.de>; Fri, 13 Jun 2025 01:55:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8463F1E5734;
	Fri, 13 Jun 2025 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Aqf/N1tB"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53B941DF990;
	Fri, 13 Jun 2025 01:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749779723; cv=none; b=rAc4ZYc7AJomr4SwIJQoBjENJ5bb+aXy9tBCBlTYcrgimXGomVrhMYZB/ApORBceMB1quLFvFtIKK7/qjrMIthSu1zK/c8YxTza+rIXs9lvQ1RumwG3tmQc64smEDyHr84yhDuW59SVjQH3JtGCXdOG27j+hinIR32JRWwMAgGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749779723; c=relaxed/simple;
	bh=ioQAPz2xaDe+HRnOdXbR3y7vvtc51k6zFgxMh+n8twI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gZg4diA19x4H+DexOvncsRjPp+bCFGV6KQpZZxnobr6F+tvkxxxOYJPxLL5NOo/EQUj4OnRa16mxCX8EFrsC/O5s0P29ayf4g/Wn022dQGVrZJbQQt7hP6SMn8NxxQKojDJdyQuFHtP7JlRO/JBMJlZPY6eIkDml0gKBQDLOYbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Aqf/N1tB; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id EB02DC4CEF5;
	Fri, 13 Jun 2025 01:55:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749779723;
	bh=ioQAPz2xaDe+HRnOdXbR3y7vvtc51k6zFgxMh+n8twI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Aqf/N1tBDPtvPZAM1GhcunHi+fV1S3lK+W8ZYvOIkyEXeFnBuExslf8wOXWXVthaP
	 Zl6NWn4OqZXjcDQs1zDKx4APG+018JsmmJ1k9+rCK/yko5h6wNf6UZ8qTyIvaMaVVX
	 b1Iu2U5L2nr/11djmF12setYDuTDht35MpzhpylJcPL9/jDEnnXeuJG75LJ/8fhwlA
	 hEpexhNf1mkiJh6i/bN0NuxA1pbtNbBSXf/5EmzIJaQupcHUXN/q/BSGFK+OLbxXho
	 Co0pYzVMp4qKzQnqdSSwj2xuVCupJx5/LXBhj5e57HmopXV3yrWoujcae3kVADi53+
	 qSvqL3R51R9lQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E42C71150;
	Fri, 13 Jun 2025 01:55:22 +0000 (UTC)
From: George Moussalem via B4 Relay <devnull+george.moussalem.outlook.com@kernel.org>
Date: Fri, 13 Jun 2025 05:55:08 +0400
Subject: [PATCH RESEND net-next v5 2/2] net: phy: qcom: at803x: Add
 Qualcomm IPQ5018 Internal PHY support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250613-ipq5018-ge-phy-v5-2-9af06e34ea6b@outlook.com>
References: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
In-Reply-To: <20250613-ipq5018-ge-phy-v5-0-9af06e34ea6b@outlook.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <f.fainelli@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, George Moussalem <george.moussalem@outlook.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749779719; l=9492;
 i=george.moussalem@outlook.com; s=20250321; h=from:subject:message-id;
 bh=R5k0bIbl9k/QACKkeDffKhqMQ6qO/YSOmshLeIdltn4=;
 b=dc6dGdFri5bKuQH8ZPveu5XTni+GbbDrhGGKQzI1DndxewaK1vg7tJbJt6ZFiyRf+Lotcdbh7
 0hPvHyjJ38oB4K4v6/CN1343nTI75hDsU6vY2x88tnfCP6/wwyZ52YE
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

The PHY supports 10BASE-T/100BASE-TX/1000BASE-T link modes in SGMII
interface mode, CDT, auto-negotiation and 802.3az EEE.

Let's add support for this PHY in the at803x driver as it falls within
the Qualcomm Atheros OUI.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: George Moussalem <george.moussalem@outlook.com>
---
 drivers/net/phy/qcom/Kconfig  |   2 +-
 drivers/net/phy/qcom/at803x.c | 167 ++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 168 insertions(+), 1 deletion(-)

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
index 26350b962890b0321153d74758b13d817407d094..43e604171828ce35d5950e02b1d08ee3e4523fdc 100644
--- a/drivers/net/phy/qcom/at803x.c
+++ b/drivers/net/phy/qcom/at803x.c
@@ -19,6 +19,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/of.h>
 #include <linux/phylink.h>
+#include <linux/reset.h>
 #include <linux/sfp.h>
 #include <dt-bindings/net/qca-ar803x.h>
 
@@ -96,6 +97,8 @@
 #define ATH8035_PHY_ID				0x004dd072
 #define AT8030_PHY_ID_MASK			0xffffffef
 
+#define IPQ5018_PHY_ID				0x004dd0c0
+
 #define QCA9561_PHY_ID				0x004dd042
 
 #define AT803X_PAGE_FIBER			0
@@ -108,6 +111,48 @@
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
+#define IPQ5018_PHY_PCS_EEE_TX_TIMER		0x8008
+#define IPQ5018_PHY_PCS_EEE_RX_TIMER		0x8009
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
+#define IPQ5018_PHY_PCS_EEE_TX_TIMER_VAL	0x7880
+#define IPQ5018_PHY_PCS_EEE_RX_TIMER_VAL	0xc8
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
 MODULE_DESCRIPTION("Qualcomm Atheros AR803x PHY driver");
 MODULE_AUTHOR("Matus Ujhelyi");
 MODULE_LICENSE("GPL");
@@ -133,6 +178,11 @@ struct at803x_context {
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
@@ -987,6 +1037,109 @@ static int at8035_probe(struct phy_device *phydev)
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
+	u16 val;
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
+	/* set 8023AZ EEE TX and RX timer values */
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_EEE_TX_TIMER,
+		      IPQ5018_PHY_PCS_EEE_TX_TIMER_VAL);
+	phy_write_mmd(phydev, MDIO_MMD_PCS, IPQ5018_PHY_PCS_EEE_RX_TIMER,
+		      IPQ5018_PHY_PCS_EEE_RX_TIMER_VAL);
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
+	/*
+	 * Reset the FIFO buffer upon link disconnects to clear any residual data
+	 * which may cause issues with the FIFO which it cannot recover from.
+	 */
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
+	if (IS_ERR(priv->rst))
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
@@ -1078,6 +1231,19 @@ static struct phy_driver at803x_driver[] = {
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
@@ -1104,6 +1270,7 @@ static const struct mdio_device_id __maybe_unused atheros_tbl[] = {
 	{ PHY_ID_MATCH_EXACT(ATH8032_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH8035_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(ATH9331_PHY_ID) },
+	{ PHY_ID_MATCH_EXACT(IPQ5018_PHY_ID) },
 	{ PHY_ID_MATCH_EXACT(QCA9561_PHY_ID) },
 	{ }
 };

-- 
2.49.0



