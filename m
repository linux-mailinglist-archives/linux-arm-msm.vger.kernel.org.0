Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 930853A64E3
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Jun 2021 13:30:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234199AbhFNLa0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 14 Jun 2021 07:30:26 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:15108 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235730AbhFNL1b (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 14 Jun 2021 07:27:31 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1623669927; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=LHTJHs8WLtG+cQlDY6gAWUCMiRc/oQhmi+dCZfmozBQ=;
 b=N4Mjtb6OpsSzx9bmxpeAN7n09/o92qXGJXslZvxZwSFETchmTjCK7tQlk61vHc4/DEqXUqqP
 C/ZJWetLOlgjVqi8J7mw2fo7lw6HbFWbvF2kEXTf4IrSAtPhbkx3hWP1hGv/C3gJ8TuCKZXx
 oQBNivhcvFuUJ+jO9d7KtxkaJYw=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60c73ca38491191eb34ab6e9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 14 Jun 2021 11:25:23
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C5846C0091E; Mon, 14 Jun 2021 11:25:22 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48FF6C43145;
        Mon, 14 Jun 2021 11:25:18 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 14 Jun 2021 16:55:17 +0530
From:   sbhanu@codeaurora.org
To:     Konrad Dybcio <konrad.dybcio@somainline.org>
Cc:     adrian.hunter@intel.com, ulf.hansson@linaro.org,
        robh+dt@kernel.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        okukatla@codeaurora.org, djakov@kernel.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH V3] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <793c9596-73f3-42b2-291e-1c728e279e28@somainline.org>
References: <1623252028-20467-1-git-send-email-sbhanu@codeaurora.org>
 <793c9596-73f3-42b2-291e-1c728e279e28@somainline.org>
Message-ID: <1c22c4f5ca372988491181b3d0bd55e8@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-10 02:15, Konrad Dybcio wrote:
> Hi,
> 
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 3900cfc..8b159d1 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -11,6 +11,7 @@
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>> +#include <dt-bindings/gpio/gpio.h>
>>  #include "sc7280.dtsi"
>>  #include "pm7325.dtsi"
>>  #include "pmr735a.dtsi"
>> @@ -272,6 +273,36 @@
>>  	status = "okay";
>>  };
>> 
>> +&sdhc_1 {
>> +	status = "okay";
>> +
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&sdc1_clk &sdc1_cmd &sdc1_data &sdc1_rclk>;
>> +	pinctrl-1 = <&sdc1_clk_sleep &sdc1_cmd_sleep &sdc1_data_sleep 
>> &sdc1_rclk_sleep>;
> 
> Please condense these pins into a since sdc1_on_state/sdc1_off_state
> (check sdc1_state_on in [1])
> 
Sure
> 
> 
>> +
>> +	non-removable;
>> +	no-sd;
>> +	no-sdio;
>> +
>> +	vmmc-supply = <&vreg_l7b_2p9>;
>> +	vqmmc-supply = <&vreg_l19b_1p8>;
>> +
>> +};
>> +
>> +&sdhc_2 {
>> +	status = "okay";
>> +
>> +	pinctrl-names = "default", "sleep";
>> +	pinctrl-0 = <&sdc2_clk &sdc2_cmd &sdc2_data &sd_cd>;
>> +	pinctrl-1 = <&sdc2_clk_sleep &sdc2_cmd_sleep &sdc2_data_sleep>;
> 
> Ditto
> 
Sure
> 
> 
>> +&tlmm {
>> +	sdc1_clk: sdc1-clk {
>> +		pins = "sdc1_clk";
>> +		bias-disable;
>> +		drive-strength = <16>;
>> +	};
>> +
>> +	sdc1_cmd: sdc1-cmd {
>> +		pins = "sdc1_cmd";
>> +		bias-pull-up;
>> +		drive-strength = <10>;
>> +	};
>> +
>> +	sdc1_data: sdc1-data {
>> +		pins = "sdc1_data";
>> +		bias-pull-up;
>> +		drive-strength = <10>;
>> +	};
>> +	sdc1_rclk: sdc1-rclk {
>> +		pins = "sdc1_rclk";
>> +		bias-pull-down;
>> +	};
>> +
>> +	sdc2_clk: sdc2-clk {
>> +		pins = "sdc2_clk";
>> +		bias-disable;
>> +		drive-strength = <16>;
>> +	};
>> +
>> +	sdc2_cmd: sdc2-cmd {
>> +		pins = "sdc2_cmd";
>> +		bias-pull-up;
>> +		drive-strength = <10>;
>> +	};
>> +
>> +	sdc2_data: sdc2-data {
>> +		pins = "sdc2_data";
>> +		bias-pull-up;
>> +		drive-strength = <10>;
>> +	};
>> +
>> +	sd_cd: sd-cd {
> 
> Please make it sdc2 to keep things coherent.
> 
Sure
> 
> 
>> +		pins = "gpio91";
>> +		bias-pull-up;
>> +	};
>> +
>> +};
> 
> Why are you defining on_state pins in the device dt and sleep state in
> the SoC one?
> 
> Most devices share a common config for these, often coming from MTP or
> QRD boards
> 
> and it makes little to no sense to define these separately every time,
> because if you hit the
> 
> rare case of needing to make a change against that, it's probably just
> drive-strength.
> 
I have made this change as per Doug Anderson comment on patch V2 
(https://lore.kernel.org/patchwork/patch/1399453/#1598871)
And along with drive-strength change, on some of boards Sd card gpio pin 
also may change right.
> 
> 
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 0b6f119..eab6f7b 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -24,6 +24,11 @@
>> 
>>  	chosen { };
>> 
>> +	aliases {
>> +		mmc1 = &sdhc_1;
>> +		mmc2 = &sdhc_2;
>> +	};
> 
> This is board specific. Something might have a SDIO Wi-Fi card on it.
we are assuming eMMC and SD support available on all boards and if any 
board supports SDIO Wi-Fi card
they can add aliases for SDIO Wi-Fi card in that particular board device 
DT file.
> 
> 
> 
>> +			mmc-ddr-1_8v;
>> +			mmc-hs200-1_8v;
>> +			mmc-hs400-1_8v;
>> +			mmc-hs400-enhanced-strobe;
> 
> These properties should probably be in the device DT, unless the SoC 
> controller
> 
> can only support these speeds and only at 1.8v
> 
we are keeping these flags in SOC file because all platforms would 
support these modes,
and yes we support only these and at 1.8V.
> 
> 
> [1]
> https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git/commit/?h=for-next&id=35a4a8b6e9b133cf3a7d059ad4cf0e24cb4bd029
> 
> 
> Konrad
