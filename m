Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 771AD3A1E3D
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jun 2021 22:45:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbhFIUrq (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 9 Jun 2021 16:47:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbhFIUro (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 9 Jun 2021 16:47:44 -0400
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it [IPv6:2001:4b7a:2000:18::171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267EFC06175F;
        Wed,  9 Jun 2021 13:45:48 -0700 (PDT)
Received: from [192.168.1.101] (83.6.168.161.neoplus.adsl.tpnet.pl [83.6.168.161])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id BAA023EBC3;
        Wed,  9 Jun 2021 22:45:44 +0200 (CEST)
Subject: Re: [PATCH V3] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org, robh+dt@kernel.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        vbadigan@codeaurora.org, rampraka@codeaurora.org,
        sayalil@codeaurora.org, sartgarg@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, okukatla@codeaurora.org, djakov@kernel.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
References: <1623252028-20467-1-git-send-email-sbhanu@codeaurora.org>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
Message-ID: <793c9596-73f3-42b2-291e-1c728e279e28@somainline.org>
Date:   Wed, 9 Jun 2021 22:45:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <1623252028-20467-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,


> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index 3900cfc..8b159d1 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -11,6 +11,7 @@
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
>  #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
> +#include <dt-bindings/gpio/gpio.h>
>  #include "sc7280.dtsi"
>  #include "pm7325.dtsi"
>  #include "pmr735a.dtsi"
> @@ -272,6 +273,36 @@
>  	status = "okay";
>  };
>  
> +&sdhc_1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_clk &sdc1_cmd &sdc1_data &sdc1_rclk>;
> +	pinctrl-1 = <&sdc1_clk_sleep &sdc1_cmd_sleep &sdc1_data_sleep &sdc1_rclk_sleep>;

Please condense these pins into a since sdc1_on_state/sdc1_off_state (check sdc1_state_on in [1])



> +
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +
> +	vmmc-supply = <&vreg_l7b_2p9>;
> +	vqmmc-supply = <&vreg_l19b_1p8>;
> +
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_cd>;
> +	pinctrl-1 = <&sdc2_clk_sleep &sdc2_cmd_sleep &sdc2_data_sleep>;

Ditto



> +&tlmm {
> +	sdc1_clk: sdc1-clk {
> +		pins = "sdc1_clk";
> +		bias-disable;
> +		drive-strength = <16>;
> +	};
> +
> +	sdc1_cmd: sdc1-cmd {
> +		pins = "sdc1_cmd";
> +		bias-pull-up;
> +		drive-strength = <10>;
> +	};
> +
> +	sdc1_data: sdc1-data {
> +		pins = "sdc1_data";
> +		bias-pull-up;
> +		drive-strength = <10>;
> +	};
> +	sdc1_rclk: sdc1-rclk {
> +		pins = "sdc1_rclk";
> +		bias-pull-down;
> +	};
> +
> +	sdc2_clk: sdc2-clk {
> +		pins = "sdc2_clk";
> +		bias-disable;
> +		drive-strength = <16>;
> +	};
> +
> +	sdc2_cmd: sdc2-cmd {
> +		pins = "sdc2_cmd";
> +		bias-pull-up;
> +		drive-strength = <10>;
> +	};
> +
> +	sdc2_data: sdc2-data {
> +		pins = "sdc2_data";
> +		bias-pull-up;
> +		drive-strength = <10>;
> +	};
> +
> +	sd_cd: sd-cd {

Please make it sdc2 to keep things coherent.



> +		pins = "gpio91";
> +		bias-pull-up;
> +	};
> +
> +};

Why are you defining on_state pins in the device dt and sleep state in the SoC one?

Most devices share a common config for these, often coming from MTP or QRD boards

and it makes little to no sense to define these separately every time, because if you hit the

rare case of needing to make a change against that, it's probably just drive-strength.



> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 0b6f119..eab6f7b 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -24,6 +24,11 @@
>  
>  	chosen { };
>  
> +	aliases {
> +		mmc1 = &sdhc_1;
> +		mmc2 = &sdhc_2;
> +	};

This is board specific. Something might have a SDIO Wi-Fi card on it.



> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;

These properties should probably be in the device DT, unless the SoC controller

can only support these speeds and only at 1.8v



[1] https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=35a4a8b6e9b133cf3a7d059ad4cf0e24cb4bd029


Konrad

