Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12B501A5EDE
	for <lists+linux-arm-msm@lfdr.de>; Sun, 12 Apr 2020 16:04:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725909AbgDLOEc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 12 Apr 2020 10:04:32 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:63089 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726805AbgDLOEc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 12 Apr 2020 10:04:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586700272; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=4CBbqsGpzdCcaZYo9uWnzeF9Zf76aR5LSzbuJBhR7PI=; b=oQ1L2CxQ53czZs/KZWcvU7XLngUB60z6e7qNQ/eCP98PsPXpVyZbv6TsTb7mk2vlEIXWHo3p
 XsDKHgNWfaEo5SVYYsrR+o7uLy0a/L0o49Y4t2NGxxOAtoLfOZKjFUph+hmkBnP12uL6U9T1
 13CoFQbqUL1pGnak0tyqu7bGFW4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e931fda.7f62214e2ca8-smtp-out-n01;
 Sun, 12 Apr 2020 14:04:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A187EC432C2; Sun, 12 Apr 2020 14:04:10 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.136.116])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E1A48C433F2;
        Sun, 12 Apr 2020 14:04:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E1A48C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v16 4/6] soc: qcom: rpmh: Invoke rpmh_flush() for dirty
 caches
To:     Stephen Boyd <swboyd@chromium.org>, bjorn.andersson@linaro.org,
        dianders@chromium.org, evgreen@chromium.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        agross@kernel.org, mka@chromium.org, rnayak@codeaurora.org,
        ilina@codeaurora.org, lsrao@codeaurora.org
References: <1586154741-8293-1-git-send-email-mkshah@codeaurora.org>
 <1586154741-8293-5-git-send-email-mkshah@codeaurora.org>
 <158649213142.77611.5740203322498170248@swboyd.mtv.corp.google.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <58ede10e-535f-be2c-ed77-8e3d688e4f7c@codeaurora.org>
Date:   Sun, 12 Apr 2020 19:34:02 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <158649213142.77611.5740203322498170248@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/10/2020 9:45 AM, Stephen Boyd wrote:
> Quoting Maulik Shah (2020-04-05 23:32:19)
>> Add changes to invoke rpmh flush() from CPU PM notification.
>> This is done when the last the cpu is entering power collapse and
> 'power collapse' is a qcom-ism. Maybe say something like "deep CPU idle
> states"?
Okay, i updated in v17.
>
>> controller is not busy.
>>
>> Controllers that do have 'HW solver' mode do not need to register
>> for CPU PM notification. They may be in autonomous mode executing
>> low power mode and do not require rpmh_flush() to happen from CPU
>> PM notification.
> Can you provide an example of a HW solver mode controller? Presumably
> the display RSC is one of these?
Sure, Added in v17 to mention display RSC.
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>> index b718221..fbe1f3e 100644
>> --- a/drivers/soc/qcom/rpmh-rsc.c
>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>> @@ -521,8 +527,86 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>>          return tcs_ctrl_write(drv, msg);
>>   }
>>   
>> +/**
>> + * rpmh_rsc_ctrlr_is_busy() - Check if any of the AMCs are busy.
>> + *
>> + * @drv: The controller
>> + *
>> + * Checks if any of the AMCs are busy in handling ACTIVE sets.
>> + * This is called from the last cpu powering down before flushing
>> + * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
>> + * power collapse, so deny from the last cpu's pm notification.
>> + *
>> + * Return:
>> + * * False             - AMCs are idle
>> + * * True              - AMCs are busy
>> + */
>> +static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
> Can drv be const? Would be nice to make it const in some places in this
> driver.

It can, but it will require changing multiple places to make it const. 
some of those functions are

dropped/modified in doug's cleanup series. I can do in separate patch 
once this series is pulled in.

>
>> +{
>> +       int m;
>> +       struct tcs_group *tcs = get_tcs_of_type(drv, ACTIVE_TCS);
>> +
>> +       /*
>> +        * If we made an active request on a RSC that does not have a
>> +        * dedicated TCS for active state use, then re-purposed wake TCSes
>> +        * should be checked for not busy.
> not busy, because we use wake TCSes for active requests in this case.
Ok, added in v17.
>
>> +        *
>> +        * Since this is called from the last cpu, need not take drv or tcs
>> +        * lock before checking tcs_is_free().
>> +        */
>> +       if (!tcs->num_tcs)
>> +               tcs = get_tcs_of_type(drv, WAKE_TCS);
>> +
>> +       for (m = tcs->offset; m < tcs->offset + tcs->num_tcs; m++) {
>> +               if (!tcs_is_free(drv, m))
>> +                       return true;
>> +       }
>> +
>> +       return false;
>> +}
> [...]
>> +
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index a75f3df..88f8801 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -433,16 +430,17 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>>   }
>>   
>>   /**
>> - * rpmh_flush: Flushes the buffered active and sleep sets to TCS
>> + * rpmh_flush() - Flushes the buffered sleep and wake sets to TCSes
>>    *
>> - * @ctrlr: controller making request to flush cached data
>> + * @ctrlr: Controller making request to flush cached data
>>    *
>> - * Return: -EBUSY if the controller is busy, probably waiting on a response
>> - * to a RPMH request sent earlier.
>> + * This function is called from sleep code on the last CPU
>> + * (thus no spinlock needed).
> Might be good to stick a lockdep_assert_irqs_disabled() in this function
> then. That would document that this function should only be called when
> irqs are disabled.

Okay. Added  lockdep_assert_irqs_disabled(). But this may need to be 
dropped when

we add support for display RSC.

>
>>    *
>> - * This function is always called from the sleep code from the last CPU
>> - * that is powering down the entire system. Since no other RPMH API would be
>> - * executing at this time, it is safe to run lockless.
>> + * Return:
>> + * * 0          - Success
>> + * * -EAGAIN    - Retry again
>> + * * Error code - Otherwise
>>    */
>>   int rpmh_flush(struct rpmh_ctrlr *ctrlr)
> This function name keeps throwing me off. Can we please call it
> something like rpmh_configure_tcs_sleep_wake()? The word "flush" seems
> to imply there's some sort of cache going on, but that's not really the
> case. We're programming a couple TCS FIFOs so that they can be used
> across deep CPU sleep states.
>
>>   {
>> @@ -455,9 +453,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>          }
>>   
>>          /* Invalidate the TCSes first to avoid stale data */
>> -       do {
>> -               ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
>> -       } while (ret == -EAGAIN);
>> +       ret = rpmh_rsc_invalidate(ctrlr_to_drv(ctrlr));
>>          if (ret)
>>                  return ret;

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
