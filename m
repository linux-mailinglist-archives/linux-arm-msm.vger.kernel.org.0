Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A386324346
	for <lists+linux-arm-msm@lfdr.de>; Wed, 24 Feb 2021 18:44:06 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229594AbhBXRnf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 24 Feb 2021 12:43:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233159AbhBXRnd (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 24 Feb 2021 12:43:33 -0500
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1BDCC06174A
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 09:42:52 -0800 (PST)
Received: by mail-pj1-x102e.google.com with SMTP id s23so1827329pji.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 24 Feb 2021 09:42:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9wRP5DLkWCzCh+T0vNbWrMthPSfCeaaDqG66jAHUycU=;
        b=RIjjpYYwNMgz101kT8oIKdx1uRLRXETEKM6Tdp5yGLjckq/XC7caP8TrwFwf0EMMNd
         bWr9OweNiqfYBO+X9rdV0g1tIMDzDLrhU/fofuFyx9Hb7PSFqj4PUc5evd7rn+yqc3na
         X9PJbSVUQtKaGdY99MQXs42EQ9adPT0REmKdbrSCgl+LJUwczu3oXgP8Rs3EhEReVDrN
         cUSpZ0EU5nmkXnm5k+04yxyUveqWThCf765+qiDIOOpaeQWrjzASw0+i1siirkr1PJqL
         fmYJxo6mnzptX2otjiYW1Ph6v68zrtwdTwyJpXMqa7NOl6r2A+5RcuSINOQ0iQCpvdw8
         XGXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9wRP5DLkWCzCh+T0vNbWrMthPSfCeaaDqG66jAHUycU=;
        b=Rp7ChwEjJwbuMTCNbIKPfGc6QluLxvNhSfOQNtLTrFN0PFJYrOf2CRSGwsyHmKV2KY
         tZBFODtdvfUL2ZECEk6UnWU+TFVPyFaKuOh3epvp3ST2EL6TQ3h5Ozn7FOMC/z5nAttb
         AwjC3HDe6LnRvYJ9OHR4G/AZbbQv1cEjAz9zMnZJlXDOFBkxL0woMSJpGb/330V3flYi
         FdCoXaAz2mhORA+aoTCt7RzdjHTVtQx+VZ+ck9TRP84L0btVsJD3+01Rasz/CHRW7XAw
         6J77nBZEfy5nkMrVTCI3ZYxe3s8vYqK3WSCfqvGVgJj4BnyIOrqEpYjURY//9wB/gkat
         9OUg==
X-Gm-Message-State: AOAM531fFC7EH/wBM1ZGjxlvfS3p84YjBLwBzrEphqIUWzEBJNMTRp2y
        y/MVdG0vk2szOyZNI1NVV30X
X-Google-Smtp-Source: ABdhPJzWfqoO2VFDQJVcOdJZFhkDWr/ysdgBxSmrvlzxJdQ75+KKIh6Ba13mZ2WtX9WUuv3N+LesNw==
X-Received: by 2002:a17:902:ec83:b029:e3:ec1f:9dfe with SMTP id x3-20020a170902ec83b02900e3ec1f9dfemr18714579plg.59.1614188572140;
        Wed, 24 Feb 2021 09:42:52 -0800 (PST)
Received: from work ([103.66.79.25])
        by smtp.gmail.com with ESMTPSA id p26sm3553361pfn.127.2021.02.24.09.42.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 24 Feb 2021 09:42:51 -0800 (PST)
Date:   Wed, 24 Feb 2021 23:12:48 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Jeffrey Hugo <jhugo@codeaurora.org>
Cc:     hemantk@codeaurora.org, bbhatt@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: core: Sanity check values from remote
 device before use
Message-ID: <20210224174248.GY27945@work>
References: <1613578822-18614-1-git-send-email-jhugo@codeaurora.org>
 <20210224094749.GP27945@work>
 <4745a9eb-0690-3f19-1046-5032ac9482dc@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4745a9eb-0690-3f19-1046-5032ac9482dc@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Wed, Feb 24, 2021 at 08:10:06AM -0700, Jeffrey Hugo wrote:
> On 2/24/2021 2:47 AM, Manivannan Sadhasivam wrote:
> > On Wed, Feb 17, 2021 at 09:20:22AM -0700, Jeffrey Hugo wrote:
> > > When parsing the structures in the shared memory, there are values which
> > > come from the remote device.  For example, a transfer completion event
> > > will have a pointer to the tre in the relevant channel's transfer ring.
> > > Such values should be considered to be untrusted, and validated before
> > > use.  If we blindly use such values, we may access invalid data or crash
> > > if the values are corrupted.
> > > 
> > > If validation fails, drop the relevant event.
> > > 
> > > Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > ---
> > > 
> > > v2: Fix subject
> > > 
> > >   drivers/bus/mhi/core/main.c | 81 +++++++++++++++++++++++++++++++++++++++++----
> > >   1 file changed, 74 insertions(+), 7 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index c043574..1eb2fd3 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -242,6 +242,11 @@ static void mhi_del_ring_element(struct mhi_controller *mhi_cntrl,
> > >   	smp_wmb();
> > >   }
> > > +static bool is_valid_ring_ptr(struct mhi_ring *ring, dma_addr_t addr)
> > > +{
> > > +	return addr >= ring->iommu_base && addr < ring->iommu_base + ring->len;
> > > +}
> > > +
> > >   int mhi_destroy_device(struct device *dev, void *data)
> > >   {
> > >   	struct mhi_device *mhi_dev;
> > > @@ -383,7 +388,16 @@ irqreturn_t mhi_irq_handler(int irq_number, void *dev)
> > >   	struct mhi_event_ctxt *er_ctxt =
> > >   		&mhi_cntrl->mhi_ctxt->er_ctxt[mhi_event->er_index];
> > >   	struct mhi_ring *ev_ring = &mhi_event->ring;
> > > -	void *dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> > > +	dma_addr_t ptr = er_ctxt->rp;
> > > +	void *dev_rp;
> > > +
> > > +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
> > > +		dev_err(&mhi_cntrl->mhi_dev->dev,
> > > +			"Event ring rp points outside of the event ring\n");
> > > +		return IRQ_HANDLED;
> > > +	}
> > > +
> > > +	dev_rp = mhi_to_virtual(ev_ring, ptr);
> > >   	/* Only proceed if event ring has pending events */
> > >   	if (ev_ring->rp == dev_rp)
> > > @@ -536,6 +550,11 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
> > >   		struct mhi_buf_info *buf_info;
> > >   		u16 xfer_len;
> > > +		if (!is_valid_ring_ptr(tre_ring, ptr)) {
> > > +			dev_err(&mhi_cntrl->mhi_dev->dev,
> > > +				"Event element points outside of the tre ring\n");
> > > +			break;
> > > +		}
> > >   		/* Get the TRB this event points to */
> > >   		ev_tre = mhi_to_virtual(tre_ring, ptr);
> > > @@ -695,6 +714,12 @@ static void mhi_process_cmd_completion(struct mhi_controller *mhi_cntrl,
> > >   	struct mhi_chan *mhi_chan;
> > >   	u32 chan;
> > > +	if (!is_valid_ring_ptr(mhi_ring, ptr)) {
> > > +		dev_err(&mhi_cntrl->mhi_dev->dev,
> > > +			"Event element points outside of the cmd ring\n");
> > > +		return;
> > > +	}
> > > +
> > >   	cmd_pkt = mhi_to_virtual(mhi_ring, ptr);
> > >   	chan = MHI_TRE_GET_CMD_CHID(cmd_pkt);
> > > @@ -719,6 +744,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
> > >   	struct device *dev = &mhi_cntrl->mhi_dev->dev;
> > >   	u32 chan;
> > >   	int count = 0;
> > > +	dma_addr_t ptr = er_ctxt->rp;
> > >   	/*
> > >   	 * This is a quick check to avoid unnecessary event processing
> > > @@ -728,7 +754,13 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
> > >   	if (unlikely(MHI_EVENT_ACCESS_INVALID(mhi_cntrl->pm_state)))
> > >   		return -EIO;
> > > -	dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> > > +	if (!is_valid_ring_ptr(ev_ring, ptr)) {
> > > +		dev_err(&mhi_cntrl->mhi_dev->dev,
> > > +			"Event ring rp points outside of the event ring\n");
> > > +		return -EIO;
> > > +	}
> > > +
> > > +	dev_rp = mhi_to_virtual(ev_ring, ptr);
> > >   	local_rp = ev_ring->rp;
> > >   	while (dev_rp != local_rp) {
> > > @@ -834,6 +866,8 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
> > >   			 */
> > >   			if (chan < mhi_cntrl->max_chan) {
> > >   				mhi_chan = &mhi_cntrl->mhi_chan[chan];
> > > +				if (!mhi_chan->configured)
> > > +					break;
> > 
> > This change is not part of this patch I believe.
> 
> It is.  The remote device specified an event on a channel.  We already check
> to see that the specified channel value doesn't exceed the maximum number of
> channels, but we don't check to see that it is a valid channel within the
> range of channels.  If its not a valid channel (say 0-5 and 7-10 are valid,
> max is 10, but the remote end specified 6), bad things could happen because
> we are implicitly trusting the value before fully checking its validity.
> 
> This is still a sanity check of a value from the remote end.
> 

Okay. Please mention it in the commit message. Currently it mentions
only the tre pointer.

Thanks,
Mani

> -- 
> Jeffrey Hugo
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
