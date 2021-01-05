Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 155232EAF69
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728365AbhAEPuy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:50:54 -0500
Received: from mail.kernel.org ([198.145.29.99]:35326 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727981AbhAEPux (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:50:53 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 864992229C;
        Tue,  5 Jan 2021 15:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861813;
        bh=lAc+rT1cJkxfHk8/d1AQ+P73hS/lVX/q/A/ZHzG/IVg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=QBreekGEEtz1d1MzTYPOYzTCyVqCyk97H+BUlt1/RQoiu3Kav7UheZVT7lttyoGVy
         JNgQo8NuXNfPh6PBbR34P/IcCAiMazqQhIdDfhg5WeTWAvz3FCXv6twLDIBZxTjLrZ
         Dg1eDCTJt5Zxiz2F4NduXHdwHpgUvGbh4ANhRwC1JtjWt/0xAEt0EqfkC9G3l1qUJl
         OIl1v4deeurs5adhqjCXHADxOHh5sFT2j7UdXp9A8lSRDwOa0zluA7i2zLzUytZ8FT
         zwSgi48hfuJ3QEmLoQKUwBwrz0C86+WgINWEi1ML/moCz8KoyejIsswwPViAYN4+Qe
         CwNiHPHoTO1CQ==
Date:   Tue, 5 Jan 2021 21:20:09 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/18] ARM: dts: qcom: sdx55: Add QPIC BAM support
Message-ID: <20210105155009.GC2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-10-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-10-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> Add qpic_bam node to support QPIC BAM DMA controller on SDX55 platform.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index 622a63b0058f..1b9b990ad0a2 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -166,6 +166,18 @@ sdhc_1: sdhci@8804000 {
>  			status = "disabled";
>  		};
>  
> +		qpic_bam: dma@1b04000 {
> +			compatible = "qcom,bam-v1.7.0";
> +			reg = <0x01b04000 0x1c000>;
> +			interrupts = <GIC_SPI 135 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&rpmhcc RPMH_QPIC_CLK>;
> +			clock-names = "bam_clk";
> +			#dma-cells = <1>;
> +			qcom,ee = <0>;
> +			qcom,controlled-remotely;
> +			status = "disabled";
> +		};
> +
>  		tcsr_mutex_block: syscon@1f40000 {
>  			compatible = "syscon";
>  			reg = <0x1f40000 0x20000>;
> -- 
> 2.25.1

-- 
~Vinod
