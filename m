Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A73F71D039B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 13 May 2020 02:28:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729215AbgEMA2u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 12 May 2020 20:28:50 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:46292 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729942AbgEMA2t (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 12 May 2020 20:28:49 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1589329728; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Z3nO1YYjG4OzAJinMUwKPc2jdr9tytUGBG603ShGi4Y=; b=BhdnlchPMvYlIf2PZVgo7S85XQmbzKJJ7rexajXXmovqLGQPbo6gjVj6oZ6l5KJ/TFoLGMeU
 kX1y2vyDQYAkIbfHGIk//jzZ1CMFhBcUZ3px5x1JVBdMpz+K+0tPfqCBThA0AIvCPUQfeW6g
 gx4tN1wmnXO+BVRM1LeaXU/ewiQ=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ebb3f3e.7f2dc4442c70-smtp-out-n03;
 Wed, 13 May 2020 00:28:46 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5079AC433BA; Wed, 13 May 2020 00:28:46 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id A89D4C433CB;
        Wed, 13 May 2020 00:28:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org A89D4C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v1 3/5] bus: mhi: core: Skip handling BHI irq if MHI reg
 access is not allowed
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org, bbhatt@codeaurora.org
References: <1589248989-23824-1-git-send-email-hemantk@codeaurora.org>
 <1589248989-23824-4-git-send-email-hemantk@codeaurora.org>
 <20200512065349.GE4928@Mani-XPS-13-9360>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <5e9a15ed-4bad-744a-af07-b28c3bcc47c4@codeaurora.org>
Date:   Tue, 12 May 2020 17:28:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200512065349.GE4928@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 5/11/20 11:53 PM, Manivannan Sadhasivam wrote:
> On Mon, May 11, 2020 at 07:03:07PM -0700, Hemant Kumar wrote:
>> Driver continues handling of BHI interrupt even if MHI register access
>> is not allowed. By doing so it calls the status call back and performs
>> early notification for the MHI client. This is not needed when MHI
>> register access is not allowed. Hence skip the handling in this case and
>> return. Also add debug log to print device state, local EE and device EE
>> when reg access is valid.
>>
>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/main.c | 21 ++++++++++++++-------
>>   1 file changed, 14 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 9ec9b36..467c0ba 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -369,22 +369,29 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>>   	return IRQ_HANDLED;
>>   }
>>   
>> -irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *dev)
>> +irqreturn_t mhi_intvec_threaded_handler(int irq_number, void *priv)
>>   {
>> -	struct mhi_controller *mhi_cntrl = dev;
>> +	struct mhi_controller *mhi_cntrl = priv;
>> +	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>   	enum mhi_state state = MHI_STATE_MAX;
>>   	enum mhi_pm_state pm_state = 0;
>>   	enum mhi_ee_type ee = 0;
>>   
>>   	write_lock_irq(&mhi_cntrl->pm_lock);
>> -	if (MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
>> -		state = mhi_get_mhi_state(mhi_cntrl);
>> -		ee = mhi_cntrl->ee;
>> -		mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
>> +	if (!MHI_REG_ACCESS_VALID(mhi_cntrl->pm_state)) {
>> +		write_unlock_irq(&mhi_cntrl->pm_lock);
> 
> write_lock is only used for protecting 'mhi_cntrl->ee' but here we are not
> updating it if reg access is not valid. So there is no reason to hold this lock.
Original code is using write_lock to protect pm_state as well as 
mhi_cntrl->ee. This patch is keeping the lock same as original code. 
Just if condition logic is negated here due to that write_unlock_irq is 
added under if condition.
> 
>> +		goto exit_intvec;
>>   	}
>>   
>> +	state = mhi_get_mhi_state(mhi_cntrl);
>> +	ee = mhi_cntrl->ee;
>> +	mhi_cntrl->ee = mhi_get_exec_env(mhi_cntrl);
> 
> But it is needed here.
> 
> Thanks,
> Mani
> 
>> +	dev_dbg(dev, "local ee:%s device ee:%s dev_state:%s\n",
>> +		TO_MHI_EXEC_STR(mhi_cntrl->ee), TO_MHI_EXEC_STR(ee),
>> +		TO_MHI_STATE_STR(state));
>> +
>>   	if (state == MHI_STATE_SYS_ERR) {
>> -		dev_dbg(&mhi_cntrl->mhi_dev->dev, "System error detected\n");
>> +		dev_dbg(dev, "System error detected\n");
>>   		pm_state = mhi_tryset_pm_state(mhi_cntrl,
>>   					       MHI_PM_SYS_ERR_DETECT);
>>   	}
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
