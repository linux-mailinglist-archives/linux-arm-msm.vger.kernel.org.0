Return-Path: <linux-arm-msm+bounces-45053-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BAB29A1146E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 23:56:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id AD4A6163E06
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Jan 2025 22:56:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2FBB2135BD;
	Tue, 14 Jan 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Xw977NWR"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66F0020AF6D;
	Tue, 14 Jan 2025 22:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736895363; cv=none; b=sOjiRK5YjdPezlKG3TNw2ymZ3O1XqHFx3WAMcfcnSdCVGneVgv3TNcz1hvenyIhGkKCW46cP1Gs5XYJCqhX6T0PNvy5awfctkIRheppCBNtwccKvxRzPDnoqfS3EMWyW8VnQs4WxQ8gXgc4u7vqvlpFftE0Xm35m4irnAKH4reM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736895363; c=relaxed/simple;
	bh=f00806oyHZJpBEDnTJ2T3SLsZTfFt2z1apea35SR2BU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WN2IkNr1Hk2AeHEmGIGG95aN/NMb5ExAZ109hBO3fOCDKd9MwcWlHLCY1o5nVM8BurJvdKUf1+8yzZjMTuCEHupH1yd/rVEHP3d5/jIij9U7aqqsTpWICRYs8xXn3M12fNmCpkeuf6DbDJ+mjjseF95fRY6Xw0LUHGhFwxcAPyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Xw977NWR; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6455C4CEDD;
	Tue, 14 Jan 2025 22:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736895362;
	bh=f00806oyHZJpBEDnTJ2T3SLsZTfFt2z1apea35SR2BU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Xw977NWRNeLSYebXySKQdHG9knR2/ZKBay/LkglnodiWiw0CtP9HwFcxrRoCIDjyG
	 fCOhjlmYpVcds5KBl4d890bZPVJuP2HgM4oHUGE4POUS6ao80Ke+Hh1LygM225od9a
	 MZfzv2qOca73Mjhv+Y/MMPfuIptzV3J7aB0IrHb0ffYiIvOBsEnemOTl+fDKO1vhxB
	 QGXiAe2LiOyd86ebroYK17jAgMLaxJqpGHHPqpWSa0LxwOOQ91pUPA8WeJsxrQF9mT
	 P+W7SGnUS4BrdGQYXmG7yWTgBl0GwW+c6Os2Df7NLxdPJ2FtbZTb5n9MsoMwXMBHav
	 yqH9HC2y4ZGRg==
Date: Tue, 14 Jan 2025 16:55:59 -0600
From: Bjorn Andersson <andersson@kernel.org>
To: Frank Li <Frank.li@nxp.com>
Cc: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Felipe Balbi <balbi@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
	Saravana Kannan <saravanak@google.com>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Konrad Dybcio <konradybcio@kernel.org>, 
	linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/12] usb: dwc3: core: Expose core driver as library
Message-ID: <3s77lvw4dp3cg2s6tqt63wuexft3pusfbg2ibteacnd5z2dolf@p7mb2j5j5jlz>
References: <20250113-dwc3-refactor-v3-0-d1722075df7b@oss.qualcomm.com>
 <20250113-dwc3-refactor-v3-8-d1722075df7b@oss.qualcomm.com>
 <Z4a+fyhInS7ETgKh@lizhi-Precision-Tower-5810>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z4a+fyhInS7ETgKh@lizhi-Precision-Tower-5810>

On Tue, Jan 14, 2025 at 02:43:59PM -0500, Frank Li wrote:
> On Mon, Jan 13, 2025 at 09:11:41PM -0800, Bjorn Andersson wrote:
> > The DWC3 IP block is handled by three distinct device drivers: XHCI,
> > DWC3 core and a platform specific (optional) DWC3 glue driver.
> >
> > This has resulted in, at least in the case of the Qualcomm glue, the
> > presence of a number of layering violations, where the glue code either
> > can't handle, or has to work around, the fact that core might not probe
> > deterministically.
> >
> > An example of this is that the suspend path should operate slightly
> > different depending on the device operating in host or peripheral mode,
> > and the only way to determine the operating state is to peek into the
> > core's drvdata.
> >
> > The Qualcomm glue driver is expected to make updates in the qscratch
> > register region (the "glue" region) during role switch events, but with
> > the glue and core split using the driver model, there is no reasonable
> > way to introduce listeners for mode changes.
> >
> > Split the dwc3 core platform_driver callbacks and their implementation
> > and export the implementation, to make it possible to deterministically
> > instantiate the dwc3 core as part of the dwc3 glue drivers and to
> > allow flattening of the DeviceTree representation.
> >
> > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > ---
> >  drivers/usb/dwc3/core.c | 149 ++++++++++++++++++++++++++++++------------------
> >  drivers/usb/dwc3/glue.h |  22 +++++++
> >  2 files changed, 117 insertions(+), 54 deletions(-)
> >
> > diff --git a/drivers/usb/dwc3/core.c b/drivers/usb/dwc3/core.c
> > index c22b8678e02e..930d812a9fbb 100644
> > --- a/drivers/usb/dwc3/core.c
> > +++ b/drivers/usb/dwc3/core.c
> > @@ -36,6 +36,7 @@
> >
> >  #include "core.h"
> >  #include "gadget.h"
> > +#include "glue.h"
> >  #include "io.h"
> >
> >  #include "debug.h"
> > @@ -2129,27 +2130,14 @@ static int dwc3_get_num_ports(struct dwc3 *dwc)
> >  	return 0;
> >  }
> >
> > -static int dwc3_probe(struct platform_device *pdev)
> > +int dwc3_init(struct dwc3 *dwc, struct resource *res)
> 
> Maybe need data struct, which included res. It may need pass down more
> information in future.
> 

Per this series we're resolving the race conditions stemming from
dwc3-qcom and core having different lifetimes, but more importantly it
will allow us to propose a mechanism for invoking role-switch events in
the glue code from the core - i.e. we are planning to add at least one
more argument here; so this proposal makes sense.

> >  {
> > -	struct device		*dev = &pdev->dev;
> > -	struct resource		*res, dwc_res;
> > +	struct device		*dev = dwc->dev;
> > +	struct resource		dwc_res;
> >  	unsigned int		hw_mode;
> >  	void __iomem		*regs;
> > -	struct dwc3		*dwc;
> >  	int			ret;
> >
> ...
> 
> > +++ b/drivers/usb/dwc3/glue.h
> > @@ -0,0 +1,22 @@
> > +/* SPDX-License-Identifier: GPL-2.0 */
> > +/*
> > + * glue.h - DesignWare USB3 DRD glue header
> > + */
> > +
> > +#ifndef __DRIVERS_USB_DWC3_GLUE_H
> > +#define __DRIVERS_USB_DWC3_GLUE_H
> > +
> > +#include <linux/types.h>
> > +#include "core.h"
> > +
> > +int dwc3_init(struct dwc3 *dwc, struct resource *res);
> > +void dwc3_uninit(struct dwc3 *dwc);
> > +
> > +int dwc3_runtime_suspend(struct dwc3 *dwc);
> > +int dwc3_runtime_resume(struct dwc3 *dwc);
> > +int dwc3_runtime_idle(struct dwc3 *dwc);
> > +int dwc3_suspend(struct dwc3 *dwc);
> > +int dwc3_resume(struct dwc3 *dwc);
> > +void dwc3_complete(struct dwc3 *dwc);
> 
> dwc3_usb_*()? There may be name polution in future. There are many IPs
> created by dwc.
> 

I thought dwc3 was uniquely associated with USB, but I don't have any
objections to your proposal.

Thanks,
Bjorn

> Frank
> 
> > +
> > +#endif
> >
> > --
> > 2.45.2
> >

