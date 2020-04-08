Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6B69B1A1F7B
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 13:10:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728294AbgDHLK3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 07:10:29 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:58243 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728167AbgDHLK3 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 07:10:29 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586344228; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YPfGzUVxmqU33eXZ2BTIHeUcn7uUL1dHftBmYb+kqXQ=; b=ZWqZU0DYJ0wqgN3Tr5cGriCeYQigrrqsUKmNrdwYzewPT/asB8wRLy1rq/zYmeuHgqLtPqsZ
 A1FqLau7DmFwu80cu8fqY29PpKj9+1ZWNWjXw/0JRU5+zZM45gj0yaFVq6nT0EEyCoIsB53A
 5NVZ4LLtY+CBYJ6y+A9ZT4EEa0w=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8db122.7f727d526420-smtp-out-n03;
 Wed, 08 Apr 2020 11:10:26 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DA9CFC433D2; Wed,  8 Apr 2020 11:10:25 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.202.231])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 73189C433F2;
        Wed,  8 Apr 2020 11:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 73189C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
Subject: Re: [RFT PATCH v2 05/10] drivers: qcom: rpmh-rsc: A lot of comments
To:     Doug Anderson <dianders@chromium.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Evan Green <evgreen@chromium.org>,
        Lina Iyer <ilina@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200311231348.129254-1-dianders@chromium.org>
 <20200311161104.RFT.v2.5.I52653eb85d7dc8981ee0dafcd0b6cc0f273e9425@changeid>
 <30f2b142-6ac2-2917-1ad6-1474c51f3da7@codeaurora.org>
 <CAD=FV=Un78pD+88n-RTq5N3_XS1+cB8Noje6RZzPPDC1PckK8w@mail.gmail.com>
From:   Maulik Shah <mkshah@codeaurora.org>
Message-ID: <09837ee8-9359-6de5-801d-db85e4e34dfa@codeaurora.org>
Date:   Wed, 8 Apr 2020 16:40:15 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Un78pD+88n-RTq5N3_XS1+cB8Noje6RZzPPDC1PckK8w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/3/2020 1:48 AM, Doug Anderson wrote:
> Hi,
>
> On Wed, Apr 1, 2020 at 4:30 AM Maulik Shah <mkshah@codeaurora.org> wrote:
>>> + * Return: 0 if no problem, or -EAGAIN if the caller should try again in a bit.
>>> + *         Caller should make sure to enable interrupts between tries.
>>> + *         Only ever returns -EAGAIN for ACTIVE_ONLY transfers.
>> with [2] it will not return -EAGAIN, can you please remove this part.
> Sounds good.  Overall I'll probably wait to spin until your series
> lands because trying to keep spinning this one in conjunction with
> that one is going to be a nightmare.  Hopefully that means:
>
> a) Your series can land soon.  I think it's in pretty good shape now.
> I just sent a bunch of reviews.  Might need one more spin for nits and
> then we'll see if Bjorn thinks it's good to go.
>
> b) Once I spin this it can get a quicker review so other things don't
> pop up and change things.
>
> ...or, if you want, you can hijack my series and send the next version
> out yourself.  I won't object to that but please give me a heads up if
> you're planning to do that so we don't duplicate work.
>
>
>>> @@ -246,12 +288,35 @@ static struct tcs_group *get_tcs_for_msg(struct rsc_drv *drv,
>>>                        ret = rpmh_rsc_invalidate(drv);
>>>                        if (ret)
>>>                                return ERR_PTR(ret);
>>> +
>>> +                     /*
>>> +                      * TODO:
>>> +                      * - Temporarily enable IRQs on the wake tcs.
>>> +                      * - Make sure nobody else race with us and re-write
>>> +                      *   to this TCS; document how this works.
>> You can remove above comment, i already included change to enable IRQs
>> on wake TCS in my series.
> Right.  The race comment still is somewhat interesting because the
> only way we're race free is that we know that the sleep/wake values
> are only programmed at a time when no more active transactions can be
> started.  I'll document that assumption.  If we ever change that
> assumption we'll have to think about this more since (at the moment)
> programming sleep/wake doesn't set the "tcs_in_use" bit.
>
>
>>> +/**
>>> + * check_for_req_inflight() - Look to see if conflicting cmds are in flight.
>>> + * @drv: The controller.
>>> + * @tcs: A pointer to the tcs_group used for ACTIVE_ONLY transfers.
>>> + * @msg: The message we want to send, which will contain several addr/data
>>> + *       pairs to program (but few enough that they all fit in one TCS).
>>> + *
>>> + * Only for use for ACTIVE_ONLY tcs_group, since those are the only ones
>>> + * that might be actively sending.
>> This comment will need to modify/removed after we use this in place of
>> find_match().
>>
>> see below for more details.
> As per below I'm trying to understand the motivation for using
> check_for_req_inflight() when writing sleep/wake sets, so changing
> this is pending on that discussion.
>
>
>>> @@ -411,6 +533,20 @@ static int find_free_tcs(struct tcs_group *tcs)
>>>        return -EBUSY;
>>>    }
>>>
>>> +/**
>>> + * tcs_write() - Store messages into a TCS right now, or return -EBUSY.
>>> + * @drv: The controller.
>>> + * @msg: The data to be sent.
>>> + *
>>> + * Grabs a TCS for ACTIVE_ONLY transfers and writes the messages to it.
>>> + *
>>> + * If there are no free ACTIVE_ONLY TCSs or if a command for the same address
>>> + * is already transferring returns -EBUSY which means the client should retry
>>> + * shortly.
>>> + *
>>> + * Return: 0 on success, -EBUSY if client should retry, or an error.
>>> + *         Client should have interrupts enabled for a bit before retrying.
>>> + */
>>>    static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>>>    {
>>>        struct tcs_group *tcs;
>>> @@ -418,16 +554,14 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>>>        unsigned long flags;
>>>        int ret;
>>>
>>> +     /* TODO: get_tcs_for_msg() can return -EAGAIN and nobody handles */
>> with [2] it will not return -EAGAIN, can you please remove this comment.
> OK.
>
>
>>>        tcs = get_tcs_for_msg(drv, msg);
>>>        if (IS_ERR(tcs))
>>>                return PTR_ERR(tcs);
>>>
>>>        spin_lock_irqsave(&tcs->lock, flags);
>>> +
>>>        spin_lock(&drv->lock);
>>> -     /*
>>> -      * The h/w does not like if we send a request to the same address,
>>> -      * when one is already in-flight or being processed.
>>> -      */
>> please keep above comment as it is.
> OK.  I guess I felt like now that check_for_req_inflight() was
> documented it was just getting in the way, but I'll keep it if you
> want.
>
>
>>> @@ -485,6 +635,63 @@ int rpmh_rsc_send_data(struct rsc_drv *drv, const struct tcs_request *msg)
>>>        return ret;
>>>    }
>>>
>>> +/**
>>> + * find_match() - Find if the cmd sequence is in the tcs_group
>>> + * @tcs: The tcs_group to search.  Either sleep or wake.
>>> + * @cmd: The command sequence to search for; only addr is looked at.
>>> + * @len: The number of commands in the sequence.
>>> + *
>>> + * Searches through the given tcs_group to see if a given command sequence
>>> + * is in there.
>>> + *
>>> + * Two sequences are matches if they modify the same set of addresses in
>>> + * the same order.  The value of the data is not considered when deciding if
>>> + * two things are matches.
>>> + *
>>> + * How this function works is best understood by example.  For our example,
>>> + * we'll imagine our tcs group contains these (cmd, data) tuples:
>>> + *   [(a, A), (b, B), (c, C), (d, D), (e, E), (f, F), (g, G), (h, H)]
>>> + * ...in other words it has an element where (addr=a, data=A), etc.
>>> + * ...we'll assume that there is one TCS in the group that can store 8 commands.
>>> + *
>>> + * - find_match([(a, X)]) => 0
>>> + * - find_match([(c, X), (d, X)]) => 2
>>> + * - find_match([(c, X), (d, X), (e, X)]) => 2
>>> + * - find_match([(z, X)]) => -ENODATA
>>> + * - find_match([(a, X), (y, X)]) => -EINVAL (and warning printed)
>>> + * - find_match([(g, X), (h, X), (i, X)]) => -EINVAL (and warning printed)
>>> + * - find_match([(y, X), (a, X)]) => -ENODATA
>>> + *
>>> + * NOTE: This function overall seems like it has questionable value.
>>> + * - It can be used to update a message in the TCS with new data, but I
>>> + *   don't believe we actually do that--we always fully invalidate and
>>> + *   re-write everything.
>> we are doing this from [1] onwards.
> OK.
>
>
>>> Specifically it would be too limiting to force
>>> + *   someone not to change the set of addresses written to each time.
>>> + * - This function could be attempting to avoid writing different data to
>>> + *   the same address twice in a tcs_group.  If that's the goal, it doesn't
>>> + *   do a great job since find_match([(y, X), (a, X)]) return -ENODATA in my
>>> + *   above example.
>>> + * - If you originally wrote [(a, A), (b, B), (c, C)] and later tried to
>>> + *   write [(a, A), (b, B)] it'd look like a match and we wouldn't consider
>>> + *   it an error that the size got shorter.
>>> + * - If two clients wrote sequences that happened to be placed in slots next
>>> + *   to each other then a later check could match a sequence that was the
>>> + *   size of both together.
>>> + *
>>> + * TODO: in light of the above, prehaps we can just remove this function?
>> We still need to check there is no duplicate request in a TCS for SLEEP
>> and WAKE as well.
>>
>> find_match() checks if the request already exist for a resource then
>> update with new value, in a way preventing new request to go in
>>
>> when one already exists. I am ok to remove this function since after [1]
>> we always fully invalidate and then re-write and little point in
>>
>> finding a match now. However we need to use check_for_req_inflight()
>> from tcs_ctrl_write() with little modification to ignore tcs_is_free()
>>
>> check if is called from tcs_ctrlr_write().
> Sure, we could use find_match() to add this check.  It definitely
> feels a lot better than the current solution which seems to miss a
> whole lot of corner cases.
>
> Before I do that, maybe you can help me understand the motivation,
> though?  Where are you expecting to find the conflict?  Certainly
> there can't be any conflict in the normal (non-batch) sleep/wake sets,
> right?  We only have one entry in the RPMH cache per address so the
> non-batch entries can't conflict with themselves.  There also can't be
> any previous async command still pending because we cache
> async/non-async alike.
correct, we have unique requests in non-batch caches.
>
> For batch requests I believe that there's exactly one caller using the
> batch API (otherwise rpmh_invalidate() would be a nightmare).  That
> one caller is the interconnect code, right?  It feels like we could
> assume that the one caller of the batch API won't write to the same
> address more than one time?
correct there is only one client interconnect using batch API.
>
> So I guess you're expecting that an rpmh_write() would write to the
> same address that someone wrote to with rpmh_write_batch() and it
> should override it?
On upstream interconnect i see they are using batch only requests till now.

I agree to remove find_match() completly, and we can see in future if 
interconnect driver starts using non-batch APIs as well then we can 
introduce a check to find duplicates.
> Does that actually happen?
On upstream interconnect i see they are using batch only requests till now.
I agree to remove find_match() completly, and we can see in future if 
interconnect driver starts using non-batch APIs as well then we can 
introduce a check to find duplicates.
> Isn't the batch API
> used just for interconnect stuff and nobody should be using
> rpmh_write() to mess with the interconnect stuff?
>
>
>> After this change on 9th change in your series,  please move it before
>> current patch in series.
>>
>> please also keep dependency on [1] for 9th change.
> Sure.  I was trying to do all the documentation in the earlier patches
> to provide motivation for and help understand the later patches, but I
> can change the order if need be.  It didn't seem a big deal to add the
> comments and delete them, but I can understand it being weird.
>
>
>>>    /**
>>> - * rpmh_rsc_write_ctrl_data: Write request to the controller
>>> - *
>>> - * @drv: the controller
>>> - * @msg: the data to be written to the controller
>>> + * rpmh_rsc_write_ctrl_data() - Write request to controller but don't trigger.
>>> + * @drv: The controller.
>>> + * @msg: The data to be written to the controller.
>>>     *
>>>     * There is no response returned for writing the request to the controller.
>> you can remove above line since responce is returned from this function.
> Right.  I think this was trying to say that the request wasn't
> triggered and thus there was no response.  I think it's clearer with
> my addition of "but don't trigger." to the comment.
>
>
>
> -Doug

Thanks,

Maulik

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
