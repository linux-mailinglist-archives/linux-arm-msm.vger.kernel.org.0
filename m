Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 267BB3F8D8C
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Aug 2021 20:06:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238494AbhHZSFn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Aug 2021 14:05:43 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:55698 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240906AbhHZSFn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Aug 2021 14:05:43 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1630001095; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=8HX7zC93pLYgz4epiM7Mki9KPXeD3xRWqhgadTi4xuU=;
 b=OTnIF2PFCz2eo1R8CRja+tRUgiFFmVZQorC50VT3pgsimQdP1AeQ8RcH3QHPFyHe+iL7EE00
 JAKf38i6HFrH+77c7HNdQ6Ag54BAPjVlK1fG3Q5O284wcvBWn962cwWHKBBQvroGPoz7fN1r
 BkDNf144OqQtOUnl/fbdB4PPTGQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-east-1.postgun.com with SMTP id
 6127d7bae0fcecca190f04d1 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 26 Aug 2021 18:04:42
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5EEC2C4360C; Thu, 26 Aug 2021 18:04:41 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0CFDFC4338F;
        Thu, 26 Aug 2021 18:04:38 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8;
 format=flowed
Content-Transfer-Encoding: 8bit
Date:   Thu, 26 Aug 2021 11:04:38 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        hemantk@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org, carl.yin@quectel.com,
        naveen.kumar@quectel.com
Subject: Re: [PATCH v6 3/4] bus: mhi: core: Process execution environment
 changes serially
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <6a4899dd-e690-81f9-2dc1-17a0e5eb1828@quicinc.com>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
 <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
 <899da888-321a-c228-8537-b72821700dc7@quicinc.com>
 <62c4f4130f74e3731cd3886049684d23@codeaurora.org>
 <6a4899dd-e690-81f9-2dc1-17a0e5eb1828@quicinc.com>
Message-ID: <b7e423cb1cda6be369826143f01a7d7f@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-23 12:38 PM, Jeffrey Hugo wrote:
> On 8/23/2021 1:19 PM, Bhaumik Bhatt wrote:
>> On 2021-08-23 11:43 AM, Jeffrey Hugo wrote:
>>> On 2/24/2021 4:23 PM, Bhaumik Bhatt wrote:
>>>> In current design, whenever the BHI interrupt is fired, the
>>>> execution environment is updated. This can cause race conditions
>>>> and impede ongoing power up/down processing. For example, if a
>>>> power down is in progress, MHI host updates to a local "disabled"
>>>> execution environment. If a BHI interrupt fires later, that value
>>>> gets replaced with one from the BHI EE register. This impacts the
>>>> controller as it does not expect multiple RDDM execution
>>>> environment change status callbacks as an example. Another issue
>>>> would be that the device can enter mission mode and the execution
>>>> environment is updated, while device creation for SBL channels is
>>>> still going on due to slower PM state worker thread run, leading
>>>> to multiple attempts at opening the same channel.
>>>> 
>>>> Ensure that EE changes are handled only from appropriate places
>>>> and occur one after another and handle only PBL modes or RDDM EE
>>>> changes as critical events directly from the interrupt handler.
>>>> Simplify handling by waiting for SYS ERROR before handling RDDM.
>>>> This also makes sure that we use the correct execution environment
>>>> to notify the controller driver when the device resets to one of
>>>> the PBL execution environments.
>>>> 
>>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>> 
>>> <snip>
>>> 
>>>> @@ -452,27 +451,30 @@ irqreturn_t mhi_intvec_threaded_handler(int 
>>>> irq_number, void *priv)
>>>>       }
>>>>       write_unlock_irq(&mhi_cntrl->pm_lock);
>>>>   -     /* If device supports RDDM don't bother processing SYS error 
>>>> */
>>>> -    if (mhi_cntrl->rddm_image) {
>>>> -        /* host may be performing a device power down already */
>>>> -        if (!mhi_is_active(mhi_cntrl))
>>>> -            goto exit_intvec;
>>>> +    if (pm_state != MHI_PM_SYS_ERR_DETECT || ee == mhi_cntrl->ee)
>>>> +        goto exit_intvec;
>>>>   -        if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) 
>>>> {
>>>> +    switch (ee) {
>>>> +    case MHI_EE_RDDM:
>>>> +        /* proceed if power down is not already in progress */
>>>> +        if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
>>>>               mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>>>> +            mhi_cntrl->ee = ee;
>>>>               wake_up_all(&mhi_cntrl->state_event);
>>>>           }
>>>> -        goto exit_intvec;
>>>> -    }
>>>> -
>>>> -    if (pm_state == MHI_PM_SYS_ERR_DETECT) {
>>>> +        break;
>>>> +    case MHI_EE_PBL:
>>>> +    case MHI_EE_EDL:
>>>> +    case MHI_EE_PTHRU:
>>>> +        mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>>>> +        mhi_cntrl->ee = ee;
>>>>           wake_up_all(&mhi_cntrl->state_event);
>>>> -
>>>> -        /* For fatal errors, we let controller decide next step */
>>>> -        if (MHI_IN_PBL(ee))
>>>> -            mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>>>> -        else
>>>> -            mhi_pm_sys_err_handler(mhi_cntrl);
>>>> +        mhi_pm_sys_err_handler(mhi_cntrl);
>>>> +        break;
>>>> +    default:
>>>> +        wake_up_all(&mhi_cntrl->state_event);
>>>> +        mhi_pm_sys_err_handler(mhi_cntrl);
>>>> +        break;
>>>>       }
>>> 
>>> Bhaumik, can you explain the above change?  Before this patch (which
>>> is now committed), if there was a fatal error, the controller was
>>> notified (MHI_CB_FATAL_ERROR) and it decided all action.  After this
>>> patch, the controller is notified, but also the core attempts to
>>> handle the syserr.
>>> 
>>> This is a change in behavior, and seems to make a mess of the
>>> controller, and possibly the core fighting each other.
>>> 
>>> Specifically, I'm rebasing the AIC100 driver onto 5.13, which has 
>>> this
>>> change, and I'm seeing a serious regression.  I'm thinking that for
>>> the PBL/EDL/PTHRU case, mhi_pm_sys_err_handler() should not be 
>>> called.
>>> 
>>> Thoughts?
>> 
>> I see. We use this heavily for entry to EDL use-cases.
>> 
>> We do require the mhi_pm_sys_err_handler() to be called in those cases
>> as any entry to PBL/EDL means there is need to clean-up MHI host and 
>> notify all
>> its clients.
>> 
>> We include PTHRU in here because its a SYS ERROR in PBL modes.
>> 
>> Premise being the controller should not be in that business of doing 
>> any of
>> the clean-up that is responsibility of the core driver. We're using 
>> this feature
>> set to ensure controller is only notified.
>> 
>> What does AIC100 do on fatal error that you run in to issues? I don't 
>> think
>> any of the other controllers do anything other than disabling runtime 
>> PM since
>> device is down. Maybe there's some room for improvement.
> 
> Our usecase is PBL as a result of a full device crash.  AIC100 doesn't
> exercise the EDL/PTHRU usecases.  (Just giving you some context, not
> trying to imply EDL is not valuable to others for example).
> 
> In that case (FATAL_ERROR), our controller schedules a work item, and
> then returnsas we assume FATAL_ERROR is notified in atomic context.
> We need to do non-mhi cleanup first.  Then we powerdown the MHI to
> cleanup the MHI core, and kick off all the clients (its been a long
> while, but initially, we were seeing the syserr handling in the core
> not sufficiently kicking off the clients).  Then we power up MHI.  MHI
> will init in PBL, still in syserr, and handle it.
> 
> I haven't fully traced everything, but we were getting into some
> really bad states with the core triggering mhi_pm_sys_err_handler()
> per this patch.
> 
> Its important that we have control over the ordering of our cleanup,
> vs the MHI cleanup.  Sadly, non-atomic context (sleeping) is a
> requirement of our cleanup.
> 
> Seems like we have differing requirements here.  Hmm.  What about an
> API the controller can call, that does mhi_pm_sys_err_handler() (or
> equivalent) so that the controller can control when the MHI core
> cleanup is done, but doesn't need to be concerned with the details?
> Or, do you have a suggestion?

I see why you're seeing the issue. We had a design shift when we 
introduced
EDL handling and updated how the execution environments and state 
changes get
processed.

Previously, you would only receive the FATAL ERROR callback if a 
SYS_ERROR
entry in PBL execution environment occurred. Now, you're getting both 
the
callbacks as MHI core driver takes the responsibility of SYS_ERROR 
handling
and related clean-up.

The way we can take it forward is - FATAL ERROR callback should just be 
an
indication to the controller that device saw a SYS_ERROR and has entered 
PBL.

The SYS_ERROR callback is sleep-capable and will block for the 
controller to
perform any heavy-lifting clean-up with the exception of an 
mhi_power_down()
call from within that callback. If that provision is desired, it can be 
taken
care of in a future patch as an async power down request or something 
equivalent.

I will push a patch to improve the documentation for this.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
