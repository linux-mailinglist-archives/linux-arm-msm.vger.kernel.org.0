Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 65DBA19B9AD
	for <lists+linux-arm-msm@lfdr.de>; Thu,  2 Apr 2020 03:01:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732498AbgDBBB5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 21:01:57 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13914 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732664AbgDBBB5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 21:01:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1585789316; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=QAHYcoUDv2nhsjy7hNSPwmWAPOAPbrFtNhtJ+n4wZcw=; b=VsuU5EUyl4S4rXe/MpsffAZ/vX5bp62F68idKPEOU1DiVcMXXXhVv18DiH1dgQREvi+n18hI
 whgBGZEP+OKOt4YFgxDq+n3R7ZmPB8c5qLYCh4sNoaZcq7i/2RAVhpRCvwffqeVaaHDWgXF1
 hC2/ONJ9Hr0vIo1ev2udhC8tQM4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e853960.7fd24970d3b0-smtp-out-n01;
 Thu, 02 Apr 2020 01:01:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 6A846C4478F; Thu,  2 Apr 2020 01:01:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (cpe-70-95-5-60.san.res.rr.com [70.95.5.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 98F41C433F2;
        Thu,  2 Apr 2020 01:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 98F41C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH 6/6] remoteproc: qcom: Add notification types to SSR
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>, tsoni@codeaurora.org,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        linux-remoteproc <linux-remoteproc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>, psodagud@codeaurora.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        linux-remoteproc-owner@vger.kernel.org
References: <1582167465-2549-1-git-send-email-sidgup@codeaurora.org>
 <1582167465-2549-7-git-send-email-sidgup@codeaurora.org>
 <20200227215940.GC20116@xps15>
 <1a615fcd5a5c435d1d8babe8d5c3f8c3@codeaurora.org>
 <20200228183832.GA23026@xps15>
 <cac45f2726a272ccd0ce82e12e46756f@codeaurora.org>
 <CANLsYkzUh_BRjapX_jDZZ00Lj8MMgMPM12+otYHDKqad1s-qHQ@mail.gmail.com>
 <050a8613cd00a84678b4478ef3387465@codeaurora.org>
 <CANLsYkyrzNPUymuJzehEOAA2FV+WDohUpgCYTNdbGCJBoat2cg@mail.gmail.com>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <64310efc-00f3-f8d8-3058-19dfbe1aa578@codeaurora.org>
Date:   Wed, 1 Apr 2020 18:01:16 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CANLsYkyrzNPUymuJzehEOAA2FV+WDohUpgCYTNdbGCJBoat2cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/9/2020 10:34 AM, Mathieu Poirier wrote:

> On Tue, 3 Mar 2020 at 16:30, <rishabhb@codeaurora.org> wrote:
>> On 2020-03-03 10:05, Mathieu Poirier wrote:
>>> On Mon, 2 Mar 2020 at 13:54, <rishabhb@codeaurora.org> wrote:
>>>> On 2020-02-28 10:38, Mathieu Poirier wrote:
>>>>> On Thu, Feb 27, 2020 at 04:00:21PM -0800, rishabhb@codeaurora.org
>>>>> wrote:
>>>>>> On 2020-02-27 13:59, Mathieu Poirier wrote:
>>>>>>> On Wed, Feb 19, 2020 at 06:57:45PM -0800, Siddharth Gupta wrote:
>>>>>>>> The SSR subdevice only adds callback for the unprepare event. Add
>>>>>>>> callbacks
>>>>>>>> for unprepare, start and prepare events. The client driver for a
>>>>>>>> particular
>>>>>>>> remoteproc might be interested in knowing the status of the remoteproc
>>>>>>>> while undergoing SSR, not just when the remoteproc has finished
>>>>>>>> shutting
>>>>>>>> down.
>>>>>>>>
>>>>>>>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>>>>>>>> ---
>>>>>>>>   drivers/remoteproc/qcom_common.c | 39
>>>>>>>> +++++++++++++++++++++++++++++++++++----
>>>>>>>>   include/linux/remoteproc.h       | 15 +++++++++++++++
>>>>>>>>   2 files changed, 50 insertions(+), 4 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/remoteproc/qcom_common.c
>>>>>>>> b/drivers/remoteproc/qcom_common.c
>>>>>>>> index 6714f27..6f04a5b 100644
>>>>>>>> --- a/drivers/remoteproc/qcom_common.c
>>>>>>>> +++ b/drivers/remoteproc/qcom_common.c
>>>>>>>> @@ -183,9 +183,9 @@ EXPORT_SYMBOL_GPL(qcom_remove_smd_subdev);
>>>>>>>>    *
>>>>>>>>    * Returns pointer to srcu notifier head on success, ERR_PTR on
>>>>>>>> failure.
>>>>>>>>    *
>>>>>>>> - * This registers the @notify function as handler for restart
>>>>>>>> notifications. As
>>>>>>>> - * remote processors are stopped this function will be called, with
>>>>>>>> the rproc
>>>>>>>> - * pointer passed as a parameter.
>>>>>>>> + * This registers the @notify function as handler for
>>>>>>>> powerup/shutdown
>>>>>>>> + * notifications. This function will be invoked inside the
>>>>>>>> callbacks registered
>>>>>>>> + * for the ssr subdevice, with the rproc pointer passed as a
>>>>>>>> parameter.
>>>>>>>>    */
>>>>>>>>   void *qcom_register_ssr_notifier(struct rproc *rproc, struct
>>>>>>>> notifier_block *nb)
>>>>>>>>   {
>>>>>>>> @@ -227,11 +227,39 @@ int qcom_unregister_ssr_notifier(void *notify,
>>>>>>>> struct notifier_block *nb)
>>>>>>>>   }
>>>>>>>>   EXPORT_SYMBOL_GPL(qcom_unregister_ssr_notifier);
>>>>>>>>
>>>>>>>> +static int ssr_notify_prepare(struct rproc_subdev *subdev)
>>>>>>>> +{
>>>>>>>> +        struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>>>>>>>> +
>>>>>>>> +        srcu_notifier_call_chain(ssr->rproc_notif_list,
>>>>>>>> +                                 RPROC_BEFORE_POWERUP, (void *)ssr->name);
>>>>>>>> +        return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static int ssr_notify_start(struct rproc_subdev *subdev)
>>>>>>>> +{
>>>>>>>> +        struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>>>>>>>> +
>>>>>>>> +        srcu_notifier_call_chain(ssr->rproc_notif_list,
>>>>>>>> +                                 RPROC_AFTER_POWERUP, (void *)ssr->name);
>>>>>>>> +        return 0;
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +static void ssr_notify_stop(struct rproc_subdev *subdev, bool
>>>>>>>> crashed)
>>>>>>>> +{
>>>>>>>> +        struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>>>>>>>> +
>>>>>>>> +        srcu_notifier_call_chain(ssr->rproc_notif_list,
>>>>>>>> +                                 RPROC_BEFORE_SHUTDOWN, (void *)ssr->name);
>>>>>>>> +}
>>>>>>>> +
>>>>>>>> +
>>>>>>>>   static void ssr_notify_unprepare(struct rproc_subdev *subdev)
>>>>>>>>   {
>>>>>>>>           struct qcom_rproc_ssr *ssr = to_ssr_subdev(subdev);
>>>>>>>>
>>>>>>>> -        srcu_notifier_call_chain(ssr->rproc_notif_list, 0, (void
>>>>>>>> *)ssr->name);
>>>>>>>> +        srcu_notifier_call_chain(ssr->rproc_notif_list,
>>>>>>>> +                                 RPROC_AFTER_SHUTDOWN, (void *)ssr->name);
>>>>>>>>   }
>>>>>>>>
>>>>>>>>   /**
>>>>>>>> @@ -248,6 +276,9 @@ void qcom_add_ssr_subdev(struct rproc *rproc,
>>>>>>>> struct qcom_rproc_ssr *ssr,
>>>>>>>>   {
>>>>>>>>           ssr->name = ssr_name;
>>>>>>>>           ssr->subdev.name = kstrdup("ssr_notifs", GFP_KERNEL);
>>>>>>>> +        ssr->subdev.prepare = ssr_notify_prepare;
>>>>>>>> +        ssr->subdev.start = ssr_notify_start;
>>>>>>>> +        ssr->subdev.stop = ssr_notify_stop;
>>>>>>> Now that I have a better understanding of what this patchset is doing, I
>>>>>>> realise
>>>>>>> my comments in patch 04 won't work.  To differentiate the subdevs of an
>>>>>>> rproc I
>>>>>>> suggest to wrap them in a generic structure with a type and an enum.
>>>>>>> That way
>>>>>>> you can differenciate between subdevices without having to add to the
>>>>>>> core.

While creating a new revision of the patchset we tried to implement 
this, but a similar issue comes
up. If at a later point we wish to utilize the functionality of some 
common subdevice (not the case
right now, but potentially), we might run into a similar problem of 
accessing illegal memory using
container_of. I think it might be a better idea to introduce the name in 
the subdevice structure over
having a potential security bug. What do you think?

Thanks,
Siddharth

>>>>>> Ok. I can try that.
>>>>>>> That being said, I don't understand what patches 5 and 6 are doing...
>>>>>>> Registering with the global ssr_notifiers allowed to gracefully shutdown
>>>>>>> all the
>>>>>>> MCUs in the system when one of them would go down.  But now that we are
>>>>>>> using
>>>>>>> the notifier on a per MCU, I really don't see why each subdev couldn't
>>>>>>> implement
>>>>>>> the right prepare/start/stop functions.
>>>>>>>
>>>>>>> Am I missing something here?
>>>>>> We only want kernel clients to be notified when the Remoteproc they
>>>>>> are
>>>>>> interested
>>>>>> in changes state. For e.g. audio kernel driver should be notified when
>>>>>> audio
>>>>>> processor goes down but it does not care about any other remoteproc.
>>>>>> If you are suggesting that these kernel clients be added as subdevices
>>>>>> then
>>>>>> we will end up having many subdevices registered to each remoteproc.
>>>>>> So we
>>>>>> implemented a notifier chain per Remoteproc. This keeps the SSR
>>>>>> notifications as
>>>>>> the subdevice per remoteproc, and all interested clients can register
>>>>>> to it.
>>>>> It seems like I am missing information...  Your are referring to
>>>>> "kernel
>>>>> clients" and as such I must assume some drivers that are not part of
>>>>> the
>>>>> remoteproc/rpmsg subsystems are calling qcom_register_ssr_notifier().
>>>>> I must
>>>> Yes these are not part of remoteproc framework and they will register
>>>> for notifications.
>>>>> also assume these drivers (or that functionality) are not yet upsream
>>>>> because
>>>>> all I can see calling qcom_register_ssr_notifier() is
>>>>> qcom_glink_ssr_probe().
>>>> Correct.These are not upstreamed.
>>> Ok, things are starting to make sense.
>>>
>>>>> Speaking of which, what is the role of the qcom_glink_ssr_driver?  Is
>>>>> the glink
>>>>> device that driver is handling the same as the glink device registed in
>>>>> adsp_probe() and q6v5_probe()?
>>>> glink ssr driver will send out notifications to remoteprocs that have
>>>> opened the
>>>> "glink_ssr" channel that some subsystem has gone down or booted up.
>>>> This
>>>> helps notify
>>>> neighboring subsystems about change in state of any other subsystem.
>>> I am still looking for an answer to my second question.
>> Yes its the subdevice of the glink device that is registered in
>> adsp_probe.
>> It uses the "glink_ssr" glink channel.
> Since this is confining events to a single MCU, I was mostly worried
> about opening the "glink_ssr" channel for nothing but taking a step
> back and thinking further on this, there might be other purposes for
> the channel than only receiving notifications of other MCUs in the
> system going down.
>
> Please spin off a new revision of this set and I will take another look.
>
> Thanks,
> Mathieu
>
>>>>>>>
>>>>>>>>           ssr->subdev.unprepare = ssr_notify_unprepare;
>>>>>>>>           ssr->rproc_notif_list = kzalloc(sizeof(struct srcu_notifier_head),
>>>>>>>>                                                                   GFP_KERNEL);
>>>>>>>> diff --git a/include/linux/remoteproc.h b/include/linux/remoteproc.h
>>>>>>>> index e2f60cc..4be4478 100644
>>>>>>>> --- a/include/linux/remoteproc.h
>>>>>>>> +++ b/include/linux/remoteproc.h
>>>>>>>> @@ -449,6 +449,21 @@ struct rproc_dump_segment {
>>>>>>>>   };
>>>>>>>>
>>>>>>>>   /**
>>>>>>>> + * enum rproc_notif_type - Different stages of remoteproc
>>>>>>>> notifications
>>>>>>>> + * @RPROC_BEFORE_SHUTDOWN:      unprepare stage of  remoteproc
>>>>>>>> + * @RPROC_AFTER_SHUTDOWN:       stop stage of  remoteproc
>>>>>>>> + * @RPROC_BEFORE_POWERUP:       prepare stage of  remoteproc
>>>>>>>> + * @RPROC_AFTER_POWERUP:        start stage of  remoteproc
>>>>>>>> + */
>>>>>>>> +enum rproc_notif_type {
>>>>>>>> +        RPROC_BEFORE_SHUTDOWN,
>>>>>>>> +        RPROC_AFTER_SHUTDOWN,
>>>>>>>> +        RPROC_BEFORE_POWERUP,
>>>>>>>> +        RPROC_AFTER_POWERUP,
>>>>>>>> +        RPROC_MAX
>>>>>>>> +};
>>>>>>>> +
>>>>>>>> +/**
>>>>>>>>    * struct rproc - represents a physical remote processor device
>>>>>>>>    * @node: list node of this rproc object
>>>>>>>>    * @domain: iommu domain
>>>>>>>> --
>>>>>>>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>>>>>>>> a Linux Foundation Collaborative Project
>>>>>>>>
>>>>>>>> _______________________________________________
>>>>>>>> linux-arm-kernel mailing list
>>>>>>>> linux-arm-kernel@lists.infradead.org
>>>>>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
>>>> _______________________________________________
>>>> linux-arm-kernel mailing list
>>>> linux-arm-kernel@lists.infradead.org
>>>> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
