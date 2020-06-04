Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 86D341EE2C7
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jun 2020 12:47:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725939AbgFDKrH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Jun 2020 06:47:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:46684 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725854AbgFDKrG (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Jun 2020 06:47:06 -0400
Received: from localhost (unknown [122.179.53.240])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 749DB207D5;
        Thu,  4 Jun 2020 10:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1591267626;
        bh=MTud8ZP2ywwrEEduP1d8+rG1btY09gseB4YKcjoTpho=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=oBE+8GxGnDQunRulogKzFAYXpcfFN3vE7Wzps2Ze6856NKS/I5IaGNBi2znXirKx5
         kF/3klMBe1L1dS0Yef7n7Ojde58JHsiG44giwZDDGQ0h64FPsjAeQEqj21LhTmnq2r
         O+ru2Fc99vNwdbGY9U9A5nFZuGBTeWnocRznkRY0=
Date:   Thu, 4 Jun 2020 16:17:01 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        patches@linaro.org, linaro-kernel@lists.linaro.org
Subject: Re: [PATCH 5/7] arm64: dts: qcom: pm8150x: add thermal alarms and
 thermal zones
Message-ID: <20200604104701.GG3521@vkoul-mobl>
References: <20200604004331.669936-1-dmitry.baryshkov@linaro.org>
 <20200604004331.669936-5-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200604004331.669936-5-dmitry.baryshkov@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 04-06-20, 03:43, Dmitry Baryshkov wrote:
> Add temperature alarm and thermal zone configuration to all three
> pm8150 instances. Configuration is largely based on the msm-4.19 tree.
> These alarms use main adc of the pmic. Separate temperature adc is not
> supported yet.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/pm8150.dtsi  | 41 +++++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/pm8150b.dtsi | 43 +++++++++++++++++++++++++--
>  arch/arm64/boot/dts/qcom/pm8150l.dtsi | 43 +++++++++++++++++++++++++--
>  3 files changed, 119 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm8150.dtsi b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> index c0b197458665..fee2db42f4cb 100644
> --- a/arch/arm64/boot/dts/qcom/pm8150.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm8150.dtsi
> @@ -30,6 +30,15 @@ pwrkey {
>  			};
>  		};
>  
> +		pm8150_temp: temp-alarm@2400 {
> +			compatible = "qcom,spmi-temp-alarm";
> +			reg = <0x2400>;
> +			interrupts = <0x0 0x24 0x0 IRQ_TYPE_EDGE_BOTH>;
> +			io-channels = <&pm8150_adc ADC5_DIE_TEMP>;
> +			io-channel-names = "thermal";
> +			#thermal-sensor-cells = <0>;
> +		};
> +
>  		pm8150_adc: adc@3100 {
>  			compatible = "qcom,spmi-adc5";
>  			reg = <0x3100>;
> @@ -38,8 +47,6 @@ pm8150_adc: adc@3100 {
>  			#io-channel-cells = <1>;
>  			interrupts = <0x0 0x31 0x0 IRQ_TYPE_EDGE_RISING>;
>  
> -			status = "disabled";
> -

This should not be removed, rather than this please add enabled in you
board dts file

>  			ref-gnd@0 {
>  				reg = <ADC5_REF_GND>;
>  				qcom,pre-scaling = <1 1>;
> @@ -85,3 +92,33 @@ pmic@1 {
>  		#size-cells = <0>;
>  	};
>  };
> +
> +&thermal_zones {
> +	pm8150_temp {
> +		polling-delay-passive = <0>;
> +		polling-delay = <0>;
> +
> +		thermal-sensors = <&pm8150_temp>;
> +
> +		trips {
> +			trip0 {
> +				temperature = <95000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			trip1 {
> +				temperature = <115000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +
> +			trip2 {
> +				temperature = <145000>;
> +				hysteresis = <0>;
> +				type = "passive";
> +			};
> +		};
> +
> +	};

Not sure about this, Amit..? Should this also not be in board dts?

Similar comments on similar ones for rest of the patch as well..

-- 
~Vinod
