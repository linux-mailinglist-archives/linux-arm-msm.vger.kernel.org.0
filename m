Return-Path: <linux-arm-msm+bounces-51110-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE33A5D90C
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 10:15:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 836A11651CE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 09:15:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04ED7239797;
	Wed, 12 Mar 2025 09:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="F6P8O9yM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E442B23908C;
	Wed, 12 Mar 2025 09:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741770918; cv=none; b=eVRcivrEAJtx++/F43KBS3KeQq83i53lhfmdv4PgJuoonBoKnQHS3c8z84OPXTLo6kR2VrP0Jp0k3WXpJFtNp5MI541mwjINz+rA+kscNeq4JKZxLJ2XHLFkSg0YuxIVrLbgcUIYXMXn2FwKbdwT0TtKHrR4A+kjVOcyVScm1EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741770918; c=relaxed/simple;
	bh=/ZhUX/DXq4nHu0LOSR1gUuS30JxQuoradw2Id3mYjPg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ArWfZX5G4KYbEy9Xkex3OXu/uu5k7q3G8d8o+uQpR0cbE9zrPYcTdRNMzY6LhpJM3sXxgHGPlemWmIqfelplMgg3k91ZL8faKFbcTQKaWz0YPXssV/Fl85ptrwMTJYKk5I7FQFv8SVYQl4/rFCLZmqlFlRCNtRo3lgIq4H9FrQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=F6P8O9yM; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GLIba+q4BDE9qdzTgPLlPQOlp5Vu1/gYQkbg2o8SPf4=; b=F6P8O9yMyitUkFBMj+62u1Wxx1
	8tFlx/t5XL1sRU3psd0hU/hHxFYJJ3qA6cgX6fDUir0PJq0sN38pxNZlkOD9gBDQ42J+X36nhC6pg
	eBwJv5WTwJ+FyAKjSVpPua8pcVcCMlAgTKNjuvr2JrVdikixn/gR8Fwp/IHDYeCzT40KqXW1y8Z4d
	d6gdNon8uIGCgflq0cbdeTWJmKceAsN+ngdhOoTOziNmf7bHkdM8ynDjB/gXvEFHxAVqSFOHEXmTK
	4d950rgkvRVZMtdhHwYQYW2BvttkhHrF+vRiXzKGYcIhpBirIaMRNj0RzaNjl00e5FPMhAPtQ6nd8
	1y6QEqdQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39976)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1tsIB1-0005A4-2C;
	Wed, 12 Mar 2025 09:14:59 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1tsIAv-0004PY-1F;
	Wed, 12 Mar 2025 09:14:53 +0000
Date: Wed, 12 Mar 2025 09:14:53 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen-Yu Tsai <wens@csie.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Kevin Hilman <khilman@baylibre.com>,
	linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-sunxi@lists.linux.dev,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	Samuel Holland <samuel@sholland.org>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next v2 0/9] net: stmmac: remove unnecessary
 of_get_phy_mode() calls
Message-ID: <Z9FQjQZb0IMaQJ9H@shell.armlinux.org.uk>
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

This series removes unnecessary of_get_phy_mode() calls from the stmmac
glue drivers. stmmac_probe_config_dt() / devm_stmmac_probe_config_dt()
already gets the interface mode using device_get_phy_mode() and stores
it in plat_dat->phy_interface.

Therefore, glue drivers using of_get_phy_mode() are just duplicating
the work that has already been done.

This series adjusts the glue drivers to remove their usage of
of_get_phy_mode().

Changes in v2:
- correct subject for patch 3
- fix build error in patch 3
- add attributations

 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c | 21 +++++++++------------
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c | 12 ++++--------
 .../net/ethernet/stmicro/stmmac/dwmac-mediatek.c    |  8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c |  6 +-----
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c |  4 +---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c      |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c     | 12 ++++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c   |  8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c   |  6 +-----
 9 files changed, 23 insertions(+), 56 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

