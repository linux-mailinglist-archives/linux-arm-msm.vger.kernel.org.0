Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A4F11525C3
	for <lists+linux-arm-msm@lfdr.de>; Wed,  5 Feb 2020 06:12:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725497AbgBEFMS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 5 Feb 2020 00:12:18 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:48150 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725468AbgBEFMR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 5 Feb 2020 00:12:17 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1580879537; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=eS5598ikAcw/JiR7E2klyycvOs2J8ql62ZPw0E1brco=; b=tJdxuCrvdSxGr11QEDAe7bZmFmIdRKXhoOwx+imJP5UegHGjhliljStXsG2oyVli+D1ackKL
 oT4Be4MJYORM/Uu7DojMuq9ADYqi3AN5JhQq3OCIfssG/SNTx8Rk9VH0fJlFiruXefRBMYGV
 15cD+pVZtwr2S//wWqVy3O5wIpk=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e3a4ea8.7f4c12480960-smtp-out-n02;
 Wed, 05 Feb 2020 05:12:08 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 993D7C447A1; Wed,  5 Feb 2020 05:12:07 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E279BC433CB;
        Wed,  5 Feb 2020 05:12:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E279BC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [PATCH 2/3] soc: qcom: rpmh: Update rpm_msgs offset address and
 add list_del
To:     Evan Green <evgreen@chromium.org>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Doug Anderson <dianders@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Lina Iyer <ilina@codeaurora.org>, lsrao@codeaurora.org
References: <1580796831-18996-1-git-send-email-mkshah@codeaurora.org>
 <1580796831-18996-3-git-send-email-mkshah@codeaurora.org>
 <CAE=gft7gPS+hhnDP+uTn3is6s9=Nspbb4PL0bZ025Tq1Zpth8Q@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <7db81eed-d46d-8131-f471-6f57c0335ace@codeaurora.org>
Date:   Wed, 5 Feb 2020 10:41:57 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAE=gft7gPS+hhnDP+uTn3is6s9=Nspbb4PL0bZ025Tq1Zpth8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org


On 2/5/2020 6:01 AM, Evan Green wrote:
> On Mon, Feb 3, 2020 at 10:14 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>> rpm_msgs are copied in continuously allocated memory during write_batch.
>> Update request pointer to correctly point to designated area for rpm_msgs.
>>
>> While at this also add missing list_del before freeing rpm_msgs.
>>
>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>> ---
>>   drivers/soc/qcom/rpmh.c | 9 ++++++---
>>   1 file changed, 6 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>> index c3d6f00..04c7805 100644
>> --- a/drivers/soc/qcom/rpmh.c
>> +++ b/drivers/soc/qcom/rpmh.c
>> @@ -65,7 +65,7 @@ struct cache_req {
>>   struct batch_cache_req {
>>          struct list_head list;
>>          int count;
>> -       struct rpmh_request rpm_msgs[];
>> +       struct rpmh_request *rpm_msgs;
>>   };
>>
>>   static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
>> @@ -327,8 +327,10 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
>>          unsigned long flags;
>>
>>          spin_lock_irqsave(&ctrlr->cache_lock, flags);
>> -       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
>> +       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list) {
>> +               list_del(&req->list);
>>                  kfree(req);
>> +       }
>>          INIT_LIST_HEAD(&ctrlr->batch_cache);
> Hm, I don't get it. list_for_each_entry_safe ensures you can traverse
> the list while freeing it behind you. ctrlr->batch_cache is now a
> bogus list, but is re-inited with the lock held. From my reading,
> there doesn't seem to be anything wrong with the current code. Can you
> elaborate on the bug you found?

Hi Evan,

when we don't do list_del, there might be access to already freed memory.
Even after current item free via kfree(req), without list_del, the next 
and prev item's pointer are still pointing to this freed region.
it seem best to call list_del to ensure that before freeing this area, 
no other item in list refer to this.

>
>>          spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>   }
>> @@ -377,10 +379,11 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>>                  return -ENOMEM;
>>
>>          req = ptr;
>> +       rpm_msgs = ptr + sizeof(*req);
>>          compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
>>
>>          req->count = count;
>> -       rpm_msgs = req->rpm_msgs;
>> +       req->rpm_msgs = rpm_msgs;
> I don't really understand what this is fixing either, can you explain?
the continous memory allocated via below is for 3 items,

ptr = kzalloc(sizeof(*req) + count * (sizeof(req->rpm_msgs[0]) + 
sizeof(*compls)), GFP_ATOMIC);

1. batch_cache_req,  followed by
2. total count of rpmh_request,  followed by
3. total count of compls

current code starts using (3) compls from proper offset in memory
         compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);

however for (2) rpmh_request it does

         rpm_msgs = req->rpm_msgs;

because of this it starts 8 byte before its designated area and overlaps 
with (1) batch_cache_req struct's last entry.
this patch corrects it via below to ensure rpmh_request uses correct 
start address in memory.

         rpm_msgs = ptr + sizeof(*req);

Hope this explains.

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
