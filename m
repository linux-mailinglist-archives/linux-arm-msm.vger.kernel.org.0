Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 77CB136C20A
	for <lists+linux-arm-msm@lfdr.de>; Tue, 27 Apr 2021 11:48:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235288AbhD0JtR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 27 Apr 2021 05:49:17 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:49556 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235254AbhD0JtP (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 27 Apr 2021 05:49:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619516912; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=V2455/5ziV5ITK7UZ94I41mNmQXdKhtn/Y4PgDr3HUk=; b=OV5sIoORLrNCiIuqKoaPlkACq3JxSAQjsSBS2jV+Mo/AhiVxedatdv+hHNVkvy8ODhY8kdMs
 4e/VjFfKul3upUZoG+RdYJ5uUupIKgTRqFvaRDDvBMrooVycxFQ5Xt6CGw+PaXh/rPgKZsR8
 zw7oYnjCLYwXB4Q6yDeFioW1RoQ=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 6087ddee853c0a2c46870204 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 09:48:30
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 52503C4338A; Tue, 27 Apr 2021 09:48:29 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [192.168.0.102] (unknown [49.204.181.87])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 48FB9C433F1;
        Tue, 27 Apr 2021 09:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 48FB9C433F1
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v1 1/6] dt-bindings: clock: Add SC7280 DISPCC clock
 binding
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1615944142-12171-1-git-send-email-tdas@codeaurora.org>
 <1615944142-12171-2-git-send-email-tdas@codeaurora.org>
 <20210326001120.GA2001669@robh.at.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <1444cad1-6ccd-397f-b1f5-86bca02edaff@codeaurora.org>
Date:   Tue, 27 Apr 2021 15:18:23 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210326001120.GA2001669@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


Hello Rob,

Thank you for your review.

On 3/26/2021 5:41 AM, Rob Herring wrote:
> On Wed, Mar 17, 2021 at 06:52:17AM +0530, Taniya Das wrote:
>> Add device tree bindings for display clock controller subsystem for
>> Qualcomm Technology Inc's SC7280 SoCs.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   .../bindings/clock/qcom,sc7280-dispcc.yaml         | 94 ++++++++++++++++++++++
>>   include/dt-bindings/clock/qcom,dispcc-sc7280.h     | 55 +++++++++++++
>>   2 files changed, 149 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
>>   create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7280.h

>> +...
>> diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
>> new file mode 100644
>> index 0000000..2074b30
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
>> @@ -0,0 +1,55 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> Dual license?
> 
> Rob
> 

As per our legal team we still need to use the GPL-2.0-only license.


-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
