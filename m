Return-Path: <linux-arm-msm+bounces-89656-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73FE5D3A8F8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:35:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id C1A4B30486B2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:34:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E1EB35A939;
	Mon, 19 Jan 2026 12:34:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="L7epFtVk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9223D28FFE7;
	Mon, 19 Jan 2026 12:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826060; cv=none; b=OH3SzGo4haImms/RvBtbnIDAPpgTVNs1vDX4+DEYMadUtdvpJzn+92f24f1qGL+qbAErCFOGZt35MKCVwLyTVwUiSbtX3/2ds0qVPwpwo8P00NDBivoKOSiJ7hxtR4jEHiEQs9HATX7QTPDv0l51MtCW3J7vG9aRklAc5nuzTTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826060; c=relaxed/simple;
	bh=pAgAFCApchRHEZKYSc3KxzzjZEBj8SAKOBEiKKka5tU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=g/dsZqs/mueEiJpjQmLPgBccORzrctsJq51l3HPiszjbgm6I8DSjoK96gMpGHyj4MG5H5luwhuGRzggi0Ys3+arT7miPltcK3kJUxpSwbCXRnmmgROkx3zLeTsQGVWzUUBDQTyhyEHvlKgLNg/OJJL7mkgk9sQAp2n5MXCDLRVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=L7epFtVk; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=29OlLnxxrvvgvoEr2VUcWHs7YNVIlbiFByX7LDRKo6E=; b=L7epFtVkEZFJvR1h2hTP+qJO2h
	PVtyhyYMfJPUIgNtsiQKMuvwVv4UOpUXNAjOrBAvk/8833tn4NaZD5X78StJm0ucgAkz/mufJowfJ
	juFQg0ZxWxfb3PZWvYQvR6073Kc6TyoftKIvW87a0yfs5OrkbaPpU/8qDxmH5An3ZxWhqSiAYZNWI
	Rgx+K4wL05JsYVD/aemKGW6rLITX0mcV9NIUYvA0SxWnElQClBdpCVzg2cdZyEe0UhvM4W58t2+gM
	iAn49rLCllYf6AwRhDuwogdB6PT53LJbcnVfE25aDnjqPgFhvyWMX0E7BuocH9mROKhdfmf41rnIR
	pfXtvpIw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58586 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vhoSK-0000000052r-2dVw;
	Mon, 19 Jan 2026 12:34:04 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vhoSH-00000005H1f-2cq9;
	Mon, 19 Jan 2026 12:34:01 +0000
In-Reply-To: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
References: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
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
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 05/14] net: stmmac: add stmmac core serdes support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vhoSH-00000005H1f-2cq9@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:34:01 +0000

Rather than having platform glue implement SerDes PHY support, add it
to the core driver, specifically to the stmmac integrated PCS driver
as the SerDes is connected to the integrated PCS.

Platforms using external PCS can also populate plat->serdes, and the
core driver will call phy_init() and phy_exit() when the administrative
state of the interface changes, but the other phy methods will not be
called.

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
--
rfc->v1: avoid calling phy_get_mode() with NULL serdes PHY
---
 drivers/net/ethernet/stmicro/stmmac/Makefile  |   2 +-
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  14 ++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  |  38 +++++-
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  |   1 +
 .../ethernet/stmicro/stmmac/stmmac_serdes.c   | 111 ++++++++++++++++++
 .../ethernet/stmicro/stmmac/stmmac_serdes.h   |  16 +++
 include/linux/stmmac.h                        |   2 +
 7 files changed, 180 insertions(+), 4 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index c9263987ef8d..a3c2cd5d0c91 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -7,7 +7,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
 	      stmmac_xdp.o stmmac_est.o stmmac_fpe.o stmmac_vlan.o \
-	      stmmac_pcs.o $(stmmac-y)
+	      stmmac_pcs.o stmmac_serdes.o $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 24a2555ca329..6c515f9efbe7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -48,6 +48,7 @@
 #include "stmmac_fpe.h"
 #include "stmmac.h"
 #include "stmmac_pcs.h"
+#include "stmmac_serdes.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
 #include <linux/of_mdio.h>
@@ -3549,12 +3550,16 @@ static void stmmac_safety_feat_configuration(struct stmmac_priv *priv)
 
 static void stmmac_clk_rx_i_require(struct stmmac_priv *priv)
 {
+	dwmac_serdes_power_on(priv);
+	/* Only sets the SerDes mode if it wasn't already configured. */
+	dwmac_serdes_init_mode(priv, priv->plat->phy_interface);
 	phylink_rx_clk_stop_block(priv->phylink);
 }
 
 static void stmmac_clk_rx_i_release(struct stmmac_priv *priv)
 {
 	phylink_rx_clk_stop_unblock(priv->phylink);
+	dwmac_serdes_power_off(priv);
 }
 
 /**
@@ -4152,10 +4157,14 @@ static int stmmac_open(struct net_device *dev)
 	if (ret)
 		goto err_runtime_pm;
 
-	ret = __stmmac_open(dev, dma_conf);
+	ret = dwmac_serdes_init(priv);
 	if (ret)
 		goto err_disconnect_phy;
 
+	ret = __stmmac_open(dev, dma_conf);
+	if (ret)
+		goto err_serdes;
+
 	kfree(dma_conf);
 
 	/* We may have called phylink_speed_down before */
@@ -4163,6 +4172,8 @@ static int stmmac_open(struct net_device *dev)
 
 	return ret;
 
+err_serdes:
+	dwmac_serdes_exit(priv);
 err_disconnect_phy:
 	phylink_disconnect_phy(priv->phylink);
 err_runtime_pm:
@@ -4226,6 +4237,7 @@ static int stmmac_release(struct net_device *dev)
 
 	__stmmac_release(dev);
 
+	dwmac_serdes_exit(priv);
 	phylink_disconnect_phy(priv->phylink);
 	pm_runtime_put(priv->device);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
index 2f826fe7229b..4d1902f3a58f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -1,12 +1,25 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include "stmmac.h"
 #include "stmmac_pcs.h"
+#include "stmmac_serdes.h"
 
 static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	struct stmmac_priv *priv = spcs->priv;
+	int ret;
 
-	stmmac_mac_irq_modify(spcs->priv, 0, spcs->int_mask);
+	ret = dwmac_serdes_power_on(priv);
+	if (ret)
+		return ret;
+
+	if (spcs->interface != PHY_INTERFACE_MODE_NA) {
+		ret = dwmac_serdes_set_mode(priv, spcs->interface);
+		if (ret)
+			return ret;
+	}
+
+	stmmac_mac_irq_modify(priv, 0, spcs->int_mask);
 
 	return 0;
 }
@@ -14,8 +27,11 @@ static int dwmac_integrated_pcs_enable(struct phylink_pcs *pcs)
 static void dwmac_integrated_pcs_disable(struct phylink_pcs *pcs)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	struct stmmac_priv *priv = spcs->priv;
 
-	stmmac_mac_irq_modify(spcs->priv, spcs->int_mask, 0);
+	stmmac_mac_irq_modify(priv, spcs->int_mask, 0);
+
+	dwmac_serdes_power_off(priv);
 }
 
 static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
@@ -32,6 +48,15 @@ static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
 				       bool permit_pause_to_mac)
 {
 	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+	int ret;
+
+	if (spcs->interface != interface) {
+		ret = dwmac_serdes_set_mode(spcs->priv, interface);
+		if (ret)
+			return ret;
+
+		spcs->interface = interface;
+	}
 
 	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
 
@@ -71,6 +96,7 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 			       u32 int_mask)
 {
 	struct stmmac_pcs *spcs;
+	int ret;
 
 	spcs = devm_kzalloc(priv->device, sizeof(*spcs), GFP_KERNEL);
 	if (!spcs)
@@ -81,6 +107,14 @@ int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset,
 	spcs->int_mask = int_mask;
 	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
 
+	if (priv->plat->serdes) {
+		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_SGMII);
+		if (ret)
+			dev_warn(priv->device,
+				 "serdes does not support SGMII: %pe\n",
+				 ERR_PTR(ret));
+	}
+
 	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
 
 	priv->integrated_pcs = spcs;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index c4e6b242d390..36bf75fdf478 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -53,6 +53,7 @@ struct stmmac_pcs {
 	struct stmmac_priv *priv;
 	void __iomem *base;
 	u32 int_mask;
+	phy_interface_t interface;
 	struct phylink_pcs pcs;
 };
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
new file mode 100644
index 000000000000..d46a071bc383
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
@@ -0,0 +1,111 @@
+#include <linux/phy/phy.h>
+
+#include "stmmac.h"
+#include "stmmac_serdes.h"
+
+static phy_interface_t dwmac_serdes_phy_modes[] = {
+	PHY_INTERFACE_MODE_SGMII,
+	PHY_INTERFACE_MODE_1000BASEX,
+	PHY_INTERFACE_MODE_2500BASEX
+};
+
+int dwmac_serdes_validate(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	return phy_validate(priv->plat->serdes, PHY_MODE_ETHERNET, interface,
+			    NULL);
+}
+
+int dwmac_serdes_init(struct stmmac_priv *priv)
+{
+	size_t i;
+	int ret;
+
+	if (!priv->plat->serdes)
+		return 0;
+
+	/* Encourage good implementation of the SerDes PHY driver, so that
+	 * we can discover which Ethernet modes the SerDes supports.
+	 * Unfortunately, some implementations are noisy (bad), others
+	 * require phy_set_speed() to select the correct speed first
+	 * (which then reprograms the SerDes, negating the whole point of
+	 * phy_validate().) Weed out these incompatible implementations.
+	 */
+	for (i = 0; i < ARRAY_SIZE(dwmac_serdes_phy_modes); i++) {
+		ret = phy_validate(priv->plat->serdes, PHY_MODE_ETHERNET,
+				   dwmac_serdes_phy_modes[i], NULL);
+		if (ret == 0 || ret == -EOPNOTSUPP)
+			break;
+	}
+
+	if (ret == -EOPNOTSUPP)
+		dev_warn(priv->device,
+			 "SerDes driver does not implement phy_validate()\n");
+	if (ret) {
+		/* The SerDes PHY failed validation, refuse to use it. */
+		dev_warn(priv->device,
+			 "SerDes driver fails to validate SGMII, 1000BASE-X nor 2500BASE-X\n");
+		return -EINVAL;
+	}
+
+	ret = phy_init(priv->plat->serdes);
+	if (ret)
+		dev_err(priv->device, "failed to initialize SerDes: %pe\n",
+			ERR_PTR(ret));
+
+	return ret;
+}
+
+int dwmac_serdes_power_on(struct stmmac_priv *priv)
+{
+	int ret;
+
+	ret = phy_power_on(priv->plat->serdes);
+	if (ret)
+		dev_err(priv->device, "failed to power on SerDes: %pe\n",
+			ERR_PTR(ret));
+
+	return ret;
+}
+
+int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	struct phy *serdes = priv->plat->serdes;
+
+	if (!serdes || phy_get_mode(serdes) == PHY_MODE_ETHERNET)
+		return 0;
+
+	return dwmac_serdes_set_mode(priv, interface);
+}
+
+int dwmac_serdes_set_mode(struct stmmac_priv *priv, phy_interface_t interface)
+{
+	struct phy *serdes = priv->plat->serdes;
+	int ret;
+
+	ret = phy_set_mode_ext(serdes, PHY_MODE_ETHERNET, interface);
+	if (ret)
+		dev_err(priv->device,
+			"failed to set SerDes mode %s: %pe\n",
+			phy_modes(interface), ERR_PTR(ret));
+
+	return ret;
+}
+
+void dwmac_serdes_power_off(struct stmmac_priv *priv)
+{
+	int ret;
+
+	ret = phy_power_off(priv->plat->serdes);
+	if (ret)
+		dev_err(priv->device, "failed to power off SerDes: %pe\n",
+			ERR_PTR(ret));
+}
+
+void dwmac_serdes_exit(struct stmmac_priv *priv)
+{
+	int ret = phy_exit(priv->plat->serdes);
+
+	if (ret)
+		dev_err(priv->device, "failed to shutdown SerDes: %pe\n",
+			ERR_PTR(ret));
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
new file mode 100644
index 000000000000..a31e6c9e0570
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h
@@ -0,0 +1,16 @@
+#ifndef STMMAC_SERDES_H
+#define STMMAC_SERDES_H
+
+#include <linux/phy.h>
+
+struct stmmac_priv;
+
+int dwmac_serdes_validate(struct stmmac_priv *priv, phy_interface_t interface);
+int dwmac_serdes_init(struct stmmac_priv *priv);
+int dwmac_serdes_power_on(struct stmmac_priv *priv);
+int dwmac_serdes_init_mode(struct stmmac_priv *priv, phy_interface_t interface);
+int dwmac_serdes_set_mode(struct stmmac_priv *priv, phy_interface_t interface);
+void dwmac_serdes_power_off(struct stmmac_priv *priv);
+void dwmac_serdes_exit(struct stmmac_priv *priv);
+
+#endif
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index f1054b9c2d8a..4db506e5cf13 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -193,6 +193,7 @@ enum dwmac_core_type {
 #define STMMAC_FLAG_HWTSTAMP_CORRECT_LATENCY	BIT(13)
 
 struct mac_device_info;
+struct phy;
 
 struct plat_stmmacenet_data {
 	enum dwmac_core_type core_type;
@@ -222,6 +223,7 @@ struct plat_stmmacenet_data {
 	 * that phylink uses.
 	 */
 	phy_interface_t phy_interface;
+	struct phy *serdes;
 	struct stmmac_mdio_bus_data *mdio_bus_data;
 	struct device_node *phy_node;
 	struct fwnode_handle *port_node;
-- 
2.47.3


