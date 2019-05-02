Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C60C111882
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 May 2019 13:51:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbfEBLvO (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 May 2019 07:51:14 -0400
Received: from mail.kernel.org ([198.145.29.99]:34070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726268AbfEBLvN (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 May 2019 07:51:13 -0400
Received: from localhost (unknown [171.76.113.243])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 24CE02081C;
        Thu,  2 May 2019 11:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1556797873;
        bh=4c4LQfXQVE08v5td1K/+nThtbJXOBTc9/qJt2A/+2+c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=t2kQ0mFpj73C1tCaMzXBgrFWY/FMwfrfeVgEHZFocgt5dubhERbcZme1mu0eDDn6f
         PO7DkNFNM6JvDKsKN0mFZtUS491601QpVQJuYfPRLvt6COPlsqjY/G9I17QExfFnUd
         T5d9ybzXcnpaVXN2sxWcZQPluYd3vNtqobvpVwZ4=
Date:   Thu, 2 May 2019 17:21:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        David Brown <david.brown@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: dts: qcom: qcs404: Add PCIe related nodes
Message-ID: <20190502115103.GL3845@vkoul-mobl.Dlink>
References: <20190502002408.10719-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190502002408.10719-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 01-05-19, 17:24, Bjorn Andersson wrote:
> The QCS404 has a PCIe2 PHY and a Qualcomm PCIe controller, add these to
> the platform dtsi and enable them for the EVB with the perst gpio
> and analog supplies defined.
> 
> Reviewed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---
> 
> The patch depends on the acceptance of:
> https://lore.kernel.org/lkml/20190502002138.10646-1-bjorn.andersson@linaro.org/
> https://lore.kernel.org/lkml/20190502001406.10431-2-bjorn.andersson@linaro.org/
> https://lore.kernel.org/lkml/20190502001955.10575-3-bjorn.andersson@linaro.org/
> 
> Changes since v2:
> - None
> 
>  arch/arm64/boot/dts/qcom/qcs404-evb.dtsi | 25 +++++++++
>  arch/arm64/boot/dts/qcom/qcs404.dtsi     | 67 ++++++++++++++++++++++++

I would have preferred the evb changes to follow the node addition but
that is matter of preference :)

>  2 files changed, 92 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> index 2c3127167e3c..988d21ca0df1 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404-evb.dtsi
> @@ -68,6 +68,22 @@
>  	};
>  };
>  
> +&pcie {
> +	status = "ok";
> +
> +	perst-gpio = <&tlmm 43 GPIO_ACTIVE_LOW>;
> +
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&perst_state>;
> +};
> +
> +&pcie_phy {
> +	status = "ok";
> +
> +	vdda-vp-supply = <&vreg_l3_1p05>;
> +	vdda-vph-supply = <&vreg_l5_1p8>;
> +};
> +
>  &remoteproc_adsp {
>  	status = "ok";
>  };
> @@ -184,6 +200,15 @@
>  };
>  
>  &tlmm {
> +	perst_state: perst {
> +		pins = "gpio43";
> +		function = "gpio";
> +
> +		drive-strength = <2>;
> +		bias-disable;
> +		output-low;
> +	};
> +
>  	sdc1_on: sdc1-on {
>  		clk {
>  			pins = "sdc1_clk";
> diff --git a/arch/arm64/boot/dts/qcom/qcs404.dtsi b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> index ffedf9640af7..f41feab8996c 100644
> --- a/arch/arm64/boot/dts/qcom/qcs404.dtsi
> +++ b/arch/arm64/boot/dts/qcom/qcs404.dtsi
> @@ -4,6 +4,7 @@
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/clock/qcom,gcc-qcs404.h>
>  #include <dt-bindings/clock/qcom,rpmcc.h>
> +#include <dt-bindings/gpio/gpio.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -383,6 +384,7 @@
>  			compatible = "qcom,gcc-qcs404";
>  			reg = <0x01800000 0x80000>;
>  			#clock-cells = <1>;
> +			#reset-cells = <1>;

But this one doesn't belong here..

Rest lgtm.

-- 
~Vinod
