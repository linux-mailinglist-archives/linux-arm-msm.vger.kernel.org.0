Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62CED1CB61A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 19:34:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726797AbgEHRef (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 13:34:35 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:13401 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726767AbgEHRee (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 13:34:34 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1588959273; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=YRdx5B97TVorxMXPiXfW7wmYxuXC8t3jsBBMWPO3mPk=; b=CRoqS+JwBHCCr27+c8+5otJBABQBwpqlNC0lRcaQJMdHu3zDfXGzNz4yBbuUG8MxwUIyxEjV
 nDFq4xnKQ2HDIgJcjBJYT+Vlxpz0fuy6M12G2w7EOFqp4LT2tV6j8aCjpbWjySh4B43igv33
 b4V+A4h6yA71P2CZDuzEJyHC9xE=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5eb59817.7fc768bbdfb8-smtp-out-n03;
 Fri, 08 May 2020 17:34:15 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 259E7C433BA; Fri,  8 May 2020 17:34:15 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 64005C433F2;
        Fri,  8 May 2020 17:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 64005C433F2
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v6 3/8] bus: mhi: core: Add range check for channel id
 received in event ring
To:     Manivannan Sadhasivam <mani@kernel.org>,
        Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
 <1588718832-4891-4-git-send-email-bbhatt@codeaurora.org>
 <20200508054518.GA2696@Mani-XPS-13-9360>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <82e131f8-8c67-23c3-3ac2-a05eb04d50ba@codeaurora.org>
Date:   Fri, 8 May 2020 10:34:13 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20200508054518.GA2696@Mani-XPS-13-9360>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 5/7/20 10:45 PM, Manivannan Sadhasivam wrote:
> On Tue, May 05, 2020 at 03:47:07PM -0700, Bhaumik Bhatt wrote:
>> From: Hemant Kumar <hemantk@codeaurora.org>
>>
>> MHI data completion handler function reads channel id from event
>> ring element. Value is under the control of MHI devices and can be
>> any value between 0 and 255. In order to prevent out of bound access
>> add a bound check against the max channel supported by controller
>> and skip processing of that event ring element.
>>
>> Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/main.c | 8 ++++++++
>>   1 file changed, 8 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 605640c..e60ab21 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -776,6 +776,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>>   		case MHI_PKT_TYPE_TX_EVENT:
>>   			chan = MHI_TRE_GET_EV_CHID(local_rp);
>>   			mhi_chan = &mhi_cntrl->mhi_chan[chan];
> 
> Check should be done before this statement, isn't it?
my bad. thanks for pointing that out.
> 
>> +			if (WARN_ON(chan >= mhi_cntrl->max_chan))
>> +				goto next_event;
>> +
> 
> I don't prefer using gotos for non exit paths but I don't have a better solution
> here. But you can try to wrap 'WARN_ON' inside the 'MHI_TRE_GET_EV_CHID'
> definition and the just use:
Instead of moving WARN_ON to macro as it requires mhi_cntrl->max_chan to 
compare, how about just adding WARN_ON statement above if condition like 
this

		WARN_ON(chan >= mhi_cntrl->max_chan);
		/*
  		 * Only process the event ring elements whose channel
		 * ID is within the maximum supported range.
		 */
  		if (chan < mhi_cntrl->max_chan) {
                       	mhi_chan = &mhi_cntrl->mhi_chan[chan];
                        	parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
                           	event_quota--;
  		}
  		break;
> 
> 			/*
> 			 * Only process the event ring elements whose channel
> 			 * ID is within the maximum supported range.
> 			 */
> 			if (chan < mhi_cntrl->max_chan) {
>                          	mhi_chan = &mhi_cntrl->mhi_chan[chan];
>                          	parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
>                          	event_quota--;
> 			}
> 			break;
> 
> This looks more clean.

> 
>>   			parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
>>   			event_quota--;
>>   			break;
>> @@ -784,6 +787,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
>>   			break;
>>   		}
>>   
>> +next_event:
>>   		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
>>   		local_rp = ev_ring->rp;
>>   		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> 
> So you want the count to get increased for skipped element also?
yeah idea is to have total count of events processed even if channel id 
is not correct for that event. This fix is a security fix considering 
that the MHI device is considered as non-secured and MHI host is trying
to continue function normally and just reporting it as warning.

> 
> Thanks,
> Mani
> 
>> @@ -820,6 +824,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>>   		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
>>   
>>   		chan = MHI_TRE_GET_EV_CHID(local_rp);
>> +		if (WARN_ON(chan >= mhi_cntrl->max_chan))
>> +			goto next_event;
>> +
>>   		mhi_chan = &mhi_cntrl->mhi_chan[chan];
>>   
>>   		if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
>> @@ -830,6 +837,7 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
>>   			event_quota--;
>>   		}
>>   
>> +next_event:
>>   		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
>>   		local_rp = ev_ring->rp;
>>   		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
Even this function has the same goto statement. For consistency i would 
do same thing here as well. Let me know what do you think about above 
suggestion for both functions.
>> -- 
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
>> a Linux Foundation Collaborative Project
>>

-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
