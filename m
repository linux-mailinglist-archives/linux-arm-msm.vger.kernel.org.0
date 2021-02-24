Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 768F5324177
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 17:06:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbhBXP4u (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 10:56:50 -0500
Received: from m42-2.mailgun.net ([69.72.42.2]:37016 "EHLO m42-2.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235135AbhBXPL2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 10:11:28 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1614179461; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=j3JKIfmz4bwLACw2GTt86q9FwYaVRosMvmk9KL5RoEA=; b=IMY43rWLk0DQvnN4I9JR5VJ4HtQ3zoYlZxTXS5sUActllEMUuaCiO2i43DTpzd2/oLSfn4vQ
 w1EBgj9Qdv3p+m9tDlpIhWhbOI5Sby1v6/RaPbLWr8UMOT0YykL4qKq5MOjFpNqYPc2qvNup
 kGrVnN5DTCZaWgoSK/Dhy6npMPA=
X-Mailgun-Sending-Ip: 69.72.42.2
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60366c502a8ee88ea58870fb (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 24 Feb 2021 15:10:08
 GMT
Sender: jhugo=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id AE488C43462; Wed, 24 Feb 2021 15:10:08 +0000 (UTC)
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3E007C433CA;
        Wed, 24 Feb 2021 15:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3E007C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v2] bus: mhi: core: Sanity check values from remote device
 before use
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1613578822-18614-1-git-send-email-jhugo@codeaurora.org>
 <20210224094749.GP27945@work>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <4745a9eb-0690-3f19-1046-5032ac9482dc@codeaurora.org>
Date:   Wed, 24 Feb 2021 08:10:06 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210224094749.GP27945@work>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 2/24/2021 2:47 AM, Manivannan Sadhasivam wrote:
> On Wed, Feb 17, 2021 at 09:20:22AM -0700, Jeffrey Hugo wrote:
>> When parsing the structures in the shared memory, there are values which
>> come from the remote device.  For example, a transfer completion event
>> will have a pointer to the tre in the relevant channel's transfer ring.
>> Such values should be considered to be untrusted, and validated before
>> use.  If we blindly use such values, we may access invalid data or crash
>> if the values are corrupted.
>>
>> If validation fails, drop the relevant event.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>
>> v2: Fix subject
>>
>>   drivers/bus/mhi/core/main.c | 81 +++++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 74 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index c043574..1eb2fd3 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -242,6 +242,11 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
>>   	smp_wmb();
>>   }
>>   
>> +static bool is_valid_ring_ptr(struct mhi_ring *ring, dma_addr_t addr)
>> +{
>> +	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len;
>> +}
>> +
>>   int mhi_destroy_device(struct device *dev, void *data)
>>   {
>>   	struct mhi_device *mhi_dev;
>> @@ -383,7 +388,16 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
>>   	struct mhi_event_ctxt *er_ctxt =
>>   		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
>>   	struct mhi_ring *ev_ring = &mhi_event->ring;
>> -	void *dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
>> +	dma_addr_t ptr = er_ctxt->rp;
>> +	void *dev_rp;
>> +
>> +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
>> +		dev_err(&mhi_cntrl->mhi_dev->dev,
>> +			"Event ring rp points outside of the event ring\n");
>> +		return IRQ_HANDLED;
>> +	}
>> +
>> +	dev_rp = mhi_to_virtual(ev_ring, ptr);
>>   
>>   	/* Only proceed if event ring has pending events */
>>   	if (ev_ring->rp == dev_rp)
>> @@ -536,6 +550,11 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>>   		struct mhi_buf_info *buf_info;
>>   		u16 xfer_len;
>>   
>> +		if (!is_valid_ring_ptr(tre_ring, ptr)) {
>> +			dev_err(&mhi_cntrl->mhi_dev->dev,
>> +				"Event element points outside of the tre ring\n");
>> +			break;
>> +		}
>>   		/* Get the TRB this event points to */
>>   		ev_tre = mhi_to_virtual(tre_ring, ptr);
>>   
>> @@ -695,6 +714,12 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
>>   	struct mhi_chan *mhi_chan;
>>   	u32 chan;
>>   
>> +	if (!is_valid_ring_ptr(mhi_ring, ptr)) {
>> +		dev_err(&mhi_cntrl->mhi_dev->dev,
>> +			"Event element points outside of the cmd ring\n");
>> +		return;
>> +	}
>> +
>>   	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
>>   
>>   	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
>> @@ -719,6 +744,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>>   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
>>   	u32 chan;
>>   	int count = 0;
>> +	dma_addr_t ptr = er_ctxt->rp;
>>   
>>   	/*
>>   	 * This is a quick check to avoid unnecessary event processing
>> @@ -728,7 +754,13 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>>   	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
>>   		return -EIO;
>>   
>> -	dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
>> +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
>> +		dev_err(&mhi_cntrl->mhi_dev->dev,
>> +			"Event ring rp points outside of the event ring\n");
>> +		return -EIO;
>> +	}
>> +
>> +	dev_rp = mhi_to_virtual(ev_ring, ptr);
>>   	local_rp = ev_ring->rp;
>>   
>>   	while (dev_rp != local_rp) {
>> @@ -834,6 +866,8 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>>   			 */
>>   			if (chan < mhi_cntrl->max_chan) {
>>   				mhi_chan = &mhi_cntrl->mhi_chan[chan];
>> +				if (!mhi_chan->configured)
>> +					break;
> 
> This change is not part of this patch I believe.

It is.  The remote device specified an event on a channel.  We already 
check to see that the specified channel value doesn't exceed the maximum 
number of channels, but we don't check to see that it is a valid channel 
within the range of channels.  If its not a valid channel (say 0-5 and 
7-10 are valid, max is 10, but the remote end specified 6), bad things 
could happen because we are implicitly trusting the value before fully 
checking its validity.

This is still a sanity check of a value from the remote end.

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
