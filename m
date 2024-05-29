Return-Path: <linux-arm-msm+bounces-21018-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5068D4154
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 00:23:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B840EB22F83
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 22:23:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 468D3169AC6;
	Wed, 29 May 2024 22:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="nBaWoMTj"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BB2715B0E6;
	Wed, 29 May 2024 22:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717021408; cv=none; b=RKKICdARQmRIBzA7+JbJx/vIfRKndqk0VVyCI1dZIIr6BMaM1QBGBzlpa/MsIjE0FrcqxYQCfGPWVuSKbatAXhdScaYGxbF6tzcLoBcf0OMyRqalddSMHVvhCUkdNQI3hdVW+/B7oWcQJAONK8H+1Xo9xuJeR7Wrb06AfV3h38o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717021408; c=relaxed/simple;
	bh=V8eObEZdfPBp2fQlZCqgdA6tT/maetDJtpCs2yEdx+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ngow0Of2ZhBnqmo4usSy25dZ9CNCuh9lQS+Hq42Rjs3iksAKffV8e0MQtKpNX+touqQ7fkdOPHaDpdP3deZUckj1ObNmJqcaMRFe+wYsrd+tz32QndeMsFkX/aPH3JUB3OtCfRB9QF47odpDXdFzPIQgB+hVGqhggWkqP9XI028=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=nBaWoMTj; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=uGvpQdBFGjqnF5UcddF90STvJk8sX0++vCBA18/qFiw=; b=nBaWoMTjeT2uOJX7wWCdsD6b5q
	0N9Yde366Xg60HoG8UEE0ULWGrtMNm1wVl+FW/I9m5fcT/tEHwLmQ4Kv5sH7g22QEfAw/J7B8ywp/
	MXjjsD5bqqNIkny4rfbSZfp6ymH+Q+C6jIOGcTc1hswAP2N8sVCye0AZL6aSxNXUABOk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCRh6-00GIUe-U8; Thu, 30 May 2024 00:22:52 +0200
Date: Thu, 30 May 2024 00:22:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Andrew Halaney <ahalaney@redhat.com>
Cc: Sagar Cheluvegowda <quic_scheluve@quicinc.com>,
	Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Jochen Henneberg <jh@henneberg-systemdesign.com>,
	linux-arm-msm@vger.kernel.org, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] net: stmmac: dwmac-qcom-ethqos: Configure host DMA width
Message-ID: <d8ad4e59-5725-4a7d-a2ad-ce5d92553525@lunn.ch>
References: <20240529-configure_ethernet_host_dma_width-v1-1-3f2707851adf@quicinc.com>
 <7w5bibuejmd5kg3ssozaql4urews26kpj57zvsaoq2pva3vrlo@agfxwq5i65pc>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7w5bibuejmd5kg3ssozaql4urews26kpj57zvsaoq2pva3vrlo@agfxwq5i65pc>

On Wed, May 29, 2024 at 03:50:28PM -0500, Andrew Halaney wrote:
> $Subject should be have [PATCH net] since this targets the net tree:
> 
> https://docs.kernel.org/process/maintainer-netdev.html
> 
> On Wed, May 29, 2024 at 11:39:04AM GMT, Sagar Cheluvegowda wrote:
> > Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA address width")
> > Signed-off-by: Sagar Cheluvegowda <quic_scheluve@quicinc.com>

> Also, I think the Fixes: here would be for adding support for this SoC
> in the driver, not what's listed? Might make more sense after you have a
> proper body though.

This is a tricky one. 

Fixes: 070246e4674b ("net: stmmac: Fix for mismatched host/device DMA
address width") is when support for different DMA address widths was
added. This fix cannot easily be back ported past that.

070246e4674b first appears in v6.3-rc4.

dwmac-qcom-ethqos.c first appears in v5.1-rc1. However, Qualcomm did
not start hacking on it until v6.7-rc6. It is unclear to me without a
deep dive when Qualcomm actually started using this driver.

We might actually be looking at this the wrong way, and should in fact
be looking at when a DT patch was added that made use of the driver,
not the driver itself. If it was not used, it cannot be broken....

	Andrew

