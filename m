Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B74B2A0EA9
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Oct 2020 20:30:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727416AbgJ3TaJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Oct 2020 15:30:09 -0400
Received: from z5.mailgun.us ([104.130.96.5]:61969 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727318AbgJ3TaJ (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Oct 2020 15:30:09 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604086207; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=aMVth6hwZwOVSjCuTwSCJ1aUcxckVR0dkeIqsdhpRpE=;
 b=V3oSCwKHK2dTV5/lCIpiLvrimpodO+OsKcEUCU4/7R54lt7pEj//Y8y5I2Sf0Va5VIIZsvy3
 r36PB3+XpaLeJfQwAll+GdIqtLysjYrh0ytVBN0Lijez/kQNk3O30eA+YPY3ZwoCgqaMj4Qz
 zJMsP5Y0VoD16tk3LHJjzlsSgbE=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5f9c69b85a52eef4951931a6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 30 Oct 2020 19:30:00
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id EA302C433FE; Fri, 30 Oct 2020 19:29:59 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 84C64C433F0;
        Fri, 30 Oct 2020 19:29:59 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 30 Oct 2020 12:29:59 -0700
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/12] bus: mhi: core: Move to SYS_ERROR regardless of
 RDDM capability
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20201030135218.GG3818@Mani-XPS-13-9360>
References: <1604031057-32820-1-git-send-email-bbhatt@codeaurora.org>
 <1604031057-32820-5-git-send-email-bbhatt@codeaurora.org>
 <20201030135218.GG3818@Mani-XPS-13-9360>
Message-ID: <59d5abb24e06920311719862f6e749a1@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 2020-10-30 06:52, Manivannan Sadhasivam wrote:
> On Thu, Oct 29, 2020 at 09:10:49PM -0700, Bhaumik Bhatt wrote:
>> In some cases, the entry of device to RDDM execution environment
>> can occur after a significant amount of time has elapsed and a
>> SYS_ERROR state change event has already arrived.
> 
> I don't quite understand this statement. Can you elaborate? This 
> doesn't
> relate to what the patch is doing.
> 
So the mhi_intvec_threaded_handler() (BHI) MSI that fires to switch the 
EE
to RDDM may come much later than the SYS_ERROR state change event from 
the
control event ring. We currently, do not move to MHI_PM_SYS_ERR_DETECT
state if RDDM is supported i.e. mhi_cntrl->rddm_image is set. However, 
it
means that we will remain in an "active" MHI PM state for the duration 
of
time until RDDM EE (BHI) MSI comes in. We have seen it take 5 seconds in
some bad cases.
>> This can result
>> in scenarios where MHI controller and client drivers are unaware
>> of the error state of the device. Remove the check for rddm_image
>> when processing the SYS_ERROR state change as it is present in
>> mhi_pm_sys_err_handler() already and prevent further activity
>> until the expected RDDM execution environment change occurs or
>> the controller driver decides further action.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/main.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>> 
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 2cff5dd..1f32d67 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -733,19 +733,15 @@ int mhi_process_ctrl_ev_ring(struct 
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
> 
> But you are still checking for RDDM EE?
> 
> Please explain why you want to skip RDDM check.
> 
> Thanks,
> Mani
> 
Yes, the point is to only remove the mhi_cntrl->rddm_image check but 
still
retain the "has EE moved to become RDDM" check. This allows us to avoid 
any
extra processing of moving states to MHI_PM_SYS_ERR_DETECT state if it 
may
be unnecessary (EE already changed to RDDM). The mhi_cntrl->rddm_image 
is
also present in mhi_pm_sys_err_handler(mhi_cntrl) function so it is not
needed here.
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

This is why I mention the word RDDM "capability". If controller supports 
RDDM
is not enough to skip the move to MHI_PM_SYS_ERR_DETECT state as it is 
safer
to move and stop client drivers from pushing data.

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
