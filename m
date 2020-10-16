Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97C71290B76
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Oct 2020 20:39:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392484AbgJPSj4 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 16 Oct 2020 14:39:56 -0400
Received: from z5.mailgun.us ([104.130.96.5]:60048 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2392477AbgJPSjz (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 16 Oct 2020 14:39:55 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602873595; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9Gid72wEadRImxYnSiws1qhuRttmymzLuEgieie0FVk=; b=u0iIp+mwdQolepd9L7aaDfbIBpmfQuiGhFsYdVIAV8W2MicgmBBlQBFUXWmeUgfhENd8XK+s
 fU9rgujkkaKMQTXLCcOG1Ou86Vb/a+hTazjsPLCZubpwbpKsmMNJJRk7Ie0veEjimC3m8lcq
 wvAaAiIpYi8Ffp7cLk+X4+pZr6s=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 5f89e8fba03b63d673b947db (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 16 Oct 2020 18:39:55
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 25342C433FE; Fri, 16 Oct 2020 18:39:55 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.2 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.105] (unknown [49.204.183.234])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0BE4FC433C9;
        Fri, 16 Oct 2020 18:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0BE4FC433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: Add YAML schemas for the QCOM
 Camera clock bindings.
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1602609110-11504-1-git-send-email-tdas@codeaurora.org>
 <1602609110-11504-3-git-send-email-tdas@codeaurora.org>
 <160264138707.310579.18410759318207954658@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <73c47703-b6cf-5ab7-949b-45231f883d1c@codeaurora.org>
Date:   Sat, 17 Oct 2020 00:09:48 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.2
MIME-Version: 1.0
In-Reply-To: <160264138707.310579.18410759318207954658@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Thanks for your review Stephen.

On 10/14/2020 7:39 AM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-10-13 10:11:49)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
>> new file mode 100644
>> index 0000000..07bd38e
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7180-camcc.yaml
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: http://devicetree.org/schemas/clock/qcom,sc7180-camcc.yaml#
>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>> +
>> +title: Qualcomm Camera Clock & Reset Controller Binding for SC7180
>> +
>> +maintainers:
>> +  - Taniya Das <tdas@codeaurora.org>
>> +
>> +description: |
>> +  Qualcomm camera clock control module which supports the clocks, resets and
>> +  power domains on SC7180.
>> +
>> +  See also:
>> +  - dt-bindings/clock/qcom,camcc-sc7180.h.
> 
> Maybe just
> 
>       - dt-bindings/clock/qcom,camcc-sc7180.h
> 
> so that us copy/pasters don't have to delete anything.
> 

Will be fixed in the next patch.

>> +
>> +properties:
>> +  compatible:
>> +    const: qcom,sc7180-camcc
>> +
>> +  clocks:
>> +    items:
>> +      - description: Board XO source
>> +      - description: Camera_ahb clock from GCC
>> +      - description: Camera XO clock from GCC
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
