Return-Path: <linux-arm-msm+bounces-77612-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id A62A1BE4128
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 17:02:04 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1290584BF9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 16 Oct 2025 15:01:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C004B34AAE4;
	Thu, 16 Oct 2025 15:00:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="EzU5Fsnp"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93378346A0A;
	Thu, 16 Oct 2025 15:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760626823; cv=none; b=Iu1CVb0i9vuUr0agAkzO2jgodMZFfH0KdkzZJviQ/zs/zcwfXplm/E6IIU9S0DGB9bi54usqw4KxyQLA4OSYGtlPZD1NRDUrbQjG6wR7mAvP8tWFIc1qcd7u8U5P2GRpXXUsL/Dy4ycKdnjHICPzpgSqHWoH0/CNRzlEVmmETM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760626823; c=relaxed/simple;
	bh=LLrjcGKYYSgcPgs7kae+mDqeVpl+BDaHS4G86zuh3UI=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=mp29mWquIlfHr9yqPgWiBiGWpTUrrYYbKQuqYKONW+UjMVgUOkGJ2IFSvct9bWI7ZK7gpwz1gZPGjFr+lt2wXyglATM4jy4/TPOz8H3/E8pWRfWRdiWVQ7b1j9hqHcpe1uLqsgcb6oZlGvzfQHfS+e/gHm4o4frwJqYILhxFJl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=EzU5Fsnp; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=s74ElwPBIEXc0Zyt7YMHbYnv2zAHeVKDhcI1T/Ytvko=; b=EzU5FsnpBlMV3GFIWDtLqoWk2+
	esrfcbjyeD5Nf5kAj2o0MG0TYLglRD4MWmco2Eqbv7GGqVfUL68ofQ8RoE/K7gsfGLOpm0sCuT3w/
	h39yzEDxKheNahYCZbHbsLL4XMhmgbghynT3UGhEsmaIXas6ASviNAnh05n2re+Ha4fzLP4Wx/OmT
	skgBqjw+GZ1Hul/bd4N9hNVpn7yMVKX99/Yt+xJIQSvf/wPws/3rEFaG+b1kz62hulHN84DXRN28G
	To1RYTY9Z32SV8i2452OwoFCNqA/kHy0IxBYzOS1GEBeyc6sVNdBPJQ4IFR5d5fI4h2jJWFpm4sRh
	OcELO2IQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50480 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1v9P7A-000000006Sd-46CR;
	Thu, 16 Oct 2025 15:38:02 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1v9P72-0000000AomR-3ro4;
	Thu, 16 Oct 2025 15:37:52 +0100
In-Reply-To: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
References: <aPECqg0vZGnBFCbh@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>
Cc: Abhishek Chauhan <quic_abchauha@quicinc.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Alexis Lothore <alexis.lothore@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Boon Khai Ng <boon.khai.ng@altera.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <dfustini@tenstorrent.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Eric Dumazet <edumazet@google.com>,
	Faizal Rahim <faizal.abdul.rahim@linux.intel.com>,
	Furong Xu <0x1207@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Jacob Keller <jacob.e.keller@intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	"Jan Petrous (OSS)" <jan.petrous@oss.nxp.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Matthew Gerlach <matthew.gerlach@altera.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Michal Swiatkowski <michal.swiatkowski@linux.intel.com>,
	netdev@vger.kernel.org,
	Oleksij Rempel <o.rempel@pengutronix.de>,
	Paolo Abeni <pabeni@redhat.com>,
	Rohan G Thomas <rohan.g.thomas@altera.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Simon Horman <horms@kernel.org>,
	Song Yoong Siang <yoong.siang.song@intel.com>,
	Swathi K S <swathi.ks@samsung.com>,
	Tiezhu Yang <yangtiezhu@loongson.cn>,
	Vinod Koul <vkoul@kernel.org>,
	Vladimir Oltean <olteanv@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Yu-Chun Lin <eleanor15x@gmail.com>
Subject: [PATCH net-next v2 14/14] net: stmmac: convert to phylink PCS support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1v9P72-0000000AomR-3ro4@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 16 Oct 2025 15:37:52 +0100

Now that stmmac's PCS support is much more simple - just a matter of
configuring the control register - the basic conversion to phylink PCS
support becomes straight forward.

Create the infrastructure to setup a phylink_pcs instance for the
integrated PCS:
- add a struct stmmac_pcs to encapsulate the phylink_pcs structure,
  pointer to stmmac_priv, and the core-specific base address of the PCS
  registers.
- modify stmmac_priv and stmmac_mac_select_pcs() to return the embedded
  phylink_pcs structure when setup and STMMAC_PCS_SGMII is in use, and
  move the comment from stmmac_hw_setup() to here.
- create stmmac_pcs.c, which contains the phylink_pcs_ops structure, a
  dummy .pcs_get_state() method which always reports link-down, and
  .pcs_config() method, moving the call to stmmac_pcs_ctrl_ane() here,
  but without indirecting through the dwmac specific core code. The
  link-down behaviour mentioned above maintains the current behaviour
  when phylink is used with inband but without a PCS.

This will ensure that the PCS control register is configured to the
same settings as before, but will now happen when the netdev is opened
or reusmed rather than only during probe time. However, this will be
before the .fix_mac_speed() method is called, which is critical for the
behaviour in dwmac-qcom-ethqos's ethqos_configure_sgmii() function to
be maintained.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
v2: add comment about why the link-down function is added.
---
 drivers/net/ethernet/stmicro/stmmac/Makefile  |  2 +-
 .../ethernet/stmicro/stmmac/dwmac1000_core.c  |  9 ++++
 .../net/ethernet/stmicro/stmmac/dwmac4_core.c | 11 +++++
 drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  4 ++
 .../net/ethernet/stmicro/stmmac/stmmac_main.c | 15 +++---
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.c  | 47 +++++++++++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_pcs.h  | 17 +++++++
 7 files changed, 97 insertions(+), 8 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c

diff --git a/drivers/net/ethernet/stmicro/stmmac/Makefile b/drivers/net/ethernet/stmicro/stmmac/Makefile
index 51e068e26ce4..11c0ba2ccdb1 100644
--- a/drivers/net/ethernet/stmicro/stmmac/Makefile
+++ b/drivers/net/ethernet/stmicro/stmmac/Makefile
@@ -7,7 +7,7 @@ stmmac-objs:= stmmac_main.o stmmac_ethtool.o stmmac_mdio.o ring_mode.o	\
 	      dwmac4_dma.o dwmac4_lib.o dwmac4_core.o dwmac5.o hwif.o \
 	      stmmac_tc.o dwxgmac2_core.o dwxgmac2_dma.o dwxgmac2_descs.o \
 	      stmmac_xdp.o stmmac_est.o stmmac_fpe.o stmmac_vlan.o \
-	      $(stmmac-y)
+	      stmmac_pcs.o $(stmmac-y)
 
 stmmac-$(CONFIG_STMMAC_SELFTESTS) += stmmac_selftests.o
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
index d35db8958be1..571e48362444 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac1000_core.c
@@ -22,6 +22,14 @@
 #include "stmmac_ptp.h"
 #include "dwmac1000.h"
 
+static int dwmac1000_pcs_init(struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.pcs)
+		return 0;
+
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+}
+
 static void dwmac1000_core_init(struct mac_device_info *hw,
 				struct net_device *dev)
 {
@@ -435,6 +443,7 @@ static void dwmac1000_set_mac_loopback(void __iomem *ioaddr, bool enable)
 }
 
 const struct stmmac_ops dwmac1000_ops = {
+	.pcs_init = dwmac1000_pcs_init,
 	.core_init = dwmac1000_core_init,
 	.set_mac = stmmac_set_mac,
 	.rx_ipc = dwmac1000_rx_ipc_enable,
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
index d855ab6b9145..0b785389b7ef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c
@@ -22,6 +22,14 @@
 #include "dwmac4.h"
 #include "dwmac5.h"
 
+static int dwmac4_pcs_init(struct stmmac_priv *priv)
+{
+	if (!priv->dma_cap.pcs)
+		return 0;
+
+	return stmmac_integrated_pcs_init(priv, GMAC_PCS_BASE);
+}
+
 static void dwmac4_core_init(struct mac_device_info *hw,
 			     struct net_device *dev)
 {
@@ -875,6 +883,7 @@ static int dwmac4_config_l4_filter(struct mac_device_info *hw, u32 filter_no,
 }
 
 const struct stmmac_ops dwmac4_ops = {
+	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_set_mac,
@@ -909,6 +918,7 @@ const struct stmmac_ops dwmac4_ops = {
 };
 
 const struct stmmac_ops dwmac410_ops = {
+	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
@@ -945,6 +955,7 @@ const struct stmmac_ops dwmac410_ops = {
 };
 
 const struct stmmac_ops dwmac510_ops = {
+	.pcs_init = dwmac4_pcs_init,
 	.core_init = dwmac4_core_init,
 	.update_caps = dwmac4_update_caps,
 	.set_mac = stmmac_dwmac4_set_mac,
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index 7ca5477be390..34f62993a4da 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -25,6 +25,8 @@
 #include <net/xdp.h>
 #include <uapi/linux/bpf.h>
 
+struct stmmac_pcs;
+
 struct stmmac_resources {
 	void __iomem *addr;
 	u8 mac[ETH_ALEN];
@@ -273,6 +275,8 @@ struct stmmac_priv {
 	unsigned int pause_time;
 	struct mii_bus *mii;
 
+	struct stmmac_pcs *integrated_pcs;
+
 	struct phylink_config phylink_config;
 	struct phylink *phylink;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index 35cd881b3496..b2c23ace49b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -46,6 +46,7 @@
 #include "stmmac_ptp.h"
 #include "stmmac_fpe.h"
 #include "stmmac.h"
+#include "stmmac_pcs.h"
 #include "stmmac_xdp.h"
 #include <linux/reset.h>
 #include <linux/of_mdio.h>
@@ -850,6 +851,13 @@ static struct phylink_pcs *stmmac_mac_select_pcs(struct phylink_config *config,
 			return pcs;
 	}
 
+	/* The PCS control register is only relevant for SGMII, TBI and RTBI
+	 * modes. We no longer support TBI or RTBI, so only configure this
+	 * register when operating in SGMII mode with the integrated PCS.
+	 */
+	if (priv->hw->pcs & STMMAC_PCS_SGMII && priv->integrated_pcs)
+		return &priv->integrated_pcs->pcs;
+
 	return NULL;
 }
 
@@ -3487,13 +3495,6 @@ static int stmmac_hw_setup(struct net_device *dev)
 		}
 	}
 
-	/* The PCS control register is only relevant for SGMII, TBI and RTBI
-	 * modes. We no longer support TBI or RTBI, so only configure this
-	 * register when operating in SGMII mode with the integrated PCS.
-	 */
-	if (priv->hw->pcs & STMMAC_PCS_SGMII)
-		stmmac_pcs_ctrl_ane(priv, 1, priv->hw->reverse_sgmii_enable);
-
 	/* set TX and RX rings length */
 	stmmac_set_rings_length(priv);
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
new file mode 100644
index 000000000000..50ea51d7a1cc
--- /dev/null
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c
@@ -0,0 +1,47 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include "stmmac.h"
+#include "stmmac_pcs.h"
+
+static void dwmac_integrated_pcs_get_state(struct phylink_pcs *pcs,
+					   unsigned int neg_mode,
+					   struct phylink_link_state *state)
+{
+	state->link = false;
+}
+
+static int dwmac_integrated_pcs_config(struct phylink_pcs *pcs,
+				       unsigned int neg_mode,
+				       phy_interface_t interface,
+				       const unsigned long *advertising,
+				       bool permit_pause_to_mac)
+{
+	struct stmmac_pcs *spcs = phylink_pcs_to_stmmac_pcs(pcs);
+
+	dwmac_ctrl_ane(spcs->base, 0, 1, spcs->priv->hw->reverse_sgmii_enable);
+
+	return 0;
+}
+
+static const struct phylink_pcs_ops dwmac_integrated_pcs_ops = {
+	.pcs_get_state = dwmac_integrated_pcs_get_state,
+	.pcs_config = dwmac_integrated_pcs_config,
+};
+
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset)
+{
+	struct stmmac_pcs *spcs;
+
+	spcs = devm_kzalloc(priv->device, sizeof(*spcs), GFP_KERNEL);
+	if (!spcs)
+		return -ENOMEM;
+
+	spcs->priv = priv;
+	spcs->base = priv->ioaddr + offset;
+	spcs->pcs.ops = &dwmac_integrated_pcs_ops;
+
+	__set_bit(PHY_INTERFACE_MODE_SGMII, spcs->pcs.supported_interfaces);
+
+	priv->integrated_pcs = spcs;
+
+	return 0;
+}
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
index 5778f5b2f313..64397ac8ecab 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h
@@ -9,6 +9,7 @@
 #ifndef __STMMAC_PCS_H__
 #define __STMMAC_PCS_H__
 
+#include <linux/phylink.h>
 #include <linux/slab.h>
 #include <linux/io.h>
 #include "common.h"
@@ -46,6 +47,22 @@
 #define GMAC_ANE_RFE_SHIFT	12
 #define GMAC_ANE_ACK		BIT(14)
 
+struct stmmac_priv;
+
+struct stmmac_pcs {
+	struct stmmac_priv *priv;
+	void __iomem *base;
+	struct phylink_pcs pcs;
+};
+
+static inline struct stmmac_pcs *
+phylink_pcs_to_stmmac_pcs(struct phylink_pcs *pcs)
+{
+	return container_of(pcs, struct stmmac_pcs, pcs);
+}
+
+int stmmac_integrated_pcs_init(struct stmmac_priv *priv, unsigned int offset);
+
 /**
  * dwmac_pcs_isr - TBI, RTBI, or SGMII PHY ISR
  * @ioaddr: IO registers pointer
-- 
2.47.3


