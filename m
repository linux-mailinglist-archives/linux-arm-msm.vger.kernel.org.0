Return-Path: <linux-arm-msm+bounces-48335-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id C61CEA398DF
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 11:30:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A45DD3A1D0F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2025 10:24:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61C13230D0A;
	Tue, 18 Feb 2025 10:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="HDZagU0O"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20AE222DF8E;
	Tue, 18 Feb 2025 10:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739874290; cv=none; b=C6HBI3xI82ONFQBSF/MleNccDxkdaBZlgficlfq2Ei3IgUsgNCXHV6qS7paUEhceeq6lW8ADZj61x2/ZslNyPBf8YY4h7FJW9aX9el+VklxuWK5vzw93KthwYfYpv4PSBd9qsC6EdA+SLsOvoAFztXMQXng94ToYDeWWHEw4yF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739874290; c=relaxed/simple;
	bh=njvEHZDf15ZmXZBHSCrP5PvIQPOoyG+V7Ou904JTdWY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UbVtEIpshylqVIPBszi/DFP7om6A3PXfoHyqBHakx4P9KVWW9hI2UCIcPRIOtdAXbQ3BLJ0B4QsgiL0F9CoQjfIxqNp/JYJyyx9AZ442TWws8OZ44Si/aT3tsHhDWcI2mzR0CZsgMamha8zadZg1SlVwmJo+b98DgGpdqIFS6+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=HDZagU0O; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=iCGlt1XjQ6QDZy/H4sRD//zFdvPIbzwJDuXqfDTZWiE=; b=HDZagU0Or4bBEC1KIYcsqJYh/t
	12u8YWrIKHC1A5oUovdwvFi/FDdvMnDe/THtbf4y8XcD/uhvsgSmx07Z5awaA/yoe9v1go+Ipe+IT
	nibmkv8+HhR7rAOoPdjYZLPjl2NKEbaWZNYQLZOqhHuBhthsa1TLSeepcdEV25+msAg1JArMcjnFm
	m4nQ0ZJPpH6E9ebcVHtzpwQsuTk0Ovrq1v7AadIt/WJOeskVT5ktiRN36HRfCg8AZkWl+HXd0wEud
	4SSqtUx3Y5WuUskBrOmfMBdGmCRPDLe+JAb7QZcY0WOUCNRSaqxgkhyIkSY3hZ40tn5pHvizppt9B
	+/cSlsLg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:35042)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tkKmJ-0001Uw-0C;
	Tue, 18 Feb 2025 10:24:35 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tkKm9-0007B7-2G;
	Tue, 18 Feb 2025 10:24:25 +0000
Date: Tue, 18 Feb 2025 10:24:25 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: netdev@vger.kernel.org
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Drew Fustini <drew@pdp7.com>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Eric Dumazet <edumazet@google.com>,
	Fabio Estevam <festevam@gmail.com>, Fu Wei <wefu@redhat.com>,
	Guo Ren <guoren@kernel.org>, imx@lists.linux.dev,
	Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Minda Chen <minda.chen@starfivetech.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	NXP S32 Linux Team <s32@nxp.com>, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 0/3] net: stmmac: further cleanups
Message-ID: <Z7Rf2daOaf778TOg@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

Hi,

This small series does further cleanups to the stmmac driver:

1. Name priv->pause to indicate that it's a timeout and clarify the
units of the "pause" module parameter
2. Remove useless priv->flow_ctrl member and deprecate the useless
"flow_ctrl" module parameter
3. Fix long-standing signed-ness issue with "speed" passed around the
driver from the mac_link_up method.

 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |  8 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-intel-plat.c |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac-ipq806x.c    |  8 ++---
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |  3 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson.c  |  2 +-
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  6 ++--
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c     |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |  2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-starfive.c   |  4 +--
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c    |  8 ++---
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c  |  4 +--
 .../net/ethernet/stmicro/stmmac/dwmac-visconti.c   |  2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |  3 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 37 +++++++++++-----------
 include/linux/stmmac.h                             |  2 +-
 18 files changed, 50 insertions(+), 53 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

