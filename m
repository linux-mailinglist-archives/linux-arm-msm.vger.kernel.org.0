Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C6F2189D17
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 14:36:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgCRNgb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 09:36:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:37344 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726777AbgCRNga (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 09:36:30 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 59AC420774;
        Wed, 18 Mar 2020 13:36:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1584538588;
        bh=gLmKwIgKSmCrplDshX3y+IGw0PE0LxDrFt/DCEBxXjs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=zGaBOO4+xpBSYAAQ/UJsNB0SxSxV8SnlT4VS0RM9M+df3P6npTCBJuMgF5cJPAuLP
         6JI62qXCFctFbpjUospbeIPZLwe46H9vi9Nhie34SNsxuwBfLdk3j5yD/C3gbHh0Vo
         gVYzWnYeuIFubNhyDEuw5mNwJFTiq2O328fSaqKE=
Date:   Wed, 18 Mar 2020 14:36:26 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     arnd@arndb.de, smohanad@codeaurora.org, jhugo@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/16] bus: mhi: core: Add support for registering MHI
 client drivers
Message-ID: <20200318133626.GA2801580@kroah.com>
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
 <20200220095854.4804-4-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200220095854.4804-4-manivannan.sadhasivam@linaro.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Feb 20, 2020 at 03:28:41PM +0530, Manivannan Sadhasivam wrote:
> This commit adds support for registering MHI client drivers with the
> MHI stack. MHI client drivers binds to one or more MHI devices inorder
> to sends and receive the upper-layer protocol packets like IP packets,
> modem control messages, and diagnostics messages over MHI bus.
> 
> This is based on the patch submitted by Sujeev Dias:
> https://lkml.org/lkml/2018/7/9/987
> 
> Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> [mani: splitted and cleaned up for upstream]
> Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
> ---
>  drivers/bus/mhi/core/init.c | 149 ++++++++++++++++++++++++++++++++++++
>  include/linux/mhi.h         |  39 ++++++++++
>  2 files changed, 188 insertions(+)
> 
> diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> index 6f24c21284ec..12e386862b3f 100644
> --- a/drivers/bus/mhi/core/init.c
> +++ b/drivers/bus/mhi/core/init.c
> @@ -374,8 +374,157 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
>  	return mhi_dev;
>  }
>  
> +static int mhi_driver_probe(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct device_driver *drv = dev->driver;
> +	struct mhi_driver *mhi_drv = to_mhi_driver(drv);
> +	struct mhi_event *mhi_event;
> +	struct mhi_chan *ul_chan = mhi_dev->ul_chan;
> +	struct mhi_chan *dl_chan = mhi_dev->dl_chan;
> +
> +	if (ul_chan) {
> +		/*
> +		 * If channel supports LPM notifications then status_cb should
> +		 * be provided
> +		 */
> +		if (ul_chan->lpm_notify && !mhi_drv->status_cb)
> +			return -EINVAL;
> +
> +		/* For non-offload channels then xfer_cb should be provided */
> +		if (!ul_chan->offload_ch && !mhi_drv->ul_xfer_cb)
> +			return -EINVAL;
> +
> +		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
> +	}
> +
> +	if (dl_chan) {
> +		/*
> +		 * If channel supports LPM notifications then status_cb should
> +		 * be provided
> +		 */
> +		if (dl_chan->lpm_notify && !mhi_drv->status_cb)
> +			return -EINVAL;
> +
> +		/* For non-offload channels then xfer_cb should be provided */
> +		if (!dl_chan->offload_ch && !mhi_drv->dl_xfer_cb)
> +			return -EINVAL;
> +
> +		mhi_event = &mhi_cntrl->mhi_event[dl_chan->er_index];
> +
> +		/*
> +		 * If the channel event ring is managed by client, then
> +		 * status_cb must be provided so that the framework can
> +		 * notify pending data
> +		 */
> +		if (mhi_event->cl_manage && !mhi_drv->status_cb)
> +			return -EINVAL;
> +
> +		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
> +	}
> +
> +	/* Call the user provided probe function */
> +	return mhi_drv->probe(mhi_dev, mhi_dev->id);
> +}
> +
> +static int mhi_driver_remove(struct device *dev)
> +{
> +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> +	struct mhi_driver *mhi_drv = to_mhi_driver(dev->driver);
> +	struct mhi_chan *mhi_chan;
> +	enum mhi_ch_state ch_state[] = {
> +		MHI_CH_STATE_DISABLED,
> +		MHI_CH_STATE_DISABLED
> +	};
> +	int dir;
> +
> +	/* Skip if it is a controller device */
> +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> +		return 0;
> +
> +	/* Reset both channels */
> +	for (dir = 0; dir < 2; dir++) {
> +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> +
> +		if (!mhi_chan)
> +			continue;
> +
> +		/* Wake all threads waiting for completion */
> +		write_lock_irq(&mhi_chan->lock);
> +		mhi_chan->ccs = MHI_EV_CC_INVALID;
> +		complete_all(&mhi_chan->completion);
> +		write_unlock_irq(&mhi_chan->lock);
> +
> +		/* Set the channel state to disabled */
> +		mutex_lock(&mhi_chan->mutex);
> +		write_lock_irq(&mhi_chan->lock);
> +		ch_state[dir] = mhi_chan->ch_state;
> +		mhi_chan->ch_state = MHI_CH_STATE_SUSPENDED;
> +		write_unlock_irq(&mhi_chan->lock);
> +
> +		mutex_unlock(&mhi_chan->mutex);
> +	}
> +
> +	mhi_drv->remove(mhi_dev);
> +
> +	/* De-init channel if it was enabled */
> +	for (dir = 0; dir < 2; dir++) {
> +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> +
> +		if (!mhi_chan)
> +			continue;
> +
> +		mutex_lock(&mhi_chan->mutex);
> +
> +		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
> +
> +		mutex_unlock(&mhi_chan->mutex);
> +	}
> +
> +	return 0;
> +}
> +
> +int mhi_driver_register(struct mhi_driver *mhi_drv)
> +{
> +	struct device_driver *driver = &mhi_drv->driver;
> +
> +	if (!mhi_drv->probe || !mhi_drv->remove)
> +		return -EINVAL;
> +
> +	driver->bus = &mhi_bus_type;
> +	driver->probe = mhi_driver_probe;
> +	driver->remove = mhi_driver_remove;
> +
> +	return driver_register(driver);
> +}
> +EXPORT_SYMBOL_GPL(mhi_driver_register);

You don't care about module owners of the driver?  Odd :(

(hint, you probably should...)

greg k-h
