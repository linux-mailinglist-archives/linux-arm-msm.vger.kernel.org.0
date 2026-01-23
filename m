Return-Path: <linux-arm-msm+bounces-90309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLeICutEc2lEuQAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90309-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:52:43 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B1173A5A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 10:52:42 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id AECD03026884
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 09:52:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2F0202765C4;
	Fri, 23 Jan 2026 09:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="F5fu422o"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0360357A43;
	Fri, 23 Jan 2026 09:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769161942; cv=none; b=axNz4CSCvCNScqe0iB/xvWSHGbLJy45WhUG7XoGP8Pu5or2k3MRWHxuWTaffeiHAoK+bghasHmCwl9oIsFPP4CmibEztCmM1oSQfodzHuiAAqeiQ6VjMWRTXwVGyRGRjFDkcPuhjF8J1LYBZABJ3XKmJA6U1pHyRWaH6GdpMdNY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769161942; c=relaxed/simple;
	bh=klEDosuDijY2uir1pnhU8DjLJHb+hA3FRwMtxTlwTAs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=teql00Ng3/1B+/ivSMcDskTBUHou5Cf2owePEUVFJj54H2mDLSyOLOTgUXqAQM6VYn3sUwkGLzFcL+3CKg22d382Jt9Xw4uH/EhzAarzVsgMt+B/4vFwCAmjg/5xCpYg4HzLyquYB6kqgG6aAtPCRrj9xRt1bi6vfrTeYmMxWLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=F5fu422o; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RWuW5JRJkTTAGksSHPsZsAEGeAXBXTdxAdnPu9NDH6Y=; b=F5fu422oxH9eqdpqTAzp2xz3sB
	dQxvfZCb5JRKMh0LUsP/kt9O/CqaTg4LFWyrHy/8pKlKRWoh9gAJ3RF/XnhQ7bDdsqkYIO62HZMFY
	vIF4fvF/YVf5Yfw9glgS6x7wsgTdcB+3Zw2ZU1+Ds2HT8NUNybbqveFrP8pXG2j90xf2C/vQXUQ7k
	4NDY5613OPdjNIS9AlkQAC+6ZzHGI25Gym9loFZWol8dkxCPalr90DhxXSf1cLtbyQ3rRv3Bi7jA3
	OL+WK/T/yzLJl7acR6T10ngb+6mkkk9LWmugFFp6bZxtwzJt2MnxMcEO+Ao4N4CshsvvGxRCFnsEv
	t3/QZSsw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:54434)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjDpk-000000001Zh-2pM7;
	Fri, 23 Jan 2026 09:52:04 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjDpg-000000001zP-1EcP;
	Fri, 23 Jan 2026 09:52:00 +0000
Date: Fri, 23 Jan 2026 09:52:00 +0000
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
Subject: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c04:e001:36c::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90309-lists,linux-arm-msm=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[lunn.ch,gmail.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	FREEMAIL_CC(0.00)[foss.st.com,lunn.ch,davemloft.net,google.com,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,gmail.com,linaro.org,redhat.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.895];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c04::/32, country:SG];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 92B1173A5A
X-Rspamd-Action: no action

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
v2:
 - fix further AI review bot dribble that could've been raised on
   the rfc version but wasn't.
 
 drivers/net/ethernet/stmicro/stmmac/Makefile       |   2 +-
 drivers/net/ethernet/stmicro/stmmac/common.h       |   1 -
 .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  74 ++-----
 drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  12 +-
 .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  11 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  10 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  10 +-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  69 +++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 222 +++++++++++++++++++--
 drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  53 ++---
 .../net/ethernet/stmicro/stmmac/stmmac_serdes.c    | 111 +++++++++++
 .../net/ethernet/stmicro/stmmac/stmmac_serdes.h    |  16 ++
 drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          |  43 ++++
 include/linux/stmmac.h                             |   2 +
 14 files changed, 491 insertions(+), 145 deletions(-)

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

