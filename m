Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id AC25FED8D6
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Nov 2019 07:10:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbfKDGK0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Nov 2019 01:10:26 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:39394 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726018AbfKDGK0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Nov 2019 01:10:26 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 6F8B860DB2; Mon,  4 Nov 2019 06:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572847824;
        bh=8tcOCKHQZRIcJjtP4P0n1Zbt/82iSgNJOJvKIHBc88M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=j+VsS3+p0Z72Vg9rMV7WxIUXLDiAhcOR+Z50UskGg7DaowwEJd/8nuoDeODaYW3MA
         D2qKCh0pGjdjLloa5GuO6uGcLXWYaMVJRjim7s049vZ2GYOzt/8V/79YmmTuDKBCPT
         MnDXOxpN8O3tHwg6nvF23XX/YwlZWzC3VEhD6tl8=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D865760DB1;
        Mon,  4 Nov 2019 06:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572847823;
        bh=8tcOCKHQZRIcJjtP4P0n1Zbt/82iSgNJOJvKIHBc88M=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=Hqr3aDFdURVqyEdj7QkUfbqV86NGo91ALjELqmtbJxes6vfws38wmxv0aO4xpTGd+
         7wVeOw1fx2R7qBe8UzwfgOCxFMPuNKCUpnVcPz7ehg4CQkrwdkN8qQgqPPj/10cTWL
         fWyZBKC36J4uUQfBmXDw9Gb5l9zdPZL4mT+QuBaI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D865760DB1
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v3 07/11] arm64: dts: qcom: sc7180: Add SPMI PMIC arbiter
 device
To:     Stephen Boyd <swboyd@chromium.org>, kgunda@codeaurora.org
Cc:     agross@kernel.org, bjorn.andersson@linaro.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mka@chromium.org
References: <20191023090219.15603-1-rnayak@codeaurora.org>
 <20191023090219.15603-8-rnayak@codeaurora.org>
 <5db86bb1.1c69fb81.dc254.ec0b@mx.google.com>
 <78809ef8464c46018f3803454c1165ab@codeaurora.org>
 <5db9a00d.1c69fb81.c3df6.04eb@mx.google.com>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <4a8801c0-97a3-69f9-abf7-4a74c90d40a3@codeaurora.org>
Date:   Mon, 4 Nov 2019 11:40:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <5db9a00d.1c69fb81.c3df6.04eb@mx.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 10/30/2019 8:07 PM, Stephen Boyd wrote:
> Quoting kgunda@codeaurora.org (2019-10-29 23:06:43)
>> On 2019-10-29 22:11, Stephen Boyd wrote:
>>> Quoting Rajendra Nayak (2019-10-23 02:02:15)
>>>> diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> index 04808a07d7da..6584ac6e6c7b 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
>>>> @@ -224,6 +224,25 @@
>>>>                          };
>>>>                  };
>>>>
>>>> +               spmi_bus: spmi@c440000 {
>>>> +                       compatible = "qcom,spmi-pmic-arb";
>>>> +                       reg = <0 0xc440000 0 0x1100>,
>>>
>>> Please pad out the registers to 8 numbers. See sdm845.
>> Ok.. Will address it in the next series.
>>>
>>>> +                             <0 0xc600000 0 0x2000000>,
>>>> +                             <0 0xe600000 0 0x100000>,
>>>> +                             <0 0xe700000 0 0xa0000>,
>>>> +                             <0 0xc40a000 0 0x26000>;
>>>> +                       reg-names = "core", "chnls", "obsrvr", "intr",
>>>> "cnfg";
>>>> +                       interrupt-names = "periph_irq";
>>>> +                       interrupts-extended = <&pdc 1
>>>> IRQ_TYPE_LEVEL_HIGH>;
>>>
>>> This is different than sdm845. I guess pdc is working?
>>>
>> Yes. For SDM845 pdc controller support was not yet added. That's why
>> still the GIC interrupt is used.
>> Where as for SC7180 the same is added with
>> https://lore.kernel.org/patchwork/patch/1143335/.
>>
>> Yes. pdc is working.
> 
> Cool. The patch that adds pdc to the DT should come before this one
> then. In reality, it would be better if it was all squashed down into
> one big commit that just introduces the SoC file and one commit for
> PMICs and then one commit for the idp board. Then we don't have this
> ordering problem.

I'll fix the ordering issues when I respin.
I could squash all of the patches touching the SoC dtsi, but given the
authorship for each varies, I will keep it as is perhaps.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation
