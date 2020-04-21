Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 778731B1E77
	for <lists+linux-arm-msm@lfdr.de>; Tue, 21 Apr 2020 07:59:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725902AbgDUF7X (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 21 Apr 2020 01:59:23 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:24902 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725901AbgDUF7X (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 21 Apr 2020 01:59:23 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1587448761; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: References: Cc: To:
 Subject: From: Sender; bh=YwAvukmD/jyEOUI6BV5ZgHLXkFYJYJLb3ylBpu/8jEk=;
 b=Ty5wzhdR2ewFV0SGqbNWqPtn7SD+Uw/58g4E7B7Ilr2rW8lgOpIE9sZko4gDGVWeeqg2o1cK
 /7u38xOWwxfuyJe1zXwEP9WnOI/lk68MpafFntKH1aHbFahGlmSHbuZK6vOOoQPfSuXCpeth
 IRDFWN8ySCWPYECef5QP1kWfpaY=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e9e8bae.7fb910201f80-smtp-out-n05;
 Tue, 21 Apr 2020 05:59:10 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 55021C43636; Tue, 21 Apr 2020 05:59:09 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.43.137] (unknown [106.213.184.221])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: mkshah)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 17368C433D2;
        Tue, 21 Apr 2020 05:59:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 17368C433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=mkshah@codeaurora.org
From:   Maulik Shah <mkshah@codeaurora.org>
Subject: Re: [PATCH v2 2/2] soc: qcom: rpmh-rsc: Remove the pm_lock
To:     Doug Anderson <dianders@chromium.org>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Evan Green <evgreen@chromium.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
References: <20200416173145.v2.1.I2d44fc0053d019f239527a4e5829416714b7e299@changeid>
 <20200416173145.v2.2.I295cb72bc5334a2af80313cbe97cb5c9dcb1442c@changeid>
 <a332c492-4d1a-6286-51d3-24430f460ff4@codeaurora.org>
 <CAD=FV=U5xmz2wOnx315amtdQ5D615Pb1spiHbYfidb9nq9yxzg@mail.gmail.com>
Message-ID: <6799af01-d420-07f9-147b-1db5db16ab2d@codeaurora.org>
Date:   Tue, 21 Apr 2020 11:28:59 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <CAD=FV=U5xmz2wOnx315amtdQ5D615Pb1spiHbYfidb9nq9yxzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi,

On 4/17/2020 10:47 PM, Doug Anderson wrote:
> Hi,
>
> On Fri, Apr 17, 2020 at 1:07 AM Maulik Shah<mkshah@codeaurora.org>  wrote:
>> Hi,
>>
>> On 4/17/2020 6:02 AM, Douglas Anderson wrote:
>>> It has been postulated that the pm_lock is bad for performance because
>>> a CPU currently running rpmh_flush() could block other CPUs from
>>> coming out of idle.  Similarly CPUs coming out of / going into idle
>>> all need to contend with each other for the spinlock just to update
>>> the variable tracking who's in PM.
>>>
>>> Let's optimize this a bit.  Specifically:
>>>
>>> - Use a count rather than a bitmask.  This is faster to access and
>>>     also means we can use the atomic_inc_return() function to really
>>>     detect who the last one to enter PM was.
>>> - Accept that it's OK if we race and are doing the flush (because we
>>>     think we're last) while another CPU is coming out of idle.  As long
>>>     as we block that CPU if/when it tries to do an active-only transfer
>>>     we're OK.
>>>
>>> Signed-off-by: Douglas Anderson<dianders@chromium.org>
>>> ---
>>>
>>> Changes in v2:
>>> - Always grab drv->lock first to ensure lock ordering.
>>> - Grab the cache_lock in rpmh_flush().
>>> - Comments about why num_online_cpus() is OK.
>>> - Return NOTIFY_DONE for things we don't care about.
>>> - Use trylock to avoid spinning in CPU_PM code.
>>> - !rpmh_flush() should have been rpmh_flush(), so we were alwys failing.
>>> - Account for CPU_PM_ENTER_FAILED not being called if we return NOTIFY_BAD.
>>>
>>>    drivers/soc/qcom/rpmh-internal.h | 13 +++---
>>>    drivers/soc/qcom/rpmh-rsc.c      | 75 ++++++++++++++++++++++----------
>>>    drivers/soc/qcom/rpmh.c          | 22 +++++++---
>>>    3 files changed, 73 insertions(+), 37 deletions(-)
>>>
>>> diff --git a/drivers/soc/qcom/rpmh-internal.h b/drivers/soc/qcom/rpmh-internal.h
>>> index dba8510c0669..f378c0f5e66d 100644
>>> --- a/drivers/soc/qcom/rpmh-internal.h
>>> +++ b/drivers/soc/qcom/rpmh-internal.h
>>> @@ -97,7 +97,7 @@ struct rpmh_ctrlr {
>>>     * @num_tcs:            Number of TCSes in this DRV.
>>>     * @rsc_pm:             CPU PM notifier for controller.
>>>     *                      Used when solver mode is not present.
>>> - * @cpus_entered_pm:    CPU mask for cpus in idle power collapse.
>>> + * @cpus_in_pm:         Number of CPUs not in idle power collapse.
>>>     *                      Used when solver mode is not present.
>>>     * @tcs:                TCS groups.
>>>     * @tcs_in_use:         S/W state of the TCS; only set for ACTIVE_ONLY
>>> @@ -109,10 +109,10 @@ struct rpmh_ctrlr {
>>>     *                      (aka the drv->lock) to mark one freed.
>>>     * @lock:               Synchronize state of the controller.  If you will be
>>>     *                      grabbing this lock and a tcs_lock at the same time,
>>> - *                      grab the tcs_lock first so we always have a
>>> - *                      consistent lock ordering.
>>> - * @pm_lock:            Synchronize during PM notifications.
>>> - *                      Used when solver mode is not present.
>>> + *                      grab the this lock first so we always have a
>>> + *                      consistent lock ordering.  If RPMH's cache lock will
>>> + *                      also be held, the order is: drv->lock, cache_lock,
>>> + *                      tcs_lock.
>>>     * @client:             Handle to the DRV's client.
>>>     */
>>>    struct rsc_drv {
>>> @@ -121,11 +121,10 @@ struct rsc_drv {
>>>        int id;
>>>        int num_tcs;
>>>        struct notifier_block rsc_pm;
>>> -     struct cpumask cpus_entered_pm;
>>> +     atomic_t cpus_in_pm;
>>>        struct tcs_group tcs[TCS_TYPE_NR];
>>>        DECLARE_BITMAP(tcs_in_use, MAX_TCS_NR);
>>>        spinlock_t lock;
>>> -     spinlock_t pm_lock;
>>>        struct rpmh_ctrlr client;
>>>    };
>>>
>>> diff --git a/drivers/soc/qcom/rpmh-rsc.c b/drivers/soc/qcom/rpmh-rsc.c
>>> index a9e15699f55f..5ef4dd9c72ae 100644
>>> --- a/drivers/soc/qcom/rpmh-rsc.c
>>> +++ b/drivers/soc/qcom/rpmh-rsc.c
>>> @@ -581,8 +581,9 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>>>        if (IS_ERR(tcs))
>>>                return PTR_ERR(tcs);
>>>
>>> -     spin_lock_irqsave(&tcs->lock, flags);
>>> +     local_irq_save(flags);
>>>        spin_lock(&drv->lock);
>>> +     spin_lock(&tcs->lock);
>>>        /*
>>>         * The h/w does not like if we send a request to the same address,
>>>         * when one is already in-flight or being processed.
>>> @@ -612,13 +613,20 @@ static int tcs_write(struct rsc_drv *drv, const struct tcs_request *msg)
>>>                write_tcs_reg_sync(drv, RSC_DRV_CMD_WAIT_FOR_CMPL, tcs_id, 0);
>>>                enable_tcs_irq(drv, tcs_id, true);
>>>        }
>>> +
>>> +     /*
>>> +      * Though we grabbed drv->lock first (to keep lock ordering consistent),
>>> +      * we release it first.  This is fine as long as we don't try to grab
>>> +      * it again until we release our tcs->lock.
>>> +      */
>> In [1]  we removed tcs->lock and are only using drv->lock , this should
>> help avoid ABBA/deadlocks since we are operating on single lock.
>>
>> Although it needs rebase on latest tip. Let me know i can resend the
>> patch/if you want to club in this change (removing tcs->lock part) i am ok.
> Sure.  Looking at the places where tcs_lock() is used:
>
> rpmh_rsc_write_ctrl_data() - only called from flushing routines which
> have to have their own exclusion anyway
> tcs_write() - holds drv->lock for almost the same amount of time
>
> ...so yeah, I can make that change as part of my series and it seems
> sane.  Looking at it closely I think in tcs_write() I can still drop
> the "drv->lock" before the __tcs_buffer_write() and
> __tcs_set_trigger() calls.  That's because I already claimed the TCS
> (under lock) by setting "tcs_in_use".  Once I've done that I know
> nobody else could be writing to the TCS, right?
Right.
>
>>>        spin_unlock(&drv->lock);
>>>
>>>        __tcs_buffer_write(drv, tcs_id, 0, msg);
>>>        __tcs_set_trigger(drv, tcs_id, true);
>>>
>>>    done_write:
>>> -     spin_unlock_irqrestore(&tcs->lock, flags);
>>> +     spin_unlock(&tcs->lock);
>>> +     local_irq_restore(flags);
>>>        return ret;
>>>    }
>>>
>>> @@ -741,6 +749,8 @@ int rpmh_rsc_write_ctrl_data(struct rsc_drv *drv, const struct tcs_request *msg)
>>>     * SLEEP and WAKE sets. If AMCs are busy, controller can not enter
>>>     * power collapse, so deny from the last cpu's pm notification.
>>>     *
>>> + * Context: Must be called with the drv->lock held.
>>> + *
>>>     * Return:
>>>     * * False          - AMCs are idle
>>>     * * True           - AMCs are busy
>>> @@ -755,9 +765,6 @@ static bool rpmh_rsc_ctrlr_is_busy(struct rsc_drv *drv)
>>>         * dedicated TCS for active state use, then re-purposed wake TCSes
>>>         * should be checked for not busy, because we used wake TCSes for
>>>         * active requests in this case.
>>> -      *
>>> -      * Since this is called from the last cpu, need not take drv or tcs
>>> -      * lock before checking tcs_is_free().
>>>         */
>>>        if (!tcs->num_tcs)
>>>                tcs = &drv->tcs[WAKE_TCS];
>>> @@ -792,36 +799,57 @@ static int rpmh_rsc_cpu_pm_callback(struct notifier_block *nfb,
>>>    {
>>>        struct rsc_drv *drv = container_of(nfb, struct rsc_drv, rsc_pm);
>>>        int ret = NOTIFY_OK;
>>> -
>>> -     spin_lock(&drv->pm_lock);
>>> +     int cpus_in_pm;
>>>
>>>        switch (action) {
>>>        case CPU_PM_ENTER:
>>> -             cpumask_set_cpu(smp_processor_id(), &drv->cpus_entered_pm);
>>> -
>>> -             if (!cpumask_equal(&drv->cpus_entered_pm, cpu_online_mask))
>>> -                     goto exit;
>>> +             cpus_in_pm = atomic_inc_return(&drv->cpus_in_pm);
>>> +             /*
>>> +              * NOTE: comments for num_online_cpus() point out that it's
>>> +              * only a snapshot so we need to be careful. It should be OK
>>> +              * for us to use, though.  It's important for us not to miss
>>> +              * if we're the last CPU going down so it would only be a
>>> +              * problem if a CPU went offline right after we did the check
>>> +              * AND that CPU was not idle AND that CPU was the last non-idle
>>> +              * CPU. That can't happen. CPUs would have to come out of idle
>>> +              * before the CPU could go offline.
>>> +              */
>>> +             if (cpus_in_pm < num_online_cpus())
>>> +                     return NOTIFY_OK;
>>>                break;
>>>        case CPU_PM_ENTER_FAILED:
>>>        case CPU_PM_EXIT:
>>> -             cpumask_clear_cpu(smp_processor_id(), &drv->cpus_entered_pm);
>>> -             goto exit;
>>> +             atomic_dec(&drv->cpus_in_pm);
>>> +             return NOTIFY_OK;
>>> +     default:
>>> +             return NOTIFY_DONE;
>>>        }
>>>
>>> -     ret = rpmh_rsc_ctrlr_is_busy(drv);
>>> -     if (ret) {
>>> +     /*
>>> +      * It's likely we're on the last CPU. Grab the drv->lock and write
>>> +      * out the sleep/wake commands to RPMH hardware. Grabbing the lock
>>> +      * means that if we race with another CPU coming up we are still
>>> +      * guaranteed to be safe. If another CPU came up just after we checked
>>> +      * and has grabbed thelock or started an active transfer then we'll
>> thelock, the lock. one space inbetween.
> Thanks.  The spacebar on my work-from-home keyboard isn't perfect.
> :-P  I'll fix the typo.
>
>
>>> +      * notice we're busy and abort. If another CPU comes up after we start
>>> +      * flushing it will be blocked from starting an active transfer until
>>> +      * we're done flushing. If another CPU starts an active transfer after
>>> +      * we release the lock we're still OK because we're no longer the last
>>> +      * CPU.
>>> +      */
>>> +     if (spin_trylock(&drv->lock)) {
>>> +             if (rpmh_rsc_ctrlr_is_busy(drv) || rpmh_flush(&drv->client))
>>> +                     ret = NOTIFY_BAD;
>> if (rpmh_rsc_ctrlr_is_busy(drv) || rpmh_flush(&drv->client)) {
>>           if (cpus_in_pm < num_online_cpus())
>>               ret = NOTIFY_OK;
>>           else
>>               ret = NOTIFY_BAD;
>>
>> }
>>
>> if rpmh_flush() failed because another CPU woken up and started rpmh
>> transfer, we are ok to power down current cpu by returning NOTIFY_OK.
>>
>> Can change this to return error only when last cpu failed to flush, like
>> above.
> I thought about doing stuff like this but decided against it.  It's
> adding extra code to solve a problem that (I'll argue) isn't a
> problem.  Specifically I believe that I believe it will be exceedingly
> rare for _any_ of the "NOTIFY_BAD" cases to hit.

NOTIFY_BAD should happen for rare cases only (mostly when 
rpmh_rsc_ctrlr_is_busy() returns true)

> In that super rare
> case we do hit one we will still be correct (we won't crash), one CPU
> just won't go idle.
SC7180 has little and big CPUs. Both are powered by different power 
rail..in below scenario

1. All previos CPUs went into idle, the last CPU is big CPU which now 
notifying for idle.
2. The last CPU checked for rpmh_rsc_ctrlr_is_busy() and it returned 
false (meaning no ACTIVE transaction was in progress)
3. The last CPU is about to start rpmh_flush() now
4. Meanwhile any little CPU woken up and acquired cache_lock
5. The rpmh_flush() returns error (after trying to acquire cache_lock 
failed)
6. The last CPU (big CPU) in this case is still OK to goto idle, since 
it wasn't anymore really the last CPU

if we return NOTIFY_BAD, until big CPU re-tries and do all over again to 
reach here, the power rail for big CPUs is left powered ON.

we should let big CPU goto idle here (that will make power rail turn off 
since all big CPUs are idle leading to power savings) and leave it for 
little CPU to do rpmh_flush() when it goes idle.

The power savings will be less if above scenario happens on same CPU 
type (two big CPUs or two little CPUs), but can still be considerable.

> I would also argue that (perhaps) if it looked
> like the system was idle enough for all the CPUs to go down and then
> suddenly one CPU woke up then perhaps it's actually the correct thing
> for this CPU not to go idle and to force the system to try again.
For the reasons above.
> To answer whether adding this code would be worth it (and would help
> or hurt), it would be interesting to test what's happening on real
> systems.  Are you able to hit these "NOTIFY_BAD" cases?  If so, which
> ones do you actually hit?

I am yest to test this change but hitting NOTIFY_BAD is rare scenario 
and mostly should happen for last CPU only if detects 
rpmh_rsc_ctrlr_is_busy() is true.

>    Do you _ever_ hit the case where one of the
> spinlocks fails to lock?
It might in above scenario.
>
> I'll await your response here before sending v3.
>
>
> -Doug
Thanks,
Maulik
>>> +             spin_unlock(&drv->lock);
>>> +     } else {
>>> +             /* Another CPU must be up */
>>>                ret = NOTIFY_BAD;
>>> -             goto exit;
>>>        }
>>>
>>> -     ret = rpmh_flush(&drv->client);
>>> -     if (ret)
>>> -             ret = NOTIFY_BAD;
>>> -     else
>>> -             ret = NOTIFY_OK;
>>> +     /* If we reject we won't be called w/ CPU_PM_ENTER_FAILED */
>>> +     if (ret == NOTIFY_BAD)
>>> +             atomic_dec(&drv->cpus_in_pm);
>>>
>>> -exit:
>>> -     spin_unlock(&drv->pm_lock);
>>>        return ret;
>>>    }
>>>
>>> @@ -965,7 +993,6 @@ static int rpmh_rsc_probe(struct platform_device *pdev)
>>>        solver_config = solver_config >> DRV_HW_SOLVER_SHIFT;
>>>        if (!solver_config) {
>>>                drv->rsc_pm.notifier_call = rpmh_rsc_cpu_pm_callback;
>>> -             spin_lock_init(&drv->pm_lock);
>>>                cpu_pm_register_notifier(&drv->rsc_pm);
>>>        }
>>>
>>> diff --git a/drivers/soc/qcom/rpmh.c b/drivers/soc/qcom/rpmh.c
>>> index 3abbb08cd6e1..3ba08bd14fa2 100644
>>> --- a/drivers/soc/qcom/rpmh.c
>>> +++ b/drivers/soc/qcom/rpmh.c
>>> @@ -445,13 +445,21 @@ static int send_single(struct rpmh_ctrlr *ctrlr, enum rpmh_state state,
>>>    int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>>    {
>>>        struct cache_req *p;
>>> -     int ret;
>>> +     int ret = 0;
>>>
>>>        lockdep_assert_irqs_disabled();
>>>
>>> +     /*
>>> +      * Currently rpmh_flush() is only called when we think we're running
>>> +      * on the last processor.  If the lock is busy it means another
>>> +      * processor is up and it's better to abort than spin.
>>> +      */
>>> +     if (!spin_trylock(&ctrlr->cache_lock))
>>> +             return -EBUSY;
>>> +
>>>        if (!ctrlr->dirty) {
>>>                pr_debug("Skipping flush, TCS has latest data.\n");
>>> -             return 0;
>>> +             goto exit;
>>>        }
>>>
>>>        /* Invalidate the TCSes first to avoid stale data */
>>> @@ -460,7 +468,7 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>>        /* First flush the cached batch requests */
>>>        ret = flush_batch(ctrlr);
>>>        if (ret)
>>> -             return ret;
>>> +             goto exit;
>>>
>>>        list_for_each_entry(p, &ctrlr->cache, list) {
>>>                if (!is_req_valid(p)) {
>>> @@ -471,16 +479,18 @@ int rpmh_flush(struct rpmh_ctrlr *ctrlr)
>>>                ret = send_single(ctrlr, RPMH_SLEEP_STATE, p->addr,
>>>                                  p->sleep_val);
>>>                if (ret)
>>> -                     return ret;
>>> +                     goto exit;
>>>                ret = send_single(ctrlr, RPMH_WAKE_ONLY_STATE, p->addr,
>>>                                  p->wake_val);
>>>                if (ret)
>>> -                     return ret;
>>> +                     goto exit;
>>>        }
>>>
>>>        ctrlr->dirty = false;
>>>
>>> -     return 0;
>>> +exit:
>>> +     spin_unlock(&ctrlr->cache_lock);
>>> +     return ret;
>>>    }
>>>
>>>    /**
>> [1]https://lore.kernel.org/patchwork/patch/1044697/
>>
>> --
>> QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation

-- 
QUALCOMM INDIA, on behalf of Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, hosted by The Linux Foundation
