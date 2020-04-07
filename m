Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B2BDA1A0FD7
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 17:03:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729175AbgDGPDv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 11:03:51 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:19844 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729183AbgDGPDv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 11:03:51 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586271830; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=noVGvGyMDAubVomZ7A9m4ZyJ5BKcZy6LZHICPrl1C/g=; b=YdhVgSe0edFso/NHyYd9sDlfIEUjgMBHolo3tw/3zM8nRWmgKtquCC+K3Du5PF+wMukhGY1m
 5KNDpOOfpZfpyTC2WfIiPgjKE4x27tMvW4DpN5X+jIAV93Fj4EGA+z45q5bAXTKQ/UQZi9r8
 7st8azSL9/QoPYiLoEBTjZVKmUQ=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c9642.7f1d3ff223b0-smtp-out-n02;
 Tue, 07 Apr 2020 15:03:30 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AED5DC433F2; Tue,  7 Apr 2020 15:03:30 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 86D1BC433D2;
        Tue,  7 Apr 2020 15:03:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 86D1BC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 3/3] bus: mhi: core: Remove link_status() callback
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1586207077-22361-1-git-send-email-jhugo@codeaurora.org>
 <1586207077-22361-4-git-send-email-jhugo@codeaurora.org>
 <20200407055809.GA2442@Mani-XPS-13-9360>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <c28124c2-4bd1-c5e1-5ecd-e8dd6042f818@codeaurora.org>
Date:   Tue, 7 Apr 2020 09:03:28 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200407055809.GA2442@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/6/2020 11:58 PM, Manivannan Sadhasivam wrote:
> Hi Jeff,
> 
> On Mon, Apr 06, 2020 at 03:04:37PM -0600, Jeffrey Hugo wrote:
>> If the MHI core detects invalid data due to a PCI read, it calls into
>> the controller via link_status() to double check that the link is infact
>> down.  All in all, this is pretty pointless, and racy.  There are no good
>> reasons for this, and only drawbacks.
>>
>> Its pointless because chances are, the controller is going to do the same
>> thing to determine if the link is down - attempt a PCI access and compare
>> the result.  This does not make the link status decision any smarter.
>>
>> Its racy because its possible that the link was down at the time of the
>> MHI core access, but then recovered before the controller access.  In this
>> case, the controller will indicate the link is not down, and the MHI core
>> will precede to use a bad value as the MHI core does not attempt to retry
>> the access.
>>
>> Retrying the access in the MHI core is a bad idea because again, it is
>> racy - what if the link is down again?  Furthermore, there may be some
>> higher level state associated with the link status, that is now invalid
>> because the link went down.
>>
>> The only reason why the MHI core could see "invalid" data when doing a PCI
>> access, that is actually valid, is if the register actually contained the
>> PCI spec defined sentinel for an invalid access.  In this case, it is
>> arguable that the MHI implementation broken, and should be fixed, not
>> worked around.
>>
>> Therefore, remove the link_status() callback before anyone attempts to
>> implement it.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> LGTM. But as per the IRC discussion I'd like the mhi_reg_read() to be
> implemented as a callback in mhi_controller struct inorder to truly make MHI
> a PCI agnostic bus.
> 
> Since we don't have any controller driver in mainline, I think it is the
> good time to do this change.

No problem.  I thought you might prefer that approach, hence the 
discussion.  :)

Do you want that included in this change, or as a follow up?

> 
> For this,
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> 
> Thanks,
> Mani
> 
>> ---
>>   drivers/bus/mhi/core/init.c | 6 ++----
>>   drivers/bus/mhi/core/main.c | 5 ++---
>>   include/linux/mhi.h         | 2 --
>>   3 files changed, 4 insertions(+), 9 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index b38359c..2af08d57 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -812,10 +812,8 @@ int mhi_register_controller(struct mhi_controller *mhi_cntrl,
>>   	if (!mhi_cntrl)
>>   		return -EINVAL;
>>   
>> -	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put)
>> -		return -EINVAL;
>> -
>> -	if (!mhi_cntrl->status_cb || !mhi_cntrl->link_status)
>> +	if (!mhi_cntrl->runtime_get || !mhi_cntrl->runtime_put ||
>> +	    !mhi_cntrl->status_cb)
>>   		return -EINVAL;
>>   
>>   	ret = parse_config(mhi_cntrl, config);
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index eb4256b..473278b8 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -20,9 +20,8 @@ int __must_check mhi_read_reg(struct mhi_controller *mhi_cntrl,
>>   {
>>   	u32 tmp = readl(base + offset);
>>   
>> -	/* If there is any unexpected value, query the link status */
>> -	if (PCI_INVALID_READ(tmp) &&
>> -	    mhi_cntrl->link_status(mhi_cntrl))
>> +	/* If the value is invalid, the link is down */
>> +	if (PCI_INVALID_READ(tmp))
>>   		return -EIO;
>>   
>>   	*out = tmp;
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index ad19960..be704a4 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -335,7 +335,6 @@ struct mhi_controller_config {
>>    * @syserr_worker: System error worker
>>    * @state_event: State change event
>>    * @status_cb: CB function to notify power states of the device (required)
>> - * @link_status: CB function to query link status of the device (required)
>>    * @wake_get: CB function to assert device wake (optional)
>>    * @wake_put: CB function to de-assert device wake (optional)
>>    * @wake_toggle: CB function to assert and de-assert device wake (optional)
>> @@ -417,7 +416,6 @@ struct mhi_controller {
>>   
>>   	void (*status_cb)(struct mhi_controller *mhi_cntrl,
>>   			  enum mhi_callback cb);
>> -	int (*link_status)(struct mhi_controller *mhi_cntrl);
>>   	void (*wake_get)(struct mhi_controller *mhi_cntrl, bool override);
>>   	void (*wake_put)(struct mhi_controller *mhi_cntrl, bool override);
>>   	void (*wake_toggle)(struct mhi_controller *mhi_cntrl);
>> -- 
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
