Return-Path: <linux-arm-msm+bounces-89230-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id D2103D253A2
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 16:16:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id E6FDA3053819
	for <lists+linux-arm-msm@lfdr.de>; Thu, 15 Jan 2026 15:16:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 920903ACF1A;
	Thu, 15 Jan 2026 15:16:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="RrA0c2Cr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4419B3AE6ED;
	Thu, 15 Jan 2026 15:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768490177; cv=none; b=OAkG+fIabxnrPET/pn51ZtUkaMSNse6tPjvrSjjaR37BQaIp80hM6Z06h94pwJeJNOsD7GuZ/7uQBCApFsbgARnye8RBFZ37qYREoL6c94JEEE3K5rLjyDKVqxgnkEtBXI0c+6lfeJiRCG75VxP/B3aar2R2wHGKqiU8D8nw/MY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768490177; c=relaxed/simple;
	bh=kWYMgicb/wXnfn/i+0E5kPZESbgs/m1X/QORhgZCg4A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X5TVxdwvkLakLtviI/Mkfocdun0hM/vVhjGhMJd0l9iYTAfrFVh1a4XPPjKFc8YOISO2LN/nS1YVYGRGt1g/FIPKdXKoRwZ+SthZEuMNd0CS9aEUUzsy2ECCBIrCMB6kTB6jwmK58+KqSXe6FkQE+HfPXFDws4dXBWdwkOud2qE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=RrA0c2Cr; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QOLovP1nf5K8/XFRLq/JOQI95IJezXEIyYwgpMIfHxg=; b=RrA0c2Crm8jwm+G3tWPYeyiqT7
	zErC1h99cNML2NBK9REG2mW04hcq38xBMii0CtX5baQwyTf8qSB+aKaO+QM16CHsyH9H/x2aTuxXM
	ILfkpky1HEd40uBy+7wNq7YihR+5WgT3rnxPGL3ikENUP57iAluJPkWrrF+YrdYlpNbGPFz8tsnbm
	m2rGB7I1S1E8qmyGtbzKZZuc1Ow0GJno4sJnG6IV9aMMxUZzPXN+MAEceecT5UJxepEK9pPRiWEUf
	nTa3+MGFhxPa6YurSLP0sHO2oC5Q9T0m8M4LzafOZ69dGyIIToW9uQSqyf8XcRUdBk9k0K86Gmyfl
	UaBs1WYw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:59658)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1vgP4Z-000000001PW-0scZ;
	Thu, 15 Jan 2026 15:15:43 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1vgP4U-000000002kl-1vG7;
	Thu, 15 Jan 2026 15:15:38 +0000
Date: Thu, 15 Jan 2026 15:15:38 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
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
	Mohd Ayaan Anwar <mohd.anwar@oss.qualcomm.com>,
	Neil Armstrong <neil.armstrong@linaro.org>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>
Subject: Re: [PATCH net-next 05/14] net: stmmac: add stmmac core serdes
 support
Message-ID: <aWkEmockEyLsZKMd@shell.armlinux.org.uk>
References: <aWfWDsCoBc3YRKKo@shell.armlinux.org.uk>
 <E1vg4w2-00000003SG5-2FH5@rmk-PC.armlinux.org.uk>
 <a91a0937-93cd-40f2-9759-8823fb08f48c@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a91a0937-93cd-40f2-9759-8823fb08f48c@bootlin.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Thu, Jan 15, 2026 at 03:48:40PM +0100, Maxime Chevallier wrote:
> Hi Russell,
> 
> On 14/01/2026 18:45, Russell King (Oracle) wrote:
> > Rather than having platform glue implement SerDes PHY support, add it
> > to the core driver, specifically to the stmmac integrated PCS driver
> > as the SerDes is connected to the integrated PCS.
> > 
> > Platforms using external PCS can also populate plat->serdes, and the
> > core driver will call phy_init() and phy_exit() when the administrative
> > state of the interface changes, but the other phy methods will not be
> > called.
> > 
> > Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> 
> Unfortunately I have no way to test. But still,

I am hoping Mohd Ayaan Anwar will be able to do at least some testing
on the qcom-ethqos hardware.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

