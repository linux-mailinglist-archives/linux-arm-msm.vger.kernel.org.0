Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B5DA1591F1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 Feb 2020 15:30:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729613AbgBKOaA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 11 Feb 2020 09:30:00 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:49491 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729586AbgBKOaA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 11 Feb 2020 09:30:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581431399; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tXbzOxT33xBNpwEltNBTeJiAoDFd0feVxR0V8ZWCyCQ=; b=JyHmesMTQKwRCjuA/1PDPxyMj3y6ILHUT9x/ShZIw6eooie9qoBYBD6DOph/M1FfMhjjdTSn
 oCBz/7q/RwCZS13H2X9TJZ0ThkpdQK5Za4CBjMtlm09XLaW5fVeMhITioY5x5BJh52sXTkJH
 49CpgvbvWwqOLDdGMM6eix2IWbM=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e42ba62.7f1e7e0a2570-smtp-out-n03;
 Tue, 11 Feb 2020 14:29:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6D081C447A0; Tue, 11 Feb 2020 14:29:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.140] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C51E4C43383;
        Tue, 11 Feb 2020 14:29:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C51E4C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V3] arm64: dts: qcom: sc7180: Add nodes for eMMC and SD
 card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, mka@chromium.org
Cc:     linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1578495250-10672-1-git-send-email-sbhanu@codeaurora.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <25a96f3f-c4cd-4ff1-3ce6-d894fb1c20fe@codeaurora.org>
Date:   Tue, 11 Feb 2020 19:59:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <1578495250-10672-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

ping!

On 1/8/2020 8:24 PM, Shaik Sajida Bhanu wrote:
> From: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
>
> Add sdhc instances for supporting eMMC and SD-card on sc7180.
> The regulators should be in HPM state for proper functionality of
> eMMC and SD-card. Updating corresponding regulators accordingly.
>
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
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
>   arch/arm64/boot/dts/qcom/sc7180-idp.dts |  47 +++++++---
>   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 148 ++++++++++++++++++++++++++++++++
>   2 files changed, 183 insertions(+), 12 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 388f50a..a790d82 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -7,6 +7,7 @@
>   
>   /dts-v1/;
>   
> +#include <dt-bindings/gpio/gpio.h>
>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>   #include "sc7180.dtsi"
>   #include "pm6150.dtsi"
> @@ -101,9 +102,9 @@
>   		};
>   
>   		vreg_l12a_1p8: ldo12 {
> -			regulator-min-microvolt = <1696000>;
> -			regulator-max-microvolt = <1952000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <1800000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l13a_1p8: ldo13 {
> @@ -143,9 +144,9 @@
>   		};
>   
>   		vreg_l19a_2p9: ldo19 {
> -			regulator-min-microvolt = <2696000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   	};
>   
> @@ -189,9 +190,9 @@
>   		};
>   
>   		vreg_l6c_2p9: ldo6 {
> -			regulator-min-microvolt = <2696000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <1800000>;
> +			regulator-max-microvolt = <2950000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l7c_3p0: ldo7 {
> @@ -207,9 +208,9 @@
>   		};
>   
>   		vreg_l9c_2p9: ldo9 {
> -			regulator-min-microvolt = <2952000>;
> -			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-min-microvolt = <2960000>;
> +			regulator-max-microvolt = <2960000>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>   		};
>   
>   		vreg_l10c_3p3: ldo10 {
> @@ -254,6 +255,28 @@
>   	status = "okay";
>   };
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
>   &uart3 {
>   	status = "okay";
>   };
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 3676bfd..525bc02 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -226,6 +226,33 @@
>   			};
>   		};
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
>   		qupv3_id_0: geniqup@8c0000 {
>   			compatible = "qcom,geni-se-qup";
>   			reg = <0 0x008c0000 0 0x6000>;
> @@ -929,6 +956,127 @@
>   					function = "qup15";
>   				};
>   			};
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
>   		};
>   
>   		qspi: spi@88dc000 {
