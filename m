Return-Path: <linux-arm-msm+bounces-3614-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 274B78080F1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 07:44:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D3191281A9B
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 06:43:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6CD7012B68;
	Thu,  7 Dec 2023 06:43:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FGCUCUWc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A8327E8;
	Thu,  7 Dec 2023 06:43:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5281EC433C8;
	Thu,  7 Dec 2023 06:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701931438;
	bh=sksjh5ChWPYyf6bJcZNzXZ+iAfli+dlUwRYAmrfj+b4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGCUCUWcJvKOTVj4/UhBQV3+duLk5NBfUf+iBvA/pGMddZAWUFejwRoenQGTdiFB8
	 jh3kowD1Pnm6Y/BuPrZuLzUM/0IlVy4VxiTCRJYLj0ZboHlug/kXfpOlUJWlck0nc0
	 lAwwqhESwBEk9co5FBp8wS9GfL7tgr2LVcOAf40ZTi7kWsH0PFu7/JqOv9KLj1s6vZ
	 tT5z1tgp5f2gxpJrq3BF/kxMEDeUphwCHrjd5XhLNqO00heAon9kWeCm56H6dICLqw
	 rTYxrnUaXEv+iy4TyvAorx8f4EaB2h8mCYjBV+SyYGi6V4qFADgQ2aD01PUZqQIURi
	 SIQ3TfWsrZIXQ==
Date: Thu, 7 Dec 2023 12:13:47 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: quic_jhugo@quicinc.com, mhi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	quic_cang@quicinc.com, quic_mrana@quicinc.com
Subject: Re: [PATCH v4 2/4] bus: mhi: host: Drop chan lock before queuing
 buffers
Message-ID: <20231207064347.GE2932@thinkpad>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
 <1699939661-7385-3-git-send-email-quic_qianyu@quicinc.com>
 <20231124100403.GA4536@thinkpad>
 <639d6008-bdfa-4b6e-b622-e916003ec908@quicinc.com>
 <20231128133252.GX3088@thinkpad>
 <5eb0a521-0b72-4d15-9a65-429c4c123833@quicinc.com>
 <20231130053157.GB3043@thinkpad>
 <9873ee7b-7ef1-4327-8e22-49e1cd3872f1@quicinc.com>
 <20231206134848.GG12802@thinkpad>
 <947af144-e2a2-49bc-9f39-31f6ee5b1aa1@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <947af144-e2a2-49bc-9f39-31f6ee5b1aa1@quicinc.com>

On Thu, Dec 07, 2023 at 01:27:19PM +0800, Qiang Yu wrote:
> 
> On 12/6/2023 9:48 PM, Manivannan Sadhasivam wrote:
> > On Wed, Dec 06, 2023 at 10:25:12AM +0800, Qiang Yu wrote:
> > > On 11/30/2023 1:31 PM, Manivannan Sadhasivam wrote:
> > > > On Wed, Nov 29, 2023 at 11:29:07AM +0800, Qiang Yu wrote:
> > > > > On 11/28/2023 9:32 PM, Manivannan Sadhasivam wrote:
> > > > > > On Mon, Nov 27, 2023 at 03:13:55PM +0800, Qiang Yu wrote:
> > > > > > > On 11/24/2023 6:04 PM, Manivannan Sadhasivam wrote:
> > > > > > > > On Tue, Nov 14, 2023 at 01:27:39PM +0800, Qiang Yu wrote:
> > > > > > > > > Ensure read and write locks for the channel are not taken in succession by
> > > > > > > > > dropping the read lock from parse_xfer_event() such that a callback given
> > > > > > > > > to client can potentially queue buffers and acquire the write lock in that
> > > > > > > > > process. Any queueing of buffers should be done without channel read lock
> > > > > > > > > acquired as it can result in multiple locks and a soft lockup.
> > > > > > > > > 
> > > > > > > > Is this patch trying to fix an existing issue in client drivers or a potential
> > > > > > > > issue in the future drivers?
> > > > > > > > 
> > > > > > > > Even if you take care of disabled channels, "mhi_event->lock" acquired during
> > > > > > > > mhi_mark_stale_events() can cause deadlock, since event lock is already held by
> > > > > > > > mhi_ev_task().
> > > > > > > > 
> > > > > > > > I'd prefer not to open the window unless this patch is fixing a real issue.
> > > > > > > > 
> > > > > > > > - Mani
> > > > > > > In [PATCH v4 1/4] bus: mhi: host: Add spinlock to protect WP access when
> > > > > > > queueing
> > > > > > > TREs,  we add
> > > > > > > write_lock_bh(&mhi_chan->lock)/write_unlock_bh(&mhi_chan->lock)
> > > > > > > in mhi_gen_tre, which may be invoked as part of mhi_queue in client xfer
> > > > > > > callback,
> > > > > > > so we have to use read_unlock_bh(&mhi_chan->lock) here to avoid acquiring
> > > > > > > mhi_chan->lock
> > > > > > > twice.
> > > > > > > 
> > > > > > > Sorry for confusing you. Do you think we need to sqush this two patch into
> > > > > > > one?
> > > > > > Well, if patch 1 is introducing a potential deadlock, then we should fix patch
> > > > > > 1 itself and not introduce a follow up patch.
> > > > > > 
> > > > > > But there is one more issue that I pointed out in my previous reply.
> > > > > Sorry, I can not understand why "mhi_event->lock" acquired during
> > > > > mhi_mark_stale_events() can cause deadlock. In mhi_ev_task(), we will
> > > > > not invoke mhi_mark_stale_events(). Can you provide some interpretation?
> > > > Going by your theory that if a channel gets disabled while processing the event,
> > > > the process trying to disable the channel will try to acquire "mhi_event->lock"
> > > > which is already held by the process processing the event.
> > > > 
> > > > - Mani
> > > OK, I get you. Thank you for kind explanation. Hopefully I didn't intrude
> > > too much.
> > Not at all. Btw, did you actually encounter any issue that this patch is trying
> > to fix? Or just fixing based on code inspection.
> > 
> > - Mani
> Yes, we actually meet the race issue in downstream driver. But I can not
> find more details about the issue.

Hmm. I think it is OK to accept this patch and ignore the channel disabling
concern since the event lock is in place to prevent that. There would be no
deadlock as I mentioned above, since the process that is parsing the xfer event
is not the one that is going to disable the channel in parallel.

Could you please respin this series dropping patch 3/4 and also addressing the
issue I mentioned in patch 4/4?

- Mani

-- 
மணிவண்ணன் சதாசிவம்

