Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4249517101B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Feb 2020 06:21:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725805AbgB0FV1 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Feb 2020 00:21:27 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:51592 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725870AbgB0FV0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Feb 2020 00:21:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582780886; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=t8Ea0LADZk1wnK/+O/yGmvW5QkFUuGDPbqlcT4bc3ss=; b=KcusUhpDIgGATthDa5Ue101qPQupSsZNbL/OEDsYa6SzTChmbjdgYEe4w2KM1Xd63+bH2xBT
 5353gF30ifIb+kSeDqkj9qyWaj4C8oPC3kp3nN1KwMzKZQO/RQ8IJVxOJJ6Sb8i9HkcsgoeK
 mJnnVmRUtl8rJyqpKP11N91utnA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5751d0.7f0e230ef880-smtp-out-n03;
 Thu, 27 Feb 2020 05:21:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 55F9EC4479C; Thu, 27 Feb 2020 05:21:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94DE9C43383;
        Thu, 27 Feb 2020 05:21:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94DE9C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v7 3/3] soc: qcom: rpmh: Invoke rpmh_flush for dirty
 caches
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        evgreen@chromium.org, mka@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, dianders@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1582694833-9407-1-git-send-email-mkshah@codeaurora.org>
 <1582694833-9407-4-git-send-email-mkshah@codeaurora.org>
 <158275738312.177367.16582562675135073777@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <337a55cd-639f-ace5-47fd-ef837be94ac1@codeaurora.org>
Date:   Thu, 27 Feb 2020 10:51:13 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158275738312.177367.16582562675135073777@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/27/2020 4:19 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-02-25 21:27:13)
>> Add changes to invoke rpmh flush when the data in cache is dirty.
>>
>> This is done only if OSI is not supported in PSCI. If OSI is supported
>> rpmh_flush can get invoked when the last cpu going to power collapse
> Please write rpmh_flush() so we know it's a function and not a variable.
Done. Will update in v8.
>> deepest low power mode.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
>> ---
>>   drivers/soc/qcom/rpmh.c | 6 ++++++
>>   1 file changed, 6 insertions(+)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index 83ba4e0..839af8d 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -12,6 +12,7 @@
>>   #include <linux/module.h>
>>   #include <linux/of.h>
>>   #include <linux/platform_device.h>
>> +#include <linux/psci.h>
>>   #include <linux/slab.h>
>>   #include <linux/spinlock.h>
>>   #include <linux/types.h>
>> @@ -163,6 +164,9 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>>   unlock:
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>   
>> +       if (ctrlr->dirty && !psci_has_osi_support())
> Can we introduce a stub function for psci_has_osi_support() when
> CONFIG_ARM_PSCI_FW=n? This driver currently has:
>
>    config QCOM_RPMH
>          bool "Qualcomm RPM-Hardened (RPMH) Communication"
> 	depends on ARCH_QCOM && ARM64 || COMPILE_TEST
>
>
> which implies that this will break build testing once built on something
> that isn't arm64.
>
Thanks for pointing this, i think its better to remove COMPILE_TEST so 
driver only

gets build for arm64.

>> +               return rpmh_flush(ctrlr) ? ERR_PTR(-EINVAL) : req;
>> +
>>          return req;
>>   }
>>   
>> @@ -391,6 +395,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>>   
>>          if (state != RPMH_ACTIVE_ONLY_STATE) {
>>                  cache_batch(ctrlr, req);
>> +               if (!psci_has_osi_support())
>> +                       return rpmh_flush(ctrlr);
> While the diff is small it is also sad that we turn around after adding
> it to a list and immediately take it off the list and send it. Can't we
> do this without having to do the list add/remove dance?

No, we need to keep it in list, the target supporting OSI will get it 
off list only when last cpu

enters deepest idle mode.

>
>>                  return 0;
>>          }
>>
-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
