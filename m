Return-Path: <linux-arm-msm+bounces-90332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UEFcFwRZc2nruwAAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90332-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:18:28 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1E074EC4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 12:18:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 869E2302AE01
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 Jan 2026 11:13:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2A6C33A6ED;
	Fri, 23 Jan 2026 11:13:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="zlxp6bbS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9B431AABF;
	Fri, 23 Jan 2026 11:13:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769166818; cv=none; b=iYMIG+85xCaw1ILeEj3DFNfXo7hcsnJUsAnWQGEYcqiM8b3A6OitLn5GYnUbvr+2czpVzh7C0yRCelGrvP7DtqW5HMwxX8nYnhYw2Wa0VLd0UhAPVwkxIxFe6H1IPGDWqunNNTFPJ5PxK+ZRvlf8I13JkechRXG+e+CccBDckPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769166818; c=relaxed/simple;
	bh=MJLO83jCA4MxM79trawupE0Yr9I28Svi19yQn9PK8no=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ioep1CfWaoGx77078qXSOazlNF63oH6V5yFOWoh/x8O95sQfvCspErlmCxap9C2ZESRGyOcdqIfxh5Yo0prc5tf70Ap5uYr/La/C3SWLIoPA9Ywke17yvAfIZEUyQP5VrlvzHas+aQLJ9MyunVAg5iXY6ydUGqidaD93QhRfWvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=zlxp6bbS; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=rW6hIs7kbRE6sqC+VHhb8yfuCQxkSIbxM4EYUPiSqtQ=; b=zlxp6bbSAdrUvEEckC6IDgQkwS
	smUH7veqqcf/A7ifQVrNarkgkN6fyrAyh3Wv9wXroHnUW1bGNyYswwd5gBGipBhCXXr/rouJDvOMn
	e8L4drbydog/ojOmYaOIufuu3h8sPcPxTRcvhK9TtkuzOJ381J8hnTW+JNGn1KuSw3e98I4p+y/2q
	tRG88KVUkDCOeiLMp26CFEdZDCOEUx303vTo87F9X9yacUkoK5+gEuN6C0dMaUzZtvaKhvvHxAwoT
	zh/oFMfJltVh8yijjuPpiNLrclGxwHjLL1AqiNQzC0u9QkaGSpJN7zV7MFB8hLR1LsaU++zvruHgs
	urysKlsA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:39500)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vjF6X-000000001uQ-3Rne;
	Fri, 23 Jan 2026 11:13:29 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vjF6V-0000000022q-0aE9;
	Fri, 23 Jan 2026 11:13:27 +0000
Date: Fri, 23 Jan 2026 11:13:26 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXNX1oi7nWLcPK28@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90332-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[16];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.992];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,shell.armlinux.org.uk:mid,sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: ED1E074EC4
X-Rspamd-Action: no action

According to patchwork, this doesn't apply to net-next. That's odd,
it was generated on last night's net next, and although there has been
further work, it rebases cleanly on top of this morning's. How can
these changes:

 drivers/net/ethernet/stmicro/stmmac/dwmac-imx.c   |  6 +++++-
 drivers/net/ethernet/stmicro/stmmac/stmmac_main.c | 20 ++++++++++++++++----
 2 files changed, 21 insertions(+), 5 deletions(-)

which happened in net-next overnight result in this change in patch 1:

 drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c | 3 ---
 1 file changed, 3 deletions(-)

failing to apply?

No, patchwork is clearly wrong.

On Fri, Jan 23, 2026 at 09:52:00AM +0000, Russell King (Oracle) wrote:
> This is the v1 submission: if it doesn't get tested but review goes
> well, it'll end up in net-next and mainline without testing on the
> affected hardware!
> 
> Mentioned previously, I've been trying to sort out the PCS support in
> stmmac, and this series represents the current state of play.
> 
> Previous posted patches centred around merely getting autonegotiation
> to be configured correctly, to a point where the manual configuration
> can be removed from the qcom-ethqos driver. The qcom-ethqos driver
> uses both SGMII and 2500BASE-X, manually configuring the dwmac's
> integrated PCS appropriately.
> 
> This *untested* series attempts to take this further. The patches:
> 
> - clean up qcom-ethqos only-written mac_base member.
> - convert qcom-ethqos to use the set_clk_tx_rate() method for setting
>   the link clock rate.
> - add support for phy_set_mode_ext() to the qcom "SGMII" ethernet
>   SerDes driver (which is really only what it needs. Note that
>   phy_set_mode_ext() is an expected call to be made, where as
>   phy_set_speed() is optional and not. See PHY documentation.)
> - add platform-glue independent SerDes support to the stmmac core
>   driver. Currently, only qcom-ethqos will make use of this, and
>   I suspect as we haven't had this, it's going to be difficult to
>   convert other platform glue to use this - but had this existed
>   earlier, we could've pushed people to use PHY to abstract some
>   of the platform glue differences. Adding it now makes it available
>   for future platform glue.
> - convert qcom-ethqos to use this core SerDes support.
> - arrange for stmmac_pcs.c to supply the phy_intf_sel field value
>   if the integrated PCS will be used. (PHY_INTF_SEL_SGMII requires
>   the integrated PCS rather than an external PCS.)
> - add BASE-X support to the integrated PCS driver, and use it for
>   BASE-X modes. This fully supports in-band mode, including reading
>   the link partner advertisement.
> - add in-band support for SGMII, reading the state from the RGSMII
>   status field.
> 
> As we leave qcom-ethqos' manual configuration of the PCS in place at
> the moment, the last patch adds reporting of any changes in its
> configuration that the qcom-ethqos driver does beyond what phylink
> requested, thus providing a path to debug and eventually remove
> qcom-ethqos' manual configuration.
> 
> One patch is not included in this set - which adds a phy_intf_sel
> value for external PCS (using PHY_INTF_SEL_GMII_MII). I believe all
> external PCS use this mode when connected to a MAC capable of up to
> 2.5G. However, no platform glue that provides the mac_select_pcs()
> method also provide the set_phy_intf_sel() method, so we can safely
> ignore this for now.
> 
> I would like to get this into net-next before the next merge window,
> so testing would be appreciated. If there are issues with these patches
> applied, please check whether the issue exists without these patches
> and only report regressions caused by this patch set. For example,
> I'm aware that qcom-ethqos has issues with 10Mbps mode due to an AQR
> PHY being insanely provisioned to use SGMII in 1000M mode but with
> rate matching with 10M media. This is not an issue that is relevant
> to this patch series, but a problem with the PHY provisioning.
> 
> rfc->v1:
>  - fix SGMII link status
>  - avoid calling phy_get_mode() if PHY is null
> v2:
>  - fix further AI review bot dribble that could've been raised on
>    the rfc version but wasn't.
>  
>  drivers/net/ethernet/stmicro/stmmac/Makefile       |   2 +-
>  drivers/net/ethernet/stmicro/stmmac/common.h       |   1 -
>  .../ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c    |  74 ++-----
>  drivers/net/ethernet/stmicro/stmmac/dwmac1000.h    |  12 +-
>  .../net/ethernet/stmicro/stmmac/dwmac1000_core.c   |  11 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4.h       |  10 +-
>  drivers/net/ethernet/stmicro/stmmac/dwmac4_core.c  |  10 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_main.c  |  69 +++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.c   | 222 +++++++++++++++++++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_pcs.h   |  53 ++---
>  .../net/ethernet/stmicro/stmmac/stmmac_serdes.c    | 111 +++++++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_serdes.h    |  16 ++
>  drivers/phy/qualcomm/phy-qcom-sgmii-eth.c          |  43 ++++
>  include/linux/stmmac.h                             |   2 +
>  14 files changed, 491 insertions(+), 145 deletions(-)
> 
> -- 
> RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
> FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
> 

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

