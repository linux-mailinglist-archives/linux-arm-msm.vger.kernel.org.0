Return-Path: <linux-arm-msm+bounces-65142-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id C1083B06E1F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 08:40:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2DD711A609AD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jul 2025 06:41:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D5D62882CB;
	Wed, 16 Jul 2025 06:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQz0hnwI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B79A10A1E;
	Wed, 16 Jul 2025 06:40:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752648047; cv=none; b=d6CX8w1iszkSWzCXltc2zcBgXD+j8QIfKPG0Ko9OH6aK4bB1TJIMdzG4rBluNQLEa6u/jWxDv2sZud7oVqmPsFTRMkRDlcvUkhUfabuNNYUpo7HDBdD8ziH5dfYcQ8xprTUf+2wN3Av9kSDCp7CfJ1ExMVGvrGfSfeNB9x1SDf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752648047; c=relaxed/simple;
	bh=M7wVgFYY5nzyttesPs5Sd9C3Qd0g3gqiZsDsfsHXoaQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=thhFaFR4Uj8zaGeKJFqLkpEDV9gkIbA97tt5wuKokJIbsTgdeme9YPh8UmhWo9jWaj2kVAxFCuzmIA3046cfOWivp1MMq052TLwHOZ5Uh2CdPEp2QzXzMeHr3mAzl8dbIu/SLOdqv6znJjXHXDEQLzINXVUGf6ZFsxc+tDlEul8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQz0hnwI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B6B8C4CEF0;
	Wed, 16 Jul 2025 06:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752648046;
	bh=M7wVgFYY5nzyttesPs5Sd9C3Qd0g3gqiZsDsfsHXoaQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iQz0hnwIkHSX8XGv2D3O4V/rf8xxwo1nmR5bXF61WJ+aLO7oH1++ArPMfdSTLueX5
	 SGicY/Pa3Ft+XNxfNOuzmFW30kUXLNVx7d9O4hWVBkN9uSExF37d1zAsNCy6rjku0T
	 HHKPFEl383w+6RIgW7uWrntk8g5oCUXqn9RjbrrTI7DJZZRqeIBPQYtTnl/hfCJLTw
	 VuDIPB329cPi2xr4ga6UjQLTNmNsBHnlHKuCsDIR18T953jfwEBKaijbrT2sy4915S
	 p8I3Sj3NWMS22GY/muVAEtNRD6sR2UtuyWYlVUu5DNrJqsjeg9G8ouz/Q3ciOgpIsv
	 eOi+sBmCOYHzQ==
Date: Wed, 16 Jul 2025 12:10:33 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sumit Kumar <quic_sumk@quicinc.com>
Cc: Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, quic_krichai@quicinc.com, quic_akhvin@quicinc.com, 
	quic_skananth@quicinc.com, quic_vbadigan@quicinc.com, Sumit Kumar <sumk@qti.qualcomm.com>, 
	stable@vger.kernel.org, Akhil Vinod <akhvin@qti.qualcomm.com>
Subject: Re: [PATCH] bus: mhi: ep: Fix chained transfer handling in read path
Message-ID: <5aqtqicbtlkrqbiw2ba7kkgwrmsuqx2kjukh2tavfihm5hq5ry@gdeqegayfh77>
References: <20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250709-chained_transfer-v1-1-2326a4605c9c@quicinc.com>

On Wed, Jul 09, 2025 at 04:03:17PM GMT, Sumit Kumar wrote:
> From: Sumit Kumar <sumk@qti.qualcomm.com>
> 
> The current implementation of mhi_ep_read_channel, in case of chained
> transactions, assumes the End of Transfer(EOT) bit is received with the
> doorbell. As a result, it may incorrectly advance mhi_chan->rd_offset
> beyond wr_offset during host-to-device transfers when EOT has not yet
> arrived. This can lead to access of unmapped host memory, causing
> IOMMU faults and processing of stale TREs.
> 
> This change modifies the loop condition to ensure rd_offset remains behind
> wr_offset, allowing the function to process only valid TREs up to the
> current write pointer. This prevents premature reads and ensures safe
> traversal of chained TREs.
> 
> Fixes: 5301258899773 ("bus: mhi: ep: Add support for reading from the host")
> Cc: stable@vger.kernel.org
> Co-developed-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> Signed-off-by: Akhil Vinod <akhvin@qti.qualcomm.com>
> Signed-off-by: Sumit Kumar <sumk@qti.qualcomm.com>
> ---
>  drivers/bus/mhi/ep/main.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index b3eafcf2a2c50d95e3efd3afb27038ecf55552a5..2e134f44952d1070c62c24aeca9effc7fd325860 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -468,7 +468,7 @@ static int mhi_ep_read_channel(struct mhi_ep_cntrl *mhi_cntrl,
>  
>  			mhi_chan->rd_offset = (mhi_chan->rd_offset + 1) % ring->ring_size;
>  		}
> -	} while (buf_left && !tr_done);
> +	} while (buf_left && !tr_done && mhi_chan->rd_offset != ring->wr_offset);

You should use mhi_ep_queue_is_empty() for checking the available elements to
process. And with this check in place, the existing check in
mhi_ep_process_ch_ring() becomes redundant.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

