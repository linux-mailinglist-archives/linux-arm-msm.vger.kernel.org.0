Return-Path: <linux-arm-msm+bounces-2646-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A197C7FE8B5
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 06:32:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D39451C20D47
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 Nov 2023 05:32:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B98BF179BC;
	Thu, 30 Nov 2023 05:32:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nzCN1zJV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E13A1802D;
	Thu, 30 Nov 2023 05:32:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151AFC433C7;
	Thu, 30 Nov 2023 05:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701322325;
	bh=pMAZRD6C2KxJP4HEAtpAIDxbTaSlvGsc71rh/SQWRtU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nzCN1zJVSMh+g5X7qRKecWziuXOdWr00FRIYi06EW39LWAwKZx05wqoCY3qOBN+FI
	 rQUnlYiDyKD9a22jXTQtSUBuGXxEmyuBWzZTFv+e7jwBPyI5Qe1Nrk+/o1WVjpL4uX
	 pmPh7lSAAQ80/hn/AhNV9ezx+cZYrnDeAh0ifTa6npt+0Ka6SDakf5SBrKTYnTC7u5
	 YPfn6eRwh4GVevufSN/gXUaw3bIBXFcoNWM2tBonHNxnmVUJiqKUl1A5IQTD9COAEL
	 3NPPQDKNiWlINy8sljZrtPDqJG7/3ulyf92erDT42KHQbXFlD06+WWiS7ACC3gp76r
	 T/x+mREHM8E3Q==
Date: Thu, 30 Nov 2023 11:01:57 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, quic_jhugo@quicinc.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	quic_mrana@quicinc.com
Subject: Re: [PATCH v4 2/4] bus: mhi: host: Drop chan lock before queuing
 buffers
Message-ID: <20231130053157.GB3043@thinkpad>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
 <1699939661-7385-3-git-send-email-quic_qianyu@quicinc.com>
 <20231124100403.GA4536@thinkpad>
 <639d6008-bdfa-4b6e-b622-e916003ec908@quicinc.com>
 <20231128133252.GX3088@thinkpad>
 <5eb0a521-0b72-4d15-9a65-429c4c123833@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5eb0a521-0b72-4d15-9a65-429c4c123833@quicinc.com>

On Wed, Nov 29, 2023 at 11:29:07AM +0800, Qiang Yu wrote:
> 
> On 11/28/2023 9:32 PM, Manivannan Sadhasivam wrote:
> > On Mon, Nov 27, 2023 at 03:13:55PM +0800, Qiang Yu wrote:
> > > On 11/24/2023 6:04 PM, Manivannan Sadhasivam wrote:
> > > > On Tue, Nov 14, 2023 at 01:27:39PM +0800, Qiang Yu wrote:
> > > > > Ensure read and write locks for the channel are not taken in succession by
> > > > > dropping the read lock from parse_xfer_event() such that a callback given
> > > > > to client can potentially queue buffers and acquire the write lock in that
> > > > > process. Any queueing of buffers should be done without channel read lock
> > > > > acquired as it can result in multiple locks and a soft lockup.
> > > > > 
> > > > Is this patch trying to fix an existing issue in client drivers or a potential
> > > > issue in the future drivers?
> > > > 
> > > > Even if you take care of disabled channels, "mhi_event->lock" acquired during
> > > > mhi_mark_stale_events() can cause deadlock, since event lock is already held by
> > > > mhi_ev_task().
> > > > 
> > > > I'd prefer not to open the window unless this patch is fixing a real issue.
> > > > 
> > > > - Mani
> > > In [PATCH v4 1/4] bus: mhi: host: Add spinlock to protect WP access when
> > > queueing
> > > TREs,  we add
> > > write_lock_bh(&mhi_chan->lock)/write_unlock_bh(&mhi_chan->lock)
> > > in mhi_gen_tre, which may be invoked as part of mhi_queue in client xfer
> > > callback,
> > > so we have to use read_unlock_bh(&mhi_chan->lock) here to avoid acquiring
> > > mhi_chan->lock
> > > twice.
> > > 
> > > Sorry for confusing you. Do you think we need to sqush this two patch into
> > > one?
> > Well, if patch 1 is introducing a potential deadlock, then we should fix patch
> > 1 itself and not introduce a follow up patch.
> > 
> > But there is one more issue that I pointed out in my previous reply.
> Sorry, I can not understand why "mhi_event->lock" acquired during
> mhi_mark_stale_events() can cause deadlock. In mhi_ev_task(), we will
> not invoke mhi_mark_stale_events(). Can you provide some interpretation?

Going by your theory that if a channel gets disabled while processing the event,
the process trying to disable the channel will try to acquire "mhi_event->lock"
which is already held by the process processing the event.

- Mani

> > 
> > Also, I'm planning to cleanup the locking mess within MHI in the coming days.
> > Perhaps we can revisit this series at that point of time. Will that be OK for
> > you?
> Sure, that will be great.
> > 
> > - Mani
> > 
> > > > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > > > ---
> > > > >    drivers/bus/mhi/host/main.c | 4 ++++
> > > > >    1 file changed, 4 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > > > > index 6c6d253..c4215b0 100644
> > > > > --- a/drivers/bus/mhi/host/main.c
> > > > > +++ b/drivers/bus/mhi/host/main.c
> > > > > @@ -642,6 +642,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
> > > > >    			mhi_del_ring_element(mhi_cntrl, tre_ring);
> > > > >    			local_rp = tre_ring->rp;
> > > > > +			read_unlock_bh(&mhi_chan->lock);
> > > > > +
> > > > >    			/* notify client */
> > > > >    			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> > > > > @@ -667,6 +669,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
> > > > >    					kfree(buf_info->cb_buf);
> > > > >    				}
> > > > >    			}
> > > > > +
> > > > > +			read_lock_bh(&mhi_chan->lock);
> > > > >    		}
> > > > >    		break;
> > > > >    	} /* CC_EOT */
> > > > > -- 
> > > > > 2.7.4
> > > > > 
> > > > > 
> 

-- 
மணிவண்ணன் சதாசிவம்

