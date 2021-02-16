Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 124F431D1C6
	for <lists+linux-arm-msm@lfdr.de>; Tue, 16 Feb 2021 21:55:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229734AbhBPUyf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Feb 2021 15:54:35 -0500
Received: from z11.mailgun.us ([104.130.96.11]:50916 "EHLO z11.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229577AbhBPUy1 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Feb 2021 15:54:27 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1613508849; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=vMW15tcB/VDtgwUABqW7aniqJwPV/31hchhXCEizb9w=; b=iSFBwicr9WTgcWaFj969SQMwGCZ/M+S9d/dMNrQGy+vHlzPJ07nd93nwSOHUQaIJK5lzNxQJ
 I4q9guTk3r5mQGvlxeUFyDb/9w9eeG/5CglUgpEnmz3AikctitrZ2QBMI+p7Gqfdr1+Jz0A5
 DsKbZPoX8yEUwZ8U6o/oAE9T3zM=
X-Mailgun-Sending-Ip: 104.130.96.11
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-east-1.postgun.com with SMTP id
 602c30d3790422e0fe4fbff3 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 16 Feb 2021 20:53:39
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 3E141C433CA; Tue, 16 Feb 2021 20:53:39 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.226.59.216] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 2FA32C433C6;
        Tue, 16 Feb 2021 20:53:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 2FA32C433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH] mhi_bus: core: Return EBUSY if MHI ring is full
To:     bbhatt@codeaurora.org
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Fan Wu <wufan@codeaurora.org>,
        jhugo=codeaurora.org@codeaurora.org
References: <1613501314-2392-1-git-send-email-jhugo@codeaurora.org>
 <e3b0dd23ea461ac76a61266b4c657d83@codeaurora.org>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <5a6a77d2-fc67-753f-7b9f-4a60c808ac92@codeaurora.org>
Date:   Tue, 16 Feb 2021 13:53:37 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <e3b0dd23ea461ac76a61266b4c657d83@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/16/2021 1:22 PM, Bhaumik Bhatt wrote:
> On 2021-02-16 10:48 AM, Jeffrey Hugo wrote:
>> From: Fan Wu <wufan@codeaurora.org>
>>
>> Currently ENOMEM is returned when MHI ring is full. This error code is
>> very misleading. Change to EBUSY instead.
>>
>> Signed-off-by: Fan Wu <wufan@codeaurora.org>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/main.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index f182736..21eb5fc 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -996,7 +996,7 @@ static int mhi_queue(struct mhi_device *mhi_dev,
>> struct mhi_buf_info *buf_info,
>>
>>      ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
>>      if (unlikely(ret)) {
>> -        ret = -ENOMEM;
>> +        ret = -EBUSY;
>>          goto exit_unlock;
>>      }
> 
> ENOMEM is descriptive of the state of the ring since you basically 
> cannot queue any
> more packets as no memory is currently available.
> 
> But I agree, it can be misleading for this API. How about EAGAIN in 
> place of EBUSY,
> which tells the user to try the queue attempt again implying memory 
> should become
> available as more elements are consumed by the device/client?

Fan and I think EAGAIN is fine.  Will send a v2.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
