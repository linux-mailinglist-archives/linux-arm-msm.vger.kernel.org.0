Return-Path: <linux-arm-msm+bounces-24678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A5A8F91C71B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 22:12:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 431B7B23E2A
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 20:12:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB05770FE;
	Fri, 28 Jun 2024 20:12:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="NqeVhFAJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523007641D;
	Fri, 28 Jun 2024 20:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719605559; cv=none; b=q6apRJHL9/ch4kkTgAoSNe/HXQUbL703huIRLTJuL42/01ZeLuOWytnl8QBi/iLTekpHFPKl28TQzuP78MJk8u8NRPTXBTSdnp5viMQg2TazHMQssnIEmGSBK9ipLIpvNl6KYigpK40rCfragpRNIhJ7mdVQmcAQiiPeB4dHf9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719605559; c=relaxed/simple;
	bh=Rp+/D3qNuwmKtttpXrBrTXYC4brC5rHdW95hqddf/FI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ih4ASq/K9EwKhA2xMoe15Q1OKP2MxZP5LJLhm8kseJk8AzRUhjeHXnM7tAqbbrrJLoQHsZu5Rth2OgRX6X6OhLAqxD1UDFd/lV51RfFn9blIYq+eSUtLQ+/SM3JRgD+LWMRfnDP9fsr92M/IDGdhjh9ykB7lMVUKFnWgD56wLSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=NqeVhFAJ; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8dDLlhV3WAfC2faU1YAAVK/Qyn/a7E+Xsj6NmTYqY6w=; b=NqeVhFAJXwxyKuHxd2HxVoKJP0
	7au9ZWJ6FrxM/nsqeodnE4py9hZ7NmCXc3ttmqWN1EK337AV1jhY1nI24+1gvSoeE2IcWAm8Vo7d0
	jcBhoQHsIW8sRqgRE1fjqQERNq4rXNZ6giT80diXg2Lr6hPrbTccNEMB9RBk2IsOGCog=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sNHwy-001JqU-EI; Fri, 28 Jun 2024 22:12:04 +0200
Date: Fri, 28 Jun 2024 22:12:04 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Sagar Cheluvegowda <quic_scheluve@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
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
Message-ID: <483b77c7-e90f-42e1-a8b8-372845d8de62@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <da62cf15-0329-40e5-83f3-16c4b60f7b46@kernel.org>
 <0666cba0-a5bb-44bf-845a-6a1c689cb485@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0666cba0-a5bb-44bf-845a-6a1c689cb485@quicinc.com>

> >> @@ -642,6 +642,18 @@ stmmac_probe_config_dt(struct platform_device *pdev, u8 *mac)
> >>  		dev_dbg(&pdev->dev, "PTP rate %d\n", plat->clk_ptp_rate);
> >>  	}
> >>  
> >> +	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
> >> +	if (IS_ERR(plat->axi_icc_path)) {
> >> +		ret = (void *)plat->axi_icc_path;
> >> +		goto error_hw_init;
> > 
> > This sounds like an ABI break. Considering the interconnects are not
> > required by the binding, are you sure this behaves correctly without
> > interconnects in DTS?
> >
> > Best regards,
> > Krzysztof
> > 
> Yes, i did check without the interconnect entries in the dtsi and
> things are working fine, devm_of_icc_get is properly clearing out
> all the references in the case when "interconnects" are not present
> in the dtsi.

So the relevant code is:

https://elixir.bootlin.com/linux/latest/source/drivers/interconnect/core.c#L566

	/*
	 * When the consumer DT node do not have "interconnects" property
	 * return a NULL path to skip setting constraints.
	 */
	if (!of_property_present(np, "interconnects"))
		return NULL;

The naming of of_icc_get() and devm_of_icc_get() is not
great. Typically this behaviour of not giving an error if it is
missing would mean the functions would be of_icc_get_optional() and
devm_of_icc_get_optional(), e.g. we have clk_get_optional(),
gpiod_get_optional(), regulator_get_optional(), etc.

	Andrew

