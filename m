Return-Path: <linux-arm-msm+bounces-54019-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 600D1A85CD6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 14:19:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B80D33B52B5
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Apr 2025 12:16:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DEB09238C10;
	Fri, 11 Apr 2025 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GgN0QIaO"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CAF208A9;
	Fri, 11 Apr 2025 12:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744373782; cv=none; b=H6nIJ55OBVd7bWymd2b5VKkkYfuwae85p2PLAq48U7GRynjmK+oruvrYl0f7x2axbmhYLQBo+7+OGMXA/tGIKEOc9meUG3Bd2yTQk/+/lgesevZ2trNpWlSy6ILgIQRXHdxDa1nLxoICAhfBCtjTQpPk1u0lIy/8H5oBh9HIMKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744373782; c=relaxed/simple;
	bh=F6AxARnd3xc3ILccMeGQR4+AdsjAK1Ng9wcvSCTdcUs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Du21XTVVR6yL9BEJarwLnHLaOG/fs0KC5LM+fDBOqCjvTMZ+QTsWhV44fzHX9u0H6VGb/UlyXC4b9VuLQsmgHwLWVkUcPX5dnaSXmyWvvBIaku6ilCg+MZC467vm38rFaQZIVNADuuFb/7RvSTs9wW8R4AZZF8l1fG6jyqHJEHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GgN0QIaO; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13006C4CEE2;
	Fri, 11 Apr 2025 12:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744373782;
	bh=F6AxARnd3xc3ILccMeGQR4+AdsjAK1Ng9wcvSCTdcUs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GgN0QIaOqZwKC84+vH+4PYL6Yqoa2YbPgMzsNSS5Uokga7vW007H/vpuvWZ16f+vb
	 G3HEFhPSwBziRClLsu7BYJ9wC7MR+J8Ot6bBgqD0YRFNCH0enAQlLyHJDqDddMwwBh
	 CrBaSsXTxH9V65JLSZrKped29VS56QlTy23mlfTvE71ATxiGmgWdskJwk+dL4leo7d
	 j82a2SR2BlbDvfotFq7Zv4gyBcvD0SF4zEjVaKwC3VfFn5Wu28irRy/UivCppMWmlx
	 kN/YrUjtfpKHk1MnFmcQAU0+jjcWczr3ouPiM916K+TLUY9Gf+Fi6FyPvlY4YHCkMt
	 z/g6jtw744FVw==
Received: from johan by xi.lan with local (Exim 4.97.1)
	(envelope-from <johan@kernel.org>)
	id 1u3DJ3-000000001ZR-3R9Z;
	Fri, 11 Apr 2025 14:16:26 +0200
Date: Fri, 11 Apr 2025 14:16:25 +0200
From: Johan Hovold <johan@kernel.org>
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: jens.glathe@oldschoolsolutions.biz,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] arm64: dts: qcom: x1e80100-hp-x14: add
 usb-1-ss1-sbu-mux
Message-ID: <Z_kIGS0GLduS1H1z@hovoldconsulting.com>
References: <20250410-hp-x14-v2-0-d36414704a0a@oldschoolsolutions.biz>
 <20250410-hp-x14-v2-1-d36414704a0a@oldschoolsolutions.biz>
 <Z_j8M2Q0J3LuANAF@hovoldconsulting.com>
 <Z_kChvolKDp2JAcS@linaro.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_kChvolKDp2JAcS@linaro.org>

On Fri, Apr 11, 2025 at 01:52:38PM +0200, Stephan Gerhold wrote:
> On Fri, Apr 11, 2025 at 01:25:39PM +0200, Johan Hovold wrote:
 
> > > +	usb_1_ss1_sbu_default: usb-1-ss1-sbu-state {
> > > +		mode-pins {
> > > +			pins = "gpio177";
> > > +			function = "gpio";
> > > +			bias-disable;
> > > +			drive-strength = <2>;
> > > +			output-high;
> > > +		};
> > 
> > This is more of a question for Stephan who added this to QCP [1], but
> > why is this mode pin here and what does it do?
> > 
> > It's not part of the binding for the mux (which indeed only has two
> > control signals according to the datasheet) so it looks like something
> > is not modelled correctly.
> 
> I'm afraid you have opened a "can of worms" here. :')

Heh.

> On the QCP, there are actually two of these muxes chained for each port.
> One of them does the orientation switching that we are describing here,
> the other selects between routing SBU to DP AUX or USB SBTX/SBRX. I'm
> guessing this is meant for USB4. Given that:
> 
>  - We don't have any support for USB4 on QC platforms at the moment.
>  - We're not modelling the USB4 stuff for the retimer either(?).
>  - We have no clear overview of what/how to model for USB4.
>  - The ports without retimer aren't advertised with USB4 support (I'm
>    guessing the signal quality is not reliable enough without retimer).
>  - The gpio-sbu-mux driver doesn't support shared enable-gpios.
> 
> ... we just went with the tradeoff of forcing DP AUX mode here by
> setting a fixed state for the second mux. I'm not sure if the other
> configuration is even a valid use case for the ports without retimer.
> 
> A comment about this would have been nice, but I didn't think of that
> anymore when cleaning up the patches. :-)

Thanks for the explanation. Makes sense.

Johan

