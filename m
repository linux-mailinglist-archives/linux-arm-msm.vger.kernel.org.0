Return-Path: <linux-arm-msm+bounces-96168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2BqnGiCWrmnRGQIAu9opvQ
	(envelope-from <linux-arm-msm+bounces-96168-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:42:56 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id C744A23662F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 09 Mar 2026 10:42:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 61EA53003E9D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Mar 2026 09:38:55 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0230437AA93;
	Mon,  9 Mar 2026 09:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="XNO7P4n+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC6C217659;
	Mon,  9 Mar 2026 09:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773049134; cv=none; b=GELxI5p97aPNpN+8nk+65y3z2oOveqhxNhPAHCO5ZRqj+jNIkrjtreTy0uiunAlFh6Q3Ngg+XnvzVHvbWFi/6qFSYs5FVExK+u1VkwnXiIZV7CJi86tSbgTJH21OOO+DdljdzP08Ldhje8qvuJanYqgiAMs43ozkCLqq0vtKncY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773049134; c=relaxed/simple;
	bh=WG8MBAd1Px0KOMzPUr6Up1Cm9AP/gxg7IMkSJts1dd0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c40MHW7nx4fe5J5iahNECezY2FKXI+woGksY66XvH01hiJCZbkyB96i4dhAA+MTrKLzxNp4GuvkvQ5dRGUXC6S9iOhuFnqRxg6DyhrgbK8/75HIxMdwlbF7QG8JyLcI/MryXw1T1bcLAk7hvNdQAkDcZRiiN/xOxOXRyehhENLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=XNO7P4n+; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ten1uDei4vcUNTz7WaFaOkJ2TgTa4kazv/d2FQhK9d4=; b=XNO7P4n+74b32BXj8s7Erkc6iR
	C0gpgQ3CyJ/fgq5hADmRh8qc0DZ0ocPWj9/+H2R2K6aahQIQY3QGcjHPlpT5S+gsPrwlQ0dGegv7n
	qUb6c30OGZObfNHJgOh6lMlcnGBE7UpxUu6sWBr/fRAMdd3VTHiNLGVqh6VYvY9L0fYrIhq0peczM
	PRu0+AvWHLy/Xxojy3sws3OFrXBGpJLh7gNwGVXAfgIP7PS7oFtxA4v8/o/FFi/bSHhCODOMtvckY
	WrTniwza8Q9I7GAp99vMPoeGwgAIKWcHUJa05F/iQQR0usv09krwDaD+q90alxeh2zCCSbBsWVkG8
	KKWQrpbg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56676)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vzX4L-000000003TL-1Y7v;
	Mon, 09 Mar 2026 09:38:33 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vzX4E-000000004CG-0wpW;
	Mon, 09 Mar 2026 09:38:26 +0000
Date: Mon, 9 Mar 2026 09:38:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Frank Li <Frank.Li@nxp.com>,
	imx@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>,
	Jan Petrous <jan.petrous@oss.nxp.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, s32@nxp.com,
	Samuel Holland <samuel@sholland.org>,
	Sascha Hauer <s.hauer@pengutronix.de>, Yao Zi <me@ziyao.cc>
Subject: [PATCH net-next v2 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aa6VEsmBK-S9eNYU@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Queue-Id: C744A23662F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-96168-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[27];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_SPAM(0.00)[0.190];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:rdns,sea.lore.kernel.org:helo,shell.armlinux.org.uk:mid,armlinux.org.uk:url]
X-Rspamd-Action: no action

Hi,

Start shrinking stmmac's memory usage by avoiding using "int" for
members that are only used for 0/1 (boolean) values, or values that
can't be larger than 255.

In addition, as struct stmmac_dma_cfg is approximately a cache line,
shrinks below a cache line as a result of this patch set, and is
required, there is no point separately allocating this from
struct plat_stmmacenet_data. Embed it into the end of this struct
and set the existing pointer to avoid large wide-spread changes.

Lastly, add documentation for struct stmmac_dma_cfg, and document
the stmmac clocks as best we can given the driver history.

v2:
- fix error in commit message for patch 5
- fix typo in comment in patch 6

 drivers/net/ethernet/stmicro/stmmac/common.h       |   4 +-
 .../ethernet/stmicro/stmmac/dwmac-dwc-qos-eth.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |   7 +-
 .../net/ethernet/stmicro/stmmac/dwmac-loongson.c   |   6 +-
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |   8 +-
 .../net/ethernet/stmicro/stmmac/dwmac-motorcomm.c  |   4 -
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-s32.c    |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c  |   4 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c  |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-tegra.c  |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |   2 +-
 .../net/ethernet/stmicro/stmmac/dwmac100_core.c    |   2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   4 +-
 .../net/ethernet/stmicro/stmmac/dwxgmac2_core.c    |   4 +-
 drivers/net/ethernet/stmicro/stmmac/hwif.h         |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac.h       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  | 227 +++++++++++----------
 drivers/net/ethernet/stmicro/stmmac/stmmac_pci.c   |  11 +-
 .../net/ethernet/stmicro/stmmac/stmmac_platform.c  |  43 ++--
 include/linux/stmmac.h                             |  93 +++++++--
 23 files changed, 239 insertions(+), 200 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

