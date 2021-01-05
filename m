Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D0C562EAF81
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:56:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727680AbhAEP4c (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:56:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:36404 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726957AbhAEP4b (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:56:31 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4F1D92229C;
        Tue,  5 Jan 2021 15:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609862151;
        bh=Tdr2seup28Wp8XeV4gbdnasIDJIS7gY6N54U8vA1UN8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=JyqhN7o1rAh5WY1shRSUx+GJYCYb4ONa/TlvaYaBlCJLviA1MM/jOqIFZNVnklc+L
         izPJsdkE7FR35dFg4Bco99nP76rL8GeXzYWNvMJO6+bcaf8U/6sQkVsPfjQvIlkyDl
         DoPxYdHFlSCG55VYpGvbjiaRzGZzd27uDJCyjE2Coq9kJQJVAdMnv/n/CbJMMSx/Nb
         OTtUENYzW8aYn2Rb9fYtEaQ3kKPf1PLWfSkEAavgfGujZMPSqwKTB8aDQT5+mGOkcl
         L6Lp/2zsA3Qt8D9mpvjcatNl1DFYfX8Jz7+cuFVxv7PU7a1jNDKdz9QHeLswmxtYEp
         KFZpSAsYdeiDQ==
Date:   Tue, 5 Jan 2021 21:25:47 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/18] ARM: dts: qcom: sdx55: Add QPIC BAM support
Message-ID: <20210105155547.GK2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-10-manivannan.sadhasivam@linaro.org>
 <20210105155009.GC2771@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105155009.GC2771@vkoul-mobl>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 05-01-21, 21:20, Vinod Koul wrote:
> On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> > Add qpic_bam node to support QPIC BAM DMA controller on SDX55 platform.
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
> > 
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  arch/arm/boot/dts/qcom-sdx55.dtsi | 12 ++++++++++++
> >  1 file changed, 12 insertions(+)
> > 
> > diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> > index 622a63b0058f..1b9b990ad0a2 100644
> > --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> > +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> > @@ -166,6 +166,18 @@ sdhc_1: sdhci@8804000 {
> >  			status = "disabled";
> >  		};
> >  
> > +		qpic_bam: dma@1b04000 {

This should be dma-controller@

Also, please run dtbs_check on these patches

> > +			compatible = "qcom,bam-v1.7.0";
> > +			reg = <0x01b04000 0x1c000>;
> > +			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> > +			clocks = <&rpmhcc RPMH_QPIC_CLK>;
> > +			clock-names = "bam_clk";
> > +			#dma-cells = <1>;
> > +			qcom,ee = <0>;
> > +			qcom,controlled-remotely;
> > +			status = "disabled";
> > +		};
> > +
> >  		tcsr_mutex_block: syscon@1f40000 {
> >  			compatible = "syscon";
> >  			reg = <0x1f40000 0x20000>;
> > -- 
> > 2.25.1
> 
> -- 
> ~Vinod

-- 
~Vinod
