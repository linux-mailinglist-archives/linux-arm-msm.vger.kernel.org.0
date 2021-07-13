Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FF173C68B3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 04:55:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhGMC6M (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 12 Jul 2021 22:58:12 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:23030 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234116AbhGMC6L (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 12 Jul 2021 22:58:11 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626144921; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=gZeXd18Y7hmR404HpwMl2cb8wh6vrKs8MoX1XzZwIus=; b=eUp80OHU+OVpl2U3CbaIt7dKUWAegADoBWQjZ8mN916B4SpXKZgm2oPHUxNIyJf2c0U7R0Es
 SQ9K3M9bU/0BcVmPq5MrABlxflLSicU1rQnHf7iNrxro5zP66ZdFjjYgCL1l4KxT5fwoNQ8E
 x/K7pcXQjF8xJTUpDcEjnYEHDzg=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60ed0099c4cc543602cc33c6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 02:55:21
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DECE9C4360C; Tue, 13 Jul 2021 02:55:20 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.100] (unknown [49.204.181.76])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6D04EC43217;
        Tue, 13 Jul 2021 02:55:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6D04EC43217
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: Add SC7280 DISPCC clock
 binding
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <1619519590-3019-1-git-send-email-tdas@codeaurora.org>
 <1619519590-3019-2-git-send-email-tdas@codeaurora.org>
 <20210503191837.GA2220566@robh.at.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <8243809b-97ba-3c7e-3d20-bb0e5995242c@codeaurora.org>
Date:   Tue, 13 Jul 2021 08:25:14 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210503191837.GA2220566@robh.at.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hello Rob,

Thanks for the review.

On 5/4/2021 12:48 AM, Rob Herring wrote:
> On Tue, Apr 27, 2021 at 04:03:05PM +0530, Taniya Das wrote:
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
>>
>> diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
>> new file mode 100644
>> index 0000000..2178666
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/clock/qcom,sc7280-dispcc.yaml
>> @@ -0,0 +1,94 @@
>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)

>> +...
>> diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
>> new file mode 100644
>> index 0000000..2074b30
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
>> @@ -0,0 +1,55 @@
>> +/* SPDX-License-Identifier: GPL-2.0-only */
> 
> Dual license please. I'm tired of telling the company that complained to
> me about having dual licensing for DT stuff not dual license their
> stuff. Please pass that on to your coworkers.
> 
> Rob
> 
Rob, I have taken a note on this and will be taken care from the next time.

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
