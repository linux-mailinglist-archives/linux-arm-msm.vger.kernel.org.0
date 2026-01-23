Return-Path: <linux-arm-msm+bounces-90315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id sMoyOTdGc2mHuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90315-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:58:15 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C6F473C78
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:58:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id BD84130A7094
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:54:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26CC337AA79;
	Fri, 23 Jan 2026 09:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="jzAtfmpj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5E337996C;
	Fri, 23 Jan 2026 09:54:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769162058; cv=none; b=FqnYEJX28RFjuzsa1yBXkVIACWL9k19MoaC7LTLBi8PgKF0M53lfWizzHQ4h6Q19qBUES50kmEPNQPPTexT0vlWBLz5ysea0N53mOMg4NKlmQpiQ7xQBQV5oRFrPM10SY+37vsvjqdgKH22shwcyvr2juJN2ar/rdTujBdFFaXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769162058; c=relaxed/simple;
	bh=dvMV4003XIwPch/kAAX1D1dC4Cj2SAtD8y62MzqhhVQ=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=lvnP/Z8/m8094tsnRcV2cINjuaxw3s6rUjflonRLtKWGKoD1dgw0VaNkILeFC68CrTtN/C425WItSqup3dJvMhIE2sSGROgdHBYZmsDgjPFcu+R/BeK0Aw9bpYkQwjg7bGkwe9oav58KbJTDImGiKuOBjuGYSD4kj6PJRtCacIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=jzAtfmpj; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=MarsTdgtHs8teQdoPboCZ01yZL+brlqUeB6u3oqnnnU=; b=jzAtfmpjcp1cGlyUYb2mCuhVzo
	M5XxuW+U/wl2DWDe126Ql9Yr7dK7AL8gY3QepJS/bzr5mVcASUWG3brB4/NChFYT5o24NCdW7f4xR
	l3KVj7UKyaekgyteDjdhBXIcVX/dMAkixK8ryPp2FaCCbOFo0FwsqwQVoN4xLhVpJPb+S1wjub32q
	HOVVtnCk30IfgKqmIaz49H6ww67bWoI9HjnYft2tsM1jgVEiMFunLrWaKdcwodvWxEBkBotIiJey9
	AZulNVVRRUSrdx71k4+xoQNpbKer8UES3PGNO9qVj+6a7CvR1X9ZoHa+G1uyDZvwTkAUwTuI4HGa3
	ok+v8p/A==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:42402 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vjDrT-000000001bd-3xmu;
	Fri, 23 Jan 2026 09:53:52 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vjDrR-00000005fQX-1K9H;
	Fri, 23 Jan 2026 09:53:49 +0000
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 06/14] net: stmmac: qcom-ethqos: convert to dwmac
 generic SerDes support
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vjDrR-00000005fQX-1K9H@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 23 Jan 2026 09:53:49 +0000
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90315-lists,linux-arm-msm=lfdr.de,kernel];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,bootlin.com,gmail.com,oss.qualcomm.com,linaro.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[rmk@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.819];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,rmk-PC.armlinux.org.uk:mid,armlinux.org.uk:email]
X-Rspamd-Queue-Id: 8C6F473C78
X-Rspamd-Action: no action

Convert qcom-ethqos to use the dwmac core's generic SerDes support,
which will handle SerDes initialisation, powering, and mode setting.

Note that generic support requires the SerDes to support phy_validate()
in order to probe which PHY interface modes are supported, and
phy_set_mode_ext() to configure the appropriate PHY interface mode
(and thus the speed.)

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 50 ++-----------------
 1 file changed, 3 insertions(+), 47 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 80ea69fc8ee5..a0b893d3fbd4 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -103,8 +103,6 @@ struct qcom_ethqos {
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
 	struct clk *link_clk;
-	struct phy *serdes_phy;
-	int serdes_speed;
 	phy_interface_t phy_mode;
 
 	const struct ethqos_emac_por *por;
@@ -584,14 +582,6 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 	return 0;
 }
 
-static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
-{
-	if (ethqos->serdes_speed != speed) {
-		phy_set_speed(ethqos->serdes_phy, speed);
-		ethqos->serdes_speed = speed;
-	}
-}
-
 static void ethqos_pcs_set_inband(struct stmmac_priv *priv, bool enable)
 {
 	stmmac_pcs_ctrl_ane(priv, enable, 0);
@@ -609,17 +599,14 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 	case SPEED_2500:
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_2500);
 		ethqos_pcs_set_inband(priv, false);
 		break;
 	case SPEED_1000:
 		rgmii_setmask(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_100:
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	case SPEED_10:
@@ -627,7 +614,6 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos, int speed)
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
-		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		ethqos_pcs_set_inband(priv, true);
 		break;
 	}
@@ -648,30 +634,6 @@ static void ethqos_fix_mac_speed(void *priv, int speed, unsigned int mode)
 	ethqos_configure(ethqos, speed);
 }
 
-static int qcom_ethqos_serdes_powerup(struct net_device *ndev, void *priv)
-{
-	struct qcom_ethqos *ethqos = priv;
-	int ret;
-
-	ret = phy_init(ethqos->serdes_phy);
-	if (ret)
-		return ret;
-
-	ret = phy_power_on(ethqos->serdes_phy);
-	if (ret)
-		return ret;
-
-	return phy_set_speed(ethqos->serdes_phy, ethqos->serdes_speed);
-}
-
-static void qcom_ethqos_serdes_powerdown(struct net_device *ndev, void *priv)
-{
-	struct qcom_ethqos *ethqos = priv;
-
-	phy_power_off(ethqos->serdes_phy);
-	phy_exit(ethqos->serdes_phy);
-}
-
 static int ethqos_clks_config(void *priv, bool enabled)
 {
 	struct qcom_ethqos *ethqos = priv;
@@ -790,12 +752,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
-	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
-	if (IS_ERR(ethqos->serdes_phy))
-		return dev_err_probe(dev, PTR_ERR(ethqos->serdes_phy),
+	plat_dat->serdes = devm_phy_optional_get(dev, "serdes");
+	if (IS_ERR(plat_dat->serdes))
+		return dev_err_probe(dev, PTR_ERR(plat_dat->serdes),
 				     "Failed to get serdes phy\n");
 
-	ethqos->serdes_speed = SPEED_1000;
 	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
 			       SPEED_1000);
 	ethqos_set_func_clk_en(ethqos);
@@ -816,11 +777,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 	if (data->dma_addr_width)
 		plat_dat->host_dma_width = data->dma_addr_width;
 
-	if (ethqos->serdes_phy) {
-		plat_dat->serdes_powerup = qcom_ethqos_serdes_powerup;
-		plat_dat->serdes_powerdown  = qcom_ethqos_serdes_powerdown;
-	}
-
 	/* Enable TSO on queue0 and enable TBS on rest of the queues */
 	for (i = 1; i < plat_dat->tx_queues_to_use; i++)
 		plat_dat->tx_queues_cfg[i].tbs_en = 1;
-- 
2.47.3


