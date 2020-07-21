Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8014E22874F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Jul 2020 19:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730392AbgGUR1H (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Jul 2020 13:27:07 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:23445 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730383AbgGUR1H (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Jul 2020 13:27:07 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1595352426; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=tn7ejI+sUf3otsLmxloNW0nHWliUL6j6F994zKSOkpc=; b=GrsaIZkLQTYaCAkjBM10OcHRtRwlr9MQAdM484Wvv402YVkx/aab2TtRRec6el+5TWuBW/jh
 KflWbTRRqdhV/vKab/61YPCTql/IL0SS9FqtJBEaBFR8YXa8+RTlAbUmrskXNSkjW511OMpf
 49tMG7uLbNtAUH/REYtahRYIEUk=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n11.prod.us-west-2.postgun.com with SMTP id
 5f1725640cb8533c3bef1e69 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 21 Jul 2020 17:27:00
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7FEF6C433CA; Tue, 21 Jul 2020 17:27:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,NICE_REPLY_A,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.106] (unknown [183.82.139.81])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 07DB0C433C6;
        Tue, 21 Jul 2020 17:26:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 07DB0C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: Add YAML schemas for LPASS
 clocks on SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1594795010-9074-1-git-send-email-tdas@codeaurora.org>
 <1594795010-9074-3-git-send-email-tdas@codeaurora.org>
 <159531791606.3847286.11896325263133276429@swboyd.mtv.corp.google.com>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <01daee94-756d-3970-9057-849de2b76430@codeaurora.org>
Date:   Tue, 21 Jul 2020 22:56:53 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <159531791606.3847286.11896325263133276429@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Stephen,

Thanks for the review.

On 7/21/2020 1:21 PM, Stephen Boyd wrote:

>> +...
>> diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> index 992b67b..bdf43adc 100644
>> --- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> +++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
>> @@ -138,6 +138,7 @@
>>   #define GCC_MSS_Q6_MEMNOC_AXI_CLK                              128
>>   #define GCC_MSS_SNOC_AXI_CLK                                   129
>>   #define GCC_SEC_CTRL_CLK_SRC                                   130
>> +#define GCC_LPASS_CFG_NOC_SWAY_CLK                             131
>>   
>>   /* GCC resets */
>>   #define GCC_QUSB2PHY_PRIM_BCR                                  0
> 
> This hunk should be in the next patch. Oh but then that patch should come
> before this one so the binding can use it. Either way, shouldn't be part
> of this patch.
> 


We had a problem with the bot complaining about the clock handles being 
used in the example.

https://patchwork.ozlabs.org/project/devicetree-bindings/patch/1582540703-6328-4-git-send-email-tdas@codeaurora.org/

Thus I have kept the GCC bindings in the same patch.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
