Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBCF62EAF6B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  5 Jan 2021 16:53:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726177AbhAEPvr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 5 Jan 2021 10:51:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:35548 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726151AbhAEPvr (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 5 Jan 2021 10:51:47 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id E497A2070C;
        Tue,  5 Jan 2021 15:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1609861866;
        bh=fB7DILzFG2er5EQn0lFq8H/TKxu8kUjixf+SUC4mKvA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=KQhLM45DqPNf0xe9jXxPjMGd0sPxBi+J3wpPiPQf/+ATAgR69U5ai/ZvKwjAFbwUi
         i2fRpgcIGXgjo0CswO0Ksoy51LSYgWWLRaw9nPQwuY5diBZcQz0gfaSJEnTwF47KiK
         24BPqDLFfnFqEqqxtvEfsaM0FdnASoRLTOrQtwm7lJ+0pw5URNrl9m++Ug+N2Ndq5x
         5hpbYyRO9wJ3yvUSNQ5CzbOJ52bvAoO4qJdi5zyvVzEm80ArNSXoSkDcaL7PR3mxmo
         anUMH4DBXGMQWK9Jf+Uoj7S1dBUVqlmr9iVm20Eq8BuuNwJKCrEzC5He6l1Itp8UW1
         0kNomuLFNMa2A==
Date:   Tue, 5 Jan 2021 21:21:02 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 10/18] ARM: dts: qcom: sdx55: Add QPIC NAND support
Message-ID: <20210105155102.GD2771@vkoul-mobl>
References: <20210105122649.13581-1-manivannan.sadhasivam@linaro.org>
 <20210105122649.13581-11-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210105122649.13581-11-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 05-01-21, 17:56, Manivannan Sadhasivam wrote:
> Add qpic_nand node to support QPIC NAND controller on SDX55 platform.
> Since there is no "aon" clock in SDX55, a dummy clock is provided.
> 
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> ---
>  arch/arm/boot/dts/qcom-sdx55.dtsi | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/qcom-sdx55.dtsi b/arch/arm/boot/dts/qcom-sdx55.dtsi
> index 1b9b990ad0a2..1a6947753972 100644
> --- a/arch/arm/boot/dts/qcom-sdx55.dtsi
> +++ b/arch/arm/boot/dts/qcom-sdx55.dtsi
> @@ -41,6 +41,12 @@ pll_test_clk: pll-test-clk {
>  			#clock-cells = <0>;
>  			clock-frequency = <400000000>;
>  		};
> +
> +		nand_clk_dummy: nand-clk-dummy {

Why dummy..? 
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <32000>;

Is this sleep clock of platform..?

> +		};
>  	};
>  
>  	cpus {
> @@ -178,6 +184,22 @@ qpic_bam: dma@1b04000 {
>  			status = "disabled";
>  		};
>  
> +		qpic_nand: nand@1b30000 {
> +			compatible = "qcom,sdx55-nand";
> +			reg = <0x01b30000 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&rpmhcc RPMH_QPIC_CLK>,
> +				 <&nand_clk_dummy>;
> +			clock-names = "core", "aon";
> +
> +			dmas = <&qpic_bam 0>,
> +			       <&qpic_bam 1>,
> +			       <&qpic_bam 2>;
> +			dma-names = "tx", "rx", "cmd";
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
