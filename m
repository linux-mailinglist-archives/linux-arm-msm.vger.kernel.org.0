Return-Path: <linux-arm-msm+bounces-20907-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D6178D31C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:41:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CD3CA28213C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 08:41:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 69F9C167D98;
	Wed, 29 May 2024 08:41:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="gNmYgsS/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BB9D15DBC6;
	Wed, 29 May 2024 08:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716972076; cv=none; b=Js10eDbW7Q2P9ndqLjf3n6iJih17idHsdz1Awwt/06hpsuMb5XgrapllbS8F2MptHmyRsiT056JGHuvgUwACC/u44limQDObS3elJA+ZhdxujP+HiCZev1Od2DBYLkMB3aW62KdOhLyzRd+r1KKqvxajWCojEe71fpMJ8aMmhuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716972076; c=relaxed/simple;
	bh=6gvbg+4Cv6/3V5HdOEB1Kx00L795y6feg7FlJLwe4sI=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=TpLUmrwnYfXE/6KVwO6lJiTCZEOgqjG/YMzy6ikQcevEjeJMTqoUbLhRK583PgUdRh1oQhprCGpxPu9Pi0JQgdFTB8fQ9Fhpu1L7mXcUeJqw+P63pcgRbjmtDUIpgxbnklDKbgljsx9tW/WKuUQxJnD4/SicapN1/k7j+5oGRrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=gNmYgsS/; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=cpEjKIYehy33khJRxWlrNLAfmDXLsKG4slRCHBuLHdA=; b=gNmYgsS/35ULfwgNkVdLi22Z2o
	AtczP2JUbqt540kjLK9LKbzlTr+Lpw8lvqp1NsnZSe9E5PMcLhl5+UQRLIJsRw78TXjK7ilJg8zfb
	zvABw4BXetT3sjyVynUsBo7J/CkxfzrN61dCI9SXHOUlWv/4ks3lsiA+2SkoFEFlnytiOAnciN8jS
	jjrwRf6lYJGg2Y5KCGNkQDNevDrsjWMGw9yIKZIiMRFxOZ7vo2WoiEjaIcyfRA5wV0d6FqJTQpfTX
	TWfEUoNqOeOCl7kHZ3WKeXXgw55UPDzUyD69Tn1/E1ZnmDrzI9Rp+8ctw3fvcnCwtX/6/caUxVZMR
	zde9GExA==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:47704 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1sCEri-0005mo-2A;
	Wed, 29 May 2024 09:40:58 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1sCErj-00EOQ9-Vh; Wed, 29 May 2024 09:41:00 +0100
In-Reply-To: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
References: <Zlbp7xdUZAXblOZJ@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Serge Semin <fancer.lancer@gmail.com>
Cc: Andrew Halaney <ahalaney@redhat.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH net-next v2 6/6] net: stmmac: ethqos: clean up setting serdes
 speed
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1sCErj-00EOQ9-Vh@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 29 May 2024 09:40:59 +0100

There are four repititions of the same sequence of code, three of which
are identical. Pull these out into a separate function to improve
readability.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 24 +++++++++----------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index e254b21fdb59..d9eed415b0b7 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -605,6 +605,14 @@ static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos)
 	return 0;
 }
 
+static void ethqos_set_serdes_speed(struct qcom_ethqos *ethqos, int speed)
+{
+	if (ethqos->serdes_speed != speed) {
+		phy_set_speed(ethqos->serdes_phy, speed);
+		ethqos->serdes_speed = speed;
+	}
+}
+
 /* On interface toggle MAC registers gets reset.
  * Configure MAC block for SGMII on ethernet phy link up
  */
@@ -622,9 +630,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		if (ethqos->serdes_speed != SPEED_2500)
-			phy_set_speed(ethqos->serdes_phy, SPEED_2500);
-		ethqos->serdes_speed = SPEED_2500;
+		ethqos_set_serdes_speed(ethqos, SPEED_2500);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 0, 0, 0);
 		break;
 	case SPEED_1000:
@@ -632,16 +638,12 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 		rgmii_updatel(ethqos, RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_CONFIG2_RGMII_CLK_SEL_CFG,
 			      RGMII_IO_MACRO_CONFIG2);
-		if (ethqos->serdes_speed != SPEED_1000)
-			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
-		ethqos->serdes_speed = SPEED_1000;
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	case SPEED_100:
 		val |= ETHQOS_MAC_CTRL_PORT_SEL | ETHQOS_MAC_CTRL_SPEED_MODE;
-		if (ethqos->serdes_speed != SPEED_1000)
-			phy_set_speed(ethqos->serdes_phy, SPEED_1000);
-		ethqos->serdes_speed = SPEED_1000;
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	case SPEED_10:
@@ -651,9 +653,7 @@ static int ethqos_configure_sgmii(struct qcom_ethqos *ethqos)
 			      FIELD_PREP(RGMII_CONFIG_SGMII_CLK_DVDR,
 					 SGMII_10M_RX_CLK_DVDR),
 			      RGMII_IO_MACRO_CONFIG);
-		if (ethqos->serdes_speed != SPEED_1000)
-			phy_set_speed(ethqos->serdes_phy, ethqos->speed);
-		ethqos->serdes_speed = SPEED_1000;
+		ethqos_set_serdes_speed(ethqos, SPEED_1000);
 		stmmac_pcs_ctrl_ane(priv, priv->ioaddr, 1, 0, 0);
 		break;
 	}
-- 
2.30.2


