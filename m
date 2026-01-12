Return-Path: <linux-arm-msm+bounces-88498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 09DEFD1171A
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 10:16:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id BB5B9304576C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 09:16:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C6BA1EFF8D;
	Mon, 12 Jan 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DhOwSr5+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59273340280
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Jan 2026 09:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768209401; cv=none; b=pdaL8DqZfCeqhnJ8HacFpOK5jsDh7uzjwD/U6HukMO+ohpiI+OnIDqfKfWJXgLxDKOlq76ouYfS+QvRLxxT5+rGxYSSnLt9Q8m56pOusiDUcqWPJgD8JL+E1XiUu12mCOxfnWQ/xOoAbWo8Mn4ZQVUUExzlJ59jYZsZ6e15FWx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768209401; c=relaxed/simple;
	bh=18hptuZITFP2MUvlKDY/xiLNTktaNY5DlzsdiWrPiUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n/CYt/GtOkOCYGJI1sZENoLqU2R6sz5vkSITunqs//B9GAQnfh9WDhU8uq9QeZFmQ9YCUHWq+2W3m8nPvlDGM0HtOHaGATQ4BH9RYNRii3eOeyYX/UX96FfN8CTTwBwhdZ/ugn5OwlD+tJOknJWsoKtMuCL/B6yKyLtWQyENUmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DhOwSr5+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F6E9C19424;
	Mon, 12 Jan 2026 09:16:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768209400;
	bh=18hptuZITFP2MUvlKDY/xiLNTktaNY5DlzsdiWrPiUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhOwSr5+0sxA1wXOf+c0r11TsRAX1JcvvAavcklbWXnFwmwPpq7pZBM2toh11K0eD
	 gSCghgZtU9ekSDA4NDS3a9DsoI/GZHFpJ87d5Yzu7eLpPvBj5EFnaxEv7Zdu2u28Sa
	 QLNFjm8DKXPk3Yw7nmktW0MpStGEiuOAINbKaK6A=
Date: Mon, 12 Jan 2026 10:16:38 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Xingjing Deng <micro6947@gmail.com>
Cc: srini@kernel.org, amahesh@qti.qualcomm.com, arnd@arndb.de,
	dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
	Xingjing Deng <xjdeng@buaa.edu.cn>
Subject: Re: [PATCH] misc: fastrpc: possible double-free of cctx->remote_heap
Message-ID: <2026011227-casualty-rephrase-9381@gregkh>
References: <20260112090221.3250133-1-xjdeng@buaa.edu.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260112090221.3250133-1-xjdeng@buaa.edu.cn>

On Mon, Jan 12, 2026 at 05:02:21PM +0800, Xingjing Deng wrote:
> fastrpc_init_create_static_process() may free cctx->remote_heap on the
> err_map path but does not clear the pointer. Later, fastrpc_rpmsg_remove()
> frees cctx->remote_heap again if it is non-NULL, which can lead to a
> double-free if the INIT_CREATE_STATIC ioctl hits the error path and the rpmsg
> device is subsequently removed/unbound.
> Clear cctx->remote_heap after freeing it in the error path to prevent the
> later cleanup from freeing it again.
> 
> Signed-off-by: Xingjing Deng <xjdeng@buaa.edu.cn>
> ---
>  drivers/misc/fastrpc.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index ee652ef01534..fb3b54e05928 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1370,6 +1370,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	}
>  err_map:
>  	fastrpc_buf_free(fl->cctx->remote_heap);
> +	fl->cctx->remote_heap = NULL;
>  err_name:
>  	kfree(name);
>  err:
> -- 
> 2.25.1
> 

What commit id does this fix?  Should it go to stable kernels?

thanks,

greg k-h

