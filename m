Return-Path: <linux-arm-msm+bounces-50823-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 63863A593B3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 13:10:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5AA0D161D80
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Mar 2025 12:10:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CB0D223714;
	Mon, 10 Mar 2025 12:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="FO2Ajppq"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68733222593;
	Mon, 10 Mar 2025 12:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741608561; cv=none; b=F/SDLURSS/MeMd+yXOHHOYK++BxJeILkJ5u+bguiX0OdJVgVfiFTTj++NNKT881XU3ir8TO9c8hSmeAORwJ60Xtzxxsq4WFJ+P/DBqkZusr7Z9Qolt0lINgXl35U4FhYR1YDaJpSRhbRzY+2LKoxypWgal1QH5byswbRLPtlqz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741608561; c=relaxed/simple;
	bh=Yjkpiv37hbhWQSOGX0HXhS8f6pIf5DV4hH8aBAMFWjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gNJLKJlscvSjJI8N3Y5QUdIhTqSAVFWEupVmdcwN/d12uIU9o/7CBQ7i02/YNDXdqTrK/yz0uTfCCot49CIj1FxmCWafOiNdmK7jfObwLYbTb6Ui7WesVKVg16+cmIIvCli0s1Xy3Y6GjfLEkp5jQAxBLZVumfBrsNnbtn2ipAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=FO2Ajppq; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=PqVBOCxsxyp7wajKPgMinDlSlaZeZV6g0DWdsy2a0XY=; b=FO2AjppqJGF5ifVgbYsiWDAgyW
	IwfC5BRAdftqY9sbhjmf+MCfwuMrOOWTovki9FgpdbT2bLnlNmiz0LtHC68eHtgmam9Wy+vbVjPrL
	3QfLr390Qbk4K1lziDcNf9StX1h5Uga4B3FfQdbIf8jBoVzjqb+d4/ilQW3EPl4onGnYF04G7CjzP
	0ifaNoJ5/39nZYbt3L9NS3FoUhz20xmYGGZpZclGuYLr2+wlpoE+Uje6uyPNRlytqngG+BcrKsyAR
	CdKvD+S0XX1WcQwOFelY6/QOD0LA8D4USDJSAxn/F1cAqNLnhxVMW2/HWWInM/3sY0vDH9FRPrZ6U
	3VId71fg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:48000)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1trbwK-0002XX-2w;
	Mon, 10 Mar 2025 12:09:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1trbwE-0002Rn-1T;
	Mon, 10 Mar 2025 12:08:54 +0000
Date: Mon, 10 Mar 2025 12:08:54 +0000
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
Subject: [PATCH net-next 0/9] net: stmmac: remove unnecessary
 of_get_phy_mode() calls
Message-ID: <Z87WVk0NzMUyaxDj@shell.armlinux.org.uk>
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

 drivers/net/ethernet/stmicro/stmmac/dwmac-anarion.c    | 18 ++++++++----------
 drivers/net/ethernet/stmicro/stmmac/dwmac-ipq806x.c    | 12 ++++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-mediatek.c   |  8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-meson8b.c    |  6 +-----
 .../net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  4 +---
 drivers/net/ethernet/stmicro/stmmac/dwmac-rk.c         |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-sti.c        | 12 ++++--------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c      |  8 +-------
 drivers/net/ethernet/stmicro/stmmac/dwmac-sunxi.c      |  6 +-----
 9 files changed, 22 insertions(+), 54 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

