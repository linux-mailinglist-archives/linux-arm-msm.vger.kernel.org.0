Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D510612E627
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Jan 2020 13:32:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728286AbgABMcG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 2 Jan 2020 07:32:06 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:51545 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728278AbgABMcF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 2 Jan 2020 07:32:05 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577968324; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=/E8TT9+0U3inh8FEr3+mV0x6CJy/08wdLhWGuFRpWjs=; b=n7ka7364KBc1MJ0kSKXMs/5APTFqGM832rCzkpIU2vb/XlcP9ierGnSWqhDWvBSdop5KB5oQ
 nIwV1TG7hyOAU5Eoy0wKozX/OP3dQiXPqdnNI0PNwNIRcD7XmuaZOeDEZ2r+uyq/GPKGTf/6
 QJNoN1xevSJX6TSTdblJ4yZilMA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e0de2c0.7fee5968c768-smtp-out-n01;
 Thu, 02 Jan 2020 12:32:00 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3C61CC447A4; Thu,  2 Jan 2020 12:31:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.25.108] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: vbadigan)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E5625C43383;
        Thu,  2 Jan 2020 12:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E5625C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=vbadigan@codeaurora.org
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7180: Add nodes for eMMC and SD
 card
To:     Matthias Kaehlcke <mka@chromium.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, sayalil@codeaurora.org,
        cang@codeaurora.org, rampraka@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mark Rutland <mark.rutland@arm.com>
References: <1576288475-7606-1-git-send-email-vbadigan@codeaurora.org>
 <20191217222119.GW228856@google.com>
From:   Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
Message-ID: <0dbc37f0-41dc-77fd-9bd4-0e4d81cbf6f7@codeaurora.org>
Date:   Thu, 2 Jan 2020 18:01:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <20191217222119.GW228856@google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 12/18/2019 3:51 AM, Matthias Kaehlcke wrote:
> On Sat, Dec 14, 2019 at 07:24:34AM +0530, Veerabhadrarao Badiganti wrote:
>> Add sdhc instances for supporting eMMC and SD-card on sc7180.
>> The regulators should be in HPM state for proper functionality of
>> eMMC and SD-card. Updating corresponding regulators accordingly.
>>
>> Signed-off-by: Veerabhadrarao Badiganti <vbadigan@codeaurora.org>
> The patch doesn't apply against qcom/for-next, looks like you need to
> rebase it.
>
>> ---
>>
>> This depends on the patch series (dt support for sc7180):
>> https://lkml.org/lkml/2019/11/8/149
>> Also depends on documentation commit 2078158 (Present on mmc-next)
>>
>> Changes since V1:
>> 	- Updated the regulator min, max voltages as per
>> 	  eMMC/SD-card voltage requirements
>> 	- Enabled IOMMU for eMMC and SD-card.
>> 	- Added pull and drive strength to SD-card cd-gpio.
>> 	- Incorporated review comments by Matthias Kaehlcke.
>> ---
>>   arch/arm64/boot/dts/qcom/sc7180-idp.dts |  47 +++++++---
>>   arch/arm64/boot/dts/qcom/sc7180.dtsi    | 148 ++++++++++++++++++++++++++++++++
>>   2 files changed, 183 insertions(+), 12 deletions(-)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180-idp.dts b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> index 189254f..b6d4dc1 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7180-idp.dts
>> @@ -7,6 +7,7 @@
>>   
>>   /dts-v1/;
>>   
>> +#include <dt-bindings/gpio/gpio.h>
>>   #include <dt-bindings/regulator/qcom,rpmh-regulator.h>
>>   #include "sc7180.dtsi"
>>   #include "pm6150.dtsi"
>> @@ -101,9 +102,9 @@
>>   		};
>>   
>>   		vreg_l12a_1p8: ldo12 {
>> -			regulator-min-microvolt = <1696000>;
>> -			regulator-max-microvolt = <1952000>;
>> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <1800000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>>   		vreg_l13a_1p8: ldo13 {
>> @@ -143,9 +144,9 @@
>>   		};
>>   
>>   		vreg_l19a_2p9: ldo19 {
>> -			regulator-min-microvolt = <2696000>;
>> -			regulator-max-microvolt = <3304000>;
>> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-min-microvolt = <2960000>;
>> +			regulator-max-microvolt = <2960000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   	};
>>   
>> @@ -189,9 +190,9 @@
>>   		};
>>   
>>   		vreg_l6c_2p9: ldo6 {
>> -			regulator-min-microvolt = <2696000>;
>> -			regulator-max-microvolt = <3304000>;
>> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-min-microvolt = <1800000>;
>> +			regulator-max-microvolt = <2950000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>>   		vreg_l7c_3p0: ldo7 {
>> @@ -207,9 +208,9 @@
>>   		};
>>   
>>   		vreg_l9c_2p9: ldo9 {
>> -			regulator-min-microvolt = <2952000>;
>> -			regulator-max-microvolt = <3304000>;
>> -			regulator-initial-mode = <RPMH_REGULATOR_MODE_LPM>;
>> +			regulator-min-microvolt = <2960000>;
>> +			regulator-max-microvolt = <2960000>;
>> +			regulator-initial-mode = <RPMH_REGULATOR_MODE_HPM>;
>>   		};
>>   
>>   		vreg_l10c_3p3: ldo10 {
>> @@ -400,3 +401,25 @@
>>   			bias-pull-up;
>>   		};
>>   };
>> +
>> +&sdhc_1 {
>> +	status = "ok";
>> +
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&sdc1_on>;
>> +	pinctrl-1 = <&sdc1_off>;
>> +	vmmc-supply = <&vreg_l19a_2p9>;
>> +	vqmmc-supply = <&vreg_l12a_1p8>;
>> +};
>> +
>> +&sdhc_2 {
>> +	status = "ok";
>> +
>> +	pinctrl-names = "default","sleep";
>> +	pinctrl-0 = <&sdc2_on>;
>> +	pinctrl-1 = <&sdc2_off>;
>> +	vmmc-supply  = <&vreg_l9c_2p9>;
>> +	vqmmc-supply = <&vreg_l6c_2p9>;
>> +
>> +	cd-gpios = <&tlmm 69 GPIO_ACTIVE_LOW>;
>> +};
> You are adding these entries to the pinctrl section, they belong
> above the "/* PINCTRL - additions to nodes defined in sc7180.dtsi */"
> comment.
>
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 666e9b9..16de9b8 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -182,6 +182,32 @@
>>   			#power-domain-cells = <1>;
>>   		};
>>   
>> +		sdhc_1: sdhci@7c4000 {
>> +			compatible = "qcom,sc7180-sdhci", "qcom,sdhci-msm-v5";
>> +			reg = <0 0x7c4000 0 0x1000>;
>> +			reg-names = "hc_mem";
>> +
>> +			interrupts = <GIC_SPI 641 IRQ_TYPE_LEVEL_HIGH>,
>> +					<GIC_SPI 644 IRQ_TYPE_LEVEL_HIGH>;
>> +			interrupt-names = "hc_irq", "pwr_irq";
>> +
>> +			clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>> +					<&gcc GCC_SDCC1_AHB_CLK>;
>> +			clock-names = "core", "iface";
>> +
>> +			iommus = <&apps_smmu 0x60 0x0>;
>> +
>> +			bus-width = <8>;
>> +			non-removable;
>> +
>> +			mmc-ddr-1_8v;
>> +			mmc-hs200-1_8v;
>> +			mmc-hs400-1_8v;
>> +			mmc-hs400-enhanced-strobe;
>> +
>> +			status = "disabled";
>> +		};
>> +
>>   		qupv3_id_0: geniqup@8c0000 {
>>   			compatible = "qcom,geni-se-qup";
>>   			reg = <0 0x008c0000 0 0x6000>;
>> @@ -897,6 +923,128 @@
>>   					function = "qup15";
>>   				};
>>   			};
>> +
>> +			sdc1_on: sdc1-on {
>> +				clk {
> judging from some other nodes the convention seems to be to call the
> nodes 'pinconf-<name>'.
>
>> +					pins = "sdc1_clk";
>> +					bias-disable;
>> +					drive-strength = <16>;
>> +				};
>> +
>> +				cmd {
>> +					pins = "sdc1_cmd";
>> +					bias-pull-up;
>> +					drive-strength = <10>;
>> +				};
>> +
>> +				data {
>> +					pins = "sdc1_data";
>> +					bias-pull-up;
>> +					drive-strength = <10>;
>> +				};
> cmd and data have the same configuration, in theory you could combine
> them in a single node. Not sure if it's strictly required, in this case
> with just two pins it doesn't make a big difference.

Though both have same configuration, each corresponds to different bit 
fields in register

for updating drive-strengths and pull.  It configures the right bit 
field based on pin name.

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/pinctrl/qcom/pinctrl-sc7180.c?h=v5.5-rc4#n1093

So separate pins needed for cmd and data here.

>> +
>> +				rclk {
>> +					pins = "sdc1_rclk";
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			sdc1_off: sdc1-off {
>> +				clk {
>> +					pins = "sdc1_clk";
>> +					bias-disable;
>> +					drive-strength = <2>;
>> +				};
>> +
>> +				cmd {
>> +					pins = "sdc1_cmd";
>> +					bias-pull-up;
>> +					drive-strength = <2>;
>> +				};
>> +
>> +				data {
>> +					pins = "sdc1_data";
>> +					bias-pull-up;
>> +					drive-strength = <2>;
>> +				};
>> +
>> +				rclk {
>> +					pins = "sdc1_rclk";
>> +					bias-pull-down;
>> +				};
>> +			};
>> +
>> +			sdc2_on: sdc2_on {
> nit: sdc2_on: sdc2-on
>
>> +				clk {
>> +					pins = "sdc2_clk";
>> +					bias-disable;
>> +					drive-strength = <16>;
>> +				};
>> +
>> +				cmd {
>> +					pins = "sdc2_cmd";
>> +					bias-pull-up;
>> +					drive-strength = <10>;
>> +				};
>> +
>> +				data {
>> +					pins = "sdc2_data";
>> +					bias-pull-up;
>> +					drive-strength = <10>;
>> +				};
>> +
>> +				sd-cd {
>> +					pins = "gpio69";
>> +					bias-pull-up;
>> +					drive-strength = <2>;
>> +				};
>> +			};
>> +
>> +			sdc2_off: sdc2_off {
> nit: sdc2_off: sdc2-off

Will incorporate the rest of the changes that you commented.

Thanks,

Veera

