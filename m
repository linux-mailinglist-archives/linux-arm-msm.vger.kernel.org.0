Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7185F2C877E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Nov 2020 16:15:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727605AbgK3POf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 30 Nov 2020 10:14:35 -0500
Received: from m42-4.mailgun.net ([69.72.42.4]:37421 "EHLO m42-4.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727403AbgK3POf (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 30 Nov 2020 10:14:35 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606749257; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=Body0gWjoqiio7eBdzyl2WLR+Oz9ZP9reGVUm83l5ks=; b=ojQ4LEiQQkWmWrTKTo8TnMxjcldueyKx8Q6ueI+0rxDVr/RnSBGp8cg1Dzqc/hLl6NRKjsC5
 8xH/HOb4zyFwBP/d0uxKdAhaw/UnnmnMP9GIUwBuGlC3WyhcNi+ckucIqp7chg88/ky/icdC
 2mQNFrgu2xyRDqq/woCXwDrESbI=
X-Mailgun-Sending-Ip: 69.72.42.4
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-east-1.postgun.com with SMTP id
 5fc50c15ba50d14f888d33a4 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 30 Nov 2020 15:13:24
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 23F53C43461; Mon, 30 Nov 2020 15:13:24 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 01315C43460;
        Mon, 30 Nov 2020 15:13:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 01315C43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: Ensure correct ring update ordering with
 memory barrier
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Loic Poulain <loic.poulain@linaro.org>
Cc:     hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org
References: <1606403201-5656-1-git-send-email-loic.poulain@linaro.org>
 <20201128060331.GH3077@thinkpad>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <39883c41-f525-4429-ba54-9905619889eb@codeaurora.org>
Date:   Mon, 30 Nov 2020 08:13:22 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201128060331.GH3077@thinkpad>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 11/27/2020 11:03 PM, Manivannan Sadhasivam wrote:
> On Thu, Nov 26, 2020 at 04:06:41PM +0100, Loic Poulain wrote:
>> The ring element data, though being part of coherent memory, still need
>> to be performed before updating the ring context to point to this new
>> element. That can be guaranteed with a memory barrier (dma_wmb).
>>
>> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>
>> ---
>>   v2: fix comment style
>>
>>   drivers/bus/mhi/core/main.c | 7 +++++++
>>   1 file changed, 7 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 67188ea..ea39df0 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -111,7 +111,14 @@ void mhi_ring_chan_db(struct mhi_controller *mhi_cntrl,
>>   	dma_addr_t db;
>>   
>>   	db = ring->iommu_base + (ring->wp - ring->base);
>> +
>> +	/*
>> +	 * Writes to the new ring element must be visible to the hardware
>> +	 * before letting h/w know there is new element to fetch.
>> +	 */
>> +	dma_wmb();
>>   	*ring->ctxt_wp = db;
> 
> As Jeff pointed out, the barrier should come after updating ctxt_wp.

Actually, you potentially need both.  The write to the ring element 
needs to hit the memory before the content write pointer is updated, 
since the context write pointer is making the ring element "visible" to 
the device.  Then the context write pointer needs to hit memory before 
the doorbell is updated since the doorbell makes the pointer "visible" 
to the device.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
