Return-Path: <linux-arm-msm+bounces-65537-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 92879B092FA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 19:15:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 733BF174B5E
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 17:14:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 74A9A2FD5AC;
	Thu, 17 Jul 2025 17:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D+6UfiwC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34D402FCE3F;
	Thu, 17 Jul 2025 17:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752772476; cv=none; b=j4c05+iPGvxRLTxNcbbeTFQKd4PNsBj4h4ge29oyY9mziuki0Hsqj224rZ2hq8cSnKWBLkyJZIXdgJu3Gj6BAlCjFnfSYm3mn4Q00ddVeZMLoFWeXP9oAY1xRG/KzB8kfiLNh3A4svPdclJO80TbgRQ8C3hhVRf3AGouUVyvu+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752772476; c=relaxed/simple;
	bh=gPsTFWPofyzeCDanP9i0nnmFrp0vvZOOv01/QAIVnao=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=vBsQjjExc5LPR5RJrrsNBz4BAIkbbHjsxQy6bgoJMw2eozmjvyNCCwdt/hTNrwWPbHwVWLxByBxrnZDBLpT9dZ0m1AuDF6r0twB3Jn8k8/rydx2zrQ5PRyJ2E4Ni8qOclpPsjGEs3p8mCsYAatzwQPe1nV/aY1HZgqs/+z4lM5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D+6UfiwC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36D05C4CEE3;
	Thu, 17 Jul 2025 17:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752772475;
	bh=gPsTFWPofyzeCDanP9i0nnmFrp0vvZOOv01/QAIVnao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D+6UfiwC32xr7W6UjsheTcLNcXAGHbCwp3l6+lTzM6Zww1FfYdYL7uY+sQhjcc1L9
	 NRIIa9El+BxeFOgq7Yjljb8qEl87g48UFkBI4KrRtEa8Kg1WCrXZTF6hy2eSyVjP1d
	 pt4aAn9UQp56a+3TGJDW/xHpLyP3dz4GxCXGp6o5GBr++iTNPXIemJZUngl3YK4uh2
	 kso6S5XKOkrRvzOXq883vxyGVatzXKydybNQUyf3I/D7uS0ZxksTIzRH88LA9aJskF
	 UqV3cuNTigZ3PGozy7vK38GoEufTd+MIAbbvL5OkQvqjlCVViGpSITztU47c41x/Kh
	 tY2+30GyG2WDw==
Date: Thu, 17 Jul 2025 22:44:26 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Akhil Vinod <quic_akhvin@quicinc.com>
Cc: Sumit Kumar <quic_sumk@quicinc.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_skananth@quicinc.com, 
	quic_vbadigan@quicinc.com, Sumit Kumar <sumk@qti.qualcomm.com>, stable@vger.kernel.org, 
	Akhil Vinod <akhvin@qti.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: ep: Fix chained transfer handling in read path
Message-ID: <5ij32zdni7pei3xfpxsq6fvaghb3pdfs2fznickutqjysip3k4@kldf7h6e3qc4>
References: <20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com>
 <5aqtqicbtlkrqbiw2ba7kkgwrmsuqx2kjukh2tavfihm5hq5ry@gdeqegayfh77>
 <7c833565-0e7b-4004-b691-37bd07ce6abe@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c833565-0e7b-4004-b691-37bd07ce6abe@quicinc.com>

On Thu, Jul 17, 2025 at 10:18:54PM GMT, Akhil Vinod wrote:
> 
> On 7/16/2025 12:10 PM, Manivannan Sadhasivam wrote:
> > On Wed, Jul 09, 2025 at 04:03:17PM GMT, Sumit Kumar wrote:
> > > From: Sumit Kumar <sumk@qti.qualcomm.com>
> > > 
> > > The current implementation of mhi_ep_read_channel, in case of chained
> > > transactions, assumes the End of Transfer(EOT) bit is received with the
> > > doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
> > > beyond wr_offset during host-to-device transfers when EOT has not yet
> > > arrived. This can lead to access of unmapped host memory, causing
> > > IOMMU faults and processing of stale TREs.
> > > 
> > > This change modifies the loop condition to ensure rd_offset remains behind
> > > wr_offset, allowing the function to process only valid TREs up to the
> > > current write pointer. This prevents premature reads and ensures safe
> > > traversal of chained TREs.
> > > 
> > > Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
> > > Cc: stable@vger.kernel.org
> > > Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> > > Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> > > Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
> > > ---
> > >   drivers/bus/mhi/ep/main.c | 2 +-
> > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > 
> > > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> > > index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..2e134f44952d1070c62c24aeca9effc7fd325860 100644
> > > --- a/drivers/bus/mhi/ep/main.c
> > > +++ b/drivers/bus/mhi/ep/main.c
> > > @@ -468,7 +468,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
> > >   			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
> > >   		}
> > > -	} while (buf_left && !tr_done);
> > > +	} while (buf_left && !tr_done && mhi_chan->rd_offset != ring->wr_offset);
> > You should use mhi_ep_queue_is_empty() for checking the available elements to
> > process. And with this check in place, the existing check in
> > mhi_ep_process_ch_ring() becomes redundant.
> > 
> > - Mani
> 
> Yes, agreed that the check can be replaced with the mhi_ep_queue_is_empty, but the existing
> check in mhi_ep_process_ch_ring() is still necessary because there can be a case where
> there are multiple chained transactions in the ring.
> 
> Example: The ring at the time mhi_ep_read_channel is executing may look like:
> chained | chained |  EOT#1 | chained | chained | EOT#2
> If we remove the check from mhi_ep_process_ch_ring, we bail out of the first transaction itself
> and the remaining packets won't be processed. mhi_ep_read_channel in its current form is designed
> for a single MHI packet only.
> 

Then you should ignore the EOT flag by removing '!tr_done' check and just check
for buf_left and mhi_ep_process_ch_ring(). Having the same check in caller and
callee doesn't make sense.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

