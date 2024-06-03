Return-Path: <linux-arm-msm+bounces-21484-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D28D8397
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 15:13:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 6319EB235F3
	for <lists+linux-arm-msm@lfdr.de>; Mon,  3 Jun 2024 13:13:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4952412C81D;
	Mon,  3 Jun 2024 13:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="VZLilN10"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DAFB12C552;
	Mon,  3 Jun 2024 13:12:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717420372; cv=none; b=DwbnyEHn/Si7puYphvs8oPPwM+awhH/wxGSMThbSp2vXtLZcrEsVddVjs5q7h5Rt0Pb3C6+Jj5W9HBG/a/3aC8AGxzgg5TERoCAiy6Bb/kvsJaY3EdwRh1wHqpOOvJIsZo6lbmdJUr0KedDcDIU8dha8BWFmI1oCkqpxoaLlRR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717420372; c=relaxed/simple;
	bh=TPJLmt3ZrmFBEWUtmDZxOS+cU6lfWa/vurifkDD3zBI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFBmvdX51xd8vxrkSQlDLf6q1XLc8Koux5sqSnmnCNYWxCtQBLSt9RIbmdn2FQ+M5ajphieyQw/Y6OJBEEbK1E0kSRVNY0Fw3J3M/DgJA0zbt7ponLlQoPnqmkFLZ0JGwoRviSe3M5kKtv0sf/Hgfo2ITlgx5di23CJEQcI9OVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=VZLilN10; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=WhhGfCPkfrQU2JoEdJcZxodwFT3ecp3HOxHwD/uFSGM=; b=VZLilN100eULAlRILI4fDmUatt
	gnST2qjGNUghl9VUfc4/1jsip4W5IzU9dCyX3LAAsluelL06MIRia+4e7YBlpd98Ogv4pNbtG3MR4
	9mLtW6KfVjHiWinSCQy9pCX7/BXCGapxkz8LjNzvFjGozog+VQmfhcTXZt963k5zKwEDITkmY3MFn
	4EWCWHSvIMMIiWNZA+C7JCH3uUI4aWGJqaDu6GGREJiAyxr3HAS6Wo2V9Hf2ojr3sfRLuxVs1nJca
	o/bWHkl3Khb3amJCxKRAAJ8DfJGQWsqtwxIkUsGv7ANoEPOBaudTyqV+u6FjZopVfl8caM3+RtnEz
	ImLgMosw==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:36062)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sE7UE-0002lD-0z;
	Mon, 03 Jun 2024 14:12:30 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sE7UC-0000Sh-Sn; Mon, 03 Jun 2024 14:12:28 +0100
Date: Mon, 3 Jun 2024 14:12:28 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel@quicinc.com
Subject: Re: [PATCH net-next] net: stmmac: dwmac-qcom-ethqos: Add support for
 2.5G SGMII
Message-ID: <Zl3BPHqREyZ5v92U@shell.armlinux.org.uk>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
 <d246bd64-18b3-4002-bc71-eccd67bbd61f@quicinc.com>
 <ZleLb+dtJ8Uspq4S@shell.armlinux.org.uk>
 <0ef00c92-b88f-48df-b9ba-2973c62285af@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0ef00c92-b88f-48df-b9ba-2973c62285af@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Mon, Jun 03, 2024 at 04:57:15PM +0530, Sneh Shah wrote:
> On 5/30/2024 1:39 AM, Russell King (Oracle) wrote:
> > From what you're saying:
> > - if using the dwmac1000 core, then for the registers at GMAC_PCS_BASE
> >   (0xc0 offset)...
> > - if using the dwmac4 core, then for registers at GMAC_PCS_BASE
> >   (0xe0 offset)...
> > ... is it true that only the GMAC_AN_CTRL() register is implemented
> > and none of the other registers listed in stmmac_pcs.h?
> > 
> > In terms of interrupts when the link status changes, how do they
> > present? Are they through the GMAC_INT_RGSMIIS interrupt only?
> > What about GMAC_INT_PCS_LINK or GMAC_INT_PCS_ANE? Or in the case
> > of the other core, is it through the PCS_RGSMIIIS_IRQ interrupt
> > only? Similarly, what about PCS_LINK_IRQ or PCS_ANE_IRQ?
> 
> we only have GMAC_AN_CTRL and GMAC_AN_STATUS register.
> There is no separate IRQ line for PCS link or autoneg. 
> It is notified via MAC interrupt line only.

From the sound of it, this is just the standard PCS that everyone else
would use in DW ETHQoS, with the exception that you can run it at 2.5G
without inband signalling.

Thanks for clarifying that. I think we can just use the phylink PCS
that I'm proposing for your case, with the exception of also adding
support for 2.5G speeds, which I will need to sort out.

So, I think I need to get my patch set that query the inband
capabilities of the PCS and PHY into net-next before we can move
forward with 2.5G speeds here.

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

