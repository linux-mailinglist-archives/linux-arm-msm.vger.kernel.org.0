Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0DA802A9E1A
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 20:34:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728224AbgKFTe0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 14:34:26 -0500
Received: from z5.mailgun.us ([104.130.96.5]:21035 "EHLO z5.mailgun.us"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726415AbgKFTe0 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 14:34:26 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1604691265; h=Message-ID: References: In-Reply-To: Reply-To:
 Subject: Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/yJSAsbrV0QMsPqWbpDQ3qP9e6+NCd0X8z9ha9XBYtc=;
 b=STqfN8Wdfv+wDa5vEVfeylMdGNr+tBKIENnwAJNf28IImf4FzceHTuB4ropl/hOR43HLT6zr
 6zbmIBD5AAafC+mVNe/0kxPUNHB8hMqbRgvYoJEeN0Z3I8UEQSTk5ZnzmuVmF7Xsq5FpJdSr
 PEwhx1YtpsUBPC3vH9/OTEgT5fs=
X-Mailgun-Sending-Ip: 104.130.96.5
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 5fa5a53402f4ee3801a4267d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Fri, 06 Nov 2020 19:34:12
 GMT
Sender: bbhatt=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 08E2AC433C6; Fri,  6 Nov 2020 19:34:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: bbhatt)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id BA439C433C8;
        Fri,  6 Nov 2020 19:34:09 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Fri, 06 Nov 2020 11:34:09 -0800
From:   Bhaumik Bhatt <bbhatt@codeaurora.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     manivannan.sadhasivam@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Add inbound buffers allocation flag
Organization: Qualcomm Innovation Center, Inc.
Reply-To: bbhatt@codeaurora.org
Mail-Reply-To: bbhatt@codeaurora.org
In-Reply-To: <1600874218-10815-1-git-send-email-loic.poulain@linaro.org>
References: <1600874218-10815-1-git-send-email-loic.poulain@linaro.org>
Message-ID: <bfdaba8e658731c61f82337dd6877bf3@codeaurora.org>
X-Sender: bbhatt@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Loic,

On 2020-09-23 08:16, Loic Poulain wrote:
> Currently, the MHI controller driver defines which channels should
> have their inbound buffers allocated and queued. But ideally, this is
> something that should be decided by the MHI device driver instead,
> which actually deals with that buffers.
We could say, MHI device driver can be given the option to choose if it
wants to have inbound buffers queued for them during channel preparation
instead of having it pre-defined one-time in their configuration.
> 
> Add a flag parameter to mhi_prepare_for_transfer allowing to specify
mhi_prepare_for_transfer()?
> if buffers have to be allocated and queued by the MHI stack.
> 
> Keep auto_queue flag for now, but should be removed at some point.
> 
I feel there is no need to mention this line here. We can do it as a
follow-up patch to this one or address it later.
> Signed-off-by: Loic Poulain <loic.poulain@linaro.org>

With some of these suggestions picked up,
Reviewed-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> ---
>  drivers/bus/mhi/core/internal.h |  2 +-
>  drivers/bus/mhi/core/main.c     | 11 ++++++++---
>  include/linux/mhi.h             | 12 +++++++++++-
>  3 files changed, 20 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/bus/mhi/core/internal.h 
> b/drivers/bus/mhi/core/internal.h
> index 33c2320..5b636e2 100644
> --- a/drivers/bus/mhi/core/internal.h
> +++ b/drivers/bus/mhi/core/internal.h
> @@ -666,7 +666,7 @@ void mhi_rddm_prepare(struct mhi_controller 
> *mhi_cntrl,
>  		      struct image_info *img_info);
>  void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl);
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
> -			struct mhi_chan *mhi_chan);
> +			struct mhi_chan *mhi_chan, enum mhi_chan_flags flags);
>  int mhi_init_chan_ctxt(struct mhi_controller *mhi_cntrl,
>  		       struct mhi_chan *mhi_chan);
>  void mhi_deinit_chan_ctxt(struct mhi_controller *mhi_cntrl,
> diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> index a44fedb..fb71a0e 100644
> --- a/drivers/bus/mhi/core/main.c
> +++ b/drivers/bus/mhi/core/main.c
> @@ -1274,7 +1274,8 @@ static void __mhi_unprepare_channel(struct
> mhi_controller *mhi_cntrl,
>  }
> 
>  int mhi_prepare_channel(struct mhi_controller *mhi_cntrl,
> -			struct mhi_chan *mhi_chan)
> +			struct mhi_chan *mhi_chan,
> +			enum mhi_chan_flags flags)
>  {
>  	int ret = 0;
>  	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> @@ -1334,6 +1335,9 @@ int mhi_prepare_channel(struct mhi_controller 
> *mhi_cntrl,
>  	mhi_chan->ch_state = MHI_CH_STATE_ENABLED;
>  	write_unlock_irq(&mhi_chan->lock);
> 
> +	if (mhi_chan->dir == DMA_FROM_DEVICE)
> +		mhi_chan->pre_alloc = !!(flags & MHI_CH_INBOUND_ALLOC_BUFS);
> +
>  	/* Pre-allocate buffer for xfer ring */
>  	if (mhi_chan->pre_alloc) {
>  		int nr_el = get_nr_avail_ring_elements(mhi_cntrl,
> @@ -1480,7 +1484,8 @@ void mhi_reset_chan(struct mhi_controller
> *mhi_cntrl, struct mhi_chan *mhi_chan)
>  }
> 
>  /* Move channel to start state */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev)
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
> +			     enum mhi_chan_flags flags)
>  {
>  	int ret, dir;
>  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> @@ -1491,7 +1496,7 @@ int mhi_prepare_for_transfer(struct mhi_device 
> *mhi_dev)
>  		if (!mhi_chan)
>  			continue;
> 
> -		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan);
> +		ret = mhi_prepare_channel(mhi_cntrl, mhi_chan, flags);
>  		if (ret)
>  			goto error_open_chan;
>  	}
> diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> index 6522a4a..9d67e75 100644
> --- a/include/linux/mhi.h
> +++ b/include/linux/mhi.h
> @@ -60,6 +60,14 @@ enum mhi_flags {
>  };
> 
>  /**
> + * enum mhi_chan_flags - MHI channel flags
> + * @MHI_CH_INBOUND_ALLOC_BUFS: Automatically allocate and queue 
> inbound buffers
> + */
> +enum mhi_chan_flags {
> +	MHI_CH_INBOUND_ALLOC_BUFS = BIT(0),
> +};
> +
> +/**
>   * enum mhi_device_type - Device types
>   * @MHI_DEVICE_XFER: Handles data transfer
>   * @MHI_DEVICE_CONTROLLER: Control device
> @@ -684,8 +692,10 @@ void mhi_device_put(struct mhi_device *mhi_dev);
>  /**
>   * mhi_prepare_for_transfer - Setup channel for data transfer
>   * @mhi_dev: Device associated with the channels
> + * @flags: MHI channel flags
>   */
> -int mhi_prepare_for_transfer(struct mhi_device *mhi_dev);
> +int mhi_prepare_for_transfer(struct mhi_device *mhi_dev,
> +			     enum mhi_chan_flags flags);
> 
>  /**
>   * mhi_unprepare_from_transfer - Unprepare the channels

Thanks,
Bhaumik
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora 
Forum,
a Linux Foundation Collaborative Project
