Return-Path: <linux-arm-msm+bounces-24396-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F247919B9D
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 02:13:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3D58F2854BA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jun 2024 00:13:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1E4F360;
	Thu, 27 Jun 2024 00:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="XZtqf9Ku"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBE36A2D;
	Thu, 27 Jun 2024 00:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719447200; cv=none; b=Mpr87IzSIrOL6WA9mEvVUr0ECdxOf6UlZ4a8M4wnnQe0Kyz2ZmJJ3VsM5kg2VdkKmhyo/80jm7Djvh3LRwlHu2Ie2q2w60fQCE7Pt0pWpwcfZoNgPZ6rUsf6Jl+3AKIqZw+z4xco66lVEPfV9/AHaMc2UZZOnSI+8+v5PM7TFPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719447200; c=relaxed/simple;
	bh=FsEmZL7mq/PHCSkhTNbOJqlrMaH7nibO5ZGG4gPoXAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fS/AbGOlrA2MAe/s1HyivSBZ51BXlfft1KiB6yb4U9zapDefyrrIrgaaHGiHaFbJME9cJSoHMg1Lg61vPYbSV88keD5WNY9LEkYN0D2A4syTTnQR5mKJsbF/1uTh76343OJtU48MWsItgIrtVT+nEkrrQs9rwRLMrXcHprcB1gY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=XZtqf9Ku; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=Y/oie4D7vMLSlRHkXYeX6gGQHuuqioTWp0KRoGukRbU=; b=XZ
	tqf9Kuz/yKkf10DqErr96j4qpNaXrG6wfrswfQTKClOJWAOlEk+QMrUF8m1SvxvkatiHXALRcL0BZ
	kPpvFe2dVK9sQswQ7K5ZossXeTx3U4ZaEYyMdru5FmZ5IWL6ENyIAS41oDK9ma92CDFn3Y3WtNYhG
	KAEhQ/ya3+VOXFE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sMckv-0015iQ-V6; Thu, 27 Jun 2024 02:12:53 +0200
Date: Thu, 27 Jun 2024 02:12:53 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Russell King <linux@armlinux.org.uk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bhupesh Sharma <bhupesh.sharma@linaro.org>, kernel@quicinc.com,
	Andrew Halaney <ahalaney@redhat.com>, linux-arm-msm@vger.kernel.org,
	netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] net: stmmac: Add interconnect support
Message-ID: <974114ca-98ed-44a7-a038-eb3f71bd03ef@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
 <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>

On Wed, Jun 26, 2024 at 04:36:06PM -0700, Sagar Cheluvegowda wrote:
> 
> 
> On 6/26/2024 6:07 AM, Andrew Lunn wrote:
> >> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
> >> +	if (IS_ERR(plat->axi_icc_path)) {
> >> +		ret = (void *)plat->axi_icc_path;
> > 
> > Casting	to a void * seems odd. ERR_PTR()?
> > 
> > 	Andrew
> 
> The output of devm_of_icc_get is a pointer of type icc_path,
> i am getting below warning when i try to ERR_PTR instead of Void*
> as ERR_PTR will try to convert a long integer to a Void*.
> 
> "warning: passing argument 1 of ‘ERR_PTR’ makes integer from pointer without a cast"
> 

https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/crypto/qce/core.c#L224
https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/gpu/drm/msm/adreno/a3xx_gpu.c#L591
https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/gpu/drm/msm/adreno/a3xx_gpu.c#L597
https://elixir.bootlin.com/linux/v6.10-rc5/source/drivers/spi/spi-qup.c#L1052

Sorry, PTR_ERR().

In general, a cast to a void * is a red flag and will get looked
at. It is generally wrong. So you might want to fixup where ever you
copied this from.

	Andrew

