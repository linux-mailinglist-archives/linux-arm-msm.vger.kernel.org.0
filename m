Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 598652EAF75
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:53:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728228AbhAEPxn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:53:43 -0500
Received: from mail.kernel.org ([198.145.29.99]:35940 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727608AbhAEPxn (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:53:43 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 593DD22BEF;
        Tue,  5 Jan 2021 15:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861983;
        bh=xWEJS8GDTSpkO3OzqXkfzV+lNWupPOWtAnczIHx2Lx8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=B/ppEpy/tc/laG9VNg/E8Mpp7hSfvHx02dBbA0oxyaMbZ9z08O5fMm2rw6CR72dkL
         vL1IU4mWOaG8g1dl3xkwJbUHiXi6GV4wg4/uiGEfUAD8vzIL674Z/9ysP4Ecj3Wfuq
         FtbwrQOQZnAZgY4UD2tCFlGyQmruQCFIoMrxsUKZnilINGQib8yIQIXIJkN9bqjr6t
         qYQn340O8oR0zuNeJcRqt6NHWYTH3lGa40TbdbMPCIfPK7dNbMrWrO3hvmHfMYmo/Q
         M/YvP30lSqAgmKC1dJxoolufWqeOGnYg7QfKElsVfWE2r4GKqNBiBCbQ15zaMMgDR1
         i0zcE5RcJ85Lg==
Date:   Tue, 5 Jan 2021 21:22:59 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 04/18] ARM: dts: qcom: sdx55: Add support for SDHCI
 controller
Message-ID: <20210105155259.GI2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-5-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-5-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> Add devicetree support for SDHCI controller found in Qualcomm SDX55 SoC.
> The SDHCI controller used in this SoC is based on the MSM SDHCI v5 IP.
> Hence, the support is added by reusing the existing sdhci driver with
> "qcom,sdhci-msm-v5" as the fallback.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index eeb6bf392f93..3f8e98bfc020 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -154,6 +154,18 @@ blsp1_uart3: serial@831000 {
>  			status = "disabled";
>  		};
>  
> +		sdhc_1: sdhci@8804000 {

Any reason why this is sdhc_1 label, do we have another one..?

> +			compatible = "qcom,sdx55-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0x08804000 0x1000>;
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_LEVEL_HIGH>,
> +				     <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
> +				 <&gcc GCC_SDCC1_APPS_CLK>;
> +			clock-names = "iface", "core";
> +			status = "disabled";
> +		};
> +
>  		pdc: interrupt-controller@b210000 {
>  			compatible = "qcom,sdx55-pdc", "qcom,pdc";
>  			reg = <0x0b210000 0x30000>;
> -- 
> 2.25.1

-- 
~Vinod
