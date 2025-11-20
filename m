Return-Path: <linux-arm-msm+bounces-82669-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [IPv6:2a01:60a::1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id 99D5FC73BE7
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 12:32:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 4B55A360268
	for <lists+linux-arm-msm@lfdr.de>; Thu, 20 Nov 2025 11:27:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BD8A4330D42;
	Thu, 20 Nov 2025 11:25:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wjwFfMHD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 918F6303A19;
	Thu, 20 Nov 2025 11:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763637925; cv=none; b=jXSbF7DmRJ84XJVBTzbgoyWnHSGSDmbjzCPbCOLli0Eg18aB4gCIL5QbtZsCQ17c1AE3lKD9EGbEDMnapRD4Uqy7h/gtsxjOAzQDjac54WEatt5HwevgUOQ/y6fm8q8AFoJx2ZCMUMDLEeNVygSAeInkgJuMD2KNrM0heQ2uTlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763637925; c=relaxed/simple;
	bh=dG50jwPfNjr5op+uOCAMTygaiq+hakAGxYTq2KpyZoA=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=fbDm9xhVbSUHhnsVGeOUAyG0o1Wy+uEf2IOSpthur6SlRBzirtJeoMssughEfR2os9R6u/PFeoEMemGHT0QzCUW4wOFOpd8riMCFKY0Y3Z+zp1rykhsvxy4b8ZR3Mml87o5i8SX6NmFJDcwIkeYxVdIAhihKFfdKVaPvTEzgu4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=wjwFfMHD; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I74Dh3fe1nd1qM9odpuS+mcbUWvWRMt3SuKencBCa0w=; b=wjwFfMHDty7Mh+4HM2YmddQuhO
	N98gvzXouRClO5etfYxAAE5I5e45H2GNUkbkc/Q7jZ3K98/0G5d1RzvUoYJO+/EITYdKOms7A1+ws
	M5LKu3QCETnz7XDxwGmCZJ9RbQ33RBX1VeAQQp+6WVcAwT3JIwqHqiMYYD2JUkTHTnTY/T+rdAzqZ
	n7rriE6JwbgXl7vdzc9PWYqCy625RocMYVzMsxLwdA7hQXYuphkr/DEzPLrExuiiXoIXrqsKDTVuc
	Dfzhnq8Jhm9WkuXmm0hvTLpUfWeeLZQ0g2GLOKiAz4zTxSEVCDBkmc3EijCpqkTbL0TTPpCtKhDhX
	Yxpw0mGw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:51756 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1vM2mr-00000000682-2vyX;
	Thu, 20 Nov 2025 11:25:17 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1vM2mq-0000000FRTi-3y5F;
	Thu, 20 Nov 2025 11:25:16 +0000
In-Reply-To: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
References: <aR76i0HjXitfl7xk@shell.armlinux.org.uk>
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
Subject: [PATCH net-next v2 1/3] net: stmmac: qcom-ethqos: use u32 for rgmii
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
Message-Id: <E1vM2mq-0000000FRTi-3y5F@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Thu, 20 Nov 2025 11:25:16 +0000

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


