Return-Path: <linux-arm-msm+bounces-59187-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 57799AC1F45
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 11:06:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 972E51C02AD4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 23 May 2025 09:06:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 80C96222596;
	Fri, 23 May 2025 09:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g39Ufm5E"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52141158874;
	Fri, 23 May 2025 09:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747991167; cv=none; b=ML0/31E7TI+TX4oJRnR0xwjSetRBsWaOwNRNnbWMsdAoDeIJ2pDgARhuKzlRxP9DRVKnW2KZx6DA9RFr0VjwsqcZlwyC2SYdnuLeTeSL8dRNeoOIxu1O55wDtM58qQXFbrj1ubNsqkzAgpBvirFCJ2doe3mZxr3NQKdn+5ZGxhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747991167; c=relaxed/simple;
	bh=Rpjv0JrO41nivhlbI4+2a2+XIeOB7AFxjvb4ZS8YZhI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IVeJsUtxB/Av/UpBxhKv7FTr1Le+zb3xrR8+9rusp8JvP9e1cmGirrAV0nBgUfLixVATsxyg5rVF4rS9Qg5/1O1ECkEGkzRkYhqT3sTTmTytvhlDrOMQE6+bv+QE7vXiwZsEWldu/XqtbDab9V7HZidSiKIiTs4whBHNlFz+yRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g39Ufm5E; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35C43C4CEE9;
	Fri, 23 May 2025 09:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747991166;
	bh=Rpjv0JrO41nivhlbI4+2a2+XIeOB7AFxjvb4ZS8YZhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g39Ufm5E8lorrUP13UNIN3Dvqo8VG9e7Vp4ShfSxgg7L/F0fKZoxFraX3VA7fwh8g
	 6CGwi7+7CqCp8V5NBqQgXhi6mJJ6Z1PgM4OztWSZZMr7fwFGYlz3pC5ngys2C6xGUI
	 oBVX0E/2dmBba/MyRK1cMpA8cKwFl/aXau9zlQaonTX8/GF4xu8+gRYkg6TjXii/yY
	 GoB9HaLKDHtb3UeSegynYdJCLzQRliIXqKT11TLWsqNz008C7XsPLmFsW5kEGOaUZQ
	 g/tcbNDSlr1/EvfwegLceoU1SavYq9JLquUp5U52vEAuqk0maQTpgmLzK2rpx9LAKt
	 GaRyGJNJygA/Q==
Date: Fri, 23 May 2025 11:06:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, 
	Bjorn Andersson <andersson@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	Georgi Djakov <djakov@kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <20250523-markhor-of-fortunate-experience-1f575e@kuoka>
References: <20250506-qcom-apcs-mailbox-cc-v1-0-b54dddb150a5@linaro.org>
 <20250506-qcom-apcs-mailbox-cc-v1-1-b54dddb150a5@linaro.org>
 <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org>
 <20250521-psychedelic-cute-grouse-ee1291@kuoka>
 <aC-AqDa8cjq2AYeM@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aC-AqDa8cjq2AYeM@linaro.org>

On Thu, May 22, 2025 at 09:53:12PM GMT, Stephan Gerhold wrote:
> +Saravana
> 
> On Wed, May 21, 2025 at 11:20:40AM +0200, Krzysztof Kozlowski wrote:
> > On Wed, May 14, 2025 at 10:12:44PM GMT, Stephan Gerhold wrote:
> > > > > > > The mailbox itself does not need any clocks and should probe early to
> > 
> > ... so probe it early.
> > 
> > > > > > > unblock the rest of the boot process. The "clocks" are only needed for the
> > > > > > > separate clock controller. In Linux, these are already two separate drivers
> > > > > > > that can probe independently.
> > 
> > They can probe later, no problem and DT does not stop that. Linux, not
> > DT, controls the ways of probing of devices and their children.
> > 
> > > > > > > 
> > > > > > 
> > > > > > Why does this circular dependency need to be broken in the DeviceTree
> > > > > > representation?
> > > > > > 
> > > > > > As you describe, the mailbox probes and register the mailbox controller
> > > > > > and it registers the clock controller. The mailbox device isn't affected
> > > > > > by the clock controller failing to find rpmcc...
> > > > > > 
> > > > > 
> > > > > That's right, but the problem is that the probe() function of the
> > > > > mailbox driver won't be called at all. The device tree *looks* like the
> > > > > mailbox depends on the clock, so fw_devlink tries to defer probing until
> > > > > the clock is probed (which won't ever happen, because the mailbox is
> > > > > needed to make the clock available).
> > > > > 
> > > > > I'm not sure why fw_devlink doesn't detect this cycle and tries to probe
> > > > > them anyway, but fact is that we need to split this up in order to avoid
> > > > > warnings and have the supplies/consumers set up properly. Those device
> > > > > links are created based on the device tree and not the drivers.
> > > > 
> > > > Does "post-init-providers" providers solve your problem?
> > > > 
> > > 
> > > I would expect that it does, but it feels like the wrong solution to the
> > > problem to me. The clock is not really a post-init provider: It's not
> > > consumed at all by the mailbox and needed immediately to initialize the
> > > clock controller. The real problem in my opinion is that we're
> > > describing two essentially distinct devices/drivers in a single device
> > > node, and there is no way to distinguish that.
> > > 
> > > By splitting up the two distinct components into separate device tree
> > > nodes, the relation between the providers/consumers is clearly
> > > described.
> > 
> > You can split devices without splitting the nodes. I do not see reason
> > why the DT is the problem here.
> > 
> 
> The Linux drivers for this particular mailbox/clock controller already
> work exactly the way you propose. They are split into two devices that
> can probe independently.
> 
> The problem is outside of the drivers, because fw_devlink in Linux
> blocks probing until all resources specified in the device tree nodes
> become available. fw_devlink has no knowledge that the mailbox described
> by this peculiar device tree node does not actually need the clocks:
> 
> 	apcs1_mbox: mailbox@b011000 {
> 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
> 		reg = <0x0b011000 0x1000>;
> 		#mbox-cells = <1>;
> 		clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> 		clock-names = "pll", "aux", "ref";
> 		#clock-cells = <0>;
> 	};
> 
> Without device-specific quirks in fw_devlink, the fact that these clocks
> are only used by an unrelated clock controller only becomes clear if we
> split the device tree node like I propose in this series:
> 
> 	apcs1_mbox: mailbox@b011000 {
> 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
> 		reg = <0x0b011000 0x1000>;
> 		#mbox-cells = <1>;
> 
> 		apcs1_clk: clock-controller {
> 			clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> 			clock-names = "pll", "aux", "ref";
> 			#clock-cells = <0>;
> 		};
> 	};

Above code suggests that clocks are not needed for the mailbox at all.
You need to be really sure of that. If that's the case, then this
description looks like correct hardware description, more detailed then
the first case, though.

> 
> It is easy to say that the problem is in Linux (and not the DT), but
> unless you are suggesting to remove fw_devlink from Linux, or to add
> more device-specific quirks to the generic fw_devlink code, I'm only
> aware of the following two options to make this work (both already
> discussed in this email thread):
> 
>  1. post-init-providers (as suggested by Rob):
> 
> 		post-init-providers = <&a53pll_c1>, <&gcc>, <&rpmcc>;
> 
>     To repeat my previous email: IMHO this is a crude workaround for
>     this situation. The clock is not really a post-init provider: It's
>     not consumed at all by the mailbox and needed immediately to
>     initialize the clock controller.

Clock is a provider - it has clock-cells - and it is post-init, because
mailbox (parent) does not need it to initialize itself. Only part of its
functionality - clocks - need it.

> 
>     With this approach, there are no device links created for the
>     clocks, so we don't get the proper probe/suspend ordering that
>     fw_devlink normally provides.

This probably could be fixed in the Linux?

> 
>  2. Split up device tree node (this patch series): With this approach,
>     the mailbox can probe early and the clock controller child device
>     gets the expected consumer/supplier device links to the clocks. IMHO
>     this is the cleanest solution to go for.
> 
> @Saravana: Is there any other option that I missed? Or perhaps you have
> any other suggestions how we should handle this?
> 
> To summarize the series and previous emails, the dependency cycle that
> was in msm8939.dtsi before commit d92e9ea2f0f9 ("arm64: dts: qcom:
> msm8939: revert use of APCS mbox for RPM") is:
> 
>   1. The clock controller inside &apcs1_mbox needs
>      clocks = <&rpmcc RPM_SMD_XO_CLK_SRC>.
>   2. &rpmcc is a child of remoteproc &rpm
>   3. remoteproc &rpm needs mboxes = <&apcs1_mbox 8>;
> 
> This is not a real dependency cycle, the clocks in the mailbox@ node are
> not needed for the mailbox. They are only used and needed for the clock
> controller child device that makes use of the same device tree node.
> 
> At runtime this cycle currently results in none of the devices probing:
> 
> [   13.281637] platform remoteproc: deferred probe pending: qcom-rpm-proc: Failed to register smd-edge
> [   13.296257] platform b011000.mailbox: deferred probe pending: platform: supplier b016000.clock not ready
> [   13.308397] platform b016000.clock: deferred probe pending: platform: wait for supplier /remoteproc/smd-edge/rpm-requests/clock-controller
> 

Except missing dev_links you mentioned, this feels for me like job for
post-init-providers (option 1), but I am also fine with option 2,
because it fees like more appropriate hardware description.

Best regards,
Krzysztof


