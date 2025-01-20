Return-Path: <linux-arm-msm+bounces-45631-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CBAA170BF
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 17:50:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2B848188B2A2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 Jan 2025 16:50:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2EF911EBA1C;
	Mon, 20 Jan 2025 16:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="D33MXrMk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64DC91B87DB;
	Mon, 20 Jan 2025 16:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391812; cv=none; b=MgcotX9x2mNRKaedq21B5bT1lfVspuCJqIuTXUZUc24P5roMCBSjmix95TVXO1Z/tSWWWYXE/gxR7fUN4ziLAmLZO81xdOIzrIEUu6AaexoRDrauljlqWK2S/njM2KfMmt+ueQLPy/qGeyXT7GBMnwN8VfEuqj6lG0194IMgAc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391812; c=relaxed/simple;
	bh=3hGivv5L0ZJwWyGudvruWZfniXpzbxbpcHcFUlSE8hY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sv9C8t+f0nMifjDZ5zRdwW3yOIeTg3pHiJPLcl7KX36zQ8IKzSMCjaQSSdrAHfUE8mR0rcUd9aNv07QajI2DqtfeVfO/t9MA9xPJYJOBwH4tk5NVEsootkr6R4NjLHrgVta52Dzi4rRjZLV0kF7iQqu8ykmP/k/hmB3Ybut/p7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=D33MXrMk; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FoFI85rkVFBhTO2so9SNQoSkivg8MsoOQMlqZ8as4og=; b=D33MXrMklXGaGHGOc2v/lGG1Cq
	wAXHeEbVrNr4AwJ5BVzB9A/TubsknReXImJIK2XPWJDQkwQv43Zg6810meNNRzo5JN7zyFWbLKeIN
	prsrIGwQpsKyFYnbZ74p4Nv3EVmgQmnTI5dhxuMKqdhxLiIcsNiNrUvzreXGfdmNGJ2I=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tZuyJ-006OCq-8Z; Mon, 20 Jan 2025 17:49:55 +0100
Date: Mon, 20 Jan 2025 17:49:55 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Yijie Yang <quic_yijiyang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Jose Abreu <joabreu@synopsys.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] net: stmmac: qcom-ethqos: Enable RX programmable
 swap on qcs615
Message-ID: <0fe23cfd-9326-4664-9c94-cf010aec882c@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
 <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
 <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
 <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5bc3f4e0-6c3f-412c-a825-54707c70f779@quicinc.com>

> > So this indicates any board might need this feature, not just this one
> > board. Putting the board name in the driver then does not scale.
> > 
> 
> Should I ignore this if I choose to use the following standard properties?

You should always follow standard properties unless they don't
work. And if they don't work, your commit message needs to explain why
they don't work forcing your to do something special.

> > > This means the time
> > > delay introduced by the PC board may not be zero. Therefore, it's necessary
> > > for software developers to tune both the RX programming swap bit and the
> > > delay to ensure correct sampling.
> > 
> > O.K. Now look at how other boards tune their delays. There are
> > standard properties for this:
> > 
> >          rx-internal-delay-ps:
> >            description:
> >              RGMII Receive Clock Delay defined in pico seconds. This is used for
> >              controllers that have configurable RX internal delays. If this
> >              property is present then the MAC applies the RX delay.
> >          tx-internal-delay-ps:
> >            description:
> >              RGMII Transmit Clock Delay defined in pico seconds. This is used for
> >              controllers that have configurable TX internal delays. If this
> >              property is present then the MAC applies the TX delay.
> > 
> > I think you can use these properties, maybe with an additional comment
> > in the binding. RGMII running at 1G has a clock of 125MHz. That is a
> > period of 8ns. So a half clock cycle delay is then 4ns.
> > 
> > So an rx-internal-delay-ps of 0-2000 means this clock invert should be
> > disabled. A rx-internal-delay-ps of 4000-6000 means the clock invert
> > should be enabled.
> 
> This board was designed to operate at different speed rates, not a fixed
> speed, and the clock rate varies for each speed. Thus, the delay introduced
> by inverting the clock is not fixed. Additionally, I noticed that some
> vendors apply the same routine for this property across all speeds in their
> driver code. Can this property be used just as a flag, regardless of its
> actual value?

Maybe you should go read the RGMII standard, and then think about how
your hardware actually works.

RGMII always has a variable clock, with different clock speeds for
10/100/1G. So your board design is just plain normal, not
special. Does the standard talk about different delays for different
speeds? As you say, other drivers apply the same delay for all
speeds. Why should your hardware be special?

RGMII has been around for 25 years. Do you really think your RGMII
implementation needs something special which no other implementation
has needed in the last 25 years?

> > Now, ideally, you want the PHY to add the RGMII delays, that is what i
> > request all MAC/PHY pairs do, so we have a uniform setup across all
> > boards. So unless the PHY does not support RGMII delays, you would
> > expect rx-internal-delay-ps to be either just a small number of
> > picoseconds for fine tuning, or a small number of picoseconds + 4ns
> > for fine tuning.
> 
> The delay for both TX and RX sides is added by the MAC in the Qualcomm
> driver, which was introduced by the initial patch. I believe there may be a
> refactor in the future to ensure it follows the requirements.
 
You can do it in the MAC. But you probably want to clearly document
this, that your design is different to > 95% of systems in Linux which
have the PHY do the delays.

	Andrew

