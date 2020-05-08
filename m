Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 328CE1CB6AE
	for <lists+linux-arm-msm@lfdr.de>; Fri,  8 May 2020 20:06:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726873AbgEHSG3 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 8 May 2020 14:06:29 -0400
Received: from mail.kernel.org ([198.145.29.99]:50256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726767AbgEHSG2 (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 8 May 2020 14:06:28 -0400
Received: from Mani-XPS-13-9360 (unknown [157.50.42.125])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 861432184D;
        Fri,  8 May 2020 18:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1588961187;
        bh=Llo0ppLHEjiUIwHwXrazLds7Sltj/OckCnhe03ATkO8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rA28MiJPK34JbYbio9amTTVrqvuuNGuG3Z6s3RoUK5yiBrw3LoQ5FKrdZTyRVRZMz
         jo7eaISgFyUWWIIC4qUtOtkGbdh07OaHVJnP4gTc//dOm7LxEL7MtarmquT5vi+hQL
         Rwja0kHcvaI6XeZNzE/hQpW4qvje2f6nVFlm3UTo=
Date:   Fri, 8 May 2020 23:36:18 +0530
From:   Manivannan Sadhasivam <mani@kernel.org>
To:     Hemant Kumar <hemantk@codeaurora.org>
Cc:     Bhaumik Bhatt <bbhatt@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jhugo@codeaurora.org
Subject: Re: [PATCH v6 3/8] bus: mhi: core: Add range check for channel id
 received in event ring
Message-ID: <20200508180618.GA16542@Mani-XPS-13-9360>
References: <1588718832-4891-1-git-send-email-bbhatt@codeaurora.org>
 <1588718832-4891-4-git-send-email-bbhatt@codeaurora.org>
 <20200508054518.GA2696@Mani-XPS-13-9360>
 <82e131f8-8c67-23c3-3ac2-a05eb04d50ba@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <82e131f8-8c67-23c3-3ac2-a05eb04d50ba@codeaurora.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Hi Hemant,

On Fri, May 08, 2020 at 10:34:13AM -0700, Hemant Kumar wrote:
> Hi Mani,
> 
> On 5/7/20 10:45 PM, Manivannan Sadhasivam wrote:
> > On Tue, May 05, 2020 at 03:47:07PM -0700, Bhaumik Bhatt wrote:
> > > From: Hemant Kumar <hemantk@codeaurora.org>
> > > 
> > > MHI data completion handler function reads channel id from event
> > > ring element. Value is under the control of MHI devices and can be
> > > any value between 0 and 255. In order to prevent out of bound access
> > > add a bound check against the max channel supported by controller
> > > and skip processing of that event ring element.
> > > 
> > > Signed-off-by: Hemant Kumar <hemantk@codeaurora.org>
> > > Signed-off-by: Bhaumik Bhatt <bbhatt@codeaurora.org>
> > > Reviewed-by: Jeffrey Hugo <jhugo@codeaurora.org>
> > > ---
> > >   drivers/bus/mhi/core/main.c | 8 ++++++++
> > >   1 file changed, 8 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/core/main.c b/drivers/bus/mhi/core/main.c
> > > index 605640c..e60ab21 100644
> > > --- a/drivers/bus/mhi/core/main.c
> > > +++ b/drivers/bus/mhi/core/main.c
> > > @@ -776,6 +776,9 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
> > >   		case MHI_PKT_TYPE_TX_EVENT:
> > >   			chan = MHI_TRE_GET_EV_CHID(local_rp);
> > >   			mhi_chan = &mhi_cntrl->mhi_chan[chan];
> > 
> > Check should be done before this statement, isn't it?
> my bad. thanks for pointing that out.
> > 
> > > +			if (WARN_ON(chan >= mhi_cntrl->max_chan))
> > > +				goto next_event;
> > > +
> > 
> > I don't prefer using gotos for non exit paths but I don't have a better solution
> > here. But you can try to wrap 'WARN_ON' inside the 'MHI_TRE_GET_EV_CHID'
> > definition and the just use:
> Instead of moving WARN_ON to macro as it requires mhi_cntrl->max_chan to
> compare, how about just adding WARN_ON statement above if condition like
> this
> 
> 		WARN_ON(chan >= mhi_cntrl->max_chan);

Okay.

> 		/*
>  		 * Only process the event ring elements whose channel
> 		 * ID is within the maximum supported range.
> 		 */
>  		if (chan < mhi_cntrl->max_chan) {
>                       	mhi_chan = &mhi_cntrl->mhi_chan[chan];
>                        	parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
>                           	event_quota--;
>  		}
>  		break;
> > 
> > 			/*
> > 			 * Only process the event ring elements whose channel
> > 			 * ID is within the maximum supported range.
> > 			 */
> > 			if (chan < mhi_cntrl->max_chan) {
> >                          	mhi_chan = &mhi_cntrl->mhi_chan[chan];
> >                          	parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
> >                          	event_quota--;
> > 			}
> > 			break;
> > 
> > This looks more clean.
> 
> > 
> > >   			parse_xfer_event(mhi_cntrl, local_rp, mhi_chan);
> > >   			event_quota--;
> > >   			break;
> > > @@ -784,6 +787,7 @@ int mhi_process_ctrl_ev_ring(struct mhi_controller *mhi_cntrl,
> > >   			break;
> > >   		}
> > > +next_event:
> > >   		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
> > >   		local_rp = ev_ring->rp;
> > >   		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> > 
> > So you want the count to get increased for skipped element also?
> yeah idea is to have total count of events processed even if channel id is
> not correct for that event. This fix is a security fix considering that the
> MHI device is considered as non-secured and MHI host is trying
> to continue function normally and just reporting it as warning.
> 

Okay.

> > 
> > Thanks,
> > Mani
> > 
> > > @@ -820,6 +824,9 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
> > >   		enum mhi_pkt_type type = MHI_TRE_GET_EV_TYPE(local_rp);
> > >   		chan = MHI_TRE_GET_EV_CHID(local_rp);
> > > +		if (WARN_ON(chan >= mhi_cntrl->max_chan))
> > > +			goto next_event;
> > > +
> > >   		mhi_chan = &mhi_cntrl->mhi_chan[chan];
> > >   		if (likely(type == MHI_PKT_TYPE_TX_EVENT)) {
> > > @@ -830,6 +837,7 @@ int mhi_process_data_event_ring(struct mhi_controller *mhi_cntrl,
> > >   			event_quota--;
> > >   		}
> > > +next_event:
> > >   		mhi_recycle_ev_ring_element(mhi_cntrl, ev_ring);
> > >   		local_rp = ev_ring->rp;
> > >   		dev_rp = mhi_to_virtual(ev_ring, er_ctxt->rp);
> Even this function has the same goto statement. For consistency i would do
> same thing here as well. Let me know what do you think about above
> suggestion for both functions.

Above looks good to me. So please go ahead.

Thanks,
Mani

> > > -- 
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > a Linux Foundation Collaborative Project
> > > 
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
