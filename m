Return-Path: <linux-arm-msm+bounces-60902-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id DA512AD495D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 05:32:05 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EAB0176BB2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Jun 2025 03:32:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902C9146D65;
	Wed, 11 Jun 2025 03:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wcv93IdU"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BDC6186A;
	Wed, 11 Jun 2025 03:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749612721; cv=none; b=oOlplzs8uz+00y0cEMBALqUQFW4/lEST9YAf2KbYdGjf1nydCDPsWPLEFribR87bbf4DCztCkicg/2QecSOF6EkjjSQWkJe8g1mCc0ir4sGvgnSTttwtebvRMUhWpGjVgjmzvI8MvcuvNFfcZR30Ed8lWjeO9S8XinEhdcAG3mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749612721; c=relaxed/simple;
	bh=mQqY2nlpKETxKF8IqYbRQfTFn/65IiZ6gxTWsY7DuPw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdW7vT1xGRJgQe8GJcejCqmFrOJsMjvk08TfffhY/BrHPsp4hvmnee8+86xZoJwt+6pokoZoRP707EhMN/JsqXYomUXuQQgCe7NRt9A8gn1MYjvw00fOEK/WZnBeuiByxwd9gUOpKdQEkcTLSzhlDIoZQa25MdQ2lRhnlLVLcA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wcv93IdU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B18C4CEEE;
	Wed, 11 Jun 2025 03:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749612720;
	bh=mQqY2nlpKETxKF8IqYbRQfTFn/65IiZ6gxTWsY7DuPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wcv93IdUXwp68YX/swroJFHhKxd3MEKLTB+F664TY3vs/+/IGmnunw6fPYKu5MYOZ
	 et6w9RZm8nH24sebcYUf9lnmYg9pIUuwaSsXpCBEXny1XIdgyoSRlMTUPjBwRpWHRf
	 fkhyZUvSaF+D8pOoKBmZFpJX0r6GsEKOFjKLXmQp19eLopSR4atV7ymrdWAL9S10AB
	 ffZll8k7Zn5VbNyj9lnwjlpVmqcTtq8wHaMuTFBnl/YHi9d1TnUeIQBWRGTYeECkp/
	 0iP9R6+l4CqyDYCBrv+UU4ciExM/hntdVr9ESAfPQuA4JSZqlmiRP1bBU5Sg+LuDhy
	 0JVgxn/1dvyHg==
Date: Tue, 10 Jun 2025 22:31:57 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>, 
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <jvsdn67x2qm2avaktnpqzoixcd46xuuf6i5kpeolsnewgoqt6q@jid7unlmmu65>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org>
 <20250521-psychedelic-cute-grouse-ee1291@kuoka>
 <aC-AqDa8cjq2AYeM@linaro.org>
 <20250523-markhor-of-fortunate-experience-1f575e@kuoka>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523-markhor-of-fortunate-experience-1f575e@kuoka>

On Fri, May 23, 2025 at 11:06:04AM +0200, Krzysztof Kozlowski wrote:
> On Thu, May 22, 2025 at 09:53:12PM GMT, Stephan Gerhold wrote:
> > +Saravana
> > 
> > On Wed, May 21, 2025 at 11:20:40AM +0200, Krzysztof Kozlowski wrote:
> > > On Wed, May 14, 2025 at 10:12:44PM GMT, Stephan Gerhold wrote:
> > > > > > > > The mailbox itself does not need any clocks and should probe early to
> > > 
> > > ... so probe it early.
> > > 
> > > > > > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > > > > > separate clock controller. In Linux, these are already two separate drivers
> > > > > > > > that can probe independently.
> > > 
> > > They can probe later, no problem and DT does not stop that. Linux, not
> > > DT, controls the ways of probing of devices and their children.
> > > 
> > > > > > > > 
> > > > > > > 
> > > > > > > Why does this circular dependency need to be broken in the DeviceTree
> > > > > > > representation?
> > > > > > > 
> > > > > > > As you describe, the mailbox probes and register the mailbox controller
> > > > > > > and it registers the clock controller. The mailbox device isn't affected
> > > > > > > by the clock controller failing to find rpmcc...
> > > > > > > 
> > > > > > 
> > > > > > That's right, but the problem is that the probe() function of the
> > > > > > mailbox driver won't be called at all. The device tree *looks* like the
> > > > > > mailbox depends on the clock, so fw_devlink tries to defer probing until
> > > > > > the clock is probed (which won't ever happen, because the mailbox is
> > > > > > needed to make the clock available).
> > > > > > 
> > > > > > I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
> > > > > > them anyway, but fact is that we need to split this up in order to avoid
> > > > > > warnings and have the supplies/consumers set up properly. Those device
> > > > > > links are created based on the device tree and not the drivers.
> > > > > 
> > > > > Does "post-init-providers" providers solve your problem?
> > > > > 
> > > > 
> > > > I would expect that it does, but it feels like the wrong solution to the
> > > > problem to me. The clock is not really a post-init provider: It's not
> > > > consumed at all by the mailbox and needed immediately to initialize the
> > > > clock controller. The real problem in my opinion is that we're
> > > > describing two essentially distinct devices/drivers in a single device
> > > > node, and there is no way to distinguish that.
> > > > 
> > > > By splitting up the two distinct components into separate device tree
> > > > nodes, the relation between the providers/consumers is clearly
> > > > described.
> > > 
> > > You can split devices without splitting the nodes. I do not see reason
> > > why the DT is the problem here.
> > > 
> > 
> > The Linux drivers for this particular mailbox/clock controller already
> > work exactly the way you propose. They are split into two devices that
> > can probe independently.
> > 
> > The problem is outside of the drivers, because fw_devlink in Linux
> > blocks probing until all resources specified in the device tree nodes
> > become available. fw_devlink has no knowledge that the mailbox described
> > by this peculiar device tree node does not actually need the clocks:
> > 
> > 	apcs1_mbox: mailbox@b011000 {
> > 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
> > 		reg = <0x0b011000 0x1000>;
> > 		#mbox-cells = <1>;
> > 		clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > 		clock-names = "pll", "aux", "ref";
> > 		#clock-cells = <0>;
> > 	};
> > 
> > Without device-specific quirks in fw_devlink, the fact that these clocks
> > are only used by an unrelated clock controller only becomes clear if we
> > split the device tree node like I propose in this series:
> > 
> > 	apcs1_mbox: mailbox@b011000 {
> > 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
> > 		reg = <0x0b011000 0x1000>;
> > 		#mbox-cells = <1>;
> > 
> > 		apcs1_clk: clock-controller {
> > 			clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> > 			clock-names = "pll", "aux", "ref";
> > 			#clock-cells = <0>;
> > 		};
> > 	};
> 
> Above code suggests that clocks are not needed for the mailbox at all.
> You need to be really sure of that. If that's the case, then this
> description looks like correct hardware description, more detailed then
> the first case, though.
> 

I'm still sceptical here.

In the first snippet above, we describe a single IP block which provides
mailboxes and clocks.

In the second snippet we're saying that the IP block is a mailbox, and
then it somehow have a subcomponent which is a clock provider.

It seems to me that we're choosing the second option because it better
fits the Linux implementation, rather than that it would be a better
representation of the hardware. To the point that we can't even describe
the register range of the subcomponent...


Can you confirm that this is the path we want to go here?

Regards,
Bjorn

