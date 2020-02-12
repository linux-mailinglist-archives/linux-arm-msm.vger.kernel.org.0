Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8511815A8E5
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Feb 2020 13:15:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725887AbgBLMPs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 12 Feb 2020 07:15:48 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:22358 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727361AbgBLMPs (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 12 Feb 2020 07:15:48 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1581509747; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=FjhLdQpNYO1Z9B/UP3O1QLaLfq7pZ9IwtlYlU+Y+VQI=; b=vPeDM6KIBHaZUjMVsWq9ds3035GPE8U8fStrZOPKtGWW8LNTICxy8UgMLFMz9gccefNd1JzB
 R68/4LSzGzhJr2/OQZoYXKwUz/ZK1h1wG3V0GqVxr9RJxz1cgmwKuuM7NoITY3bSgEQCXK7X
 c8v3VCwiAlNYpaMzRGxQPbV87gA=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e43ec72.7f7a2d45fdc0-smtp-out-n01;
 Wed, 12 Feb 2020 12:15:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 01F90C447A0; Wed, 12 Feb 2020 12:15:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.206.13.37] (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2775AC43383;
        Wed, 12 Feb 2020 12:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2775AC43383
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
 <7db81eed-d46d-8131-f471-6f57c0335ace@codeaurora.org>
 <CAE=gft6zEKYoMabmRbO55BSAt-4oOuwRRZZD6BcSbe7Xp15Vnw@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <8914a4c0-db3c-371c-d875-afd4b3b6870c@codeaurora.org>
Date:   Wed, 12 Feb 2020 17:45:38 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <CAE=gft6zEKYoMabmRbO55BSAt-4oOuwRRZZD6BcSbe7Xp15Vnw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/5/2020 11:51 PM, Evan Green wrote:
> On Tue, Feb 4, 2020 at 9:12 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>>
>> On 2/5/2020 6:01 AM, Evan Green wrote:
>>> On Mon, Feb 3, 2020 at 10:14 PM Maulik Shah <mkshah@codeaurora.org> wrote:
>>>> rpm_msgs are copied in continuously allocated memory during write_batch.
>>>> Update request pointer to correctly point to designated area for rpm_msgs.
>>>>
>>>> While at this also add missing list_del before freeing rpm_msgs.
>>>>
>>>> Signed-off-by: Maulik Shah <mkshah@codeaurora.org>
>>>> ---
>>>>    drivers/soc/qcom/rpmh.c | 9 ++++++---
>>>>    1 file changed, 6 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>>>> index c3d6f00..04c7805 100644
>>>> --- a/drivers/soc/qcom/rpmh.c
>>>> +++ b/drivers/soc/qcom/rpmh.c
>>>> @@ -65,7 +65,7 @@ struct cache_req {
>>>>    struct batch_cache_req {
>>>>           struct list_head list;
>>>>           int count;
>>>> -       struct rpmh_request rpm_msgs[];
>>>> +       struct rpmh_request *rpm_msgs;
>>>>    };
>>>>
>>>>    static struct rpmh_ctrlr *get_rpmh_ctrlr(const struct device *dev)
>>>> @@ -327,8 +327,10 @@ static void invalidate_batch(struct rpmh_ctrlr *ctrlr)
>>>>           unsigned long flags;
>>>>
>>>>           spin_lock_irqsave(&ctrlr->cache_lock, flags);
>>>> -       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list)
>>>> +       list_for_each_entry_safe(req, tmp, &ctrlr->batch_cache, list) {
>>>> +               list_del(&req->list);
>>>>                   kfree(req);
>>>> +       }
>>>>           INIT_LIST_HEAD(&ctrlr->batch_cache);
>>> Hm, I don't get it. list_for_each_entry_safe ensures you can traverse
>>> the list while freeing it behind you. ctrlr->batch_cache is now a
>>> bogus list, but is re-inited with the lock held. From my reading,
>>> there doesn't seem to be anything wrong with the current code. Can you
>>> elaborate on the bug you found?
>> Hi Evan,
>>
>> when we don't do list_del, there might be access to already freed memory.
>> Even after current item free via kfree(req), without list_del, the next
>> and prev item's pointer are still pointing to this freed region.
>> it seem best to call list_del to ensure that before freeing this area,
>> no other item in list refer to this.
> I don't think that's true. the "_safe" part of
> list_for_each_entry_safe ensures that we don't touch the ->next member
> of any node after freeing it. So I don't think there's any case where
> we could touch freed memory. The list_del still seems like needless
> code to me.

Hmm, ok. i can drop list_del.

see the reason below to include list_del.

>>>>           spin_unlock_irqrestore(&ctrlr->cache_lock, flags);
>>>>    }
>>>> @@ -377,10 +379,11 @@ int rpmh_write_batch(const struct device *dev, enum rpmh_state state,
>>>>                   return -ENOMEM;
>>>>
>>>>           req = ptr;
>>>> +       rpm_msgs = ptr + sizeof(*req);
>>>>           compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
>>>>
>>>>           req->count = count;
>>>> -       rpm_msgs = req->rpm_msgs;
>>>> +       req->rpm_msgs = rpm_msgs;
>>> I don't really understand what this is fixing either, can you explain?
>> the continous memory allocated via below is for 3 items,
>>
>> ptr = kzalloc(sizeof(*req) + count * (sizeof(req->rpm_msgs[0]) +
>> sizeof(*compls)), GFP_ATOMIC);
>>
>> 1. batch_cache_req,  followed by
>> 2. total count of rpmh_request,  followed by
>> 3. total count of compls
>>
>> current code starts using (3) compls from proper offset in memory
>>           compls = ptr + sizeof(*req) + count * sizeof(*rpm_msgs);
>>
>> however for (2) rpmh_request it does
>>
>>           rpm_msgs = req->rpm_msgs;
>>
>> because of this it starts 8 byte before its designated area and overlaps
>> with (1) batch_cache_req struct's last entry.
>> this patch corrects it via below to ensure rpmh_request uses correct
>> start address in memory.
>>
>>           rpm_msgs = ptr + sizeof(*req);
> I don't follow that either. The empty array declaration (or the
> GCC-specific version of it would be  "struct rpmh_request
> rpm_msgs[0];") is a flexible array member, meaning the member itself
> doesn't take up any space in the struct. So, for instance, it holds
> true that &(req->rpm_msgs[0]) == (req + 1). By my reading the existing
> code is correct, and your patch just adds a needless pointer
> indirection. Check out this wikipedia entry:
>
> https://en.wikipedia.org/wiki/Flexible_array_member
Thanks Evan,

Agree that code works even without this.

However from the same wiki,

 >>It is common to allocate sizeof(struct) + array_len*sizeof(array 
element) bytes.

 >>This is not wrong, however it may allocate a few more bytes than 
necessary:

this is what i wanted to convery above, currently it allocated 8 more 
bytes than necessary.

The reason for the change was one use after free reported in rpmh driver.

After including this change, we have not seen this reported again.

I can drop this change in new revision if we don't want it.

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
