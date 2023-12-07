Return-Path: <linux-arm-msm+bounces-3613-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E238080E1
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 07:39:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 73CAAB20C4A
	for <lists+linux-arm-msm@lfdr.de>; Thu,  7 Dec 2023 06:39:05 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D7301C2E;
	Thu,  7 Dec 2023 06:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CWUHQgh/"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A1E312B68;
	Thu,  7 Dec 2023 06:39:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAE8DC433C8;
	Thu,  7 Dec 2023 06:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701931140;
	bh=oEBuYr2m/+uNNqMOsGkoIUp/xfye7K359HZ6CZXafeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CWUHQgh/Cs7qos5c4D8/jEGRTYGJjaFlBNTygl4+NOn20GgtnwLQU0JHeS5TQ1gJ3
	 VUUF8TS4sbVwQSgekupC2VVt6jnRbxPnLxSbeec10i3vCPz+04j01keJDw0NklLEn/
	 S78TaTT6kgTQVI7/JSJKZEbfPs8sEtMLt0GUJT4v8z+27o/+eKSJN1SYlEoyVygSki
	 0+GYmHdfp91bOb86/1EuRZ+q/xxPqBJpFnGR726BkHKsgKQhM8zzIM1vcpx3ujvnS1
	 81yt4ysFl/BwxTG98vfo9Fz/XExL6BWD3yk7WwcK4AmPfD8sNba4c+Yj2Oe3d5hIa6
	 sao2QRiO6tewg==
Date: Thu, 7 Dec 2023 12:08:51 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Qiang Yu <quic_qianyu@quicinc.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, quic_jhugo@quicinc.com,
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, quic_cang@quicinc.com,
	quic_mrana@quicinc.com, Hemant Kumar <quic_hemantk@quicinc.com>,
	Lazarus Motha <quic_lmotha@quicinc.com>
Subject: Re: [PATCH v4 4/4] bus: mhi: host: Take irqsave lock after TRE is
 generated
Message-ID: <20231207063851.GD2932@thinkpad>
References: <1699939661-7385-1-git-send-email-quic_qianyu@quicinc.com>
 <1699939661-7385-5-git-send-email-quic_qianyu@quicinc.com>
 <20231124100916.GB4536@thinkpad>
 <ae1514d1-1cdf-42f8-ac8c-6e6c2005922f@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ae1514d1-1cdf-42f8-ac8c-6e6c2005922f@quicinc.com>

On Mon, Nov 27, 2023 at 03:19:49PM +0800, Qiang Yu wrote:
> 
> On 11/24/2023 6:09 PM, Manivannan Sadhasivam wrote:
> > On Tue, Nov 14, 2023 at 01:27:41PM +0800, Qiang Yu wrote:
> > > From: Hemant Kumar <quic_hemantk@quicinc.com>
> > > 
> > > If CONFIG_TRACE_IRQFLAGS is enabled, irq will be enabled once __local_bh_
> > > enable_ip is called as part of write_unlock_bh. Hence, let's take irqsave
> > "__local_bh_enable_ip" is a function name, so you should not break it.
> Thanks for let me know, will note this in following patch.
> > 
> > > lock after TRE is generated to avoid running write_unlock_bh when irqsave
> > > lock is held.
> > > 
> > I still don't understand this commit message. Where is the write_unlock_bh()
> > being called?
> > 
> > - Mani
> Write_unlock_bh() is invoked in mhi_gen_te()
> The calling flow is like
> mhi_queue
>     read_lock_irqsave(&mhi_cntrl->pm_lock, flags)
>     mhi_gen_tre
>         write_lock_bh(&mhi_chan->lock)
>         write_unlock_bh(&mhi_chan->lock)   // Will enable irq if
> CONFIG_TRACE_IRQFLAGS is enabled
>     read_lock_irqsave(&mhi_cntrl->pm_lock, flags)
> 
> after adding this patch, the calling flow becomes
> 
> mhi_queue
>     mhi_gen_tre
>         write_lock_bh(&mhi_chan->lock)
>         write_unlock_bh(&mhi_chan->lock)
>     read_lock_irqsave(&mhi_cntrl->pm_lock, flags)
>     read_lock_irqsave(&mhi_cntrl->pm_lock, flags)

So this patch essentially fixes the issue caused by patch 1? If so, this should
be squashed into patch 1.

- Mani

> > 
> > > Signed-off-by: Hemant Kumar <quic_hemantk@quicinc.com>
> > > Signed-off-by: Lazarus Motha <quic_lmotha@quicinc.com>
> > > Signed-off-by: Qiang Yu <quic_qianyu@quicinc.com>
> > > ---
> > >   drivers/bus/mhi/host/main.c | 13 +++++--------
> > >   1 file changed, 5 insertions(+), 8 deletions(-)
> > > 
> > > diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> > > index 33f27e2..d7abd0b 100644
> > > --- a/drivers/bus/mhi/host/main.c
> > > +++ b/drivers/bus/mhi/host/main.c
> > > @@ -1128,17 +1128,15 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
> > >   	if (unlikely(MHI_PM_IN_ERROR_STATE(mhi_cntrl->pm_state)))
> > >   		return -EIO;
> > > -	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
> > > -
> > >   	ret = mhi_is_ring_full(mhi_cntrl, tre_ring);
> > > -	if (unlikely(ret)) {
> > > -		ret = -EAGAIN;
> > > -		goto exit_unlock;
> > > -	}
> > > +	if (unlikely(ret))
> > > +		return -EAGAIN;
> > >   	ret = mhi_gen_tre(mhi_cntrl, mhi_chan, buf_info, mflags);
> > >   	if (unlikely(ret))
> > > -		goto exit_unlock;
> > > +		return ret;
> > > +
> > > +	read_lock_irqsave(&mhi_cntrl->pm_lock, flags);
> > >   	/* Packet is queued, take a usage ref to exit M3 if necessary
> > >   	 * for host->device buffer, balanced put is done on buffer completion
> > > @@ -1158,7 +1156,6 @@ static int mhi_queue(struct mhi_device *mhi_dev, struct mhi_buf_info *buf_info,
> > >   	if (dir == DMA_FROM_DEVICE)
> > >   		mhi_cntrl->runtime_put(mhi_cntrl);
> > > -exit_unlock:
> > >   	read_unlock_irqrestore(&mhi_cntrl->pm_lock, flags);
> > >   	return ret;
> > > -- 
> > > 2.7.4
> > > 
> > > 
> 

-- 
மணிவண்ணன் சதாசிவம்

