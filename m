Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6910D162E65
	for <lists+linux-arm-msm@lfdr.de>; Tue, 18 Feb 2020 19:23:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726391AbgBRSWy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 18 Feb 2020 13:22:54 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:17132 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726384AbgBRSWy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 18 Feb 2020 13:22:54 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582050173; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=J5eQDgly6Od6K2D2z6YcEubcDGKZcSjnWibzy0LGV3M=; b=ji8LelVXx2009d2uazuRa6E6NOee/U1P36fd/uqQXrL7e9dsB5hCkwNsLJq32WzebCSu3Roc
 KjaCFCeZLkN47rH0HgDet0cNXji90U4GHWTwrxh63E7zjnc9+CZ2c3ps4F26Hwiw2HNo2EUF
 FrcrN8Ys0nTHcu61g+vdOhImZKE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e4c2b77.7f0ec43316c0-smtp-out-n02;
 Tue, 18 Feb 2020 18:22:47 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 82012C4479D; Tue, 18 Feb 2020 18:22:47 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.0.107] (unknown [183.83.146.168])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DE274C43383;
        Tue, 18 Feb 2020 18:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DE274C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
Subject: Re: [PATCH v3 3/3] clk: qcom: Add modem clock controller driver for
 SC7180
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org
References: <1580357923-19783-1-git-send-email-tdas@codeaurora.org>
 <1580357923-19783-4-git-send-email-tdas@codeaurora.org>
 <20200130180856.6B65C20678@mail.kernel.org>
From:   Taniya Das <tdas@codeaurora.org>
Message-ID: <255a6ddf-bd34-3249-ad86-62cb486a7e41@codeaurora.org>
Date:   Tue, 18 Feb 2020 23:52:39 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200130180856.6B65C20678@mail.kernel.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org



On 1/30/2020 11:38 PM, Stephen Boyd wrote:
> Quoting Taniya Das (2020-01-29 20:18:43)
>> Add support for the modem clock controller found on SC7180
>> based devices. This would allow modem drivers to probe and
>> control their clocks.
>>
>> Signed-off-by: Taniya Das <tdas@codeaurora.org>
>> ---
>>   drivers/clk/qcom/Kconfig      |   9 +++
>>   drivers/clk/qcom/Makefile     |   1 +
>>   drivers/clk/qcom/gcc-sc7180.c |  70 +++++++++++++++++++++
>>   drivers/clk/qcom/mss-sc7180.c | 143 ++++++++++++++++++++++++++++++++++++++++++
> 
> Please split this patch into two, one for gcc and one for mss.
> 

Taken care in the next patch series.

>>   4 files changed, 223 insertions(+)
>>   create mode 100644 drivers/clk/qcom/mss-sc7180.c
>>
>> diff --git a/drivers/clk/qcom/mss-sc7180.c b/drivers/clk/qcom/mss-sc7180.c
>> new file mode 100644
>> index 0000000..d82600e
>> --- /dev/null
>> +++ b/drivers/clk/qcom/mss-sc7180.c
>> @@ -0,0 +1,143 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (c) 2019, The Linux Foundation. All rights reserved.
>> + */
>> +
>> +#include <linux/clk-provider.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/module.h>
>> +#include <linux/of_address.h>
>> +#include <linux/pm_clock.h>
>> +#include <linux/pm_runtime.h>
>> +#include <linux/regmap.h>
>> +
>> +#include <dt-bindings/clock/qcom,mss-sc7180.h>
>> +
>> +#include "clk-regmap.h"
>> +#include "clk-branch.h"
>> +#include "common.h"
>> +
> [...]
>> +
>> +static struct regmap_config mss_regmap_config = {
> 
> Can this be const?
>

Yes, next series is updated with the above.

>> +       .reg_bits       = 32,
>> +       .reg_stride     = 4,
>> +       .val_bits       = 32,
>> +       .fast_io        = true,
>> +};
>> +

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
of Code Aurora Forum, hosted by The Linux Foundation.

--
