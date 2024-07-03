Return-Path: <linux-arm-msm+bounces-25107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id CE4499259CE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 12:50:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5D1A01F22267
	for <lists+linux-arm-msm@lfdr.de>; Wed,  3 Jul 2024 10:50:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1AD6E17B435;
	Wed,  3 Jul 2024 10:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kCVm5Mmy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5DD413A27E
	for <linux-arm-msm@vger.kernel.org>; Wed,  3 Jul 2024 10:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720003329; cv=none; b=lgLXBGVmD1cLwTwRSZUe5LhneZTS7mi/a4t8yEjGlST4gVBuDe/Ddh+stcVEZOIxf2wIVCbepkp9vPScxOaS4RJlMgdHeNaaHC3cqdggbZgNgPOrQmrT47QyKS9XarmhpYos7tWJYlHRQxaJTuMZVf13KvsFt8frv/knvAbF904=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720003329; c=relaxed/simple;
	bh=2axXuwag9bO9voNY8L88Qbiw5qklgN5OT3VVR8tuypU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ic8yGUvTD5NKccSHTHZBYeLe7+CaoOXkk60RnLzBqljlqXJmOCzPydxfhjVVUi3bIhbDQbseCdy/Xbu2fOBIhz3XVf6AZvfqvVt+a3tZFv0GpbrLU+1EyqW37VidycOWkf40+3ZPznhoTvfYk0MarRuLnoqTDy1XyJAMqNMfgfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kCVm5Mmy; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2ebe40673e8so63503141fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 03 Jul 2024 03:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720003324; x=1720608124; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kRlJDz1/NCn52902NbDQi8qT96+igacK76qz9NDn/p4=;
        b=kCVm5MmypNmy+PIwQU6V8dFtWFQsmoKI+LfxnXmGVGB8750xo4kUW9LgFc8EDMUvOL
         WZGb7sWkKdyyy/v+G4cuqesmDDRH3EJTJ7lwEtxlOuJU+tWftJFaUM1hwZ1Yee7Mdoai
         PE/gRMllR7JjVUoz2ZJ0hDasjsV8QLNfGsFlCLJYlDV7vKCHQl5QYZRm1MuI/C3w1QeG
         UomwRAErGuu10aII/y3huX72UpCTgoIJ/pfeDW0f6ln5O+d9hcRJfpvBku3BaboTWtbP
         a/TzWYMShyQQdCGfLfYfaQ4KKw2HvWn6MpnkQJpqbyJg6wEPiDaly0eEfp9rwJV0GWvV
         XSmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720003324; x=1720608124;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRlJDz1/NCn52902NbDQi8qT96+igacK76qz9NDn/p4=;
        b=XcfIDsfFHegAAzQz4UpJgSidYQAqZrAIvBwn6Xx23YTprscowZuCdY2mxUIXnEZ01l
         BokKUFNngMoZJgulPH8MF8UkH/VY5uJcFLzu4wVSZ8U6VtRm5RH57DcTmiaMS8OLU4yr
         TPtUbBfi5fzh3C/rF4s+54+ZE5phfYQCDPPdazCo0CXbh/iR0Vwxc/qrSftHO3I8kNYp
         OcdcZCpxfRUrbbIcYGoP5pZjrA61tCrLX6XsCT6AYHsiGqmey/74flIt2qBl+2SBY0R9
         LMGbmTmOWRyNwI8KdhVA8Lxg9WgEAkcQLX7R5Hx9VBJbia110dP7kLJAb8d7K9ieA/5b
         Am2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUlKRZqMBfr3vZUxUSiUGd+l+uW9n9bRvBgLMyPg1CCqqUkwKVp1KKtNcGpelue0E0VghR+JSV5Kd832z83/4fw1S7hL1CAg/kx86HqhQ==
X-Gm-Message-State: AOJu0YyKn2/H8paQ4Xdp9VlvftFMqnaI5FztOCuXocxTMHt6mwwA02eM
	eSR0AL+CASmt0V3PRUBna16WQ7F14C4y2ne/E06ZXMIjiEJRm4ISqtZQFGVCDzI=
X-Google-Smtp-Source: AGHT+IEPIvd0o3Fd5p0VneoxkN0ln2u5ZgMzJbAh1OjAEifl2TbQUoe3t+tLiiJNvJCks9w7ftJpsQ==
X-Received: by 2002:a2e:b5a4:0:b0:2ec:56b9:259f with SMTP id 38308e7fff4ca-2ee5e6c9936mr63640371fa.48.1720003323691;
        Wed, 03 Jul 2024 03:42:03 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee7aad80b9sm2859171fa.78.2024.07.03.03.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jul 2024 03:42:03 -0700 (PDT)
Date: Wed, 3 Jul 2024 13:42:01 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v1] misc: fastrpc: Add support for multiple PD from one
 process
Message-ID: <4ynq2yla6xetmlu3rks52dnsy262rwitmopz5gp5zbrxgcqenh@hpkhd46rft4o>
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

On Wed, Jul 03, 2024 at 12:22:00PM GMT, Ekansh Gupta wrote:
> Memory intensive applications(which requires more tha 4GB) that wants
> to offload tasks to DSP might have to split the tasks to multiple
> user PD to make the resources available. For every call to DSP,
> fastrpc driver passes the process tgid which works as an identifier
> for the DSP to enqueue the tasks to specific PD. With current design,
> if any process opens device node more than once and makes PD init
> request, same tgid will be passed to DSP which will be considered a
> bad request and this will result in failure as the same identifier
> cannot be used for multiple DSP PD. Allocate and pass an effective
> pgid to DSP which would be allocated during device open and will have
> a lifetime till the device is closed. This will allow the same process
> to open the device more than once and spawn multiple dynamic PD for
> ease of processing.

Consider adding line breaks to split the text into paragraphs to make it
easier to read.

The patch also raises the question whether the identifier should be
unique per DSP or per the channel.

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 48 ++++++++++++++++++++++++++++++++++--------
>  1 file changed, 39 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 5204fda51da3..7250e30aa93f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -105,6 +105,10 @@
>  
>  #define miscdev_to_fdevice(d) container_of(d, struct fastrpc_device, miscdev)
>  
> +#define MAX_DSP_PD	64
> +#define MIN_FRPC_PGID	1000
> +#define MAX_FRPC_PGID	(MIN_FRPC_PGID + MAX_DSP_PD)
> +
>  static const char *domains[FASTRPC_DEV_MAX] = { "adsp", "mdsp",
>  						"sdsp", "cdsp"};
>  struct fastrpc_phy_page {
> @@ -268,6 +272,7 @@ struct fastrpc_channel_ctx {
>  	struct fastrpc_session_ctx session[FASTRPC_MAX_SESSIONS];
>  	spinlock_t lock;
>  	struct idr ctx_idr;
> +	struct ida dsp_pgid_ida;
>  	struct list_head users;
>  	struct kref refcount;
>  	/* Flag if dsp attributes are cached */
> @@ -299,6 +304,7 @@ struct fastrpc_user {
>  	struct fastrpc_buf *init_mem;
>  
>  	int tgid;

Is it still used? What for?

> +	int dsp_pgid;

unsigned int

>  	int pd;
>  	bool is_secure_dev;
>  	/* Lock for lists */
> @@ -462,6 +468,7 @@ static void fastrpc_channel_ctx_free(struct kref *ref)
>  	struct fastrpc_channel_ctx *cctx;
>  
>  	cctx = container_of(ref, struct fastrpc_channel_ctx, refcount);
> +	ida_destroy(&cctx->dsp_pgid_ida);
>  
>  	kfree(cctx);
>  }
> @@ -1114,7 +1121,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>  	int ret;
>  
>  	cctx = fl->cctx;
> -	msg->pid = fl->tgid;
> +	msg->pid = fl->dsp_pgid;
>  	msg->tid = current->pid;
>  
>  	if (kernel)
> @@ -1292,7 +1299,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  		}
>  	}
>  
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->dsp_pgid;
>  	inbuf.namelen = init.namelen;
>  	inbuf.pageslen = 0;
>  	fl->pd = USER_PD;
> @@ -1394,7 +1401,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>  		goto err;
>  	}
>  
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->dsp_pgid;
>  	inbuf.namelen = strlen(current->comm) + 1;
>  	inbuf.filelen = init.filelen;
>  	inbuf.pageslen = 1;
> @@ -1503,7 +1510,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>  	int tgid = 0;
>  	u32 sc;
>  
> -	tgid = fl->tgid;
> +	tgid = fl->dsp_pgid;
>  	args[0].ptr = (u64)(uintptr_t) &tgid;
>  	args[0].length = sizeof(tgid);
>  	args[0].fd = -1;
> @@ -1528,6 +1535,9 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>  	list_del(&fl->user);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
> +	if (fl->dsp_pgid != -1)

Why -1? On which path can it be left uninitialized?

> +		ida_free(&cctx->dsp_pgid_ida, fl->dsp_pgid);
> +
>  	if (fl->init_mem)
>  		fastrpc_buf_free(fl->init_mem);
>  
> @@ -1554,6 +1564,19 @@ static int fastrpc_device_release(struct inode *inode, struct file *file)
>  	return 0;
>  }
>  
> +static int fastrpc_pgid_alloc(struct fastrpc_channel_ctx *cctx)
> +{
> +	int ret = -1;

There is no need to init it, is there?

> +
> +	/* allocate unique id between MIN_FRPC_PGID and MAX_FRPC_PGID */
> +	ret = ida_alloc_range(&cctx->dsp_pgid_ida, MIN_FRPC_PGID,
> +					MAX_FRPC_PGID, GFP_ATOMIC);
> +	if (ret < 0)
> +		return -1;

Don't throw away error codes. Pass them as is.

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

Huh? Please return the error code that ida_alloc() returned;

> +	}
> +
>  	fl->sctx = fastrpc_session_alloc(cctx);
>  	if (!fl->sctx) {
>  		dev_err(&cctx->rpdev->dev, "No session available\n");
> @@ -1646,7 +1675,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>  static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>  {
>  	struct fastrpc_invoke_args args[1];
> -	int tgid = fl->tgid;
> +	int tgid = fl->dsp_pgid;

unsigned?

>  	u32 sc;
>  
>  	args[0].ptr = (u64)(uintptr_t) &tgid;
> @@ -1802,7 +1831,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>  	int err;
>  	u32 sc;
>  
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->dsp_pgid;
>  	req_msg.size = buf->size;
>  	req_msg.vaddr = buf->raddr;
>  
> @@ -1888,7 +1917,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>  		return err;
>  	}
>  
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->dsp_pgid;
>  	req_msg.flags = req.flags;
>  	req_msg.vaddr = req.vaddrin;
>  	req_msg.num = sizeof(pages);
> @@ -1978,7 +2007,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>  		return -EINVAL;
>  	}
>  
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->dsp_pgid;
>  	req_msg.len = map->len;
>  	req_msg.vaddrin = map->raddr;
>  	req_msg.fd = map->fd;
> @@ -2031,7 +2060,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>  		return err;
>  	}
>  
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->dsp_pgid;
>  	req_msg.fd = req.fd;
>  	req_msg.offset = req.offset;
>  	req_msg.vaddrin = req.vaddrin;
> @@ -2375,6 +2404,7 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	INIT_LIST_HEAD(&data->invoke_interrupted_mmaps);
>  	spin_lock_init(&data->lock);
>  	idr_init(&data->ctx_idr);
> +	ida_init(&data->dsp_pgid_ida);
>  	data->domain_id = domain_id;
>  	data->rpdev = rpdev;
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

