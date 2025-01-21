Return-Path: <linux-arm-msm+bounces-45702-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id B89C3A18277
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 18:01:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 8F9D016B5BE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jan 2025 17:01:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D7561F4714;
	Tue, 21 Jan 2025 17:01:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="qu9hGiLE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D410B1B394B;
	Tue, 21 Jan 2025 17:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737478882; cv=none; b=J8E/5GlT/QZdD4AmH3CVn4/C5VQF4Ovhg+LvpbxcnkDj1fJ2uliwa4uOFqlYjpYWOUu+PrQAZ52UgUiY/4KdGhsTnfzIJXaTjKCdbAmQWtKMnn/sK72838IjV6+5eneV9Sg2ol46K4/aQnZt6uaOFD0snnJr5UegtHhJ8Hp5ahY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737478882; c=relaxed/simple;
	bh=wV7QW7JOBrrj65ggqIu0mtbf36kyZMzyV2RvgHR4ZcY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcWKr65vY6RxzTPqB41873LHR6eK/J2Y7fhXsNprvW6YTPasqOanTx8RIY6fcopgxKaRrq2Y15xBuH9ST1pMu22SeiNBEUlEeKByjBt3vESQiY2rCLalcl99SfCV4iTfCUTyFsyWw8EStNzbJH6MBAyjifbluVnnn+cRB/tKeAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=qu9hGiLE; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=7Pnocolf/+FMPBsjA4XKBOck60bqAiKE6Tl4dgyzfRI=; b=qu9hGiLEi/SYW6d2f1eyaAFdCs
	1qp0YPhycK5jWI/BYvXgioC80c/Q4WXVxCidQ7YVf1kQrT7B3cdzujhe1g7BNEjoZb0oQxDhzuxw+
	dn0VRXrCxykMPy7+z+08vb44I4S9nuAzxCpnkjyPfaKSN75ZWLb8i2LpNQE6FrwbtW/Y=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1taHcX-006hE0-M8; Tue, 21 Jan 2025 18:00:57 +0100
Date: Tue, 21 Jan 2025 18:00:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>
Cc: Yijie Yang <quic_yijiyang@quicinc.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/4] dt-bindings: net: ethernet-controller: Correct
 the definition of phy-mode
Message-ID: <69954039-96bf-42d9-850d-48676a530ec6@lunn.ch>
References: <20250121-dts_qcs615-v3-0-fa4496950d8a@quicinc.com>
 <20250121-dts_qcs615-v3-1-fa4496950d8a@quicinc.com>
 <20250121140840.18f85323@device-291.home>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121140840.18f85323@device-291.home>

On Tue, Jan 21, 2025 at 02:08:40PM +0100, Maxime Chevallier wrote:
> On Tue, 21 Jan 2025 15:54:53 +0800
> Yijie Yang <quic_yijiyang@quicinc.com> wrote:
> 
> > Correct the definition of 'phy-mode' to reflect that RX and TX delays are
> > added by the board, not the MAC, to prevent confusion and ensure accurate
> > documentation.
> 
> That's not entirely correct though. The purpose of the RGMII variants
> (TXID, RXID, ID) are mostly to know whether or not the PHY must add
> internal delays. That would be when the MAC can't AND there's no PCB
> delay traces. Some MAC can insert delays.
> 
> There's documentation here as well on that point :
> 
> https://elixir.bootlin.com/linux/v6.13-rc3/source/Documentation/networking/phy.rst#L82

This is part of the problem. This describes
PHY_INTERFACE_MODE_RGMII_*, and the value passed to phylib. The
documentation even says:

   The values of phy_interface_t must be understood from the
   perspective of the PHY device itself,

But the value in DT is about the board as a whole, it describes the
hardware. Software gets to decide if the MAC or the PHY adds the
delays, if the board does not provide the delay.

> So, MACs may insert delays. A modification for the doc, if needed,
> would rather be :
> 
> -      # RX and TX delays are added by the MAC when required
> +      # RX and TX delays are added by the MAC or PCB traces when required

From the perspective of the board, this is wrong. 'rgmii' means the
board provides the delays.

There is a parallel discussion going on, about how aspeed have also
got there implementation wrong. See:

https://lore.kernel.org/netdev/0ee94fd3-d099-4d82-9ba8-eb1939450cc3@lunn.ch/

and the test of that thread.

	Andrew

