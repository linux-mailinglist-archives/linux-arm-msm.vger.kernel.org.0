Return-Path: <linux-arm-msm+bounces-48336-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id BC81CA398BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 11:26:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6B39A166AE6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 10:25:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E1CCD2343AF;
	Tue, 18 Feb 2025 10:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="WBqusEcR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59D022DF8E;
	Tue, 18 Feb 2025 10:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874322; cv=none; b=ozz8EnIN7Rx/VW+ShRpoi6IP/7c9BN4kBUOOEKEgSyDV2dNFiaPfiYApU/82BXmvn5rs/Jt6P3S68T/DzTyuItR8Q1fm8uNE+KuGUQARoQeLeorIiBgLJOegBN847vSizk+k2idzjrSc6zsf4Bm5iwe7qu2oh10u4ChGDJKZkoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874322; c=relaxed/simple;
	bh=7HJ2NFuaD9R+yjRpGrKAcepBGyHs7wOV8+xkU2htpRs=;
	h=In-Reply-To:References:From:To:Cc:Subject:MIME-Version:
	 Content-Disposition:Content-Type:Message-Id:Date; b=esjaP7xRxODAaKYQ2XatKrqBM8PlnwJKsq7RxfAsQ1ZcgiJ5xfPNGdvcnIv6Y/x5+NQyqiJfp0cyeTUe4aPZwdmiI8jCZ1cvRxYnhAbIq2ije6D/Q2KjtisyEMrFp58e1tqFuCdtlgKG+FIrF4sm0/LwLW+r6B5od9eBT2V7yRs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=WBqusEcR; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=I4wncVCdpUIHsrrtox57fBEO9pBWU5bq8UDc/s2ney4=; b=WBqusEcR6NZxomOppQmLAEpv5K
	WZlvsfcwwwu56hIo93ZGFL9SvT+e/BW8SGr9kdCftwn+G1RO4g+8KfxyLAjOB3nA0rl7OoYEEk5hA
	CYegSDVVFr8cjooaVirWP6JltkfMKWbtrwEN1IwJ00yToCrPml0CFjFpqZOygt7LF4zmObaCa1PE+
	MAMAaMYOANiXYVpCaLKtb2+EbMWgewqwHzVIDBYP8H1NjOalBWoIDhgKceb/7p7Rbu9Ek77FjU56H
	ElNngQ7f6abzrcmtwaVMfsAcSOc06z6A3fDhl+X1gCZ4MdrJYZG7wjKyyzbD+YGcxRRJWVJV9uZS/
	y8fAO8vw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:37784 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1tkKmX-0001V5-0Y;
	Tue, 18 Feb 2025 10:24:49 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1tkKmD-004ObA-9K; Tue, 18 Feb 2025 10:24:29 +0000
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
Subject: [PATCH net-next 1/3] net: stmmac: clarify priv->pause and pause
 module parameter
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="utf-8"
Message-Id: <E1tkKmD-004ObA-9K@rmk-PC.armlinux.org.uk>
Sender: Russell King <rmk@armlinux.org.uk>
Date: Tue, 18 Feb 2025 10:24:29 +0000

priv->pause corresponds with "pause_time" in the 802.3 specification,
and is also called "pause_time" in the various MAC backends. For
consistency, use the same name in the core stmmac code.

Clarify the units of the "pause" module parameter which sets up this
struct member to indicate that it's in units of the pause_quanta
defined by 802.3, which is 512 bit times.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/net/ethernet/stmicro/stmmac/stmmac.h      | 2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
index f05cae103d83..c602ace572b2 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
@@ -283,7 +283,7 @@ struct stmmac_priv {
 
 	int speed;
 	unsigned int flow_ctrl;
-	unsigned int pause;
+	unsigned int pause_time;
 	struct mii_bus *mii;
 
 	struct phylink_config phylink_config;
diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
index fd8ca1524e43..c3a13bd8c9b3 100644
--- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
+++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
@@ -94,7 +94,7 @@ MODULE_PARM_DESC(flow_ctrl, "Flow control ability [on/off]");
 
 static int pause = PAUSE_TIME;
 module_param(pause, int, 0644);
-MODULE_PARM_DESC(pause, "Flow Control Pause Time");
+MODULE_PARM_DESC(pause, "Flow Control Pause Time (units of 512 bit times)");
 
 #define TC_DEFAULT 64
 static int tc = TC_DEFAULT;
@@ -865,7 +865,7 @@ static void stmmac_mac_flow_ctrl(struct stmmac_priv *priv, u32 duplex)
 	u32 tx_cnt = priv->plat->tx_queues_to_use;
 
 	stmmac_flow_ctrl(priv, priv->hw, duplex, priv->flow_ctrl,
-			priv->pause, tx_cnt);
+			 priv->pause_time, tx_cnt);
 }
 
 static unsigned long stmmac_mac_get_caps(struct phylink_config *config,
@@ -7404,7 +7404,7 @@ int stmmac_dvr_probe(struct device *device,
 		return -ENOMEM;
 
 	stmmac_set_ethtool_ops(ndev);
-	priv->pause = pause;
+	priv->pause_time = pause;
 	priv->plat = plat_dat;
 	priv->ioaddr = res->addr;
 	priv->dev->base_addr = (unsigned long)res->addr;
-- 
2.30.2


