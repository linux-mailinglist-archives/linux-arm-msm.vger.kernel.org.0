Return-Path: <linux-arm-msm+bounces-46495-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 898BCA21B1B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 11:42:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B24C43A2395
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 10:41:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5D1511B3952;
	Wed, 29 Jan 2025 10:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="St/CG1ID"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A6731AF0B0
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 10:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738147319; cv=none; b=Wcb+iDBO4KjBQW70UVTUcBkw4ivskRWvvHn9Qpv4W7srC2SFLPu01Q085jd3NvLSmUyunIh+RmcjPTMXI2ntyh9G2r3Jsd3DxxYYy/WHhgDOfmjXwpMC2T/PNHYAOC32NC2qz96HNaYmMoToYQiRZe2GrN79dErVjEXh85PWJ6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738147319; c=relaxed/simple;
	bh=Pc+ni/cDcFd/HB0DT9CsNFMS1RHBjf5Ma0h8wfiB7ns=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CG7eqiF9c80u0vktYhz61ul2DehM5ACwKZ3u7nTuToUrLv5dxtIoQCCEZ3fZr8F9QTvSEJ6eu3TyaOXvHlTww7dQ/zD5wMjsTFfBCyVAMudwPPooIt1GjwUS6I9L+2CQdiFu1+t9JDaxRgYbPr5fJdAGsyxY1zuDVU/HwCPRTmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=St/CG1ID; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30795988ebeso9459581fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 Jan 2025 02:41:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738147316; x=1738752116; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D4yelBueNkrGb3TAd7TxlWplKNsIgHY8WigrS6AsVI0=;
        b=St/CG1ID3pmp4CfM1oq5rgcKIckMqAI/V3b+cd+AuAYpR0THO2LAhu8NYYy7FdCKzF
         WJGBcGuuNMSg/0JLSxwJVn6Hd/Gm19rq6mXWMX8DP6PJzD+jDtQl+P5pLq91YtAnZeIR
         5co6hpEz5CVfhnm15n+CIQ1AodD317IE2H8II8ds6lOFAQBMMLdUmIKWKfkZFjjjv9lZ
         hoDrosQMJwK1hyxmh6V0/PHBjxr1fWkuZxqOgadtGYQ1/o9edGCan9PvSWYtWmz2hgOE
         Kp9IKY0cL4mXC4STwQv3ByPKygxIL4u+RtvrM/216w3C/I1+VcTf7pXXC/ZTJ4AdYD6Y
         QRdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738147316; x=1738752116;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D4yelBueNkrGb3TAd7TxlWplKNsIgHY8WigrS6AsVI0=;
        b=MnsrlIhaMq/N2JqritIYANguTE27d6alQdKvE86noWXKx8Utsy7Uy+XR0vFcKe3zWr
         Fn+Q8Dlo+u3BFfpK+ek/shrsWeNWoSFCa+QDg64qkYlnH2d00Ghxt7GPUnWuq6GQ9aU6
         +p+cs+o59W+V//9V/y7YOEzfe6iKZUztpQGj75PFzUSt71YNL3r3COrFjXk3E9d86Tl+
         aeMqJseUlLUMr9lE+BWhvFx9dokrDW+Sy2KfQZ6zyIdE0HOCRvszttQehePyI374RyNd
         4qWGcsUEfc6UtGR4BbnKfM+R9Y/elhEjfZVlKGmqOUsclGfhJZplOcAJCr8Gs9IMWDyu
         3/EQ==
X-Forwarded-Encrypted: i=1; AJvYcCX0fDzDQ8NlRXF1ZshZh3RyrVv48RtkkiJr4qQSYXATi4pQSKRsXloCgaCqBMxv62U38NHT01tJ1sNnkuN9@vger.kernel.org
X-Gm-Message-State: AOJu0YzCcAY9MS6+X5YzhHeT14KF/IfOx9dzR79hFRAlJ2t3zHpbUcCb
	D57Vwb1Vi9vPj5Z+yk32lj2Gd/OkaGeEEpCwVszaVdxvCx0BApGyHh8dRyp06Gw=
X-Gm-Gg: ASbGncuzaSjdEYi78pccMPcRQL5vUmGE56IEPcyBkA6k+JCUJxS8cL+DzJMCtzlSEWe
	SXWATbWTZhagPWAKVeBn1NHucoQ36D+9zmzZUgumk28Vx5hqQlDh+EfUFlpd1xb8fZFA46bMKL1
	cehrLq7JJCSXnwKddh39ELxDhLp4o0cYIdsTAb7UM87LaFXfftHgwFBtD7GoW5M8LxmhBS2Y8DA
	mzRQlOSB68qbDDTJ87lRCvEjYgCPQzNGwBImlNeYhUHjjEehh77EIB2VaJPvu53pCk/0xOn/teK
	1SK0UjxVWEAZFHhjtUBgzUpNqZnxk9WluYMohUeAaKrsIDpv037M0aDhgilXTw0StcY64Dk=
X-Google-Smtp-Source: AGHT+IHGx+YdDuqlOGKRzYFS2ie3+jfLXbg1cXVuLQ8xSlvEBjxbxFzoN4eb//hLYnPiApyVOZ9LYA==
X-Received: by 2002:a05:651c:1541:b0:2ff:e5fa:1ae7 with SMTP id 38308e7fff4ca-307968f646dmr9551191fa.21.1738147315568;
        Wed, 29 Jan 2025 02:41:55 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076baefd94sm21005141fa.63.2025.01.29.02.41.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 02:41:54 -0800 (PST)
Date: Wed, 29 Jan 2025 12:41:51 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de
Subject: Re: [PATCH v2 3/5] misc: fastrpc: Add CRC support using invokeV2
 request
Message-ID: <5gxdsaq2xlj3jijg3hpcnxbq4dpor2cq7q4r4dnkvwxny42tth@3nuxnn2rvb6v>
References: <20250127044239.578540-1-quic_ekangupt@quicinc.com>
 <20250127044239.578540-4-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127044239.578540-4-quic_ekangupt@quicinc.com>

On Mon, Jan 27, 2025 at 10:12:37AM +0530, Ekansh Gupta wrote:
> InvokeV2 request is intended to support multiple enhanced invoke
> requests like CRC check, performance counter enablement and polling
> mode for RPC invocations. CRC check is getting enabled as part of
> this patch. CRC check for input and output argument helps in ensuring
> data consistency over a remote call. If user intends to enable CRC
> check, first local user CRC is calculated at user end and a CRC buffer
> is passed to DSP to capture remote CRC values. DSP is expected to
> write to the remote CRC buffer which is then compared at user level
> with the local CRC values.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c      | 78 ++++++++++++++++++++++++++++++-------
>  include/uapi/misc/fastrpc.h |  7 ++++
>  2 files changed, 70 insertions(+), 15 deletions(-)
> 
> +
> +static int fastrpc_invokev2(struct fastrpc_user *fl, char __user *argp)
> +{
> +	struct fastrpc_ctx_args *cargs;
> +	struct fastrpc_invoke_v2 inv2;
> +	int i, err;
> +
> +	if (copy_from_user(&inv2, argp, sizeof(inv2)))
> +		return -EFAULT;
> +
> +	/* Check if all reserved fields are zero */
> +	for (i = 0; i < 16; i++) {

Noticed this while reviewing next patch. No. Nak. Never. Who makes sure
that this magic 16 is the same as the actual size of an array? Please
always use ARRAY_SIZE in such cases.

> +		if (inv2.reserved[i] != 0)
> +			return -EINVAL;
>  	}
>  
> -	cargs->args = args;
> -	err = fastrpc_internal_invoke(fl, false, inv.handle, inv.sc, cargs);
> -	kfree(args);
> +	cargs = kzalloc(sizeof(*cargs), GFP_KERNEL);
> +	if (!cargs)
> +		return -ENOMEM;
> +
> +	cargs->crc = (void __user *)(uintptr_t)inv2.crc;
> +
> +	err = fastrpc_remote_invoke(fl, &inv2.inv, cargs);
>  	kfree(cargs);
>  
>  	return err;

-- 
With best wishes
Dmitry

