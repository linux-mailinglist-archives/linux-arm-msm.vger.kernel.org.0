Return-Path: <linux-arm-msm+bounces-89651-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0DD3A8DD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 13:33:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id A452D30533BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Jan 2026 12:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 730B128FFE7;
	Mon, 19 Jan 2026 12:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="kObIpteA"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538D35B14D;
	Mon, 19 Jan 2026 12:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825981; cv=none; b=vDG/emfvv3JiVoj18/O2AwTToxOzxBC6VM0Qk3Xk7qKzl+NiLRCIeR/sPvga441s7sMH7Ut9IfdBKRFOHoZVEZikOdQYOuIWz2jEQBVvBVbfFOszZfV4xPm2DxukDSptw3n3BL8nibmFx42pUe5BM1hORKghGWLK2+8qXb5qrZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825981; c=relaxed/simple;
	bh=7aNvbzv3pdlAsrJM88uRQnK9KOxXRU1OyL9zdfXfkhY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AUAT2dYRjijxgfGcmzd7RaQidD+Ye/Hc44Sfz1nOvZE6rI9KvkwKRnVXDYyATocb0mi9DBI9DlwMGklwNh9F7d0TOgOOvmJ+MCSecRx9t/6VnCe43SlI3Tx3ymDEx3Yf4sKzxezACfdoNihzzob+6scHmY32duBz8DxY9cffMDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=kObIpteA; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ru0nxSOEAUS0c1CIJ001g/HVYfV6kPWDtKRmcrJjgng=; b=kObIpteAPzCuUxauZeML37Pk7E
	pk151CM3jRglHjSj9s073pEL6WuAapJhIvJZdtVR7cZXkv2KIfkGK3kQTz38a841qfLNrgqjkRQev
	q/jgyT1H/R0yP006BvGPaWHNbEi5hELEfS5AplPbSIS2gOyDtVoSBGD7LtStxhTrPGaFp3dBPD5AG
	5Ok+rz/tlc/VHSbviizcy5+yMMHW5a5Y/UoTEhLHjXzASkAzvr4lMnj0fOQB15fA72Hu0Ib+XOHdS
	ojjqx8TnSoG/OeBbo+y0F+ciPOub6obVqBapbNYhLzFDLR8KHg2GujY1oHbfnpxkw2Yy3EmfROUQc
	V2xtvRpQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:40468)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vhoR4-00000000517-35y5;
	Mon, 19 Jan 2026 12:32:46 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vhoR0-000000006Y5-2Egz;
	Mon, 19 Jan 2026 12:32:42 +0000
Date: Mon, 19 Jan 2026 12:32:42 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: [PATCH net-next 00/14] net: stmmac: SerDes, PCS, BASE-X, and inband
 goodies
Message-ID: <aW4kakF3Ly7VaxN6@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

This is the v1 submission: if it doesn't get tested but review goes
well, it'll end up in net-next and mainline without testing on the
affected hardware!

Mentioned previously, I've been trying to sort out the PCS support in
stmmac, and this series represents the current state of play.

Previous posted patches centred around merely getting autonegotiation
to be configured correctly, to a point where the manual configuration
can be removed from the qcom-ethqos driver. The qcom-ethqos driver
uses both SGMII and 2500BASE-X, manually configuring the dwmac's
integrated PCS appropriately.

This *untested* series attempts to take this further. The patches:

- clean up qcom-ethqos only-written mac_base member.
- convert qcom-ethqos to use the set_clk_tx_rate() method for setting
  the link clock rate.
- add support for phy_set_mode_ext() to the qcom "SGMII" ethernet
  SerDes driver (which is really only what it needs. Note that
  phy_set_mode_ext() is an expected call to be made, where as
  phy_set_speed() is optional and not. See PHY documentation.)
- add platform-glue independent SerDes support to the stmmac core
  driver. Currently, only qcom-ethqos will make use of this, and
  I suspect as we haven't had this, it's going to be difficult to
  convert other platform glue to use this - but had this existed
  earlier, we could've pushed people to use PHY to abstract some
  of the platform glue differences. Adding it now makes it available
  for future platform glue.
- convert qcom-ethqos to use this core SerDes support.
- arrange for stmmac_pcs.c to supply the phy_intf_sel field value
  if the integrated PCS will be used. (PHY_INTF_SEL_SGMII requires
  the integrated PCS rather than an external PCS.)
- add BASE-X support to the integrated PCS driver, and use it for
  BASE-X modes. This fully supports in-band mode, including reading
  the link partner advertisement.
- add in-band support for SGMII, reading the state from the RGSMII
  status field.

As we leave qcom-ethqos' manual configuration of the PCS in place at
the moment, the last patch adds reporting of any changes in its
configuration that the qcom-ethqos driver does beyond what phylink
requested, thus providing a path to debug and eventually remove
qcom-ethqos' manual configuration.

One patch is not included in this set - which adds a phy_intf_sel
value for external PCS (using PHY_INTF_SEL_GMII_MII). I believe all
external PCS use this mode when connected to a MAC capable of up to
2.5G. However, no platform glue that provides the mac_select_pcs()
method also provide the set_phy_intf_sel() method, so we can safely
ignore this for now.

I would like to get this into net-next before the next merge window,
so testing would be appreciated. If there are issues with these patches
applied, please check whether the issue exists without these patches
and only report regressions caused by this patch set. For example,
I'm aware that qcom-ethqos has issues with 10Mbps mode due to an AQR
PHY being insanely provisioned to use SGMII in 1000M mode but with
rate matching with 10M media. This is not an issue that is relevant
to this patch series, but a problem with the PHY provisioning.

rfc->v1:
 - fix SGMII link status
 - avoid calling phy_get_mode() if PHY is null

 drivers/net/ethernet/stmicro/stmmac/Makefile       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |   1 -
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  74 ++-----
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |   9 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |   8 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  69 +++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 220 +++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  53 ++---
 .../net/ethernet/stmicro/stmmac/stmmac_serdes.c    | 111 +++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_serdes.h    |  16 ++
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          |  43 ++++
 include/linux/stmmac.h                             |   2 +
 12 files changed, 483 insertions(+), 125 deletions(-)
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.c
 create mode 100644 drivers/net/ethernet/stmicro/stmmac/stmmac_serdes.h

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

