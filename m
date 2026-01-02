Return-Path: <linux-arm-msm+bounces-87276-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 01BF7CEF463
	for <lists+linux-arm-msm@lfdr.de>; Fri, 02 Jan 2026 21:09:11 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id B2D2D300F701
	for <lists+linux-arm-msm@lfdr.de>; Fri,  2 Jan 2026 20:09:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 665923191BD;
	Fri,  2 Jan 2026 20:09:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="vO8kVrAz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A24283FD9;
	Fri,  2 Jan 2026 20:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767384548; cv=none; b=n6A4A0Bh90TP0GMHph2ZxGCYKwXSRYtcsRiBtnKTQW06lNBgypOJ0UAVLsOMUrxnah5I0g4y0t8SgDJah02+DjnFjRIxUFXp6tZrvf63SSvuxXCdWtgaDrCrk+hR3Ns5/VML1+7DyodzOY2lfn4rzeYtSb8LEB3rZv2cwdAbeQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767384548; c=relaxed/simple;
	bh=oymSXkxOcDYFhq/jwF9K5FzcF4xS6NMFspHfgFjDGig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=du0G97us1DaMGtz9EXubkASKrNviRV1x/tLhWvNqsgOTPZeemvgjx/zCbY89fuNEplk/ir6Snv+9AX2V7zDyJEKi6JSNkT3GdSQEQCtqqNA4P+akp/BpjEKNL1OmBPAjl+djrPgOaffgvOH3MYdWN/gD9BDUgxJavaGHCt6RdPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=vO8kVrAz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBE8FC116B1;
	Fri,  2 Jan 2026 20:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767384547;
	bh=oymSXkxOcDYFhq/jwF9K5FzcF4xS6NMFspHfgFjDGig=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vO8kVrAzBRdUzZl74ZLoIMjM8wytaZ/P3K9bABpN61psf+OVeohnyZB7WCUG8odlO
	 QyB0yZE6PW6ZcX+CKrUJd5z7BlnrESm0l7cQsAgCGo8quagRLwGdxiorOl3Dvq1Gog
	 +3uw1qbCpAXnlFlOJtyAO0JmXOmxDHkcHbeYX6w3JZJbGdoOnYIL1BIEaL0wM/x4AW
	 n4kxivQSPdhwlhjgYFkZWG3Z8Uso4elt7di5eMzbzK+WSnqEKkuRt3/C/v5hYh8IUv
	 +APXknpy/l+zLcpKM5xuiH6tu5xmmoC6ycxaOf3R/5gdB3uJIaxOnQXif6hR4bk/HE
	 9Sqnmp/483agA==
Date: Fri, 2 Jan 2026 14:09:04 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>, 
	konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	sumit.garg@kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: ipq9574: Enable eMMC variant
Message-ID: <nbmkrvppluonhvs7gjttsyw2nvxq45y44rz6f5w2ytci2mq3sx@m7c5nc5pujll>
References: <20260102104638.3802715-1-varadarajan.narayanan@oss.qualcomm.com>
 <e00630b9-56f0-4a30-84ef-8b691ea7af3e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e00630b9-56f0-4a30-84ef-8b691ea7af3e@kernel.org>

On Fri, Jan 02, 2026 at 12:08:03PM +0100, Krzysztof Kozlowski wrote:
> On 02/01/2026 11:46, Varadarajan Narayanan wrote:
> > RDP433 can have NAND or eMMC based on a board level rework. Since the
> > same GPIOS are used for both the interfaces, only one of them can be
> > used. Add a new DTS file to disable NAND and enable eMMC.
> > 
> > Signed-off-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
> > ---
> >  arch/arm64/boot/dts/qcom/Makefile             |  2 +-
> >  .../boot/dts/qcom/ipq9574-rdp-common.dtsi     | 32 +++++++++++++++++++
> >  .../boot/dts/qcom/ipq9574-rdp433-emmc.dts     | 26 +++++++++++++++
> >  3 files changed, 59 insertions(+), 1 deletion(-)
> >  create mode 100644 arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> > index 6f34d5ed331c..d5fe12ef4300 100644
> > --- a/arch/arm64/boot/dts/qcom/Makefile
> > +++ b/arch/arm64/boot/dts/qcom/Makefile
> > @@ -26,7 +26,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk01.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c1.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq8074-hk10-c2.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp418.dtb
> > -dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb
> > +dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp433.dtb ipq9574-rdp433-emmc.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp449.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp453.dtb
> >  dtb-$(CONFIG_ARCH_QCOM)	+= ipq9574-rdp454.dtb
> > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > index bdb396afb992..e4ae79b2fcd9 100644
> > --- a/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp-common.dtsi
> > @@ -169,6 +169,38 @@ data-pins {
> >  			bias-disable;
> >  		};
> >  	};
> > +
> > +	sdc_default_state: sdc-default-state {
> > +		clk-pins {
> > +			pins = "gpio5";
> > +			function = "sdc_clk";
> > +			drive-strength = <8>;
> > +			bias-disable;
> > +		};
> > +
> > +		cmd-pins {
> > +			pins = "gpio4";
> > +			function = "sdc_cmd";
> > +			drive-strength = <8>;
> > +			bias-pull-up;
> > +		};
> > +
> > +		data-pins {
> > +			pins = "gpio0", "gpio1", "gpio2",
> > +			       "gpio3", "gpio6", "gpio7",
> > +			       "gpio8", "gpio9";
> > +			function = "sdc_data";
> > +			drive-strength = <8>;
> > +			bias-pull-up;
> > +		};
> > +
> > +		rclk-pins {
> > +			pins = "gpio10";
> > +			function = "sdc_rclk";
> > +			drive-strength = <8>;
> > +			bias-pull-down;
> > +		};
> > +	};
> >  };
> >  
> >  &qpic_bam {
> > diff --git a/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > new file mode 100644
> > index 000000000000..ffd96b1b1c65
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/qcom/ipq9574-rdp433-emmc.dts
> > @@ -0,0 +1,26 @@
> > +// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
> 
> Odd license. We don't take GPL v3.
> 
> > +/*
> > + * IPQ9574 RDP433 eMMC board variant device tree source
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "ipq9574-rdp433.dts"
> 
> I find it discouraged practice. Although if Bjorn is fine with it, you
> still need proper compatibles.
> 

Nah, I don't fancy including .dts files. But I do see that I've let a
few of those slip by over the years.

The general approach for these cases has been to rename dts->dtsi and
create the two dts files.

I wonder though if this would be better served by an overlay, as it's
the same board, but with modifications applied?

Regards,
Bjorn

> 
> Best regards,
> Krzysztof

