Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBD693B2879
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Jun 2021 09:21:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231527AbhFXHX7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 24 Jun 2021 03:23:59 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:51041 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231501AbhFXHX5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 24 Jun 2021 03:23:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1624519299; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=iGAC6GkKId3YDE2wkWphfxN46sz4Sv37+aWq0hFm3fw=;
 b=VXldKpeWrmOD7L9iKKTPKNCpBcTCx23GrLgnona4MM5q8OChhbzXdBS0KJfsm0ou35YvS66i
 iLrgvlGlcR7OUxdvgwkomnsv6v5Jqw9o8uETZG1jCgJarANDvC4iDU+LYjAQAsahK35tKF99
 qZSOHgT7K4ZFcTSssjbtE+ZIhew=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60d4327c638039e997a00fc9 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 24 Jun 2021 07:21:32
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 55078C4323A; Thu, 24 Jun 2021 07:21:32 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 72A6AC433F1;
        Thu, 24 Jun 2021 07:21:31 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 24 Jun 2021 12:51:31 +0530
From:   sbhanu@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        okukatla@codeaurora.org, djakov@kernel.org, cang@codeaurora.org,
        pragalla@codeaurora.org, nitirawa@codeaurora.org,
        linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        agross@kernel.org, bjorn.andersson@linaro.org
Subject: Re: [PATCH V4] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <CAE-0n52KyStCcQ1QPFJBUvrTVB-NuBcQ9qnPhnzQj6PFiXPLGg@mail.gmail.com>
References: <1623835381-29696-1-git-send-email-sbhanu@codeaurora.org>
 <CAE-0n52KyStCcQ1QPFJBUvrTVB-NuBcQ9qnPhnzQj6PFiXPLGg@mail.gmail.com>
Message-ID: <d3322b244221be7cb4802d6448c7588c@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-06-23 01:47, Stephen Boyd wrote:
> Quoting Shaik Sajida Bhanu (2021-06-16 02:23:01)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 3900cfc..0f63cac 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -11,6 +11,7 @@
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pmr735b.h>
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pm8350.h>
>>  #include <dt-bindings/iio/qcom,spmi-adc7-pmk8350.h>
>> +#include <dt-bindings/gpio/gpio.h>
> 
> The letter g comes before i, please move this higher in the list.
Sure i will adrress this in my next patchset.
> 
>>  #include "sc7280.dtsi"
>>  #include "pm7325.dtsi"
>>  #include "pmr735a.dtsi"
>> @@ -272,6 +273,34 @@
>>         status = "okay";
>>  };
>> 
>> +&sdhc_1 {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default", "sleep";
>> +       pinctrl-0 = <&sdc1_on>;
>> +       pinctrl-1 = <&sdc1_off>;
>> +
>> +       non-removable;
>> +       no-sd;
>> +       no-sdio;
>> +
>> +       vmmc-supply = <&vreg_l7b_2p9>;
>> +       vqmmc-supply = <&vreg_l19b_1p8>;
>> +};
>> +
>> +&sdhc_2 {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default", "sleep";
>> +       pinctrl-0 = <&sdc2_on>;
>> +       pinctrl-1 = <&sdc2_off>;
>> +
>> +       vmmc-supply = <&vreg_l9c_2p9>;
>> +       vqmmc-supply = <&vreg_l6c_2p9>;
>> +
>> +       cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
>> +};
>> +
>>  &uart5 {
>>         status = "okay";
>>  };
>> @@ -291,3 +320,55 @@
>>                 bias-pull-up;
>>         };
>>  };
>> +
>> +&tlmm {
>> +       sdc1_on: sdc1-on {
>> +               clk {
>> +                       pins = "sdc1_clk";
> 
> Can the pins property at least be moved into sc7280.dtsi? Then this can
> add bias and drive strength overrides in the board file?
Sure i will adrress this in my next patchset.
> 
>> +                       bias-disable;
>> +                       drive-strength = <16>;
>> +               };
>> +
>> +               cmd {
>> +                       pins = "sdc1_cmd";
>> +                       bias-pull-up;
>> +                       drive-strength = <10>;
>> +               };
>> +
>> +               data {
>> +                       pins = "sdc1_data";
>> +                       bias-pull-up;
>> +                       drive-strength = <10>;
>> +               };
>> +
>> +               rclk {
>> +                       pins = "sdc1_rclk";
>> +                       bias-pull-down;
>> +               };
>> +       };
>> +
>> +       sdc2_on: sdc2-on {
>> +               clk {
>> +                       pins = "sdc2_clk";
>> +                       bias-disable;
>> +                       drive-strength = <16>;
>> +               };
>> +
>> +               cmd {
>> +                       pins = "sdc2_cmd";
>> +                       bias-pull-up;
>> +                       drive-strength = <10>;
>> +               };
>> +
>> +               data {
>> +                       pins = "sdc2_data";
>> +                       bias-pull-up;
>> +                       drive-strength = <10>;
>> +               };
>> +
>> +               sd-cd {
>> +                       pins = "gpio91";
>> +                       bias-pull-up;
>> +               };
>> +       };
>> +};
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index d600bca..16d8e17 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -974,6 +1033,51 @@
>>                         };
>>                 };
>> 
>> +               sdhc_2: sdhci@8804000 {
>> +                       compatible = "qcom,sc7280-sdhci", 
>> "qcom,sdhci-msm-v5";
>> +                       status = "disabled";
>> +
>> +                       reg = <0 0x08804000 0 0x1000>;
>> +
>> +                       iommus = <&apps_smmu 0x100 0x0>;
>> +                       interrupts = <GIC_SPI 207 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                    <GIC_SPI 223 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hc_irq", "pwr_irq";
>> +
>> +                       clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>> +                                <&gcc GCC_SDCC2_AHB_CLK>,
>> +                                <&rpmhcc RPMH_CXO_CLK>;
>> +                       clock-names = "core", "iface", "xo";
>> +                       interconnects = <&aggre1_noc MASTER_SDCC_2 0 
>> &mc_virt SLAVE_EBI1 0>,
>> +                                       <&gem_noc MASTER_APPSS_PROC 0 
>> &cnoc2 SLAVE_SDCC_2 0>;
>> +                       interconnect-names = "sdhc-ddr","cpu-sdhc";
>> +                       power-domains = <&rpmhpd SC7280_CX>;
>> +                       operating-points-v2 = <&sdhc2_opp_table>;
>> +
>> +                       bus-width = <4>;
>> +
>> +                       qcom,dll-config = <0x0007642c>;
>> +
>> +                       sdhc2_opp_table: sdhc2-opp-table {
> 
> Any reason the node shouldn't be called opp-table?
Yes, it can be called but for consistency, we are using the same node 
names as that on sc7180.

