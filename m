Return-Path: <linux-arm-msm+bounces-88607-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF96D14ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 19:08:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 22387300C341
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 18:08:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 363013806BB;
	Mon, 12 Jan 2026 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="izpSrphv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE7293806AC;
	Mon, 12 Jan 2026 18:08:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768241302; cv=none; b=WwynCRXvtgcuYgPb0YJxs7jkZ5vbsideFU4HvPgGINt43DRH++5NDPGHw93PxyN7lrIsUPGGK1CacKCTASJ3yIx11v55BEwNljk9R/q13ID4OHVRuakosTTvJayp+uJO1cE4l6XeGupsVeybfZwRMhe25S3GfUyBeMY/3N0ocjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768241302; c=relaxed/simple;
	bh=Brwyd2PU1LASp9DS9u81yTya1cuTLkbaT6hKR5ONpi8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYf1dFOBSkzm1rmXslNeUo0Ohzno+IP3w0P2veQognZe7uiPHQ8cebyB9nt2cVMkxHmJb8n1gIOoFEnwFTJT6DOKcolZkRL8hFZMOOqjHLBWZ4teksivl92DLz04CiMzZYUPN6K3h4Y+Uv0HjwufeLgJgjmBI3LKr6PgFMD2RRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=izpSrphv; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Ef9uJWFZZJYJaa8UiGEDMdnQ6g9MSTSO60hpTpe7fIs=; b=izpSrphv+g8cCmqNORF0148Yeb
	50eCDsdtx36q+Et6RMgOwjx8Ft6oFxjcqGhzTJrwWEcwTJ9vDnD9YnCFlob3LL5su48dIXDE5Tgpv
	/qfryh+SCMOutF8/Z0uEeJD6c24TeG8SXCpW4qTa9i8gaDd/8YSUpDMxaTYZCJYXK57h3Ah2AVEXj
	0efXIhSXsDX+YVpbhsaPISaO65fYdvUqjoE3WUcJOKJeBR2qMj9Bg4h4hNzoTVMwGcueqlMUfh9Nl
	QrZGY+WMbYIkwmzvY0D7b3+dkvJM2b8nH28tk6DHZ6TxNuRDVsOshqTq/52CUKXNvOrHa98SzbElI
	yWR3f8Dg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57284)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vfMKk-000000006b8-3CQJ;
	Mon, 12 Jan 2026 18:08:06 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vfMKg-000000008GX-1EZT;
	Mon, 12 Jan 2026 18:08:02 +0000
Date: Mon, 12 Jan 2026 18:08:02 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
	Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 0/2] net: stmmac: qcom-ethqos: cleanups
Message-ID: <aWU4gnjv7-mcgphM@shell.armlinux.org.uk>
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

Two changes:
1. In a previous commit, I missed that mac_base became write only.
Remove it.

2. Switch qcom-ethqos to use the set_clk_tx_rate() method rather than
setting the RGMII clock in the fix_mac_speed() method.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 22 +++++++++-------------
 1 file changed, 9 insertions(+), 13 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

