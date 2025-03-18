Return-Path: <linux-arm-msm+bounces-51820-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CB01A67CD7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 20:12:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 110BB1883048
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Mar 2025 19:12:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8910212FA0;
	Tue, 18 Mar 2025 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="awSUQwf/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CF69169AE6;
	Tue, 18 Mar 2025 19:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742325140; cv=none; b=bmJ0xIkyM93ErUcg6LBvQFVC4L5BTqTSXeX0fETh5g3YkxpYYYbEFU4/r+4IX3N0S89CzAPY0KTESVwFegum7zacU3C8v5dWMPe6l8Ny4dc/o5GNowsay/PXfua7BCHnhJDAL84z0x0M2VJ/v6kYXW1s1P+03TW76TF+ofMKNuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742325140; c=relaxed/simple;
	bh=YNE5Q/GfgFLSTxbAB2JpAeElCAdlwQb2a23NbZp60hU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EFf/DEGKcpOLnAjpWwZPwzZiLmBM0fympGxHIOl1gdVnEdR6J5O0BFUfSZphFoKPPsLuA9+uvN/kMhd8UDpfEZjUUMdbwhxjClJHPGAVy/62FoCaJ8JCOuxjYN5sJ+GJ2N/M4qeIcNAPKQiI++LVK2z1lOHktn6jvPwzQkjjG8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=awSUQwf/; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FCB3C4CEDD;
	Tue, 18 Mar 2025 19:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742325140;
	bh=YNE5Q/GfgFLSTxbAB2JpAeElCAdlwQb2a23NbZp60hU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=awSUQwf/S723XN1JF1enEW45LmpQT9MDt/73J/aE+KIkViavHHXuZt2/hl3H00g1x
	 0N3yZo5k1CaMcRKkqwWgQu7iX5QJhbJblHBeCySjZeo39yEgOfu6g1+ZMBgndlIMFA
	 +3OdfYTq7VxgmJpxBeFBEyVd2uWtRGUet/QInk0IFe913V01cYG8TEb40/gtlMOWF5
	 tQh333H+5wuvQJxqaKXcd19vGWFwch97s/OzV0smnsxCd2qVjM5TifsBfHI2SA8zIR
	 vgHk9+DGJjxD8n3ORdvVldLvViCT4vixjZtCY7ERcQIUw0iMKEaD65orJEBbPP6lDw
	 2Uv6G2YExGyzg==
Date: Tue, 18 Mar 2025 14:12:15 -0500
From: Bjorn Andersson <andersson@kernel.org>
To: Dmitry Baryshkov <lumag@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
	Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
	Wesley Cheng <quic_wcheng@quicinc.com>, Saravana Kannan <saravanak@google.com>, 
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.li@nxp.com>, linux-arm-msm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 6/7] usb: dwc3: qcom: Transition to flattened model
Message-ID: <3kfzffnialw62mpsovwiaa5abcwsx5jzgfuyigd3hauxbc6pnh@acyz2cv6rvba>
References: <20250226-dwc3-refactor-v4-0-4415e7111e49@oss.qualcomm.com>
 <20250226-dwc3-refactor-v4-6-4415e7111e49@oss.qualcomm.com>
 <vn7nrxpga7ewyqr7hpiczsn63qo2z4qzenif6powryqrtmnwjs@23jp6c7qdvxt>
 <u2u3mkybodsk3neura7nvhgd6iwky5cjkbqwpcs3rn3tm7dzpq@ecah6hnm4t6g>
 <ffm23zhsp4ksbgmk6slehc2pcy47i5xb7eqhuf6ixlphoj7lbv@o524z6na3mtr>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ffm23zhsp4ksbgmk6slehc2pcy47i5xb7eqhuf6ixlphoj7lbv@o524z6na3mtr>

On Tue, Mar 11, 2025 at 09:02:03PM +0200, Dmitry Baryshkov wrote:
> On Mon, Mar 10, 2025 at 09:46:24PM -0500, Bjorn Andersson wrote:
> > On Fri, Mar 07, 2025 at 08:41:33AM +0200, Dmitry Baryshkov wrote:
> > > On Wed, Feb 26, 2025 at 04:17:53PM -0800, Bjorn Andersson wrote:
> > > > The USB IP-block found in most Qualcomm platforms is modelled in the
> > > > Linux kernel as 3 different independent device drivers, but as shown by
> > > > the already existing layering violations in the Qualcomm glue driver
> > > > they can not be operated independently.
> > > > 
> > > > With the current implementation, the glue driver registers the core and
> > > > has no way to know when this is done. As a result, e.g. the suspend
> > > > callbacks needs to guard against NULL pointer dereferences when trying
> > > > to peek into the struct dwc3 found in the drvdata of the child.
> > > > Even with these checks, there are no way to fully protect ourselves from
> > > > the race conditions that occur if the DWC3 is unbound.
> > > > 
> > > > Missing from the upstream Qualcomm USB support is handling of role
> > > > switching, in which the glue needs to be notified upon DRD mode changes.
> > > > Several attempts has been made through the years to register callbacks
> > > > etc, but they always fall short when it comes to handling of the core's
> > > > probe deferral on resources etc.
> > > > 
> > > > Moving to a model where the DWC3 core is instantiated in a synchronous
> > > > fashion avoids above described race conditions.
> > > > 
> > > > It is however not feasible to do so without also flattening the
> > > > DeviceTree binding, as assumptions are made in the DWC3 core and
> > > > frameworks used that the device's associated of_node will the that of
> > > > the core. Furthermore, the DeviceTree binding is a direct
> > > > representation of the Linux driver model, and doesn't necessarily
> > > > describe "the USB IP-block".
> > > > 
> > > > The Qualcomm DWC3 glue driver is therefor transitioned to initialize and
> > > > operate the DWC3 within the one device context, in synchronous fashion.
> > > > 
> > > > To provide a limited time backwards compatibility, a snapshot of the
> > > > driver is retained in a previous commit. As such no care is taken in the
> > > > dwc3-qcom driver for the qcom,dwc3 backwards compatibility.
> > > > 
> > > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > > ---
> > > >  drivers/usb/dwc3/dwc3-qcom.c | 138 +++++++++++++++++++++----------------------
> > > >  1 file changed, 69 insertions(+), 69 deletions(-)
> > > > 
> > > > diff --git a/drivers/usb/dwc3/dwc3-qcom.c b/drivers/usb/dwc3/dwc3-qcom.c
> > > > index 9d04c2457433..63e60f15ceaa 100644
> > > > --- a/drivers/usb/dwc3/dwc3-qcom.c
> > > > +++ b/drivers/usb/dwc3/dwc3-qcom.c
> > > > @@ -4,7 +4,6 @@
> > > >   * Inspired by dwc3-of-simple.c
> > > >   */
> > > >  
> > > > -#include <linux/cleanup.h>
> > > >  #include <linux/io.h>
> > > >  #include <linux/of.h>
> > > >  #include <linux/clk.h>
> > > > @@ -14,7 +13,6 @@
> > > >  #include <linux/kernel.h>
> > > >  #include <linux/extcon.h>
> > > 
> > > As a heads up, would it make sense to also drop extcon support while we
> > > are transitioning to the new driver / DT bindings?
> > > 
> > 
> > Yes, I believe this code should be cleaned out in favor of relying on
> > the core's implementation thereof and callbacks into the qcom-code for
> > configuration the glue hardware - which looks to be the same callback we
> > want to add for the usb_role_switch.
> 
> Hmm. So do you want to clean it later? Or do you plan to drop extcon
> from the next iteration?
> 

It turns out that this was cleaner to do as a separate commit, but as we
need a role-switch callback from core to glue (Krishna has a patch ready
to go for this) and I don't have any extcon hardware at my desk right
now I decided to leave a TODO in the code for now.

This needs to be resolved before we transition the extcon-based dts
files.

Regards,
Bjorn

> > 
> > Regards,
> > Bjorn
> > 
> > > >  #include <linux/interconnect.h>
> > > > -#include <linux/of_platform.h>
> > > >  #include <linux/platform_device.h>
> > > >  #include <linux/phy/phy.h>
> > > >  #include <linux/usb/of.h>
> > > 
> > > -- 
> > > With best wishes
> > > Dmitry
> 
> -- 
> With best wishes
> Dmitry

