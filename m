Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A42A01C3278
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 08:13:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726351AbgEDGNV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 02:13:21 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:45464 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726578AbgEDGNU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 02:13:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588572800; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=n1p6li4Xuz/6c1Nhj86yaagMtq92rJ3fklK1ugfeMiY=; b=pbp92rxJlFaERkQZF/ELBYMXxAd2axe3SMGfzs0MOCh1S2S+g6y+RHbaMbbUUu1aeHEKKfkb
 sPKGw+qVb5WWefTgHz0UF176nxz+NONFL40NcIJ02ML+k55KKyXAiZTecPf1699wOtLrhkVL
 AaLctcfUIuv8Ar5BMNuox13SID8=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eafb27d.7f3d15f392d0-smtp-out-n03;
 Mon, 04 May 2020 06:13:17 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 4FCA9C433F2; Mon,  4 May 2020 06:13:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.105] (unknown [49.206.125.126])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D0A8AC433CB;
        Mon,  4 May 2020 06:13:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D0A8AC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V3 2/8] dt-bindings: clock: Add YAML schemas for QCOM A53
 PLL
To:     Rob Herring <robh@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1586832922-29191-1-git-send-email-sivaprak@codeaurora.org>
 <1586832922-29191-3-git-send-email-sivaprak@codeaurora.org>
 <20200420210108.GA19108@bogus>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <44a5cb0d-f9bc-5322-0333-bb39d43f6613@codeaurora.org>
Date:   Mon, 4 May 2020 11:43:11 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200420210108.GA19108@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

On 4/21/2020 2:31 AM, Rob Herring wrote:
> On Tue, Apr 14, 2020 at 08:25:16AM +0530, Sivaprakash Murugesan wrote:
>> This patch adds schema for primary CPU PLL found on few Qualcomm
>> platforms.
>>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>> [V3]
>>   * Fixed dt binding error in "$id" field.
>>
>>   .../devicetree/bindings/clock/qcom,a53pll.txt      | 22 --------
>>   .../devicetree/bindings/clock/qcom,a53pll.yaml     | 60 ++++++++++++++++++++++
>>   2 files changed, 60 insertions(+), 22 deletions(-)
>>   delete mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt b/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>> deleted file mode 100644
>> index e3fa811..0000000
>> --- a/Documentation/devicetree/bindings/clock/qcom,a53pll.txt
>> +++ /dev/null
>> @@ -1,22 +0,0 @@
>> -Qualcomm MSM8916 A53 PLL Binding
>> ---------------------------------
>> -The A53 PLL on MSM8916 platforms is the main CPU PLL used used for frequencies
>> -above 1GHz.
>> -
>> -Required properties :
>> -- compatible : Shall contain only one of the following:
>> -
>> -		"qcom,msm8916-a53pll"
>> -
>> -- reg : shall contain base register location and length
>> -
>> -- #clock-cells : must be set to <0>
>> -
>> -Example:
>> -
>> -	a53pll: clock@b016000 {
>> -		compatible = "qcom,msm8916-a53pll";
>> -		reg = <0xb016000 0x40>;
>> -		#clock-cells = <0>;
>> -	};
>> -
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
>> new file mode 100644
>> index 0000000..c865293
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,a53pll.yaml
>> @@ -0,0 +1,60 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,a53pll.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm A53 PLL Binding
>> +
>> +maintainers:
>> +  - Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> +
>> +description:
>> +  The A53 PLL on few Qualcomm platforms is the main CPU PLL used used for
>> +  frequencies above 1GHz.
>> +
>> +properties:
>> +  compatible:
>> +    enum:
>> +      - qcom,msm8916-a53pll
>> +      - qcom,ipq6018-a53pll
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 0
>> +
>> +  clocks:
>> +    description: clocks required for this controller.
> That's every 'clocks'. Drop.
ok.
>
>> +    maxItems: 1
>> +
>> +  clock-names:
>> +    description: clock output names of required clocks.
> Drop. 'clock-names' are the input names.
ok.
>
>> +    maxItems: 1
> Need to define what the names are.

ok.

>
