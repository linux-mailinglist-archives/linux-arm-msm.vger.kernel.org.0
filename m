Return-Path: <linux-arm-msm+bounces-90813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6LVxBA3feGkCtwEAu9opvQ
	(envelope-from <linux-arm-msm+bounces-90813-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:51:41 +0100
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D258971C0
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 16:51:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B4ECA3012BCD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Jan 2026 15:43:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80B923033E1;
	Tue, 27 Jan 2026 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="T0YUbKdr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 892F8288C22;
	Tue, 27 Jan 2026 15:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769528594; cv=none; b=OkwnjprGZ1wBJsk7Kexy9QjcEP5t4QnNGVskblGC4mp/wQVwCsOrq6ASSxwIoMnvwG8crmw0qj5URNVpiTwLkeWSKBVN/Fok03ht1XTOiPEtDkwIKvxchxmFu3BimAk6jeWES+GZMcJQ2msUfjWa7i3RtDqzugaaxDeVGyDwwUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769528594; c=relaxed/simple;
	bh=HCVXvaC+CKIiK0j9ev7Zv5mfWD6p42zgwzRPpDFajIE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C5PZCX19CYNuR6VOubVSD2+edHYUkQyNSP+DlvFKOKJ8BB58HmkVykae82gE7Ol1utQ+5hFHV6xYCCUKWhvsAV9P0FhxcL5ntwaGEH0QzwvQsMi1ayMjIh5oXRyMXCQC/E2YHoP0ZqlyQQOVC3IdptegTUnGyi4vavBVdzdsQF0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=T0YUbKdr; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5sFzt8QJiY/XCvYBOB1ozow7uNq+IcHiTAmlpL9f5z0=; b=T0YUbKdrqnbux0i8waouuZ1ydu
	LTpnVvKwVpsnOKvFipfpOyovNK/PZtp6aUKo+IxAOz3VHuFaF+Vmi46hkHWNmmKlU/i3Ebk0UBh6L
	fzI7QUPCtt+Q5UEgTquPTgzy5HrcVJrJvtqfXBLGaRdjqt9/fBPhhGqQcthXM1J5cduAm2Om4jtrm
	GBMJsIOo0o0M0/vX6D6UoLBqMzsgwM/mvDSsU6i+NAz3rXcuLkjRXb832kbElodVwAkADcEE6p+g1
	rspLK2Twqcpf7QmFPkdBQ3aIAIIBa+esKkldOPC9btppqWjOJLA7xFIdpsuUOynmzerpjBsGk+kFq
	hWh8TX4Q==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:44086)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vklDZ-000000006M6-3XKB;
	Tue, 27 Jan 2026 15:43:01 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vklDV-0000000061l-47xP;
	Tue, 27 Jan 2026 15:42:58 +0000
Date: Tue, 27 Jan 2026 15:42:57 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next v2 00/14] net: stmmac: SerDes, PCS, BASE-X, and
 inband goodies
Message-ID: <aXjdAZeUl2Dsu4mE@shell.armlinux.org.uk>
References: <aXNEwBW3OA1xLEUj@shell.armlinux.org.uk>
 <aXN5BFXMshnhwBQ7@oss.qualcomm.com>
 <aXPo5R1Q-qWG3r3l@shell.armlinux.org.uk>
 <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXjSbu6L6ICYOPiJ@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-90813-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[lunn.ch,gmail.com,foss.st.com,davemloft.net,google.com,kernel.org,oss.qualcomm.com,lists.infradead.org,vger.kernel.org,st-md-mailman.stormreply.com,linaro.org,redhat.com];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.994];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,armlinux.org.uk:url,shell.armlinux.org.uk:mid]
X-Rspamd-Queue-Id: 7D258971C0
X-Rspamd-Action: no action

On Tue, Jan 27, 2026 at 08:27:50PM +0530, Mohd Ayaan Anwar wrote:
> It is using the same SerDes PHY (qcom_dwmac_sgmii_phy_driver).
> 
> I added additional debug prints, and I think the crash is due to
> BMSR_ESTATEN not being set in GMAC_AN_STATUS.

I'm going to submit a patch which fixes the phylink crash - it should
be able to cope with pcs being NULL at the oops site.

> During pcs_init, BIT(8) of GMAC_AN_STATUS is 0:
> [    7.985913] [DBG] GMAC_AN_STATUS = 8

Hmm. This means that your hardware doesn't support TBI or RTBI modes
(which is what the dwmac core uses for BASE-X) and what it's actually
offering is an up-clocked Cisco SGMII implementation.

With AN disabled, this is compatible with 2500BASE-X implementations
that do not require AN.

> Therefore, this check:
> 	if (readl(spcs->base + GMAC_AN_STATUS) & BMSR_ESTATEN) {
> 		__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> 			  spcs->pcs.supported_interfaces);
> 
> 		/* Only allow 2500Base-X if the SerDes has support. */
> 		ret = dwmac_serdes_validate(priv, PHY_INTERFACE_MODE_2500BASEX);
> 		if (ret == 0)
> 			__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> 				  spcs->pcs.supported_interfaces);
> 	}
> fails, and PHY_INTERFACE_MODE_2500BASEX never gets set in
> pcs.supported_interfaces. Pardon my naivete, but does the
> BMSR_ESTATEN bit not being set break some standard?

BMSR_ESTATEN means that the PHY supports register 15, MII_ESTATUS.
This register indicates, for 1G speeds, which medium (BASE-T or BASE-X)
and duplexes are supported by the PHY.

Given that SGMII isn't an 802.3 standard, but an extension to BASE-X,
technically it should still, but given that these are not actually a
PHY, it's not a big problem.

However, what it does mean is that we could handle this differently.
We could remove the check here, and set 1000BASE-X and, if the SerDes
supports it, 2500BASE-X, but we would need
dwmac_integrated_pcs_inband_caps() to indicate that inband is not
supported in these unless ESTATEN is set.

> I also tried enabling comma detect during dwmac_integrated_pcs_config,
> but I am still seeing the Tx timeouts. I remember that when I had
> tested the patches in October (without the SerDes driver changes),
> the link state used to flap, but the data path became functional
> after the link stabilized.

I wonder whether the SerDes needs to be calibrated after the link has
come up and the clocks configured. phy_calibdate() will re-invoke the
programming of the SerDes, so you could try adding that at the bottom
of ethqos_configure_sgmii():

	return phy_calibrate(priv->plat->serdes);

which will do the calibration after the clocks have been set, and see
whether that stabilises the link.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

