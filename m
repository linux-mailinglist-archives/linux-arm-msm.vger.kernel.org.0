Return-Path: <linux-arm-msm+bounces-48873-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA1EA3F316
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 12:39:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AB5AB16DECF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Feb 2025 11:39:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 951B12080D5;
	Fri, 21 Feb 2025 11:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="slJ1doNL"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EB861FBE8E;
	Fri, 21 Feb 2025 11:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740137938; cv=none; b=JDC0u48hIh02X6+yswktaGEnrf+sfqoE3zYpgNvQHgRCIohJf/DBzbojkKTkfk8OkCK5U3j4fXLNg5++eZHMi7d/2L38UrT5m9/UHTbiioQIpig4nCdqqCTGTNDVdeN9DA4A5wOscG23jLeHl11BND/MQz5KSpksg7+2NvkEmUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740137938; c=relaxed/simple;
	bh=G6Tv4gdMgqK8URWlKGYUnz4nHwoiGKzXfTwUwauU//I=;
	h=From:To:Cc:Subject:MIME-Version:Content-Disposition:Content-Type:
	 Message-Id:Date; b=Jjg4xjPCR9dMPdUV7FbaN7KWzsXmXd3jj9zoFkGIbpkuxUqVsG0NhjJPvJCdkvy/tf36uWfNtlUQ9f9NNDOUlXm5gyQN9YLZV93M5QGfqbLMdVtTITiCaNlpXDRiji8NGXq3K5A7arMEv3oZCmvtF9cI9qxIg9E3JrsFjNOROjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=slJ1doNL; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:Reply-To:Content-ID
	:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:
	Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=qugMnCcisAWRd3N7XpZaDvLqsnQ13hI4MnOJQYSPqR8=; b=slJ1doNLYx0gJdh83NuzDDMBis
	jySo+YRg1x1stRmo8dE1FiD+VXvxu7aowfRHxBaPU7hK8tUgXJj1zSJ72tURzCOajhPknQZO6Oo5i
	4Flh54HosFPQIk6SMglRaU3RZTS7zFUcnxRKtY9B4dGPEk/nIrbFwCLHEyKPb62IqAZ6ciZdlIRWn
	rk8Z780gW8LFPfTA/N9TBNe9yL/axY6Sw4vaOd69xuVZoO0WWmXfsExMEg71FvxHfl0QBOnjoLKBU
	qOlUnA3q7QPnDjirYRuAIALkZzQYksAEN1hV8qWKWqZh0pBREK04e7HhYUXGAcMaRXqobo7rgC03m
	lXtD3lPg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:36572 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tlRMe-0004Pp-28;
	Fri, 21 Feb 2025 11:38:40 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tlRMK-004Vsx-Ss; Fri, 21 Feb 2025 11:38:20 +0000
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
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next] net: stmmac: qcom-ethqos: use rgmii_clock() to set
 the link clock
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tlRMK-004Vsx-Ss@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Fri, 21 Feb 2025 11:38:20 +0000

The link clock operates at twice the RGMII clock rate. Therefore, we
can use the rgmii_clock() helper to set this clock rate.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../stmicro/stmmac/dwmac-qcom-ethqos.c        | 23 ++++---------------
 1 file changed, 5 insertions(+), 18 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 192f270197c8..eafe637540b6 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -169,30 +169,17 @@ static void rgmii_dump(void *priv)
 		rgmii_readl(ethqos, EMAC_SYSTEM_LOW_POWER_DEBUG));
 }
 
-/* Clock rates */
-#define RGMII_1000_NOM_CLK_FREQ			(250 * 1000 * 1000UL)
-#define RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ	 (50 * 1000 * 1000UL)
-#define RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ	  (5 * 1000 * 1000UL)
-
 static void
 ethqos_update_link_clk(struct qcom_ethqos *ethqos, int speed)
 {
+	long rate;
+
 	if (!phy_interface_mode_is_rgmii(ethqos->phy_mode))
 		return;
 
-	switch (speed) {
-	case SPEED_1000:
-		ethqos->link_clk_rate =  RGMII_1000_NOM_CLK_FREQ;
-		break;
-
-	case SPEED_100:
-		ethqos->link_clk_rate =  RGMII_ID_MODE_100_LOW_SVS_CLK_FREQ;
-		break;
-
-	case SPEED_10:
-		ethqos->link_clk_rate =  RGMII_ID_MODE_10_LOW_SVS_CLK_FREQ;
-		break;
-	}
+	rate = rgmii_clock(speed);
+	if (rate > 0)
+		ethqos->link_clk_rate = rate * 2;
 
 	clk_set_rate(ethqos->link_clk, ethqos->link_clk_rate);
 }
-- 
2.30.2


