Return-Path: <linux-arm-msm+bounces-83798-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id EC669C92759
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 16:32:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id E2A574E21C3
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Nov 2025 15:32:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6E72521256C;
	Fri, 28 Nov 2025 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GwgUIvHE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33B0722578A;
	Fri, 28 Nov 2025 15:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764343936; cv=none; b=LWZt+L3l2UC9e8bUqsMrHEtJ1PWQqi0l9KbhfJ/W2USRwAolMQnWQ1j3QobSqwWNOrpxhVZn/2rQLfn+nbj7Frck54SPkTuPSDcqr5gUzB9j7g83dlLKxy3W+ov2mUg1O3rP9T/uVQm32DF41FVdUYELIwoZK9cMdWEHbXKNp7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764343936; c=relaxed/simple;
	bh=NivM2unTfArQ4MH6trQQLpjZ9i7wmWdLO4QXz5M4Tjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IM97qBpbQhYshPBmTuRicgSDK4sVhJiRtJV38nHlF3LERzrTRi+WrXodFjkBtR2ueZ/ncNQuXjuTqZwUe42tson7E9Yh93AvVcdKBcPfmu4ltpCBxBrwAawvLSBvbfultxBwAln9SiGLniHeOWAfV+Pj1yYVL52RzT/bqvgiYMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GwgUIvHE; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58183C4CEF1;
	Fri, 28 Nov 2025 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1764343935;
	bh=NivM2unTfArQ4MH6trQQLpjZ9i7wmWdLO4QXz5M4Tjg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GwgUIvHEYPpmzimPUGmI1hD0inJ/j/gkcXwkw4DZsGDg/odtVoY85pTEefUSkbOEz
	 nKlmXkvfJv7jLjrtpxf0/9IrmzyWMiHS8vokE2AFlygU6QkhqldzG5wGPUsRiPGBu5
	 1Vq8wq+lgeRJCdhyI5qwxINjJoKYKZN9mRAzKUE4=
Date: Fri, 28 Nov 2025 16:32:12 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srini@kernel.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de, dmitry.baryshkov@oss.qualcomm.com
Subject: Re: [PATCH v2 2/2] misc: fastrpc: Support mapping
 userspace-allocated buffers
Message-ID: <2025112854-septum-asleep-8c35@gregkh>
References: <20251128103428.1119696-1-ekansh.gupta@oss.qualcomm.com>
 <20251128103428.1119696-3-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251128103428.1119696-3-ekansh.gupta@oss.qualcomm.com>

On Fri, Nov 28, 2025 at 04:04:28PM +0530, Ekansh Gupta wrote:
> Currently, FastRPC only supports mapping buffers allocated by the
> kernel. This limits flexibility for applications that allocate memory
> in userspace using rpcmem or DMABUF and need to share it with the DSP.
> Add support for mapping and unmapping userspace-allocated buffers to
> the DSP through SMMU. This includes handling map requests for rpcmem
> and DMABUF-backed memory and providing corresponding unmap
> functionality.
> 
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 96 +++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 85 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 9bf76e224852..feba79913763 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1854,8 +1854,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_buf *buf = NULL, *iter, *b;
> +	struct fastrpc_map *map = NULL, *iterm, *m;
>  	struct fastrpc_req_munmap req;
>  	struct device *dev = fl->sctx->dev;
> +	int err;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -1869,13 +1871,41 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  	}
>  	spin_unlock(&fl->lock);
>  
> -	if (!buf) {
> -		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
> +	if (buf) {
> +		err = fastrpc_req_munmap_impl(fl, buf);
> +		if (err) {
> +			spin_lock(&fl->lock);
> +			list_add_tail(&buf->node, &fl->mmaps);
> +			spin_unlock(&fl->lock);
> +		}
> +		return err;
> +	}
> +
> +	spin_lock(&fl->lock);
> +	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
> +		if (iterm->raddr == req.vaddrout) {
> +			map = iterm;
> +			list_del(&iterm->node);
> +			break;
> +		}
> +	}
> +	spin_unlock(&fl->lock);
> +	if (!map) {
> +		dev_dbg(dev, "buffer/map not found addr 0x%09llx, len 0x%08llx\n",
>  			req.vaddrout, req.size);

Never print out kernel pointers "raw" like this, use the real %p tags
instead.  Odd that the current code does this, that is not good and is
probably a "information leak" somehow.

Can you fix that up first so it can be backported properly?

>  		return -EINVAL;
>  	}
>  
> -	return fastrpc_req_munmap_impl(fl, buf);
> +	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +	if (err) {
> +		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);

Same here.  Also, no need for a \t in a kernel log message.

> +		spin_lock(&fl->lock);
> +		list_add_tail(&map->node, &fl->maps);
> +		spin_unlock(&fl->lock);
> +	} else {
> +		fastrpc_map_put(map);
> +	}
> +	return err;
>  }
>  
>  static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
> @@ -1989,25 +2019,69 @@ static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
>  	return err;
>  }
>  
> -static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +static int fastrpc_req_map_create(struct fastrpc_user *fl,
> +				  struct fastrpc_req_mmap req,
> +				  char __user *argp)
>  {
> -	struct fastrpc_req_mmap req;
> +	struct fastrpc_map *map = NULL;
> +	struct device *dev = fl->sctx->dev;
> +	u64 raddr = 0;
>  	int err;
>  
> -	if (copy_from_user(&req, argp, sizeof(req)))
> -		return -EFAULT;
> +	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
> +	if (err) {
> +		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
> +		return err;
> +	}
>  
> -	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
> -		dev_err(fl->sctx->dev, "flag not supported 0x%x\n", req.flags);
> +	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
> +				  req.vaddrin, &raddr);
> +	if (err)
> +		goto err_invoke;
>  
> -		return -EINVAL;
> +	/* update the buffer to be able to deallocate the memory on the DSP */
> +	map->raddr = (u64)raddr;
> +
> +	/* let the client know the address to use */
> +	req.vaddrout = raddr;
> +	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
> +		map->raddr, map->size);
> +
> +	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {

argp is already a user pointer, no need to cast it again, right?

> +		err = -EFAULT;
> +		goto err_copy;
>  	}
>  
> -	err = fastrpc_req_buf_alloc(fl, req, argp);
> +	return 0;
> +err_copy:
> +	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
> +err_invoke:
> +	fastrpc_map_put(map);
>  
>  	return err;
>  }
>  
> +static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_req_mmap req;
> +	int err;
> +
> +	if (copy_from_user(&req, argp, sizeof(req)))
> +		return -EFAULT;
> +
> +	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
> +	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
> +		err = fastrpc_req_buf_alloc(fl, req, argp);
> +		if (err)
> +			return err;
> +	} else {
> +		err = fastrpc_req_map_create(fl, req, argp);

You changed the logic here from what used to happen if req.flags was not
set to those two values.  Are you _sure_ you mean to do that?  If so,
how does userspace know?  Why don't you have a new flag for the new
type of memory you want to map?

thanks,

greg k-h

