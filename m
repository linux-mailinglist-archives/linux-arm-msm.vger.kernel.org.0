Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 60870189DDF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Mar 2020 15:31:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727005AbgCROb5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 18 Mar 2020 10:31:57 -0400
Received: from mail-pj1-f68.google.com ([209.85.216.68]:39492 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgCROb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 18 Mar 2020 10:31:57 -0400
Received: by mail-pj1-f68.google.com with SMTP id ck23so1281179pjb.4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Mar 2020 07:31:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=DmmTGaSjeqq+jzq5ZT2MLYTKtFgmSl1BRjYtNldMmbI=;
        b=POMY8fPbUNV/jr8If7/jHJFueLIaZ+73yXyvmAdqo6hIwl6cREome2vcdULSitcYUu
         wTq/HLTirVksGjI4TLE02tebYJ6w9Oodng0qO/qFLnTCE2uTm8rDWrnOu+7hhwp0TCM5
         FVOlxqatgLivXFZwrBmDWs0/5p7ktckk/apkuCtPF+fV4CZllBWUaMEHrehip48C3Xx5
         BDINY4mAMZzm4Iru6tBFiwzaOmslDDvt0OPKZ3WtlkYGqcFSfWLsIWMsCHPgqpTuBXv7
         b44N0yjhZHoYxIKp4SICquSzwE9NQHG61M/9Uh371XllKBh7Ad0adwVUOnvD6qSg5ETN
         +7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=DmmTGaSjeqq+jzq5ZT2MLYTKtFgmSl1BRjYtNldMmbI=;
        b=nEqQWZ7Uu7lrTT0l04bhy5CO01+ZvaLPEIuQfTSiI7IcbS9Nh7+eW4aX9cWIOujnYs
         CR91QyWrLv7DAW0vYZH2qugaX/ILRdVD/tVMWhypFSrMpo0UiqvJIK2piI6VDUmD+eAJ
         Te+pChcEi5LnlPrZ1IA6Sr/rU5a/k8Rv/gOS8GZphPTwFT+3sYQyID7YcIC8znkxKtAb
         rP5ePY588Nj7g3RbnVSIqaMLY7delvWHHWXFODlo4QnbuBaGAeqNVlpv1/fQqY9Bm8aS
         hs91/VUrkB+fIZ+QkPmpGM01Nz7Tx2nbExbw0etI+cSAwvf35fVX0HfhFmrPb7dEP5ry
         AB7A==
X-Gm-Message-State: ANhLgQ3zXSsxJfbb9jLzRrsIU/3/+jB4p9N4a6KHkUsh0sCVpIGstMOd
        aR1kYu3ILzPRblu15XCXAqXXe7HaPxyP
X-Google-Smtp-Source: ADFU+vsjma8hHv5QJXOF+7qzjW6QaoJynz5FZg2WXJunlvy1G4jiBx8etuUAd1vkNC1K3SC94iP3Zw==
X-Received: by 2002:a17:90a:2109:: with SMTP id a9mr4916326pje.12.1584541914308;
        Wed, 18 Mar 2020 07:31:54 -0700 (PDT)
Received: from Mani-XPS-13-9360 ([2409:4072:199:25eb:1005:91b8:c500:d4b4])
        by smtp.gmail.com with ESMTPSA id 19sm6237036pgx.63.2020.03.18.07.31.48
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 18 Mar 2020 07:31:53 -0700 (PDT)
Date:   Wed, 18 Mar 2020 20:01:45 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Jeffrey Hugo <jhugo@codeaurora.org>, arnd@arndb.de,
        smohanad@codeaurora.org, kvalo@codeaurora.org,
        bjorn.andersson@linaro.org, hemantk@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 03/16] bus: mhi: core: Add support for registering MHI
 client drivers
Message-ID: <20200318143145.GA12341@Mani-XPS-13-9360>
References: <20200220095854.4804-1-manivannan.sadhasivam@linaro.org>
 <20200220095854.4804-4-manivannan.sadhasivam@linaro.org>
 <20200318133626.GA2801580@kroah.com>
 <db612e12-0033-31cc-60fc-62e45dda4342@codeaurora.org>
 <20200318140034.GA2805201@kroah.com>
 <20200318142312.GA11494@Mani-XPS-13-9360>
 <20200318142730.GB2807628@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200318142730.GB2807628@kroah.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Mar 18, 2020 at 03:27:30PM +0100, Greg KH wrote:
> On Wed, Mar 18, 2020 at 07:53:12PM +0530, Manivannan Sadhasivam wrote:
> > Hi Greg,
> > 
> > On Wed, Mar 18, 2020 at 03:00:34PM +0100, Greg KH wrote:
> > > On Wed, Mar 18, 2020 at 07:54:30AM -0600, Jeffrey Hugo wrote:
> > > > On 3/18/2020 7:36 AM, Greg KH wrote:
> > > > > On Thu, Feb 20, 2020 at 03:28:41PM +0530, Manivannan Sadhasivam wrote:
> > > > > > This commit adds support for registering MHI client drivers with the
> > > > > > MHI stack. MHI client drivers binds to one or more MHI devices inorder
> > > > > > to sends and receive the upper-layer protocol packets like IP packets,
> > > > > > modem control messages, and diagnostics messages over MHI bus.
> > > > > > 
> > > > > > This is based on the patch submitted by Sujeev Dias:
> > > > > > https://lkml.org/lkml/2018/7/9/987
> > > > > > 
> > > > > > Signed-off-by: Sujeev Dias <sdias@codeaurora.org>
> > > > > > Signed-off-by: Siddartha Mohanadoss <smohanad@codeaurora.org>
> > > > > > [mani: splitted and cleaned up for upstream]
> > > > > > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > > > > > Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > > > > Tested-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > > > > ---
> > > > > >   drivers/bus/mhi/core/init.c | 149 ++++++++++++++++++++++++++++++++++++
> > > > > >   include/linux/mhi.h         |  39 ++++++++++
> > > > > >   2 files changed, 188 insertions(+)
> > > > > > 
> > > > > > diff --git a/drivers/bus/mhi/core/init.c b/drivers/bus/mhi/core/init.c
> > > > > > index 6f24c21284ec..12e386862b3f 100644
> > > > > > --- a/drivers/bus/mhi/core/init.c
> > > > > > +++ b/drivers/bus/mhi/core/init.c
> > > > > > @@ -374,8 +374,157 @@ struct mhi_device *mhi_alloc_device(struct mhi_controller *mhi_cntrl)
> > > > > >   	return mhi_dev;
> > > > > >   }
> > > > > > +static int mhi_driver_probe(struct device *dev)
> > > > > > +{
> > > > > > +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> > > > > > +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> > > > > > +	struct device_driver *drv = dev->driver;
> > > > > > +	struct mhi_driver *mhi_drv = to_mhi_driver(drv);
> > > > > > +	struct mhi_event *mhi_event;
> > > > > > +	struct mhi_chan *ul_chan = mhi_dev->ul_chan;
> > > > > > +	struct mhi_chan *dl_chan = mhi_dev->dl_chan;
> > > > > > +
> > > > > > +	if (ul_chan) {
> > > > > > +		/*
> > > > > > +		 * If channel supports LPM notifications then status_cb should
> > > > > > +		 * be provided
> > > > > > +		 */
> > > > > > +		if (ul_chan->lpm_notify && !mhi_drv->status_cb)
> > > > > > +			return -EINVAL;
> > > > > > +
> > > > > > +		/* For non-offload channels then xfer_cb should be provided */
> > > > > > +		if (!ul_chan->offload_ch && !mhi_drv->ul_xfer_cb)
> > > > > > +			return -EINVAL;
> > > > > > +
> > > > > > +		ul_chan->xfer_cb = mhi_drv->ul_xfer_cb;
> > > > > > +	}
> > > > > > +
> > > > > > +	if (dl_chan) {
> > > > > > +		/*
> > > > > > +		 * If channel supports LPM notifications then status_cb should
> > > > > > +		 * be provided
> > > > > > +		 */
> > > > > > +		if (dl_chan->lpm_notify && !mhi_drv->status_cb)
> > > > > > +			return -EINVAL;
> > > > > > +
> > > > > > +		/* For non-offload channels then xfer_cb should be provided */
> > > > > > +		if (!dl_chan->offload_ch && !mhi_drv->dl_xfer_cb)
> > > > > > +			return -EINVAL;
> > > > > > +
> > > > > > +		mhi_event = &mhi_cntrl->mhi_event[dl_chan->er_index];
> > > > > > +
> > > > > > +		/*
> > > > > > +		 * If the channel event ring is managed by client, then
> > > > > > +		 * status_cb must be provided so that the framework can
> > > > > > +		 * notify pending data
> > > > > > +		 */
> > > > > > +		if (mhi_event->cl_manage && !mhi_drv->status_cb)
> > > > > > +			return -EINVAL;
> > > > > > +
> > > > > > +		dl_chan->xfer_cb = mhi_drv->dl_xfer_cb;
> > > > > > +	}
> > > > > > +
> > > > > > +	/* Call the user provided probe function */
> > > > > > +	return mhi_drv->probe(mhi_dev, mhi_dev->id);
> > > > > > +}
> > > > > > +
> > > > > > +static int mhi_driver_remove(struct device *dev)
> > > > > > +{
> > > > > > +	struct mhi_device *mhi_dev = to_mhi_device(dev);
> > > > > > +	struct mhi_driver *mhi_drv = to_mhi_driver(dev->driver);
> > > > > > +	struct mhi_chan *mhi_chan;
> > > > > > +	enum mhi_ch_state ch_state[] = {
> > > > > > +		MHI_CH_STATE_DISABLED,
> > > > > > +		MHI_CH_STATE_DISABLED
> > > > > > +	};
> > > > > > +	int dir;
> > > > > > +
> > > > > > +	/* Skip if it is a controller device */
> > > > > > +	if (mhi_dev->dev_type == MHI_DEVICE_CONTROLLER)
> > > > > > +		return 0;
> > > > > > +
> > > > > > +	/* Reset both channels */
> > > > > > +	for (dir = 0; dir < 2; dir++) {
> > > > > > +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> > > > > > +
> > > > > > +		if (!mhi_chan)
> > > > > > +			continue;
> > > > > > +
> > > > > > +		/* Wake all threads waiting for completion */
> > > > > > +		write_lock_irq(&mhi_chan->lock);
> > > > > > +		mhi_chan->ccs = MHI_EV_CC_INVALID;
> > > > > > +		complete_all(&mhi_chan->completion);
> > > > > > +		write_unlock_irq(&mhi_chan->lock);
> > > > > > +
> > > > > > +		/* Set the channel state to disabled */
> > > > > > +		mutex_lock(&mhi_chan->mutex);
> > > > > > +		write_lock_irq(&mhi_chan->lock);
> > > > > > +		ch_state[dir] = mhi_chan->ch_state;
> > > > > > +		mhi_chan->ch_state = MHI_CH_STATE_SUSPENDED;
> > > > > > +		write_unlock_irq(&mhi_chan->lock);
> > > > > > +
> > > > > > +		mutex_unlock(&mhi_chan->mutex);
> > > > > > +	}
> > > > > > +
> > > > > > +	mhi_drv->remove(mhi_dev);
> > > > > > +
> > > > > > +	/* De-init channel if it was enabled */
> > > > > > +	for (dir = 0; dir < 2; dir++) {
> > > > > > +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> > > > > > +
> > > > > > +		if (!mhi_chan)
> > > > > > +			continue;
> > > > > > +
> > > > > > +		mutex_lock(&mhi_chan->mutex);
> > > > > > +
> > > > > > +		mhi_chan->ch_state = MHI_CH_STATE_DISABLED;
> > > > > > +
> > > > > > +		mutex_unlock(&mhi_chan->mutex);
> > > > > > +	}
> > > > > > +
> > > > > > +	return 0;
> > > > > > +}
> > > > > > +
> > > > > > +int mhi_driver_register(struct mhi_driver *mhi_drv)
> > > > > > +{
> > > > > > +	struct device_driver *driver = &mhi_drv->driver;
> > > > > > +
> > > > > > +	if (!mhi_drv->probe || !mhi_drv->remove)
> > > > > > +		return -EINVAL;
> > > > > > +
> > > > > > +	driver->bus = &mhi_bus_type;
> > > > > > +	driver->probe = mhi_driver_probe;
> > > > > > +	driver->remove = mhi_driver_remove;
> > > > > > +
> > > > > > +	return driver_register(driver);
> > > > > > +}
> > > > > > +EXPORT_SYMBOL_GPL(mhi_driver_register);
> > > > > 
> > > > > You don't care about module owners of the driver?  Odd :(
> > > > > 
> > > > > (hint, you probably should...)
> > > > > 
> > > > > greg k-h
> > > > > 
> > > > 
> > > > For my own education, can you please clarify your comment?  I'm not sure
> > > > that I understand the context of what you are saying (ie why is this export
> > > > a possible problem?).
> > > 
> > > Sorry, it didn't have to do with the export, it had to do with the fact
> > > that your driver_register() function does not pass in the owner of the
> > > module of the driver, like almost all other subsystems do.  That way you
> > > can try to protect the module from being unloaded if it has files open
> > > assigned to it.
> > > 
> > > If you don't have any userspace accesses like that, to the driver, then
> > > nevermind, all is fine :)
> > > 
> > 
> > This is not needed right now but I'll fix this anyway to avoid issues in
> > future :)
> > 
> > Btw, may I know the status of this series? Do you have any more comments
> > or do you happen to wait for more reviews?
> 
> It would be nice to get other reviews, but other than what I noticed
> above, it looks sane to me.  Am I the one supposed to take these
> patches?
> 

I guess so ;) Do you think I need to sent another revision incorporating
the module owner fix or it can come as an incremental patch? Btw, I do
have few more in pipeline :)

Thanks,
Mani

> thanks,
> 
> greg k-h
