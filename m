Return-Path: <linux-arm-msm+bounces-2278-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E90D77FBBA4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 14:33:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A441028270C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Nov 2023 13:33:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 53E0D58AB0;
	Tue, 28 Nov 2023 13:33:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OfuRN5v7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353C05578E;
	Tue, 28 Nov 2023 13:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4029EC433C8;
	Tue, 28 Nov 2023 13:32:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701178379;
	bh=rVPeT5nmw8qQQiIaFmZSBajpfC/FLGYEM+kVR8C6eHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OfuRN5v73BRdDwtDvjVqEUkAx+rPfYn3oODDhKDz0wCkZ0zFl69z2eutxwvQFVs7C
	 Mv92SCFYOLddDui4lzfsEeyOftKENRBdUN/xgoOPwAjXkXW9UevjxziO30/4cYKAu8
	 GcblBt8q280nOqbtevoOV4V5uK8jq4C/hOPK230N/19LtVMBZmoe/XcXHsSGSCRXLZ
	 E6uFiToI0W+CqdbJzCH4LyDd389+WqEBgRJiJyLKFMyzylCPIIiHqSjTb6MZkPgn8z
	 OjMr5p9S3dCjdjlnifW/BrSMLWBxwf9zIAkTOAi8BcmMLPRSHEKNbtsMrBWYevmcyp
	 oulf8qynZq4mw==
Date: Tue, 28 Nov 2023 19:02:52 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v4 2/4] bus: mhi: host: Drop chan lock before queuing
 buffers
Message-ID: <20231128133252.GX3088@thinkpad>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
 <1699939661-7385-3-git-send-email-quic_qianyu@quicinc.com>
 <20231124100403.GA4536@thinkpad>
 <639d6008-bdfa-4b6e-b622-e916003ec908@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <639d6008-bdfa-4b6e-b622-e916003ec908@quicinc.com>

On Mon, Nov 27, 2023 at 03:13:55PM +0800, Qiang Yu wrote:
> 
> On 11/24/2023 6:04 PM, Manivannan Sadhasivam wrote:
> > On Tue, Nov 14, 2023 at 01:27:39PM +0800, Qiang Yu wrote:
> > > Ensure read and write locks for the channel are not taken in succession by
> > > dropping the read lock from parse_xfer_event() such that a callback given
> > > to client can potentially queue buffers and acquire the write lock in that
> > > process. Any queueing of buffers should be done without channel read lock
> > > acquired as it can result in multiple locks and a soft lockup.
> > > 
> > Is this patch trying to fix an existing issue in client drivers or a potential
> > issue in the future drivers?
> > 
> > Even if you take care of disabled channels, "mhi_event->lock" acquired during
> > mhi_mark_stale_events() can cause deadlock, since event lock is already held by
> > mhi_ev_task().
> > 
> > I'd prefer not to open the window unless this patch is fixing a real issue.
> > 
> > - Mani
> In [PATCH v4 1/4] bus: mhi: host: Add spinlock to protect WP access when
> queueing
> TREs,  we add
> write_lock_bh(&mhi_chan->lock)/write_unlock_bh(&mhi_chan->lock)
> in mhi_gen_tre, which may be invoked as part of mhi_queue in client xfer
> callback,
> so we have to use read_unlock_bh(&mhi_chan->lock) here to avoid acquiring
> mhi_chan->lock
> twice.
> 
> Sorry for confusing you. Do you think we need to sqush this two patch into
> one?

Well, if patch 1 is introducing a potential deadlock, then we should fix patch
1 itself and not introduce a follow up patch.

But there is one more issue that I pointed out in my previous reply.

Also, I'm planning to cleanup the locking mess within MHI in the coming days.
Perhaps we can revisit this series at that point of time. Will that be OK for
you?

- Mani

> > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > ---
> > >   drivers/bus/mhi/host/main.c | 4 ++++
> > >   1 file changed, 4 insertions(+)
> > > 
> > > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > > index 6c6d253..c4215b0 100644
> > > --- a/drivers/bus/mhi/host/main.c
> > > +++ b/drivers/bus/mhi/host/main.c
> > > @@ -642,6 +642,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
> > >   			mhi_del_ring_element(mhi_cntrl, tre_ring);
> > >   			local_rp = tre_ring->rp;
> > > +			read_unlock_bh(&mhi_chan->lock);
> > > +
> > >   			/* notify client */
> > >   			mhi_chan->xfer_cb(mhi_chan->mhi_dev, &result);
> > > @@ -667,6 +669,8 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
> > >   					kfree(buf_info->cb_buf);
> > >   				}
> > >   			}
> > > +
> > > +			read_lock_bh(&mhi_chan->lock);
> > >   		}
> > >   		break;
> > >   	} /* CC_EOT */
> > > -- 
> > > 2.7.4
> > > 
> > > 
> 

-- 
மணிவண்ணன் சதாசிவம்

