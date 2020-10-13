Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 94E5C28D3C2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Oct 2020 20:40:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388188AbgJMSkW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Oct 2020 14:40:22 -0400
Received: from z5.mailgun.us ([104.130.96.5]:62185 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388132AbgJMSkW (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Oct 2020 14:40:22 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1602614420; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=xeKvoKJav1RdumqBJg8HzynQcOdE4LvpfpeXKfaS0WA=;
 b=Ik10TIa0sa5gVcGDwR8XZGx3TyNReuAVp0cxmgpgWH81FVkX0ntP71K8T6EHLOLmVf8LTfYO
 /sVhiEcwCZsjKP/BlcQ+vAEwayhllI3y4AxEsHAlF8O2HxFwkGWtLlotsA9URErmzPbwnGCV
 wnRh3xDP3BGVX2yPk9aVA3/kOeY=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f85f48c3711fec7b1bfb92d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Oct 2020 18:40:12
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 86FB5C433FE; Tue, 13 Oct 2020 18:40:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id F22CBC433CB;
        Tue, 13 Oct 2020 18:40:10 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 13 Oct 2020 11:40:10 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        mgautam@codeaurora.org
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 06/10] bus: mhi: core: Improve shutdown handling after
 link down detection
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20201009161950.GG4810@Mani-XPS-13-9360>
References: <1600480955-16827-1-git-send-email-bbhatt@codeaurora.org>
 <1600480955-16827-7-git-send-email-bbhatt@codeaurora.org>
 <20201009161950.GG4810@Mani-XPS-13-9360>
Message-ID: <3793225dd0932d0b2a9bb5b3df293fce@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2020-10-09 09:19, Manivannan Sadhasivam wrote:
> On Fri, Sep 18, 2020 at 07:02:31PM -0700, Bhaumik Bhatt wrote:
>> If MHI were to attempt a device shutdown following an assumption
> 
> MHI host? And is this really an assumption or it is definite that the
> link is inaccessible. Please clarify!
> 
Will update it to MHI host.

I say assumption because we act based on the "graceful" flag passed by
the MHI controller driver. Link may be accessible but the controller has
instructed MHI not to do any further accesses. They may decide to set 
the
flag as "false" if they see any read/access issues, an actual link down
interrupt from the bus driver or a sideband GPIO signal declaring that a
software assert occurred on the device.

MHI host sees that power down attempt as ungraceful and assumes that the
controller has decided that it's either a link down or a fatal error.

Once an "ungraceful" power down attempt is made, MHI host moves to the
LD_ERR_FATAL_DETECT pm_state and without this patch, it moved from an
LD_ERR_FATAL_DETECT to SHUTDOWN_PROCESS state, where SHUTDOWN_PROCESS
is defined as a register accessible state by the MHI_REG_ACCESS_VALID()
macro.

If someone were to do a call that needed a register access from their
.remove() callback, for example, we could see a bus error.

Moves from MHI_PM_M3 to SHUTDOWN_PROCESS and LD_ERR_FATAL_DETECT to
SHUTDOWN_PROCESS are not allowed by use of this patch.

I'll add better wording and explanation.

>> that the device is inaccessible, the host currently moves to a state
>> where device register accesses are allowed when they should not be.
>> This would end up allowing accesses to the device register space when
>> the link is inaccessible and can result in bus errors observed on the
>> host. Improve shutdown handling to prevent these outcomes and do not
>> move the MHI PM state to a register accessible state after device is
>> assumed to be inaccessible.
>> 
> 
> Apparently you are introducing a new device transition state but your
> commit description doesn't state that :/
> 
> Thanks,
> Mani
> 
Sure. I will add that.

>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/init.c     |  1 +
>>  drivers/bus/mhi/core/internal.h |  1 +
>>  drivers/bus/mhi/core/pm.c       | 18 +++++++++++++-----
>>  3 files changed, 15 insertions(+), 5 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 9ae4c19..fa33dde 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -37,6 +37,7 @@ const char * const 
>> dev_state_tran_str[DEV_ST_TRANSITION_MAX] = {
>>  	[DEV_ST_TRANSITION_MISSION_MODE] = "MISSION_MODE",
>>  	[DEV_ST_TRANSITION_SYS_ERR] = "SYS_ERR",
>>  	[DEV_ST_TRANSITION_DISABLE] = "DISABLE",
>> +	[DEV_ST_TRANSITION_FATAL] = "FATAL SHUTDOWN",
>>  };
>> 
>>  const char * const mhi_state_str[MHI_STATE_MAX] = {
>> diff --git a/drivers/bus/mhi/core/internal.h 
>> b/drivers/bus/mhi/core/internal.h
>> index 7989269..f3b9e5a 100644
>> --- a/drivers/bus/mhi/core/internal.h
>> +++ b/drivers/bus/mhi/core/internal.h
>> @@ -388,6 +388,7 @@ enum dev_st_transition {
>>  	DEV_ST_TRANSITION_MISSION_MODE,
>>  	DEV_ST_TRANSITION_SYS_ERR,
>>  	DEV_ST_TRANSITION_DISABLE,
>> +	DEV_ST_TRANSITION_FATAL,
>>  	DEV_ST_TRANSITION_MAX,
>>  };
>> 
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index 3462d82..bce1f62 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -37,9 +37,10 @@
>>   *     M0 -> FW_DL_ERR
>>   *     M0 -> M3_ENTER -> M3 -> M3_EXIT --> M0
>>   * L1: SYS_ERR_DETECT -> SYS_ERR_PROCESS --> POR
>> - * L2: SHUTDOWN_PROCESS -> DISABLE
>> + * L2: SHUTDOWN_PROCESS -> LD_ERR_FATAL_DETECT
>> + *     SHUTDOWN_PROCESS -> DISABLE
>>   * L3: LD_ERR_FATAL_DETECT <--> LD_ERR_FATAL_DETECT
>> - *     LD_ERR_FATAL_DETECT -> SHUTDOWN_PROCESS
>> + *     LD_ERR_FATAL_DETECT -> DISABLE
>>   */
>>  static struct mhi_pm_transitions const dev_state_transitions[] = {
>>  	/* L0 States */
>> @@ -72,7 +73,7 @@ static struct mhi_pm_transitions const 
>> dev_state_transitions[] = {
>>  	{
>>  		MHI_PM_M3,
>>  		MHI_PM_M3_EXIT | MHI_PM_SYS_ERR_DETECT |
>> -		MHI_PM_SHUTDOWN_PROCESS | MHI_PM_LD_ERR_FATAL_DETECT
>> +		MHI_PM_LD_ERR_FATAL_DETECT
>>  	},
>>  	{
>>  		MHI_PM_M3_EXIT,
>> @@ -103,7 +104,7 @@ static struct mhi_pm_transitions const 
>> dev_state_transitions[] = {
>>  	/* L3 States */
>>  	{
>>  		MHI_PM_LD_ERR_FATAL_DETECT,
>> -		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_SHUTDOWN_PROCESS
>> +		MHI_PM_LD_ERR_FATAL_DETECT | MHI_PM_DISABLE
>>  	},
>>  };
>> 
>> @@ -670,6 +671,10 @@ void mhi_pm_st_worker(struct work_struct *work)
>>  			mhi_pm_disable_transition
>>  				(mhi_cntrl, MHI_PM_SHUTDOWN_PROCESS);
>>  			break;
>> +		case DEV_ST_TRANSITION_FATAL:
>> +			mhi_pm_disable_transition
>> +				(mhi_cntrl, MHI_PM_LD_ERR_FATAL_DETECT);
>> +			break;
>>  		default:
>>  			break;
>>  		}
>> @@ -1039,6 +1044,7 @@ EXPORT_SYMBOL_GPL(mhi_async_power_up);
>>  void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>>  {
>>  	enum mhi_pm_state cur_state;
>> +	enum dev_st_transition next_state = DEV_ST_TRANSITION_DISABLE;
>>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>> 
>>  	/* If it's not a graceful shutdown, force MHI to linkdown state */
>> @@ -1053,9 +1059,11 @@ void mhi_power_down(struct mhi_controller 
>> *mhi_cntrl, bool graceful)
>>  			dev_dbg(dev, "Failed to move to state: %s from: %s\n",
>>  				to_mhi_pm_state_str(MHI_PM_LD_ERR_FATAL_DETECT),
>>  				to_mhi_pm_state_str(mhi_cntrl->pm_state));
>> +		else
>> +			next_state = DEV_ST_TRANSITION_FATAL;
>>  	}
>> 
>> -	mhi_queue_state_transition(mhi_cntrl, DEV_ST_TRANSITION_DISABLE);
>> +	mhi_queue_state_transition(mhi_cntrl, next_state);
>> 
>>  	/* Wait for shutdown to complete */
>>  	flush_work(&mhi_cntrl->st_worker);
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
