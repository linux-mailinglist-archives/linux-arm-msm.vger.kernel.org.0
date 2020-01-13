Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E7803138E6A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Jan 2020 11:00:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726435AbgAMKA4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Jan 2020 05:00:56 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:32314 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725978AbgAMKA4 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Jan 2020 05:00:56 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1578909655; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RPURW72SFQ891pWyYWf7dVfpvaaTXLcXOdIIKMpcbVc=; b=imzMbAJnG734QE5G6laKfKVbdC3NZs4aB9GP7pTTGVViPwePjDnXwQT2+db1IucjdLOYi6Ov
 47Y6tolbI3BRrvN9JNBsVb5ANfyTfJqCY7oy+AQvCWtoUzYPvGfNmCchJwpiuqgs4KBX8eAT
 oWL+XU17SIAg3kbiY3TwBw5D51o=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e1c3fd6.7f0c8ce037a0-smtp-out-n01;
 Mon, 13 Jan 2020 10:00:54 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DAE42C433A2; Mon, 13 Jan 2020 10:00:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.28.9] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2B3E7C43383;
        Mon, 13 Jan 2020 10:00:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2B3E7C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: Add YAML schemas for the QCOM
 MSS clock bindings
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
 <1577421760-1174-2-git-send-email-tdas@codeaurora.org>
 <20200104213645.GA25711@bogus>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <2d4a70f0-c882-a15b-cfa8-7fefef59f45b@codeaurora.org>
Date:   Mon, 13 Jan 2020 15:30:47 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <20200104213645.GA25711@bogus>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Rob,

Thanks for your review.

On 1/5/2020 3:06 AM, Rob Herring wrote:

>> +description: |
>> +  Qualcomm modem clock control module which supports the clocks.
>> +
>> +properties:
>> +  compatible :
> 
> drop space     ^
> 

Will take care in the next patch.

>> +    enum:
>> +       - qcom,sc7180-mss
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  additionalItems: false
> 
> With the indentation here, you are defining a property. Should be no
> indent.
> 

I tried removing the indent too, but I keep getting this error.
  Additional properties are not allowed ('additionalItems' was unexpected)

Please let me know if I am missing something?

>> +
>> +required:
>> +  - compatible
>> +  - reg
>> +  - '#clock-cells'
>> +
>> +examples:
>> +  # Example of MSS with clock nodes properties for SC7180:
>> +  - |
>> +    clock-controller@41aa000 {
>> +      compatible = "qcom,sc7180-mss";
>> +      reg = <0x041aa000 0x100>;
>> +      #clock-cells = <1>;
>> +    };
>> +...
>> --
>> Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
>> of the Code Aurora Forum, hosted by the  Linux Foundation.
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
