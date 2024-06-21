Return-Path: <linux-arm-msm+bounces-23641-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C60F6912E38
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 22:02:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7A8441F24D24
	for <lists+linux-arm-msm@lfdr.de>; Fri, 21 Jun 2024 20:02:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54D4A16C857;
	Fri, 21 Jun 2024 20:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="cCHqmixM"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ABF612BE9E;
	Fri, 21 Jun 2024 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719000135; cv=none; b=CDu67GMwuS2kxlbPimonz8Jew4KefSbHb7v//QO3bJ3j26wnyN3JRSy2XIja2lEanj88+KF9hvVj6QMF1fgPa5V7wDIUNq5xJ/eT6nLWzvPQNmRMwRIBbnJmwWKU6wW11RuYILLO76dzQODm5pbZ6k0G+FKN2XLxIoTYDhDeprg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719000135; c=relaxed/simple;
	bh=Xt/toiP6N6asKpHif/mH1NLQU7AmC74j3JURpixHmuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U0fzXC0Z8GscaTftwwqU3yjW6YwjIAK0kGXz9M552l8wJ+kIn/zLlVYcreDCmdZqz7Doh+fuQ+LEKemDJ16e0DmES/LF12rJVlMdZMFta8i5vjYqKkKtDehQUd/JuHaZRQjuYhjRU5z65bDMamNBcZfoicncCxdoHD/IXXsG9EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=cCHqmixM; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=+4uY3EQUbz0DrVfaPCZ2jsnH9YO74ydeFMqnW6Tj1Qs=; b=cCHqmixMNx4mQ7o42wyenotfxy
	c9qb686CtVOYMbo/OVFYYDOrwJvABI5XTPxGcgzjGxPU6/LlCloNzMZY15Wrve0IFPJIUj+G+P+FY
	pmFH8HDn0UIA0tb4uR+lQr3tmffQwCKdeGfQVwc3w4rNk8RWnGKPuij8cyqhqstS+owE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sKkS3-000hIR-QR; Fri, 21 Jun 2024 22:01:39 +0200
Date: Fri, 21 Jun 2024 22:01:39 +0200
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
Subject: Re: [PATCH 1/3] net: stmmac: Add interconnect support in qcom-ethqos
 driver
Message-ID: <b5096113-de85-485e-a226-a8112b3d5490@lunn.ch>
References: <20240619-icc_bw_voting_from_ethqos-v1-0-6112948b825e@quicinc.com>
 <20240619-icc_bw_voting_from_ethqos-v1-1-6112948b825e@quicinc.com>
 <159700cc-f46c-4f70-82aa-972ba6e904ca@lunn.ch>
 <b075e5a8-ca75-49cc-84d6-84e28bc38eee@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b075e5a8-ca75-49cc-84d6-84e28bc38eee@quicinc.com>

> > This all looks pretty generic. Any reason why this is just in the
> > Qualcomm device, and not at a higher level so it could be used for all
> > stmmac devices if the needed properties are found in DT?
> > 
> >        Andrew
> ICC is a software framework to access the NOC bus topology of the
> system, all though "axi" and "ahb" buses seem generic but the 
> topologies of these NOC's are specific to the vendors of synopsys chipset hence
> this framework might not be applicable to all the vendors of stmmac driver.

There are however a number of SoCs using synopsys IP. Am i right in
says they could all make use of this? Do we really want them to one by
one copy/paste what you have here to other vendor specific parts of
stmmac?

This code looks in DT. If there are no properties in DT, it does
nothing. So in general it should be safe, right?

	 Andrew

