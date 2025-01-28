Return-Path: <linux-arm-msm+bounces-46424-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id D206DA214FA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:29:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3AE5F164FAA
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:29:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 17A4E1EEA2C;
	Tue, 28 Jan 2025 23:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VXuIgSc2"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 812EC1E7C27
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 23:29:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738106986; cv=none; b=TczJSuKh+jX1sIREuMv2rXCFj1ebR1SPIT/+fFLkO9gSRcwv3xHxDmJoAZ9+DqwP2PuIstEVOCMRqExRIw7+1BGI+5kxLe7fHLVilkjuwxGT66ZsFLJ8q40fOmcwAIgK4sIA74ntsNy8Iv8XI9okiWARemMc//Pw/kIDueH7JuY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738106986; c=relaxed/simple;
	bh=ZUdQ5h0nhb0JKJswXcfQkKgdRblpHekbs7ZBOiZpbsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCyAS3/WiXnlCvPvHshaMUdgPU7i0nkci+dXjn7iQWCOYBxaV2IPRsFTFJF3tqZ9i91fg0QbWuJFsXV8CD1+s36CF0TI6M61UfEoOztFBC26o/CqJHnD8ULWl9PQvGapYxMhXNmrzlLwGx9NjB7uAOVDjOZYMaIMraUoB+jjK2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VXuIgSc2; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30738a717ffso55535761fa.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 15:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738106980; x=1738711780; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=w7OIgFhlkkrFgWjywD/JETEwGWuIA1m2ZWNyQT6x6+w=;
        b=VXuIgSc2DeIBEZ00AsDzwePO51lo9cfOtAH6PEeNHSAGbA2mN9xFCYRZ+uEtfHU7nP
         BjOmd/U0VnkVvJ0pHO4OfNyXWtjYMgmppwHk6whakBLuFEtQ3gII1d4ZVc+mz+ZrKD/h
         4+h+tjMpeNcH4ck3JcrHh8oqFRqpdRVigJxH4AhRnqCObcD9vo7V056HSysUdGrMXjF7
         iE4ACZd48WJz1UbuKNF2xO23jxb98gke3rKc2TkpzwxoWgD5Y57kpIYNYtm0UC9UkVEQ
         WTa0/NttoknAkzd0wZtTXgDrYiRYBsNt6NkuBvb3DEKiOvk1Cdp1Vtj84EgBMuIR+QQ+
         ZCmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738106980; x=1738711780;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=w7OIgFhlkkrFgWjywD/JETEwGWuIA1m2ZWNyQT6x6+w=;
        b=cGLMHE5jCLGmry/V7i/K6nlO2LKSjntABLlO/WH3HDgYzggn4kIwwXLVMss4+kl1dY
         fXNgpTcX3HbVvLUajVGpSKD9/lfl0ZkYyeH4Ni13W+bejbxrT8qYxKnzfGtC1hlSH2we
         CkRtFtA7jyBvtF5TvJbyR7I0X1VG3gfxlWV/aBD/PRKV8V11D+C3FyjS+ZZIUiBjL9yU
         aKP+Avjpjh+//pdrODfGTC7anS/+jtw7MXeIUTwzZrlD9hs6G1GOWiV4BcV0uD3cmvSw
         faZxKA8yO/vU7EX4nqrdLFcLvSzs+R/8pkoKEbIVeKLw8d428BWTy5B9g8xMgUP9xW4q
         6McQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrljWS7fVRsafkjOOP6hp1UpWdh7VMzU4KJEXDm/A0fCZ3y8v2FObc3rg67w2CIlzOL9+f3m5G0PX8BCtR@vger.kernel.org
X-Gm-Message-State: AOJu0YyPVk6A1w2Z34o2bX7Wxm6rqp6Sv1OmsMi/tn78ftFBvflSxcTj
	OZuZxfMi6iSvtP9c49VUsLgG1ZvKd2VeKWkZZ069YuR2mPWfF0HuR+/vzEkNoh9ghM0X2BspGfH
	EQzU=
X-Gm-Gg: ASbGncsP6UrtB88AmFGsIPvHeSMCoBH02UzsWo7uuJX8T8wq6r3YZokIL8g0oew7tpx
	iISNKilm6j3KWICi8YFk+wmogXom3F8jfFGmcZkVSnDqhL+aWtidvnOkDJkN3poFCp3mApwQ4kA
	qsoxti+o2GvbqbeCGbhnCwS+iIa4uvroxsVWLV75aLblMq/rij8iEF6cUIl7FbD4sQ+CIxzofbY
	amADi1+PXIEMK2rwgktJfiLbwNbi2W5JjV+MlkOa1JGpvRCRFxvarJdkmzzkBM4LDNwIgUjvn8H
	CbV4E9OMPJLYoPN4eJnmjlCbcWk5RB/xxN6I8au79CjB2HsZeoHsqNGzbCnLB/GTJ5L+qCE=
X-Google-Smtp-Source: AGHT+IE0Elh4h3IqEexBWd2peVETeEKLBTLivMSZVyRNqEnvSMP1yfRj3qQZc+kvgMwJJLMz5yToPw==
X-Received: by 2002:a05:651c:1501:b0:302:40ec:a1b3 with SMTP id 38308e7fff4ca-307968ef225mr3787891fa.21.1738106980409;
        Tue, 28 Jan 2025 15:29:40 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076bc49bedsm19771801fa.95.2025.01.28.15.29.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 15:29:39 -0800 (PST)
Date: Wed, 29 Jan 2025 01:29:37 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 4/5] misc: fastrpc: Add polling mode support for
 fastRPC driver
Message-ID: <hgox77a7e6zzriltwhzzciau6u2pmil4y3rl5o2l6zkp4fmlmp@q2dai5fxcvtq>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-5-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-5-quic_ekangupt@quicinc.com>

On Mon, Jan 27, 2025 at 10:12:38AM +0530, Ekansh Gupta wrote:
> For any remote call to DSP, after sending an invocation message,
> fastRPC driver waits for glink response and during this time the
> CPU can go into low power modes. Adding a polling mode support
> with which fastRPC driver will poll continuously on a memory
> after sending a message to remote subsystem which will eliminate
> CPU wakeup and scheduling latencies and reduce fastRPC overhead.
> With this change, DSP always sends a glink response which will
> get ignored if polling mode didn't time out.

Is there a chance to implement actual async I/O protocol with the help
of the poll() call instead of hiding the polling / wait inside the
invoke2?

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 122 +++++++++++++++++++++++++++++++++---
>  include/uapi/misc/fastrpc.h |   3 +-
>  2 files changed, 114 insertions(+), 11 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index cfacee0dded5..257a741af115 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -19,6 +19,7 @@
>  #include <linux/rpmsg.h>
>  #include <linux/scatterlist.h>
>  #include <linux/slab.h>
> +#include <linux/delay.h>
>  #include <linux/firmware/qcom/qcom_scm.h>
>  #include <uapi/misc/fastrpc.h>
>  #include <linux/of_reserved_mem.h>
> @@ -38,6 +39,7 @@
>  #define FASTRPC_CTX_MAX (256)
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
> +#define FASTRPC_MAX_STATIC_HANDLE (20)
>  #define FASTRPC_CTXID_MASK (0xFF0)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
> @@ -106,6 +108,19 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +/* Poll response number from remote processor for call completion */
> +#define FASTRPC_POLL_RESPONSE (0xdecaf)
> +/* timeout in us for polling until memory barrier */
> +#define FASTRPC_POLL_TIME_MEM_UPDATE (500)
> +
> +/* Response types supported for RPC calls */
> +enum fastrpc_response_flags {
> +	/* normal job completion glink response */
> +	NORMAL_RESPONSE = 0,
> +	/* process updates poll memory instead of glink response */
> +	POLL_MODE = 1,
> +};
> +
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>  						"sdsp", "cdsp", "cdsp1" };
>  struct fastrpc_phy_page {
> @@ -238,9 +253,16 @@ struct fastrpc_invoke_ctx {
>  	u32 sc;
>  	u64 *fdlist;
>  	u32 *crclist;
> +	u32 *poll;
>  	void __user *crc;
>  	u64 ctxid;
>  	u64 msg_sz;
> +	/* Threads poll for specified timeout and fall back to glink wait */
> +	u64 poll_timeout;
> +	/* work done status flag */
> +	bool is_work_done;
> +	/* response flags from remote processor */
> +	enum fastrpc_response_flags rsp_flags;
>  	struct kref refcount;
>  	struct list_head node; /* list of ctxs */
>  	struct completion work;
> @@ -258,6 +280,7 @@ struct fastrpc_invoke_ctx {
>  struct fastrpc_ctx_args {
>  	struct fastrpc_invoke_args *args;
>  	void __user *crc;
> +	u64 poll_timeout;
>  };
>  
>  struct fastrpc_session_ctx {
> @@ -619,11 +642,14 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	fastrpc_channel_ctx_get(cctx);
>  
>  	ctx->crc = cargs->crc;
> +	ctx->poll_timeout = cargs->poll_timeout;
>  	ctx->sc = sc;
>  	ctx->retval = -1;
>  	ctx->pid = current->pid;
>  	ctx->client_id = user->client_id;
>  	ctx->cctx = cctx;
> +	ctx->rsp_flags = NORMAL_RESPONSE;
> +	ctx->is_work_done = false;
>  	init_completion(&ctx->work);
>  	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
>  
> @@ -882,7 +908,8 @@ static int fastrpc_get_meta_size(struct fastrpc_invoke_ctx *ctx)
>  		sizeof(struct fastrpc_invoke_buf) +
>  		sizeof(struct fastrpc_phy_page)) * ctx->nscalars +
>  		sizeof(u64) * FASTRPC_MAX_FDLIST +
> -		sizeof(u32) * FASTRPC_MAX_CRCLIST;
> +		sizeof(u32) * FASTRPC_MAX_CRCLIST +
> +		sizeof(u32);
>  
>  	return size;
>  }
> @@ -975,6 +1002,8 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  	pages = fastrpc_phy_page_start(list, ctx->nscalars);
>  	ctx->fdlist = (u64 *)(pages + ctx->nscalars);
>  	ctx->crclist = (u32 *)(ctx->fdlist + FASTRPC_MAX_FDLIST);
> +	ctx->poll = (u32 *)(ctx->crclist + FASTRPC_MAX_CRCLIST);
> +
>  	args = (uintptr_t)ctx->buf->virt + metalen;
>  	rlen = pkt_size - metalen;
>  	ctx->rpra = rpra;
> @@ -1145,6 +1174,72 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  
>  }
>  
> +static int poll_for_remote_response(struct fastrpc_invoke_ctx *ctx, u64 timeout)
> +{
> +	int err = -EIO, i, j;
> +
> +	/* poll on memory for DSP response. Return failure on timeout */
> +	for (i = 0, j = 0; i < timeout; i++, j++) {
> +		if (*ctx->poll == FASTRPC_POLL_RESPONSE) {
> +			err = 0;
> +			ctx->is_work_done = true;
> +			ctx->retval = 0;
> +			break;
> +		}
> +		if (j == FASTRPC_POLL_TIME_MEM_UPDATE) {
> +			/* make sure that all poll memory writes by DSP are seen by CPU */
> +			dma_rmb();
> +			j = 0;
> +		}
> +		udelay(1);
> +	}
> +	return err;
> +}
> +
> +static inline int fastrpc_wait_for_response(struct fastrpc_invoke_ctx *ctx,
> +						u32 kernel)
> +{
> +	int err = 0;
> +
> +	if (kernel) {
> +		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> +			err = -ETIMEDOUT;
> +	} else {
> +		err = wait_for_completion_interruptible(&ctx->work);
> +	}
> +
> +	return err;
> +}
> +
> +static int fastrpc_wait_for_completion(struct fastrpc_invoke_ctx *ctx,
> +					u32 kernel)
> +{
> +	int err;
> +
> +	do {
> +		switch (ctx->rsp_flags) {
> +		case NORMAL_RESPONSE:
> +			err = fastrpc_wait_for_response(ctx, kernel);
> +			if (err || ctx->is_work_done)
> +				return err;
> +			break;
> +		case POLL_MODE:
> +			err = poll_for_remote_response(ctx, ctx->poll_timeout);
> +			/* If polling timed out, move to normal response mode */
> +			if (err)
> +				ctx->rsp_flags = NORMAL_RESPONSE;
> +			break;
> +		default:
> +			err = -EBADR;
> +			dev_dbg(ctx->fl->sctx->dev,
> +				"unsupported response type:0x%x\n", ctx->rsp_flags);
> +			break;
> +		}
> +	} while (!ctx->is_work_done);
> +
> +	return err;
> +}
> +
>  static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  				   u32 handle, u32 sc,
>  				   struct fastrpc_ctx_args *cargs)
> @@ -1180,16 +1275,20 @@ static int fastrpc_internal_invoke(struct fastrpc_user *fl,  u32 kernel,
>  	if (err)
>  		goto bail;
>  
> -	if (kernel) {
> -		if (!wait_for_completion_timeout(&ctx->work, 10 * HZ))
> -			err = -ETIMEDOUT;
> -	} else {
> -		err = wait_for_completion_interruptible(&ctx->work);
> -	}
> +	if (ctx->poll_timeout != 0 && handle > FASTRPC_MAX_STATIC_HANDLE
> +	    && fl->pd == USER_PD)
> +		ctx->rsp_flags = POLL_MODE;
>  
> +	err = fastrpc_wait_for_completion(ctx, kernel);
>  	if (err)
>  		goto bail;
>  
> +	if (!ctx->is_work_done) {
> +		err = -ETIMEDOUT;
> +		dev_dbg(fl->sctx->dev, "Invalid workdone state for handle 0x%x, sc 0x%x\n",
> +			handle, sc);
> +		goto bail;
> +	}
>  	/* make sure that all memory writes by DSP are seen by CPU */
>  	dma_rmb();
>  	/* populate all the output buffers with results */
> @@ -1769,7 +1868,7 @@ static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
>  		return -EFAULT;
>  
>  	/* Check if all reserved fields are zero */
> -	for (i = 0; i < 16; i++) {
> +	for (i = 0; i < 14; i++) {
>  		if (inv2.reserved[i] != 0)
>  			return -EINVAL;
>  	}
> @@ -1779,6 +1878,7 @@ static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
>  		return -ENOMEM;
>  
>  	cargs->crc = (void __user *)(uintptr_t)inv2.crc;
> +	cargs->poll_timeout = inv2.poll_timeout;
>  
>  	err = fastrpc_remote_invoke(fl, &inv2.inv, cargs);
>  	kfree(cargs);
> @@ -2581,12 +2681,14 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
> +	/* Ignore this failure as context returned will be NULL for polling mode */
>  	if (!ctx) {
> -		dev_err(&rpdev->dev, "No context ID matches response\n");
> -		return -ENOENT;
> +		dev_dbg(&rpdev->dev, "No context ID matches response\n");
> +		return 0;
>  	}
>  
>  	ctx->retval = rsp->retval;
> +	ctx->is_work_done = true;
>  	complete(&ctx->work);
>  
>  	/*
> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index 406b80555d41..1920c537bbbf 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -84,7 +84,8 @@ struct fastrpc_invoke {
>  struct fastrpc_invoke_v2 {
>  	struct fastrpc_invoke inv;
>  	__u64 crc;
> -	__u32 reserved[16];
> +	__u64 poll_timeout;
> +	__u32 reserved[14];
>  };
>  
>  struct fastrpc_init_create {
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

