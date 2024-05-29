Return-Path: <linux-arm-msm+bounces-21008-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C389B8D3F5E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 22:09:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 7F601287FB6
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 20:09:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EC6471C233F;
	Wed, 29 May 2024 20:09:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b="UuJc4lM5"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [78.32.30.218])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB97418E06;
	Wed, 29 May 2024 20:09:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=78.32.30.218
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717013386; cv=none; b=pDTXtDE6UK89+AmAF8aooTXvMkVXbd439gvOyznBcuKQ+ZSnOAZIIQ084VS05KsDtIuRckgyIx5gTyEpYXZvUTw2bnujSeqNPABx9xesRd5tb2Fs1fTkAzuSJl3mMQXihbWzU5Xms+GtBKg+HMfZMj02jLeEwOpaEU4+AtPR9VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717013386; c=relaxed/simple;
	bh=VmTjocAj8CY1BjnBiFgQ0KHUqKpPYIGWoK1UGssEBmM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FpoHhinP4uX1E8uk4IAO+I5uh6uTXihqR59k67qmR+JXAust51nq5jVt+ML6LlwO5Xv20KWSU6DD6CAlCP+hW/PcCbpDEyacYAIxddDOMvH8DJJK5QDB72LnTiHj+9ZbIOj6jycqLGyXXu2oUbM7cvsEOTyMhKehM8jp9dXimno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk; spf=none smtp.mailfrom=armlinux.org.uk; dkim=pass (2048-bit key) header.d=armlinux.org.uk header.i=@armlinux.org.uk header.b=UuJc4lM5; arc=none smtp.client-ip=78.32.30.218
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=armlinux.org.uk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=armlinux.org.uk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=EfQ/Q2iVyXpG7SyzUHxYwMhwGinL//RTWhWN7EORZ8U=; b=UuJc4lM5bz5/HnE+yz/N6peyBE
	RbGvl89sUErh0CP4XxfiqiUCcQTU3gZ9Kx3efB73d+UdhiBVnqizINl+sOftuzZGuOf+uOrA3fvLA
	GsoOVe49GXYJCj1VpEQm0yAxpqpEbICHtMOpSRsUGU0fVTh87ZE/MN5KFg3va92gNQY9uiFyjezLS
	Gx6ENPcFw09Qdba9l68BL06+GT5eK2k3DiCGAmzUSUBwJ8psekOelpcLEYpF30JGQlgOsCvB6njKi
	CpZ6jqpElpgZ0pWVl6m9wDH6V39bA9Hnidhg0Qa5AlsPSQMkRHoaJ0jlIRym7sQduqx2zXyk9+05B
	vU1gGLLA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56960)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sCPbu-0006cJ-1q;
	Wed, 29 May 2024 21:09:22 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sCPbr-0004UG-KU; Wed, 29 May 2024 21:09:19 +0100
Date: Wed, 29 May 2024 21:09:19 +0100
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
Message-ID: <ZleLb+dtJ8Uspq4S@shell.armlinux.org.uk>
References: <20231218071118.21879-1-quic_snehshah@quicinc.com>
 <4zbf5fmijxnajk7kygcjrcusf6tdnuzsqqboh23nr6f3rb3c4g@qkfofhq7jmv6>
 <8b80ab09-8444-4c3d-83b0-c7dbf5e58658@quicinc.com>
 <wvzhz4fmtheculsiag4t2pn2kaggyle2mzhvawbs4m5isvqjto@lmaonvq3c3e7>
 <8f94489d-5f0e-4166-a14e-4959098a5c80@quicinc.com>
 <ZlNi11AsdDpKM6AM@shell.armlinux.org.uk>
 <d246bd64-18b3-4002-bc71-eccd67bbd61f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d246bd64-18b3-4002-bc71-eccd67bbd61f@quicinc.com>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>

On Wed, May 29, 2024 at 07:43:15PM +0530, Sneh Shah wrote:
> In this version of qualcomm ethernet, PCS is not an independent HW
> block. It is integrated to MAC block itself. It has very limited
> configuration.Here PCS doesn't have it's own link speed/duplex
> capabities. Hence we are bypassing all this PCS related functionalities.

I want to concentrate on this part first - we'll address the 2.5G
issues separately once I've got a picture of this hardware (and thus
can work out what needs to change in my phylink_pcs implementation to
support the standard Cisco SGMII speeds.

From what I understand you're saying, your integrated PCS is different
from the DesignWare integrated PCS?

Which core does it use? dwmac4_core.c or dwmac1000_core.c, or some
other? Not knowing which core makes asking the following questions
harder, since I'm having to double them up to cover both cores with
their different definitions.

Does it only present its status via the GMAC_PHYIF_CONTROL_STATUS or
GMAC_RGSMIIIS register?

From what you're saying:
- if using the dwmac1000 core, then for the registers at GMAC_PCS_BASE
  (0xc0 offset)...
- if using the dwmac4 core, then for registers at GMAC_PCS_BASE
  (0xe0 offset)...
... is it true that only the GMAC_AN_CTRL() register is implemented
and none of the other registers listed in stmmac_pcs.h?

In terms of interrupts when the link status changes, how do they
present? Are they through the GMAC_INT_RGSMIIS interrupt only?
What about GMAC_INT_PCS_LINK or GMAC_INT_PCS_ANE? Or in the case
of the other core, is it through the PCS_RGSMIIIS_IRQ interrupt
only? Similarly, what about PCS_LINK_IRQ or PCS_ANE_IRQ?

Thanks.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

