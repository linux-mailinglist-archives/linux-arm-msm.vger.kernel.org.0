Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C136F182821
	for <lists+linux-arm-msm@lfdr.de>; Thu, 12 Mar 2020 06:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387758AbgCLFMo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 12 Mar 2020 01:12:44 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:39564 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387657AbgCLFMo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 12 Mar 2020 01:12:44 -0400
Received: by mail-pj1-f66.google.com with SMTP id d8so2124697pje.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Mar 2020 22:12:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=S03VflXtfBdU3G7WrgnpyaIH0yNKM177vI6gQVCK4zY=;
        b=oTsERKMYyFGRUyq9fLk4IDlsMBbdf9Ugjwy//Yc4ZLyHBWyWraHopbb2SAQ9H/Kjiq
         WEueW4oMctUs0hV8oT6Ykm5ueq+TCVRk+iqos5IhUqWg2Xn+Mt5xGLhN3EyV/XZ7KJLM
         GMDL3ZgtoEtY5FBYGY5Xl9YWudf9GMmM4wa78DXQRLiqNmBU+9Oj1QlA0LTktJSPLMzX
         YNs0OjIV/Ml1TJ/OkM+E0sT1XScvaCEFmwAg72ILZehqF0EWmakpbL3DEigBgJusKP/H
         dKsAaiMTO3oflTA41Q6cRZf4ZGRwMhs9HarpxW6uRqdyveckvXG5pmN1DR3fZmPaXV0U
         wMeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=S03VflXtfBdU3G7WrgnpyaIH0yNKM177vI6gQVCK4zY=;
        b=tba074WpnLH0wprrFHLVIYC5GCe7/N3FsinYV5Yk+WELbCLpIrFWafrBMxgWPWrtpz
         0XOOr4kNmf+Bc60X1uQtEBj+9woQXy5ZjORJqRzfYE6ND/Ki0urSbJ6BzOic/b8A2rqn
         W9HXztdWQ9mLpS3LXnA+mQpm9vZ+/2y1LCwlXRSC+KwbXeQcKjUtnvohYoNXL3y608oB
         Z3yz20DffI2mpCrMAst/5THZeS3njfyfJ1n49Z37EqTMZGF7VIOIW1JjrzuVxr67ASBz
         WCpdmnw2/OuyawcCW6aIIYINsHGBQm+rc8vckeFr8ZJj38lpTfFC8ck9rjH9uGZ099KX
         TZ7Q==
X-Gm-Message-State: ANhLgQ3T+hesp4R1EiNvh2Ht7Du8WHM8BEVUhxW6xSojSReDKmfwtBPN
        CceeRKhSTuNaj8SWcPIe95EdXQ==
X-Google-Smtp-Source: ADFU+vsPGt88umNphl69CFdzapIJwZsoW9RFCNSJeyEHKsvUxjW/1HiWdp0tXdhZXPSVHhAx9tsqKA==
X-Received: by 2002:a17:90a:b111:: with SMTP id z17mr2321714pjq.115.1583989962616;
        Wed, 11 Mar 2020 22:12:42 -0700 (PDT)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id n184sm2281274pfn.208.2020.03.11.22.12.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2020 22:12:41 -0700 (PDT)
Date:   Wed, 11 Mar 2020 22:12:39 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Robert Foss <robert.foss@linaro.org>
Cc:     agross@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com,
        catalin.marinas@arm.com, will@kernel.org, shawnguo@kernel.org,
        olof@lixom.net, Anson.Huang@nxp.com, maxime@cerno.tech,
        leonard.crestez@nxp.com, dinguyen@kernel.org,
        marcin.juszkiewicz@linaro.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: Re: [v1 3/6] arm64: dts: sdm845: Add i2c-qcom-cci node
Message-ID: <20200312051239.GV264362@yoga>
References: <20200311123501.18202-1-robert.foss@linaro.org>
 <20200311123501.18202-4-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200311123501.18202-4-robert.foss@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 11 Mar 05:34 PDT 2020, Robert Foss wrote:

> The sdm845 SOC ships with a CCI controller, which
> has two CCI/I2C buses.
> 
> Signed-off-by: Robert Foss <robert.foss@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sdm845-db845c.dts |   4 +
>  arch/arm64/boot/dts/qcom/sdm845.dtsi       | 110 +++++++++++++++++++++
>  2 files changed, 114 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> index eb77aaa6a819..a6b6837c3d68 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-db845c.dts
> @@ -583,3 +583,7 @@
>  		bias-pull-up;
>  	};
>  };
> +
> +&cci {
> +	status = "ok";
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index d42302b8889b..b7f5c0b0f6af 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -5,6 +5,7 @@
>   * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>   */
>  
> +#include <dt-bindings/clock/qcom,camcc-sdm845.h>
>  #include <dt-bindings/clock/qcom,dispcc-sdm845.h>
>  #include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  #include <dt-bindings/clock/qcom,gpucc-sdm845.h>
> @@ -717,6 +718,14 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		clock_camcc: clock-controller@ad00000 {
> +			compatible = "qcom,sdm845-camcc";
> +			reg = <0 0xad00000 0 0x10000>;

Please pad address (i.e. the second cell) to 8 digits and maintain sort
order by address.

> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +			#power-domain-cells = <1>;
> +		};
> +
>  		qfprom@784000 {
>  			compatible = "qcom,qfprom";
>  			reg = <0 0x00784000 0 0x8ff>;
> @@ -1451,6 +1460,60 @@
>  			gpio-ranges = <&tlmm 0 0 150>;
>  			wakeup-parent = <&pdc_intc>;
>  
> +			cci0_default: cci0_default {

No _ in the node name (i.e you can do cci0_default: cci0-default).

> +				/* SDA, SCL */
> +				pinmux {

You no longer need this intermediate node, instead you can write this
as:

cci0_default: cci0-default {
	pins = "gpio17", "gpio18";
	function = "cci_i2c";
	
	bias-pull-up;
	drive-strength = <2>;
};

Or alternatively if you would like to group things in subnodes, do so by
pin (to allow different pinconf per pin in a nice way), i.e:

cci0_default: cci0-default {
	sda {
		pins = "gpio17";
		function = "cci_i2c";
		
		bias-pull-up;
		drive-strength = <2>;
	};

	scl {
		pins = "gpio18";
		function = "cci_i2c";
		
		bias-pull-up;
		drive-strength = <2>;
	};
};

> +					function = "cci_i2c";
> +					pins = "gpio17", "gpio18";
> +				};
> +				pinconf {
> +					pins = "gpio17", "gpio18";
> +					bias-pull-up;
> +					drive-strength = <2>; /* 2 mA */
> +				};
> +			};
> +
> +			cci0_sleep: cci0_sleep {
> +				/* SDA, SCL */
> +				mux {
> +					pins = "gpio17", "gpio18";
> +					function = "cci_i2c";
> +				};
> +
> +				config {
> +					pins = "gpio17", "gpio18";
> +					drive-strength = <2>; /* 2 mA */
> +					bias-pull-down;
> +				};
> +			};
> +
> +			cci1_default: cci1_default {
> +				/* SDA, SCL */
> +				pinmux {
> +					function = "cci_i2c";
> +					pins = "gpio19", "gpio20";
> +				};
> +				pinconf {
> +					pins = "gpio19", "gpio20";
> +					bias-pull-up;
> +					drive-strength = <2>; /* 2 mA */
> +				};
> +			};
> +
> +			cci1_sleep: cci1_sleep {
> +				/* SDA, SCL */
> +				mux {
> +					pins = "gpio19", "gpio20";
> +					function = "cci_i2c";
> +				};
> +
> +				config {
> +					pins = "gpio19", "gpio20";
> +					drive-strength = <2>; /* 2 mA */
> +					bias-pull-down;
> +				};
> +			};
> +
>  			qspi_clk: qspi-clk {
>  				pinmux {
>  					pins = "gpio95";
> @@ -2608,6 +2671,53 @@
>  			#reset-cells = <1>;
>  		};
>  
> +		cci: cci@ac4a000 {
> +			compatible = "qcom,sdm845-cci";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			reg = <0 0xac4a000 0 0x4000>;

Please pad 0xac4a000 to 8 digits.

> +			interrupts = <GIC_SPI 460 IRQ_TYPE_EDGE_RISING>;
> +			power-domains = <&clock_camcc TITAN_TOP_GDSC>;
> +
> +			clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				<&clock_camcc CAM_CC_SOC_AHB_CLK>,
> +				<&clock_camcc CAM_CC_SLOW_AHB_CLK_SRC>,
> +				<&clock_camcc CAM_CC_CPAS_AHB_CLK>,
> +				<&clock_camcc CAM_CC_CCI_CLK>,
> +				<&clock_camcc CAM_CC_CCI_CLK_SRC>;
> +			clock-names = "camnoc_axi_clk",
> +				"soc_ahb_clk",
> +				"slow_ahb_src_clk",
> +				"cpas_ahb_clk",
> +				"cci",
> +				"cci_clk_src";

Please drop the "_clk" suffix from these (iirc, these strings aren't
significant to the binding anyways).

> +
> +			assigned-clocks = <&clock_camcc CAM_CC_CAMNOC_AXI_CLK>,
> +				<&clock_camcc CAM_CC_CCI_CLK>;
> +			assigned-clock-rates = <80000000>, <37500000>;
> +
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&cci0_default &cci1_default>;
> +			pinctrl-1 = <&cci0_sleep &cci1_sleep>;
> +
> +			status = "disabled";
> +
> +			i2c-bus@0 {

Please give these labels, to make it easy to reference each bus in the
board dts and to add children.

Regards,
Bjorn

> +				reg = <0>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <1000000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +		};
> +
>  		mdss: mdss@ae00000 {
>  			compatible = "qcom,sdm845-mdss";
>  			reg = <0 0x0ae00000 0 0x1000>;
> -- 
> 2.20.1
> 
