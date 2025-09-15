Return-Path: <linux-arm-msm+bounces-73570-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B2BB579FB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 14:09:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E39753A3221
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 12:09:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA00530103C;
	Mon, 15 Sep 2025 12:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="fdyrpWby"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DD82F28EF;
	Mon, 15 Sep 2025 12:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757938189; cv=none; b=sAbaJ0AlTdcn1o+MMLdCU7Sk+mkUx1IfKz/jl5IUyVZKIPm65+ttnZvweNtAYx55vskddbtOTsKfdo3DS4eJzX2MXThLlmcnMHtBtPQVzqRS+zDktVRn/+hGovDlSPsrBk4yV3+wUynooZygfjVEMFvTYZcTORz6thrSgBQnvOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757938189; c=relaxed/simple;
	bh=w9cP/mxteHSkQpcvg/llVtP2xmXmvp4gRw9fqCiwpFM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m3SFa/m5R4VW7KPeCzd5WwTCR0xWxJO0Xat7iti3JBXy/ZmfA0pZXhOt6AWhJPVeFYrNPDzOzh/UT6Q3UgoN8tr/Gf9a5C1gsPZAjJphquNEowZTKkQNDce8v0T7BKyCpmgecOCBXVaeKrNAwsdvi6O6+OGxixvOmw99TfusoQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=fdyrpWby; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=RMekNsuJ+Ex1pcpZhcTXdoRN9+JBJVQzJ/Rpv2WzC+Y=; b=fdyrpWbyPzCIQhG5sCgGatM25m
	WlgECQkANzz2d476t3yvz4big790VTw0O4RcOPP4g0uAc91Synr6JFsRaHeDvjmRPxUUntipAFI+l
	3Jhe9Y6fnERubnsdUiHRce6b/aCCDILLTH+ShPGxOgwRebhSgqVU07RT2T1eSDOzrfzDrFHcD9Ej6
	qlhL1/P/YzyIy5BlcxdQNmk2mzjIhTmvgYM5JcDWG4Up8rkI9auF6mx9p78NprdYJKANOGy/QBM0G
	XrUP7Ts1aofdNs76Fxlhr7xJPd9CEU+Ql1sfqBMBzBBeBtplLddnf9fFScMVzO4gQMeazeWahwD4B
	QCSaO+Hw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:60618)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uy81d-000000008TL-1OaU;
	Mon, 15 Sep 2025 13:09:41 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uy81b-000000006dx-0mFi;
	Mon, 15 Sep 2025 13:09:39 +0100
Date: Mon, 15 Sep 2025 13:09:39 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>
Cc: andrew@lunn.ch, Heiner Kallweit <hkallweit1@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next] net: phy: qcom: qca808x: Add .get_rate_matching
 support
Message-ID: <aMgCA13MhTnG80_V@shell.armlinux.org.uk>
References: <20250914-qca808x_rate_match-v1-1-0f9e6a331c3b@oss.qualcomm.com>
 <aMcFHGa1zNFyFUeh@shell.armlinux.org.uk>
 <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMfUiBe9gdEAuySZ@oss.qualcomm.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Sep 15, 2025 at 02:25:36PM +0530, Mohd Ayaan Anwar wrote:
> [    7.937871] qcom-ethqos 23040000.ethernet: IRQ eth_wake_irq not found
> [    7.944581] qcom-ethqos 23040000.ethernet: IRQ eth_lpi not found
> [    7.953753] qcom-ethqos 23040000.ethernet: User ID: 0x20, Synopsys ID: 0x52
> [    7.960927] qcom-ethqos 23040000.ethernet:   DWMAC4/5

So we're using stmmac as the MAC.

> [    8.348697] qcom-ethqos 23040000.ethernet eth0: PHY stmmac-0:1c uses interfaces 4,23, validating 23
> [    8.358304] qcom-ethqos 23040000.ethernet eth0:  interface 23 (2500base-x) rate match none supports 6,13-14,47

This shows that the PHY supports SGMII (4) and 2500base-X (23). However,
as we only validate 2500base-X, this suggests stmmac doesn't support
switching between SGMII and 2500base-X.

> // I changed the link partner speed to 1G here:
> [   74.031182] qcom-ethqos 23040000.ethernet eth0: phy link down 2500base-x/Unknown/Unknown/none/off/nolpi
> [   74.031773] qcom-ethqos 23040000.ethernet eth0: Link is Down

As the PHY will be programmed to only advertise 2500base-T, this is
expected.

> For reference, this board is using the same MAC as [0] which works
> perfectly fine with the AQR115C PHY. I got the (wrong) idea to add
> .get_rate_matching after comparing the two PHY drivers. The MAC driver
> is stmmac/dwmac-qcom-ethqos.c

AQR115C can be configured to support rate matching.

What *exactly* is the setup with stmmac here? Do you have an external
PCS to support 2500base-X, or are you using the stmmac internal PCS?

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

