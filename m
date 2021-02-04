Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F76B30FE2F
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Feb 2021 21:28:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240015AbhBDUZF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 4 Feb 2021 15:25:05 -0500
Received: from mail29.static.mailgun.info ([104.130.122.29]:36864 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240096AbhBDUY6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 4 Feb 2021 15:24:58 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1612470278; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=dkEyhqBrfEPv8uIIrUZLW7vzLutXTgK2aJSRf24Jy1Q=;
 b=UCf6ksEdc8znJHodGf0HcEutUw9Fh1m0UbxymyOyVSmabohWjpkpy4sDa+IRqVVXI/OaooAE
 yRwAdk+SLu1EVhZcrjkN/dnxCh1J6TkAWb+fwsfHKHBMkYZyqXrdewOyDQ4IdtVMB4rqwfja
 bIuur3TUgQmwnwCZOF1pdNMxapg=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 601c57df5d0f38478782fa19 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 04 Feb 2021 20:23:59
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BA15BC43464; Thu,  4 Feb 2021 20:23:58 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DF1EEC43462;
        Thu,  4 Feb 2021 20:23:57 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Thu, 04 Feb 2021 12:23:57 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org,
        loic.poulain@linaro.org
Subject: Re: [PATCH v5 6/9] bus: mhi: core: Check channel execution
 environment before issuing reset
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20210121151226.GD5473@work>
References: <1610139297-36435-1-git-send-email-bbhatt@codeaurora.org>
 <1610139297-36435-7-git-send-email-bbhatt@codeaurora.org>
 <20210121151226.GD5473@work>
Message-ID: <44821b345e5c46c1532511c1d1a66fe4@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 2021-01-21 07:12 AM, Manivannan Sadhasivam wrote:
> On Fri, Jan 08, 2021 at 12:54:54PM -0800, Bhaumik Bhatt wrote:
>> A client can attempt to unprepare certain channels for transfer even
>> after the execution environment they are supposed to run in has 
>> changed.
> 
> Just out of curiosity, under what circumstances it can happen? We don't
> have any in kernel user for the mhi_unprepare_from_transfer() API :/
> 
We do and it's the qrtr-mhi driver where we can potentially see this 
happen.
Mainly, since they want to undo whatever they have done in probe(), this 
can
come from the remove() after MHI power down is initiated.

I have updated this patch in upcoming v6 series with a debug message as 
we only
want to proceed with clean-up directly.

>> In the event that happens, the device need not be notified of the 
>> reset
>> and the host can proceed with clean up for the channel context and
>> memory allocated for it on the host as the device will no longer be 
>> able
>> to respond to such a request.
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> Reviewed-by: Hemant Kumar <hemantk@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/main.c | 13 +++++++++++++
>>  1 file changed, 13 insertions(+)
>> 
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index a84e6aa..ec720fe 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -1351,11 +1351,24 @@ static void __mhi_unprepare_channel(struct 
>> mhi_controller *mhi_cntrl,
>>  	/* no more processing events for this channel */
>>  	mutex_lock(&mhi_chan->mutex);
>> 
>> +	if (!(BIT(mhi_cntrl->ee) & mhi_chan->ee_mask)) {
>> +		dev_err(dev,
>> +			"Current EE: %s Required EE Mask: 0x%x for chan: %s\n",
>> +			TO_MHI_EXEC_STR(mhi_cntrl->ee), mhi_chan->ee_mask,
>> +			mhi_chan->name);
> 
> Again, use channel's struct dev here.
> 
Done.
> Thanks,
> Mani

Thanks,
Bhaumik
---
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
