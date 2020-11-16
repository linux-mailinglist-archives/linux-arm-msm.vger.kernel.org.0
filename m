Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5F7B2B5348
	for <lists+linux-arm-msm@lfdr.de>; Mon, 16 Nov 2020 21:56:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728742AbgKPU40 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 16 Nov 2020 15:56:26 -0500
Received: from z5.mailgun.us ([104.130.96.5]:49478 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730479AbgKPU4Z (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 16 Nov 2020 15:56:25 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1605560184; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=Xjkdxhx1322RAQKV663NGZFDklq/I5URrPDT1967820=;
 b=eKFy3LbbdCVnYXF/cSC9K/1lNAXK0RhU1gvj7U1f9sdx4C4ifZJVT3ei8YN0fFFgrK1pwnGB
 57c2YsU107TYaWd8S1xD1Nr880tRnvd7cCwISxWfKa5YogEpeedVbfcB974rogtYzGmvbnsz
 VGu9FKDeVcaXAOTeC/vXpp5z31s=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n08.prod.us-west-2.postgun.com with SMTP id
 5fb2e7718bd2e3c2225061e6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Mon, 16 Nov 2020 20:56:17
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id BF667C43460; Mon, 16 Nov 2020 20:56:17 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9438C433ED;
        Mon, 16 Nov 2020 20:56:16 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Mon, 16 Nov 2020 12:56:16 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] bus: mhi: core: Add support to stop or start
 channel data transfers
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <20201116124332.GK3926@Mani-XPS-13-9360>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-4-git-send-email-bbhatt@codeaurora.org>
 <20201116124332.GK3926@Mani-XPS-13-9360>
Message-ID: <3bf88d90e4006ba17e2e86c76a926581@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Mani,

On 2020-11-16 04:43, Manivannan Sadhasivam wrote:
> On Wed, Nov 11, 2020 at 11:21:10AM -0800, Bhaumik Bhatt wrote:
>> Some MHI client drivers may want to request a pause or halt of
>> data transfer activity on their channels. Support for this does
>> not exist and must be introduced, wherein the channel context is
>> not reset or cleared but only the STOP channel command is issued.
>> This would need to be paired with an API that allows resuming the
>> data transfer activity on channels by use of the START channel
>> command. This API assumes that the context information is already
>> setup. Enable this using two new APIs, mhi_start_transfer() and
>> mhi_stop_transfer().
>> 
>> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
>> ---
>>  drivers/bus/mhi/core/main.c | 41 
>> +++++++++++++++++++++++++++++++++++++++++
>>  include/linux/mhi.h         | 19 +++++++++++++++++++
>>  2 files changed, 60 insertions(+)
>> 
>> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
>> index 1226933..1a969f4 100644
>> --- a/drivers/bus/mhi/core/main.c
>> +++ b/drivers/bus/mhi/core/main.c
>> @@ -1560,6 +1560,47 @@ void mhi_unprepare_from_transfer(struct 
>> mhi_device *mhi_dev)
>>  }
>>  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
>> 
>> +static int mhi_update_transfer_state(struct mhi_device *mhi_dev,
>> +				     enum mhi_ch_state_type to_state)
>> +{
>> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> +	struct mhi_chan *mhi_chan;
>> +	int dir, ret;
>> +
>> +	for (dir = 0; dir < 2; dir++) {
>> +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
>> +
>> +		if (!mhi_chan)
>> +			continue;
>> +
>> +		/*
>> +		 * Bail out if one of the channels fail as client will reset
>> +		 * both upon failure
>> +		 */
>> +		mutex_lock(&mhi_chan->mutex);
> 
> Hmm. The documentation about wait_for_completion*() used in
> mhi_update_channel_state()says below,
> 
> "As all variants of wait_for_completion() can (obviously) block for a 
> long
> time depending on the nature of the activity they are waiting for, so 
> in
> most cases you probably don't want to call this with held mutexes."
> 
Yes, that is understood. The mhi_chan->mutex is only used to lock any 
channel
enable/start/stop/disable type operations, since these have to be in 
order, it
is essential that we wait for one of the operations to finish before the 
next
one.

Also we avoid a race, for example, at a time when a device crash forces 
a driver
"remove" call, while an operation to start/stop a channel is already 
going on.
>> +		ret = mhi_update_channel_state(mhi_cntrl, mhi_chan, to_state);
>> +		if (ret) {
>> +			mutex_unlock(&mhi_chan->mutex);
>> +			return ret;
>> +		}
>> +		mutex_unlock(&mhi_chan->mutex);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int mhi_stop_transfer(struct mhi_device *mhi_dev)
>> +{
>> +	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_STOP);
>> +}
>> +EXPORT_SYMBOL_GPL(mhi_stop_transfer);
>> +
>> +int mhi_start_transfer(struct mhi_device *mhi_dev)
>> +{
>> +	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_START);
>> +}
>> +EXPORT_SYMBOL_GPL(mhi_start_transfer);
>> +
>>  int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
>>  {
>>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
>> index 52b3c60..aee8494 100644
>> --- a/include/linux/mhi.h
>> +++ b/include/linux/mhi.h
>> @@ -702,6 +702,25 @@ int mhi_prepare_for_transfer(struct mhi_device 
>> *mhi_dev);
>>  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>> 
>>  /**
>> + * mhi_stop_transfer - Pauses ongoing channel activity by issuing the 
>> STOP
>> + *                     channel command to both UL and DL channels. 
>> This command
>> + *                     does not reset the channel context and the 
>> client drivers
>> + *                     can issue mhi_start_transfer to resume 
>> activity.
>> + * @mhi_dev: Device associated with the channels
>> + */
>> +int mhi_stop_transfer(struct mhi_device *mhi_dev);
>> +
>> +/**
>> + * mhi_start_transfer - Resumes channel activity by issuing the START 
>> channel
>> + *                      command to both UL and DL channels. This 
>> command assumes
>> + *                      the channel context is already setup and the 
>> client
>> + *                      drivers can issue mhi_stop_transfer to pause 
>> activity if
>> + *                      required.
>> + * @mhi_dev: Device associated with the channels
>> + */
>> +int mhi_start_transfer(struct mhi_device *mhi_dev);
>> +
>> +/**
> 
> Align the comment header properly.
> 
So I am trying to follow the documentation style for other functions in 
the same
file. Is there any particular format you want me to refer to?

I use all spaces for the lines after the first one to align them just 
like the
rest of them.

> Thanks,
> Mani
> 
>>   * mhi_poll - Poll for any available data in DL direction
>>   * @mhi_dev: Device associated with the channels
>>   * @budget: # of events to process
>> --
>> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
>> Forum,
>> a Linux Foundation Collaborative Project
>> 

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
