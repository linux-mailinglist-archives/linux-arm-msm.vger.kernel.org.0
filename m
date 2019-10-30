Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 20F14E9644
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2019 07:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbfJ3GGo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 30 Oct 2019 02:06:44 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:46510 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726627AbfJ3GGo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 30 Oct 2019 02:06:44 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C02F660F36; Wed, 30 Oct 2019 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572415603;
        bh=4s51Cnb1yRkUC9YAVygkrHqi5ty/axuCrm5Hc1HwD1k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EuV+imwY8HNt7pVYcglKgm5zzIwv6ou9HN0JTsUjPoV/YpeZEzhRrlnU9iLUJb2ui
         j2/BZIHFa1Ag3ZcWfn4D94+DifneSRMUMuaj0aM4PwSvLrGff0N/R5bgzwTM9NiRNN
         AQeSmEQ1izCnOe2hTmn/wU801uqKeT9TzO7kZ8gw=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        by smtp.codeaurora.org (Postfix) with ESMTP id 229CE60DF8;
        Wed, 30 Oct 2019 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572415603;
        bh=4s51Cnb1yRkUC9YAVygkrHqi5ty/axuCrm5Hc1HwD1k=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=EuV+imwY8HNt7pVYcglKgm5zzIwv6ou9HN0JTsUjPoV/YpeZEzhRrlnU9iLUJb2ui
         j2/BZIHFa1Ag3ZcWfn4D94+DifneSRMUMuaj0aM4PwSvLrGff0N/R5bgzwTM9NiRNN
         AQeSmEQ1izCnOe2hTmn/wU801uqKeT9TzO7kZ8gw=
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 30 Oct 2019 11:36:43 +0530
From:   kgunda@codeaurora.org
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter
 device
In-Reply-To: <5db86bb1.1c69fb81.dc254.ec0b@mx.google.com>
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-8-rnayak@codeaurora.org>
 <5db86bb1.1c69fb81.dc254.ec0b@mx.google.com>
Message-ID: <78809ef8464c46018f3803454c1165ab@codeaurora.org>
X-Sender: kgunda@codeaurora.org
User-Agent: Roundcube Webmail/1.2.5
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2019-10-29 22:11, Stephen Boyd wrote:
> Quoting Rajendra Nayak (2019-10-23 02:02:15)
>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi 
>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> index 04808a07d7da..6584ac6e6c7b 100644
>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>> @@ -224,6 +224,25 @@
>>                         };
>>                 };
>> 
>> +               spmi_bus: spmi@c440000 {
>> +                       compatible = "qcom,spmi-pmic-arb";
>> +                       reg = <0 0xc440000 0 0x1100>,
> 
> Please pad out the registers to 8 numbers. See sdm845.
Ok.. Will address it in the next series.
> 
>> +                             <0 0xc600000 0 0x2000000>,
>> +                             <0 0xe600000 0 0x100000>,
>> +                             <0 0xe700000 0 0xa0000>,
>> +                             <0 0xc40a000 0 0x26000>;
>> +                       reg-names = "core", "chnls", "obsrvr", "intr", 
>> "cnfg";
>> +                       interrupt-names = "periph_irq";
>> +                       interrupts-extended = <&pdc 1 
>> IRQ_TYPE_LEVEL_HIGH>;
> 
> This is different than sdm845. I guess pdc is working?
> 
Yes. For SDM845 pdc controller support was not yet added. That's why 
still the GIC interrupt is used.
Where as for SC7180 the same is added with 
https://lore.kernel.org/patchwork/patch/1143335/.

Yes. pdc is working.

>> +                       qcom,ee = <0>;
>> +                       qcom,channel = <0>;
>> +                       #address-cells = <1>;
>> +                       #size-cells = <1>;
>> +                       interrupt-controller;
>> +                       #interrupt-cells = <4>;
>> +                       cell-index = <0>;
>> +               };
>> +
