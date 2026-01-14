Return-Path: <linux-arm-msm+bounces-89048-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 1664BD209CD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 18:46:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 1EC683021075
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Jan 2026 17:45:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 857B8324B17;
	Wed, 14 Jan 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="RZBM/2Gx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3472DFF1D;
	Wed, 14 Jan 2026 17:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768412753; cv=none; b=SzUgcd+oxueVRcJWF9pJu849XH8/fLWUXGdyAHTxnLHGvbAuVdg3ZD4ct5p4rz371eQX8YVyErgo2vvcxDaeQ4T6dZlM78QjGPC7bfj0/XzCdHeN/L6W7hABrgJjC5SFGrDOIIDm2JPTyNXaqWnti53V+XLNlCL+tXncUszLS9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768412753; c=relaxed/simple;
	bh=Fja7zZ/IbY6rIgVETmf9NfpVqXuClk9UCWSXxSvM3T0=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=YCED//wH28mXtUgCpl8IBW/lIyL/lr61qv49zDMWUhn+YSwI/RT2NQARs2VxDiztdXZXiRUXc0Kn1MriG0ZxRf3D4aitZUj8Vd6U9uNpZYki2KUOnpqeMcV+tITRL5TWQe5KoqsDDvdPrgSZyT3WwyFN500/ocwQ6o1S3JRIAeg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=RZBM/2Gx; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PTOfMz7z0v1J8r41pBpP94Dc6sjLwICPNMLQ5XLHH5Y=; b=RZBM/2Gx04IUyIAiDyXZ+dWCgJ
	WaLraZGb/rD8ZVk4/a1wNP8qiZdIRlx0gwce24j4i72gyCGwfhwNc1CN1yL8lzYd+kNKSllBO+DYx
	vFIYyVqlAWqV5fhkF8HJ3/AsJfpbqVooaJtUWWThmslhyLtcFb22nuANd6hwb8djOvhEtLPVRWzLP
	7UbUvXbUNnNc/OWJ02ckDTTbnG/40WSbo1ClhZ8JkGztpZfRbrVDSmwhuwHgDH0Zw0URWmE+ajfDG
	vhIMSkn3bWr2UnSmZzF/76qXv2IM86LOT436lsX9mFT2BCxYmyW1lz+O9sGpddvWe1CSqIMmhSJtj
	AINbeNZA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:40212 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vg4w4-000000000U5-0Sdl;
	Wed, 14 Jan 2026 17:45:36 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vg4w2-00000003SG5-2FH5;
	Wed, 14 Jan 2026 17:45:34 +0000
In-Reply-To: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
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
Message-Id: <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 14 Jan 2026 17:45:34 +0000

Rather than having platform glue implement SerDes PHY support, add it
to the core driver, specifically to the stmmac integrated PCS driver
as the SerDes is connected to the integrated PCS.

Platforms using external PCS can also populate plat->serdes, and the
core driver will call phy_init() and phy_exit() when the administrative
state of the interface changes, but the other phy methods will not be
called.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
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
index 000000000000..3003e1ae38d2
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
+	if (phy_get_mode(serdes) == PHY_MODE_ETHERNET)
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


