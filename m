Return-Path: <linux-arm-msm+bounces-89652-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 723F5D3A8DF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:33:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 4EECE3002898
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:33:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ECA3D322B79;
	Mon, 19 Jan 2026 12:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="0iXQPnPQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CD5222FDFF;
	Mon, 19 Jan 2026 12:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768826028; cv=none; b=O/DXCkAN8ypkj5L/mP2vsbPRpfU4Pr4PY1iFRC3gYDtVy0849nGhcuEq+El1e1JnD8b7UHNr/afBuZkLjTl958QwIqikvf4kASvv+0+V3UBxB+mPm16rR3uD3kHr238UuXE1kxkL/RA0IDhb42efCvTk1vbZUTBTLnAwXo4ARss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768826028; c=relaxed/simple;
	bh=uSJz7k4dBpmctIzunb2dNqwFMbyJVjfDaoYCtoR4euY=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=uLA/3m1bsarW61/7ZGYOo+VXtXacAxAU1hYyt2rj6z7wOSPQBiimCtSGSCEr2PItBOlndVhUNJ2glEHenrCcKljbpAItoShqBXft0uej54gDH7ZDPQi7xyUg1WVSIc6n9rrnE0vBOkQctosL7vu58Q81Am1GBJBDon6W41kbIzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=0iXQPnPQ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N5WSxKFKRsvwX88PFN97TSKTmJ02N2jp7yQfWF2YU3o=; b=0iXQPnPQywtrPzZ9zDBMOnK380
	eOHLJNoqYvD9U6ng8TCLrS3frF8h9QzsI3Tr+roXoMxX2pDJDRJqZAjO9VH+l9/Km5V6AAAsq8P83
	dGXZM6AcB0zYH8ZK9QCL2CiFcQHdf2VtxHWvM3+KKuOVaTGjlC+7COdTk4tpgdoYgkWGEKnoRXf0R
	OFvClWPtlAPTg3HvpAqbPRw4pPmwvTDPrero3lJ8yWeRu0fCntUi9p+2WKplDYTUjlOrnokNMslPv
	UahTpnAV6+LfXa+fZyEQkjCNryl2VzxVMJdcUmi7H38WPU0TDs6P2FuPKJge2IR7bllR+3mrSu4tg
	xXFk99Zw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:57530 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vhoRx-0000000051c-3iln;
	Mon, 19 Jan 2026 12:33:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vhoRx-00000005H1H-0YoL;
	Mon, 19 Jan 2026 12:33:41 +0000
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
Subject: [PATCH net-next 01/14] net: stmmac: qcom-ethqos: remove mac_base
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vhoRx-00000005H1H-0YoL@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 19 Jan 2026 12:33:41 +0000

In commit 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG
modification"), ethqos->mac_base is only written, never read. Let's
remove it.

Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 0826a7bd32ff..869f924f3cde 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -100,7 +100,6 @@ struct ethqos_emac_driver_data {
 struct qcom_ethqos {
 	struct platform_device *pdev;
 	void __iomem *rgmii_base;
-	void __iomem *mac_base;
 	int (*configure_func)(struct qcom_ethqos *ethqos, int speed);
 
 	unsigned int link_clk_rate;
@@ -772,8 +771,6 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, PTR_ERR(ethqos->rgmii_base),
 				     "Failed to map rgmii resource\n");
 
-	ethqos->mac_base = stmmac_res.addr;
-
 	data = of_device_get_match_data(dev);
 	ethqos->por = data->por;
 	ethqos->num_por = data->num_por;
-- 
2.47.3


