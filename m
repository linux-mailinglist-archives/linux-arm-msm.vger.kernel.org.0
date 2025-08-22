Return-Path: <linux-arm-msm+bounces-70365-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A84F7B315B6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 12:47:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DCC587AC95F
	for <lists+linux-arm-msm@lfdr.de>; Fri, 22 Aug 2025 10:46:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E4B572144C9;
	Fri, 22 Aug 2025 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANwI4zu2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF0911DDA15;
	Fri, 22 Aug 2025 10:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755859650; cv=none; b=FQVvvDcy783+aZWI1zk9JcxeIC0p+EsDjEh+qsajUJg/FMtheZipokvih6snF8gezQTahQrZ/lHQZvtRzUTa6khXXyjyzik3mnkHhiYyU5fAaDcUrTM6VALrlycKWGWfa1CWSZfJp8MtCoBQ8O8zcLksK7TFVZCYXnRuoS/kYUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755859650; c=relaxed/simple;
	bh=x3nEl7YU8fusiqvdgY+Aoo7B+7NoOXGHlz8dlI8JQmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElVYRNPN6j/s+ip+fr6AydNInYhRkmcIypc260hDBIoK7egCPQk43zG9JsrMOmXGlaVIEoP029NAXB1M9665xbuwACp9+pFKVgR2qhAT36l1f5SJLl++zJbVJyHxRY+RhefXze2BVwM7bcZQcs+4b5X3aG3nccxuNS5n6FxE5RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANwI4zu2; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7542C4CEED;
	Fri, 22 Aug 2025 10:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755859650;
	bh=x3nEl7YU8fusiqvdgY+Aoo7B+7NoOXGHlz8dlI8JQmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ANwI4zu2hfSzlY4+znK2amjpNcl6+wD+hqy6qleIgHzO4UXZGGKM15Ek96raJx4c7
	 gjAr5tWCw2wMpEIgkVK7lG79IGBSAAAUOi99nm79UKD7LJahQqk8pyzn6GnnpHALy/
	 3LPZ5p93HYJ2mKVI7cvOosIXevh5fnaTNoJPoqwIVMRER+vMrn1uw2o7lXbZhYUbZE
	 WjbzXa+MBjo0XbKe3sjCggb6ZfoQTh2SZ7jAyQfa9Sjp7qFos2pCBl0hIdii0hnFo8
	 X6HNpOAkgrg+3NFHnL1NIPWwnZ5vSU9FmwuMpHipVsKbJKnv1ULDSpITsqSWAjXOG0
	 39dfevQ02B9WA==
Date: Fri, 22 Aug 2025 16:17:15 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <quic_sumk@quicinc.com>
Cc: Akhil Vinod <quic_akhvin@quicinc.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_skananth@quicinc.com, 
	quic_vbadigan@quicinc.com, Sumit Kumar <sumk@qti.qualcomm.com>, stable@vger.kernel.org, 
	Akhil Vinod <akhvin@qti.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: ep: Fix chained transfer handling in read path
Message-ID: <2biqjalas76dxqpho5745tljtxnohgmc2vywd5aavfd4zkqnj3@4eeukkbtxzcj>
References: <20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com>
 <5aqtqicbtlkrqbiw2ba7kkgwrmsuqx2kjukh2tavfihm5hq5ry@gdeqegayfh77>
 <7c833565-0e7b-4004-b691-37bd07ce6abe@quicinc.com>
 <5ij32zdni7pei3xfpxsq6fvaghb3pdfs2fznickutqjysip3k4@kldf7h6e3qc4>
 <ffc65cc4-61d1-49d0-a0b9-9e0101fe029c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ffc65cc4-61d1-49d0-a0b9-9e0101fe029c@quicinc.com>

On Fri, Aug 22, 2025 at 02:20:29PM GMT, Sumit Kumar wrote:
> 
> 
> On 7/17/2025 10:44 PM, Manivannan Sadhasivam wrote:
> > On Thu, Jul 17, 2025 at 10:18:54PM GMT, Akhil Vinod wrote:
> > > 
> > > On 7/16/2025 12:10 PM, Manivannan Sadhasivam wrote:
> > > > On Wed, Jul 09, 2025 at 04:03:17PM GMT, Sumit Kumar wrote:
> > > > > From: Sumit Kumar <sumk@qti.qualcomm.com>
> > > > > 
> > > > > The current implementation of mhi_ep_read_channel, in case of chained
> > > > > transactions, assumes the End of Transfer(EOT) bit is received with the
> > > > > doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
> > > > > beyond wr_offset during host-to-device transfers when EOT has not yet
> > > > > arrived. This can lead to access of unmapped host memory, causing
> > > > > IOMMU faults and processing of stale TREs.
> > > > > 
> > > > > This change modifies the loop condition to ensure rd_offset remains behind
> > > > > wr_offset, allowing the function to process only valid TREs up to the
> > > > > current write pointer. This prevents premature reads and ensures safe
> > > > > traversal of chained TREs.
> > > > > 
> > > > > Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
> > > > > Cc: stable@vger.kernel.org
> > > > > Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> > > > > Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> > > > > Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
> > > > > ---
> > > > >    drivers/bus/mhi/ep/main.c | 2 +-
> > > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > > 
> > > > > diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> > > > > index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..2e134f44952d1070c62c24aeca9effc7fd325860 100644
> > > > > --- a/drivers/bus/mhi/ep/main.c
> > > > > +++ b/drivers/bus/mhi/ep/main.c
> > > > > @@ -468,7 +468,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
> > > > >    			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
> > > > >    		}
> > > > > -	} while (buf_left && !tr_done);
> > > > > +	} while (buf_left && !tr_done && mhi_chan->rd_offset != ring->wr_offset);
> > > > You should use mhi_ep_queue_is_empty() for checking the available elements to
> > > > process. And with this check in place, the existing check in
> > > > mhi_ep_process_ch_ring() becomes redundant.
> > > > 
> > > > - Mani
> > > 
> > > Yes, agreed that the check can be replaced with the mhi_ep_queue_is_empty, but the existing
> > > check in mhi_ep_process_ch_ring() is still necessary because there can be a case where
> > > there are multiple chained transactions in the ring.
> > > 
> > > Example: The ring at the time mhi_ep_read_channel is executing may look like:
> > > chained | chained |  EOT#1 | chained | chained | EOT#2
> > > If we remove the check from mhi_ep_process_ch_ring, we bail out of the first transaction itself
> > > and the remaining packets won't be processed. mhi_ep_read_channel in its current form is designed
> > > for a single MHI packet only.
> > > 
> > 
> > Then you should ignore the EOT flag by removing '!tr_done' check and just check
> > for buf_left and mhi_ep_process_ch_ring(). Having the same check in caller and
> > callee doesn't make sense.
> > 
> > - Mani
> > 
> Agreed, we can remove the tr_done check from the while loop, then all the
> elements of the ring will be processed in read_channel.
> Additionally, the purpose of buf_left is to process a TRE if
> DEFAULT_MTU_SIZE of endpoint is less than host, but the buf_left will become
> 0 after processing a part of TRE and will not process the remaining data.
> 
> Therefore will remove the buf_left too from read_channel otherwise it will
> exit the loop after processing one TRE or just a part of it.
> 

Right. If we are removing the ring empty check from mhi_ep_process_ch_ring(),
then we do need to remove the buf_left check from mhi_ep_read_channel().

- Mani

-- 
மணிவண்ணன் சதாசிவம்

