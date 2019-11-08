Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EFFBDF3E81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 Nov 2019 04:49:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726556AbfKHDtF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 7 Nov 2019 22:49:05 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:45172 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726504AbfKHDtF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 7 Nov 2019 22:49:05 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 1E94D60D9D; Fri,  8 Nov 2019 03:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573184944;
        bh=MFMEZKtGhRENjO4SuKJErHdoEaB7KYINfnNwuYeJ8Zg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=i0p+tOA0gQlsu/bv8CrzUj6rz+8Bku+XXjkCML30sTYOScowJZZ+qm3eKt6HnzGNz
         CoAZasTYeYW+447a4fo1+NGhYa4C+Hgr5WQUSg2ObSPRylNDDYkPRz+xo2MnwHUmM9
         fO1qhzFKHvP3fzP6RM01l/T450SyNGucwC3p/USQ=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.79.136.17] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 796296030E;
        Fri,  8 Nov 2019 03:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573184943;
        bh=MFMEZKtGhRENjO4SuKJErHdoEaB7KYINfnNwuYeJ8Zg=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=GdrUQeKn/EbO7mByngZPZRfIRm8a3sfxoVk3CVYFvTv9ByiDhZLM7ScAv1VTusxAi
         yFPOkO2UTawDvY/YVyBnllI+ShmnZfZC2VVJyBGNdCeYMtuNK5ivUSLNqZ5EkQ83UG
         AX8TxzjvA8kN7eg1u59/g6GuYF5VrTKuMKDAJx3A=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 796296030E
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v4 02/14] arm64: dts: sc7180: Add minimal dts/dtsi files
 for SC7180 soc
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Taniya Das <tdas@codeaurora.org>
References: <20191106065017.22144-1-rnayak@codeaurora.org>
 <20191106065017.22144-3-rnayak@codeaurora.org>
 <5dc4588e.1c69fb81.5f75c.83ad@mx.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <5790f59f-951a-f1b4-bb31-f9cefec0c642@codeaurora.org>
Date:   Fri, 8 Nov 2019 09:18:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5dc4588e.1c69fb81.5f75c.83ad@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 11/7/2019 11:16 PM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2019-11-05 22:50:05)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> new file mode 100644
>> index 000000000000..17870dd67390
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -0,0 +1,299 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +/*
>> + * SC7180 SoC device tree source
>> + *
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/clock/qcom,gcc-sc7180.h>
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +       interrupt-parent = <&intc>;
>> +
>> +       #address-cells = <2>;
>> +       #size-cells = <2>;
>> +
>> +       chosen { };
>> +
>> +       clocks {
>> +               xo_board: xo-board {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <38400000>;
>> +                       #clock-cells = <0>;
>> +               };
>> +
>> +               sleep_clk: sleep-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <32764>;
>> +                       clock-output-names = "sleep_clk";
> 
> Remove this one too?

ah, yes. Not sure how I missed that :/

> 
>> +                       #clock-cells = <0>;
>> +               };
>> +       };
>> +
> [...]
>> +       memory@80000000 {
>> +               device_type = "memory";
>> +               /* We expect the bootloader to fill in the size */
>> +               reg = <0 0x80000000 0 0>;
>> +       };
>> +
>> +       pmu {
>> +               compatible = "arm,armv8-pmuv3";
>> +               interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
>> +       };
>> +
>> +       psci {
>> +               compatible = "arm,psci-1.0";
>> +               method = "smc";
>> +       };
>> +
>> +       soc: soc {
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges = <0 0 0 0 0x10 0>;
>> +               dma-ranges = <0 0 0 0 0x10 0>;
>> +               compatible = "simple-bus";
>> +
>> +               gcc: clock-controller@100000 {
>> +                       compatible = "qcom,gcc-sc7180";
>> +                       reg = <0 0x00100000 0 0x1f0000>;
>> +                       #clock-cells = <1>;
>> +                       #reset-cells = <1>;
>> +                       #power-domain-cells = <1>;
>> +               };
>> +
>> +               qupv3_id_1: geniqup@ac0000 {
>> +                       compatible = "qcom,geni-se-qup";
>> +                       reg = <0 0x00ac0000 0 0x6000>;
>> +                       clock-names = "m-ahb", "s-ahb";
>> +                       clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
>> +                                <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
>> +                       #address-cells = <2>;
>> +                       #size-cells = <2>;
>> +                       ranges;
>> +                       status = "disabled";
>> +
>> +                       uart8: serial@a88000 {
>> +                               compatible = "qcom,geni-debug-uart";
>> +                               reg = <0 0x00a88000 0 0x4000>;
>> +                               clock-names = "se";
>> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&qup_uart8_default>;
>> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>> +                               status = "disabled";
>> +                       };
>> +               };
>> +
>> +               tlmm: pinctrl@3500000 {
>> +                       compatible = "qcom,sc7180-pinctrl";
>> +                       reg = <0 0x03500000 0 0x300000>,
>> +                             <0 0x03900000 0 0x300000>,
>> +                             <0 0x03d00000 0 0x300000>;
>> +                       reg-names = "west", "north", "south";
>> +                       interrupts = <GIC_SPI 208 IRQ_TYPE_LEVEL_HIGH>;
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <2>;
>> +                       gpio-ranges = <&tlmm 0 0 120>;
>> +
>> +                       qup_uart8_default: qup-uart8-default {
>> +                               pinmux {
>> +                                       pins = "gpio44", "gpio45";
>> +                                       function = "qup12";
> 
> That looks weird to have qup12 function on uart8. It's right?

So we have 2 qup instances each with 6 SEs on sc7180.
So the i2c/uart/spi SE instances are numbered from 0 to 5 in the first qup
and 6 to 11 in the next.
The pinctrl functions however have it named qup0 to 5 for first and
qup10 to 15 for the next which is weird. Now all data in the pinctrl
driver is autogenerated using hw description so its coming from that.

Just for comparison, on sdm845 we had 2 qup instances with 8 SE's
and the function names were qup0 to 8 for first and 9 to 15 for the
second.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
