Return-Path: <linux-arm-msm+bounces-20742-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0AB8D1B2E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 14:26:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E2A4C1F21DAC
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 May 2024 12:26:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 923B316DED3;
	Tue, 28 May 2024 12:24:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PC402Fee"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8326516DECC
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 12:24:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716899073; cv=none; b=MniiBLViWdYEMGkQHVK1C2ShoRD4ZpXINHZD59/pxZ75CRsMSAnhZ1w/GUQGePGMW8PZD08z44WcJa6F1iM8q+DF3aESbTyZtpgUbB0iIIiWyDUyPQeEPiNdcDDdVFRrHwfJapCDa6cl0zLUlIVuKpWUthsk13s/RcqXCWuoIgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716899073; c=relaxed/simple;
	bh=lngy222+7dOmVcElbgZl6/B12O/of3XGDMDS/ih5cdw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IRnU3wDPZvSt3mELBuK3ntGVMsZV2Gp6HZQ3WoDipB3A1EdWT2O0pX7Yen3q+Yr548W9XqDucKnXsp7HVyxkGVfL6LVPLyZ0bwr7XSA7J91jfp4xhKGScFGHP75fKXIKy9QBjh1/wDTEeMY9fH56ypI7Gp1fA3SjbP5Wy9R4hjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PC402Fee; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-529661f2552so971327e87.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 May 2024 05:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716899069; x=1717503869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Di6SdGB5s7pnaFriyI9w6u5jFLJd1Zjb6bS1MKEpNlQ=;
        b=PC402FeelN46kFtmKdFxah+KIOZo8Wv4QOWCwdxXhHvBuNZca2UpKoiEOucqaeXym8
         KwEHO0X4H3G2j50ckA6ogA1YpQ2QaX71GuoeckqZuVf5VvJsdRtKHQf6Xr0WfVB7s0wO
         rnBYxcS1176q8aq8iQH9oiGmzJ4QN510yv7dbxEHyX8ATcIE/ZLMtxUdfPuImf5/uNSt
         O/HlUQ2qkXEseqSL/h6a1U1jpVDyQSJR/jSqtd/entmRJY9+WrbXfgu6HLWUZqPUb9wX
         tcGtEt7ZQ/o3XXYRWA6Yz9Hpl9ZmASYQQUci19YoMJIbCjhOHvpViv77Djt4Z5gVB+Mq
         HCAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716899069; x=1717503869;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Di6SdGB5s7pnaFriyI9w6u5jFLJd1Zjb6bS1MKEpNlQ=;
        b=tVu2vJrxMg6OyGvH3ANlegw3r0hSxzr+ugTcppo6pxT2lhuWLbxbUTi+EKFyFoMqXj
         u0snkG3mDwJizGhjX7PsF8pLxyRVuAIMSwpjKrjdAyZlkte+UPw2y4g3HaF14E3Lod5Y
         NpG5MBHje5Grjp5JxHc1niUB+EEEU905j5TR18RR4RpLQfpXLikeNTEBbWT/HCdSEqOE
         USXesPNRj37N+aSgSsuaSQOPF4VmOgcz7ifzENysWnod74JUfPB2ioq5ne8kW9dW63ti
         CAZG3dkn8WKCYK/hMmAuAuwJVkkusCwTVWbHPSSpDm3ts0Ud/2xjDjfP86qjSYXG+L+O
         K0fw==
X-Forwarded-Encrypted: i=1; AJvYcCWuOjsY/w4DA3es0F1FcuP7PNERIYVKW3YrOTHaL+D6unEhogWI4eO4g/H9Mct+/DmJx/VkfC1hnKph7A08uKKofKW68zf9gDPVZd//5g==
X-Gm-Message-State: AOJu0Yxhp1DTPoIesO9mrlyrAYoLrU2PtHXtbf+zjJ2LRrUGf1CMskLH
	1mSyxtdEwTOVwkWlAnPjvcuTwOw1sOR207rd+sYE5GKtn5lUPJLjOXnaeyihV80=
X-Google-Smtp-Source: AGHT+IH25P3O1pwMX+tHbHDiDoML+rIJk2MHKjp6pdNOrYIDPRwvFXe6e2J1AJISL4DyC/Illc0BEw==
X-Received: by 2002:ac2:5e73:0:b0:516:d219:3779 with SMTP id 2adb3069b0e04-52966e9b002mr6817353e87.58.1716899068704;
        Tue, 28 May 2024 05:24:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52970d2a1f6sm942885e87.220.2024.05.28.05.24.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 05:24:28 -0700 (PDT)
Date: Tue, 28 May 2024 15:24:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com
Subject: Re: [PATCH v2 3/8] misc: fastrpc: Add support to save and restore
Message-ID: <un4ofkcenwpkpj2jrasm6duty5ttlva333zqwiw5doabi7zhmu@gqgy5q7lrchk>
References: <20240528112956.5979-1-quic_ekangupt@quicinc.com>
 <20240528112956.5979-4-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240528112956.5979-4-quic_ekangupt@quicinc.com>

On Tue, May 28, 2024 at 04:59:49PM +0530, Ekansh Gupta wrote:
> For any remote call, driver sends a message to DSP using RPMSG
> framework. After message is sent, there is a wait on a completion
> object at driver which is completed when DSP response is received.
> 
> There is a possibility that a signal is received while waiting
> causing the wait function to return -ERESTARTSYS. In this case
> the context should be saved and it should get restored for the
> next invocation for the thread.

Usually a reaction to ERESTARTSYS should be to cancel current task and
return control to userspace, so that it is actually possible to kill the
userspace. Is this the case for FastRPC?

> 
> Adding changes to support saving and restoring of interrupted
> fastrpc contexts.

Please see Documentation/process/submitting-patches.rst for a suggested
language.

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 105 +++++++++++++++++++++++++++--------------
>  1 file changed, 69 insertions(+), 36 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 3e1ab58038ed..6556c63c4ad7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -241,7 +241,6 @@ struct fastrpc_invoke_ctx {
>  	struct kref refcount;
>  	struct list_head node; /* list of ctxs */
>  	struct completion work;
> -	struct work_struct put_work;
>  	struct fastrpc_msg msg;
>  	struct fastrpc_user *fl;
>  	union fastrpc_remote_arg *rpra;
> @@ -276,7 +275,6 @@ struct fastrpc_channel_ctx {
>  	struct fastrpc_device *secure_fdevice;
>  	struct fastrpc_device *fdevice;
>  	struct fastrpc_buf *remote_heap;
> -	struct list_head invoke_interrupted_mmaps;
>  	bool secure;
>  	bool unsigned_support;
>  	u64 dma_mask;
> @@ -292,6 +290,7 @@ struct fastrpc_user {
>  	struct list_head user;
>  	struct list_head maps;
>  	struct list_head pending;
> +	struct list_head interrupted;
>  	struct list_head mmaps;
>  
>  	struct fastrpc_channel_ctx *cctx;
> @@ -513,14 +512,6 @@ static void fastrpc_context_put(struct fastrpc_invoke_ctx *ctx)
>  	kref_put(&ctx->refcount, fastrpc_context_free);
>  }
>  
> -static void fastrpc_context_put_wq(struct work_struct *work)
> -{
> -	struct fastrpc_invoke_ctx *ctx =
> -			container_of(work, struct fastrpc_invoke_ctx, put_work);
> -
> -	fastrpc_context_put(ctx);
> -}
> -
>  #define CMP(aa, bb) ((aa) == (bb) ? 0 : (aa) < (bb) ? -1 : 1)
>  static int olaps_cmp(const void *a, const void *b)
>  {
> @@ -616,7 +607,6 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	ctx->tgid = user->tgid;
>  	ctx->cctx = cctx;
>  	init_completion(&ctx->work);
> -	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
>  
>  	spin_lock(&user->lock);
>  	list_add_tail(&ctx->node, &user->pending);
> @@ -647,6 +637,40 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	return ERR_PTR(ret);
>  }
>  
> +static struct fastrpc_invoke_ctx *fastrpc_context_restore_interrupted(
> +			struct fastrpc_user *fl, u32 sc)

The naming looks misleading. Context is usually some side data which
needs to be saved and restored, while you instead are moving the
context between lists.

> +{
> +	struct fastrpc_invoke_ctx *ctx = NULL, *ictx = NULL, *n;
> +
> +	spin_lock(&fl->lock);
> +	list_for_each_entry_safe(ictx, n, &fl->interrupted, node) {
> +		if (ictx->pid == current->pid) {
> +			if (sc != ictx->sc || ictx->fl != fl) {
> +				dev_err(ictx->fl->sctx->dev,
> +					"interrupted sc (0x%x) or fl (%pK) does not match with invoke sc (0x%x) or fl (%pK)\n",
> +					ictx->sc, ictx->fl, sc, fl);
> +				spin_unlock(&fl->lock);
> +				return ERR_PTR(-EINVAL);
> +			}
> +			ctx = ictx;
> +			list_del(&ctx->node);
> +			list_add_tail(&ctx->node, &fl->pending);
> +			break;
> +		}
> +	}
> +	spin_unlock(&fl->lock);
> +	return ctx;
> +}
> +
> +static void fastrpc_context_save_interrupted(
> +			struct fastrpc_invoke_ctx *ctx)
> +{
> +	spin_lock(&ctx->fl->lock);
> +	list_del(&ctx->node);
> +	list_add_tail(&ctx->node, &ctx->fl->interrupted);
> +	spin_unlock(&ctx->fl->lock);
> +}
> +
>  static struct sg_table *
>  fastrpc_map_dma_buf(struct dma_buf_attachment *attachment,
>  		    enum dma_data_direction dir)
> @@ -1138,7 +1162,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   struct fastrpc_invoke_args *args)
>  {
>  	struct fastrpc_invoke_ctx *ctx = NULL;
> -	struct fastrpc_buf *buf, *b;
>  
>  	int err = 0;
>  
> @@ -1153,6 +1176,14 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  		return -EPERM;
>  	}
>  
> +	if (!kernel) {
> +		ctx = fastrpc_context_restore_interrupted(fl, sc);
> +		if (IS_ERR(ctx))
> +			return PTR_ERR(ctx);
> +		if (ctx)
> +			goto wait;
> +	}
> +
>  	ctx = fastrpc_context_alloc(fl, kernel, sc, args);
>  	if (IS_ERR(ctx))
>  		return PTR_ERR(ctx);
> @@ -1168,6 +1199,7 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	if (err)
>  		goto bail;
>  
> +wait:
>  	if (kernel) {
>  		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
>  			err = -ETIMEDOUT;
> @@ -1191,7 +1223,9 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  		goto bail;
>  
>  bail:
> -	if (err != -ERESTARTSYS && err != -ETIMEDOUT) {
> +	if (ctx && err == -ERESTARTSYS) {
> +		fastrpc_context_save_interrupted(ctx);
> +	} else if (ctx) {
>  		/* We are done with this compute context */
>  		spin_lock(&fl->lock);
>  		list_del(&ctx->node);
> @@ -1199,13 +1233,6 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  		fastrpc_context_put(ctx);
>  	}
>  
> -	if (err == -ERESTARTSYS) {
> -		list_for_each_entry_safe(buf, b, &fl->mmaps, node) {
> -			list_del(&buf->node);
> -			list_add_tail(&buf->node, &fl->cctx->invoke_interrupted_mmaps);
> -		}
> -	}
> -
>  	if (err)
>  		dev_dbg(fl->sctx->dev, "Error: Invoke Failed %d\n", err);
>  
> @@ -1496,6 +1523,25 @@ static void fastrpc_session_free(struct fastrpc_channel_ctx *cctx,
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  }
>  
> +static void fastrpc_context_list_free(struct fastrpc_user *fl)
> +{
> +	struct fastrpc_invoke_ctx *ctx, *n;
> +
> +	list_for_each_entry_safe(ctx, n, &fl->interrupted, node) {
> +		spin_lock(&fl->lock);
> +		list_del(&ctx->node);
> +		spin_unlock(&fl->lock);
> +		fastrpc_context_put(ctx);
> +	}
> +
> +	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
> +		spin_lock(&fl->lock);
> +		list_del(&ctx->node);
> +		spin_unlock(&fl->lock);
> +		fastrpc_context_put(ctx);
> +	}
> +}
> +
>  static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>  {
>  	struct fastrpc_invoke_args args[1];
> @@ -1516,7 +1562,6 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>  {
>  	struct fastrpc_user *fl = (struct fastrpc_user *)file->private_data;
>  	struct fastrpc_channel_ctx *cctx = fl->cctx;
> -	struct fastrpc_invoke_ctx *ctx, *n;
>  	struct fastrpc_map *map, *m;
>  	struct fastrpc_buf *buf, *b;
>  	unsigned long flags;
> @@ -1530,10 +1575,7 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>  	if (fl->init_mem)
>  		fastrpc_buf_free(fl->init_mem);
>  
> -	list_for_each_entry_safe(ctx, n, &fl->pending, node) {
> -		list_del(&ctx->node);
> -		fastrpc_context_put(ctx);
> -	}
> +	fastrpc_context_list_free(fl);
>  
>  	list_for_each_entry_safe(map, m, &fl->maps, node)
>  		fastrpc_map_put(map);
> @@ -1574,6 +1616,7 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	spin_lock_init(&fl->lock);
>  	mutex_init(&fl->mutex);
>  	INIT_LIST_HEAD(&fl->pending);
> +	INIT_LIST_HEAD(&fl->interrupted);
>  	INIT_LIST_HEAD(&fl->maps);
>  	INIT_LIST_HEAD(&fl->mmaps);
>  	INIT_LIST_HEAD(&fl->user);
> @@ -2332,7 +2375,6 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	rdev->dma_mask = &data->dma_mask;
>  	dma_set_mask_and_coherent(rdev, DMA_BIT_MASK(32));
>  	INIT_LIST_HEAD(&data->users);
> -	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
>  	spin_lock_init(&data->lock);
>  	idr_init(&data->ctx_idr);
>  	data->domain_id = domain_id;
> @@ -2370,7 +2412,6 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
>  static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  {
>  	struct fastrpc_channel_ctx *cctx = dev_get_drvdata(&rpdev->dev);
> -	struct fastrpc_buf *buf, *b;
>  	struct fastrpc_user *user;
>  	unsigned long flags;
>  
> @@ -2387,9 +2428,6 @@ static void fastrpc_rpmsg_remove(struct rpmsg_device *rpdev)
>  	if (cctx->secure_fdevice)
>  		misc_deregister(&cctx->secure_fdevice->miscdev);
>  
> -	list_for_each_entry_safe(buf, b, &cctx->invoke_interrupted_mmaps, node)
> -		list_del(&buf->node);
> -
>  	if (cctx->remote_heap)
>  		fastrpc_buf_free(cctx->remote_heap);
>  
> @@ -2424,12 +2462,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	ctx->retval = rsp->retval;
>  	complete(&ctx->work);
>  
> -	/*
> -	 * The DMA buffer associated with the context cannot be freed in
> -	 * interrupt context so schedule it through a worker thread to
> -	 * avoid a kernel BUG.
> -	 */
> -	schedule_work(&ctx->put_work);
> +	fastrpc_context_put(ctx);
>  
>  	return 0;
>  }
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

