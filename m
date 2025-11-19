Return-Path: <linux-arm-msm+bounces-82486-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id A07CEC6E443
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 12:39:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 057C3341973
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Nov 2025 11:34:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4EA2634BA4E;
	Wed, 19 Nov 2025 11:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="pOSTqqYz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8527731987E;
	Wed, 19 Nov 2025 11:34:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763552068; cv=none; b=Y8d8R9YIH5j7hsy9TAqqAo0PsStlUPTeaJPKT4itYadeNFuaj+K1CQv0XhiIQ1YaH+mv37458gInmA95Yf9CHgL+RUlP1pI9XI8r50WBwK9/eJsR07YyyjE+0+sDACENYkwLWyJXIeyaWPLNDLaD+l+En4naQ21RH3YyUDhxqvs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763552068; c=relaxed/simple;
	bh=pUPWeZsug3sni5KCcLRgm4GMCnShGooF9F9tLukj2JQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=n7ttnFggNuSdvyjQIsdA+WY0x2q2zXaEn/MZP5soNfVhkeSBIS1iWXuPMD5PmvsMRQJq1GIwp2meXeZaoRa2wR6zkaYci6fxXlV0fLsGOwSlQWOulMPXC8QNjZzFO8kDRtejhgc/9Rvx6bNxXtjwXPpmEDtgeX5nnTPWWhGlxOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=pOSTqqYz; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=uEewVsMLAv2aDxqt0r1sf+yLOlZnw0JDZFJF1n58Zro=; b=pOSTqqYzG2omR7F+wWJF0cCRo+
	+VUDDo73jyRh/xEVBPRhdQQ6T9zGEhqtu67BbdJzQt9+x+Tm5vz70rsV0Q8SAuOy/qOGC0XGJyt9V
	yeEJV3XEgrvnb794NKTTMqgwEks9JO3cAKZfuEmzMgdON1v6C8yuMDU7Mrgn5pkwLrjEIl7yv2963
	sb/Jpwso5IKLEk9cYwUgbcDJOjs7b52fwlY71z3recyM2MxH2sr8w9JcHXtytdh5fcFo9sO1FkXNj
	9hUmy3TMGncEFkI6+bqK7veiMvUCWByE7BlxmGlGxOjd65F749xBkBq7nxg3SnWAR9aWu/02ThhFT
	x+nb8vgg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36316)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vLgS3-000000004an-22ey;
	Wed, 19 Nov 2025 11:34:19 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vLgS0-000000003NK-0l0S;
	Wed, 19 Nov 2025 11:34:16 +0000
Date: Wed, 19 Nov 2025 11:34:16 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 0/3] net: stmmac: qcon-ethqos: "rgmii" accessor
 cleanups
Message-ID: <aR2rOKopeiNvOO-P@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

This series cleans up the "rgmii" accessors in qcom-ethqos.

readl() and writel() return and take a u32 for the value. Rather than
implicitly casting this to an int, keep it as a u32.

Add set/clear functions to reduce the code and make it easier to read.

Finally, convert the open-coded poll loops to use the iopoll helpers.

 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    | 245 +++++++++------------
 1 file changed, 110 insertions(+), 135 deletions(-)
-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

