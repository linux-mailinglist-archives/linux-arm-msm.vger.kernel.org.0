Return-Path: <linux-arm-msm+bounces-100794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GOSWJplqymnG8gUAu9opvQ
	(envelope-from <linux-arm-msm+bounces-100794-lists+linux-arm-msm=lfdr.de@vger.kernel.org>)
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:20:41 +0200
X-Original-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 3EF2C35AEFE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 14:20:41 +0200 (CEST)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id A66BC300DF44
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Mar 2026 12:20:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46D9D3CA4A4;
	Mon, 30 Mar 2026 12:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="wPM54DK0"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940F33C9ED5;
	Mon, 30 Mar 2026 12:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774873237; cv=none; b=j9yHXk+Z6r4YPAuQolKM1AQ5tojDrbOaGNa1oFsTMezspO+RIsTrN5wIbeOUCZPmnaBBqBPvI1AXEhASoON9iTyMPQF859yu8SZCwQxWqel9QlfgLUPDQdfk10eDWRtkqMzdZvEz80B54l9z4q3llyrySmLnQOvWixZlpjJ4mrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774873237; c=relaxed/simple;
	bh=n39tc+fj8bYN5UpqLdes32ezJr0VjG8m0tZdwcG2c7s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ronA1qJdMQsA1aFJWzdCLZQkjtYsn+RBOwtgDazhlOBNSMC1YFyKpHmlHWy1ElPp5otLG44YmenzKbi69Li5tFvP6ckghcvHKq4fvTXCqBA34VtpztJ2HnRdDYJDrk5uyIJK6ql+IHtkS8hMHbOdX3jVC1zXCG9+NXG8jsehu5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=wPM54DK0; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=veBAT8N9PXJSRI8kHRpQ29JL9EyN/jr+PWryhqRzBmk=; b=wPM54DK01Q8N254E8px4APBfKH
	UIeqvvYFYUsrpjSXOvsemWOhETVj9D7LVVWZ4Ce1H8ZKqgyUwC9DDugUIAfjC3yXNUOAng3YrAIju
	1MfcTshv5NYdJ2Qu8XwgPmFt5LMmZYlNtNtJ+l4Sjr9x6U1HQILzrZnP8PIeetsO5hGUjb7vSnD7x
	oOsSxFtJacRtDdOXXqmpNp93fFKC71HVZV791Zda3UFp9nhYBegRjRWvAjv14/cbVa9AFdgQvmydL
	XKOgRJKGfski3b9FnylZKtYwC71nejuyTMqwTOHCn9QTTz+wfif1lNo1cUhveN1ublyANzSwl6bfy
	2o2ypw7g==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38442)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1w7BbS-000000000ST-11Bh;
	Mon, 30 Mar 2026 13:20:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1w7BbO-000000002fP-0eU8;
	Mon, 30 Mar 2026 13:20:18 +0100
Date: Mon, 30 Mar 2026 13:20:18 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH RFC net-next] net: stmmac: qcom-ethqos: set clk_csr
Message-ID: <acpqgpCsbo3lJs3l@shell.armlinux.org.uk>
References: <E1w6AZm-0000000E54W-1F6E@rmk-PC.armlinux.org.uk>
 <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9d0a529a-d065-4f46-a93b-23195a4f9727@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
X-Spamd-Result: default: False [1.14 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	R_DKIM_REJECT(1.00)[armlinux.org.uk:s=pandora-2019];
	R_SPF_ALLOW(-0.20)[+ip4:172.232.135.74:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[armlinux.org.uk : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-100794-lists,linux-arm-msm=lfdr.de];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[armlinux.org.uk:-];
	RCPT_COUNT_TWELVE(0.00)[13];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.232.128.0/19, country:SG];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[linux@armlinux.org.uk,linux-arm-msm@vger.kernel.org];
	PRECEDENCE_BULK(0.00)[];
	MISSING_XM_UA(0.00)[];
	NEURAL_HAM(-0.00)[-0.752];
	TAGGED_RCPT(0.00)[linux-arm-msm,netdev];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[armlinux.org.uk:url,shell.armlinux.org.uk:mid,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 3EF2C35AEFE
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Mon, Mar 30, 2026 at 01:18:56PM +0200, Konrad Dybcio wrote:
> On 3/27/26 6:02 PM, Russell King (Oracle) wrote:
> > The clocks for qcom-ethqos return a rate of zero as firmware manages
> > their rate. According to hardware documentation, the clock which is
> > fed to the slave AHB interface can crange between 50 and 100MHz.
> 
> FWIW this __may__ possibly differ between platforms, but I'm not sure
> to what degree. Will there be visible impact if we e.g. have a 200 or
> 300 MHz clock somewhere?

When you add other platforms, you're going to have to deal with their
differences.

IEEE 802.3 states that the maximum clock rate for the MDIO bus is
2.5MHz. You need to ensure that is the case.

Current qcom-ethqos code doesn't set clk_csr, and returns zero for
clk_get_rate() on the stmmac clocks because they are managed entirely
in firmware.

This leads to the GMII_Address register field CR "CSR Clock Range"
being programmed with a value of 15, which, according to some
documentation, states that the clock divisor is CSR clock / 18.

With the /18 divisor (assuming your dwmac uses that divisor):

CSR clock	MDIO MDC clock rate
50MHz		2.78MHz (exceeds IEEE 802.3 maximum)
100MHz		5.56MHz (exceeds IEEE 802.3 maximum)
200MHz		11.1MHz (exceeds IEEE 802.3 maximum)
300MHz		16.7MHz (exceeds IEEE 802.3 maximum)

Do you think this is acceptable, or do you think this should be
fixed before anything else happens with the driver?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

