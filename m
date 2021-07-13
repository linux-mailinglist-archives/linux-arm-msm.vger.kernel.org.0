Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 108DF3C68BD
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 04:57:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233494AbhGMDAG (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 23:00:06 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23030 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229928AbhGMDAF (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 23:00:05 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626145036; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=RmXewzLhFyWGUv8Mf1qgcTDZ7fkMMpE5+fKjXSyTof8=; b=uBaIjCKjR7EzkZATeuwdU2DBmHHsG0IOyvePUtkwsgykXi2jQQtNCoIlT7+YU3iZdS9/EGMp
 OWJZNBSvE9t7tRuFhRh2HWfZofzyFxLyGMuDp3XpxfUr3aaOliF9sQnp4dIreQEFE00XWGM3
 raX3FjXDxpxrBRl4F7lKaqaZLDI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60ed010c01dd9a9431626dcc (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 02:57:16
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2EA4BC433F1; Tue, 13 Jul 2021 02:57:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.204.181.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C5272C433D3;
        Tue, 13 Jul 2021 02:57:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C5272C433D3
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 3/6] dt-bindings: clock: Add SC7280 GPUCC clock binding
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org>
 <1619519590-3019-4-git-send-email-tdas@codeaurora.org>
 <162261721239.4130789.8314129952052939804@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <208ac6e4-749c-7ee7-5a05-1fef12e134d8@codeaurora.org>
Date:   Tue, 13 Jul 2021 08:27:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <162261721239.4130789.8314129952052939804@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Stephen,

Thanks for your review.

On 6/2/2021 12:30 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2021-04-27 03:33:07)
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>> index df943c4..7e3f9e7 100644
>> --- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>> +++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
>> @@ -11,11 +11,12 @@ maintainers:
>>   
>>   description: |
>>     Qualcomm graphics clock control module which supports the clocks, resets and
>> -  power domains on SDM845/SC7180/SM8150/SM8250.
>> +  power domains on SDM845/SC7180/SC7280/SM8150/SM8250.
> 
> Can we stop updating this line? Just say "power domains on Qualcomm
> SoCs"?
> 

This will be updated in the next series.

>>   
>>     See also:
>>       dt-bindings/clock/qcom,gpucc-sdm845.h
>>       dt-bindings/clock/qcom,gpucc-sc7180.h
>> +    dt-bindings/clock/qcom,gpucc-sc7280.h
>>       dt-bindings/clock/qcom,gpucc-sm8150.h
>>       dt-bindings/clock/qcom,gpucc-sm8250.h
>>   
>> @@ -24,6 +25,7 @@ properties:
>>       enum:
>>         - qcom,sdm845-gpucc
>>         - qcom,sc7180-gpucc
>> +      - qcom,sc7280-gpucc
>>         - qcom,sm8150-gpucc
>>         - qcom,sm8250-gpucc
>>

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
