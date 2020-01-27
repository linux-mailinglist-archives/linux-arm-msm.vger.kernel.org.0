Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 11743149F22
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 08:11:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725763AbgA0HLc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 02:11:32 -0500
Received: from mail.kernel.org ([198.145.29.99]:56592 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726036AbgA0HLb (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 02:11:31 -0500
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4C5B6214AF;
        Mon, 27 Jan 2020 07:11:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1580109090;
        bh=Z4quzQOmxy7Q13G5xB6KsGd8Bk/RywRiHRB6BVR6Faw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=AvYn+Kg3MrQ33cMfvzzc1WuFEh5qbgJxUJM7cAhXLsCGzJ65K8SP8P4ck/GNuqU0W
         uBrgIQl+rmjK5xknMxmiCgE04iJuftPDPSiQBYeQ1LZyewp/aHrcJWeZGHQBEFwItr
         t7YNvyplv8zzEbvI/S2Q63IqIkeprEAHGWnsDP7k=
Date:   Mon, 27 Jan 2020 08:11:28 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     jhugo@codeaurora.org, arnd@arndb.de, smohanad@codeaurora.org,
        kvalo@codeaurora.org, bjorn.andersson@linaro.org,
        hemantk@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 02/16] bus: mhi: core: Add support for registering MHI
 controllers
Message-ID: <20200127071128.GA279449@kroah.com>
References: <20200123111836.7414-1-manivannan.sadhasivam@linaro.org>
 <20200123111836.7414-3-manivannan.sadhasivam@linaro.org>
 <20200124082939.GA2921617@kroah.com>
 <42c79181-9d97-3542-c6b0-1e37f9b2ff39@codeaurora.org>
 <20200127070252.GA4768@mani>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200127070252.GA4768@mani>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Mon, Jan 27, 2020 at 12:32:52PM +0530, Manivannan Sadhasivam wrote:
> > > > +	void __iomem *regs;
> > > > +	dma_addr_t iova_start;
> > > > +	dma_addr_t iova_stop;
> > > > +	const char *fw_image;
> > > > +	const char *edl_image;
> > > > +	bool fbc_download;
> > > > +	size_t sbl_size;
> > > > +	size_t seg_len;
> > > > +	u32 max_chan;
> > > > +	struct mhi_chan *mhi_chan;
> > > > +	struct list_head lpm_chans;
> > > > +	u32 total_ev_rings;
> > > > +	u32 hw_ev_rings;
> > > > +	u32 sw_ev_rings;
> > > > +	u32 nr_irqs_req;
> > > > +	u32 nr_irqs;
> > > > +	int *irq;
> > > > +
> > > > +	struct mhi_event *mhi_event;
> > > > +	struct mhi_cmd *mhi_cmd;
> > > > +	struct mhi_ctxt *mhi_ctxt;
> > > > +
> > > > +	u32 timeout_ms;
> > > > +	struct mutex pm_mutex;
> > > > +	bool pre_init;
> > > > +	rwlock_t pm_lock;
> > > > +	u32 pm_state;
> > > > +	u32 db_access;
> > > > +	enum mhi_ee_type ee;
> > > > +	bool wake_set;
> > > > +	atomic_t dev_wake;
> > > > +	atomic_t alloc_size;
> > > > +	atomic_t pending_pkts;
> > > 
> > > Why a bunch of atomic variables when you already have a lock?
> > > 
> 
> So there are multiple locks used throughout the MHI stack and each one
> servers its own purpose. For instance, pm_lock protects againt the
> concurrent access to the PM state, transition_lock protects against the
> concurrent access to the state transition list, wlock protects against
> the concurrent access to device wake state. Since there are multiple
> worker threads and each trying to update these variables, we did the
> best to protect against the race condition by having all these locks.
> 
> And there are these atomic variables which are again shared with the
> threads holding the above locks, precisely with threads holding read locks.
> So it becomes convenient to just use the atomic_ APIs to update these variables.

An atomic_ api is almost as heavy as a "normal" lock, so while you might
think it is convenient, it's odd that you feel it is needed.  As an
example, "wake_set" and "dev_wake" look like they are happening at the
same time, yet one is going to be held with a lock and the other one
updated without one?

Anyway, I'll leave this alone, let's see what your next round looks
like...

greg k-h
