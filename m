Return-Path: <linux-arm-msm+bounces-60633-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B155AD1DE8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 14:36:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id EEC183AE9C7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Jun 2025 12:33:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 522C8259CB0;
	Mon,  9 Jun 2025 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b="Dmk4V4lK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8A812E5D;
	Mon,  9 Jun 2025 12:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=156.67.10.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749472252; cv=none; b=Yi8OvmnaO4tULgWjk5J47ZDqUpNhuaENGm0knCpEW1Cp+F+rCm8G7TFj1/xt/4lsGR3DIWFFA2+cly3izxDyW2vU8L8W20Rt0aJ+FrlpXb+RDQOkvEqdyBtWyF5sfQ5uy7BUN09EI9nd+Gn9dabITPiSY2ItpBfa1u3cgtIlibM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749472252; c=relaxed/simple;
	bh=Wk67O0hEoBSetZ3NsUD7CZgWZPkzT8SlTW21VHLbcDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bPKTP82e9XOZfkKeeGYUIBEsDvAi7q3O7BLIFGg6LqzKVRfgm3i7ngHwqJm7Tyz+YebvukieRCly65lNuOduibjxZCi1heXaNnBVRkiDvbSGTrpAvjzrOGU/wFd/elhSnzZlbPqu0Lmsf5zd32gh5LTdfrzCtF3IENp9V8egU5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch; spf=pass smtp.mailfrom=lunn.ch; dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.b=Dmk4V4lK; arc=none smtp.client-ip=156.67.10.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XihfSzdcpwSCc7IBfis0mRQVdIgDidnurumA1vAVDww=; b=Dmk4V4lKziiFliWDDazh6AAtiH
	+AxXaTDGiSR1kuLR1rWfP6Z1rqfKhtsRCvCwgKvwIdafsnhbVyuvBVVhREAD252Sh+91bHzqBEVdN
	gj2GBh0u/pD4oVk/d6ZqO/vhQGBXGr3CjtyBO44OILNObOJUzqj5y399n4mAD7kiRk9E=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uObe9-00F9I1-JG; Mon, 09 Jun 2025 14:30:37 +0200
Date: Mon, 9 Jun 2025 14:30:37 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: George Moussalem <george.moussalem@outlook.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/5] dt-bindings: net: qca,ar803x: Add IPQ5018
 Internal GE PHY support
Message-ID: <d56f57a7-79f5-4cb2-b4af-fdb88db69ef4@lunn.ch>
References: <20250609-ipq5018-ge-phy-v4-0-1d3a125282c3@outlook.com>
 <20250609-ipq5018-ge-phy-v4-2-1d3a125282c3@outlook.com>
 <6bf839e4-e208-458c-a3d1-f03b47597347@lunn.ch>
 <DS7PR19MB8883447735B1E7E1BE7985A89D6BA@DS7PR19MB8883.namprd19.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DS7PR19MB8883447735B1E7E1BE7985A89D6BA@DS7PR19MB8883.namprd19.prod.outlook.com>

On Mon, Jun 09, 2025 at 04:20:12PM +0400, George Moussalem wrote:
> 
> 
> On 6/9/25 16:16, Andrew Lunn wrote:
> > > +  - |
> > > +    #include <dt-bindings/reset/qcom,gcc-ipq5018.h>
> > > +
> > > +    mdio {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        /* add alias to set qcom,dac-preset-short-cable on boards that need it */
> > > +        ge_phy: ethernet-phy@7 {
> > > +            compatible = "ethernet-phy-id004d.d0c0";
> > > +            reg = <7>;
> > > +
> > > +            resets = <&gcc GCC_GEPHY_MISC_ARES>;
> > 
> > What do you mean by 'alias' here?
> 
> I mean node label. Since it was asked whether it's needed, I added a comment
> to say why, so that boards can reference it to set the
> qcom,dac-preset-short-cable property in the DTS as needed.

Ah, O.K.

Since this is internal, it is in the SoC .dtsi file. A board would
need to add the property in its .dts file, and so need a label.

The example itself does not need it, but the real version does. If it
was one of the DT Maintainers who asked for it, then O.K. 

	Andrew

