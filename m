Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3AB819E9EF
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 10:30:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726397AbgDEIar (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Apr 2020 04:30:47 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:17897 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726402AbgDEIar (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Apr 2020 04:30:47 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586075447; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=boJiaV3EccHj3kSwD3JA7pnnQAJZ7j95LcXsC2qfwdk=; b=CLSoNEy6U3jxtVg1sV6U6mYUUJWWMoeIiWESy3bcxzLS95sITeBHh3sap1MPHdoEa3MK0Z8O
 MPrMLHc5tbRal9BaRkDabZeHdMoYxoft9r6tBRe2rbHn58v8HX7mmijrn75frezIQ2xlTU9o
 gcXMFRKF6WO8v52RqRgAwVLTgUA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e899727.7f860ad8f180-smtp-out-n01;
 Sun, 05 Apr 2020 08:30:31 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 73276C433D2; Sun,  5 Apr 2020 08:30:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.206.125.103])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 5564BC433F2;
        Sun,  5 Apr 2020 08:30:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5564BC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH 1/2] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1582797318-26288-1-git-send-email-sivaprak@codeaurora.org>
 <1582797318-26288-2-git-send-email-sivaprak@codeaurora.org>
 <20200309211349.GA10752@bogus>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <a8248eb8-ed65-7d80-7824-08aef22a963b@codeaurora.org>
Date:   Sun, 5 Apr 2020 14:00:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200309211349.GA10752@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thanks for the review.

On 3/10/2020 2:43 AM, Rob Herring wrote:
> On Thu, Feb 27, 2020 at 03:25:17PM +0530, Sivaprakash Murugesan wrote:
>> add dt-binding for ipq6018 apss clock controller
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   .../devicetree/bindings/clock/qcom,apsscc.yaml     | 58 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,apss-ipq6018.h      | 26 ++++++++++
>>   2 files changed, 84 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,apss-ipq6018.h
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml b/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>> new file mode 100644
>> index 0000000..7433721
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,apsscc.yaml
>> @@ -0,0 +1,58 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
> Dual license new bindings please:
>
> (GPL-2.0-only OR BSD-2-Clause)
ok.
>
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/bindings/clock/qcom,apsscc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm IPQ6018 APSS Clock Controller Binding
>> +
>> +maintainers:
>> +  - Stephen Boyd <sboyd@kernel.org>
> I'd expect this to be a QCom person, not who is applying patches.
>
>> +
>> +description: |
> You can drop '|'.
ok.
>> +  Qualcomm IPQ6018 APSS clock control module which supports the clocks with
>> +  frequencies above 800Mhz.
>> +
>> +properties:
>> +  compatible :
>> +    const: qcom,apss-ipq6018
> Normal ordering is: qcom,ipq6018-apss
ok.
>> +
>> +  clocks:
>> +    description: clocks required for this controller.
>> +    maxItems: 4
> Need to define what each clock is.
ok.
>> +
>> +  clock-names:
>> +    description: clock output names of required clocks.
>> +    maxItems: 4
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  '#reset-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +  - '#reset-cells'
>> +
>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +      #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
>> +      apss_clk: qcom,apss_clk@b111000 {
> I thought I'd finally seen the last of these Qcom node names...
>
> clock-controller@...
ok.
>> +            compatible = "qcom,apss-ipq6018";
>> +            clocks = <&xo>, <&gcc GPLL0>,
>> +                        <&gcc GPLL2>, <&gcc GPLL4>;
>> +            clock-names = "xo", "gpll0",
>> +                         "gpll2", "gpll4";
>> +            reg = <0xb11100c 0x5ff4>;
>> +            #clock-cells = <1>;
>> +            #reset-cells = <1>;
>> +      };
>> +...
>> diff --git a/include/dt-bindings/clock/qcom,apss-ipq6018.h b/include/dt-bindings/clock/qcom,apss-ipq6018.h
>> new file mode 100644
>> index 0000000..ed9d7d8
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,apss-ipq6018.h
>> @@ -0,0 +1,26 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
> I'm pretty sure your employer would like an additional license here.
my bad. will correct it.
