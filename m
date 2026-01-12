Return-Path: <linux-arm-msm+bounces-88608-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A820D14B28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 19:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id D03683041541
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 18:11:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7AA0F3806C1;
	Mon, 12 Jan 2026 18:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wXua87J2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B452A3806C7;
	Mon, 12 Jan 2026 18:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241494; cv=none; b=UsQP9/3jRWJGIh+DX8YCiFnFTIUQTMCSFPKLHo8+5fgq/iZXzQTOF6mQnlQ7x9Vp/v66bDnMV4bxD/c6+C0CVFqTMdwe1uuwSBw5Ik4Ogr4cK4u5SYvBTvYaYaL2WAMk5NIowarHMyDK3IE47LE1MWGlw4XLvWIk1bt/4Rc39o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241494; c=relaxed/simple;
	bh=t6EsJ6Sm2zHrI5ON5my5GT9bwt0l3NedwdHCP1J/qdU=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=Qx5BPPON/CIK7A8BKEIfJ/f9NPDE1fm+DU7v2yAh/zKDH0589tMuWJWoV/DL+fbFu8h6qeAzJqw2O7Tlq2X9pHdUZtTrVy9iG1UDlI3YsX6YeKwWvRbquqnojeL+1ldutQb85dKmQNKxP9Goms0zpRKSXl9IjbRqfh3UABNRLDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=wXua87J2; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=OKpW3j7QEPMtte/xq/Kqnp5tdF2ya0EDZZiyEE9rFKE=; b=wXua87J2Bi9yo/Xi40fZoFqvzB
	MyjJlaSDV8ro6WGtWz3kWjhjaSONVPT7E0TxsLd6CfZxXpjr/jUq7G2U5G2ZTv9a+19ZyF5xrY48J
	RlUTGXy8lw3Vxpwgdt9gNWvaIgF3BFEMZLBXjPhI2zYCeOzgmaGOPJ3tu4Ooqz/HNsEaaThHITwlG
	/SVSPOF4BVYgjazpkyiZhkuY0iacfoIZTgIVzxnW4YRBcsUC1ctjGJRi/kcJYSpP47gxozX3Nwg5m
	nVgLR4m3XQxti9dFw2zUq6dsFOZ4+U8Fkp4vWHfCZCXs51iQLThLcDk3YjBw24I3HkBeOz0qikbO4
	qn34U+vg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:35310 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vfMNx-000000006bd-1Wn8;
	Mon, 12 Jan 2026 18:11:25 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vfMNw-00000002kJ9-2XDx;
	Mon, 12 Jan 2026 18:11:24 +0000
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
Subject: [PATCH net-next 1/2] net: stmmac: qcom-ethqos: remove mac_base
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vfMNw-00000002kJ9-2XDx@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Mon, 12 Jan 2026 18:11:24 +0000

Since the blamed commit, ethqos->mac_base is only written, never
read. Let's remove it.

Fixes: 9b443e58a896 ("net: stmmac: qcom-ethqos: remove MAC_CTRL_REG modification")
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


