Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2A9301A0FD8
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 17:04:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729280AbgDGPEU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 11:04:20 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:21247 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729183AbgDGPEU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 11:04:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586271860; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=cPqqM4WiYnKa1v/ODX9moiHz3GFe4yiq98IQIIpjCVY=; b=Ka8JLMvad9itjgLaH3HiM3+L56GhU7TDNU/h2O9CqnUUsOYjOlJUMLssxegf/At3hyMVM9hr
 nHPpCxJI8DwQeyTD3IJnMJ0G/ux8D3ZeTVZ34MY4B40wP+KQ17hGLs4TN94YFtQ4HBUahYo2
 Kbv28/ZIVOGUGDEWr5ahtMp3rRg=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8c9673.7fa09574c810-smtp-out-n04;
 Tue, 07 Apr 2020 15:04:19 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 7E785C433D2; Tue,  7 Apr 2020 15:04:18 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3CDAC433F2;
        Tue,  7 Apr 2020 15:04:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3CDAC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH 2/3] bus: mhi: core: Make sure to powerdown if
 mhi_sync_power_up fails
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <1586207077-22361-1-git-send-email-jhugo@codeaurora.org>
 <1586207077-22361-3-git-send-email-jhugo@codeaurora.org>
 <20200407061455.GB2442@Mani-XPS-13-9360>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <18dbd05b-63cf-0494-b20c-90a96626ceeb@codeaurora.org>
Date:   Tue, 7 Apr 2020 09:04:15 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <20200407061455.GB2442@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/7/2020 12:14 AM, Manivannan Sadhasivam wrote:
> On Mon, Apr 06, 2020 at 03:04:36PM -0600, Jeffrey Hugo wrote:
>> Powerdown is necessary if mhi_sync_power_up fails due to a timeout, to
>> clean up the resources.  Otherwise a BUG could be triggered when
>> attempting to clean up MSIs because the IRQ is still active from a
>> request_irq().
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/pm.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index cd6ba23..1bfa334 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -922,7 +922,11 @@ int mhi_sync_power_up(struct mhi_controller *mhi_cntrl)
>>   			   MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>>   			   msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>   
>> -	return (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -EIO;
>> +	ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -EIO;
>> +
>> +	if (ret)
>> +		mhi_power_down(mhi_cntrl, false);
>> +	return ret;
> 
> I'd prefer the style of,
> 
> ```
> statement
> if (cond)
> 	statement
> 
> return
> ```
> 
> Please stick to this. The change itself looks good.
> 

Sure, will do.


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
