Return-Path: <linux-arm-msm+bounces-25106-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1208A9259B6
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:48:40 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 44ED71C21612
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 10:48:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B2FAA174EFC;
	Wed,  3 Jul 2024 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="sWVq37Zk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B89116DEC3;
	Wed,  3 Jul 2024 10:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003159; cv=none; b=CebIpoVWT31aq66Z21A9LDrQVNaqAlueRAjGZZj0Ak7zlQchjedy9a5IvTPBciCH0X0+Tr7uwqtTJbnvXR129MX6RS6i6M7m7x/6Mn1m2SnLLMD5Ro/bEmdd9Ra9CfuiH6piH1e1tCfqpiH5Xt4XPDgLDz0GoWuc0bTrDytu/cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003159; c=relaxed/simple;
	bh=c5YMYnQsGVVDkEokkgr1bMvHGW7VnZ6W/LDJWK8aJIk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XWjPmYDMshXDFw1ZJj0O+/7rUsVHwcLcvEkgGgGCkzJqwDE7TAoZYQmqwVcB3u6QQkSO8VXWKxdUyBdcu0yUNKt/yH68cxByEvhPcAYgZhOSezRqLKpSZbv2m1YUOKVbtEx6hc7xohXK9o2QPdGIVb1uA7Rw+1RO9tPGLZLhVMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=sWVq37Zk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845FBC2BD10;
	Wed,  3 Jul 2024 10:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1720003158;
	bh=c5YMYnQsGVVDkEokkgr1bMvHGW7VnZ6W/LDJWK8aJIk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sWVq37Zk4uoAqYi2poiW5YdDurYhN+xWgKw/mZZdGmqHKAnywekW7t51AwB9tRKg/
	 IrTljMGi+ftFVVmOyNkG5mzivjK4scc7eUX9uR8qpkXAmb4JdgAT/qSvK9Xns1lX5p
	 qN+drU0zAfHc4Kx0tGc23QpSxKT9xmzcEikqy830=
Date: Wed, 3 Jul 2024 12:39:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org,
	quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org,
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org,
	arnd@arndb.de
Subject: Re: [PATCH v1] misc: fastrpc: Add support for multiple PD from one
 process
Message-ID: <2024070353-giggly-stardom-7b6d@gregkh>
References: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703065200.1438145-1-quic_ekangupt@quicinc.com>

On Wed, Jul 03, 2024 at 12:22:00PM +0530, Ekansh Gupta wrote:
> @@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
>  	spinlock_t lock;
>  	struct idr ctx_idr;
> +	struct ida dsp_pgid_ida;

You have an idr and an ida?  Why two different types for the same
driver?

>  	struct list_head users;
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
> @@ -299,6 +304,7 @@ struct fastrpc_user {
>  	struct fastrpc_buf *init_mem;
>  
>  	int tgid;
> +	int dsp_pgid;

Are you sure this fits in an int?

> +static int fastrpc_pgid_alloc(struct fastrpc_channel_ctx *cctx)
> +{
> +	int ret = -1;

No need to initialize this.

> +
> +	/* allocate unique id between MIN_FRPC_PGID and MAX_FRPC_PGID */
> +	ret = ida_alloc_range(&cctx->dsp_pgid_ida, MIN_FRPC_PGID,
> +					MAX_FRPC_PGID, GFP_ATOMIC);
> +	if (ret < 0)
> +		return -1;

Why is -1 a specific value here?  Return a real error please.
Or return 0 if that's not allowed.

v
> +
> +	return ret;
> +}
> +
>  static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  {
>  	struct fastrpc_channel_ctx *cctx;
> @@ -1582,6 +1605,12 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	fl->cctx = cctx;
>  	fl->is_secure_dev = fdevice->secure;
>  
> +	fl->dsp_pgid = fastrpc_pgid_alloc(cctx);
> +	if (fl->dsp_pgid == -1) {
> +		dev_dbg(&cctx->rpdev->dev, "too many fastrpc clients, max %u allowed\n", MAX_DSP_PD);
> +		return -EUSERS;

Why -EUSERS?

And you obviously did not test this as you just leaked memory :(

thanks,

greg k-h

