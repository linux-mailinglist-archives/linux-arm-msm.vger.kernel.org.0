Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C666017155C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 11:56:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728759AbgB0K4A (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 05:56:00 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:26749 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728754AbgB0K4A (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 05:56:00 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582800959; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=3cZIt2T45FhuR9MsW/GWNiPSGv9vPQ9J3TLcsSxKz20=; b=xU7etbtW1hgN+adx5XnW4DbsHJL+til0RqMhfM7svyMU3VvuCOuFmTMHa7V2VKCqgKVJEkFv
 8kzW2hLQTXw0dv4N+h3JnI7cBm7L4ABWHV858aiHrWg+L3N8R+OuiVQE19Skqkdp0jc2dP6h
 K+ZuMY3QF7SEWYfI//abG6VYLZs=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e57a033.7fb5ee1ab110-smtp-out-n01;
 Thu, 27 Feb 2020 10:55:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 75737C433A2; Thu, 27 Feb 2020 10:55:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.242.242.60] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id B4C3BC43383;
        Thu, 27 Feb 2020 10:55:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org B4C3BC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH 1/2] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
 <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
 <e94805e32d1264ca9a162891db26730e@codeaurora.org>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <28fb9f7c-2b62-93e3-4d22-ea428d36d94f@codeaurora.org>
Date:   Thu, 27 Feb 2020 16:25:41 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <e94805e32d1264ca9a162891db26730e@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Sibi,

Thanks for the review.

On 2/27/2020 4:08 PM, Sibi Sankar wrote:
> Hey Sivaprakash,
>
> On 2020-02-27 15:25, Sivaprakash Murugesan wrote:
>> add dt-binding for ipq6018 apss clock controller
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>  .../devicetree/bindings/clock/qcom,apsscc.yaml     | 58 
>> ++++++++++++++++++++++
>>  include/dt-bindings/clock/qcom,apss-ipq6018.h      | 26 ++++++++++
>>  2 files changed, 84 insertions(+)
>>  create mode 100644 
>> Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>>  create mode 100644 include/dt-bindings/clock/qcom,apss-ipq6018.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>> b/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>> new file mode 100644
>> index 0000000..7433721
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>
> Dual license
missed it. will add in next series.
>
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/clock/qcom,apsscc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ6018 APSS Clock Controller Binding
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
>> +
>> +description: |
>> +  Qualcomm IPQ6018 APSS clock control module which supports the 
>> clocks with
>> +  frequencies above 800Mhz.
>> +
>> +properties:
>> +  compatible :
>> +    const: qcom,apss-ipq6018
>
> Please use qcom,<chip>-<device>
> instead.
ok.
>
>> +
>> +  clocks:
>> +    description: clocks required for this controller.
>> +    maxItems: 4
>> +
>> +  clock-names:
>> +    description: clock output names of required clocks.
>> +    maxItems: 4
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +      #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
>> +      apss_clk: qcom,apss_clk@b111000 {
>> +            compatible = "qcom,apss-ipq6018";
>> +            clocks = <&xo>, <&gcc GPLL0>,
>> +                        <&gcc GPLL2>, <&gcc GPLL4>;
>> +            clock-names = "xo", "gpll0",
>> +                         "gpll2", "gpll4";
>> +            reg = <0xb11100c 0x5ff4>;
>> +            #clock-cells = <1>;
>> +            #reset-cells = <1>;
>> +      };
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,apss-ipq6018.h
>> b/include/dt-bindings/clock/qcom,apss-ipq6018.h
>> new file mode 100644
>> index 0000000..ed9d7d8
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,apss-ipq6018.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2016-2018, The Linux Foundation. All rights reserved.
>> + *
>> + * Permission to use, copy, modify, and/or distribute this software 
>> for any
>> + * purpose with or without fee is hereby granted, provided that the 
>> above
>> + * copyright notice and this permission notice appear in all copies.
>> + *
>> + * THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL 
>> WARRANTIES
>> + * WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF
>> + * MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE 
>> LIABLE FOR
>> + * ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY 
>> DAMAGES
>> + * WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER 
>> IN AN
>> + * ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING 
>> OUT OF
>> + * OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
>
> ^^ is not needed just the SPDX
> license identifier is enough.
>
ok.

Thanks,

Siva
