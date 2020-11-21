Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC2FD2BC0C6
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Nov 2020 18:05:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726476AbgKURF2 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 21 Nov 2020 12:05:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52102 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726305AbgKURF1 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 21 Nov 2020 12:05:27 -0500
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56B67C0613CF
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 09:05:27 -0800 (PST)
Received: by mail-pg1-x541.google.com with SMTP id f17so1693975pge.6
        for <linux-arm-msm@vger.kernel.org>; Sat, 21 Nov 2020 09:05:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=udCudOkQ6HPcbXHtIkmb4T/h3gOsNcHb8sL22tg22wE=;
        b=ujUZnxZcWFPOeVwO1+lBKSkM5lfmF/E5gDkOF3LhD3fA2yeNCWgvgAA9t9s0Z7yuIA
         iwg7Lg3N8vHfnHzsX55ZAHDfwNEetExC39jq7iXFd/faLbNkeVDtS1tq4HMMxw3YIXBQ
         FdX6wJ8/mSUCaxk33PBnJgLmPCFsmG4MlVAB4bMVgLK/3xC7ufk0hndTksh0tu20ATrP
         icB1rj3wjy/GrfKpKVgJGboY7ntZ2d3EyxwUq6K0dFXJ5KNoduSTtGGGOGW1pfvFkST6
         NKMpPNJXwaGPtEH3xydmAV2KDlD7E2dU/5UDAym5gekXeJdgd0KwGcFbMb7jKj25/uhb
         EoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=udCudOkQ6HPcbXHtIkmb4T/h3gOsNcHb8sL22tg22wE=;
        b=eVb9A/0VtP4Xx+gKDIO+IIYh4waDxQRjnzu+qAMF5ih88FPaIutaNtewEAtu40LgmU
         cAQC4FfXDif0zoNClvVFhuc7aZTkZPTaOZqgWqkb8p188ZnVo6Q0lko+shxvtVZl2q+9
         HrLpzamww+xM32gFO5RsS2swX3MzbU5/VW4BW1qh8sDeyWFyePEwFeey4gE6lEvOdTY/
         2tVz87hMV5jpzqjM/L71dL016dtgS9DwMkUgAz3BA5rC522PyHKrmkUAyYg4O+RnflLj
         ESOvGdjkf1jDwJ6tHPVZRVMQ11gTfNLw7D13jmfU0QyrY21Qm2H49S/cwEGp2slxHHbJ
         5EZw==
X-Gm-Message-State: AOAM530DB9yQmXyXc3YPLJEGp6RI54XY2jnNnDfhN09QVABi5UjjSePG
        gTaOwo81FhIiwszn7QrlukIy
X-Google-Smtp-Source: ABdhPJxv/JSyhM/rLau/C8wSMcj0Jnmngq5v/hiADMZYDx89o8qc1ol5bc+2whBnP56+AEjnwFkMcw==
X-Received: by 2002:a65:4187:: with SMTP id a7mr20950383pgq.16.1605978326683;
        Sat, 21 Nov 2020 09:05:26 -0800 (PST)
Received: from thinkpad ([2409:4072:6d88:a48b:4152:ad0c:a438:7e97])
        by smtp.gmail.com with ESMTPSA id 145sm6644616pga.11.2020.11.21.09.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2020 09:05:25 -0800 (PST)
Date:   Sat, 21 Nov 2020 22:35:19 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Bhaumik Bhatt <bbhatt@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, hemantk@codeaurora.org,
        jhugo@codeaurora.org, loic.poulain@linaro.org,
        kvalo@codeaurora.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] bus: mhi: core: Add support to stop or start
 channel data transfers
Message-ID: <20201121170519.GA2343@thinkpad>
References: <1605122473-12179-1-git-send-email-bbhatt@codeaurora.org>
 <1605122473-12179-4-git-send-email-bbhatt@codeaurora.org>
 <20201116124332.GK3926@Mani-XPS-13-9360>
 <3bf88d90e4006ba17e2e86c76a926581@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bf88d90e4006ba17e2e86c76a926581@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Nov 16, 2020 at 12:56:16PM -0800, Bhaumik Bhatt wrote:
> Hi Mani,
> 
> On 2020-11-16 04:43, Manivannan Sadhasivam wrote:
> > On Wed, Nov 11, 2020 at 11:21:10AM -0800, Bhaumik Bhatt wrote:
> > > Some MHI client drivers may want to request a pause or halt of
> > > data transfer activity on their channels. Support for this does
> > > not exist and must be introduced, wherein the channel context is
> > > not reset or cleared but only the STOP channel command is issued.
> > > This would need to be paired with an API that allows resuming the
> > > data transfer activity on channels by use of the START channel
> > > command. This API assumes that the context information is already
> > > setup. Enable this using two new APIs, mhi_start_transfer() and
> > > mhi_stop_transfer().
> > > 
> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > ---
> > >  drivers/bus/mhi/core/main.c | 41
> > > +++++++++++++++++++++++++++++++++++++++++
> > >  include/linux/mhi.h         | 19 +++++++++++++++++++
> > >  2 files changed, 60 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index 1226933..1a969f4 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -1560,6 +1560,47 @@ void mhi_unprepare_from_transfer(struct
> > > mhi_device *mhi_dev)
> > >  }
> > >  EXPORT_SYMBOL_GPL(mhi_unprepare_from_transfer);
> > > 
> > > +static int mhi_update_transfer_state(struct mhi_device *mhi_dev,
> > > +				     enum mhi_ch_state_type to_state)
> > > +{
> > > +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> > > +	struct mhi_chan *mhi_chan;
> > > +	int dir, ret;
> > > +
> > > +	for (dir = 0; dir < 2; dir++) {
> > > +		mhi_chan = dir ? mhi_dev->ul_chan : mhi_dev->dl_chan;
> > > +
> > > +		if (!mhi_chan)
> > > +			continue;
> > > +
> > > +		/*
> > > +		 * Bail out if one of the channels fail as client will reset
> > > +		 * both upon failure
> > > +		 */
> > > +		mutex_lock(&mhi_chan->mutex);
> > 
> > Hmm. The documentation about wait_for_completion*() used in
> > mhi_update_channel_state()says below,
> > 
> > "As all variants of wait_for_completion() can (obviously) block for a
> > long
> > time depending on the nature of the activity they are waiting for, so in
> > most cases you probably don't want to call this with held mutexes."
> > 
> Yes, that is understood. The mhi_chan->mutex is only used to lock any
> channel
> enable/start/stop/disable type operations, since these have to be in order,
> it
> is essential that we wait for one of the operations to finish before the
> next
> one.
> 
> Also we avoid a race, for example, at a time when a device crash forces a
> driver
> "remove" call, while an operation to start/stop a channel is already going
> on.

Can't you just drop the lock before calling wait_for_completion() and
acquire later? You should add a comment for that also!

> > > +		ret = mhi_update_channel_state(mhi_cntrl, mhi_chan, to_state);
> > > +		if (ret) {
> > > +			mutex_unlock(&mhi_chan->mutex);
> > > +			return ret;
> > > +		}
> > > +		mutex_unlock(&mhi_chan->mutex);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +int mhi_stop_transfer(struct mhi_device *mhi_dev)
> > > +{
> > > +	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_STOP);
> > > +}
> > > +EXPORT_SYMBOL_GPL(mhi_stop_transfer);
> > > +
> > > +int mhi_start_transfer(struct mhi_device *mhi_dev)
> > > +{
> > > +	return mhi_update_transfer_state(mhi_dev, MHI_CH_STATE_TYPE_START);
> > > +}
> > > +EXPORT_SYMBOL_GPL(mhi_start_transfer);
> > > +
> > >  int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
> > >  {
> > >  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> > > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > > index 52b3c60..aee8494 100644
> > > --- a/include/linux/mhi.h
> > > +++ b/include/linux/mhi.h
> > > @@ -702,6 +702,25 @@ int mhi_prepare_for_transfer(struct mhi_device
> > > *mhi_dev);
> > >  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
> > > 
> > >  /**
> > > + * mhi_stop_transfer - Pauses ongoing channel activity by issuing
> > > the STOP
> > > + *                     channel command to both UL and DL channels.
> > > This command
> > > + *                     does not reset the channel context and the
> > > client drivers
> > > + *                     can issue mhi_start_transfer to resume
> > > activity.
> > > + * @mhi_dev: Device associated with the channels
> > > + */
> > > +int mhi_stop_transfer(struct mhi_device *mhi_dev);
> > > +
> > > +/**
> > > + * mhi_start_transfer - Resumes channel activity by issuing the
> > > START channel
> > > + *                      command to both UL and DL channels. This
> > > command assumes
> > > + *                      the channel context is already setup and
> > > the client
> > > + *                      drivers can issue mhi_stop_transfer to
> > > pause activity if
> > > + *                      required.
> > > + * @mhi_dev: Device associated with the channels
> > > + */
> > > +int mhi_start_transfer(struct mhi_device *mhi_dev);
> > > +
> > > +/**
> > 
> > Align the comment header properly.
> > 
> So I am trying to follow the documentation style for other functions in the
> same
> file. Is there any particular format you want me to refer to?
> 
> I use all spaces for the lines after the first one to align them just like
> the
> rest of them.
> 

The diff shows me of below style:

/**
+ *
+ *
...
+ /**

I just asked to fix this.

Thanks,
Mani

> > Thanks,
> > Mani
> > 
> > >   * mhi_poll - Poll for any available data in DL direction
> > >   * @mhi_dev: Device associated with the channels
> > >   * @budget: # of events to process
> > > --
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora
> > > Forum,
> > > a Linux Foundation Collaborative Project
> > > 
> 
> Thanks,
> Bhaumik
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
