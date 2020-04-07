Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B251A1A133B
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 Apr 2020 20:00:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726559AbgDGSAR (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 7 Apr 2020 14:00:17 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:58847 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726420AbgDGSAQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 7 Apr 2020 14:00:16 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1586282416; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=dk+x0rTY0DaiUKQYsPBwoDgbCv6jZ7mH7/iIl9UgojQ=; b=mpn+6KPx3kOrqFmSaTGalpbzEooCphuhvGCJlVWg9DVzrK6Noqve/YJIz4BPorfPYJ7+JCp+
 rKXlqC6b9cwk0B9Vbda7F93QNLB4OEdXdd1AKGLyInb8Hc6D4sUJhLkrKy4xIoUKeG0rws0q
 /bva+LkE8dFrwnLq71jbocQ+oF4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e8cbfa2.7f5469d50960-smtp-out-n05;
 Tue, 07 Apr 2020 18:00:02 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5F011C44788; Tue,  7 Apr 2020 18:00:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [192.168.1.10] (cpe-70-95-5-60.san.res.rr.com [70.95.5.60])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2D70FC433F2;
        Tue,  7 Apr 2020 18:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2D70FC433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH 2/2] remoteproc: core: Prevent sleep when rproc crashes
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     ohad@wizery.com, bjorn.andersson@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org
References: <1582164713-6413-1-git-send-email-sidgup@codeaurora.org>
 <1582164713-6413-3-git-send-email-sidgup@codeaurora.org>
 <20200224185334.GB9477@xps15>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <1a6a8661-d44f-adad-b262-ff42633c7b38@codeaurora.org>
Date:   Tue, 7 Apr 2020 11:00:00 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200224185334.GB9477@xps15>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hey Mathieu,
I will be sending a revised patchset soon. Will try to address your 
comments there.

Thanks,
Siddharth

On 2/24/2020 10:53 AM, Mathieu Poirier wrote:
> On Wed, Feb 19, 2020 at 06:11:53PM -0800, Siddharth Gupta wrote:
>> Remoteproc recovery should be fast and any delay will have an impact on the
>> user-experience. Use power management APIs (pm_stay_awake and pm_relax) to
>> ensure that the system does not go to sleep.
> When you say "ensure the system does not go to sleep", you're referring to the
> system going idle from the CPUidle subsystem?
>
>> Signed-off-by: Siddharth Gupta <sidgup@codeaurora.org>
>> ---
>>   drivers/remoteproc/remoteproc_core.c | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/drivers/remoteproc/remoteproc_core.c b/drivers/remoteproc/remoteproc_core.c
>> index 5ab65a4..52e318c 100644
>> --- a/drivers/remoteproc/remoteproc_core.c
>> +++ b/drivers/remoteproc/remoteproc_core.c
>> @@ -1712,6 +1712,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
>>   
>>   	if (!rproc->recovery_disabled)
>>   		rproc_trigger_recovery(rproc);
>> +
>> +	pm_relax(&rproc->dev);
>>   }
>>   
>>   /**
>> @@ -2242,6 +2244,8 @@ void rproc_report_crash(struct rproc *rproc, enum rproc_crash_type type)
>>   		return;
>>   	}
>>   
>> +	pm_stay_awake(&rproc->dev);
>> +
> I fail to understand how this can be useful since there is no HW associted to
> rproc->dev...  Is it possible for you to elaborate more on the problem you're
> trying to fix?
>
> Thanks,
> Mathieu
>
>>   	dev_err(&rproc->dev, "crash detected in %s: type %s\n",
>>   		rproc->name, rproc_crash_to_string(type));
>>   
>> -- 
>> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
