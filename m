Return-Path: <linux-arm-msm+bounces-46425-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB0FA214FC
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:30:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id D037F7A35E3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:29:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0312B19E97B;
	Tue, 28 Jan 2025 23:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FynbZmYN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14FD4EAF6
	for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 23:30:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107013; cv=none; b=sK2u92qNaat93bbUsIHdkGwE62lToXEBgsu1i/nbdm25+yiJAK7tpGmcU2wULO7LsbDNpkB4qBW4DE8M116d1ueV0zfAJlk6VazoX3sxeW2l9jnF3ISc8EudD0JeqFgIomZSNflsn2PVysibBIJB0VzjRbkkktytsigYRZWrMUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107013; c=relaxed/simple;
	bh=AoQY+c5VcXG/S8YRdxN/fq3Mvj3PlxvxDetuax7Kkt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cj1EGYcH6Vwy+fFkkm67h3TtCGdOoYOYiLZXGprZANeM30SaN/DAz+SUk1Rz7XV9KIFQXRSxO1xUNV6B1SjjkReUFVqRSRwSnuaxP2c4e9h9icDs0VC5zwJ0Zf5SZ2eCegghp4KNIIQVoEGC1Rfo7SLe5Ua2CUdLKKIfFnMlqIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FynbZmYN; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5401b7f7141so5564024e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 28 Jan 2025 15:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738107010; x=1738711810; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GCdIOQOZjxbNyTUQojW1cV2x9p0MTk8H+1DJVjLtCTw=;
        b=FynbZmYNn1MBLCgNpEvA7rpmBcYQl6SiX3Am7Ns/Ik4GOuZi8CBLD2V/utngZ0PBmr
         pD8XXSGEuQUQ7kTeAOSWDMk1G6cQEQ0RCPBR5r4l0p2uCMRIQbGR+yqg2eb7c7BWf5jh
         s23ilNKTmEefqVYqfUeQCCh7C+untCaBCMY10zCvPQIO6QNjDYZBl0sAM0mMvp/8uXdU
         3wCxXqcAlQkb7E0okyrXZLN7pUARuz9lzd6Ub3/x7phHRQ9/hWbz7Ji9im7JeiB99DY1
         Cq9tjZdIEOZL2WdWoN24MdWNjxWuIEx84MH1R+EkJurpu6sEfgWwlZu5/Y0HRZuEbTK1
         KOPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738107010; x=1738711810;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GCdIOQOZjxbNyTUQojW1cV2x9p0MTk8H+1DJVjLtCTw=;
        b=Vi6y6Lh0vQMc+tQQJSgMlCQOYbUPXsJANVWKV/SyujUBmcKT2nUB9bbSbHPi6ACk0N
         JS0YM3SHWrWgS+vTMNM7+1KdlAlNOxaw0e4CvLO9nkt87+l5IEGBxUjyKJzhsJWH10+l
         SsdWiBt/XkPmwHdrPD5dawsWGlpZpL6YiJhuZZSv4S1/Ilivb6EdrnseIoNSDSBwOIGy
         iuOvnfWQjpXpeIN/KZILx8DXsAg7ZO6HmI/AYknqTaAML47iXyBBnjNTx6r53WZtTlXF
         AP6OLSlhHpd5uv4UxiPe3D0y48ZTlZGaRY+D50Ct0sF26W9V4pR+J1OygSEslU2gcafn
         Jn/w==
X-Forwarded-Encrypted: i=1; AJvYcCXH1yKgm6KVHS4o/r+D+MYHSDtsr6+QodvJ1di6i5TP9d5WHzLdih0gb4Q999PO3JslUBkjTkzRozrYYmu2@vger.kernel.org
X-Gm-Message-State: AOJu0YwheSqMqF7xzpu/uhG0ZAFSbzPQWcEjIKp7HOh63mfASkUPIceD
	+34C3IhgzAGhkf2+4fJdlFXNNCZS4noRt8Plk33/LGNRhhRPJrKvcApMp4C6y7M=
X-Gm-Gg: ASbGncsmPgd1UYhTZjxP/Er+EzWQSzWm9c6A0p0qH7dr8WuSdi9Rv9sgZsB2+Qaq1CX
	vH/rVXZ67sbzrqj6quOBjNsrV/jF20YhmtLX9QndsepnrpAdV4YucgSuKBZPqC+xU4h2zO+op4l
	KWiRguDqCtWrUU7qgY5HlX68Z87YWZ991UFX53xAfWa3Q9zrdkQlkigm5MPUY0qk81fiOVSDnBS
	DGX9WdPkPOwaM4PyhW/jETeI2nDg/4kJWlVquT3uMMUjxK9+i7Uhj4Qnv+G7CokCxZVv9qbUviS
	KK99oCWdLeKmTIEnOmKon/yGfBIQPbLK8VoxISfo7mDPyZZN9Kt/BXoEBHGyS6Jn+s5ZAxa1ZCY
	ImZBV6A==
X-Google-Smtp-Source: AGHT+IGsSzj2umsJFSiELH3hVwrmeoAzv74V1NRoAI/wxFSqdhTlVAp4+UKDIsFLwBpcMgZCU9U/bw==
X-Received: by 2002:ac2:4108:0:b0:53e:395c:688e with SMTP id 2adb3069b0e04-543e4bd639fmr184709e87.10.1738107010100;
        Tue, 28 Jan 2025 15:30:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8368425sm1779115e87.121.2025.01.28.15.30.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2025 15:30:08 -0800 (PST)
Date: Wed, 29 Jan 2025 01:30:06 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 5/5] misc: fastrpc: Modify context id mask to support
 polling mode
Message-ID: <im7gi5ib7wnihu3ff4a2erqctne2pm2zf3wl4qmuejz4dfhf7e@z5au6vnm5por>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-6-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-6-quic_ekangupt@quicinc.com>

On Mon, Jan 27, 2025 at 10:12:39AM +0530, Ekansh Gupta wrote:
> DSP needs last 4 bits of context id to be 0 for polling mode to be
> supported as setting of last 8 is intended for async mode(not yet
> supported on upstream driver) and setting these bits restrics
> writing to poll memory from DSP. Modify context id mask to ensure
> polling mode is supported.

Shouldn't this commit come before the previous one?

> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 257a741af115..ef56c793c564 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -40,7 +40,7 @@
>  #define FASTRPC_INIT_HANDLE	1
>  #define FASTRPC_DSP_UTILITIES_HANDLE	2
>  #define FASTRPC_MAX_STATIC_HANDLE (20)
> -#define FASTRPC_CTXID_MASK (0xFF0)
> +#define FASTRPC_CTXID_MASK (0xFF0000)
>  #define INIT_FILELEN_MAX (2 * 1024 * 1024)
>  #define INIT_FILE_NAMELEN_MAX (128)
>  #define FASTRPC_DEVICE_NAME	"fastrpc"
> @@ -524,7 +524,7 @@ static void fastrpc_context_free(struct kref *ref)
>  		fastrpc_buf_free(ctx->buf);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
> -	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 4);
> +	idr_remove(&cctx->ctx_idr, ctx->ctxid >> 16);
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kfree(ctx->maps);
> @@ -664,7 +664,7 @@ static struct fastrpc_invoke_ctx *fastrpc_context_alloc(
>  		spin_unlock_irqrestore(&cctx->lock, flags);
>  		goto err_idr;
>  	}
> -	ctx->ctxid = ret << 4;
> +	ctx->ctxid = ret << 16;
>  	spin_unlock_irqrestore(&cctx->lock, flags);
>  
>  	kref_init(&ctx->refcount);
> @@ -2675,7 +2675,7 @@ static int fastrpc_rpmsg_callback(struct rpmsg_device *rpdev, void *data,
>  	if (len < sizeof(*rsp))
>  		return -EINVAL;
>  
> -	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 4);
> +	ctxid = ((rsp->ctx & FASTRPC_CTXID_MASK) >> 16);
>  
>  	spin_lock_irqsave(&cctx->lock, flags);
>  	ctx = idr_find(&cctx->ctx_idr, ctxid);
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

