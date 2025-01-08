Return-Path: <linux-arm-msm+bounces-44379-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0E2A05CC4
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 14:29:28 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 83DCF7A2570
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jan 2025 13:29:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEACA1FBE8D;
	Wed,  8 Jan 2025 13:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="5MCclyIC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2522C1FBC89;
	Wed,  8 Jan 2025 13:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736342961; cv=none; b=jiQncj0OL3XbhqNdBqaQQYyP9jgwbm0rMWBOElEdpod6DHuWhN0kAHV1vLVhW1s3vB3fDOP8yFO7hO1qentxbKq6axrvWLAB/bUqsU3uftYjaJC3H8tyewJnSBHLHKHAMLLX8WWlnvGSyn5q6dDGLQHVOb2no3z/OfH4406OT/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736342961; c=relaxed/simple;
	bh=Yz68hqMDSNBYAoDE8DUh/cL1zrZm7KmAwYqBHDhBMWs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GePtDEVK1W57FSBxeQEcuWGCxq2nO9ryU57cAV9MkKn9bENUwQJ8z7J7DhzMIYhRLKwu0KZGafiEjAM7sNxdNOEP0Ec3Z0c+8RiHWWlRn2BeoL6cFAH6EH89L8+0vcrzCbpmqgdoEuJKvQnCYhgVdKiv7Q6XJfaPs5qOj9fvx/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=5MCclyIC; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=8NWugOCTua3U4zM1I0sMTHCzc7ebPizCAQxQ1HTI358=; b=5MCclyICiavifLu+is6XHXo+lL
	JMlKc9c2kEDa4HeGyBpaP//rY02AHLVjfDoVIPuhsn5rQCgm4I0NPI+i0f0mO8/a4sOcbRenvudAh
	ZapVFOfxUZ3YvjWIQ85GWtVRltJHsKjePk3aA+9PwD7Hf1fTQTgzY8gES+EbDBsywjh4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tVW7L-002Zoo-A9; Wed, 08 Jan 2025 14:29:03 +0100
Date: Wed, 8 Jan 2025 14:29:03 +0100
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
Message-ID: <7e046761-7787-4f01-b47b-9374402489ac@lunn.ch>
References: <20241225-support_10m100m-v1-0-4b52ef48b488@quicinc.com>
 <20241225-support_10m100m-v1-2-4b52ef48b488@quicinc.com>
 <4b4ef1c1-a20b-4b65-ad37-b9aabe074ae1@kernel.org>
 <278de6e8-de8f-458a-a4b9-92b3eb81fa77@quicinc.com>
 <e47f3b5c-9efa-4b71-b854-3a5124af06d7@lunn.ch>
 <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87a7729d-ccdd-46f0-bcfd-3915452344fd@quicinc.com>

> > Why is it specific to this board? Does the board have a PHY which is
> > broken and requires this property? What we are missing are the details
> > needed to help you get to the correct way to solve the problem you are
> > facing.
> > 
> 
> Let me clarify why this bit is necessary and why it's board-specific. The RX
> programming swap bit can introduce a time delay of half a clock cycle. This
> bit, along with the clock delay adjustment functionality, is implemented by
> a module called 'IO Macro.' This is a Qualcomm-specific hardware design
> located between the MAC and PHY in the SoC, serving the RGMII interface. The
> bit works in conjunction with delay adjustment to meet the sampling
> requirements. The sampling of RX data is also handled by this module.
> 
> During the board design stage, the RGMII requirements may not have been
> strictly followed, leading to uncertainty in the relationship between the
> clock and data waveforms when they reach the IO Macro.

So this indicates any board might need this feature, not just this one
board. Putting the board name in the driver then does not scale.

> This means the time
> delay introduced by the PC board may not be zero. Therefore, it's necessary
> for software developers to tune both the RX programming swap bit and the
> delay to ensure correct sampling.

O.K. Now look at how other boards tune their delays. There are
standard properties for this:

        rx-internal-delay-ps:
          description:
            RGMII Receive Clock Delay defined in pico seconds. This is used for
            controllers that have configurable RX internal delays. If this
            property is present then the MAC applies the RX delay.
        tx-internal-delay-ps:
          description:
            RGMII Transmit Clock Delay defined in pico seconds. This is used for
            controllers that have configurable TX internal delays. If this
            property is present then the MAC applies the TX delay.

I think you can use these properties, maybe with an additional comment
in the binding. RGMII running at 1G has a clock of 125MHz. That is a
period of 8ns. So a half clock cycle delay is then 4ns.

So an rx-internal-delay-ps of 0-2000 means this clock invert should be
disabled. A rx-internal-delay-ps of 4000-6000 means the clock invert
should be enabled.

Now, ideally, you want the PHY to add the RGMII delays, that is what i
request all MAC/PHY pairs do, so we have a uniform setup across all
boards. So unless the PHY does not support RGMII delays, you would
expect rx-internal-delay-ps to be either just a small number of
picoseconds for fine tuning, or a small number of picoseconds + 4ns
for fine tuning.

This scales, since it can be used by an board with poor design, and it
does not require anything proprietary to Qualcomm, except the extended
range, and hopefully nobody except Qualcomms broken RDK will require
it, because obviously you will document the issue with the RDK and
tell customers how to correctly design their board to be RGMII
compliant with the clocks.

	Andrew

