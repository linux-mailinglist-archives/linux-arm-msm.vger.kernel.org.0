Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 062CFE96F8
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 08:06:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726207AbfJ3HGH (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 03:06:07 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:43322 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726070AbfJ3HGH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 03:06:07 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 774D760E74; Wed, 30 Oct 2019 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572419166;
        bh=9KAH28mxpXxwlYVSI9nECpGh12FdMNX6sxmv/u7P3Hs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=QiswbVqKvT0Y/Q4GR1ZTH/HYvQWq4pwg1CZ5tpivNihlYFtjwbI8QWkmXwe6wGplI
         TgcYHPgKHxNBaXnd3ME3dHwVzEK3lN9PN46k3QdgcHrNux4IKrXwi2o4Cth/aSxtGn
         /r2p8CbONJdrhSY5ySw4XkC8Ghrp2lfKKwqCVpp8=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id A9FDE6081E;
        Wed, 30 Oct 2019 07:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572419165;
        bh=9KAH28mxpXxwlYVSI9nECpGh12FdMNX6sxmv/u7P3Hs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=O9DoraHj2OyqJrzq4sZPjbs9Tatw2lfbQ+t3ooR1lmOkIZYIOucttfSQqexbv4vqV
         rlZT5ZWc7LmAYvl5FRyhlOGrIhJPXW03BCSceFTM9hZKDhdc1cO+cubsJrlHpjuDGL
         o4vsoA0tpf4U/CLUdX5AnDrd5q0YQHgODIcFpVWs=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 30 Oct 2019 12:36:05 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v3 08/11] arm64: dts: qcom: pm6150: Add PM6150/PM6150L
 PMIC peripherals
In-Reply-To: <5db86b1b.1c69fb81.be45f.0bb2@mx.google.com>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-9-rnayak@codeaurora.org>
 <5db86b1b.1c69fb81.be45f.0bb2@mx.google.com>
Message-ID: <87ec773e0d92571c4bbed44eeb65cff5@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-29 22:08, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2019-10-23 02:02:16)
>> diff --git a/arch/arm64/boot/dts/qcom/pm6150.dtsi 
>> b/arch/arm64/boot/dts/qcom/pm6150.dtsi
>> new file mode 100644
>> index 000000000000..20eb928e5ce3
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/qcom/pm6150.dtsi
>> @@ -0,0 +1,85 @@
>> +// SPDX-License-Identifier: BSD-3-Clause
>> +// Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> +
>> +#include <dt-bindings/iio/qcom,spmi-vadc.h>
>> +#include <dt-bindings/input/linux-event-codes.h>
>> +#include <dt-bindings/interrupt-controller/irq.h>
>> +#include <dt-bindings/spmi/spmi.h>
>> +#include <dt-bindings/thermal/thermal.h>
>> +
>> +&spmi_bus {
>> +       pm6150_lsid0: pmic@0 {
>> +               compatible = "qcom,pm6150", "qcom,spmi-pmic";
>> +               reg = <0x0 SPMI_USID>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +
>> +               pm6150_pon: pon@800 {
>> +                       compatible = "qcom,pm8998-pon";
>> +                       reg = <0x800>;
>> +                       mode-bootloader = <0x2>;
>> +                       mode-recovery = <0x1>;
> 
> Can this have status = "disabled"? Or is the idea that if the pmic 
> power
> button isn't used it should be disabled in the board dts file?
> 
Yes. The idea is to go with latter option. Disable it in the board dts 
file if the
pmic power button is not used.
>> +
>> +                       pwrkey {
>> +                               compatible = "qcom,pm8941-pwrkey";
>> +                               interrupts = <0x0 0x8 0 
>> IRQ_TYPE_EDGE_BOTH>;
>> +                               debounce = <15625>;
>> +                               bias-pull-up;
>> +                               linux,code = <KEY_POWER>;
>> +                       };
>> +               };
>> +
>> +               pm6150_temp: temp-alarm@2400 {
>> +                       compatible = "qcom,spmi-temp-alarm";
>> +                       reg = <0x2400>;
>> +                       interrupts = <0x0 0x24 0x0 
>> IRQ_TYPE_EDGE_RISING>;
>> +                       io-channels = <&pm6150_adc ADC5_DIE_TEMP>;
>> +                       io-channel-names = "thermal";
>> +                       #thermal-sensor-cells = <0>;
>> +               };
>> +
>> +               pm6150_adc: adc@3100 {
>> +                       compatible = "qcom,spmi-adc5";
>> +                       reg = <0x3100>;
>> +                       interrupts = <0x0 0x31 0x0 
>> IRQ_TYPE_EDGE_RISING>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <0>;
>> +                       #io-channel-cells = <1>;
>> +
>> +                       adc-chan@ADC5_DIE_TEMP {
>> +                               reg = <ADC5_DIE_TEMP>;
>> +                               label = "die_temp";
>> +                       };
>> +               };
>> +
>> +               pm6150_gpio: gpios@c000 {
>> +                       compatible = "qcom,pm6150-gpio", 
>> "qcom,spmi-gpio";
>> +                       reg = <0xc000 0xa00>;
> 
> Drop the size?
> 
Will drop it in next series.
>> +                       gpio-controller;
>> +                       #gpio-cells = <2>;
>> +                       interrupts = <0 0xc0 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc1 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc2 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc3 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc4 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc5 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc6 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc7 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc8 0 IRQ_TYPE_NONE>,
>> +                                    <0 0xc9 0 IRQ_TYPE_NONE>;
> 
> Isn't this supposed to go away?
> 
Yes. We can remove them if we want to go with the way done for pm8998.
>> +
>> +                       interrupt-names = "pm6150_gpio1", 
>> "pm6150_gpio2",
>> +                                       "pm6150_gpio3", 
>> "pm6150_gpio4",
>> +                                       "pm6150_gpio5", 
>> "pm6150_gpio6",
>> +                                       "pm6150_gpio7", 
>> "pm6150_gpio8",
>> +                                       "pm6150_gpio9", 
>> "pm6150_gpio10";
> 
> And this? And have gpio-ranges and use the irqdomain work. Basically,
> should look like pm8998.
Ok.. We can go ahead with the pm8998 way as well. We will address it in 
next series.
> 
>> +               };
>> +       };
>> +
>> +       pm6150_lsid1: pmic@1 {
>> +               compatible = "qcom,pm6150", "qcom,spmi-pmic";
>> +               reg = <0x1 SPMI_USID>;
>> +               #address-cells = <1>;
>> +               #size-cells = <0>;
>> +       };
>> +};
