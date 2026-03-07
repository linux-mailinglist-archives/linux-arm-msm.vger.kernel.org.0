Return-Path: <linux-arm-msm+bounces-95942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IMMrANQFrGkxjAEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-95942-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:02:44 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sin.lore.kernel.org (sin.lore.kernel.org [IPv6:2600:3c15:e001:75::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id EE14D22B497
	for <lists+linux-arm-msm@lfdr.de>; Sat, 07 Mar 2026 12:02:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sin.lore.kernel.org (Postfix) with ESMTP id F09C73013C5D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  7 Mar 2026 11:02:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C6AB131813A;
	Sat,  7 Mar 2026 11:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="SdgJq7HZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C0A61F0E2E;
	Sat,  7 Mar 2026 11:02:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772881356; cv=none; b=isSXaPmLIIdnkcftY9o+dTBcuUpzmHJ0Bhq6QUn7sgDf85rgy4QeXydQcEfhWatrtwS9hDoDZHtX2NRQjVxs71iu3KQ9iCNWkvwObaVJ1ewIvCN9d0sWrp0nEtj51Wxo+Uf/zro71zg9kdrIeVtg9Y30dyysXp7i/Dlf7RgJoPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772881356; c=relaxed/simple;
	bh=53XapX2SdQM0kzJ82St/Nd+Klw4hiJZtqYA60YbvNdk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BpTfqrAjhplOaP/f1pTfsd3Hu2S67zWgNesCzozEVrvx398Q4DFkum3c2mfYpBD8fZzBB/YxbXbcJRkjHi+PrjwCl4F6twIzY1biW5ovqOYXSJvILdfsW6Xa+1gz21dUmZR3pXoD+R1flLe8Y9ZHRDIS+VlcYf1tHzjkH86AUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=SdgJq7HZ; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=142mbsECCtXmYpR3GC+jVCceuUhe350k8xSDlqgPjOw=; b=SdgJq7HZDkthwcLffkabiqe7/L
	sVRi0TWbOnfG4FDOdk9YshJkajdUpAuuaBVgEGoVXAkcGqZP9nWrJdUi4ElpaBfBaLYqh568xKrHK
	dAyyfwXh4pXUJHcXZ5+WJ+BqL0QC8AnBGTxtJknaOpbZKPFt+Rgr4nnS0GEZ/x1s+R+OHeZK55PjP
	OoHQvHcCCm9m3LQls+55nAc406l/5NFbNKqAxkYmo9WlNHs0b1jBfDS8vFCKIhhjY0o+fNop32W7I
	yGSGolQz0MYaC7DYfbAdDyv77h00yLcnuGczzIVAhxpiXaSi9UB6KwamL1kDmPLUHXMUOWf0z0KAZ
	jnXoCHPw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57216)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vypQM-00000000279-187T;
	Sat, 07 Mar 2026 11:02:22 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vypQI-000000002KG-0k1L;
	Sat, 07 Mar 2026 11:02:18 +0000
Date: Sat, 7 Mar 2026 11:02:17 +0000
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
Subject: [PATCH net-next 0/7] net: stmmac: start to shrink memory usage
Message-ID: <aawFuXTVAgVOrw4k@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Queue-Id: EE14D22B497
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c15:e001:75::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-95942-lists,linux-arm-msm=lfdr.de];
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
	NEURAL_SPAM(0.00)[0.191];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	ASN(0.00)[asn:63949, ipnet:2600:3c15::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,sin.lore.kernel.org:rdns,sin.lore.kernel.org:helo]
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

