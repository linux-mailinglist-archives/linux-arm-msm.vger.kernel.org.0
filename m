Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 18597ED8DF
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 07:15:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727444AbfKDGPR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 01:15:17 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:40780 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGPR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 01:15:17 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 726CF60BEB; Mon,  4 Nov 2019 06:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572848115;
        bh=IngdpgbVfDPnfZTPd9bwcaDfxGrvP+SmgkF3GE3+okE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=SnrXjtuZV1HakawUCz7dfRW2G/rxyOpBwXxD9z7FCENFvoAKgSyoHV3bXtdVUt5fm
         Kg1t4taOvI3GHK/gvyxkGbuY9PCkJqsVu9FtPpLYp5MW/8+5Tr7F//ThaGmYgK/fNZ
         xr0SM2K5uFkHD8Wb2L/gUvSO/Q/XjYEuCjh4lWus=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EC7B260BEB;
        Mon,  4 Nov 2019 06:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572848114;
        bh=IngdpgbVfDPnfZTPd9bwcaDfxGrvP+SmgkF3GE3+okE=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=KVtOtif7CeG8m0sLowqxVO1SbkUuS035ZNAodXOs5shIVPyE9F5SyWzMmyeFWV/Vs
         adDFJqiiZiOn4yWNYHAeFGSBuOcC6kURxnQ+QpdP1IqvSoqlG7YufHrU+xl9dgKjxI
         bMlZACgJxZ+Qcy1V25qlwvdRI5Ot/xlBUxSKZlXQ=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org EC7B260BEB
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 02/11] arm64: dts: sc7180: Add minimal dts/dtsi files
 for SC7180 soc
To:     Stephen Boyd <swboyd@chromium.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org,
        Taniya Das <tdas@codeaurora.org>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-3-rnayak@codeaurora.org>
 <5db86d8c.1c69fb81.7b0b8.e331@mx.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <410902ad-7b4b-a0ae-d5f1-1dceb88bdc5f@codeaurora.org>
Date:   Mon, 4 Nov 2019 11:45:09 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5db86d8c.1c69fb81.7b0b8.e331@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 10/29/2019 10:19 PM, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2019-10-23 02:02:10)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> new file mode 100644
>> index 000000000000..084854341ddd
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -0,0 +1,300 @@
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
>> +                       clock-output-names = "xo_board";
> 
> Can you drop the output names property? I think we don't care that the
> name is "xo-board" instead of "xo_board" now.

sure, will do.

> 
>> +                       #clock-cells = <0>;
>> +               };
>> +
>> +               sleep_clk: sleep-clk {
>> +                       compatible = "fixed-clock";
>> +                       clock-frequency = <32764>;
>> +                       clock-output-names = "sleep_clk";
>> +                       #clock-cells = <0>;
>> +               };
>> +       };
>> +
> [...]
>> +
>> +       soc: soc {
>> +               #address-cells = <2>;
>> +               #size-cells = <2>;
>> +               ranges = <0 0 0 0 0x10 0>;
>> +               dma-ranges = <0 0 0 0  0x10 0>;
> 
> Why the extra space here               ^ ?

typo, will fix.

> 
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
>> +                       uart10: serial@a88000 {
>> +                               compatible = "qcom,geni-debug-uart";
>> +                               reg = <0 0x00a88000 0 0x4000>;
>> +                               clock-names = "se";
>> +                               clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
>> +                               pinctrl-names = "default";
>> +                               pinctrl-0 = <&qup_uart10_default>;
>> +                               interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
>> +                               status = "disabled";
>> +                       };
> 
> Can we not add all the i2c/spi/uart cores here?

I see that these nodes are posted now [1].
Will pull it in as part of this series so it can be reviewed together.

[1] https://lkml.org/lkml/2019/10/31/63

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
