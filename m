Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 93E5615D1A7
	for <lists+linux-arm-msm@lfdr.de>; Fri, 14 Feb 2020 06:31:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgBNFa6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 14 Feb 2020 00:30:58 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:42450 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725845AbgBNFa6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 14 Feb 2020 00:30:58 -0500
Received: by mail-pg1-f195.google.com with SMTP id w21so4350643pgl.9
        for <linux-arm-msm@vger.kernel.org>; Thu, 13 Feb 2020 21:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EFw2du6rZFRPkSdj9P0sIJ2N76IKO5MEY8qu/tBHDTE=;
        b=ZSf2/sGO4VosqGWbhqIg9BURFt5AEw7U1ceHPx4xuB3St0pTtFSyAFl11OHhNkD+jG
         yN3kiPsdW2HSg3pxQZG7Wwq5SxUKGCoyARoxlO3/kweb9iA+MVhrU4y62BKoo6Ca3mxX
         F+N7ji1kMg+eFV/E/+NZjdocV4xUcO1ml9/q9YszTbaeJY8aE6RniJ2P9yHaoNoWf2s4
         UNmZWMtUdynSBDX6wG5jpsvJG3Aq+uKnn84MUMk0+EEhV4/7b0tDvur6nd2iDVWuXcJw
         f6ovHSaEMkOzCEAf9UfTTY/jz2RgGDevXXmBhfaAdriJz8OnuB8iAcIxiTzqV+5HNolg
         8A1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EFw2du6rZFRPkSdj9P0sIJ2N76IKO5MEY8qu/tBHDTE=;
        b=NDFx/sBzTBVijTw+RZrYZHQv3cfUiUQGxXMV0O6tvKldgvjy1IgR2DjzZBFEow+I84
         fdk/ZO8QjUvoMKJyd7LTjmR+kG/kIhUC2QqanJyzrLk1Eq75aAOoT4yDxMX+z1Ea8AsR
         VSMvsUmV9VmkZcSIbQHH3mrN38AK6pM4PWQnblqiKaYIFG1mZ7gLKMLHn0DEGTfkiQzD
         RmYmFVic9b3g8Wgr73h6uzz/Kwz5r/u3BI8GNiIT5KUYvsDCFyA/S0+u92Efh8M/DACB
         yKezK4IJANbVH1Kg3vy9B+uxLHANxM8PvuEgCuXXY8lmchbxIaxjzh5Qgno+TZqyowV5
         CHDA==
X-Gm-Message-State: APjAAAVZRM8XiHpvI7hVv0jv3wYdgWu/VxDBYQNNRhGCAdXogGN6e5X0
        hpKmyTAeI9C/FD4MFPTenUMrVNp6Hlo=
X-Google-Smtp-Source: APXvYqyWuLtjpfHoJG0Et4y2kDxaE5sl9XWYR/qheoXohBf/fiQf171wTxdxmPyYwEAJ35bIMlWhOA==
X-Received: by 2002:a63:e65:: with SMTP id 37mr1575156pgo.171.1581658257501;
        Thu, 13 Feb 2020 21:30:57 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f43sm4741021pje.23.2020.02.13.21.30.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2020 21:30:56 -0800 (PST)
Date:   Thu, 13 Feb 2020 21:30:53 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Veerabhadrarao Badiganti <vbadigan@codeaurora.org>,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V3] arm64: dts: qcom: sc7180: Add nodes for eMMC and SD
 card
Message-ID: <20200214053053.GV3948@builder>
References: <1578495250-10672-1-git-send-email-sbhanu@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1578495250-10672-1-git-send-email-sbhanu@codeaurora.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed 08 Jan 06:54 PST 2020, Shaik Sajida Bhanu wrote:

> From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> 
> Add sdhc instances for supporting eMMC and SD-card on sc7180.
> The regulators should be in HPM state for proper functionality of
> eMMC and SD-card. Updating corresponding regulators accordingly.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>

Applied

Regards,
Bjorn

> ---
> Changes since V2:
> 	- Added cmdq register space and support-cqe flag.
> 	- Incorporated review comments by Matthias Kaehlcke.
> 
> Changes since V1:
> 	- Updated the regulator min, max voltages as per
> 	  eMMC/SD-card voltage requirements
> 	- Enabled IOMMU for eMMC and SD-card.
> 	- Added pull and drive strength to SD-card cd-gpio.
> 	- Incorporated review comments by Matthias Kaehlcke.
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  47 +++++++---
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 148 ++++++++++++++++++++++++++++++++
>  2 files changed, 183 insertions(+), 12 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..a790d82 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -7,6 +7,7 @@
>  
>  /dts-v1/;
>  
> +#include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>  #include "sc7180.dtsi"
>  #include "pm6150.dtsi"
> @@ -101,9 +102,9 @@
>  		};
>  
>  		vreg_l12a_1p8: ldo12 {
> -			regulator-min-microvolt = <1696000>;
> -			regulator-max-microvolt = <1952000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l13a_1p8: ldo13 {
> @@ -143,9 +144,9 @@
>  		};
>  
>  		vreg_l19a_2p9: ldo19 {
> -			regulator-min-microvolt = <2696000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  
> @@ -189,9 +190,9 @@
>  		};
>  
>  		vreg_l6c_2p9: ldo6 {
> -			regulator-min-microvolt = <2696000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2950000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7c_3p0: ldo7 {
> @@ -207,9 +208,9 @@
>  		};
>  
>  		vreg_l9c_2p9: ldo9 {
> -			regulator-min-microvolt = <2952000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l10c_3p3: ldo10 {
> @@ -254,6 +255,28 @@
>  	status = "okay";
>  };
>  
> +&sdhc_1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_on>;
> +	pinctrl-1 = <&sdc1_off>;
> +	vmmc-supply = <&vreg_l19a_2p9>;
> +	vqmmc-supply = <&vreg_l12a_1p8>;
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default","sleep";
> +	pinctrl-0 = <&sdc2_on>;
> +	pinctrl-1 = <&sdc2_off>;
> +	vmmc-supply  = <&vreg_l9c_2p9>;
> +	vqmmc-supply = <&vreg_l6c_2p9>;
> +
> +	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
> +};
> +
>  &uart3 {
>  	status = "okay";
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3676bfd..525bc02 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -226,6 +226,33 @@
>  			};
>  		};
>  
> +		sdhc_1: sdhci@7c4000 {
> +			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x7c4000 0 0x1000>,
> +				<0 0x07c5000 0 0x1000>;
> +			reg-names = "hc_mem", "cqhci_mem";
> +
> +			iommus = <&apps_smmu 0x60 0x0>;
> +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> +					<&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +
> +			bus-width = <8>;
> +			non-removable;
> +			supports-cqe;
> +
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;
> +
> +			status = "disabled";
> +		};
> +
>  		qupv3_id_0: geniqup@8c0000 {
>  			compatible = "qcom,geni-se-qup";
>  			reg = <0 0x008c0000 0 0x6000>;
> @@ -929,6 +956,127 @@
>  					function = "qup15";
>  				};
>  			};
> +
> +			sdc1_on: sdc1-on {
> +				pinconf-clk {
> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};
> +
> +				pinconf-cmd {
> +					pins = "sdc1_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				pinconf-data {
> +					pins = "sdc1_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				pinconf-rclk {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_off: sdc1-off {
> +				pinconf-clk {
> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-cmd {
> +					pins = "sdc1_cmd";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-data {
> +					pins = "sdc1_data";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-rclk {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc2_on: sdc2-on {
> +				pinconf-clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};
> +
> +				pinconf-cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				pinconf-data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				pinconf-sd-cd {
> +					pins = "gpio69";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +			};
> +
> +			sdc2_off: sdc2-off {
> +				pinconf-clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				pinconf-sd-cd {
> +					pins = "gpio69";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +			};
> +		};
> +
> +		sdhc_2: sdhci@8804000 {
> +			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
> +			reg-names = "hc_mem";
> +
> +			iommus = <&apps_smmu 0x80 0>;
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> +					<&gcc GCC_SDCC2_AHB_CLK>;
> +			clock-names = "core", "iface";
> +
> +			bus-width = <4>;
> +
> +			status = "disabled";
>  		};
>  
>  		qspi: spi@88dc000 {
> -- 
> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member 
> of Code Aurora Forum, hosted by The Linux Foundation
> 
