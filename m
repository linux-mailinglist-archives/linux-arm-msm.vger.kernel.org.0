Return-Path: <linux-arm-msm+bounces-28970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F2A9568E8
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 13:05:34 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9FFE3283F0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 19 Aug 2024 11:05:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9370A161320;
	Mon, 19 Aug 2024 11:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QcvVOTf3"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D726215B12B
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 11:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724065528; cv=none; b=mg3UWfGU9qkYrXE0sQQxJWyF6IV1/pyFXOGdGqc00001A9ZtzvcNtKRYTZAsZWnB2xHJYudiq6x9tdCZFyD7k8rVx0IkcOA2+MLfp5BYekDfLAPoWKujM+NjZsPJlVwCxD5xlFELZhNJWcvBgJyvUVg32tajx7wqs2YSoSloTWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724065528; c=relaxed/simple;
	bh=3qp1FFNESulyoCV5jOhr5A5nIUf3PiqNYuC3K2laz8U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=F+onYH9ILCBeQo1WkhZY+NIuc4Q+R/V8KpMkOB53LZrBCrTulhCDRL5cweYWmbrjbFckLPIAYS0/HepqMqFM2Y25Q9SwCPYdzRoyPPh1cAvz8KwdxtRApysMPFk0QF2OR0kMHs0MfwbfE8Y48CZ3qsWTXyPh6RBb3LXzhx7NupQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QcvVOTf3; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2f040733086so40571381fa.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Aug 2024 04:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724065524; x=1724670324; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8GKKm+dU6SVHkBgoCKr/zV4NwcivBJUY+FtPwZzVSqw=;
        b=QcvVOTf3KZ7V2U2LZJlPZUZdUjf9etRXJtz0UmZdf3m99IxY6ePSRLpHJa4StBbYnw
         R4/Vn4wepp/MXjd7ASCjgt5+Sym49NbQdoyBjWEciytxhQSyZcpwau7yNO1br2XvbGVj
         W41WeN+sLlyRtGV6oXh4rzb5qSeMpZhPSX2p+hz71ZevyiSSkEYNV+Vbt5ik4xnrx+cb
         dqdCTauJN97IJ9NS3olUP3jiDrfRj3iEI8zKjlM9EUpIZXVJ0tiWqYmoZrIFf54M+PjH
         EhHwTYY/cN7BnUtA1/FQ0cVN2Ref9a4bM/vwPBQUSKwYfg1Euu8VYBnR2wqoFgYhXWnS
         ZfoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724065524; x=1724670324;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GKKm+dU6SVHkBgoCKr/zV4NwcivBJUY+FtPwZzVSqw=;
        b=rDmX01mkmGc9r2Pwc2kNqzLV0Nqp1nfOwY8oz+RrHd0wE9Q+PaoAukh8ZC/IcKkGYE
         fdyW55J1xyLQJDibXZZIDSCtL9sBIjEWrMiuaIIugyTdC7Ti8Nw2o5mcGG+BOYhBgDZQ
         xeiqVaIePIVK4j7mFecuqgRj1dhWWOn9l0BeAOUf0rbbK1f2K7PvKwkYw9bR69QaJZXB
         kGlW0EBry7E5WcpAPSjtsYQIpudCvEUELBJxF/SLVRijy3FdpN7Ws+NWGdL2OxhCYZup
         lfd1FPu8kskxrTHZAmO6OWnU9FLTICNNFvp8CAiFqnofosIFjt5rPTKVkXt5PKP67BhK
         WIyw==
X-Forwarded-Encrypted: i=1; AJvYcCXlbTF+VLoFwPU2oLZJxgVF/TO3L0XxRQgwlEH1hlyc/TUAj9MuLk2KLAsyB0PMFtQaRzueTRk4POWzCakGDSWxh2HdiYQznVQ24Yg0Eg==
X-Gm-Message-State: AOJu0Yx7+fA5KYYULlqQhTOMHrShVUx0IyI/xhfgiv4QdYQQvyN5t2z5
	M65wDMFS2Tos8bUs2XB4tsrIT36KIKtCV2pyzeCtR60hK8uIu/rYjj6/0qj9Pbw=
X-Google-Smtp-Source: AGHT+IGf2FkI4PTf0HI3qQ0GTFLUvKflNup23gG8mIVq5KoTneAB/KvoRymkEJG8OegkKgg1MMQtuA==
X-Received: by 2002:a2e:70a:0:b0:2ef:2f77:e577 with SMTP id 38308e7fff4ca-2f3be597704mr62660931fa.27.1724065523674;
        Mon, 19 Aug 2024 04:05:23 -0700 (PDT)
Received: from ?IPV6:2a02:8109:aa0d:be00::676e? ([2a02:8109:aa0d:be00::676e])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5bebbe7fa52sm5482545a12.73.2024.08.19.04.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Aug 2024 04:05:23 -0700 (PDT)
Message-ID: <ed270718-63ef-4484-9856-0ff488e01b98@linaro.org>
Date: Mon, 19 Aug 2024 13:05:22 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] misc: fastrpc: Add support for multiple PD from one
 process
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, srinivas.kandagatla@linaro.org,
 linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
 linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
 dri-devel@lists.freedesktop.org, arnd@arndb.de
References: <20240808104228.839629-1-quic_ekangupt@quicinc.com>
Content-Language: en-US
From: Caleb Connolly <caleb.connolly@linaro.org>
In-Reply-To: <20240808104228.839629-1-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ekansh,

On 08/08/2024 12:42, Ekansh Gupta wrote:
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

A test tool to validate this fix and prevent it regressing in the future 
would be a good addition here.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
> Changes in v2:
>    - Reformatted commit text.
>    - Moved from ida to idr.
>    - Changed dsp_pgid data type.
>    - Resolved memory leak.
> Changes in v3:
>    - Modified commit text.
>    - Removed idr implementation.
>    - Using session index for client id.
> 
>   drivers/misc/fastrpc.c | 30 ++++++++++++++++--------------
>   1 file changed, 16 insertions(+), 14 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index a7a2bcedb37e..0ce1eedcb2c3 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -38,6 +38,7 @@
>   #define FASTRPC_INIT_HANDLE	1
>   #define FASTRPC_DSP_UTILITIES_HANDLE	2
>   #define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CLIENTID_MASK (16)
>   #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>   #define INIT_FILE_NAMELEN_MAX (128)
>   #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -298,7 +299,7 @@ struct fastrpc_user {
>   	struct fastrpc_session_ctx *sctx;
>   	struct fastrpc_buf *init_mem;
>   
> -	int tgid;
> +	int client_id;
>   	int pd;
>   	bool is_secure_dev;
>   	/* Lock for lists */
> @@ -613,7 +614,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>   	ctx->sc = sc;
>   	ctx->retval = -1;
>   	ctx->pid = current->pid;
> -	ctx->tgid = user->tgid;
> +	ctx->tgid = user->client_id;
>   	ctx->cctx = cctx;
>   	init_completion(&ctx->work);
>   	INIT_WORK(&ctx->put_work, fastrpc_context_put_wq);
> @@ -1111,7 +1112,7 @@ static int fastrpc_invoke_send(struct fastrpc_session_ctx *sctx,
>   	int ret;
>   
>   	cctx = fl->cctx;
> -	msg->pid = fl->tgid;
> +	msg->pid = fl->client_id;
>   	msg->tid = current->pid;
>   
>   	if (kernel)
> @@ -1294,7 +1295,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>   		}
>   	}
>   
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->client_id;
>   	inbuf.namelen = init.namelen;
>   	inbuf.pageslen = 0;
>   	fl->pd = USER_PD;
> @@ -1396,7 +1397,7 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   		goto err;
>   	}
>   
> -	inbuf.pgid = fl->tgid;
> +	inbuf.pgid = fl->client_id;
>   	inbuf.namelen = strlen(current->comm) + 1;
>   	inbuf.filelen = init.filelen;
>   	inbuf.pageslen = 1;
> @@ -1470,8 +1471,9 @@ static int fastrpc_init_create_process(struct fastrpc_user *fl,
>   }
>   
>   static struct fastrpc_session_ctx *fastrpc_session_alloc(
> -					struct fastrpc_channel_ctx *cctx)
> +					struct fastrpc_user *fl)
>   {
> +	struct fastrpc_channel_ctx *cctx = fl->cctx;
>   	struct fastrpc_session_ctx *session = NULL;
>   	unsigned long flags;
>   	int i;
> @@ -1481,6 +1483,7 @@ static struct fastrpc_session_ctx *fastrpc_session_alloc(
>   		if (!cctx->session[i].used && cctx->session[i].valid) {
>   			cctx->session[i].used = true;
>   			session = &cctx->session[i];
> +			fl->client_id = FASTRPC_CLIENTID_MASK | i;
>   			break;
>   		}
>   	}
> @@ -1505,7 +1508,7 @@ static int fastrpc_release_current_dsp_process(struct fastrpc_user *fl)
>   	int tgid = 0;
>   	u32 sc;
>   
> -	tgid = fl->tgid;
> +	tgid = fl->client_id;
>   	args[0].ptr = (u64)(uintptr_t) &tgid;
>   	args[0].length = sizeof(tgid);
>   	args[0].fd = -1;
> @@ -1580,11 +1583,10 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>   	INIT_LIST_HEAD(&fl->maps);
>   	INIT_LIST_HEAD(&fl->mmaps);
>   	INIT_LIST_HEAD(&fl->user);
> -	fl->tgid = current->tgid;
>   	fl->cctx = cctx;
>   	fl->is_secure_dev = fdevice->secure;
>   
> -	fl->sctx = fastrpc_session_alloc(cctx);
> +	fl->sctx = fastrpc_session_alloc(fl);
>   	if (!fl->sctx) {
>   		dev_err(&cctx->rpdev->dev, "No session available\n");
>   		mutex_destroy(&fl->mutex);
> @@ -1648,7 +1650,7 @@ static int fastrpc_dmabuf_alloc(struct fastrpc_user *fl, char __user *argp)
>   static int fastrpc_init_attach(struct fastrpc_user *fl, int pd)
>   {
>   	struct fastrpc_invoke_args args[1];
> -	int tgid = fl->tgid;
> +	int tgid = fl->client_id;
>   	u32 sc;
>   
>   	args[0].ptr = (u64)(uintptr_t) &tgid;
> @@ -1804,7 +1806,7 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
>   	int err;
>   	u32 sc;
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.size = buf->size;
>   	req_msg.vaddr = buf->raddr;
>   
> @@ -1890,7 +1892,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
>   		return err;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.flags = req.flags;
>   	req_msg.vaddr = req.vaddrin;
>   	req_msg.num = sizeof(pages);
> @@ -1980,7 +1982,7 @@ static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_me
>   		return -EINVAL;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.len = map->len;
>   	req_msg.vaddrin = map->raddr;
>   	req_msg.fd = map->fd;
> @@ -2033,7 +2035,7 @@ static int fastrpc_req_mem_map(struct fastrpc_user *fl, char __user *argp)
>   		return err;
>   	}
>   
> -	req_msg.pgid = fl->tgid;
> +	req_msg.pgid = fl->client_id;
>   	req_msg.fd = req.fd;
>   	req_msg.offset = req.offset;
>   	req_msg.vaddrin = req.vaddrin;

-- 
// Caleb (they/them)

