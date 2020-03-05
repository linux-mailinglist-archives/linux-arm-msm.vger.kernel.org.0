Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DD9A517A446
	for <lists+linux-arm-msm@lfdr.de>; Thu,  5 Mar 2020 12:30:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727112AbgCELan (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Mar 2020 06:30:43 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:54884 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725897AbgCELam (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Mar 2020 06:30:42 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583407841; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=kDJD4mNwabwWuj0s0vUcdkYgT7NlN6oMEkF3seKfQqg=; b=sFGPiLARh6yru/M8E+1Y2XFvw/v1EvmYNMozcS34njFons6c6poJO7ZUEK3sHPgvU0PwbxaF
 vpEhWsY1RdEE8gj05YwsCFhLo1Xhizt9QxvgqVQV5FhuffQydOcbE2PcPYozvv8o08m+jiQg
 s1JH3Z8tf/fS5gJqLLMANOMmvJU=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e60e2d9.7f59f3e5b458-smtp-out-n02;
 Thu, 05 Mar 2020 11:30:33 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id C02FFC447A0; Thu,  5 Mar 2020 11:30:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6AE9AC43383;
        Thu,  5 Mar 2020 11:30:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6AE9AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v10 3/3] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
To:     Doug Anderson <dianders@chromium.org>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Evan Green <evgreen@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1583238415-18686-1-git-send-email-mkshah@codeaurora.org>
 <1583238415-18686-4-git-send-email-mkshah@codeaurora.org>
 <CAD=FV=VG2dirykoGB93s3xCW8CKJjrGDS76koTyww_gy-jv7RQ@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <92bf14b7-b7ae-3060-312e-74f57c1f9a63@codeaurora.org>
Date:   Thu, 5 Mar 2020 17:00:26 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VG2dirykoGB93s3xCW8CKJjrGDS76koTyww_gy-jv7RQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 3/5/2020 4:52 AM, Doug Anderson wrote:
> Hi,
>
> On Tue, Mar 3, 2020 at 4:27 AM Maulik Shah <mkshah@codeaurora.org> wrote:
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
>>  drivers/soc/qcom/Kconfig |  2 +-
>>  drivers/soc/qcom/rpmh.c  | 37 ++++++++++++++++++++++---------------
>>  2 files changed, 23 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
>> index d0a73e7..2e581bc 100644
>> --- a/drivers/soc/qcom/Kconfig
>> +++ b/drivers/soc/qcom/Kconfig
>> @@ -105,7 +105,7 @@ config QCOM_RMTFS_MEM
>>
>>  config QCOM_RPMH
>>         bool "Qualcomm RPM-Hardened (RPMH) Communication"
>> -       depends on ARCH_QCOM && ARM64 || COMPILE_TEST
>> +       depends on ARCH_QCOM && ARM64
>>         help
>>           Support for communication with the hardened-RPM blocks in
>>           Qualcomm Technologies Inc (QTI) SoCs. RPMH communication uses an
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index f28afe4..dafb0da 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -12,6 +12,7 @@
>>  #include <linux/module.h>
>>  #include <linux/of.h>
>>  #include <linux/platform_device.h>
>> +#include <linux/psci.h>
>>  #include <linux/slab.h>
>>  #include <linux/spinlock.h>
>>  #include <linux/types.h>
>> @@ -158,6 +159,13 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>>         }
>>
>>  unlock:
>> +       if (ctrlr->dirty && !psci_has_osi_support()) {
>> +               if (rpmh_flush(ctrlr)) {
>> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>> +                       return ERR_PTR(-EINVAL);
>> +               }
>> +       }
>> +
>>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>
>>         return req;
>> @@ -285,26 +293,35 @@ int rpmh_write(const struct device *dev, enum rpmh_state state,
>>  }
>>  EXPORT_SYMBOL(rpmh_write);
>>
>> -static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>> +static int cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>>  {
>>         unsigned long flags;
>>
>>         spin_lock_irqsave(&ctrlr->cache_lock, flags);
>> +
>>         list_add_tail(&req->list, &ctrlr->batch_cache);
>>         ctrlr->dirty = true;
>> +
>> +       if (!psci_has_osi_support()) {
>> +               if (rpmh_flush(ctrlr)) {
> The whole API here is a bit unfortunate.  From what I can tell,
> callers of this code almost always call rpmh_write_batch() in
> triplicate, AKA:
>
> rpmh_write_batch(active, ...)
> rpmh_write_batch(wake, ...)
> rpmh_write_batch(sleep, ...)
>
> ...that's going to end up writing the whole sleep/wake sets twice
> every single time, right?  I know you talked about trying to keep
> separate dirty bits for sleep/wake and maybe that would help, but it
> might not be so easy due to the comparison of "sleep_val" and
> "wake_val" in is_req_valid().
>
> I guess we can keep the inefficiency for now and see how much it hits
> us, but it feels ugly.
>
>
>> +                       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>> +                       return -EINVAL;
> nit: why not add "int ret = 0" to the top of the function, then here:
>
> if (rpmh_flush(ctrl))
>   ret = -EINVAL;
>
> ...then at the end "return ret".  It avoids the 2nd copy of the unlock?
Done.
>
> Also: Why throw away the return value of rpmh_flush and replace it
> with -EINVAL?  Trying to avoid -EBUSY?  ...oh, should you handle
> -EBUSY?  AKA:
>
> if (!psci_has_osi_support()) {
>   do {
>     ret = rpmh_flush(ctrl);
>   } while (ret == -EBUSY);
> }

Done, the return value from rpmh_flush() can be -EAGAIN, not -EBUSY.

i will update the comment accordingly and will include below change as well in next series.

https://patchwork.kernel.org/patch/11364067/

this should address for caller to not handle -EAGAIN.

>
>
>> +               }
>> +       }
>> +
>>         spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>> +
>> +       return 0;
>>  }
>>
>>  static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>  {
>>         struct batch_cache_req *req;
>>         const struct rpmh_request *rpm_msg;
>> -       unsigned long flags;
>>         int ret = 0;
>>         int i;
>>
>>         /* Send Sleep/Wake requests to the controller, expect no response */
>> -       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>         list_for_each_entry(req, &ctrlr->batch_cache, list) {
>>                 for (i = 0; i < req->count; i++) {
>>                         rpm_msg = req->rpm_msgs + i;
>> @@ -314,7 +331,6 @@ static int flush_batch(struct rpmh_ctrlr *ctrlr)
>>                                 break;
>>                 }
>>         }
>> -       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>
>>         return ret;
>>  }
>> @@ -386,10 +402,8 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>>                 cmd += n[i];
>>         }
>>
>> -       if (state != RPMH_ACTIVE_ONLY_STATE) {
>> -               cache_batch(ctrlr, req);
>> -               return 0;
>> -       }
>> +       if (state != RPMH_ACTIVE_ONLY_STATE)
>> +               return cache_batch(ctrlr, req);
>>
>>         for (i = 0; i < count; i++) {
>>                 struct completion *compl = &compls[i];
>> @@ -455,9 +469,6 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>>   * Return: -EBUSY if the controller is busy, probably waiting on a response
>>   * to a RPMH request sent earlier.
>>   *
>> - * This function is always called from the sleep code from the last CPU
>> - * that is powering down the entire system. Since no other RPMH API would be
>> - * executing at this time, it is safe to run lockless.
> nit: you've now got an extra "blank" (just has a "*" on it) line at
> the end of your comment block.
Done.
> nit: in v9, Evan suggested "We should probably replace that with a
> comment indicating that we assume ctrlr->cache_lock is already held".
> Maybe you could do that?
yes i left it for below reason since we still can call it from sleep code.
i will mention same in v11.

Thanks,
Maulik
>
> Also: presumably you _will_ still be called by the sleep code from the
> last CPU on systems with OSI.  Is that true?  If that's not true then
> you should change your function to static.  If that is true, then your
> comment should be something like "this function will either be called
> from sleep code on the last CPU (thus no spinlock needed) or with the
> spinlock already held".
>
>
> -Doug

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
