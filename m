Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6E074189D64
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 14:54:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726857AbgCRNyo (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 09:54:44 -0400
Received: from mail26.static.mailgun.info ([104.130.122.26]:23792 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726893AbgCRNyo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 09:54:44 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1584539683; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=ftn9Lyhy3QwrtFuYpSjmR7S49KjoLD+BVcOZCJzzvGU=; b=pUygUvFyZnYXGpOAA8YTq/BHL+HNRpLkgnisdeiguePdhhf9y3ofR1y5x5a4dqY5Hcg2dyjP
 mljLkzUhjfsIeb2mzHmtJBg8z1KgkxdpnqZIZG5FNLWvkgN48eWUbX2gkNCa+IqjlGFToQQZ
 7pDpMw/NzJw5MpyyivWU2PfhdK4=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e72281a.7fe086cc76f8-smtp-out-n03;
 Wed, 18 Mar 2020 13:54:34 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id A2336C43636; Wed, 18 Mar 2020 13:54:33 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from [10.226.58.28] (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jhugo)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id E3181C433CB;
        Wed, 18 Mar 2020 13:54:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org E3181C433CB
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=jhugo@codeaurora.org
Subject: Re: [PATCH v3 03/16] bus: mhi: core: Add support for registering MHI
 client drivers
To:     Greg KH <gregkh@linuxfoundation.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
 <20200220095854.4804-4-manivannan.sadhasivam@linaro.org>
 <20200318133626.GA2801580@kroah.com>
From:   Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <db612e12-0033-31cc-60fc-62e45dda4342@codeaurora.org>
Date:   Wed, 18 Mar 2020 07:54:30 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200318133626.GA2801580@kroah.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On 3/18/2020 7:36 AM, Greg KH wrote:
> On Thu, Feb 20, 2020 at 03:28:41PM +0530, Manivannan Sadhasivam wrote:
>> This commit adds support for registering MHI client drivers with the
>> MHI stack. MHI client drivers binds to one or more MHI devices inorder
>> to sends and receive the upper-layer protocol packets like IP packets,
>> modem control messages, and diagnostics messages over MHI bus.
>>
>> This is based on the patch submitted by Sujeev Dias:
>> https://lkml.org/lkml/2018/7/9/987
>>
>> Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
>> Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
>> [mani: splitted and cleaned up for upstream]
>> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
>> ---
>>   drivers/bus/mhi/core/init.c | 149 ++++++++++++++++++++++++++++++++++++
>>   include/linux/mhi.h         |  39 ++++++++++
>>   2 files changed, 188 insertions(+)
>>
>> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
>> index 6f24c21284ec..12e386862b3f 100644
>> --- a/drivers/bus/mhi/core/init.c
>> +++ b/drivers/bus/mhi/core/init.c
>> @@ -374,8 +374,157 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
>>   	return mhi_dev;
>>   }
>>   
>> +static int mhi_driver_probe(struct device *dev)
>> +{
>> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
>> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
>> +	struct device_driver *drv = dev->driver;
>> +	struct mhi_driver *mhi_drv = to_mhi_driver(drv);
>> +	struct mhi_event *mhi_event;
>> +	struct mhi_chan *ul_chan = mhi_dev->ul_chan;
>> +	struct mhi_chan *dl_chan = mhi_dev->dl_chan;
>> +
>> +	if (ul_chan) {
>> +		/*
>> +		 * If channel supports LPM notifications then status_cb should
>> +		 * be provided
>> +		 */
>> +		if (ul_chan->lpm_notify && !mhi_drv->status_cb)
>> +			return -EINVAL;
>> +
>> +		/* For non-offload channels then xfer_cb should be provided */
>> +		if (!ul_chan->offload_ch && !mhi_drv->ul_xfer_cb)
>> +			return -EINVAL;
>> +
>> +		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
>> +	}
>> +
>> +	if (dl_chan) {
>> +		/*
>> +		 * If channel supports LPM notifications then status_cb should
>> +		 * be provided
>> +		 */
>> +		if (dl_chan->lpm_notify && !mhi_drv->status_cb)
>> +			return -EINVAL;
>> +
>> +		/* For non-offload channels then xfer_cb should be provided */
>> +		if (!dl_chan->offload_ch && !mhi_drv->dl_xfer_cb)
>> +			return -EINVAL;
>> +
>> +		mhi_event = &mhi_cntrl->mhi_event[dl_chan->er_index];
>> +
>> +		/*
>> +		 * If the channel event ring is managed by client, then
>> +		 * status_cb must be provided so that the framework can
>> +		 * notify pending data
>> +		 */
>> +		if (mhi_event->cl_manage && !mhi_drv->status_cb)
>> +			return -EINVAL;
>> +
>> +		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
>> +	}
>> +
>> +	/* Call the user provided probe function */
>> +	return mhi_drv->probe(mhi_dev, mhi_dev->id);
>> +}
>> +
>> +static int mhi_driver_remove(struct device *dev)
>> +{
>> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
>> +	struct mhi_driver *mhi_drv = to_mhi_driver(dev->driver);
>> +	struct mhi_chan *mhi_chan;
>> +	enum mhi_ch_state ch_state[] = {
>> +		MHI_CH_STATE_DISABLED,
>> +		MHI_CH_STATE_DISABLED
>> +	};
>> +	int dir;
>> +
>> +	/* Skip if it is a controller device */
>> +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
>> +		return 0;
>> +
>> +	/* Reset both channels */
>> +	for (dir = 0; dir < 2; dir++) {
>> +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
>> +
>> +		if (!mhi_chan)
>> +			continue;
>> +
>> +		/* Wake all threads waiting for completion */
>> +		write_lock_irq(&mhi_chan->lock);
>> +		mhi_chan->ccs = MHI_EV_CC_INVALID;
>> +		complete_all(&mhi_chan->completion);
>> +		write_unlock_irq(&mhi_chan->lock);
>> +
>> +		/* Set the channel state to disabled */
>> +		mutex_lock(&mhi_chan->mutex);
>> +		write_lock_irq(&mhi_chan->lock);
>> +		ch_state[dir] = mhi_chan->ch_state;
>> +		mhi_chan->ch_state = MHI_CH_STATE_SUSPENDED;
>> +		write_unlock_irq(&mhi_chan->lock);
>> +
>> +		mutex_unlock(&mhi_chan->mutex);
>> +	}
>> +
>> +	mhi_drv->remove(mhi_dev);
>> +
>> +	/* De-init channel if it was enabled */
>> +	for (dir = 0; dir < 2; dir++) {
>> +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
>> +
>> +		if (!mhi_chan)
>> +			continue;
>> +
>> +		mutex_lock(&mhi_chan->mutex);
>> +
>> +		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
>> +
>> +		mutex_unlock(&mhi_chan->mutex);
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>> +int mhi_driver_register(struct mhi_driver *mhi_drv)
>> +{
>> +	struct device_driver *driver = &mhi_drv->driver;
>> +
>> +	if (!mhi_drv->probe || !mhi_drv->remove)
>> +		return -EINVAL;
>> +
>> +	driver->bus = &mhi_bus_type;
>> +	driver->probe = mhi_driver_probe;
>> +	driver->remove = mhi_driver_remove;
>> +
>> +	return driver_register(driver);
>> +}
>> +EXPORT_SYMBOL_GPL(mhi_driver_register);
> 
> You don't care about module owners of the driver?  Odd :(
> 
> (hint, you probably should...)
> 
> greg k-h
> 

For my own education, can you please clarify your comment?  I'm not sure 
that I understand the context of what you are saying (ie why is this 
export a possible problem?).

-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
