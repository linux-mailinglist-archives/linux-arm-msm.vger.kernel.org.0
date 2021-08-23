Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEEB83F515C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 21:38:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231496AbhHWTjS (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 15:39:18 -0400
Received: from alexa-out.qualcomm.com ([129.46.98.28]:5398 "EHLO
        alexa-out.qualcomm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232123AbhHWTjQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 15:39:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=quicinc.com; i=@quicinc.com; q=dns/txt; s=qcdkim;
  t=1629747513; x=1661283513;
  h=subject:to:cc:references:from:message-id:date:
   mime-version:in-reply-to:content-transfer-encoding;
  bh=wrPzydFoiv4W4g3o7TPP95c8VMQT8cOQnN+LkHUAijc=;
  b=cWsLt4Jj1x54xxjiPObUyXwRzSiZ5aqPDnLNH6XH9PPQ6sYobRKdf+Z+
   VkWSGid8pK3tShZ3Onj7L0EEos2KHMMFbi7BJ/T28JXngnIpBRUqeN1kn
   +ayHxgP1Pu5NW8jAIxoFVsZa/PvU8sUuPEtU2UyDuYUrmZThQykoo9Zx1
   M=;
Received: from ironmsg08-lv.qualcomm.com ([10.47.202.152])
  by alexa-out.qualcomm.com with ESMTP; 23 Aug 2021 12:38:33 -0700
X-QCInternal: smtphost
Received: from nalasex01a.na.qualcomm.com ([10.47.209.196])
  by ironmsg08-lv.qualcomm.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2021 12:38:32 -0700
Received: from [10.226.59.216] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.922.7; Mon, 23 Aug 2021
 12:38:31 -0700
Subject: Re: [PATCH v6 3/4] bus: mhi: core: Process execution environment
 changes serially
To:     <bbhatt@codeaurora.org>
CC:     <manivannan.sadhasivam@linaro.org>,
        <linux-arm-msm@vger.kernel.org>, <hemantk@codeaurora.org>,
        <linux-kernel@vger.kernel.org>, <loic.poulain@linaro.org>,
        <carl.yin@quectel.com>, <naveen.kumar@quectel.com>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
 <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
 <899da888-321a-c228-8537-b72821700dc7@quicinc.com>
 <62c4f4130f74e3731cd3886049684d23@codeaurora.org>
From:   Jeffrey Hugo <quic_jhugo@quicinc.com>
Message-ID: <6a4899dd-e690-81f9-2dc1-17a0e5eb1828@quicinc.com>
Date:   Mon, 23 Aug 2021 13:38:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <62c4f4130f74e3731cd3886049684d23@codeaurora.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanexm03a.na.qualcomm.com (10.85.0.103) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 8/23/2021 1:19 PM, Bhaumik Bhatt wrote:
> On 2021-08-23 11:43 AM, Jeffrey Hugo wrote:
>> On 2/24/2021 4:23 PM, Bhaumik Bhatt wrote:
>>> In current design, whenever the BHI interrupt is fired, the
>>> execution environment is updated. This can cause race conditions
>>> and impede ongoing power up/down processing. For example, if a
>>> power down is in progress, MHI host updates to a local "disabled"
>>> execution environment. If a BHI interrupt fires later, that value
>>> gets replaced with one from the BHI EE register. This impacts the
>>> controller as it does not expect multiple RDDM execution
>>> environment change status callbacks as an example. Another issue
>>> would be that the device can enter mission mode and the execution
>>> environment is updated, while device creation for SBL channels is
>>> still going on due to slower PM state worker thread run, leading
>>> to multiple attempts at opening the same channel.
>>>
>>> Ensure that EE changes are handled only from appropriate places
>>> and occur one after another and handle only PBL modes or RDDM EE
>>> changes as critical events directly from the interrupt handler.
>>> Simplify handling by waiting for SYS ERROR before handling RDDM.
>>> This also makes sure that we use the correct execution environment
>>> to notify the controller driver when the device resets to one of
>>> the PBL execution environments.
>>>
>>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>>
>> <snip>
>>
>>> @@ -452,27 +451,30 @@ irqreturn_t mhi_intvec_threaded_handler(int 
>>> irq_number, void *priv)
>>>       }
>>>       write_unlock_irq(&mhi_cntrl->pm_lock);
>>>   -     /* If device supports RDDM don't bother processing SYS error */
>>> -    if (mhi_cntrl->rddm_image) {
>>> -        /* host may be performing a device power down already */
>>> -        if (!mhi_is_active(mhi_cntrl))
>>> -            goto exit_intvec;
>>> +    if (pm_state != MHI_PM_SYS_ERR_DETECT || ee == mhi_cntrl->ee)
>>> +        goto exit_intvec;
>>>   -        if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
>>> +    switch (ee) {
>>> +    case MHI_EE_RDDM:
>>> +        /* proceed if power down is not already in progress */
>>> +        if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
>>>               mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>>> +            mhi_cntrl->ee = ee;
>>>               wake_up_all(&mhi_cntrl->state_event);
>>>           }
>>> -        goto exit_intvec;
>>> -    }
>>> -
>>> -    if (pm_state == MHI_PM_SYS_ERR_DETECT) {
>>> +        break;
>>> +    case MHI_EE_PBL:
>>> +    case MHI_EE_EDL:
>>> +    case MHI_EE_PTHRU:
>>> +        mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>>> +        mhi_cntrl->ee = ee;
>>>           wake_up_all(&mhi_cntrl->state_event);
>>> -
>>> -        /* For fatal errors, we let controller decide next step */
>>> -        if (MHI_IN_PBL(ee))
>>> -            mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>>> -        else
>>> -            mhi_pm_sys_err_handler(mhi_cntrl);
>>> +        mhi_pm_sys_err_handler(mhi_cntrl);
>>> +        break;
>>> +    default:
>>> +        wake_up_all(&mhi_cntrl->state_event);
>>> +        mhi_pm_sys_err_handler(mhi_cntrl);
>>> +        break;
>>>       }
>>
>> Bhaumik, can you explain the above change?  Before this patch (which
>> is now committed), if there was a fatal error, the controller was
>> notified (MHI_CB_FATAL_ERROR) and it decided all action.  After this
>> patch, the controller is notified, but also the core attempts to
>> handle the syserr.
>>
>> This is a change in behavior, and seems to make a mess of the
>> controller, and possibly the core fighting each other.
>>
>> Specifically, I'm rebasing the AIC100 driver onto 5.13, which has this
>> change, and I'm seeing a serious regression.  I'm thinking that for
>> the PBL/EDL/PTHRU case, mhi_pm_sys_err_handler() should not be called.
>>
>> Thoughts?
> 
> I see. We use this heavily for entry to EDL use-cases.
> 
> We do require the mhi_pm_sys_err_handler() to be called in those cases
> as any entry to PBL/EDL means there is need to clean-up MHI host and 
> notify all
> its clients.
> 
> We include PTHRU in here because its a SYS ERROR in PBL modes.
> 
> Premise being the controller should not be in that business of doing any of
> the clean-up that is responsibility of the core driver. We're using this 
> feature
> set to ensure controller is only notified.
> 
> What does AIC100 do on fatal error that you run in to issues? I don't think
> any of the other controllers do anything other than disabling runtime PM 
> since
> device is down. Maybe there's some room for improvement.

Our usecase is PBL as a result of a full device crash.  AIC100 doesn't 
exercise the EDL/PTHRU usecases.  (Just giving you some context, not 
trying to imply EDL is not valuable to others for example).

In that case (FATAL_ERROR), our controller schedules a work item, and 
then returnsas we assume FATAL_ERROR is notified in atomic context.  We 
need to do non-mhi cleanup first.  Then we powerdown the MHI to cleanup 
the MHI core, and kick off all the clients (its been a long while, but 
initially, we were seeing the syserr handling in the core not 
sufficiently kicking off the clients).  Then we power up MHI.  MHI will 
init in PBL, still in syserr, and handle it.

I haven't fully traced everything, but we were getting into some really 
bad states with the core triggering mhi_pm_sys_err_handler() per this patch.

Its important that we have control over the ordering of our cleanup, vs 
the MHI cleanup.  Sadly, non-atomic context (sleeping) is a requirement 
of our cleanup.

Seems like we have differing requirements here.  Hmm.  What about an API 
the controller can call, that does mhi_pm_sys_err_handler() (or 
equivalent) so that the controller can control when the MHI core cleanup 
is done, but doesn't need to be concerned with the details?  Or, do you 
have a suggestion?
