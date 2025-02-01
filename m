Return-Path: <linux-arm-msm+bounces-46664-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D74EDA24B4A
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 18:48:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 614933A275C
	for <lists+linux-arm-msm@lfdr.de>; Sat,  1 Feb 2025 17:48:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 72BED1C5D71;
	Sat,  1 Feb 2025 17:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="lHgJ34Ws"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44961BC9FB;
	Sat,  1 Feb 2025 17:48:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738432100; cv=none; b=gol6bPGOIlbXTGaaMhT2OV2pR/nXwsCn7kROp/NoyinvDScVF9S8PtoG9gV5piiza6y3BEL0aOCJnXMUSCRMKkJYr8jykpEibwA13SKN6iYW5hgjZ7co8F4ldwBHwx2LhAo3V+USqucOYaMuPZoqhqlkstyd6AH7vDL1Fc06ZT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738432100; c=relaxed/simple;
	bh=/Aki87UBMnfogFuSIAq4F8RCWeqdXEEThctnE+tHSdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K3XiOcb3tDXCMsXH0pOLcHn7EZbmfZ3KDja8MoDxqqqc6j4739bN8bQaw3ETNNwa3jZc9wlfIGrmR4igMOGKpHj8JdYSpQjfStNv0oCBVkxpb7QVZnLqyQWjPcfVRr42/KiEO/FREIqG+wDv/hgkcmCq60NanknWcq7cbg6y7/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=lHgJ34Ws; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=Content-Type:MIME-Version:Message-ID:Subject:From:Date:From
	:Subject; bh=1AaliKzqS6YE6Kv8D/0AWFat4Y9z0mg+EEQEmJJmlTU=; b=lHgJ34Ws1oSfKF6O
	KM+va9ur8XPtre+IxXaWi9nwyAuzw+fAkAHyE5jP41qpVxnTlOR0h2gYe4P38QOo2RfL36yM4vdSn
	xuYzFOm8GjxwtuHrw2bPmaj7ZwKdabJED2wOvFfoUoOYC142xFeBE1pRT4k1b/DYFi6YTpublNpUR
	slY3oxS6akgjeO6iU4kMXJrZkhYvJ9TFLIp77TQFi99j51VdL48/rphDCQr/75McZMOtGAtjDbzcK
	6B/IOtsVHzf0+XfU6ga0YKL3+mZxYv6K14YPsme9mZoBTn/7fbWsCYTSMzZgK0uM2Axc5S3h3/+XJ
	8CAxz63qz1ezSJKyYA==;
Received: from dg by mx.treblig.org with local (Exim 4.96)
	(envelope-from <dg@treblig.org>)
	id 1teHbG-00D4oE-1G;
	Sat, 01 Feb 2025 17:48:10 +0000
Date: Sat, 1 Feb 2025 17:48:10 +0000
From: "Dr. David Alan Gilbert" <linux@treblig.org>
To: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: Remove unused functions
Message-ID: <Z55eWunU1NRkV2QP@gallifrey>
References: <20250127215859.261105-1-linux@treblig.org>
 <20250201160721.bgfyi3cwilvibl74@thinkpad>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250201160721.bgfyi3cwilvibl74@thinkpad>
X-Chocolate: 70 percent or better cocoa solids preferably
X-Operating-System: Linux/6.1.0-21-amd64 (x86_64)
X-Uptime: 17:47:43 up 269 days,  5:01,  1 user,  load average: 0.07, 0.03,
 0.01
User-Agent: Mutt/2.2.12 (2023-09-09)

* Manivannan Sadhasivam (manivannan.sadhasivam@linaro.org) wrote:
> On Mon, Jan 27, 2025 at 09:58:59PM +0000, linux@treblig.org wrote:
> > From: "Dr. David Alan Gilbert" <linux@treblig.org>
> > 
> 
> Subject prefix should be:
> 
> 'bus: mhi: host:"

Ah, do you need me to post a v2 for that?
> 
> > mhi_device_get() and mhi_queue_dma() haven't been used since 2020's
> > commit 189ff97cca53 ("bus: mhi: core: Add support for data transfer")
> > added them.
> > 
> > Remove them.
> > 
> > Note that mhi_queue_dma_sync() is used and has been left.
> > 
> > Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
> 
> Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,

Dave

> - Mani
> 
> > ---
> >  drivers/bus/mhi/host/main.c | 19 -------------------
> >  drivers/bus/mhi/host/pm.c   | 14 --------------
> >  include/linux/mhi.h         | 18 ------------------
> >  3 files changed, 51 deletions(-)
> > 
> > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > index 4de75674f193..4c91ffd6ed0e 100644
> > --- a/drivers/bus/mhi/host/main.c
> > +++ b/drivers/bus/mhi/host/main.c
> > @@ -1181,25 +1181,6 @@ int mhi_queue_skb(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> >  }
> >  EXPORT_SYMBOL_GPL(mhi_queue_skb);
> >  
> > -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> > -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags)
> > -{
> > -	struct mhi_chan *mhi_chan = (dir == DMA_TO_DEVICE) ? mhi_dev->ul_chan :
> > -							     mhi_dev->dl_chan;
> > -	struct mhi_buf_info buf_info = { };
> > -
> > -	buf_info.p_addr = mhi_buf->dma_addr;
> > -	buf_info.cb_buf = mhi_buf;
> > -	buf_info.pre_mapped = true;
> > -	buf_info.len = len;
> > -
> > -	if (unlikely(mhi_chan->pre_alloc))
> > -		return -EINVAL;
> > -
> > -	return mhi_queue(mhi_dev, &buf_info, dir, mflags);
> > -}
> > -EXPORT_SYMBOL_GPL(mhi_queue_dma);
> > -
> >  int mhi_gen_tre(struct mhi_controller *mhi_cntrl, struct mhi_chan *mhi_chan,
> >  			struct mhi_buf_info *info, enum mhi_flags flags)
> >  {
> > diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> > index 11c0e751f223..2fb27e6f8f88 100644
> > --- a/drivers/bus/mhi/host/pm.c
> > +++ b/drivers/bus/mhi/host/pm.c
> > @@ -1296,20 +1296,6 @@ int mhi_force_rddm_mode(struct mhi_controller *mhi_cntrl)
> >  }
> >  EXPORT_SYMBOL_GPL(mhi_force_rddm_mode);
> >  
> > -void mhi_device_get(struct mhi_device *mhi_dev)
> > -{
> > -	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> > -
> > -	mhi_dev->dev_wake++;
> > -	read_lock_bh(&mhi_cntrl->pm_lock);
> > -	if (MHI_PM_IN_SUSPEND_STATE(mhi_cntrl->pm_state))
> > -		mhi_trigger_resume(mhi_cntrl);
> > -
> > -	mhi_cntrl->wake_get(mhi_cntrl, true);
> > -	read_unlock_bh(&mhi_cntrl->pm_lock);
> > -}
> > -EXPORT_SYMBOL_GPL(mhi_device_get);
> > -
> >  int mhi_device_get_sync(struct mhi_device *mhi_dev)
> >  {
> >  	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> > diff --git a/include/linux/mhi.h b/include/linux/mhi.h
> > index 059dc94d20bb..dd372b0123a6 100644
> > --- a/include/linux/mhi.h
> > +++ b/include/linux/mhi.h
> > @@ -720,12 +720,6 @@ enum mhi_state mhi_get_mhi_state(struct mhi_controller *mhi_cntrl);
> >   */
> >  void mhi_soc_reset(struct mhi_controller *mhi_cntrl);
> >  
> > -/**
> > - * mhi_device_get - Disable device low power mode
> > - * @mhi_dev: Device associated with the channel
> > - */
> > -void mhi_device_get(struct mhi_device *mhi_dev);
> > -
> >  /**
> >   * mhi_device_get_sync - Disable device low power mode. Synchronously
> >   *                       take the controller out of suspended state
> > @@ -776,18 +770,6 @@ int mhi_prepare_for_transfer_autoqueue(struct mhi_device *mhi_dev);
> >   */
> >  void mhi_unprepare_from_transfer(struct mhi_device *mhi_dev);
> >  
> > -/**
> > - * mhi_queue_dma - Send or receive DMA mapped buffers from client device
> > - *                 over MHI channel
> > - * @mhi_dev: Device associated with the channels
> > - * @dir: DMA direction for the channel
> > - * @mhi_buf: Buffer for holding the DMA mapped data
> > - * @len: Buffer length
> > - * @mflags: MHI transfer flags used for the transfer
> > - */
> > -int mhi_queue_dma(struct mhi_device *mhi_dev, enum dma_data_direction dir,
> > -		  struct mhi_buf *mhi_buf, size_t len, enum mhi_flags mflags);
> > -
> >  /**
> >   * mhi_queue_buf - Send or receive raw buffers from client device over MHI
> >   *                 channel
> > -- 
> > 2.48.1
> > 
> 
> -- 
> மணிவண்ணன் சதாசிவம்
-- 
 -----Open up your eyes, open up your mind, open up your code -------   
/ Dr. David Alan Gilbert    |       Running GNU/Linux       | Happy  \ 
\        dave @ treblig.org |                               | In Hex /
 \ _________________________|_____ http://www.treblig.org   |_______/

