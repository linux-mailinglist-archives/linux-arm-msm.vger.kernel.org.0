Return-Path: <linux-arm-msm+bounces-33377-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 91D79992E01
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 15:57:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 145AD1F240C1
	for <lists+linux-arm-msm@lfdr.de>; Mon,  7 Oct 2024 13:57:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 081FC1D461B;
	Mon,  7 Oct 2024 13:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UBskYy9u"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A83718BB98
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Oct 2024 13:57:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728309429; cv=none; b=GOGogqWLl73OwvCdg2suvBjaZA2918K2j8YdhLopJpCwPtJyPa3Tg7BfTsQ1IXZWbNGlpmhdUBdnuUxqP82zPEvUiIcsT7umOZ51H1v1BqsDTwmC8uDzJE5sv0kq4BISonUyURhxCNKPluIYW/3dYP7I1m+ZvsqVo0UkrToWS2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728309429; c=relaxed/simple;
	bh=jdZwSfSFRJFy9qZJrZgzIxDZVe6RdEk5SqKgnjq3OaM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cgGPuUtRUs24cABRNK39YrYEgUnfnmxMIVJh+4DHTa6oysdvX9tTXCb+BBfCJN+eRe5LA9S4sUB5ICmMFA1pX7pZVBz50af9ZQtMaP0EcILcIe2SejUsVzh20OVpHasM9ZF3mnf/kKwEY8+q2sBmM68YkIaJF2hIu0CoTgHIN54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UBskYy9u; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5398b589032so6601176e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Oct 2024 06:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728309425; x=1728914225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DydHDHDcBTS5lv6Pt4bVw5nvC798N3+S6LMd9kNkT0Q=;
        b=UBskYy9uEOKtdLMJNfCERjMpFVtfvUaCeYfNP0yKNJpQvRWlci3EOadkQjeg25cNIr
         O8dp0DKnRPKFxP2dmTOj2Etf+r9AMCLqNgS169yfVPllsvw8L6dYxXHA2Ur/xHd2I+SM
         hFt/cUhoN3wvlL9DwkGCj50s8FCy+UQmdxMGWULxe6ompm49+JgiLcO6soA3KxhnMA/l
         z/dgQPXOBHXMS/qaMUcYq8pZ4mENvuJNUirGAAd1dXQr+TX4NMgBhQgrnBowNaiX7akO
         ofTHLpuVO6WXTF+/r2aztWho4CMDCJZvxB9WrQTuLDgW43WBghi6Ha6GRQxQKe00VQGz
         3OcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728309425; x=1728914225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DydHDHDcBTS5lv6Pt4bVw5nvC798N3+S6LMd9kNkT0Q=;
        b=BY8NWNqo+1QEjVspgRKxcmtAxiqTuxEz7llaaZ8rxk1VTMDDfG6f4vmPMKvFeetOt8
         RV1viDV4kkQ16/Zdx8ovOOSJ9OzIHVj617EBFKRQ4Mu3HLqa+vaHUDrNq5H2qALu/qKY
         sUSwR8AXv3KzOurllzSOGxM3NOqVP1uPM9ZSYdE4YhU2BImFb+Jz9ZEqnryQO8dxZkmx
         ruKnbq+jEMzT+Op59cKUbQd+zPfsZsyLgTik2PzfCVOQPbaersOxUlhIDBVXkmXhDgUD
         0nY3vHrgZ8/ommH+wyhX0skRCX7YEa3r+2vKi7XYyoOcRsVnPyr+J26xaHEUHp5fhBh7
         PNCg==
X-Forwarded-Encrypted: i=1; AJvYcCVCggdchHrnxOMOLfRBfULJvx7/Si8HrlTQEqAcy9fUmzOvxGRi91vGZe6bJnmwRgxyrApvQnh0bUTEUPb1@vger.kernel.org
X-Gm-Message-State: AOJu0YwVLGOSxRvLGiL9xQF3xt+qYRDDXKPHPe3hvBd7mPN4d5M6D9Ig
	U4Jz1tO4eg4TFXQ3IpNoDeJiokQ+3W2z737ebEJJ4vSxQ4AQ51pJvoaE+aVF2fo=
X-Google-Smtp-Source: AGHT+IG/Ek58MoJOU03WdW8qGwe1xPyDidYc/xrvDRO8GV/EcGa9nHZYMMFYrvPfBuqu9v5q1wcOFA==
X-Received: by 2002:a05:6512:b29:b0:530:ab68:25c5 with SMTP id 2adb3069b0e04-539ab84e022mr6957139e87.2.1728309425054;
        Mon, 07 Oct 2024 06:57:05 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00-89ea-67f6-92cd-b49.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:89ea:67f6:92cd:b49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-539aff1d2a3sm848229e87.165.2024.10.07.06.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Oct 2024 06:57:04 -0700 (PDT)
Date: Mon, 7 Oct 2024 16:57:03 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1 1/4] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <bmg5em2f673vis6wwtjx6ibkhee7d3zocwesgoafsgt5jxbfqn@w73y6gmzbamj>
References: <20241007084518.3649876-1-quic_ekangupt@quicinc.com>
 <20241007084518.3649876-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241007084518.3649876-2-quic_ekangupt@quicinc.com>

On Mon, Oct 07, 2024 at 02:15:15PM GMT, Ekansh Gupta wrote:
> InvokeV2 request is intended to support multiple enhanced invoke
> requests like CRC check, performance counter enablement and polling
> mode for RPC invocations. CRC check is getting enabled as part of
> this patch. CRC check for input and output argument helps in ensuring
> data consistency over a remote call. If user intends to enable CRC
> check, first local user CRC is calculated at user end and a CRC buffer
> is passed to DSP to capture remote CRC values. DSP is expected to
> write to the remote CRC buffer which is then compared at user level
> with the local CRC values.

This doesn't explain why this is necessary. Why do you need to checksum
arguments?

Also, what if the DSP firmware doesn't support CRC? How should userspace
know that?

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 161 ++++++++++++++++++++++++------------
>  include/uapi/misc/fastrpc.h |   7 ++
>  2 files changed, 116 insertions(+), 52 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 74181b8c386b..8e817a763d1d 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -573,13 +573,15 @@ static void fastrpc_get_buff_overlaps(struct fastrpc_invoke_ctx *ctx)
>  
>  static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  			struct fastrpc_user *user, u32 kernel, u32 sc,
> -			struct fastrpc_invoke_args *args)
> +			struct fastrpc_invoke_v2 *inv2)
>  {
>  	struct fastrpc_channel_ctx *cctx = user->cctx;
>  	struct fastrpc_invoke_ctx *ctx = NULL;
> +	struct fastrpc_invoke_args *args = NULL;

Why do you need to init to NULL if you are going to set it two lines
below?

>  	unsigned long flags;
>  	int ret;
>  
> +	args = (struct fastrpc_invoke_args *)inv2->inv.args;

Why does it need a typecast?

>  	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
>  	if (!ctx)
>  		return ERR_PTR(-ENOMEM);
> @@ -611,6 +613,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	/* Released in fastrpc_context_put() */
>  	fastrpc_channel_ctx_get(cctx);
>  
> +	ctx->crc = (u32 *)(uintptr_t)inv2->crc;

Oh, but why? Also is it a user pointer or in-kernel data? If it's a
user-based pointer, where is the accessiblity check? Why isn't it
annotated properly?

>  	ctx->sc = sc;
>  	ctx->retval = -1;
>  	ctx->pid = current->pid;
> @@ -1070,6 +1073,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	struct fastrpc_invoke_buf *list;
>  	struct fastrpc_phy_page *pages;
>  	u64 *fdlist;
> +	u32 *crclist;
>  	int i, inbufs, outbufs, handles;
>  
>  	inbufs = REMOTE_SCALARS_INBUFS(ctx->sc);
> @@ -1078,6 +1082,7 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  	list = fastrpc_invoke_buf_start(rpra, ctx->nscalars);
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>  	fdlist = (uint64_t *)(pages + inbufs + outbufs + handles);
> +	crclist = (u32 *)(fdlist + FASTRPC_MAX_FDLIST);

I think we should rewrite this parsing somehow. Is the format of data
documented somewhere?

>  
>  	for (i = inbufs; i < ctx->nbufs; ++i) {
>  		if (!ctx->maps[i]) {
> @@ -1102,6 +1107,12 @@ static int fastrpc_put_args(struct fastrpc_invoke_ctx *ctx,
>  			fastrpc_map_put(mmap);
>  	}
>  
> +	if (ctx->crc && crclist && rpra) {
> +		if (copy_to_user((void __user *)ctx->crc, crclist,
> +				FASTRPC_MAX_CRCLIST * sizeof(u32)))

Oh, so it's a user pointer. Then u32* was completely incorrect.
Also you are copying FASTRPC_MAX_CRCLIST elements. Are all of them
filled? Or are we leaking some data to userspace?

> +			return -EFAULT;
> +	}
> +
>  	return 0;
>  }
>  
> @@ -1137,13 +1148,12 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  }
>  
> -static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
> -				   u32 handle, u32 sc,
> -				   struct fastrpc_invoke_args *args)
> +static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel, struct fastrpc_invoke_v2 *inv2)

Please don't touch what doesn't need to be touched. You are replacing
handle/sc/args with inv2, not touching the first line.

>  {
>  	struct fastrpc_invoke_ctx *ctx = NULL;
>  	struct fastrpc_buf *buf, *b;
> -
> +	struct fastrpc_invoke inv;
> +	u32 handle, sc;
>  	int err = 0;
>  
>  	if (!fl->sctx)
> @@ -1152,12 +1162,15 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	if (!fl->cctx->rpdev)
>  		return -EPIPE;
>  
> +	inv = inv2->inv;
> +	handle = inv.handle;
> +	sc = inv.sc;
>  	if (handle == FASTRPC_INIT_HANDLE && !kernel) {
>  		dev_warn_ratelimited(fl->sctx->dev, "user app trying to send a kernel RPC message (%d)\n",  handle);
>  		return -EPERM;
>  	}
>  
> -	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
> +	ctx = fastrpc_context_alloc(fl, kernel, sc, inv2);
>  	if (IS_ERR(ctx))
>  		return PTR_ERR(ctx);
>  
> @@ -1239,6 +1252,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  {
>  	struct fastrpc_init_create_static init;
>  	struct fastrpc_invoke_args *args;
> +	struct fastrpc_invoke_v2 ioctl = {0};

Why do you need to init it?

>  	struct fastrpc_phy_page pages[1];
>  	char *name;
>  	int err;
> @@ -1248,7 +1262,6 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		u32 namelen;
>  		u32 pageslen;
>  	} inbuf;
> -	u32 sc;
>  
>  	args = kcalloc(FASTRPC_CREATE_STATIC_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
>  	if (!args)
> @@ -1313,10 +1326,10 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	args[2].length = sizeof(*pages);
>  	args[2].fd = -1;
>  
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
> -
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				      sc, args);
> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_STATIC, 3, 0);
> +	ioctl.inv.args = (u64)args;

Can you pass it as is, without typecasts?

> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
>  	if (err)
>  		goto err_invoke;
>  
> @@ -1357,6 +1370,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  {
>  	struct fastrpc_init_create init;
>  	struct fastrpc_invoke_args *args;
> +	struct fastrpc_invoke_v2 ioctl = {0};
>  	struct fastrpc_phy_page pages[1];
>  	struct fastrpc_map *map = NULL;
>  	struct fastrpc_buf *imem = NULL;
> @@ -1370,7 +1384,6 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		u32 attrs;
>  		u32 siglen;
>  	} inbuf;
> -	u32 sc;
>  	bool unsigned_module = false;
>  
>  	args = kcalloc(FASTRPC_CREATE_PROCESS_NARGS, sizeof(*args), GFP_KERNEL);
> @@ -1444,12 +1457,12 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  	args[5].length = sizeof(inbuf.siglen);
>  	args[5].fd = -1;
>  
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);
>  	if (init.attrs)
> -		sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
> -
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				      sc, args);
> +		ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);

if (init.attrs)
    ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE_ATTR, 4, 0);
else
    ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_CREATE, 4, 0);

> +	ioctl.inv.args = (u64)args;
> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
>  	if (err)
>  		goto err_invoke;
>  
> @@ -1501,17 +1514,18 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
>  static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>  {
>  	struct fastrpc_invoke_args args[1];
> +	struct fastrpc_invoke_v2 ioctl = {0};
>  	int tgid = 0;
> -	u32 sc;
>  
>  	tgid = fl->tgid;
>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>  	args[0].length = sizeof(tgid);
>  	args[0].fd = -1;
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				       sc, &args[0]);
> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_RELEASE, 1, 0);
> +	ioctl.inv.args = (u64)args;
> +	return fastrpc_internal_invoke(fl, true, &ioctl);
>  }
>  
>  static int fastrpc_device_release(struct inode *inode, struct file *file)
> @@ -1647,45 +1661,77 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  {
>  	struct fastrpc_invoke_args args[1];
> +	struct fastrpc_invoke_v2 ioctl = {0};
>  	int tgid = fl->tgid;
> -	u32 sc;
>  
>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>  	args[0].length = sizeof(tgid);
>  	args[0].fd = -1;
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
>  	fl->pd = pd;
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE,
> -				       sc, &args[0]);
> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_ATTACH, 1, 0);
> +	ioctl.inv.args = (u64)args;
> +	return fastrpc_internal_invoke(fl, true, &ioctl);
>  }
>  
> -static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
> +static int fastrpc_copy_args(struct fastrpc_invoke *inv)
>  {
>  	struct fastrpc_invoke_args *args = NULL;
> -	struct fastrpc_invoke inv;
>  	u32 nscalars;
> -	int err;
> -
> -	if (copy_from_user(&inv, argp, sizeof(inv)))
> -		return -EFAULT;
>  
>  	/* nscalars is truncated here to max supported value */
> -	nscalars = REMOTE_SCALARS_LENGTH(inv.sc);
> +	nscalars = REMOTE_SCALARS_LENGTH(inv->sc);
>  	if (nscalars) {
>  		args = kcalloc(nscalars, sizeof(*args), GFP_KERNEL);
>  		if (!args)
>  			return -ENOMEM;
>  
> -		if (copy_from_user(args, (void __user *)(uintptr_t)inv.args,
> +		if (copy_from_user(args, (void __user *)(uintptr_t)inv->args,

Wait... So inv->args is a user pointer? Then how can you assign a
kernel-based pointer to the same field? I think you need to sanitize
your structures. One is userspace-facing. It should be using userspace
data pointers, etc. Another one is a kernel representation of the ioctl
args. It might have a different structure, it shouldn't contain __user
data, etc.

>  				   nscalars * sizeof(*args))) {
>  			kfree(args);
>  			return -EFAULT;
>  		}
>  	}
> +	inv->args = args;
>  
> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, args);
> -	kfree(args);
> +	return 0;
> +}

Looking at the rest of the code, I think the patch needs to be split.
CRC is the minor issue at this point, please focus on getting existing
data being handled correctly while refactoring the code to use new
structure. I'd suggest seeing two struct definitions: one for the
userspace and another one for the kernel space.

> +
> +static int fastrpc_invoke(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_invoke_v2 ioctl = {0};
> +	struct fastrpc_invoke inv;
> +	int err;
> +
> +	if (copy_from_user(&inv, argp, sizeof(inv)))
> +		return -EFAULT;
> +
> +	err = fastrpc_copy_args(&inv);
> +	if (err)
> +		return err;
> +
> +	ioctl.inv = inv;
> +	err = fastrpc_internal_invoke(fl, false, &ioctl);
> +	kfree(inv.args);
> +
> +	return err;
> +}
> +
> +static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_invoke_v2 inv2 = {0};
> +	int err;
> +
> +	if (copy_from_user(&inv2, argp, sizeof(inv2)))
> +		return -EFAULT;
> +
> +	err = fastrpc_copy_args(&inv2.inv);
> +	if (err)
> +		return err;
> +
> +	err = fastrpc_internal_invoke(fl, false, &inv2);
> +	kfree(inv2.inv.args);
>  
>  	return err;
>  }
> @@ -1694,6 +1740,7 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  				     uint32_t dsp_attr_buf_len)
>  {
>  	struct fastrpc_invoke_args args[2] = { 0 };
> +	struct fastrpc_invoke_v2 ioctl = {0};
>  
>  	/*
>  	 * Capability filled in userspace. This carries the information
> @@ -1710,8 +1757,10 @@ static int fastrpc_get_info_from_dsp(struct fastrpc_user *fl, uint32_t *dsp_attr
>  	args[1].length = dsp_attr_buf_len * sizeof(u32);
>  	args[1].fd = -1;
>  
> -	return fastrpc_internal_invoke(fl, true, FASTRPC_DSP_UTILITIES_HANDLE,
> -				       FASTRPC_SCALARS(0, 1, 1), args);
> +	ioctl.inv.handle = FASTRPC_DSP_UTILITIES_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(0, 1, 1);
> +	ioctl.inv.args = (u64)args;
> +	return fastrpc_internal_invoke(fl, true, &ioctl);
>  }
>  
>  static int fastrpc_get_info_from_kernel(struct fastrpc_ioctl_capability *cap,
> @@ -1798,10 +1847,10 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
> +	struct fastrpc_invoke_v2 ioctl = {0};
>  	struct fastrpc_munmap_req_msg req_msg;
>  	struct device *dev = fl->sctx->dev;
>  	int err;
> -	u32 sc;
>  
>  	req_msg.pgid = fl->tgid;
>  	req_msg.size = buf->size;
> @@ -1810,9 +1859,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
> +	ioctl.inv.args = (u64)args;
> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
>  	if (!err) {
>  		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
>  		spin_lock(&fl->lock);
> @@ -1856,6 +1906,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
> +	struct fastrpc_invoke_v2 ioctl = {0};
>  	struct fastrpc_buf *buf = NULL;
>  	struct fastrpc_mmap_req_msg req_msg;
>  	struct fastrpc_mmap_rsp_msg rsp_msg;
> @@ -1863,7 +1914,6 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	struct fastrpc_req_mmap req;
>  	struct device *dev = fl->sctx->dev;
>  	int err;
> -	u32 sc;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -1906,9 +1956,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
>  	args[2].length = sizeof(rsp_msg);
>  
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
> +	ioctl.inv.args = (u64)args;
> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
>  	if (err) {
>  		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
>  		fastrpc_buf_free(buf);
> @@ -1957,10 +2008,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
>  {
>  	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
> +	struct fastrpc_invoke_v2 ioctl = {0};
>  	struct fastrpc_map *map = NULL, *iter, *m;
>  	struct fastrpc_mem_unmap_req_msg req_msg = { 0 };
>  	int err = 0;
> -	u32 sc;
>  	struct device *dev = fl->sctx->dev;
>  
>  	spin_lock(&fl->lock);
> @@ -1986,9 +2037,10 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>  	args[0].ptr = (u64) (uintptr_t) &req_msg;
>  	args[0].length = sizeof(req_msg);
>  
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
> -				      &args[0]);
> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_UNMAP, 1, 0);
> +	ioctl.inv.args = (u64)args;
> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
>  	if (err) {
>  		dev_err(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
>  		return err;
> @@ -2011,6 +2063,7 @@ static int fastrpc_req_mem_unmap(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  {
>  	struct fastrpc_invoke_args args[4] = { [0 ... 3] = { 0 } };
> +	struct fastrpc_invoke_v2 ioctl = {0};
>  	struct fastrpc_mem_map_req_msg req_msg = { 0 };
>  	struct fastrpc_mmap_rsp_msg rsp_msg = { 0 };
>  	struct fastrpc_mem_unmap req_unmap = { 0 };
> @@ -2019,7 +2072,6 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  	struct device *dev = fl->sctx->dev;
>  	struct fastrpc_map *map = NULL;
>  	int err;
> -	u32 sc;
>  
>  	if (copy_from_user(&req, argp, sizeof(req)))
>  		return -EFAULT;
> @@ -2055,8 +2107,10 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  	args[3].ptr = (u64) (uintptr_t) &rsp_msg;
>  	args[3].length = sizeof(rsp_msg);
>  
> -	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
> -	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc, &args[0]);
> +	ioctl.inv.handle = FASTRPC_INIT_HANDLE;
> +	ioctl.inv.sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MEM_MAP, 3, 1);
> +	ioctl.inv.args = (u64)args;
> +	err = fastrpc_internal_invoke(fl, true, &ioctl);
>  	if (err) {
>  		dev_err(dev, "mem mmap error, fd %d, vaddr %llx, size %lld\n",
>  			req.fd, req.vaddrin, map->size);
> @@ -2096,6 +2150,9 @@ static long fastrpc_device_ioctl(struct file *file, unsigned int cmd,
>  	case FASTRPC_IOCTL_INVOKE:
>  		err = fastrpc_invoke(fl, argp);
>  		break;
> +	case FASTRPC_IOCTL_INVOKEV2:
> +		err = fastrpc_invokev2(fl, argp);
> +		break;
>  	case FASTRPC_IOCTL_INIT_ATTACH:
>  		err = fastrpc_init_attach(fl, ROOT_PD);
>  		break;
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index f33d914d8f46..406b80555d41 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -17,6 +17,7 @@
>  #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>  #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
>  #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
> +#define FASTRPC_IOCTL_INVOKEV2		_IOWR('R', 14, struct fastrpc_invoke_v2)
>  
>  /**
>   * enum fastrpc_map_flags - control flags for mapping memory on DSP user process
> @@ -80,6 +81,12 @@ struct fastrpc_invoke {
>  	__u64 args;
>  };
>  
> +struct fastrpc_invoke_v2 {
> +	struct fastrpc_invoke inv;
> +	__u64 crc;
> +	__u32 reserved[16];
> +};
> +
>  struct fastrpc_init_create {
>  	__u32 filelen;	/* elf file length */
>  	__s32 filefd;	/* fd for the file */
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

