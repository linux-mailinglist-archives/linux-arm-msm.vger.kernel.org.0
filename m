Return-Path: <linux-arm-msm+bounces-65538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id D0CD4B09339
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 19:30:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2F0EB18963D1
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 17:31:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AC21D2FCFFB;
	Thu, 17 Jul 2025 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bvn9fuBY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76C9F287254;
	Thu, 17 Jul 2025 17:30:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752773453; cv=none; b=e4Pjnfj62pFSPo5ViZhLBolajPSAUzElJtUhVhSm+aDM9kIwj6cw7NRNRpz6ixBOjD0DjsjXV/2ZhKPstYzzztcbUEkctKjm3wO1o2dneM/8okRRAwGdy7o3hphO7rJIXDSTM35J5gF5kTaWasLVrFNWmumftPFxnueHq0ZxrBk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752773453; c=relaxed/simple;
	bh=/pLsXovothPJruGBndBMhFdhBuU009HRKnVZRRUJY/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sAQLY1b0MiitHC3bAQU+cE2sU3GwEMcFcANVrgPy8Qq63YgkNM+jTD4p45aRauf24RSbT5IaA7TmQfdzvbQG3PpEA2RvWd4lJemS4WueHR/wYuSeMPPv7YAxNwQpW8xJFzcXSjjPyJFl/+GVGtqbGjas+d9k6MHNzbkqHo6Xk6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bvn9fuBY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD0F9C4CEE3;
	Thu, 17 Jul 2025 17:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752773452;
	bh=/pLsXovothPJruGBndBMhFdhBuU009HRKnVZRRUJY/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bvn9fuBYIQdA/I3AbcqXRhWhEIPtJ9ZpuPB/TpIutLy7ua/1waBrw1ZH4dVMP1GGA
	 USu+wy3fCeACCSVIb8eihVtqiKMzDqRf92Itbi0gEVJXd3rzvklqMxVy++RddjdAvt
	 qbR0aYDD56f4YHC7QvctaOPWoTdk4nuQcACB1I3Of0P6V73cO1tw48qHEBsR4G/l9c
	 x7afxaiPH/4juxV4Hkaae+cPUQ+E8ZcAo9irND49FBkgHRVXcyOx4W+R14/5yICSA8
	 00MrPtDpbI3iN56lkvBI+AooWCAfA4xx87QY2G0xg0IhgYk0UHMB0NvISIe6uuegWp
	 BUMyJBpQk9NIA==
Date: Thu, 17 Jul 2025 12:30:50 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>, 
	Saravana Kannan <saravanak@google.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Rob Herring <robh@kernel.org>, Jassi Brar <jassisinghbrar@gmail.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, Georgi Djakov <djakov@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: mailbox: qcom,apcs: Add separate node
 for clock-controller
Message-ID: <qawoswiuojk7no32jf2vejh4wcocv74fn37kn5xjqbbnwshmkv@r6yitwwx64xb>
References: <7vszdea2djl43oojvw3vlrip23f7cfyxkyn6jw3wc2f7yowht5@bgsc2pqscujc>
 <aCNGSwL7043GoJBz@linaro.org>
 <20250514160841.GA2427890-robh@kernel.org>
 <aCUHTJGktLFhXq4Q@linaro.org>
 <20250521-psychedelic-cute-grouse-ee1291@kuoka>
 <aC-AqDa8cjq2AYeM@linaro.org>
 <20250523-markhor-of-fortunate-experience-1f575e@kuoka>
 <jvsdn67x2qm2avaktnpqzoixcd46xuuf6i5kpeolsnewgoqt6q@jid7unlmmu65>
 <175053907628.4372.13105365536734444855@lazor>
 <aFlT7fLePVmvoxBQ@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFlT7fLePVmvoxBQ@linaro.org>

On Mon, Jun 23, 2025 at 03:17:33PM +0200, Stephan Gerhold wrote:
> wOn Sat, Jun 21, 2025 at 01:51:16PM -0700, Stephen Boyd wrote:
> > Quoting Bjorn Andersson (2025-06-10 20:31:57)
> > > I'm still sceptical here.
> > > 
> > > In the first snippet above, we describe a single IP block which provides
> > > mailboxes and clocks.
> > > 
> > > In the second snippet we're saying that the IP block is a mailbox, and
> > > then it somehow have a subcomponent which is a clock provider.
> > > 
> > > It seems to me that we're choosing the second option because it better
> > > fits the Linux implementation, rather than that it would be a better
> > > representation of the hardware. To the point that we can't even describe
> > > the register range of the subcomponent...
> > > 
> > 
> > Agreed. Don't workaround problems in the kernel by changing the binding
> > to have sub-nodes.
> 
> I can describe the register range for the subcomponent if you prefer
> (it's reg = <0x50 0xc>; within the parent component). That would be easy
> to add.
> 
> Your more fundamental concern (working around problems in the kernel by
> changing the binding) is a more tricky and subtle one. I had exactly the
> same thought when I started making this patch series. However, if you
> start looking more closely you will see that this is much easier said
> than done. I tried to explain the problem already a few times (in the
> cover letter, the commit messages and responses to this series), but let
> me try again. Perhaps in different words it will become more
> understandable.
> 
> Just for clarity, let's take the current device tree description again:
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
> Clearly this is a mailbox (#mbox-cells) and a clock controller
> (#clock-cells). In the hardware these are stuffed into one register
> region, but they don't have anything to do with each other. In
> particular, the specified clocks are only used by the clock controller.
> They are not used or related in any way to the mailbox component.
> 
> We need to have the mailbox available early to proceed with booting. The
> clock controller can probe anytime later. The &rpmcc clock required by
> the clock controller depends on having the mailbox available.
> 
> In Linux, I cannot get the mailbox driver to probe as long as the &rpmcc
> clock is specified inside this device tree node (or by using
> post-init-providers, but see [1]). This is not something I can fix in
> the driver. The "problem in the kernel" you are referring to is
> essentially "fw_devlink". Independent of the device-specific bindings we
> define, it is built with the assumption that resources specified in a
> device tree node are required to get a device functioning.
> 
> We usually want this behavior, but it doesn't work in this case. I argue
> this is because we describe *two* devices as part of a *single* device
> tree node. By splitting the *two* devices into *two* device tree nodes,
> it is clear which resources belong to which device, and fw_devlink can
> function correctly.
> 

We have many cases where there are cyclic links in the DeviceTree
representation - clock controllers depending on clock providers that
depend on the same clock controller, regulators being supplied by
regulators of the same PMIC etc.

From a DeviceTree point of view this looks quite similar, but from an
implementation perspective this is simpler than those examples - we
don't even need to do async resolution per resource here.

> You argue this is a problem to be solved in the kernel. In practice,
> this would mean one of the following:
> 
>  - Remove fw_devlink from Linux.
>  - Start adding device-specific quirks into the generic fw_devlink code.
>    Hardcode device links that cannot be deferred from the device tree
>    because our hardware description is too broad.
> 
> Both of these are not really desirable, right?
> 

fw_devlink is supposed to optimize the probe order, it must not prevent
the system from booting just because there is cyclic dependencies
between IP-blocks.

If fw_devlink is authoritative in determining which order things must
happen, then it needs to deal with these things.

> I don't think there is a good way around making the hardware description
> more precise by giving the two devices separate device tree nodes. There
> are many different options for modelling these, and I would be fine with
> all of them if you think one of them fits better:
> 
> Top-level siblings:
> 
> 	apcs1_mbox: mailbox@b011008 {
> 		compatible = "qcom,msm8939-apcs-mbox";
> 		reg = <0x0b011008 0x4>;
> 		#mbox-cells = <1>;
> 	};
> 
> 	apcs1_clk: clock-controller@b011050 {
> 		compatible = "qcom,msm8939-apcs-clk";
> 		reg = <0x0b011050 0xc>;
> 		clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> 		clock-names = "pll", "aux", "ref";
> 		#clock-cells = <0>;		
> 	};

This doesn't scale to any example where you have more than single
resources laid out in a convenient order.

> 
> Top-level syscon wrapper with two children:
> 
> 	syscon@b011000 {
> 		compatible = "qcom,msm8939-apcs-kpss-global", "syscon";
> 		reg = <0x0b011000 0x1000>;
> 		#adress-cells = <1>;
> 		#size-cells = <1>;
> 		ranges = <0 0x0b011000 0x1000>;
> 
> 		apcs1_mbox: mailbox@8 {
> 			compatible = "qcom,msm8939-apcs-mbox";
> 			reg = <0x8 0x4>;
> 			#mbox-cells = <1>;
> 		};
> 
> 		apcs1_clk: clock-controller@50 {
> 			compatible = "qcom,msm8939-apcs-clk";
> 			reg = <0x0b011050 0xc>;
> 			clocks = <&a53pll_c1>, <&gcc GPLL0_VOTE>, <&rpmcc RPM_SMD_XO_CLK_SRC>;
> 			clock-names = "pll", "aux", "ref";
> 			#clock-cells = <0>;
> 		};
> 	};

This is clearly implementation-driven. Until fw_devlink "forced" you
into this model we considered APCS KPSS global to be one entity.

> 
> Mailbox as parent (what I did in this series):
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

This is just a pragmatic variant of above.

> 
> Maybe it makes more sense with this explanation and the other options.
> Let me know what you think!
> 

Regards,
Bjorn

> Thanks,
> Stephan
> 
> [1]: https://lore.kernel.org/linux-arm-msm/aC-AqDa8cjq2AYeM@linaro.org/

