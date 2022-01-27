Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E80149E358
	for <lists+linux-arm-msm@lfdr.de>; Thu, 27 Jan 2022 14:24:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229709AbiA0NYf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 27 Jan 2022 08:24:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229565AbiA0NYe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 27 Jan 2022 08:24:34 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 907B7C061714
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 05:24:34 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 51CB2B821C0
        for <linux-arm-msm@vger.kernel.org>; Thu, 27 Jan 2022 13:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719B4C340E4;
        Thu, 27 Jan 2022 13:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1643289872;
        bh=XdjoG7tDvvt7jA9LtGVs7TTt/w1Tpf47FTWCjH8DFDo=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=x45kZBciMKZ9ysOmSwUNiSK4/kg+uaeIPfVa8PCB1GBg0RZ8n9KlXymTnQS8FZCtH
         C6LihOnWuVTZU682UwHoY71jIjXfQrO8HMqB2YUT41LoPlPj+3w0roriD4Gn3cUAoe
         HWxcGAXqVMGFsdlkL+jsirZ6hSUjMFgRcubTx34A=
Date:   Thu, 27 Jan 2022 14:24:29 +0100
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Mathias Krause <minipli@grsecurity.net>
Cc:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Amol Maheshwari <amahesh@qti.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH] misc: fastrpc: avoid double fput() on failed usercopy
Message-ID: <YfKdDUxj2wpglXQI@kroah.com>
References: <20220127130218.809261-1-minipli@grsecurity.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220127130218.809261-1-minipli@grsecurity.net>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

On Thu, Jan 27, 2022 at 02:02:18PM +0100, Mathias Krause wrote:
> If the copy back to userland fails for the FASTRPC_IOCTL_ALLOC_DMA_BUFF
> ioctl(), we shouldn't assume that 'buf->dmabuf' is still valid. In fact,
> dma_buf_fd() called fd_install() before, i.e. "consumed" one reference,
> leaving us with none.
> 
> Calling dma_buf_put() will therefore put a reference we no longer own,
> leading to a valid file descritor table entry for an already released
> 'file' object which is a straight use-after-free.
> 
> Simply avoid calling dma_buf_put() and rely on the process exit code to
> do the necessary cleanup, if needed, i.e. if the file descriptor is
> still valid.
> 
> Fixes: 6cffd79504ce ("misc: fastrpc: Add support for dmabuf exporter")
> Signed-off-by: Mathias Krause <minipli@grsecurity.net>
> ---
>  drivers/misc/fastrpc.c | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 4ccbf43e6bfa..aa1682b94a23 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1288,7 +1288,14 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>  	}
>  
>  	if (copy_to_user(argp, &bp, sizeof(bp))) {
> -		dma_buf_put(buf->dmabuf);
> +		/*
> +		 * The usercopy failed, but we can't do much about it, as
> +		 * dma_buf_fd() already called fd_install() and made the
> +		 * file descriptor accessible for the current process. It
> +		 * might already be closed and dmabuf no longer valid when
> +		 * we reach this point. Therefore "leak" the fd and rely on
> +		 * the process exit path to do any required cleanup.
> +		 */
>  		return -EFAULT;
>  	}
>  

This feels wrong.  How do all other dma buf users handle this?

And you forgot to cc: the dmabuf developers, I think get_maintainers.pl
should have caught them on this patch.

thanks,

greg k-h
