Return-Path: <linux-arm-msm+bounces-48338-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D542A398B9
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 11:25:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DB19C7A2562
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 10:24:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2E3172343B5;
	Tue, 18 Feb 2025 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WbsvnvoK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D011233157;
	Tue, 18 Feb 2025 10:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874344; cv=none; b=DR0oQ1PDs243r1vWaIJ+aT6srwlkpoQk289TFwXiBJu2Avjj2Gt/9qzrGDDCIaSUEJquOuxTRKQABZm+rIin2smKMwqlcPX0h2auiz/NhlCaiv60iJF3iqtUKGSE/wvATQ0fb2bUNYIX4U+b129hTisUGkbNlE2nlI0WwoqE/AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874344; c=relaxed/simple;
	bh=hZ1zQoAyDNnGiLsXUhQQOPLiltEUF6atO18ktHg/cgA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=XeWhFmWhH0keSjQMsdo8OwzW3WAgj8jqKoX5ieMqdmIUc/qKGlwhy+Hxk3yC9YPE4HGa5v/Y+/k9ejzFmFODXwuZ2CmZFu3gquKes1B5x+o1TLsrS7ROsZF/CT36yOLyOMyAXR4YTyZAbIgGMaMO5tsqIwOQ/X2pkFcnRXJ/Aak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WbsvnvoK; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=D5W8SpUWl08I/kYtRWlssqE7GrUWwI2gPTE2uLJ5nPk=; b=WbsvnvoKW2ySHPfBKUPq6Fw2TD
	OnNtcpufpj8cXwil9PU9KA0FyEQ+tglIb3SLmfo6R5cdxtlLz7IT7gEacCBDL71kMc6rRwl1NS4Bb
	i8GNss22Dvs1jbDY+7Rc5ewa4UU3IK2EfN3T0HhTe0tannjavxLARLg183ce9LFDmph3KJiAxeM0r
	RbInEPkVWYo2ATtCaUzE9RGubGdNlWbdHX3bl70TFlHYCblQVE15dB3IvDEvXkIWV3EwTc+GOIgkC
	+D85ijyMqjI4G5kNLCE/z1n1Uw5nfAi/f6Q642whs8bR3mI/B5SOiEgBXY+i+jYp0n+AZ4AwuwuVA
	FXsgk+mQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:50318 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkKmj-0001Vk-0M;
	Tue, 18 Feb 2025 10:25:01 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkKmN-004ObM-Ge; Tue, 18 Feb 2025 10:24:39 +0000
In-Reply-To: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
References: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: netdev@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>,
	Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	NXP S32 Linux Team <s32@nxp.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 3/3] net: stmmac: "speed" passed to fix_mac_speed is
 an int
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkKmN-004ObM-Ge@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 18 Feb 2025 10:24:39 +0000

priv->plat->fix_mac_speed() is called from stmmac_mac_link_up(), which
is passed the speed as an "int". However, fix_mac_speed() implicitly
casts this to an unsigned int. Some platform glue code print this value
using %u, others with %d. Some implicitly cast it back to an int, and
others to u32.

Good practice is to use one type and only one type to represent a value
being passed around a driver.

Switch all of these over to consistently use "int" when dealing with a
speed passed from stmmac_mac_link_up(), even though the speed will
always be positive.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c         | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c  | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c     | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c    | 3 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 6 +++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c          | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c         | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c     | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c    | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c         | 8 ++++----
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c       | 2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c       | 4 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c    | 2 +-
 include/linux/stmmac.h                                  | 2 +-
 16 files changed, 31 insertions(+), 32 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
index 1fadb8ba1d2f..392574bdd4a4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c
@@ -141,7 +141,7 @@ static int dwc_qos_probe(struct platform_device *pdev,
 #define AUTO_CAL_STATUS 0x880c
 #define  AUTO_CAL_STATUS_ACTIVE BIT(31)
 
-static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mode)
+static void tegra_eqos_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct tegra_eqos *eqos = priv;
 	bool needs_calibration = false;
@@ -160,7 +160,7 @@ static void tegra_eqos_fix_speed(void *priv, unsigned int speed, unsigned int mo
 		break;
 
 	default:
-		dev_err(eqos->dev, "invalid speed %u\n", speed);
+		dev_err(eqos->dev, "invalid speed %d\n", speed);
 		break;
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
index 20d3a202bb8d..610204b51e3f 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c
@@ -51,7 +51,7 @@ struct imx_dwmac_ops {
 
 	int (*fix_soc_reset)(void *priv, void __iomem *ioaddr);
 	int (*set_intf_mode)(struct plat_stmmacenet_data *plat_dat);
-	void (*fix_mac_speed)(void *priv, unsigned int speed, unsigned int mode);
+	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 };
 
 struct imx_priv_data {
@@ -192,7 +192,7 @@ static void imx_dwmac_exit(struct platform_device *pdev, void *priv)
 	/* nothing to do now */
 }
 
-static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
+static void imx_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct plat_stmmacenet_data *plat_dat;
 	struct imx_priv_data *dwmac = priv;
@@ -208,7 +208,7 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
 
 	rate = rgmii_clock(speed);
 	if (rate < 0) {
-		dev_err(dwmac->dev, "invalid speed %u\n", speed);
+		dev_err(dwmac->dev, "invalid speed %d\n", speed);
 		return;
 	}
 
@@ -217,7 +217,7 @@ static void imx_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mod
 		dev_err(dwmac->dev, "failed to set tx rate %lu\n", rate);
 }
 
-static void imx93_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
+static void imx93_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct imx_priv_data *dwmac = priv;
 	unsigned int iface;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
index ddee6154d40b..0591756a2100 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-intel-plat.c
@@ -22,13 +22,13 @@ struct intel_dwmac {
 };
 
 struct intel_dwmac_data {
-	void (*fix_mac_speed)(void *priv, unsigned int speed, unsigned int mode);
+	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 	unsigned long ptp_ref_clk_rate;
 	unsigned long tx_clk_rate;
 	bool tx_clk_en;
 };
 
-static void kmb_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+static void kmb_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct intel_dwmac *dwmac = priv;
 	long rate;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
index 61227dcf56dc..7f4b9c1cc32b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c
@@ -112,7 +112,7 @@ struct ipq806x_gmac {
 	phy_interface_t phy_mode;
 };
 
-static int get_clk_div_sgmii(struct ipq806x_gmac *gmac, unsigned int speed)
+static int get_clk_div_sgmii(struct ipq806x_gmac *gmac, int speed)
 {
 	struct device *dev = &gmac->pdev->dev;
 	int div;
@@ -138,7 +138,7 @@ static int get_clk_div_sgmii(struct ipq806x_gmac *gmac, unsigned int speed)
 	return div;
 }
 
-static int get_clk_div_rgmii(struct ipq806x_gmac *gmac, unsigned int speed)
+static int get_clk_div_rgmii(struct ipq806x_gmac *gmac, int speed)
 {
 	struct device *dev = &gmac->pdev->dev;
 	int div;
@@ -164,7 +164,7 @@ static int get_clk_div_rgmii(struct ipq806x_gmac *gmac, unsigned int speed)
 	return div;
 }
 
-static int ipq806x_gmac_set_speed(struct ipq806x_gmac *gmac, unsigned int speed)
+static int ipq806x_gmac_set_speed(struct ipq806x_gmac *gmac, int speed)
 {
 	uint32_t clk_bits, val;
 	int div;
@@ -260,7 +260,7 @@ static int ipq806x_gmac_of_parse(struct ipq806x_gmac *gmac)
 	return PTR_ERR_OR_ZERO(gmac->qsgmii_csr);
 }
 
-static void ipq806x_gmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+static void ipq806x_gmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct ipq806x_gmac *gmac = priv;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
index 79acdf38c525..60a4e3330ccd 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-loongson.c
@@ -149,8 +149,7 @@ static struct stmmac_pci_info loongson_gmac_pci_info = {
 	.setup = loongson_gmac_data,
 };
 
-static void loongson_gnet_fix_speed(void *priv, unsigned int speed,
-				    unsigned int mode)
+static void loongson_gnet_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct loongson_data *ld = (struct loongson_data *)priv;
 	struct net_device *ndev = dev_get_drvdata(ld->dev);
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
index 5469fa1b429e..b115b7873cef 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c
@@ -22,7 +22,7 @@ struct meson_dwmac {
 	void __iomem	*reg;
 };
 
-static void meson6_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+static void meson6_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct meson_dwmac *dwmac = priv;
 	unsigned int val;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 2a5b38723635..192f270197c8 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -111,7 +111,7 @@ struct qcom_ethqos {
 	unsigned int link_clk_rate;
 	struct clk *link_clk;
 	struct phy *serdes_phy;
-	unsigned int speed;
+	int speed;
 	int serdes_speed;
 	phy_interface_t phy_mode;
 
@@ -175,7 +175,7 @@ static void rgmii_dump(void *priv)
 #define RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ	  (5 * 1000 * 1000UL)
 
 static void
-ethqos_update_link_clk(struct qcom_ethqos *ethqos, unsigned int speed)
+ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 {
 	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
 		return;
@@ -699,7 +699,7 @@ static int ethqos_configure(struct qcom_ethqos *ethqos)
 	return ethqos->configure_func(ethqos);
 }
 
-static void ethqos_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct qcom_ethqos *ethqos = priv;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
index a4dc89e23a68..83d104a274c5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c
@@ -1920,7 +1920,7 @@ static void rk_gmac_powerdown(struct rk_priv_data *gmac)
 	gmac_clk_enable(gmac, false);
 }
 
-static void rk_fix_speed(void *priv, unsigned int speed, unsigned int mode)
+static void rk_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct rk_priv_data *bsp_priv = priv;
 	struct device *dev = &bsp_priv->pdev->dev;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
index 9cc0e5817416..6a498833b8ed 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c
@@ -100,7 +100,7 @@ static void s32_gmac_exit(struct platform_device *pdev, void *priv)
 	clk_disable_unprepare(gmac->rx_clk);
 }
 
-static void s32_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+static void s32_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct s32_priv_data *gmac = priv;
 	long tx_clk_rate;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
index 16020b72dec8..6b78ae730466 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
@@ -61,7 +61,7 @@ struct socfpga_dwmac {
 	struct mdio_device *pcs_mdiodev;
 };
 
-static void socfpga_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+static void socfpga_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct socfpga_dwmac *dwmac = (struct socfpga_dwmac *)priv;
 	void __iomem *splitter_base = dwmac->splitter_base;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
index 0a0a363d3730..282c846dad0b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
@@ -31,7 +31,7 @@ struct starfive_dwmac {
 	const struct starfive_dwmac_data *data;
 };
 
-static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+static void starfive_dwmac_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct starfive_dwmac *dwmac = priv;
 	long rate;
@@ -39,7 +39,7 @@ static void starfive_dwmac_fix_mac_speed(void *priv, unsigned int speed, unsigne
 
 	rate = rgmii_clock(speed);
 	if (rate < 0) {
-		dev_err(dwmac->dev, "invalid speed %u\n", speed);
+		dev_err(dwmac->dev, "invalid speed %d\n", speed);
 		return;
 	}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
index f25461c292fe..13b9c2a51fce 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c
@@ -99,12 +99,12 @@ struct sti_dwmac {
 	int clk_sel_reg;	/* GMAC ext clk selection register */
 	struct regmap *regmap;
 	bool gmac_en;
-	u32 speed;
-	void (*fix_retime_src)(void *priv, unsigned int speed, unsigned int mode);
+	int speed;
+	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
 };
 
 struct sti_dwmac_of_data {
-	void (*fix_retime_src)(void *priv, unsigned int speed, unsigned int mode);
+	void (*fix_retime_src)(void *priv, int speed, unsigned int mode);
 };
 
 static u32 phy_intf_sels[] = {
@@ -132,7 +132,7 @@ static u32 stih4xx_tx_retime_val[] = {
 				 | STIH4XX_ETH_SEL_INTERNAL_NOTEXT_PHYCLK,
 };
 
-static void stih4xx_fix_retime_src(void *priv, u32 spd, unsigned int mode)
+static void stih4xx_fix_retime_src(void *priv, int spd, unsigned int mode)
 {
 	struct sti_dwmac *dwmac = priv;
 	u32 src = dwmac->tx_retime_src;
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
index 9ae318436c4a..1b1ce2888b2e 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c
@@ -72,7 +72,7 @@ static void sun7i_gmac_exit(struct platform_device *pdev, void *priv)
 		regulator_disable(gmac->regulator);
 }
 
-static void sun7i_fix_speed(void *priv, unsigned int speed, unsigned int mode)
+static void sun7i_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct sunxi_priv_data *gmac = priv;
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
index dce84ed184e9..ddb1d8aba321 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
@@ -104,7 +104,7 @@ static int thead_dwmac_set_txclk_dir(struct plat_stmmacenet_data *plat)
 	return 0;
 }
 
-static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int mode)
+static void thead_dwmac_fix_speed(void *priv, int speed, unsigned int mode)
 {
 	struct plat_stmmacenet_data *plat;
 	struct thead_dwmac *dwmac = priv;
@@ -142,7 +142,7 @@ static void thead_dwmac_fix_speed(void *priv, unsigned int speed, unsigned int m
 			div = rate * 10 / GMAC_MII_RATE;
 			break;
 		default:
-			dev_err(dwmac->dev, "invalid speed %u\n", speed);
+			dev_err(dwmac->dev, "invalid speed %d\n", speed);
 			return;
 		}
 
diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
index eccf7f537467..33cf99797df5 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-visconti.c
@@ -54,7 +54,7 @@ struct visconti_eth {
 	spinlock_t lock; /* lock to protect register update */
 };
 
-static void visconti_eth_fix_mac_speed(void *priv, unsigned int speed, unsigned int mode)
+static void visconti_eth_fix_mac_speed(void *priv, int speed, unsigned int mode)
 {
 	struct visconti_eth *dwmac = priv;
 	struct net_device *netdev = dev_get_drvdata(dwmac->dev);
diff --git a/include/linux/stmmac.h b/include/linux/stmmac.h
index 24422ac4e417..6d2aa77ea963 100644
--- a/include/linux/stmmac.h
+++ b/include/linux/stmmac.h
@@ -231,7 +231,7 @@ struct plat_stmmacenet_data {
 	u8 tx_sched_algorithm;
 	struct stmmac_rxq_cfg rx_queues_cfg[MTL_MAX_RX_QUEUES];
 	struct stmmac_txq_cfg tx_queues_cfg[MTL_MAX_TX_QUEUES];
-	void (*fix_mac_speed)(void *priv, unsigned int speed, unsigned int mode);
+	void (*fix_mac_speed)(void *priv, int speed, unsigned int mode);
 	int (*fix_soc_reset)(void *priv, void __iomem *ioaddr);
 	int (*serdes_powerup)(struct net_device *ndev, void *priv);
 	void (*serdes_powerdown)(struct net_device *ndev, void *priv);
-- 
2.30.2


