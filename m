Return-Path: <linux-arm-msm+bounces-82487-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 88491C6E3EF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 12:34:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.lore.kernel.org (Postfix) with ESMTPS id DB9F628BBB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9D2B3352FB7;
	Wed, 19 Nov 2025 11:34:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="aBGn3dny"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C69FC334382;
	Wed, 19 Nov 2025 11:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552089; cv=none; b=RZZHIB8vdihQGWl3E+9L7+HGIDAtaVdzV5geBB2VAmPereuay45N3LzcEuu7cNxVOHjlTZsUxo0f9/j/MWIEpBEK3SDlccVFtBtfJgP5TB+BTmWEeSpkn4zQ3YYuq39R8kdPf/0WXEJBpgkQd4T2AF5yNFETKkQYxfByGag06mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552089; c=relaxed/simple;
	bh=dG50jwPfNjr5op+uOCAMTygaiq+hakAGxYTq2KpyZoA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=LXMN20WxMqgwfvna3znDWvHzpuvbO3VYymwzhOv02EkQbfdjNz7/XmCwHynh7vfXa42N0od3s4gNcBwJOGT0DzBzvrCVhxRQTlrf2+V1MECt4d6O3oqEJcTbn2dTQrTDau3/kIC/tVKbYFJDe4jsNBulxfJIGTkNSsR8JpDZ7kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=aBGn3dny; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I74Dh3fe1nd1qM9odpuS+mcbUWvWRMt3SuKencBCa0w=; b=aBGn3dnyRWKUQsVsq8cgzBeNAM
	LzQ8h0WnJwgNsE0QQX/qDmi4SAyfrBuxbrUe7TVqlUfgfUXmJiF9AOPWsCcmXg6E3h5XzteYaEHl2
	Fq7+bOKFMdyAq7L30xh0upBFF2IMDlMlWkW1VmgfsimXXnrN68k9/IQ6GI2QibcSBvFkhoyLBFUbR
	oxogmRslMjBAd68hFXg6lp5tAqVu6umIkimqqJVEhtrjl1icmQVojDSZpsNJUWaY8bT4KqcBXjH8T
	74AOvvlXLGpptVH2tmtI2PNFoVX99PuylvJb76anO+lmTcKuzfLmu1sgefAvzGa70d1iGOEo7EXqU
	6KomSkWw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44952 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vLgSP-000000004b8-3ELF;
	Wed, 19 Nov 2025 11:34:41 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vLgSO-0000000FMrF-3uB1;
	Wed, 19 Nov 2025 11:34:40 +0000
In-Reply-To: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
References: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
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
Subject: [PATCH net-next 1/3] net: stmmac: qcom-ethqos: use u32 for rgmii
 read/write/update
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1vLgSO-0000000FMrF-3uB1@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Wed, 19 Nov 2025 11:34:40 +0000

readl() returns a u32, and writel() takes a "u32" for the value. These
are used in rgmii_readl()() and rgmii_writel(), but the value and
return are "int". As these are 32-bit register values which are not
signed, use "u32".

These changes do not cause generated code changes.

Update rgmii_updatel() to use u32 for mask and val. Changing "mask"
to "u32" also does not cause generated code changes. However, changing
"val" causes the generated assembly to be re-ordered for aarch64.

Update the temporary variables used with the rgmii functions to use
u32.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c  | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
index 1a616a71c36a..ae3cf163005b 100644
--- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
+++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
@@ -116,21 +116,21 @@ struct qcom_ethqos {
 	bool needs_sgmii_loopback;
 };
 
-static int rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
+static u32 rgmii_readl(struct qcom_ethqos *ethqos, unsigned int offset)
 {
 	return readl(ethqos->rgmii_base + offset);
 }
 
-static void rgmii_writel(struct qcom_ethqos *ethqos,
-			 int value, unsigned int offset)
+static void rgmii_writel(struct qcom_ethqos *ethqos, u32 value,
+			 unsigned int offset)
 {
 	writel(value, ethqos->rgmii_base + offset);
 }
 
-static void rgmii_updatel(struct qcom_ethqos *ethqos,
-			  int mask, int val, unsigned int offset)
+static void rgmii_updatel(struct qcom_ethqos *ethqos, u32 mask, u32 val,
+			  unsigned int offset)
 {
-	unsigned int temp;
+	u32 temp;
 
 	temp = rgmii_readl(ethqos, offset);
 	temp = (temp & ~(mask)) | val;
@@ -300,8 +300,8 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
 static int ethqos_dll_configure(struct qcom_ethqos *ethqos)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	unsigned int val;
 	int retry = 1000;
+	u32 val;
 
 	/* Set CDR_EN */
 	rgmii_updatel(ethqos, SDCC_DLL_CONFIG_CDR_EN,
@@ -535,7 +535,7 @@ static int ethqos_rgmii_macro_init(struct qcom_ethqos *ethqos, int speed)
 static int ethqos_configure_rgmii(struct qcom_ethqos *ethqos, int speed)
 {
 	struct device *dev = &ethqos->pdev->dev;
-	volatile unsigned int dll_lock;
+	volatile u32 dll_lock;
 	unsigned int i, retry = 1000;
 
 	/* Reset to POR values and enable clk */
-- 
2.47.3


