Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F2067333489
	for <lists+linux-arm-msm@lfdr.de>; Wed, 10 Mar 2021 05:49:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232329AbhCJEsr (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 9 Mar 2021 23:48:47 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:29916 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232359AbhCJEsd (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 9 Mar 2021 23:48:33 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615351713; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3QJl+xQdpkUYQGTAXkdYwW5Vo4YmIjcRh7Npt+NHeiA=; b=LN/vlN0D47WreXZ62/3jzjz0Y7gZxwevM91IHxsT8AaCRV8QBKgv11ecfxmVjDfE2aUw34uX
 kn7FOKolo4kGCTXIT86iZVqA0JH/k8tf7pXBHc3TP1XO16Vjzxuftbseo7/VhfuJBYegAxCa
 4pqehfeD8ePBajvc5zjOHGe2/20=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 60484f99a6850484a6e27bab (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 10 Mar 2021 04:48:25
 GMT
Sender: vbadigan=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E5EE5C433C6; Wed, 10 Mar 2021 04:48:24 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.101] (unknown [49.205.242.72])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 37DCCC433C6;
        Wed, 10 Mar 2021 04:48:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 37DCCC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V1] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
To:     Shaik Sajida Bhanu <sbhanu@codeaurora.org>,
        adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, sartgarg@codeaurora.org
Cc:     asutoshd@codeaurora.org, stummala@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        rnayak@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        sibis@codeaurora.org, cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
References: <1615317483-23780-1-git-send-email-sbhanu@codeaurora.org>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <885574fe-3afe-8850-4acb-c330e1755a96@codeaurora.org>
Date:   Wed, 10 Mar 2021 10:18:12 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1615317483-23780-1-git-send-email-sbhanu@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/10/2021 12:48 AM, Shaik Sajida Bhanu wrote:
> Add nodes for eMMC and SD card on sc7280.
>
> Signed-off-by: Shaik Sajida Bhanu <sbhanu@codeaurora.org>
>
> ---
> This change is depends on the below patch series:
> https://lore.kernel.org/lkml/1613114930-1661-1-git-send-email-rnayak@codeaurora.org/
> https://lore.kernel.org/patchwork/project/lkml/list/?series=&submitter=28035&state=&q=&archive=&delegate=
> ---
>   arch/arm64/boot/dts/qcom/sc7280-idp.dts |  26 +++++
>   arch/arm64/boot/dts/qcom/sc7280.dtsi    | 170 ++++++++++++++++++++++++++++++++
>   2 files changed, 196 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> index ac79420..6abb2aa 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
> @@ -8,6 +8,7 @@
>   /dts-v1/;
>   
>   #include "sc7280.dtsi"
> +#include <dt-bindings/gpio/gpio.h>
>   
>   / {
>   	model = "Qualcomm Technologies, Inc. SC7280 IDP platform";
> @@ -256,3 +257,28 @@
>   		bias-pull-up;
>   	};
>   };
> +
> +&sdhc_1 {
> +	status = "okay";
> +
> +	pinctrl-names = "default", "sleep";
> +	pinctrl-0 = <&sdc1_on>;
> +	pinctrl-1 = <&sdc1_off>;
> +
> +	vmmc-supply = <&vreg_l7b_2p9>;
> +	vqmmc-supply = <&vreg_l19b_1p8>;
> +
> +};
> +
> +&sdhc_2 {
> +	status = "okay";
> +
> +	pinctrl-names = "default","sleep";
> +	pinctrl-0 = <&sdc2_on>;
> +	pinctrl-1 = <&sdc2_off>;
> +
> +	vmmc-supply = <&vreg_l9c_2p9>;
> +	vqmmc-supply = <&vreg_l6c_2p9>;
> +
> +	cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
> +};
> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> index 3b86052..91fb18a 100644
> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
> @@ -18,6 +18,11 @@
>   
>   	chosen { };
>   
> +	aliases {
> +		mmc1 = &sdhc_1;
> +		mmc2 = &sdhc_2;
> +	};
> +
>   	clocks {
>   		xo_board: xo-board {
>   			compatible = "fixed-clock";
> @@ -315,6 +320,69 @@
>   			#power-domain-cells = <1>;
>   		};
>   
> +		sdhc_1: sdhci@7c4000 {
> +			compatible = "qcom,sdhci-msm-v5";
> +			reg = <0 0x7c4000 0 0x1000>,
> +					<0 0x7c5000 0 0x1000>;
> +			reg-names = "hc", "cqhci";
> +
> +			iommus = <&apps_smmu 0xC0 0x0>;
> +			interrupts = <GIC_SPI 652 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 656 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
> +					<&gcc GCC_SDCC1_AHB_CLK>,
> +					<&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "core", "iface", "xo";
> +
> +			bus-width = <8>;
> +			non-removable;
> +			supports-cqe;
> +			no-sd;
> +			no-sdio;
> +
> +			max-frequency = <192000000>;
> +
> +			qcom,dll-config = <0x0007642c>;
> +			qcom,ddr-config = <0x80040868>;
> +
> +			mmc-ddr-1_8v;
> +			mmc-hs200-1_8v;
> +			mmc-hs400-1_8v;
> +			mmc-hs400-enhanced-strobe;
> +
> +			status = "disabled";
> +
> +		};
> +
> +		sdhc_2: sdhci@8804000 {
> +			compatible = "qcom,sdhci-msm-v5";
> +			reg = <0 0x08804000 0 0x1000>;
> +
> +			iommus = <&apps_smmu 0x100 0x0>;
> +			interrupts = <GIC_SPI 207 IRQ_TYPE_LEVEL_HIGH>,
> +					<GIC_SPI 223 IRQ_TYPE_LEVEL_HIGH>;
> +			interrupt-names = "hc_irq", "pwr_irq";
> +
> +			clocks = <&gcc GCC_SDCC2_APPS_CLK>,
> +					<&gcc GCC_SDCC2_AHB_CLK>,
> +					<&rpmhcc RPMH_CXO_CLK>;
> +			clock-names = "core", "iface", "xo";
> +
> +			bus-width = <4>;
> +
> +			no-mmc;
> +			no-sdio;
> +
> +			max-frequency = <202000000>;
> +
> +			qcom,dll-config = <0x0007642c>;
> +
> +			status = "disabled";
> +
> +		};
> +
>   		qupv3_id_0: geniqup@9c0000 {
>   			compatible = "qcom,geni-se-qup";
>   			reg = <0 0x009c0000 0 0x2000>;
> @@ -385,6 +453,108 @@
>   				pins = "gpio46", "gpio47";
>   				function = "qup13";
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
> +					pins = "gpio91";
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
> +					pins = "gpio91";
> +					bias-disable;
On few sc7180 based boards where external pull up is missing on cd-gpio,
we had seen issues like un-intended interrupt on cd-gpio pin (since its
getting toggled) during runtime PM cycle and resulting in unnecessary
scheduling of SDcard scan (mmc_rescan). This issue is seen only when SDcard
is not present.
By enabling internal pull all the time (bais-pull-up), we can avoid such 
issue.

> +					drive-strength = <2>;
> +				};
> +			};
>   		};
>   
>   		apps_smmu: iommu@15000000 {
