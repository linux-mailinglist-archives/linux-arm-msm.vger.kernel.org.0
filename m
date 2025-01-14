Return-Path: <linux-arm-msm+bounces-45052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0635CA11455
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 23:46:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9C1D03A5803
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 22:46:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 267CB20CCCF;
	Tue, 14 Jan 2025 22:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOdmhHn2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84C71D47BD;
	Tue, 14 Jan 2025 22:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736894805; cv=none; b=W6/Q/kj3P9gyXqqVTkh4+hnoLB4271Tj+v9srWd05Zz6yt/MISvDRIYyIyqOmxyV3guOmvrPKIfAWBR+U1wBbYv8JJT0Nq6TSjFxgfjH7Re1s1qi/Syj2rBsdNlcCs0A+tZbsTfpLn6AwBOWhPjsD8bWV5555HcqIsQzf5BWWc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736894805; c=relaxed/simple;
	bh=wtRYAsEqANErYEMs5FdUR4HrHln+NmBeAq6yC2QeyFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D6L1sPHwwo5G7V22cSl3CXjiQGRo4RYRQzuBA7DEcUhXpuPntGkhUs0Gvj+0kLG9IAhfDaYw8Sh+mO7BXkSs9DVxCTtFASCGl37qjHjNsuHM+JWtJ5l2spAaAOhvSM+Skpl2eRpVwbe1asgHnx1+EIRiw/UuGQuZ1RAVyB0Qwcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOdmhHn2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EBD7C4CEDD;
	Tue, 14 Jan 2025 22:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736894804;
	bh=wtRYAsEqANErYEMs5FdUR4HrHln+NmBeAq6yC2QeyFI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KOdmhHn2WV5PYB2Gre/O4QTnKp/sZOc+Dvkn0BmB068IWWzSsUTDC6RlzrFsmJI4S
	 upozA5i4diLAN01F85FIM/y+jiVtr2PGK1Cv7KDPsyPQmgp/S25uDipjBtdEflO0C+
	 5ELtLFXuyweCPTR1lfvELTYpm0MVre9okuVNH2/s4ZXyHaFuk2Xjk8/bzW6biv8izl
	 unqlW1mdP0i520Er+K9l1IE3h4S++5TuRoFuq/vP+qgbiEnHGNJqhDzNfFduavq5g5
	 R6PIxSJLugJrbLJwT5t85/A1QrRG4BsSjZjsgUOndqxRUwgEANGT0MSd4aBMOEU3fj
	 4yUkNbM+bhB9g==
Date: Tue, 14 Jan 2025 16:46:41 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 06/12] of: overlays: dwc3-flattening: Add Qualcomm
 Arm64 board overlays
Message-ID: <7krlwxqealxptxjx63fi7ne4j4felo2n2t4mkxmmimnrax4jxt@wiwrbgu53wmu>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250113-dwc3-refactor-v3-6-d1722075df7b@oss.qualcomm.com>
 <20250114174248.GA1414434-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250114174248.GA1414434-robh@kernel.org>

On Tue, Jan 14, 2025 at 11:42:48AM -0600, Rob Herring wrote:
> On Mon, Jan 13, 2025 at 09:11:39PM -0800, Bjorn Andersson wrote:
[..]
> > +dwc3-flattening-overlay-y += dwc3-qcom_sm8250_xiaomi_elish.dtb.o
> > +dwc3-flattening-overlay-y += dwc3-qcom_sm8350.dtb.o
> > +dwc3-flattening-overlay-y += dwc3-qcom_sm8350_qcom_sm8350_hdk.dtb.o
> > +dwc3-flattening-overlay-y += dwc3-qcom_sm8450.dtb.o
> > +dwc3-flattening-overlay-y += dwc3-qcom_sm8550.dtb.o
> > +dwc3-flattening-overlay-y += dwc3-qcom_sm8650.dtb.o
> > +dwc3-flattening-overlay-y += dwc3-qcom_x1e80100.dtb.o
> > +dwc3-flattening-overlay-y += dwc3-qcom_x1e80100_hp_omnibook_x14.dtb.o
> 
> Some of these platforms are quite new. I think they could tolerate a 
> flag day. It's your fault for knowing this is a problem and continuing 
> to accept new users...
> 

Yes, I agree. But as the timeline for bringing a solution to the table
has been unknown I don't think it would make sense to keep thing hostage.

> For the ones we do maintain compatibility, I would like to define some 
> timeframe for doing so. This would be a lot of stuff to keep forever. I 
> suspect the ABI gets broken anyways and/or there are new features 
> enabled.
> 

Absolutely. The majority of the involved boards are booted off an
Android bootimg, which mostly implies that the DTB would come with the
kernel - so we don't need to keep things around for long.

The exception that comes to mind is the WoS laptops, where people
do have UEFI or DtbLoader EFI application load a DTB which isn't
automatically upgraded by their Linux distro - so for those it makes
sense to keep things around longer. That said, for most of these, things
are still evolving, so users should want to upgrade anyways.

The features that this will enable us to implement in the USB drivers
are things like reliable USB role switch, for which I don't see there to
be any DT impact...


TL;DR I think we could start remove some of these after 1 or 2 releases,
and perhaps keep the WoS ones around for another LTS. Doesn't that sound
reasonable? Would you like this documented in some particular way?

> > diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
> > index 0a3a31c5088b..d33cdf6661c0 100644
> > --- a/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
> > +++ b/drivers/of/overlays/dwc3-flattening/dwc3-flattening.c
> > @@ -21,6 +21,24 @@ struct dwc3_overlay_data {
> >  	const char *migrate_match;
> >  };
> >  
> > +static const struct dwc3_overlay_data dwc3_qcom_apq8094_overlay = {
> 
> Can't all these be init section? It's a lot of bloat for everyone else 
> otherwise. Same issue for the overlays themselves. The one that you 
> apply should be copied out of init.
> 

That we should be able to do.

> > +	.fdt = __dtb_dwc3_qcom_apq8094_begin,
> > +	.end = __dtb_dwc3_qcom_apq8094_end,
> > +	.migrate_match = "qcom,dwc3",
> 
> This is the same everywhere AFAICT, so why do we need it?
> 

This was the only thing in the implementation that was
Qualcomm-specific, and Frank expressed interest in trying this out for
NXP as well. But we could certainly postpone this until the first
non-qcom,dwc3 user comes along (if that happens).

> > +};
> > +
[..]
> > diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts
> > new file mode 100644
> > index 000000000000..8ca699460ec3
> > --- /dev/null
> > +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8992.dts
> > @@ -0,0 +1,32 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	fragment@0 {
> > +		target-path = "/soc@0/usb@f92f8800";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		interrupt-parent = <&intc>;
> > +
> > +		__overlay__ {
> > +			compatible = "qcom,msm8994-dwc3", "qcom,snps-dwc3";
> 
> Should be 8992? If not, this is the same as the next overlay.
> 

This follows the existing dtb, where msm8992.dtsi inherits msm8994 and
overwrites a few properties.

> > +			reg = <0xf9200000 0xd000>;
> > +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 311 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 310 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "qusb2_phy",
> > +					  "hs_phy_irq",
> > +					  "ss_phy_irq";
> > +		};
> > +	};
> > +};
[..]
> > diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts
> > new file mode 100644
> > index 000000000000..7a583de320cf
> > --- /dev/null
> > +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3.dts
> > @@ -0,0 +1,56 @@
> > +// SPDX-License-Identifier: BSD-3-Clause
> > +/*
> > + * Copyright (c) 2025 Qualcomm Innovation Center, Inc. All rights reserved.
> > + */
> > +/dts-v1/;
> > +/plugin/;
> > +
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> > +/ {
> > +	fragment@0 {
> > +		target-path = "/soc@0/usb@6af8800";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		interrupt-parent = <&intc>;
> > +
> > +		__overlay__ {
> > +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> > +			reg = <0x06a00000 0xd000>;
> > +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 180 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "qusb2_phy",
> > +					  "hs_phy_irq",
> > +					  "ss_phy_irq";
> 
> No SS phy, so should be dropped? OTOH, less variation if you keep it.
> 

It's msm8996 and that has a SuperSpeed PHY. As such, the "phys" below is
wrong, and probably done so in order to disable SuperSpeed...

I did reflect on a number of these and would like us to revisit them,
but the overlay matches the current behavior.

> You can utilize includes in overlays just like base .dts files. So this 
> one really just needs to include the previous overlay and override phys 
> and phy-names.
> 

Okay, will give that a try.

> > +			phys = <&hsusb_phy1>;
> > +			phy-names = "usb2-phy";
> > +		};
> > +	};
> > +
> > +	fragment@1 {
> > +		target-path = "/soc@0/usb@76f8800";
> > +		#address-cells = <1>;
> > +		#size-cells = <1>;
> > +		interrupt-parent = <&intc>;
> > +
> > +		__overlay__ {
> > +			compatible = "qcom,msm8996-dwc3", "qcom,snps-dwc3";
> > +			reg = <0x07600000 0xd000>;
> > +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>;
> > +			interrupt-names = "dwc_usb3",
> > +					  "pwr_event",
> > +					  "qusb2_phy",
> > +					  "hs_phy_irq";
> > +			phys = <&hsusb_phy2>;
> > +			phy-names = "usb2-phy";
> > +		};
> > +	};
> > +};
> > diff --git a/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts
> > new file mode 100644
> > index 000000000000..7a583de320cf
> > --- /dev/null
> > +++ b/drivers/of/overlays/dwc3-flattening/dwc3-qcom_msm8996_oneplus_oneplus3t.dts
> 
> This looks pretty much like the prior one?
> 

Yes, I generated these to be 1:1 with the compatibles, which matches on
the specific board compatible. If we're in agreement on the general
approach I can go back and spend more time consolidating these.

Regards,
Bjorn

