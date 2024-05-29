Return-Path: <linux-arm-msm+bounces-20941-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4CC8D3930
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 16:29:22 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8679328894A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 14:29:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B40221581FB;
	Wed, 29 May 2024 14:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="h7e/Hk65"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 990791386C6;
	Wed, 29 May 2024 14:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716992932; cv=none; b=uAN+guZvqJLfXgRH5MTsklZWRczV+6N+qf7lqyc/aDJ678jvCyMkfh/xbP0e5ZkUcDNUA8mhp1tHYeZqfmw1FEoWncU+NezX5ANaqAYgpRcyny2QRzGohjllYDqi2HfSVJPoXBosuOG1P/QtjlOv1YJpm5Pli/OW0lJj2ptS+2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716992932; c=relaxed/simple;
	bh=94w/1FYOY49gVJVMW1Je3xGavCevd8pni3hcKGMgcU8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FZyVyTn9a9OtPAMUcEGDY41gshTjBea8brYdL+DOP3c8i7oh9QpPMSxzU3RqO2PSezdkM8TnCpZvoa3CEeHfVv1Y77w5RYprnR24Gp1Ci0JU+IFfcbKm5M8qT80tiHOkJeVsJXIhE6GjP1bo4sXIlU1XgsCCAdrimp8phXX1Mew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=h7e/Hk65; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=A0djHwkTm9IMDtUZ9E1EkFk0NBl4OKR695dw9cvK5k4=; b=h7e/Hk65uFLg0eujXc54qb2QCT
	en2K+w/W6N1KiOMFBDKWSbFfUcPW4RG9rhZjrfQui7wQzESKkGovHrfP58wSF5/MPeKBeyHGKsy5F
	pj3+VNpkPfETsP5kxq2X/i+DQ2JXSCTvL73CAgo9Sa1qyixhXRNdRw6p4F6wvdOrLSbE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCKHo-00GGQZ-Fq; Wed, 29 May 2024 16:28:16 +0200
Date: Wed, 29 May 2024 16:28:16 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sneh Shah <quic_snehshah@quicinc.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>,
	Andrew Halaney <ahalaney@redhat.com>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <67553944-5d3f-4641-a719-da84554c0a9f@lunn.ch>
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

> Qualcomm ethernet HW supports 2.5G speed in overclocked SGMII mode.
> we internally term it as OCSGMII.

So it still does SGMII inband signalling? Not 2500BaseX signalling? It
is not actually compatible with 2500BaseX?

> End goal of these patches is to enable SGMII with 2.5G speed support.
> The patch in these series enabled up SGMII with 2.5 for cases where we
> don't have external phy. ( mac-to-mac connectivity)

So the other end needs to be an over clocked SGMII MAC, not 2500BaseX?

> The new patch posted extends this for the case when the MAC has an
> external phy connected. ( hence we are advertising fr 2.5G speed by adding
> 2500BASEX as supported interface in phylink)

And i assume it does not actually work against a true 2500BaseX
device, because it is doing SGMII inband signalling?
 
Hence Russell frustration with the whole 2.5G mess....

      Andrew

