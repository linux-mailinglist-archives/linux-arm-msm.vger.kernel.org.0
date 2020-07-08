Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9B9C22191DF
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Jul 2020 22:54:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725915AbgGHUx7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Jul 2020 16:53:59 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:24905 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725787AbgGHUx7 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Jul 2020 16:53:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1594241637; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=JXEjENLH7MbraRA/pMvTjsju07jH8KL7dOAaR98y5WU=;
 b=Nd/XePXABCvCE8cPaOiV1raYGbKI8LqWaz1zrXDOQxevfcydbjlJS218XAKq7E4gpoKr653a
 YirOWN9ksAB1MPkENASOLQ2RZd62ctQvDyBAXt3gfIZgLPp1dxf0JaenoKa5OqE1U4GSpFMD
 RtFma+2Aq/O2vfNOzhp5kqxIYDo=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n16.prod.us-west-2.postgun.com with SMTP id
 5f06325da33b1a3dd42fe751 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 08 Jul 2020 20:53:49
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id D11E1C433CA; Wed,  8 Jul 2020 20:53:49 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1A121C433C8;
        Wed,  8 Jul 2020 20:53:49 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Wed, 08 Jul 2020 13:53:49 -0700
From:   bbhatt@codeaurora.org
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        linux-arm-msm-owner@vger.kernel.org
Subject: Re: [PATCH v4 3/9] bus: mhi: core: Use helper API to trigger a
 non-blocking host resume
In-Reply-To: <20200704144714.GC3066@Mani-XPS-13-9360>
References: <1593448782-8385-1-git-send-email-bbhatt@codeaurora.org>
 <1593448782-8385-4-git-send-email-bbhatt@codeaurora.org>
 <20200704144714.GC3066@Mani-XPS-13-9360>
Message-ID: <ed30fd4330863c9743a019b6bd89aabd@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-07-04 07:47, Manivannan Sadhasivam wrote:
> On Mon, Jun 29, 2020 at 09:39:36AM -0700, Bhaumik Bhatt wrote:
>> Autonomous low power mode support requires the MHI host to resume from
>> multiple places and post a wakeup source to exit system suspend. This
>> needs to be done in a non-blocking manner. Introduce a helper API to
>> trigger the host resume for data transfers and other non-blocking use
>> cases while supporting implementation of autonomous low power modes.
>> 
> 
> Why can't you use pm_wakeup_event() as done in __mhi_device_get_sync()?
> 
> Thanks,
> Mani
> 

I forgot to address the __mhi_device_get_sync() function. Thanks for 
pointing out.

Is it preferable to always post wakeup source with hard boolean set?
We do want to wakeup from Suspend-to-Idle if system suspend happens to 
go that route.

As of now, we just by default do regular wakeup event and not hard.
I figured at some point we might need to distinguish between hard vs 
regular, hence the option but
it can be eliminated in favor of one or another.

Thanks,
Bhaumik

>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/internal.h |  8 ++++++++
>>  drivers/bus/mhi/core/main.c     | 21 +++++++--------------
>>  drivers/bus/mhi/core/pm.c       |  6 ++----
>>  3 files changed, 17 insertions(+), 18 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/internal.h 
>> b/drivers/bus/mhi/core/internal.h
>> index bcfa7b6..cb32eaf 100644
>> --- a/drivers/bus/mhi/core/internal.h
>> +++ b/drivers/bus/mhi/core/internal.h
>> @@ -599,6 +599,14 @@ int mhi_queue_state_transition(struct 
>> mhi_controller *mhi_cntrl,
>>  int mhi_send_cmd(struct mhi_controller *mhi_cntrl, struct mhi_chan 
>> *mhi_chan,
>>  		 enum mhi_cmd_type cmd);
>> 
>> +static inline void mhi_trigger_resume(struct mhi_controller 
>> *mhi_cntrl,
>> +				      bool hard_wakeup)
>> +{
>> +	pm_wakeup_dev_event(&mhi_cntrl->mhi_dev->dev, 0, hard_wakeup);
>> +	mhi_cntrl->runtime_get(mhi_cntrl);
>> +	mhi_cntrl->runtime_put(mhi_cntrl);
>> +}
>> +
>>  /* Register access methods */
>>  void mhi_db_brstmode(struct mhi_controller *mhi_cntrl, struct db_cfg 
>> *db_cfg,
>>  		     void __iomem *db_addr, dma_addr_t db_val);
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 1f622ce..8d6ec34 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -909,8 +909,7 @@ void mhi_ctrl_ev_task(unsigned long data)
>>  		 * process it since we are probably in a suspended state,
>>  		 * so trigger a resume.
>>  		 */
>> -		mhi_cntrl->runtime_get(mhi_cntrl);
>> -		mhi_cntrl->runtime_put(mhi_cntrl);
>> +		mhi_trigger_resume(mhi_cntrl, false);
>> 
>>  		return;
>>  	}
>> @@ -971,10 +970,8 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, 
>> enum dma_data_direction dir,
>>  	}
>> 
>>  	/* we're in M3 or transitioning to M3 */
>> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
>> -		mhi_cntrl->runtime_get(mhi_cntrl);
>> -		mhi_cntrl->runtime_put(mhi_cntrl);
>> -	}
>> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> +		mhi_trigger_resume(mhi_cntrl, false);
>> 
>>  	/* Toggle wake to exit out of M2 */
>>  	mhi_cntrl->wake_toggle(mhi_cntrl);
>> @@ -1032,10 +1029,8 @@ int mhi_queue_dma(struct mhi_device *mhi_dev, 
>> enum dma_data_direction dir,
>>  	}
>> 
>>  	/* we're in M3 or transitioning to M3 */
>> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
>> -		mhi_cntrl->runtime_get(mhi_cntrl);
>> -		mhi_cntrl->runtime_put(mhi_cntrl);
>> -	}
>> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> +		mhi_trigger_resume(mhi_cntrl, false);
>> 
>>  	/* Toggle wake to exit out of M2 */
>>  	mhi_cntrl->wake_toggle(mhi_cntrl);
>> @@ -1147,10 +1142,8 @@ int mhi_queue_buf(struct mhi_device *mhi_dev, 
>> enum dma_data_direction dir,
>>  	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
>> 
>>  	/* we're in M3 or transitioning to M3 */
>> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
>> -		mhi_cntrl->runtime_get(mhi_cntrl);
>> -		mhi_cntrl->runtime_put(mhi_cntrl);
>> -	}
>> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> +		mhi_trigger_resume(mhi_cntrl, false);
>> 
>>  	/* Toggle wake to exit out of M2 */
>>  	mhi_cntrl->wake_toggle(mhi_cntrl);
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index 661d704..5e3994e 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -1139,10 +1139,8 @@ void mhi_device_put(struct mhi_device *mhi_dev)
>> 
>>  	mhi_dev->dev_wake--;
>>  	read_lock_bh(&mhi_cntrl->pm_lock);
>> -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state)) {
>> -		mhi_cntrl->runtime_get(mhi_cntrl);
>> -		mhi_cntrl->runtime_put(mhi_cntrl);
>> -	}
>> +	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
>> +		mhi_trigger_resume(mhi_cntrl, false);
>> 
>>  	mhi_cntrl->wake_put(mhi_cntrl, false);
>>  	read_unlock_bh(&mhi_cntrl->pm_lock);
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 
