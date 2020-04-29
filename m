Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 29B841BE53E
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Apr 2020 19:30:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726830AbgD2Raj (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 29 Apr 2020 13:30:39 -0400
Received: from mail27.static.mailgun.info ([104.130.122.27]:37478 "EHLO
        mail27.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726580AbgD2Rai (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 29 Apr 2020 13:30:38 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588181438; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=k1LxYJkImQ30ypmeQ6MNMFerbkjFb8uValw6syMj8iM=; b=I+T1vSvopcY/kuugrPH2gPP9lX1r31whd7fFsP7p47TqFJTmI2wG00VbNcNY3LWGJAH4EnQY
 XKdO9TGhj3hN2FwzmgRoBkaaiNex6lVwnhWcVUSAaTBecCQFN0bKcFhyYT40P5kT1eXa9A5Y
 O0CxMNuhmCdAk2XRjWJZqn4/F1c=
X-Mailgun-Sending-Ip: 104.130.122.27
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5ea9b9ad.7fa23d9e4340-smtp-out-n03;
 Wed, 29 Apr 2020 17:30:21 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id B3407C433F2; Wed, 29 Apr 2020 17:30:21 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E2E9DC433CB;
        Wed, 29 Apr 2020 17:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E2E9DC433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v2 3/8] bus: mhi: core: Read transfer length from an event
 properly
To:     Jeffrey Hugo <jhugo@codeaurora.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>, mani@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1588042766-17496-1-git-send-email-bbhatt@codeaurora.org>
 <1588042766-17496-4-git-send-email-bbhatt@codeaurora.org>
 <cbd0698d-52ca-fad6-a658-e6e0009bde66@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <967ee378-bac9-32ba-0110-162dfdb71c1a@codeaurora.org>
Date:   Wed, 29 Apr 2020 10:30:19 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <cbd0698d-52ca-fad6-a658-e6e0009bde66@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Jeff

On 4/28/20 7:50 AM, Jeffrey Hugo wrote:
> On 4/27/2020 8:59 PM, Bhaumik Bhatt wrote:
>> From: Hemant Kumar <hemantk@codeaurora.org>
>>
>> When MHI Driver receives an EOT event, it reads xfer_len from the
>> event in the last TRE. The value is under control of the MHI device
>> and never validated by Host MHI driver. The value should never be
>> larger than the real size of the buffer but a malicious device can
>> set the value 0xFFFF as maximum. This causes device to memory
> 
> The device will overflow, or the driver?
Done.
> 
>> overflow (both read or write). Fix this issue by reading minimum of
>> transfer length from event and the buffer length provided.
>>
>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/main.c | 5 ++++-
>>   1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 1ccd4cc..3d468d9 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -521,7 +521,10 @@ static int parse_xfer_event(struct mhi_controller 
>> *mhi_cntrl,
>>                   mhi_cntrl->unmap_single(mhi_cntrl, buf_info);
>>               result.buf_addr = buf_info->cb_buf;
>> -            result.bytes_xferd = xfer_len;
>> +
>> +            /* truncate to buf len if xfer_len is larger */
>> +            result.bytes_xferd =
>> +                min_t(u16, xfer_len, buf_info->len);
>>               mhi_del_ring_element(mhi_cntrl, buf_ring);
>>               mhi_del_ring_element(mhi_cntrl, tre_ring);
>>               local_rp = tre_ring->rp;
>>
> 
> 

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
