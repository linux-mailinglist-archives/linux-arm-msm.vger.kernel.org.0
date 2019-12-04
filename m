Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D525C113793
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 23:25:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728434AbfLDWZo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 17:25:44 -0500
Received: from mail-pg1-f196.google.com ([209.85.215.196]:42022 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728213AbfLDWZm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 17:25:42 -0500
Received: by mail-pg1-f196.google.com with SMTP id i5so536032pgj.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 04 Dec 2019 14:25:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ZuactyN4A4dYRUXhDIHCeCkwIm9yVEkpFLsO07TsWMo=;
        b=hcGC+PTfEADAtTpYV00IwDi7gGhJIwdIxxVncPtNp+naLQKD2GcpYgCONjuPUWGrJT
         68ZVoPyMrQfOz2k71HZP7CWGXwSIi9yPcJgpbY2RRsxIlml5I+q7OjSqyRlL8dBmsImq
         XxXOFa8gzp1XgaOyd1HtMn5Qm8zU6pqGmri1M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=ZuactyN4A4dYRUXhDIHCeCkwIm9yVEkpFLsO07TsWMo=;
        b=IUnPpf8HBZrNgw18CVsP5KqlzdZR6lkdKUu3NoNm/6U4eO4WCarn5HLfeT+pKG7sqs
         qDGdt2Nm96e1o10Jftec06rrLbaoh+E+TUk5ua2+sUWDOhrhiDiXT36Dj+cBiVOzTtjg
         3g2qCT5zzR+CItqagKU7TLWFOZjP7gDZ96yTZ/oarZK91x77rqKfypAoPFQlgDC+n9nS
         iPYdoKaEcj3foUbusJT3rzPpbROde3ZQvaIG35FwOQ9nj1zmWqAfK2szjXcnpaDZvD3d
         3MdMQgcqF8oQCDYt2xtlBHfqSYpiEOyHJfe28c4ofJ3eJL9mf3XH2Aum22PwafCCpfKZ
         6H+Q==
X-Gm-Message-State: APjAAAVw3vitRSeroqf4JDvgiGxtV6M41xBCpaDt8zSqkqHEG3AFGHmt
        mB+Xqo2kxAQKxpJivRiYKrX2Xw==
X-Google-Smtp-Source: APXvYqxBaAsAuBqWN6ofTztH1Ft6RofDpKfxbvrSawqVadU1ETT+uPUdPcG4iBOR1iaX0suaxHQU4Q==
X-Received: by 2002:a63:d748:: with SMTP id w8mr5349746pgi.334.1575498340922;
        Wed, 04 Dec 2019 14:25:40 -0800 (PST)
Received: from localhost ([2620:15c:202:1:4fff:7a6b:a335:8fde])
        by smtp.gmail.com with ESMTPSA id j7sm9359067pgn.0.2019.12.04.14.25.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2019 14:25:40 -0800 (PST)
Date:   Wed, 4 Dec 2019 14:25:38 -0800
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH V1 2/2] arm64: dts: qcom: sc7180: Add nodes for eMMC and
 SD card
Message-ID: <20191204222538.GI228856@google.com>
References: <1574855381-15193-1-git-send-email-vbadigan@codeaurora.org>
 <0101016eacb27366-31803877-9137-4c0e-922b-6a71a0e63ab3-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0101016eacb27366-31803877-9137-4c0e-922b-6a71a0e63ab3-000000@us-west-2.amazonses.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On Wed, Nov 27, 2019 at 11:50:06AM +0000, Veerabhadrarao Badiganti wrote:

> Add sdhc instances for supporting eMMC and SD-card on sc7180.
> The regulators should be in HPM state for proper functionality of
> eMMC and SD-card. Updating corresponding regulators accordingly.
> 
> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> ---
> 
> This depends on the patch series (dt support for sc7180):
> https://lkml.org/lkml/2019/11/8/149
> ---
>  arch/arm64/boot/dts/qcom/sc7180-idp.dts |  32 +++++++-
>  arch/arm64/boot/dts/qcom/sc7180.dtsi    | 136 ++++++++++++++++++++++++++++++++
>  2 files changed, 164 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> index 189254f..583c42c 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
> @@ -11,6 +11,7 @@
>  #include "sc7180.dtsi"
>  #include "pm6150.dtsi"
>  #include "pm6150l.dtsi"
> +#include <dt-bindings/gpio/gpio.h>

I think this should be above, together with
'dt-bindings/regulator/qcom,rpmh-regulator.h'

>  
>  / {
>  	model = "Qualcomm Technologies, Inc. SC7180 IDP";
> @@ -103,7 +104,7 @@
>  		vreg_l12a_1p8: ldo12 {
>  			regulator-min-microvolt = <1696000>;
>  			regulator-max-microvolt = <1952000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l13a_1p8: ldo13 {
> @@ -145,7 +146,7 @@
>  		vreg_l19a_2p9: ldo19 {
>  			regulator-min-microvolt = <2696000>;
>  			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  	};
>  
> @@ -191,7 +192,7 @@
>  		vreg_l6c_2p9: ldo6 {
>  			regulator-min-microvolt = <2696000>;
>  			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l7c_3p0: ldo7 {
> @@ -209,7 +210,7 @@
>  		vreg_l9c_2p9: ldo9 {
>  			regulator-min-microvolt = <2952000>;
>  			regulator-max-microvolt = <3304000>;
> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>  		};
>  
>  		vreg_l10c_3p3: ldo10 {
> @@ -400,3 +401,26 @@
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
> +

remove empty line

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
> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> index 666e9b9..207d44f 100644
> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
> @@ -897,6 +897,100 @@
>  					function = "qup15";
>  				};
>  			};
> +
> +			sdc1_on: sdc1-on {
> +				clk {
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
> +				clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <16>;
> +				};

nit: add blank lines, consistent with the other pinconf entries.

> +				cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +				data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <10>;
> +				};
> +				sd-cd {
> +					pins = "gpio69";
> +					bias-pull-down;
> +				};
> +			};
> +
> +			sdc2_off: sdc2_off {
> +				clk {
> +					pins = "sdc2_clk";
> +					bias-disable;
> +					drive-strength = <2>;
> +				};
> +				cmd {
> +					pins = "sdc2_cmd";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +				data {
> +					pins = "sdc2_data";
> +					bias-pull-up;
> +					drive-strength = <2>;
> +				};
> +				sd-cd {
> +					pins = "gpio69";
> +					bias-pull-down;
> +				};
> +			};
>  		};
>  
>  		qspi: spi@88dc000 {
> @@ -911,6 +1005,48 @@
>  			status = "disabled";
>  		};
>  
> +		sdhc_1: sdhci@7c4000 {

IIUC the nodes are ordered by address, hence this one should be between
'clock-controller@100000' and 'geniqup@8c0000'.

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
> +		sdhc_2: sdhci@8804000 {

nodes are ordered by address: this one should be between 'pinctrl@3500000'
and 'spi@88dc000´.

> +			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
> +			reg-names = "hc_mem";
> +
> +			interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 222 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> +					<&gcc GCC_SDCC2_AHB_CLK>;
> +			clock-names = "core","iface";

nit: add a blank after the comma.

Thanks

Matthias
