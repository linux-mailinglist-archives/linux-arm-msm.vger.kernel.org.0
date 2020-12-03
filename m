Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC0232CCB04
	for <lists+linux-arm-msm@lfdr.de>; Thu,  3 Dec 2020 01:36:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729168AbgLCAdx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Dec 2020 19:33:53 -0500
Received: from m42-5.mailgun.net ([69.72.42.5]:28985 "EHLO m42-5.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725885AbgLCAdx (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Dec 2020 19:33:53 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1606955613; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=By/aMzhWqnWf+mrF0bGGdQIRcZSJvv5Cq+eXGImVikQ=; b=qPeTLNetPH1ysgu0POVtdE01I1jSBVGgg7gk0zyREDN0rFZqkJHHkmGkMj40RJs6TACRQXU5
 OPCHgldkpsqMLiIPOsuQ1sux2kGM9N8V8JinY9QdzFRdbRZP9/zPXYgQbLYxgR7Q6qxXF909
 C8rMYzAMR9HbBDau26UOfFO6yNQ=
X-Mailgun-Sending-Ip: 69.72.42.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n09.prod.us-west-2.postgun.com with SMTP id
 5fc8323ee8c9bf49aded9fde (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 03 Dec 2020 00:33:02
 GMT
Sender: hemantk=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 12BB9C43462; Thu,  3 Dec 2020 00:33:02 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        NICE_REPLY_A,SPF_FAIL,URIBL_BLOCKED autolearn=no autolearn_force=no
        version=3.4.0
Received: from [10.46.162.249] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: hemantk)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id D5E1AC433C6;
        Thu,  3 Dec 2020 00:33:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org D5E1AC433C6
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=hemantk@codeaurora.org
Subject: Re: [PATCH v3 4/7] bus: mhi: core: Add support to stop or start
 channel data transfers
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        manivannan.sadhasivam@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, loic.poulain@linaro.org,
        jhugo@codeaurora.org, linux-kernel@vger.kernel.org
References: <1606952438-15321-1-git-send-email-bbhatt@codeaurora.org>
 <1606952438-15321-5-git-send-email-bbhatt@codeaurora.org>
From:   Hemant Kumar <hemantk@codeaurora.org>
Message-ID: <78cafedf-4d08-e087-a56e-6df88731b2ff@codeaurora.org>
Date:   Wed, 2 Dec 2020 16:33:00 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1606952438-15321-5-git-send-email-bbhatt@codeaurora.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Bhaumik,

On 12/2/20 3:40 PM, Bhaumik Bhatt wrote:
> Some MHI client drivers may want to request a pause or halt of
> data transfer activity on their channels. Support for this does
> not exist and must be introduced, wherein the channel context is
> not reset or cleared but only the STOP channel command is issued.
> This would need to be paired with an API that allows resuming the
> data transfer activity on channels by use of the START channel
> command. This API assumes that the context information is already

is it a better option to make sure channel context is setup as this is 
an exported API. Hence check for channel context bail out in case 
channel context is not setup with an err msg ?

> setup. Enable this using two new APIs, mhi_start_transfer() and
> mhi_stop_transfer().
> 
> Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>   drivers/bus/mhi/core/main.c | 41 +++++++++++++++++++++++++++++++++++++++++
>   include/linux/mhi.h         | 19 +++++++++++++++++++
>   2 files changed, 60 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index 4cc5ced..2e4b34a 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1552,6 +1552,47 @@ void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev)
>   }
>   EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
>   
> +static int mhi_update_transfer_state(struct mhi_device *mhi_dev,
> +				     enum mhi_ch_state_type to_state)
> +{
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct mhi_chan *mhi_chan;
> +	int dir, ret;
> +
> +	for (dir = 0; dir < 2; dir++) {
> +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> +
> +		if (!mhi_chan)
> +			continue;
> +
> +		/*
> +		 * Bail out if one of the channels fail as client will reset
> +		 * both upon failure
> +		 */
> +		mutex_lock(&mhi_chan->mutex);
> +		ret = mhi_update_channel_state(mhi_cntrl, mhi_chan, to_state);
> +		if (ret) {
> +			mutex_unlock(&mhi_chan->mutex);
> +			return ret;
> +		}
> +		mutex_unlock(&mhi_chan->mutex);
> +	}
> +
> +	return 0;
> +}
> +
> +int mhi_stop_transfer(struct mhi_device *mhi_dev)
> +{
> +	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_STOP);
> +}
> +EXPORT_SYMBOL_GPL(mhi_stop_transfer);
> +
> +int mhi_start_transfer(struct mhi_device *mhi_dev)
> +{
> +	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_START);
> +}
> +EXPORT_SYMBOL_GPL(mhi_start_transfer);
> +
>   int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
>   {
>   	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index aa9757e..35779a0 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -704,6 +704,25 @@ int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
>   void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
>   
>   /**
> + * mhi_stop_transfer - Pauses ongoing channel activity by issuing the STOP
> + *                     channel command to both UL and DL channels. This command
> + *                     does not reset the channel context and the client drivers
> + *                     can issue mhi_start_transfer to resume activity.
> + * @mhi_dev: Device associated with the channels
> + */
> +int mhi_stop_transfer(struct mhi_device *mhi_dev);
> +
> +/**
> + * mhi_start_transfer - Resumes channel activity by issuing the START channel
> + *                      command to both UL and DL channels. This command assumes
> + *                      the channel context is already setup and the client
> + *                      drivers can issue mhi_stop_transfer to pause activity if
> + *                      required.
> + * @mhi_dev: Device associated with the channels
> + */
> +int mhi_start_transfer(struct mhi_device *mhi_dev);
> +
> +/**
>    * mhi_poll - Poll for any available data in DL direction
>    * @mhi_dev: Device associated with the channels
>    * @budget: # of events to process
> 
Overall change looks good.

Thanks,
Hemant
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
