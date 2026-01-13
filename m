Return-Path: <linux-arm-msm+bounces-88688-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 367AAD172F2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 09:05:05 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 3AD4C302E330
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 08:04:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 618AB376BF3;
	Tue, 13 Jan 2026 08:04:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TLvC5NYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10BBD376BEA;
	Tue, 13 Jan 2026 08:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768291484; cv=none; b=uECpgsJ5KEwRCkGABwn4g0uuA29KIK1wFnTyvSA6i2rnU3FAzTBLVbTnrW7JGN+PB8XrEEQLQVrqti8uMRq5lJyhZM65lrGMjdN1Jbwg0SOowwFyxYIndw4edgM2jqB85jURLdxnfcnZMVtAUR9v/QcjloC505NFS/qiDYN2ozc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768291484; c=relaxed/simple;
	bh=O0F1jMl1tCNvBzzLqluAEE74nDYSx3BWZIO4pYdfMUg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e7+6+uscxy9TDveR7Okd81mkkuwhC4ZUu8RvrDUfkf1MfCH7Duwj/FDzH+g0f2nXr8BRt3jGLEEMKWWOPOHklN9kvax1KMA//GtyceVuS4gDlgoXFLlPa7hS+NQF8ru7khAUtL6+pKKi4dKyRVnwrY2LdMaxfZbVP2XdVpI3HsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TLvC5NYN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1687DC116C6;
	Tue, 13 Jan 2026 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768291483;
	bh=O0F1jMl1tCNvBzzLqluAEE74nDYSx3BWZIO4pYdfMUg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TLvC5NYNwOFN9W55iXDig/xpyvMkPVXeg4TGLFSp7Dlz7jXBEA/iwbZE4Z9mcEyMW
	 KzX2gbJRd+aL+ZEAIyrpm5JP82uSCr4XAqH2mG/fV78yhqwT+Fx9hYJdfdC9sSEo9g
	 4tmB6gGzsoAlP5imWbxoq48aiybKD2lVcNn2aZtUBWvk/0vlTYNMHoUnu19mk5hdMS
	 GtiRh9RQ3ebRaFtxTxJOyPBqvZKuG47OUi7ruQxh5Pckn52Njw/8LQz0GXNi8L7qwS
	 R0i3Od2pLMW65np46OtdHsdDqWuhlnemwX3PbS7G3Kh39J/vD5lP8McKt2LfLIcYej
	 O3B+tjF0Vjqww==
Date: Tue, 13 Jan 2026 13:34:34 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Arnd Bergmann <arnd@arndb.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Upal Kumar Saha <upal.saha@oss.qualcomm.com>, Himanshu Shukla <quic_himashuk@quicinc.com>, 
	Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
Subject: Re: [PATCH 04/11] Revert "bus: mhi: host: Remove mhi_poll() API"
Message-ID: <vfslj4vfs6mw57upbrfsxalznr3mjtfplc43ba3x37lr5mqtqp@njk7viqmh5dv>
References: <20251211-siva_mhi_dp2-v1-0-d2895c4ec73a@oss.qualcomm.com>
 <20251211-siva_mhi_dp2-v1-4-d2895c4ec73a@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251211-siva_mhi_dp2-v1-4-d2895c4ec73a@oss.qualcomm.com>

On Thu, Dec 11, 2025 at 01:37:36PM +0530, Sivareddy Surasani wrote:
> From: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> 
> Revert commit 5da094ac80cd ("bus: mhi: host: Remove mhi_poll() API")
> 
> Add mhi_poll() API. New hardware channel clients use mhi_poll() to manage
> their own completion events instead of relying on the MHI core driver for
> notifications.
> 

Sorry, this is not at all a poll API. poll API is supposed to be polling for an
event until that event occured. But this API just reads the ring buffer when
called.

- Mani

> Signed-off-by: Vivek Pernamitta <vivek.pernamitta@oss.qualcomm.com>
> Signed-off-by: Sivareddy Surasani <sivareddy.surasani@oss.qualcomm.com>
> ---
>  drivers/bus/mhi/host/main.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/drivers/bus/mhi/host/main.c b/drivers/bus/mhi/host/main.c
> index 7beb848ca5c1..5d50f6ebf6f9 100644
> --- a/drivers/bus/mhi/host/main.c
> +++ b/drivers/bus/mhi/host/main.c
> @@ -1858,3 +1858,18 @@ int mhi_get_channel_doorbell_offset(struct mhi_controller *mhi_cntrl, u32 *chdb_
>  	return 0;
>  }
>  EXPORT_SYMBOL_GPL(mhi_get_channel_doorbell_offset);
> +
> +int mhi_poll(struct mhi_device *mhi_dev, u32 budget)
> +{
> +	struct mhi_controller *mhi_cntrl = mhi_dev->mhi_cntrl;
> +	struct mhi_chan *mhi_chan = mhi_dev->dl_chan;
> +	struct mhi_event *mhi_event = &mhi_cntrl->mhi_event[mhi_chan->er_index];
> +	int ret;
> +
> +	spin_lock_bh(&mhi_event->lock);
> +	ret = mhi_event->process_event(mhi_cntrl, mhi_event, budget);
> +	spin_unlock_bh(&mhi_event->lock);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mhi_poll);
> 
> -- 
> 2.34.1
> 

-- 
மணிவண்ணன் சதாசிவம்

