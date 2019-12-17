Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DBD1E1239D6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Dec 2019 23:21:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726712AbfLQWVX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Dec 2019 17:21:23 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44288 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726830AbfLQWVX (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Dec 2019 17:21:23 -0500
Received: by mail-pl1-f193.google.com with SMTP id az3so1257plb.11
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Dec 2019 14:21:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YEuil02hQZyAp6FFykiAI8P1tEmF6Q53k3inDyTQNAA=;
        b=HltxYPnev95gaQHD+9SuDk38YAlVI7EvNjw17S1vDZF3BOhADdSYFWpfgCotRlaqto
         0wdjaBXBUBmhKTpidlfRVRcVMUxTnmLVZUJcWDLC/M677AWUSYGXy6LnV+aJox1oP0v+
         VaybhKvcrn0zgrSM1s2YcnDTTGI6RdwOYimsc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YEuil02hQZyAp6FFykiAI8P1tEmF6Q53k3inDyTQNAA=;
        b=Xssuuvpr1hxsYF3tp/Qhy/+NCXA1/DFAUDzIGH79Dy+2yMRcI33lhJ0eE2EnkrYObE
         GUly4QA25dk/v/0kXZ+M/8yB1A3Sev72c3srTlaX/9IHlNq/W+dPzTjScMB/hMOnjjkz
         DHmICx9y9k3jO5by2j25m1J4hJ3zP2VlW1rT3S/zDTJ+bkgT9OF1uUkmScCIEm0tTVpt
         uA5vud23YjO8WaorrxUHgnjLaK8Sz6jXBMuoqGsM+LRHxosVQYB3gGk3hEIS5fkYCltG
         15Nd6e7/Rr1q01YID3F98KdAuj6FGgiWVNPDkbOGlKRGe4wq7jXu0edL5zItv6lrbvNZ
         0Zhw==
X-Gm-Message-State: APjAAAXsI8PbxHz5johbczMZtaqRz4Z6pvoent7GWbDEmht44YBF7l+S
        KyHGHmTVnm6WXlJxwsYocfeO0Q==
X-Google-Smtp-Source: APXvYqy2QC7JgdjeoLynhtA4+c7a+vlT/yxbTdXbRLHFc+3RU3tXeCgTHQzrJPq6PGiwjAnLf5jEWg==
X-Received: by 2002:a17:90a:f84:: with SMTP id 4mr9299424pjz.74.1576621281844;
        Tue, 17 Dec 2019 14:21:21 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id j21sm27680232pfe.175.2019.12.17.14.21.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Dec 2019 14:21:21 -0800 (PST)
Date:   Tue, 17 Dec 2019 14:21:19 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: Add nodes for eMMC and SD
 card
Message-ID: <20191217222119.GW228856@google.com>
References: <1576288475-7606-1-git-send-email-vbadigan@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1576288475-7606-1-git-send-email-vbadigan@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Sat, Dec 14, 2019 at 07:24:34AM +0530, Veerabhadrarao Badiganti wrote:
> Add sdhc instances for supporting eMMC and SD-card on sc7180.
> The regulators should be in HPM state for proper functionality of
> eMMC and SD-card. Updating corresponding regulators accordingly.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>

The patch doesn't apply against qcom/for-next, looks like you need to
rebase it.

> ---
> 
> This depends on the patch series (dt support for sc7180):
> https://lkml.org/lkml/2019/11/8/149
> Also depends on documentation commit 2078158 (Present on mmc-next)
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
> index 189254f..b6d4dc1 100644
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
> @@ -400,3 +401,25 @@
>  			bias-pull-up;
>  		};
>  };
> +
> +&sdhc_1 {
> +	status = "ok";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_on>;
> +	pinctrl-1 = <&sdc1_off>;
> +	vmmc-supply = <&vreg_l19a_2p9>;
> +	vqmmc-supply = <&vreg_l12a_1p8>;
> +};
> +
> +&sdhc_2 {
> +	status = "ok";
> +
> +	pinctrl-names = "default","sleep";
> +	pinctrl-0 = <&sdc2_on>;
> +	pinctrl-1 = <&sdc2_off>;
> +	vmmc-supply  = <&vreg_l9c_2p9>;
> +	vqmmc-supply = <&vreg_l6c_2p9>;
> +
> +	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
> +};

You are adding these entries to the pinctrl section, they belong
above the "/* PINCTRL - additions to nodes defined in sc7180.dtsi */"
comment.

> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..16de9b8 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -182,6 +182,32 @@
>  			#power-domain-cells = <1>;
>  		};
>  
> +		sdhc_1: sdhci@7c4000 {
> +			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x7c4000 0 0x1000>;
> +			reg-names = "hc_mem";
> +
> +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> +					<&gcc GCC_SDCC1_AHB_CLK>;
> +			clock-names = "core", "iface";
> +
> +			iommus = <&apps_smmu 0x60 0x0>;
> +
> +			bus-width = <8>;
> +			non-removable;
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
> @@ -897,6 +923,128 @@
>  					function = "qup15";
>  				};
>  			};
> +
> +			sdc1_on: sdc1-on {
> +				clk {

judging from some other nodes the convention seems to be to call the
nodes 'pinconf-<name>'.

> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};
> +
> +				cmd {
> +					pins = "sdc1_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				data {
> +					pins = "sdc1_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};

cmd and data have the same configuration, in theory you could combine
them in a single node. Not sure if it's strictly required, in this case
with just two pins it doesn't make a big difference.

> +
> +				rclk {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc1_off: sdc1-off {
> +				clk {
> +					pins = "sdc1_clk";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +
> +				cmd {
> +					pins = "sdc1_cmd";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				data {
> +					pins = "sdc1_data";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +
> +				rclk {
> +					pins = "sdc1_rclk";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc2_on: sdc2_on {

nit: sdc2_on: sdc2-on

> +				clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};
> +
> +				cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +
> +				sd-cd {
> +					pins = "gpio69";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +			};
> +
> +			sdc2_off: sdc2_off {

nit: sdc2_off: sdc2-off
