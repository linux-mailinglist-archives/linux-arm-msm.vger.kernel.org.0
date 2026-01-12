Return-Path: <linux-arm-msm+bounces-88609-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 99C0DD14B2B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 19:14:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id F21FD300FE2C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 18:11:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 576C43815C4;
	Mon, 12 Jan 2026 18:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="I6yAc8rs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 804363806CC;
	Mon, 12 Jan 2026 18:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241499; cv=none; b=IitREgWj1uP2ITowEYcfDozGiLikipcC7G3jLMrT0V8A2ZsDLBT68w+vz/CnhZbC5tecw8G6OQ+i3ULjxmj2GgM950hPxD32pwxXiaB6W98iCMLfxzaKE4+oMgex+GmuUc5XA9QiGHts8ixV2ZFulkYyy6MFvZA59zaAEDNm9ro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241499; c=relaxed/simple;
	bh=LxI+L7GfzZWz4jv7vSFSE5ZVYBllMWZjHoOqSqifnBc=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=gPOq9JaHfGUgLYAT9hoT/h8UOHH3VsbX4ifxn8P6veKaMpB2KPAPVRe0rPaM86IVhZ1bg2SrCfF096q0sLixrEwv8Jfk4IfQjxNlhu04MWmuhWr6Uf9f685jpfmkx1vP/yvd3bLEY0yLp81FJem48msUDVJeqsxvHdYzxEx8XtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=I6yAc8rs; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=kEdZ8ipMDP5kbCjgKjvgz5LuDWo/Bg325DpaKMx92Nk=; b=I6yAc8rs0wLFYhmxCiiv8ebj15
	XkPe0akP26icvs7tXlPei5/I8SdTjN4ZEJwWYRXnpEzqQlPmTiOojU4KIQ7x3RRJ5QnsJdIn7ZHfD
	Dc3+izULWXwlqoA5SR0nb2DotxtVCiyWRrRA/hoXuyRISUWZbCOTzkr0gjFhirV7VGhOZFTwlrEkC
	ixGnQ61MI8Vls+vU7emdW1hBKTFi95dxWIu1IhnF+wUSYWDff7h+DF/LlbMjtNDLeaR+SkEd49PmS
	oxNDg1vKIS+cfiLdvVo7FEzayPUqttnE0FBtWYQb340u2vPeTFQMBtt72qzyL56C5zJUnQOCwsovg
	dfsgZDzQ==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:58776 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vfMO2-000000006bp-2OWH;
	Mon, 12 Jan 2026 18:11:30 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vfMO1-00000002kJF-33UK;
	Mon, 12 Jan 2026 18:11:29 +0000
In-Reply-To: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
References: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
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
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 2/2] net: stmmac: qcom-ethqos: convert to
 set_clk_tx_rate() method
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vfMO1-00000002kJF-33UK@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 12 Jan 2026 18:11:29 +0000

Set the RGMII link clock using the set_clk_tx_rate() method rather than
coding it into the .fix_mac_speed() method. This simplifies ethqos's
ethqos_fix_mac_speed().

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 869f924f3cde..d6df3ca757be 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -102,7 +102,6 @@ struct qcom_ethqos {
 	void __iomem *rgmii_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
-	unsigned int link_clk_rate;
 	struct clk *link_clk;
 	struct phy *serdes_phy;
 	int serdes_speed;
@@ -174,19 +173,18 @@ static void rgmii_dump(void *priv)
 		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
 }
 
-static void
-ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
+static int ethqos_set_clk_tx_rate(void *bsp_priv, struct clk *clk_tx_i,
+				  phy_interface_t interface, int speed)
 {
+	struct qcom_ethqos *ethqos = bsp_priv;
 	long rate;
 
-	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
-		return;
+	if (!phy_interface_mode_is_rgmii(interface))
+		return 0;
 
 	rate = rgmii_clock(speed);
 	if (rate > 0)
-		ethqos->link_clk_rate = rate * 2;
-
-	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
+		clk_set_rate(ethqos->link_clk, rate * 2);
 }
 
 static void
@@ -645,7 +643,6 @@ static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	struct qcom_ethqos *ethqos = priv;
 
 	qcom_ethqos_set_sgmii_loopback(ethqos, false);
-	ethqos_update_link_clk(ethqos, speed);
 	ethqos_configure(ethqos, speed);
 }
 
@@ -797,10 +794,12 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 				     "Failed to get serdes phy\n");
 
 	ethqos->serdes_speed = SPEED_1000;
-	ethqos_update_link_clk(ethqos, SPEED_1000);
+	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
+			       SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
 
 	plat_dat->bsp_priv = ethqos;
+	plat_dat->set_clk_tx_rate = ethqos_set_clk_tx_rate;
 	plat_dat->fix_mac_speed = ethqos_fix_mac_speed;
 	plat_dat->dump_debug_regs = rgmii_dump;
 	plat_dat->ptp_clk_freq_config = ethqos_ptp_clk_freq_config;
-- 
2.47.3


