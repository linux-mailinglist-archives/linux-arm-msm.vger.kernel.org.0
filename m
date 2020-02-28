Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C1C741735DD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Feb 2020 12:12:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726700AbgB1LMp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Feb 2020 06:12:45 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:64077 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726740AbgB1LMp (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Feb 2020 06:12:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1582888365; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=IVZ6CtP5L6xsu8bf6zRg6TkuiYbPIlAzMCNphwbcOsE=; b=qYlSRXJVqozUJyelKHg3Xl87HACDR6E7wQxcCVT+wlHCBJCfyAA2AFlm7YeWF98EnOg4UZEE
 hATptx4JAba23sYXNDIZPj6h+pRN/1GCMpxJM50nOMAHstn/L0oxHpWiPNyZuUAbN4JhOgVG
 tPxpYm74O3WxPjihljlm0DEycuQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e58f5a8.7fabedcc6b58-smtp-out-n01;
 Fri, 28 Feb 2020 11:12:40 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 1CDDAC4479D; Fri, 28 Feb 2020 11:12:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 38AE7C43383;
        Fri, 28 Feb 2020 11:12:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 38AE7C43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v8 2/3] soc: qcom: rpmh: Update dirty flag only when data
 changes
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
References: <1582793785-22423-1-git-send-email-mkshah@codeaurora.org>
 <1582793785-22423-3-git-send-email-mkshah@codeaurora.org>
 <CAE=gft6VDMoTZ4mW7d7scUCtDowfJiCbOzx_1FaFkoz8tm99DQ@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <9120b876-d7bb-7e74-f1e4-0ff6f2c6c939@codeaurora.org>
Date:   Fri, 28 Feb 2020 16:42:32 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAE=gft6VDMoTZ4mW7d7scUCtDowfJiCbOzx_1FaFkoz8tm99DQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/27/2020 11:48 PM, Evan Green wrote:
> On Thu, Feb 27, 2020 at 12:57 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>> Currently rpmh ctrlr dirty flag is set for all cases regardless of data
>> is really changed or not. Add changes to update dirty flag when data is
>> changed to newer values.
>>
>> Also move dirty flag updates to happen from within cache_lock and remove
>> unnecessary INIT_LIST_HEAD() call and a default case from switch.
>>
>> Fixes: 600513dfeef3 ("drivers: qcom: rpmh: cache sleep/wake state requests")
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> Reviewed-by: Srinivas Rao L <lsrao@codeaurora.org>
>> ---
>>   drivers/soc/qcom/rpmh.c | 29 ++++++++++++++++-------------
>>   1 file changed, 16 insertions(+), 13 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index eb0ded0..3f5d9eb 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -133,26 +133,30 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>>
>>          req->addr = cmd->addr;
>>          req->sleep_val = req->wake_val = UINT_MAX;
>> -       INIT_LIST_HEAD(&req->list);
> Thanks!
>
>>          list_add_tail(&req->list, &ctrlr->cache);
>>
>>   existing:
>>          switch (state) {
>>          case RPMH_ACTIVE_ONLY_STATE:
>> -               if (req->sleep_val != UINT_MAX)
>> +               if (req->sleep_val != UINT_MAX) {
>>                          req->wake_val = cmd->data;
>> +                       ctrlr->dirty = true;
>> +               }
>>                  break;
>>          case RPMH_WAKE_ONLY_STATE:
>> -               req->wake_val = cmd->data;
>> +               if (req->wake_val != cmd->data) {
>> +                       req->wake_val = cmd->data;
>> +                       ctrlr->dirty = true;
>> +               }
>>                  break;
>>          case RPMH_SLEEP_STATE:
>> -               req->sleep_val = cmd->data;
>> -               break;
>> -       default:
>> +               if (req->sleep_val != cmd->data) {
>> +                       req->sleep_val = cmd->data;
>> +                       ctrlr->dirty = true;
>> +               }
>>                  break;
>>          }
>>
>> -       ctrlr->dirty = true;
>>   unlock:
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>
>> @@ -287,6 +291,7 @@ static void cache_batch(struct rpmh_ctrlr *ctrlr, struct batch_cache_req *req)
>>
>>          spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>          list_add_tail(&req->list, &ctrlr->batch_cache);
>> +       ctrlr->dirty = true;
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>   }
>>
>> @@ -323,6 +328,7 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
>>          list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
>>                  kfree(req);
>>          INIT_LIST_HEAD(&ctrlr->batch_cache);
>> +       ctrlr->dirty = true;
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>   }
>>
>> @@ -456,13 +462,9 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>>   int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>   {
>>          struct cache_req *p;
>> +       unsigned long flags;
>>          int ret;
>>
>> -       if (!ctrlr->dirty) {
>> -               pr_debug("Skipping flush, TCS has latest data.\n");
>> -               return 0;
>> -       }
>> -
>>          /* First flush the cached batch requests */
>>          ret = flush_batch(ctrlr);
>>          if (ret)
>> @@ -488,7 +490,9 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>                          return ret;
>>          }
>>
>> +       spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>          ctrlr->dirty = false;
>> +       spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
> You're acquiring a lock around an operation that's already inherently
> atomic, which is not right. If the comment earlier in this function is
> still correct that "Nobody else should be calling this function other
> than system PM, hence we can run without locks", then you can simply
> remove this hunk and the part moving ->dirty = true into
> invalidate_batch.
>
> However, if rpmh_flush() can now be called in a scenario where
> pre-emption is enabled or multiple cores are alive, then ctrlr->cache
> is no longer adequately protected. You'd need to add a lock
> acquire/release around the list iteration above, and fix up the
> comment.
> -Evan

Hi Evan,

Right, rpmh_flush() now can be called from any cpu. i will remove 
comments from above.

part for rpmh_flush(),  flush_batch()  and ctrlr->dirty update was 
already covered within cache lock, however its needed to protect

entire rpmh_flush() in cache_lock now.

updates in v9.

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
