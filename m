Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0503E176EF2
	for <lists+linux-arm-msm@lfdr.de>; Tue,  3 Mar 2020 06:48:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726083AbgCCFsf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 3 Mar 2020 00:48:35 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:28478 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725840AbgCCFsf (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 3 Mar 2020 00:48:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583214514; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=suwHwB8/jDanXjVGBshpFCr3jGKd5l20e2TD9ZodePo=; b=BKMLeX5zI5j2mAr4DcBYLTAxLih7IxZ0hR7IEkbyLJCz/grsgDOGfNxEaIJjxFoU3tpFFTJ3
 0CkMK2JzGAPzUclG+MCsUEsjf2xVc1LbI0sA3gZzYALx5dM3Od8aKxMTwfVuXyv2R02tGgnT
 E8Iz7W5L+oQnzJxZ77A9eisbFNo=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5def9f.7fd95dae9030-smtp-out-n02;
 Tue, 03 Mar 2020 05:48:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 64951C4479D; Tue,  3 Mar 2020 05:48:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 68EBFC43383;
        Tue,  3 Mar 2020 05:48:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 68EBFC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v9 3/3] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
To:     Evan Green <evgreen@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1582889903-12890-1-git-send-email-mkshah@codeaurora.org>
 <1582889903-12890-4-git-send-email-mkshah@codeaurora.org>
 <CAE=gft7mT18V1QOi0LSk+kcNoOOKEdVNywj4wcO22J_d=kA+3w@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <b2a43005-0882-c25d-3452-e93978767bdb@codeaurora.org>
Date:   Tue, 3 Mar 2020 11:18:08 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAE=gft7mT18V1QOi0LSk+kcNoOOKEdVNywj4wcO22J_d=kA+3w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/29/2020 3:18 AM, Evan Green wrote:
> Hi Maulik,
> Thanks for spinning this so promptly.
>
> On Fri, Feb 28, 2020 at 3:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Add changes to invoke rpmh flush() from within cache_lock when the data
>> in cache is dirty.
>>
>> This is done only if OSI is not supported in PSCI. If OSI is supported
>> rpmh_flush can get invoked when the last cpu going to power collapse
>> deepest low power mode.
>>
>> Also remove "depends on COMPILE_TEST" for Kconfig option QCOM_RPMH so the
>> driver is only compiled for arm64 which supports psci_has_osi_support()
>> API.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
>> ---
>>   drivers/soc/qcom/Kconfig |  2 +-
>>   drivers/soc/qcom/rpmh.c  | 33 ++++++++++++++++++++++-----------
>>   2 files changed, 23 insertions(+), 12 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index d0a73e7..2e581bc 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -105,7 +105,7 @@ config QCOM_RMTFS_MEM
>>
>>   config QCOM_RPMH
>>          bool "Qualcomm RPM-Hardened (RPMH) Communication"
>> -       depends on ARCH_QCOM && ARM64 || COMPILE_TEST
>> +       depends on ARCH_QCOM && ARM64
>>          help
>>            Support for communication with the hardened-RPM blocks in
>>            Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index f28afe4..6a5a60c 100644
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
>> @@ -158,6 +159,13 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>>          }
>>
>>   unlock:
>> +       if (ctrlr->dirty && !psci_has_osi_support()) {
>> +               if (rpmh_flush(ctrlr)) {
>> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>> +                       return ERR_PTR(-EINVAL);
>> +               }
>> +       }
>> +
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>
>>          return req;
>> @@ -285,26 +293,35 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
>>   }
>>   EXPORT_SYMBOL(rpmh_write);
>>
>> -static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>> +static int cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>>   {
>>          unsigned long flags;
>>
>>          spin_lock_irqsave(&ctrlr->cache_lock, flags);
>> +
>>          list_add_tail(&req->list, &ctrlr->batch_cache);
>>          ctrlr->dirty = true;
>> +
>> +       if (!psci_has_osi_support()) {
>> +               if (rpmh_flush(ctrlr)) {
>> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>> +                       return -EINVAL;
>> +               }
>> +       }
>> +
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>> +
>> +       return 0;
>>   }
>>
>>   static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>   {
>>          struct batch_cache_req *req;
>>          const struct rpmh_request *rpm_msg;
>> -       unsigned long flags;
>>          int ret = 0;
>>          int i;
>>
>>          /* Send Sleep/Wake requests to the controller, expect no response */
>> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>          list_for_each_entry(req, &ctrlr->batch_cache, list) {
>>                  for (i = 0; i < req->count; i++) {
>>                          rpm_msg = req->rpm_msgs + i;
>> @@ -314,7 +331,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>                                  break;
>>                  }
>>          }
>> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>
>>          return ret;
>>   }
>> @@ -386,10 +402,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>>                  cmd += n[i];
>>          }
>>
>> -       if (state != RPMH_ACTIVE_ONLY_STATE) {
>> -               cache_batch(ctrlr, req);
>> -               return 0;
>> -       }
>> +       if (state != RPMH_ACTIVE_ONLY_STATE)
>> +               return cache_batch(ctrlr, req);
>>
>>          for (i = 0; i < count; i++) {
>>                  struct completion *compl = &compls[i];
>> @@ -455,9 +469,6 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>>    * Return: -EBUSY if the controller is busy, probably waiting on a response
>>    * to a RPMH request sent earlier.
>>    *
>> - * This function is always called from the sleep code from the last CPU
>> - * that is powering down the entire system. Since no other RPMH API would be
>> - * executing at this time, it is safe to run lockless.
> Oh nice, I didn't even see that comment. We should probably replace
> that with a comment indicating that we assume ctrlr->cache_lock is
> already held.
>
> Please also remove this comment in rpmh_flush():
>          /*
>           * Nobody else should be calling this function other than system PM,
>           * hence we can run without locks.
>           */
>          list_for_each_entry(p, &ctrlr->cache, list) {
>
> -Evan
Done, will remove in next revision.
>
>>    */
>>   int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>   {
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member
>> of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
