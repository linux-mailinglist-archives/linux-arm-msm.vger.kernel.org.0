Return-Path: <linux-arm-msm+bounces-24692-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64A9091C90D
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jun 2024 00:24:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 125331F228BA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 22:24:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DC23F80C09;
	Fri, 28 Jun 2024 22:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="yWvSbaoC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D904B7580C;
	Fri, 28 Jun 2024 22:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719613452; cv=none; b=es+h/iA8h8Ucg5LkWFS3wRx86/SCMO1OZdCO8Idatduy4pWdG5mj3Kmq0CbPG7ewlBYiAtoKr0PG77MOSUOcUAUPEzUQIZz3tKRPfss983cRdbq6hgYnvz8kyGK7f6uEPXXgcjv3t6ukixIS3tdlEK7dSZKXQFuuf7WqK5vh8/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719613452; c=relaxed/simple;
	bh=LxprLtuNhdIezmq2Q7VPV5xKJ5SjRmjqMpn1NcBKzE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KqF6kuYmNyrAiHz4sFwQyvooTOBXvG9CzLWSux0mqLlhLS07Bi3j6FEh5WETj9nqWixb0ZVj8felsCN0KbkWEEh9aO62Itt/AbDMTN0D6FoC4Nmjz1CWOKpXxx9YkxuYONL0P0dq2Dcn6xNdGPEZ7THQGofKADjR+ewC0aUm8Us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=yWvSbaoC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=ddG/6CRq4Slp1JOPczsDbpO5bsFIh7ehTxG5v9raX4M=; b=yWvSbaoChQ+wZvT+xaChOW+T1S
	W0oVqwmNHigXM3cZB5kYaBeDQEDtCcSsbzjgf5rUFcdS9r8XAuV0QYKbFUaj0KHFWQIKj8j6rgx8Z
	fPJlqgEtAUWDIavtbQaohFBwsiSeTH0iBgB0fJNbFPTTDKJ/FCoGdDM1qQcmlCX1G6iA=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sNK0R-001KXz-8J; Sat, 29 Jun 2024 00:23:47 +0200
Date: Sat, 29 Jun 2024 00:23:47 +0200
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
Message-ID: <b6f1c7c1-9fd6-43fe-b7b0-5d4a5fc532d6@lunn.ch>
References: <20240625-icc_bw_voting_from_ethqos-v2-0-eaa7cf9060f0@quicinc.com>
 <20240625-icc_bw_voting_from_ethqos-v2-2-eaa7cf9060f0@quicinc.com>
 <4123b96c-ae1e-4fdd-aab2-70478031c59a@lunn.ch>
 <81e97c36-e244-4e94-b752-b06334a06db0@quicinc.com>
 <974114ca-98ed-44a7-a038-eb3f71bd03ef@lunn.ch>
 <22edcb67-9c25-4d16-ab5c-7522c710b1e2@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22edcb67-9c25-4d16-ab5c-7522c710b1e2@quicinc.com>

> > Sorry, PTR_ERR().
> > 
> > In general, a cast to a void * is a red flag and will get looked
> > at. It is generally wrong. So you might want to fixup where ever you
> > copied this from.
> > 
> > 	Andrew

> the return type of stmmac_probe_config_dt is a pointer of type plat_stmmacenet_data,
> as PTR_ERR would give long integer value i don't think it would be ideal to
> return an integer value here, if casting plat->axi_icc_path to a void * doesn't look
> good, let me if the below solution is better or not?

>  	plat->axi_icc_path = devm_of_icc_get(&pdev->dev, "axi");
> 	if (IS_ERR(plat->axi_icc_path)) {
> 		rc = PTR_ERR(plat->axi_icc_path);
> 		ret = ERR_PTR(rc);

Don't you think this looks ugly?

If it looks ugly, it is probably wrong. You cannot be the first person
to find the return type of an error is wrong. So a quick bit of
searching found ERR_CAST().

	Andrew

