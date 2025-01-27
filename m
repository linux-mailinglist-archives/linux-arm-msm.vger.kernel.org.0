Return-Path: <linux-arm-msm+bounces-46281-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B742A1D9CE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 16:44:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B5D0F188841E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 15:43:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A26EB149DE8;
	Mon, 27 Jan 2025 15:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ggF33okr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2667D14884F
	for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 15:43:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737992594; cv=none; b=WBL+IjDi0Ej6dFM2Bl1h7RSzi6VcoD4kNK8BWrqkXZnmr0pa62Y4VbnrJlzxR4C7NVEVQcpuXfKwVlOYzSwv2szyqI0j4Tieysro+F7lRuxJTZFZ2xvxOqUHsYHe6OOtPC+WvDibqeW6104l7vFM5ZK2M7C6O9FjDKDkAXWp5Mo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737992594; c=relaxed/simple;
	bh=crhgqnLZwinTp3JA1eaFrF3dLvOtvdL1xezDLhPjcz0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UssdboOEEM1C3/9anTl0aRROi35ro5TJLemjpM/3YeQvuUUlUZk1aNFMdBX+U/c6PySdTmZhAb5TbmMAivf6dlHvU8i5sk7yJgWrzK9bhuKQ0JAe3MNIRjz3rtZG9RsWATMwlt9HWdlAWMmUflhw8ldp8sV5QrH7TfeAsw5qQ5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ggF33okr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54025432becso5193132e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2025 07:43:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1737992589; x=1738597389; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hHQd5cjQbBNiv2pY8rRqJIrAWAxmWtuuWMAVaWyuOF4=;
        b=ggF33okrcl7qNRU3Mln9Caa0qIp3ifdJKoBdf+tWuYpGchxGlcGAEkthL21ShmwZ6X
         A+dpYqJ2nbAvUJaR1jVLZGtizwdEZkMrk5tH+obqox/7Y3hlMmK6uz1YH/Yy0uAQVPDM
         1Uchp2MqzrVcTsYrbCaSOCmWmq92UsQOFsU4NyCqffWO7ihjXSnnClTTi+IB7nT5lFVw
         7Fxtf/pnkW1b7569LGYv7wEfwjwJDIhabBm66ZVfj1OqFLnd5OIYIHSs7OjTwCH3oq34
         npUISvsN1Axa9eM6o9Tr6HsmTnspAH5XuOu12tFhECkL2j/OeD+PY10l7a1EIlLC0kvc
         mekA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737992589; x=1738597389;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHQd5cjQbBNiv2pY8rRqJIrAWAxmWtuuWMAVaWyuOF4=;
        b=k9Lwryuopt1oh8gjWum7eO52z4cJRw9EaTBorFgz7N/GFtndGasTkkFKSZ2A+tSJks
         sbqcnNMMGRKISVNjLnMCcn+Va3kPH5rtlMgR2HktPOqksimdbH28d1Jhoht9qjhiuEYU
         8VMWz9wdTEF6SdBME7c+CHtGGVm4qwWmxNclZBSQjsW1pcSZBtCiwADqrk5ROxgadikS
         Gc4f4KvUxr2hZJM4w6CQZEpTKRWJ8Sp/SFYt34FOcpwFzrzb9Gp6cqJZCOyt4ZP+6XV2
         Oaa/xyLxd2eAhFFx5F4eMbQuhpJyX/ipDpPZNNgrh4L+TW6SFgwQTXFYS0XHqH6zzCa5
         +s7Q==
X-Forwarded-Encrypted: i=1; AJvYcCUJicaYWzBfu2XZzVLfM6o2fVGyHs1CrzLjiBk1sFp4syZ610oTht2QY2tWBD2KqdvCepyq7V87nGNuwsk7@vger.kernel.org
X-Gm-Message-State: AOJu0YzNaOJutnM9LP56a6IzGM/76hM+3JF5/APS55syGZJSuyFq9MqF
	+e5yWmgz6E2l/piSCaNExzKogLRxFMQN8Y127Dv1y01dRLic6HRaOxHw1Ry+zio=
X-Gm-Gg: ASbGnctIuH3aToBzJr25/QfJAqOtYQHE4UPafo3zh66WMjvkUKiPcI4LomZh39vuP4X
	md+1Y2d3gbP8rvURsbT0Qe8hnl6Y+qEgrCPP749qsqoUYnH/ciIZr2zwieQhLpoyJS05SeHOYD1
	Ba/f9nn4ip5WHHvn03LJkoOm/s7BLtwxAUwCeDOs8yLy2mS9s3NaPQ1aFKBLtya6GFd7nD+76x9
	rgo59L0m9DcSqG2ocCTmXnO0pQiM86Scr79zBTWR5P8rrdzXYdZrQK+D/N8AeyKNPJnuJBP70Pr
	gz+eNSnz0Nm8RxfRH6r66FNjlPmpwUuYdO1RzpXXaLCVG37R6J9uPNVisHeA
X-Google-Smtp-Source: AGHT+IEkFCIrfiecKQIn0nuU/0wlpniZedRP2dGP9fDfftQvW+CRiPn1WH0bteoGQtIkJbHJ65nwYQ==
X-Received: by 2002:a05:6512:10c8:b0:540:2f59:7561 with SMTP id 2adb3069b0e04-5439c28aed9mr15402780e87.50.1737992589021;
        Mon, 27 Jan 2025 07:43:09 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c822f8b5sm1356699e87.79.2025.01.27.07.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 07:43:08 -0800 (PST)
Date: Mon, 27 Jan 2025 17:43:07 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 2/5] misc: fastrpc: Introduce context params structure
Message-ID: <dbyrbb4q2q2hrdarprfpbg4qnctjfp4uiwp6cqq6epg42ekeba@fyipe2jrhayz>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-3-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-3-quic_ekangupt@quicinc.com>

On Mon, Jan 27, 2025 at 10:12:36AM +0530, Ekansh Gupta wrote:
> Add structure to invoke context parameterms. This structure is meant

Nit: for invoke context parameters.

> to carry invoke context specific data. This structure is passed to
> internal invocation call to save the data in context. Examples of
> data intended to part of this structure are: CRC user memory address,
> poll timeout for invoke call, call priority etc.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 138 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 117 insertions(+), 21 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 1a936d462519..c29d5536195e 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -254,6 +254,11 @@ struct fastrpc_invoke_ctx {
>  	struct fastrpc_channel_ctx *cctx;
>  };
>  
> +struct fastrpc_ctx_args {
> +	struct fastrpc_invoke_args *args;
> +	void __user *crc;
> +};

Why do we need a separate struct? Can we use fastrpc_invoke_ctx instead?

> +
>  struct fastrpc_session_ctx {
>  	struct device *dev;
>  	int sid;
> @@ -574,7 +579,7 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  
>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  			struct fastrpc_user *user, u32 kernel, u32 sc,
> -			struct fastrpc_invoke_args *args)
> +			struct fastrpc_ctx_args *cargs)
>  {
>  	struct fastrpc_channel_ctx *cctx = user->cctx;
>  	struct fastrpc_invoke_ctx *ctx = NULL;
> @@ -605,7 +610,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  			kfree(ctx);
>  			return ERR_PTR(-ENOMEM);
>  		}
> -		ctx->args = args;
> +		ctx->args = cargs->args;
>  		fastrpc_get_buff_overlaps(ctx);
>  	}
>  
> @@ -1133,7 +1138,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   u32 handle, u32 sc,
> -				   struct fastrpc_invoke_args *args)
> +				   struct fastrpc_ctx_args *cargs)
>  {
>  	struct fastrpc_invoke_ctx *ctx = NULL;
>  	struct fastrpc_buf *buf, *b;
> @@ -1151,7 +1156,7 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  		return -EPERM;
>  	}
>  
> -	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
> +	ctx = fastrpc_context_alloc(fl, kernel, sc, cargs);
>  	if (IS_ERR(ctx))
>  		return PTR_ERR(ctx);
>  
> @@ -1233,6 +1238,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  {
>  	struct fastrpc_init_create_static init;
>  	struct fastrpc_invoke_args *args;
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_phy_page pages[1];
>  	char *name;
>  	int err;
> @@ -1307,15 +1313,25 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[2].length = sizeof(*pages);
>  	args[2].fd = -1;
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs) {
> +		err = -ENOMEM;
> +		goto err_invoke;
> +	}
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
>  
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				      sc, args);
> -	if (err)
> +				      sc, cargs);
> +	if (err) {
> +		kfree(cargs);

No, this should be a part of the error path.

>  		goto err_invoke;
> +	}
>  
>  	kfree(args);
>  	kfree(name);
> +	kfree(cargs);
>  
>  	return 0;
>  err_invoke:
> @@ -1351,6 +1367,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  {
>  	struct fastrpc_init_create init;
>  	struct fastrpc_invoke_args *args;
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_phy_page pages[1];
>  	struct fastrpc_map *map = NULL;
>  	struct fastrpc_buf *imem = NULL;
> @@ -1438,16 +1455,26 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	args[5].length = sizeof(inbuf.siglen);
>  	args[5].fd = -1;
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs) {
> +		err = -ENOMEM;
> +		goto err_invoke;
> +	}
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
>  	if (init.attrs)
>  		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
>  
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				      sc, args);
> -	if (err)
> +				      sc, cargs);
> +	if (err) {
> +		kfree(cargs);

Likewise.

>  		goto err_invoke;
> +	}
>  
>  	kfree(args);
> +	kfree(cargs);
>  
>  	return 0;
>  
> @@ -1498,17 +1525,27 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
>  static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>  {
>  	struct fastrpc_invoke_args args[1];
> -	int client_id = 0;
> +	struct fastrpc_ctx_args *cargs;
> +	int client_id = 0, err;
>  	u32 sc;
>  
>  	client_id = fl->client_id;
>  	args[0].ptr = (u64)(uintptr_t) &client_id;
>  	args[0].length = sizeof(client_id);
>  	args[0].fd = -1;
> +
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				       sc, &args[0]);
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> +				       sc, cargs);
> +	kfree(cargs);
> +
> +	return err;
>  }
>  
>  static int fastrpc_device_release(struct inode *inode, struct file *file)
> @@ -1643,22 +1680,33 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  {
>  	struct fastrpc_invoke_args args[1];
> -	int client_id = fl->client_id;
> +	struct fastrpc_ctx_args *cargs;
> +	int client_id = fl->client_id, err;
>  	u32 sc;
>  
>  	args[0].ptr = (u64)(uintptr_t) &client_id;
>  	args[0].length = sizeof(client_id);
>  	args[0].fd = -1;
> +
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>  	fl->pd = pd;
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				       sc, &args[0]);
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> +				       sc, cargs);
> +	kfree(cargs);
> +
> +	return err;
>  }
>  
>  static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_invoke_args *args = NULL;
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_invoke inv;
>  	u32 nscalars;
>  	int err;
> @@ -1679,9 +1727,16 @@ static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
>  			return -EFAULT;
>  		}
>  	}
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs) {
> +		kfree(args);
> +		return -ENOMEM;
> +	}
>  
> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
> +	cargs->args = args;
> +	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, cargs);
>  	kfree(args);
> +	kfree(cargs);
>  
>  	return err;
>  }
> @@ -1690,6 +1745,8 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  				     uint32_t dsp_attr_buf_len)
>  {
>  	struct fastrpc_invoke_args args[2] = { 0 };
> +	struct fastrpc_ctx_args *cargs;
> +	int err;
>  
>  	/*
>  	 * Capability filled in userspace. This carries the information
> @@ -1706,8 +1763,15 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  	args[1].length = dsp_attr_buf_len * sizeof(u32);
>  	args[1].fd = -1;
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
> -				       FASTRPC_SCALARS(0, 1, 1), args);
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
> +				       FASTRPC_SCALARS(0, 1, 1), cargs);
> +	kfree(cargs);
> +	return err;
>  }
>  
>  static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> @@ -1794,6 +1858,7 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_munmap_req_msg req_msg;
>  	struct device *dev = fl->sctx->dev;
>  	int err;
> @@ -1806,9 +1871,14 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +				      cargs);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>  		spin_lock(&fl->lock);
> @@ -1818,6 +1888,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	} else {
>  		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
>  	}
> +	kfree(cargs);
>  
>  	return err;
>  }
> @@ -1852,6 +1923,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_buf *buf = NULL;
>  	struct fastrpc_mmap_req_msg req_msg;
>  	struct fastrpc_mmap_rsp_msg rsp_msg;
> @@ -1902,12 +1974,18 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
>  	args[2].length = sizeof(rsp_msg);
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +				      cargs);
>  	if (err) {
>  		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
>  		fastrpc_buf_free(buf);
> +		kfree(cargs);
>  		return err;
>  	}
>  
> @@ -1942,17 +2020,20 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
>  		buf->raddr, buf->size);
>  
> +	kfree(cargs);
>  	return 0;
>  
>  err_assign:
>  	fastrpc_req_munmap_impl(fl, buf);
>  
> +	kfree(cargs);
>  	return err;
>  }
>  
>  static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_map *map = NULL, *iter, *m;
>  	struct fastrpc_mem_unmap_req_msg req_msg = { 0 };
>  	int err = 0;
> @@ -1982,14 +2063,21 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
>  	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +				      cargs);
>  	if (err) {
>  		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
> +		kfree(cargs);
>  		return err;
>  	}
>  	fastrpc_map_put(map);
> +	kfree(cargs);
>  
>  	return 0;
>  }
> @@ -2007,6 +2095,7 @@ static int fastrpc_req_mem_unmap(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_invoke_args args[4] = { [0 ... 3] = { 0 } };
> +	struct fastrpc_ctx_args *cargs;
>  	struct fastrpc_mem_map_req_msg req_msg = { 0 };
>  	struct fastrpc_mmap_rsp_msg rsp_msg = { 0 };
>  	struct fastrpc_mem_unmap req_unmap = { 0 };
> @@ -2051,8 +2140,13 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  	args[3].ptr = (u64) (uintptr_t) &rsp_msg;
>  	args[3].length = sizeof(rsp_msg);
>  
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->args = args;
>  	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
> +	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, cargs);
>  	if (err) {
>  		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
>  			req.fd, req.vaddrin, map->size);
> @@ -2072,11 +2166,13 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  		fastrpc_req_mem_unmap_impl(fl, &req_unmap);
>  		return -EFAULT;
>  	}
> +	kfree(cargs);
>  
>  	return 0;
>  
>  err_invoke:
>  	fastrpc_map_put(map);
> +	kfree(cargs);
>  
>  	return err;
>  }
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

