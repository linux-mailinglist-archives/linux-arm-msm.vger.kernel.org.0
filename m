Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACB1B2C9639
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Dec 2020 05:06:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727747AbgLAEGN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 23:06:13 -0500
Received: from mail.kernel.org ([198.145.29.99]:58730 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726614AbgLAEGN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 23:06:13 -0500
Received: from localhost (unknown [122.171.214.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 65A1120796;
        Tue,  1 Dec 2020 04:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606795532;
        bh=2OK+ExAUKd0IaIVcQ3jj486gGIRF4rdHEDnUge4706c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=pnyMtWvQVsz2lIeGY8wuzfr3Oasr0kw+zGQ03uTvS8AxkKH35hIu5lxcm1WT18EyK
         KeqsePC/QNdw/crX9N2R609oiU1dJ+223Rcizj6z8s0mqyJsT5jF3DftdKV48RnkLz
         Wo+0C0LNBW85CCaK4+XcCS/xGwuunBkj/pSCvrW8=
Date:   Tue, 1 Dec 2020 09:35:27 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: sdm845: Add gpi dma node
Message-ID: <20201201040527.GX8403@vkoul-mobl>
References: <20201130063946.2060317-1-vkoul@kernel.org>
 <X8W2Y9gH7HBrx20v@builder.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <X8W2Y9gH7HBrx20v@builder.lan>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 30-11-20, 21:20, Bjorn Andersson wrote:
> On Mon 30 Nov 00:39 CST 2020, Vinod Koul wrote:
> 
> > This add the device node for gpi_dma0 and gpi_dma1 instances found in
> > sdm845.
> > 
> > Signed-off-by: Vinod Koul <vkoul@kernel.org>
> > ---
> >  arch/arm64/boot/dts/qcom/sdm845.dtsi | 45 ++++++++++++++++++++++++++++
> >  1 file changed, 45 insertions(+)
> > 
> > diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > index 6465a6653ad9..a6f41678794c 100644
> > --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> > @@ -1114,6 +1114,28 @@ opp-128000000 {
> >  			};
> >  		};
> >  
> > +		gpi_dma0: dma-controller@800000 {
> > +			#dma-cells = <3>;
> 
> I know you like dma, but may I have the compatible etc first in the
> nodes? Perhaps move #dma-cells down by the other dma- properties?

Sure thing

> 
> > +			compatible = "qcom,sdm845-gpi-dma";
> > +			reg = <0 0x00800000 0 0x60000>;
> > +			interrupts = <GIC_SPI 244 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 245 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 250 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 255 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 256 IRQ_TYPE_LEVEL_HIGH>;
> > +			dma-channels = <13>;
> > +			dma-channel-mask = <0xfa>;
> > +			iommus = <&apps_smmu 0x0016 0x0>;
> > +		};
> > +
> >  		qupv3_id_0: geniqup@8c0000 {
> >  			compatible = "qcom,geni-se-qup";
> >  			reg = <0 0x008c0000 0 0x6000>;
> > @@ -1454,6 +1476,29 @@ uart7: serial@89c000 {
> >  			};
> >  		};
> >  
> > +		gpi_dma1: dma-controller@0xa00000 {
> > +			#dma-cells = <3>;
> > +			compatible = "qcom,sdm845-gpi-dma";
> > +			reg = <0 0x00a00000 0 0x60000>;
> > +			interrupts = <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> > +				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
> > +			dma-channels = <13>;
> > +			dma-channel-mask = <0xfa>;
> > +			iommus = <&apps_smmu 0x06d6 0x0>;
> > +			status = "disabled";
> 
> I don't think it's nice to keep gpi_dma0 enabled and gpi_dma1 disabled.
> Either we do both enabled in sdm845.dtsi or we do both disabled and rely
> on the boards to enable what they need.

Yeah sure, I think enabling them in a board dtsi makes sense, since this
depends on the firmware support..

I will send v2 with updates

Thanks
-- 
~Vinod
