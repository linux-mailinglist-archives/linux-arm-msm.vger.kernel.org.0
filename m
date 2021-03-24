Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7ED4D347C80
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Mar 2021 16:25:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236671AbhCXPY2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Mar 2021 11:24:28 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:29462 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236644AbhCXPYG (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Mar 2021 11:24:06 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1616599446; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=HDux/XTBGz9rixeIAR9DvVOHlS+cOR0uxaUvQO8w8bE=;
 b=fL/eSOUOi6oGl4kzbPHO/Quo3jUInaTe6/Z54F5s8YjsDlLx3iNkK8JrVfxAbJX+Wq+KQa7t
 tM9tOYFn2uvzBr18pXQjeN9OatWVfgYIBe1Q2z2ohJsW54aBEBvUhIHcmUenaggOfJfY1O2G
 oL0TLuS759eSgcFR/M6iEfb2K6Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 605b598e4db3bb68015fe4ba (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Mar 2021 15:23:58
 GMT
Sender: sbhanu=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 21226C43464; Wed, 24 Mar 2021 15:23:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sbhanu)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B0F0DC433CA;
        Wed, 24 Mar 2021 15:23:55 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 24 Mar 2021 20:53:55 +0530
From:   sbhanu@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     adrian.hunter@intel.com, robh+dt@kernel.org,
        ulf.hansson@linaro.org, asutoshd@codeaurora.org,
        stummala@codeaurora.org, vbadigan@codeaurora.org,
        rampraka@codeaurora.org, sayalil@codeaurora.org,
        sartgarg@codeaurora.org, rnayak@codeaurora.org,
        saiprakash.ranjan@codeaurora.org, sibis@codeaurora.org,
        cang@codeaurora.org, pragalla@codeaurora.org,
        nitirawa@codeaurora.org, linux-mmc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org
Subject: Re: [PATCH V2] arm64: dts: qcom: sc7280: Add nodes for eMMC and SD
 card
In-Reply-To: <161648289959.3012082.11356063123403968180@swboyd.mtv.corp.google.com>
References: <1616264220-25825-1-git-send-email-sbhanu@codeaurora.org>
 <161648289959.3012082.11356063123403968180@swboyd.mtv.corp.google.com>
Message-ID: <363c5b7d9baca5a010552137f80a1cf4@codeaurora.org>
X-Sender: sbhanu@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-03-23 12:31, Stephen Boyd wrote:
> Quoting Shaik Sajida Bhanu (2021-03-20 11:17:00)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280-idp.dts 
>> b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> index 54d2cb3..4105263 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> +++ b/arch/arm64/boot/dts/qcom/sc7280-idp.dts
>> @@ -8,6 +8,7 @@
>>  /dts-v1/;
>> 
>>  #include "sc7280.dtsi"
>> +#include <dt-bindings/gpio/gpio.h>
> 
> Please include this before sc7280.dtsi
> 
Sure
>> 
>>  / {
>>         model = "Qualcomm Technologies, Inc. sc7280 IDP platform";
>> @@ -242,6 +243,30 @@
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
>> +       vmmc-supply = <&vreg_l7b_2p9>;
>> +       vqmmc-supply = <&vreg_l19b_1p8>;
>> +};
>> +
>> +&sdhc_2 {
>> +       status = "okay";
>> +
>> +       pinctrl-names = "default","sleep";
> 
> Please add a space after the comma ^
Sure
> 
>> +       pinctrl-0 = <&sdc2_on>;
>> +       pinctrl-1 = <&sdc2_off>;
>> +
>> +       vmmc-supply = <&vreg_l9c_2p9>;
>> +       vqmmc-supply = <&vreg_l6c_2p9>;
>> +
>> +       cd-gpios = <&tlmm 91 GPIO_ACTIVE_LOW>;
>> +};
>> +
>>  /* PINCTRL - additions to nodes defined in sc7280.dtsi */
>> 
>>  &qup_uart5_default {
>> diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> index 8f6b569..69eb064 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
>> @@ -20,6 +20,11 @@
>> 
>>         chosen { };
>> 
>> +       aliases {
>> +               mmc1 = &sdhc_1;
>> +               mmc2 = &sdhc_2;
>> +       };
>> +
>>         clocks {
>>                 xo_board: xo-board {
>>                         compatible = "fixed-clock";
>> @@ -305,6 +310,64 @@
>>                         #power-domain-cells = <1>;
>>                 };
>> 
>> +               sdhc_1: sdhci@7c4000 {
>> +                       compatible = "qcom,sdhci-msm-v5";
>> +                       reg = <0 0x7c4000 0 0x1000>,
> 
> Please add leading zeroes to the physical address, i.e. 0x007c4000
Sure
> 
>> +                                       <0 0x7c5000 0 0x1000>;
>> +                       reg-names = "hc", "cqhci";
>> +
>> +                       iommus = <&apps_smmu 0xC0 0x0>;
> 
> Lowercase hex please.
Sure
> 
>> +                       interrupts = <GIC_SPI 652 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 656 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hc_irq", "pwr_irq";
>> +
>> +                       clocks = <&gcc GCC_SDCC1_APPS_CLK>,
>> +                                       <&gcc GCC_SDCC1_AHB_CLK>,
>> +                                       <&rpmhcc RPMH_CXO_CLK>;
>> +                       clock-names = "core", "iface", "xo";
>> +                       interconnects = <&aggre1_noc MASTER_SDCC_1 0 
>> &mc_virt SLAVE_EBI1 0>,
>> +                                       <&gem_noc MASTER_APPSS_PROC 0 
>> &cnoc2 SLAVE_SDCC_1 0>;
>> +                       interconnect-names = "sdhc-ddr","cpu-sdhc";
>> +                       power-domains = <&rpmhpd SC7280_CX>;
>> +                       operating-points-v2 = <&sdhc1_opp_table>;
>> +
>> +                       bus-width = <8>;
>> +                       non-removable;
>> +                       supports-cqe;
>> +                       no-sd;
>> +                       no-sdio;
>> +
>> +                       max-frequency = <192000000>;
> 
> Is this necessary?
yes, to avoid lower speed modes running with high clock rates.
> 
>> +
>> +                       qcom,dll-config = <0x0007642c>;
>> +                       qcom,ddr-config = <0x80040868>;
>> +
>> +                       mmc-ddr-1_8v;
>> +                       mmc-hs200-1_8v;
>> +                       mmc-hs400-1_8v;
>> +                       mmc-hs400-enhanced-strobe;
>> +
>> +                       status = "disabled";
> 
> Can this be near the compatible string?
Sure
> 
>> +
>> +                       sdhc1_opp_table: sdhc1-opp-table {
>> +                               compatible = "operating-points-v2";
>> +
>> +                               opp-100000000 {
>> +                                       opp-hz = /bits/ 64 
>> <100000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_low_svs>;
>> +                                       opp-peak-kBps = <1200000 
>> 76000>;
>> +                                       opp-avg-kBps = <1200000 
>> 50000>;
>> +                               };
>> +
>> +                               opp-384000000 {
>> +                                       opp-hz = /bits/ 64 
>> <384000000>;
>> +                                       required-opps = 
>> <&rpmhpd_opp_nom>;
>> +                                       opp-peak-kBps = <5400000 
>> 1600000>;
>> +                                       opp-avg-kBps = <6000000 
>> 300000>;
>> +                               };
>> +                       };
>> +               };
>> +
>>                 qupv3_id_0: geniqup@9c0000 {
>>                         compatible = "qcom,geni-se-qup";
>>                         reg = <0 0x009c0000 0 0x2000>;
>> @@ -328,6 +391,54 @@
>>                         };
>>                 };
>> 
>> +               sdhc_2: sdhci@8804000 {
>> +                       compatible = "qcom,sdhci-msm-v5";
>> +                       reg = <0 0x08804000 0 0x1000>;
> 
> This has leading zeroes, great!
> 
>> +
>> +                       iommus = <&apps_smmu 0x100 0x0>;
>> +                       interrupts = <GIC_SPI 207 
>> IRQ_TYPE_LEVEL_HIGH>,
>> +                                       <GIC_SPI 223 
>> IRQ_TYPE_LEVEL_HIGH>;
>> +                       interrupt-names = "hc_irq", "pwr_irq";
>> +
>> +                       clocks = <&gcc GCC_SDCC2_APPS_CLK>,
>> +                                       <&gcc GCC_SDCC2_AHB_CLK>,
>> +                                       <&rpmhcc RPMH_CXO_CLK>;
> 
> Is this aligned properly?
yes
> 
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
>> +                       no-mmc;
>> +                       no-sdio;
>> +
>> +                       max-frequency = <202000000>;
> 
> Is this necessary?
yes, to avoid clock running more than required clock rate.
> 
>> +
>> +                       qcom,dll-config = <0x0007642c>;
>> +
>> +                       status = "disabled";
> 
> Move up near compatible?
sure
> 
>> +
>> +                       sdhc2_opp_table: sdhc2-opp-table {
>> +                                       compatible = 
>> "operating-points-v2";
>> +
>> +                                       opp-100000000 {
>> +                                               opp-hz =/bits/ 64 
>> <100000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_low_svs>;
>> +                                               opp-peak-kBps = 
>> <1200000 76000>;
>> +                                               opp-avg-kBps = 
>> <1200000 50000>;
>> +                                       };
>> +                                       opp-202000000 {
>> +                                               opp-hz = /bits/ 64 
>> <202000000>;
>> +                                               required-opps = 
>> <&rpmhpd_opp_nom>;
>> +                                               opp-peak-kBps = 
>> <3500000 1200000>;
>> +                                               opp-avg-kBps = 
>> <5000000 100000>;
>> +                                       };
>> +                               };
>> +               };
>> +
>>                 pdc: interrupt-controller@b220000 {
>>                         compatible = "qcom,sc7280-pdc", "qcom,pdc";
>>                         reg = <0 0x0b220000 0 0x30000>;
