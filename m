Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84F021E3F7B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 13:01:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729451AbgE0LA6 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 07:00:58 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:30613 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729136AbgE0LA6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 07:00:58 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1590577257; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: To:
 Subject: Sender; bh=ymHDh98wpD0ql5S8OT+2qdYkMs5fUdlbcxfmzMaxXsQ=; b=CDrjnmobB1ARZBJ+b5ZwnX5owFY7MJd64rNwVf5mbx61PASw/X7LgqxZC9VgR2utdjr7yg6a
 WGwHfCDtqClwwTRjEoOHF1p4E2ooWCzBrhgQaPOQqiAPy4whuE8fpEGK5ur6qprmUO07lSkE
 qj/hM8UmLTsYJsmX3rK4spkkRwM=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 5ece4841bf0e32d254554d30 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 27 May 2020 11:00:17
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id E056AC433C6; Wed, 27 May 2020 11:00:16 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.104] (unknown [49.207.133.24])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sivaprak)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 69A12C433C9;
        Wed, 27 May 2020 11:00:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 69A12C433C9
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sivaprak@codeaurora.org
Subject: Re: [PATCH V5 4/8] clk: qcom: Add DT bindings for ipq6018 apss clock
 controller
To:     Stephen Boyd <sboyd@kernel.org>, agross@kernel.org,
        bjorn.andersson@linaro.org, devicetree@vger.kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, robh+dt@kernel.org
References: <1590314686-11749-1-git-send-email-sivaprak@codeaurora.org>
 <1590314686-11749-5-git-send-email-sivaprak@codeaurora.org>
 <159054661322.88029.16916819048155217664@swboyd.mtv.corp.google.com>
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
Message-ID: <fc1a7c54-1c6f-2996-a610-4611e3788726@codeaurora.org>
Date:   Wed, 27 May 2020 16:30:10 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <159054661322.88029.16916819048155217664@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 5/27/2020 8:00 AM, Stephen Boyd wrote:
> Quoting Sivaprakash Murugesan (2020-05-24 03:04:42)
>> add dt-binding for ipq6018 apss clock controller
> Capitalize 'add' because it starts the sentence.
ok.
>
>> Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
>> ---
>>   include/dt-bindings/clock/qcom,apss-ipq.h | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>   create mode 100644 include/dt-bindings/clock/qcom,apss-ipq.h
>>
>> diff --git a/include/dt-bindings/clock/qcom,apss-ipq.h b/include/dt-bindings/clock/qcom,apss-ipq.h
>> new file mode 100644
>> index 0000000..77b6e05
>> --- /dev/null
>> +++ b/include/dt-bindings/clock/qcom,apss-ipq.h
>> @@ -0,0 +1,12 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#ifndef _DT_BINDINGS_CLOCK_QCA_APSS_IPQ6018_H
>> +#define _DT_BINDINGS_CLOCK_QCA_APSS_IPQ6018_H
>> +
>> +#define APCS_ALIAS0_CLK_SRC                    0
>> +#define APCS_ALIAS0_CORE_CLK                   1
> Will this be extended in the future? I hope that this is the only two
> clks we expect to see in this file.
yes you're right. these are the only two clocks.
