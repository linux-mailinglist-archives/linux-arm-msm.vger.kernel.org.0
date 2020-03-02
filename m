Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 570B91759A9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  2 Mar 2020 12:38:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727484AbgCBLip (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 2 Mar 2020 06:38:45 -0500
Received: from mail27.static.mailgun.info ([104.130.122.27]:21414 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727228AbgCBLip (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 2 Mar 2020 06:38:45 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1583149124; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=SpecQ+3x7goJ87//8OV9O2P+2GcYcoXhPwlIoaAQZJk=; b=BeMSOf8GsPgqLkjix3GKSx70RNP0pENP0SkaI43ZuYPLJUWqaZ3tTKUrQGRekSfy2Yv3Uh7t
 oejrR0kY4iUBjHDhdycwTMzcC2Bv0HnnVE0+5NrYeUJ5VOJBcfLbd/OPXAA2/F96NhLE8Fij
 p4c0OlGHdMmbNDOwdntTqZrFDiE=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e5cf038.7fb06cd99e30-smtp-out-n01;
 Mon, 02 Mar 2020 11:38:32 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA764C447A0; Mon,  2 Mar 2020 11:38:31 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DD57AC433A2;
        Mon,  2 Mar 2020 11:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DD57AC433A2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH v9 2/3] soc: qcom: rpmh: Update dirty flag only when data
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
References: <1582889903-12890-1-git-send-email-mkshah@codeaurora.org>
 <1582889903-12890-3-git-send-email-mkshah@codeaurora.org>
 <CAE=gft5aOtOx6MyuNuv3ebc6ZHmG_W3i0EA3HJjKceYMr7Nx3A@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <73906d43-cfac-59c4-5e50-51424f0c136f@codeaurora.org>
Date:   Mon, 2 Mar 2020 17:08:25 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CAE=gft5aOtOx6MyuNuv3ebc6ZHmG_W3i0EA3HJjKceYMr7Nx3A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/29/2020 3:20 AM, Evan Green wrote:
> On Fri, Feb 28, 2020 at 3:38 AM Maulik Shah <mkshah@codeaurora.org> wrote:
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
>>   drivers/soc/qcom/rpmh.c | 21 +++++++++++++--------
>>   1 file changed, 13 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index eb0ded0..f28afe4 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -133,26 +133,30 @@ static struct cache_req *cache_rpm_request(struct rpmh_ctrlr *ctrlr,
>>
>>          req->addr = cmd->addr;
>>          req->sleep_val = req->wake_val = UINT_MAX;
>> -       INIT_LIST_HEAD(&req->list);
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
> Is this fixing a case where we were not previously marking the
> controller dirty but should have?
Well, its not a missing case as such.
Let me explain.
Whenever rpmh_invalidate()  (lets call it event a) is called, controller 
dirty flag is set.
post invalidating, the aggregator driver always sends new sleep data 
(event b) and wake data (event c).
the last cpu going down flushes the cached data and dirty flag is 
unset.  (event d)

hence setting dirty flag, only once during (event a) and not updating it 
during (event b, c) was not any issue/missing case, at least till now.

However with changes to invoke rpmh_flush() whenever data is dirty, it 
is required to set this flag for each of these events.
Otherwise as the rpmh_flush() call happened during event b would have 
marked as non-dirty data at the end of it,
now when rpmh_flush() call happened during event c, it will not flush 
anything as caches are not dirty, which is not the expectation.


> I notice there's a fixes tag, but it
> would be helpful to add something to the commit text indicating that
> you're fixing a missing case where the controller should have been
> marked dirty.
sure i can add details on why we need to update dirty flag everytime 
when touching caches.
> With that fixed, you can add my tag:
>
> Reviewed-by: Evan Green <evgreen@chromium.org>
Thanks

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
