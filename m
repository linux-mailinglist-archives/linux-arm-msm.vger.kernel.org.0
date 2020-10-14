Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 21CDB28D7CC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Oct 2020 03:07:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726111AbgJNBHb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 21:07:31 -0400
Received: from m42-4.mailgun.net ([69.72.42.4]:35243 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727331AbgJNBH2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 21:07:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602637647; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=SiwGv143FZ16TbMTbHfoXSQuAnKPriw9zmxHnLdbx7Q=;
 b=Wc9glBYUa078M75JikAo2nrdsiXKmBC5tHjp0fnQHxbHj/KPcvr7tV76nKvf/V2Z6EzyACC0
 UpNLcJXsCubLA6KPIaQJim6aneo58xy8EKmajePHvOpJHtFyyXMz2tPSO/NN1FDMwPABHMf2
 5N3S3RuvRcnv/BMjanGCLcVoM94=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5f864f2f52f4fccef0473284 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 14 Oct 2020 01:06:55
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B2636C433C9; Wed, 14 Oct 2020 01:06:54 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF02EC433F1;
        Wed, 14 Oct 2020 01:06:53 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 13 Oct 2020 18:06:53 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 07/10] bus: mhi: core: Move to SYS_ERROR regardless of
 RDDM capability
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20201009163231.GH4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-8-git-send-email-bbhatt@codeaurora.org>
 <20201009163231.GH4810@Mani-XPS-13-9360>
Message-ID: <018aea94e22af9c1f4124931faea15fb@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-09 09:32, Manivannan Sadhasivam wrote:
> On Fri, Sep 18, 2020 at 07:02:32PM -0700, Bhaumik Bhatt wrote:
>> In some cases, the entry of device to RDDM execution environment
>> can occur after a significant amount of time has elapsed after the
>> SYS_ERROR state change event has arrived. This can result in scenarios
>> where users of the MHI bus are unaware of the error state of the
> 
> Who are all the users of MHI bus? Client drivers?
> 
Both client and controller drivers. I will change it to that.
>> device. Hence, moving the MHI bus to a SYS_ERROR detected state will
>> prevent further client activity and wait for the RDDM entry.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/main.c | 24 ++++++++++++++++--------
>>  1 file changed, 16 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 2cff5dd..1c8e332 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -376,6 +376,7 @@ irqreturn_t mhi_intvec_threaded_handler(int 
>> irq_number, void *priv)
>>  	enum mhi_state state = MHI_STATE_MAX;
>>  	enum mhi_pm_state pm_state = 0;
>>  	enum mhi_ee_type ee = 0;
>> +	bool handle_rddm = false;
>> 
>>  	write_lock_irq(&mhi_cntrl->pm_lock);
>>  	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
>> @@ -400,6 +401,17 @@ irqreturn_t mhi_intvec_threaded_handler(int 
>> irq_number, void *priv)
>>  	 /* If device supports RDDM don't bother processing SYS error */
>>  	if (mhi_cntrl->rddm_image) {
>>  		if (mhi_cntrl->ee == MHI_EE_RDDM && mhi_cntrl->ee != ee) {
>> +			/* prevent clients from queueing any more packets */
>> +			write_lock_irq(&mhi_cntrl->pm_lock);
>> +			pm_state = mhi_tryset_pm_state(mhi_cntrl,
>> +						       MHI_PM_SYS_ERR_DETECT);
> 
> The condition above already moves MHI to MHI_PM_SYS_ERR_DETECT if the 
> state
> is MHI_STATE_SYS_ERR. Why are you doing it here again?
> 
> Thanks,
> Mani
> 
I added it there because any first move to RDDM required the MHI host to 
be
inactive or in an "error" state.
However, upon further thought, I have made changes that negate this need 
and
instead make the if (mhi_cntrl->rddm_image) check dependent on the 
pm_state being
MHI_PM_SYS_ERR_DETECT.

Reason is: a first move RDDM comes after a SYS_ERROR in MHI state, since 
PM state
will already by SYS_ERROR detect by then, no client drivers or 
controllers will be able
to use the bus.
>> +			if (pm_state == MHI_PM_SYS_ERR_DETECT)
>> +				handle_rddm = true;
>> +			write_unlock_irq(&mhi_cntrl->pm_lock);
>> +		}
>> +
>> +		if (handle_rddm) {
>> +			dev_err(dev, "RDDM event occurred!\n");
>>  			mhi_cntrl->status_cb(mhi_cntrl, MHI_CB_EE_RDDM);
>>  			wake_up_all(&mhi_cntrl->state_event);
>>  		}
>> @@ -733,19 +745,15 @@ int mhi_process_ctrl_ev_ring(struct 
>> mhi_controller *mhi_cntrl,
>>  				break;
>>  			case MHI_STATE_SYS_ERR:
>>  			{
>> -				enum mhi_pm_state new_state;
>> -
>> -				/* skip SYS_ERROR handling if RDDM supported */
>> -				if (mhi_cntrl->ee == MHI_EE_RDDM ||
>> -				    mhi_cntrl->rddm_image)
>> -					break;
>> +				enum mhi_pm_state state = MHI_PM_STATE_MAX;
>> 
>>  				dev_dbg(dev, "System error detected\n");
>>  				write_lock_irq(&mhi_cntrl->pm_lock);
>> -				new_state = mhi_tryset_pm_state(mhi_cntrl,
>> +				if (mhi_cntrl->ee != MHI_EE_RDDM)
>> +					state = mhi_tryset_pm_state(mhi_cntrl,
>>  							MHI_PM_SYS_ERR_DETECT);
>>  				write_unlock_irq(&mhi_cntrl->pm_lock);
>> -				if (new_state == MHI_PM_SYS_ERR_DETECT)
>> +				if (state == MHI_PM_SYS_ERR_DETECT)
>>  					mhi_pm_sys_err_handler(mhi_cntrl);
>>  				break;
>>  			}
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
