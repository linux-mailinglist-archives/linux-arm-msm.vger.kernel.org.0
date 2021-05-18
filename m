Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EE0E3877FE
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 May 2021 13:48:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348857AbhERLtZ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 May 2021 07:49:25 -0400
Received: from mail.kernel.org ([198.145.29.99]:51134 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232135AbhERLtZ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 May 2021 07:49:25 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 888AF61007;
        Tue, 18 May 2021 11:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1621338487;
        bh=uXT8X84pU/MhQkoLeSofNd4xcdpY6KU8l/egukUIF18=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=H1OvMa4m8OviY3qqjFsihKek0GJRdB01yCxklaXOTxg9ofq80Fb1SDj5oCxrJnt6U
         aQOVJ5Z70uFXu9Ed256zDIudHG/QRvLtlaqeBhBNS8vqXcFJf75OH1GZk8RrSQhiiW
         y6K7zN8JIihdObT6I56LKBMf/mKi6R242TsfrvLAA6kIk11vcJlST0EV7UNUFPYeau
         oLKJZmGz+zoZdVw3QwqWg35VY4qEsoOYGFu5PmxIFPCL4cwe6e9WYj/zAvZdtF+Lao
         1xjLtdGmxD6+wxZZ5vfWCtJAT/sc2/3aiXkLl2frskRO7QXiieFPWZ9gYT27nDnwh3
         xfBHnQyrtsGEQ==
Date:   Tue, 18 May 2021 17:18:03 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     satya priya <skakit@codeaurora.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, mka@chromium.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, kgunda@codeaurora.org
Subject: Re: [RESEND PATCH V4 4/8] arm64: dts: qcom: pm8350c: Add temp-alarm
 support
Message-ID: <YKOpc+mi9fxVRMbI@vkoul-mobl.Dlink>
References: <1621318822-29332-1-git-send-email-skakit@codeaurora.org>
 <1621318822-29332-5-git-send-email-skakit@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1621318822-29332-5-git-send-email-skakit@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 18-05-21, 11:50, satya priya wrote:
> Add temp-alarm node for PM8350C pmic and also modify gpio
> node to add gpio ranges and "qcom,spmi-gpio" compatible.

These should be two patches explaining why things are done like that

> 
> Signed-off-by: satya priya <skakit@codeaurora.org>
> Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
> ---
> Changes in RESEND V4:
>  - No Changes.
> 
>  arch/arm64/boot/dts/qcom/pm8350c.dtsi | 32 +++++++++++++++++++++++++++++++-
>  1 file changed, 31 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> index 2b9b75e..e1b75ae 100644
> --- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
> @@ -13,13 +13,43 @@
>  		#address-cells = <1>;
>  		#size-cells = <0>;
>  
> +		pm8350c_temp_alarm: temp-alarm@a00 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0xa00>;
> +			interrupts = <0x2 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			#thermal-sensor-cells = <0>;
> +		};
> +
>  		pm8350c_gpios: gpio@8800 {
> -			compatible = "qcom,pm8350c-gpio";
> +			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";

why is this changed?

>  			reg = <0x8800>;
>  			gpio-controller;
> +			gpio-ranges = <&pm8350c_gpios 0 0 9>;
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
>  	};
>  };
> +
> +&thermal_zones {
> +	pm8350c_thermal: pm8350c-thermal {
> +		polling-delay-passive = <100>;
> +		polling-delay = <0>;
> +		thermal-sensors = <&pm8350c_temp_alarm>;
> +
> +		trips {
> +			pm8350c_trip0: trip0 {
> +				temperature = <95000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			pm8350c_crit: pm8350c-crit {
> +				temperature = <115000>;
> +				hysteresis = <0>;
> +				type = "critical";
> +			};
> +		};
> +	};
> +};
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation

-- 
~Vinod
