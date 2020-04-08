Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E84161A2705
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 Apr 2020 18:19:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728200AbgDHQTU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 8 Apr 2020 12:19:20 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:12187 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728294AbgDHQTR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 8 Apr 2020 12:19:17 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586362756; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=9qm8hDJTcDfjcVlKai6quTHvfy91QJtAPqo8V+4TU8w=; b=tzaaxZmQvEVuOq8OETHSWP9OeP2jAYzrAgyVAd+MIx0yaskocC59fWr+6A3T1ClJUeTjkGZe
 g5Zk8zhyTMevpBOJKKMwx/TT+leDMxHJDS+TzuqRe1lycLw9GWKl1WIYpfsf++CVXx04Yjsu
 yi3GvWTi/sRZte2MjeOGGRDw0Qw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8df97f.7fd356b94458-smtp-out-n02;
 Wed, 08 Apr 2020 16:19:11 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 65F9DC433BA; Wed,  8 Apr 2020 16:19:11 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 9358AC433D2;
        Wed,  8 Apr 2020 16:19:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 9358AC433D2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2 2/5] bus: mhi: core: Make sure to powerdown if
 mhi_sync_power_up fails
To:     hemantk@codeaurora.org
Cc:     manivannan.sadhasivam@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm-owner@vger.kernel.org
References: <1586278230-29565-1-git-send-email-jhugo@codeaurora.org>
 <1586278230-29565-3-git-send-email-jhugo@codeaurora.org>
 <7249d9608f41e4528c87c2b1c464d615@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <88f9b443-4a1f-918b-297c-203909d8e219@codeaurora.org>
Date:   Wed, 8 Apr 2020 10:19:09 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <7249d9608f41e4528c87c2b1c464d615@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 4/7/2020 7:34 PM, hemantk@codeaurora.org wrote:
> On 2020-04-07 09:50, Jeffrey Hugo wrote:
>> Powerdown is necessary if mhi_sync_power_up fails due to a timeout, to
>> clean up the resources.  Otherwise a BUG could be triggered when
>> attempting to clean up MSIs because the IRQ is still active from a
>> request_irq().
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/pm.c | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/core/pm.c b/drivers/bus/mhi/core/pm.c
>> index 3285c9e..fbffc6b 100644
>> --- a/drivers/bus/mhi/core/pm.c
>> +++ b/drivers/bus/mhi/core/pm.c
>> @@ -922,7 +922,11 @@ int mhi_sync_power_up(struct mhi_controller 
>> *mhi_cntrl)
>>                 MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state),
>>                 msecs_to_jiffies(mhi_cntrl->timeout_ms));
>>
>> -    return (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -EIO;
>> +    ret = (MHI_IN_MISSION_MODE(mhi_cntrl->ee)) ? 0 : -EIO;
> 
> Does it make sense to return -ETIMEDOUT instead of -EIO if device fails 
> to move to mission mode?
> Controller can use this info as mhi_async_power_up() would not return 
> -ETIMEDOUT.

It seems sensible to change this to ETIMEDOUT.  I'll queue that up for V3.

> 
>> +    if (ret)
>> +        mhi_power_down(mhi_cntrl, false);
>> +
>> +    return ret;
>>  }
>>  EXPORT_SYMBOL(mhi_sync_power_up);


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
