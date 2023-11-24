Return-Path: <linux-arm-msm+bounces-1861-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BCCA7F756F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 14:45:46 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 9DC731C20381
	for <lists+linux-arm-msm@lfdr.de>; Fri, 24 Nov 2023 13:45:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D47028E2A;
	Fri, 24 Nov 2023 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o9CzBtB2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43019286B9;
	Fri, 24 Nov 2023 13:45:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C789FC433C7;
	Fri, 24 Nov 2023 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700833541;
	bh=EzqT4v8vZXGnSVX9M8qsp06zVhLbFhH0kYlZVwhXdTc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o9CzBtB2XVBvWvf4qEK3/cdglI9Ej7m5YdPkCvTE+vmSq5ifMZ2s4WhZWi1FX+EXn
	 TRyZ00bY4BMjVSHD4o4EYG5nFg6paKOdsFYqoXpj0ZYYd/4/m6FZN03E28fvxwYaa0
	 g217e4oJwaTF2ou1LKMh5Fyn0oVi8xOHeExMJ3HE2SKEFeCuj/E/syDZMFAHBvC74o
	 w3qn/gPd+hCVGb4mXNnmDwlHA4rSNFL5BAY+onlyPUL9JrJp3IbyKG5IMZ7VknUqRe
	 mi9L9uzoAZY9rvSSx6sh1Nttv1AWD+eMAnnA3MsIXVqT64ts57gqtq0fSmqvnbGmV9
	 yECsf5Sc3zlRw==
Received: from johan by xi.lan with local (Exim 4.96.2)
	(envelope-from <johan@kernel.org>)
	id 1r6WVN-0000to-1Y;
	Fri, 24 Nov 2023 14:46:02 +0100
Date: Fri, 24 Nov 2023 14:46:01 +0100
From: Johan Hovold <johan@kernel.org>
To: Krishna Kurapati PSSNV <quic_kriskura@quicinc.com>
Cc: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, quic_wcheng@quicinc.com,
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_ppratap@quicinc.com, quic_jackp@quicinc.com
Subject: Re: [PATCH 1/6] dt-bindings: usb: dwc3: Clean up hs_phy_irq in
 bindings
Message-ID: <ZWCpGdJRexnk98IN@hovoldconsulting.com>
References: <20231122191335.3058-1-quic_kriskura@quicinc.com>
 <ZV9dYpTYRXn63tXe@hovoldconsulting.com>
 <1192d91f-11bf-44af-953a-14e08e2b6ca8@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1192d91f-11bf-44af-953a-14e08e2b6ca8@quicinc.com>

On Fri, Nov 24, 2023 at 05:32:37PM +0530, Krishna Kurapati PSSNV wrote:
> > 
> > Thanks for sorting this out.
> > 
> > It seems like we have a few combinations of these interrupts and we
> > should probably try to define the order for these once and for all and
> > update the current devicetrees to match (even if it means adding new
> > interrupts in the middle).
> > 
> > Instead of adding separate compatibles for the controllers without SS
> > support, I suggest keeping that interrupt last as an optional one.
> > 
> > But IIUC we essentially have something like:
> > 
> > qusb2-:
> > 
> > 	- const: qusb2_phy
> > 	- const: pwr_event
> > 	- const: ss_phy_irq	(optional)
> > 
> > qusb2:
> > 
> > 	- const: hs_phy_irq
> > 	- const: qusb2_phy
> > 	- const: pwr_event
> > 	- const: ss_phy_irq	(optional)
> > 
> > qusb2+:
> > 
> > 	- const: hs_phy_irq
> > 	- const: qusb2_phy
> > 	- const: dp_hs_phy_irq
> > 	- const: dm_hs_phy_irq
> > 	- const: pwr_event
> > 	- const: ss_phy_irq	(optional)
> > 
> 
> This combination doesn't exist. So we can skip this one.

Ok, good. I thought you said some QUSB2 platforms used DP/DM, but I guess
that means they don't have the qusb2_phy interrupt then.
 
> > femto-:
> > 	- const: dp_hs_phy_irq
> > 	- const: dm_hs_phy_irq
> > 	- const: pwr_event
> > 	- const: ss_phy_irq	(optional)
> > 
> > femto:
> > 	- const: hs_phy_irq
> > 	- const: dp_hs_phy_irq
> > 	- const: dm_hs_phy_irq
> > 	- const: pwr_event
> > 	- const: ss_phy_irq	(optional)
> > 
> > Does this look like it would cover all of our currents SoCs?
> > 
> > Do all of them have the pwr_event interrupt?
> 
> Yes. From whatever targets I was able to find, only one of them didn't 
> have the power_event irq. Rest all of them had. I will recheck that 
> particular one again.

Please do. The driver polls the corresponding status register on all
platforms currently, and perhaps this interrupt can one day be used to
get rid of the polling.
 
> > Note that DP comes before DM above as that seems like the natural order
> > of these (plus before minus).
> > 
> > Now if the HS interrupt is truly unusable, I guess we can consider
> > dropping it throughout and the above becomes just three permutations
> > instead, which can even be expressed along the lines of:
> 
> Infact, I wanted to do this but since you mentioned before that if HW 
> has it, we must describe it, I kept it in. But since this functionality 
> is confirmed to be mutually exclusive of qusb2/{dp/dm}, I am aligned to 
> skip it in bindings and drop it in DT.

As I mentioned elsewhere, it depends on whether it can be used at all.
Not simply whether there is some other mechanism that can be used in its
stead. Such a decision should be left up to the implementation.

That's why I said "truly unusable" above. It's still not clear to me
whether that is the case or not.

> > 	- anyOf:
> > 	  - items:
> > 	    - const: qusb2_phy
> > 	  - items:
> > 	    - const: dp_hs_phy_irq
> > 	    - const: dm_hs_phy_irq
> > 	- const: pwr_event
> > 	- const: ss_phy_irq	(optional)
> > 
> 
> This must cover all cases AFAIK. How about we keep pwr_event also 
> optional for time being. The ones I am not able to find also would come 
> up under still binding block.

No, we should avoid that if we can as with two many optional things,
these quickly gets messy (one optional interrupt at the end is fine and
can be expressed using min/maxItems).

If the "qusb2+" combination above isn't needed, then we're down to four
permutations, which is few enough to be spelled out explicitly even if
we decide that the hs_phy_irq should be kept in. Without hs_phy_irq, it
seems there's really only two permutations.

Johan

