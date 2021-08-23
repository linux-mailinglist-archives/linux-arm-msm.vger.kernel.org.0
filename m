Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B62E3F5124
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Aug 2021 21:19:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230377AbhHWTTx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 23 Aug 2021 15:19:53 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:24754 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhHWTTv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 23 Aug 2021 15:19:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1629746348; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Xu22I1siZ+uMMg5BUtcnE4glpvItoPhLcNyFpMXvNmw=;
 b=cJ9BX/0s8zCpH7TwUigeqYTl8Bc7Yfn4JEFb6FGcBoiiKBe7OQEsGvJdOFaiCEPLIYA2vySe
 mwgQ3jbnCuyddCCeMxK1QuP58D35ON1smDizbXfSG+dVnXA6Bl+CPxO+Yo7i6gCZdcyMmYMH
 FXA8kR59Vo1TvcpKdOk3pjXWsGI=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 6123f4a62b9e91b68827410f (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 23 Aug 2021 19:19:02
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0A1E2C43617; Mon, 23 Aug 2021 19:19:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id EAEA0C4338F;
        Mon, 23 Aug 2021 19:19:00 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 23 Aug 2021 12:19:00 -0700
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
In-Reply-To: <899da888-321a-c228-8537-b72821700dc7@quicinc.com>
References: <1614208985-20851-1-git-send-email-bbhatt@codeaurora.org>
 <1614208985-20851-4-git-send-email-bbhatt@codeaurora.org>
 <899da888-321a-c228-8537-b72821700dc7@quicinc.com>
Message-ID: <62c4f4130f74e3731cd3886049684d23@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2021-08-23 11:43 AM, Jeffrey Hugo wrote:
> On 2/24/2021 4:23 PM, Bhaumik Bhatt wrote:
>> In current design, whenever the BHI interrupt is fired, the
>> execution environment is updated. This can cause race conditions
>> and impede ongoing power up/down processing. For example, if a
>> power down is in progress, MHI host updates to a local "disabled"
>> execution environment. If a BHI interrupt fires later, that value
>> gets replaced with one from the BHI EE register. This impacts the
>> controller as it does not expect multiple RDDM execution
>> environment change status callbacks as an example. Another issue
>> would be that the device can enter mission mode and the execution
>> environment is updated, while device creation for SBL channels is
>> still going on due to slower PM state worker thread run, leading
>> to multiple attempts at opening the same channel.
>> 
>> Ensure that EE changes are handled only from appropriate places
>> and occur one after another and handle only PBL modes or RDDM EE
>> changes as critical events directly from the interrupt handler.
>> Simplify handling by waiting for SYS ERROR before handling RDDM.
>> This also makes sure that we use the correct execution environment
>> to notify the controller driver when the device resets to one of
>> the PBL execution environments.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> 
> <snip>
> 
>> @@ -452,27 +451,30 @@ irqreturn_t mhi_intvec_threaded_handler(int 
>> irq_number, void *priv)
>>   	}
>>   	write_unlock_irq(&mhi_cntrl->pm_lock);
>>   -	 /* If device supports RDDM don't bother processing SYS error */
>> -	if (mhi_cntrl->rddm_image) {
>> -		/* host may be performing a device power down already */
>> -		if (!mhi_is_active(mhi_cntrl))
>> -			goto exit_intvec;
>> +	if (pm_state != MHI_PM_SYS_ERR_DETECT || ee == mhi_cntrl->ee)
>> +		goto exit_intvec;
>>   -		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
>> +	switch (ee) {
>> +	case MHI_EE_RDDM:
>> +		/* proceed if power down is not already in progress */
>> +		if (mhi_cntrl->rddm_image && mhi_is_active(mhi_cntrl)) {
>>   			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>> +			mhi_cntrl->ee = ee;
>>   			wake_up_all(&mhi_cntrl->state_event);
>>   		}
>> -		goto exit_intvec;
>> -	}
>> -
>> -	if (pm_state == MHI_PM_SYS_ERR_DETECT) {
>> +		break;
>> +	case MHI_EE_PBL:
>> +	case MHI_EE_EDL:
>> +	case MHI_EE_PTHRU:
>> +		mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>> +		mhi_cntrl->ee = ee;
>>   		wake_up_all(&mhi_cntrl->state_event);
>> -
>> -		/* For fatal errors, we let controller decide next step */
>> -		if (MHI_IN_PBL(ee))
>> -			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_FATAL_ERROR);
>> -		else
>> -			mhi_pm_sys_err_handler(mhi_cntrl);
>> +		mhi_pm_sys_err_handler(mhi_cntrl);
>> +		break;
>> +	default:
>> +		wake_up_all(&mhi_cntrl->state_event);
>> +		mhi_pm_sys_err_handler(mhi_cntrl);
>> +		break;
>>   	}
> 
> Bhaumik, can you explain the above change?  Before this patch (which
> is now committed), if there was a fatal error, the controller was
> notified (MHI_CB_FATAL_ERROR) and it decided all action.  After this
> patch, the controller is notified, but also the core attempts to
> handle the syserr.
> 
> This is a change in behavior, and seems to make a mess of the
> controller, and possibly the core fighting each other.
> 
> Specifically, I'm rebasing the AIC100 driver onto 5.13, which has this
> change, and I'm seeing a serious regression.  I'm thinking that for
> the PBL/EDL/PTHRU case, mhi_pm_sys_err_handler() should not be called.
> 
> Thoughts?

I see. We use this heavily for entry to EDL use-cases.

We do require the mhi_pm_sys_err_handler() to be called in those cases
as any entry to PBL/EDL means there is need to clean-up MHI host and 
notify all
its clients.

We include PTHRU in here because its a SYS ERROR in PBL modes.

Premise being the controller should not be in that business of doing any 
of
the clean-up that is responsibility of the core driver. We're using this 
feature
set to ensure controller is only notified.

What does AIC100 do on fatal error that you run in to issues? I don't 
think
any of the other controllers do anything other than disabling runtime PM 
since
device is down. Maybe there's some room for improvement.

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
