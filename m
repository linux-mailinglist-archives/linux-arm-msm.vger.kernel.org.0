Return-Path: <linux-arm-msm+bounces-38719-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E55229D5556
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 23:21:43 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4DD7CB2262B
	for <lists+linux-arm-msm@lfdr.de>; Thu, 21 Nov 2024 22:21:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 404EF1DA2F6;
	Thu, 21 Nov 2024 22:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yICsTV9G"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 072621BD031
	for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 22:21:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732227693; cv=none; b=kdWMu9dekJwPZ5R8NP4Mu1zI3d5WNglUq6NS5zXdX65zrWaaXTuk/LNL8tWksIapeAuqwCotdqOtb4JJiJUa8RqUK9dVi+bAgNLdavg/GoxjgS7/SJMPcHASaBEM4Q1Bi8ZTIRo6goFh41kL0kEl5r4hLKFE3877DyB1HVcuPuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732227693; c=relaxed/simple;
	bh=2uiflzLu89fCix5FAmFqtdAm286Xf/gJWWObuyXivT8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ukFFRTKOQoz52FcQWCquIPplbG2Gmu2bMVYhb4MYFhT4uEHfxvhgacw/LJsgtghGU9LLu443Plmsng5E7i9bAB3dLjpP9LpHtWoKLD9IMsatupyAVbzxMSho+dCpKFX6yyFhO8SQMd22P44zGItCnBb0Va28jP+BDInXsI3S6Q8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yICsTV9G; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-539f8490856so1526617e87.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 21 Nov 2024 14:21:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732227688; x=1732832488; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/bV+YDLNC6t3uu5ehH186iNip1qaiSalM00KlqWXr9I=;
        b=yICsTV9GCAn+rdJrRJOCzirHzuoBbOAsdmsRUtlW5z7xxLKhdmVzo0gxMQGs6wS9oc
         KsbJW+FDFqnydLfPlwMo+XQMI18R+CXJ6h9bBDQSgeRdc2zvpqFG+TcUszPw28N7nE3h
         54tqZNl+LlZcMlM99/bbJDmnvsS9O5S39k6sibVUlc2CnEy18aShzHCgUjkb7n2t7tnQ
         h8lU6cXtf1QsJ7pj0A1dPM9o7a5fIFsYXpHhDmLy3Yl+9nFaqgWQanlCHweZduPFinB0
         kErBRnufwYsj+X0rkDeseUy9m2agutO6ntlzu6aw9Mw+M/6isYn7190bLk08i2VjggjA
         /Lzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732227688; x=1732832488;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/bV+YDLNC6t3uu5ehH186iNip1qaiSalM00KlqWXr9I=;
        b=UIi7i2nbCxDOkUHWRPfe4mUj0EyPUgNlzoTggpJYfIpSoSULGG1JdlG8yShZJblh3v
         0ga5Wlwsuw07zO6vieHto/hjOsNCT6njtorEOphv3WjjkkY3+315K+jo4iTWcDLyIYsx
         8aujUk4pSi0uXxWhR9keckVXiAtKYfo67vsv0oDVROMpKKErvlInwIGGwQoW9jQE93KF
         Kze1fo7WgNklOuSLp2gQMviRfVfNfbgVVijUtKyy4xAeDn+Hv3hqVgfy9ZvRATHwMIvl
         HKFxa3YZN37Kbnj4uG1im0VVWL6K6ZcgUmoW2gDrvV1byfc7n2G5TLXdeXdK9uzWvLI2
         v8pA==
X-Forwarded-Encrypted: i=1; AJvYcCW5rlBx7a1dYApvBS9Yy2zKsToxMihp2/KfDQQHzsz9rFmECKKLjDo/m6Nz8Txt22Ulrb7AyNqgS7/RCl+y@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ7uh15FgseqmXgyxXsrMzCDyVDpvIJREvBo25FoMpJ6c+41TN
	EBfRxj6a/78d8MoZHpE56ssWgD6OQ8NrZ1StJlazpa2h6S0YCPBuajlf+GWVpCM=
X-Gm-Gg: ASbGnct8nkxIDND2huukxrcdUfZhgcXpNEIwPHjfXtm2qxf9kGQ0BCHtL338lpZusJ0
	K2Srva7FKm/nwFJf4tyQ06+1VuIBzbL8YAeSDiQGsEWV8S4Jyr8NpDLOJxpmZjxnvxTP0Mpj46L
	D09exWmJgfvdCJRM3aoMI5Y+s0atLlR8fQvGLaBPj5EydL5kf5wuHiTUhA4aVqF5lv2bFl/COke
	j3F43v06VHPiMZ/+5hAMOELBLg4qsg1Uvnfbelup88nj6DKAeIR1DQHdMSilit1dx4ET2MSaQHZ
	q+o69sXQHNRHkjX7WzHIFDuMum2Gtw==
X-Google-Smtp-Source: AGHT+IHgawWZmtMYB2EmVYWvVv+KZ0zon62h6tUD/ZDy0u3J3zL+Ij/TVhFpheyT2QPgFSezHN8FYw==
X-Received: by 2002:a05:6512:32c9:b0:539:f035:e158 with SMTP id 2adb3069b0e04-53dd35a8cd4mr198046e87.18.1732227688011;
        Thu, 21 Nov 2024 14:21:28 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53dd2451903sm98685e87.89.2024.11.21.14.21.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 14:21:26 -0800 (PST)
Date: Fri, 22 Nov 2024 00:21:24 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v4 1/2] misc: fastrpc: Add support for multiple PD from
 one process
Message-ID: <kq7vgfvzqhkq6kzu2zg7vr2ya5tp3igrhnqjaztwqkarh35hsf@xylvm4b4r6bu>
References: <20241121084713.2599904-1-quic_ekangupt@quicinc.com>
 <20241121084713.2599904-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241121084713.2599904-2-quic_ekangupt@quicinc.com>

On Thu, Nov 21, 2024 at 02:17:12PM +0530, Ekansh Gupta wrote:
> Memory intensive applications(which requires more tha 4GB) that wants
> to offload tasks to DSP might have to split the tasks to multiple
> user PD to make the resources available.
> 
> For every call to DSP, fastrpc driver passes the process tgid which
> works as an identifier for the DSP to enqueue the tasks to specific PD.
> With current design, if any process opens device node more than once
> and makes PD init request, same tgid will be passed to DSP which will
> be considered a bad request and this will result in failure as the same
> identifier cannot be used for multiple DSP PD.
> 
> Assign and pass a client ID to DSP which would be assigned during device
> open and will be dependent on the index of session allocated for the PD.
> This will allow the same process to open the device more than once and
> spawn multiple dynamic PD for ease of processing.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
>  1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 74181b8c386b..08f223c95c33 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -39,6 +39,7 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CLIENTID_MASK GENMASK(4, 4)

GENMASK(4,4) is just BIT(4), isn't it?

>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -299,7 +300,7 @@ struct fastrpc_user {
>  	struct fastrpc_session_ctx *sctx;
>  	struct fastrpc_buf *init_mem;
>  
> -	int tgid;
> +	int client_id;
>  	int pd;
>  	bool is_secure_dev;
>  	/* Lock for lists */
> @@ -614,7 +615,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  	ctx->sc = sc;
>  	ctx->retval = -1;
>  	ctx->pid = current->pid;
> -	ctx->tgid = user->tgid;
> +	ctx->tgid = user->client_id;
>  	ctx->cctx = cctx;
>  	init_completion(&ctx->work);
>  	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
> @@ -1115,7 +1116,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  	int ret;
>  
>  	cctx = fl->cctx;
> -	msg->pid = fl->tgid;
> +	msg->pid = fl->client_id;
>  	msg->tid = current->pid;
>  
>  	if (kernel)
> @@ -1293,7 +1294,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		}
>  	}
>  
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->client_id;
>  	inbuf.namelen = init.namelen;
>  	inbuf.pageslen = 0;
>  	fl->pd = USER_PD;
> @@ -1395,7 +1396,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->client_id;
>  	inbuf.namelen = strlen(current->comm) + 1;
>  	inbuf.filelen = init.filelen;
>  	inbuf.pageslen = 1;
> @@ -1469,8 +1470,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  }
>  
>  static struct fastrpc_session_ctx *fastrpc_session_alloc(
> -					struct fastrpc_channel_ctx *cctx)
> +					struct fastrpc_user *fl)
>  {
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>  	struct fastrpc_session_ctx *session = NULL;
>  	unsigned long flags;
>  	int i;
> @@ -1480,6 +1482,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
>  		if (!cctx->session[i].used && cctx->session[i].valid) {
>  			cctx->session[i].used = true;
>  			session = &cctx->session[i];
> +			fl->client_id = FASTRPC_CLIENTID_MASK | i;

So, it's not a mask, but a flag. Why is it necessary at all? Can you
just pass i? Or i+1?

>  			break;
>  		}
>  	}
> @@ -1504,7 +1507,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>  	int tgid = 0;
>  	u32 sc;
>  
> -	tgid = fl->tgid;
> +	tgid = fl->client_id;
>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>  	args[0].length = sizeof(tgid);
>  	args[0].fd = -1;
> @@ -1579,11 +1582,10 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	INIT_LIST_HEAD(&fl->maps);
>  	INIT_LIST_HEAD(&fl->mmaps);
>  	INIT_LIST_HEAD(&fl->user);
> -	fl->tgid = current->tgid;
>  	fl->cctx = cctx;
>  	fl->is_secure_dev = fdevice->secure;
>  
> -	fl->sctx = fastrpc_session_alloc(cctx);
> +	fl->sctx = fastrpc_session_alloc(fl);
>  	if (!fl->sctx) {
>  		dev_err(&cctx->rpdev->dev, "No session available\n");
>  		mutex_destroy(&fl->mutex);
> @@ -1647,7 +1649,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  {
>  	struct fastrpc_invoke_args args[1];
> -	int tgid = fl->tgid;
> +	int tgid = fl->client_id;
>  	u32 sc;
>  
>  	args[0].ptr = (u64)(uintptr_t) &tgid;
> @@ -1803,7 +1805,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	int err;
>  	u32 sc;
>  
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>  	req_msg.size = buf->size;
>  	req_msg.vaddr = buf->raddr;
>  
> @@ -1889,7 +1891,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		return err;
>  	}
>  
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>  	req_msg.flags = req.flags;
>  	req_msg.vaddr = req.vaddrin;
>  	req_msg.num = sizeof(pages);
> @@ -1978,7 +1980,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>  		return -EINVAL;
>  	}
>  
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>  	req_msg.len = map->len;
>  	req_msg.vaddrin = map->raddr;
>  	req_msg.fd = map->fd;
> @@ -2031,7 +2033,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  		return err;
>  	}
>  
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>  	req_msg.fd = req.fd;
>  	req_msg.offset = req.offset;
>  	req_msg.vaddrin = req.vaddrin;
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

