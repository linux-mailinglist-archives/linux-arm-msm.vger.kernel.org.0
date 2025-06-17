Return-Path: <linux-arm-msm+bounces-61579-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DC193ADC81C
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 12:25:58 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 725277A7898
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Jun 2025 10:23:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5FA57291C13;
	Tue, 17 Jun 2025 10:24:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TKO38lZb"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37E152900B2;
	Tue, 17 Jun 2025 10:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750155883; cv=none; b=igqlkLAdCLy181Ott/ft0+YV0efWZk+CNyR+/990lTlCPRHMMB4fffXGKxH1AaHwIn4yjGpSgKrYG7r9qXN2x7HsmPGODf6S3L3Duz5CHnHZkL7Oo19SB/brRX5xhw2D+8ydugabtkIPDqYTbN0Ty24mPBLh+lHmfkR/g1o/R90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750155883; c=relaxed/simple;
	bh=7K33YhqlWQQm5yeTAGGAZaigxVHd0764FA4N6zCBFKk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY045haDjBdqIEzowx8m5YXyPkZkhQx5/jtU8EIU9trpaN4kseDJSvXroGN4NVso1aRSxr1SdUrlV2EsqCXoA/BJHBGPZg27Ss7+DywVzclHgFoVy545M5CunfWxJMQAhFJR4eCeYR/Ug4WzavElr81hoqiF4yLJNB6Lq/jwt9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TKO38lZb; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 476D8C4CEEE;
	Tue, 17 Jun 2025 10:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750155882;
	bh=7K33YhqlWQQm5yeTAGGAZaigxVHd0764FA4N6zCBFKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TKO38lZbWfAVHFy8iWShlEAxBckrthInVy7csh7kOyniIMXkK3vE5zdt94Xx5RyA5
	 BRqJHGU0PHCfJ8yhua9GBMIMMRJiWiimXY5CJP8JZ/3CsoHwjAqNxB0zipOPukBzT8
	 VmkoFdHvjFQAHtQyh+WINeRy8MpTokHK0Ec+5HPG+l05EnFMEaTizyHE0NtpbPFgHj
	 bsczATs8JrekVp+vJ73ZPdgxmNknRdq0ffY0wPzJyEJoQkUc7GCdCsJKNjVQ6xUE5g
	 K0yHwnEJT7SbC09QWzXoszy+pUOUCEHsXvsPMCbLpuKiRhedkuMFMmJsvHAsCq79gq
	 p83xGs9yPyJ6g==
Date: Tue, 17 Jun 2025 15:54:35 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Youssef Samir <quic_yabdulra@quicinc.com>
Cc: manivannan.sadhasivam@linaro.org, jeff.hugo@oss.qualcomm.com, 
	quic_carlv@quicinc.com, quic_thanson@quicinc.com, mhi@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: Detect events pointing to unexpected TREs
Message-ID: <vpgqiiszye6azpn5muq64bxqg63cvizxpzj5cmspjynflzm3oe@2i55blw73j5x>
References: <20250521163110.571893-1-quic_yabdulra@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250521163110.571893-1-quic_yabdulra@quicinc.com>

On Wed, May 21, 2025 at 06:31:10PM +0200, Youssef Samir wrote:
> When a remote device sends a completion event to the host, it contains a
> pointer to the consumed TRE. The host uses this pointer to process all of
> the TREs between it and the host's local copy of the ring's read pointer.
> This works when processing completion for chained transactions, but can
> lead to nasty results if the device sends an event for a single-element
> transaction with a read pointer that is multiple elements ahead of the
> host's read pointer.
> 

How can this happen? I cannot relate this with the scenario mentioned below.

> For instance, if the host accesses an event ring while the device is
> updating it, the pointer inside of the event might still point to an old
> TRE.

I cannot interpret this, sorry. The host is supposed to access the ring elements
till the RP. Even if the device updates the RP while host is processing the TREs,
it should not cause any issues for the host which only sees the used ring
elements.

Maybe I'm missing something?

- Mani

> If the host uses the channel's xfer_cb() to directly free the buffer
> pointed to by the TRE, the buffer will be double-freed.
> 
> Validate the pointer inside an event before processing it.
> 
> Fixes: 1d3173a3bae7 ("bus: mhi: core: Add support for processing events from client device")
> Signed-off-by: Youssef Samir <quic_yabdulra@quicinc.com>
> 
> ---
>  drivers/bus/mhi/host/main.c | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index aa8a0ef697c7..57dc9c5c0d84 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -602,7 +602,7 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  	{
>  		dma_addr_t ptr = MHI_TRE_GET_EV_PTR(event);
>  		struct mhi_ring_element *local_rp, *ev_tre;
> -		void *dev_rp;
> +		void *dev_rp, *next_rp;
>  		struct mhi_buf_info *buf_info;
>  		u16 xfer_len;
>  
> @@ -621,6 +621,16 @@ static int parse_xfer_event(struct mhi_controller *mhi_cntrl,
>  		result.dir = mhi_chan->dir;
>  
>  		local_rp = tre_ring->rp;
> +
> +		next_rp = local_rp + 1;
> +		if (next_rp >= tre_ring->base + tre_ring->len)
> +			next_rp = tre_ring->base;
> +		if (dev_rp != next_rp && !MHI_TRE_DATA_GET_CHAIN(local_rp)) {
> +			dev_err(&mhi_cntrl->mhi_dev->dev,
> +				"Event element points to an unexpected tre\n");
> +			break;
> +		}
> +
>  		while (local_rp != dev_rp) {
>  			buf_info = buf_ring->rp;
>  			/* If it's the last TRE, get length from the event */
> -- 
> 2.25.1
> 

-- 
மணிவண்ணன் சதாசிவம்

