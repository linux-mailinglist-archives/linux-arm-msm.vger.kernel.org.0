Return-Path: <linux-arm-msm+bounces-10970-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 72D4585439D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 08:47:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 965371C2031F
	for <lists+linux-arm-msm@lfdr.de>; Wed, 14 Feb 2024 07:47:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2106F18635;
	Wed, 14 Feb 2024 07:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="w8WMKcLS"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2749218628
	for <linux-arm-msm@vger.kernel.org>; Wed, 14 Feb 2024 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707896813; cv=none; b=rRzLajVQgksj4APHNm7xkZit7eX2rXxSfL5mRZqdY6xypKy7ENMUQU3MGztGKxclgupw4Nf6X7UmLHMttRnHKi+RCJEFRTsnshgs0RuV5gTfDFXgoOBwVR/rJiXIbOXje1XJzq5/TtTTkVfpMXO494HdPzsJ8IEgW6iIHJqyCps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707896813; c=relaxed/simple;
	bh=yqB2XdwA6UHCegZCB9/lVXiW3YWDwxrPU4imydmilIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ifeg5I3npJkrNC5RNscyUe/Q1cQfrqpuyhvlLzr4DE+0pT+PXoLNGkKdMQfDiHr80owktB/EBHN7OzAVv0THI0GAB+0rZ3IsP1GgNxb+nBzGPkjPZ1yeaXjCLTsqCrYpqlZ+SeQSdj7eFGPh8amNkDWj9ixabkVf2No5etCHD+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=w8WMKcLS; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-560037b6975so5768286a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Feb 2024 23:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1707896809; x=1708501609; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=B0R4c1Ylk8xxreF7nNGXS85UtN57qLPiI5PzupAO4is=;
        b=w8WMKcLSzIe/ZW5SHuL5Uza48FfctvU0cXX3VLiP9p2aOdzdT7OwBm2eRjZfJWgRAC
         7o6VIYcT+AqHErViaGoTSPDKncIeRCs+xZQD0zOI1n6/rrWQxHaOHuDdCPrqser7LGwO
         jAig9P7ejdDcWpCUtjwikwed8SZpaXPS8r766Dn7pOQssiTAFPh9Quhayo+1Dqbt82pm
         vDhjP7TA1wJmcNnboDFO7BLYAyKiRBhrhLUvpiWdOt17yCFoWSjWiLu5hOLel7zCHuZw
         y48cMBRM6pGIXvhKY5A6+veX6A4x8IwjQSJOQp1gVxPSGacAk8VJjbwTdnFoNafwGVHj
         ONPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707896809; x=1708501609;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B0R4c1Ylk8xxreF7nNGXS85UtN57qLPiI5PzupAO4is=;
        b=CJ8ENVObC1d+hT/aEjzaWO7WVPfWyIsbij+0OJwPiMey3JSdpd6qZlcORcjdllwDev
         PqQhwhjyux2T1bImpCN4kWI1ezHjwexnD+uyuygPzmuqmGzxXAvuOfLdDFkFpeIWwIxH
         Js3vSuf5XjQ2PTrqTBHKZf4ve4Sb9Mvz/Dt6yuDu3PzPEE2X+8GbWfeIrHOyXBApQhDU
         p9dCQtgLSvwr+EZK4DAtC81srXcLjLuXU4czeeNNH3fsIL/6wUUMle+8vHKNxnQtxHYo
         1qUcQYwkrKcaHSLrVwKF761TmRAYNf8OWUgu2Kx1lvaaWLhFAhVP8CU9AspxJZjwZl4v
         sIPA==
X-Forwarded-Encrypted: i=1; AJvYcCWWm3y5vfbtEUY1EdwUnd2EshvAIGz0EJBi1558asiQmVB+yvGzis2q47XMDd0mf1DIDFkna876xU+wtje4bAK/b69Az5F4/8YSzYb3jA==
X-Gm-Message-State: AOJu0YwG7aLlBaJmrljGN9pe+IzTmMx1g5sy+rkDUWhGsePHToPqnX+k
	q7BdD2p7V5/sDmodc0lkj/hd9n5zjXeiLEz8GCD07TeF/K9IaEJ3YRc74QNJPa0=
X-Google-Smtp-Source: AGHT+IFNERq4Pu0oUowuFY7XJnZIaUf0PIqtAYp2ZpdJ45uNhu4a+E9OoFBYAFugw5+I/njxHcUUyg==
X-Received: by 2002:a17:906:1997:b0:a38:7541:36f6 with SMTP id g23-20020a170906199700b00a38754136f6mr1155720ejd.21.1707896809126;
        Tue, 13 Feb 2024 23:46:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWXy07FRHQZQsUwtOQUQeSP5tZae8wDnNB8QFQmIDKOkkbMPwHrHy5ivMIR9fEYbPIE2VECpzcYwuL46XgVkfFXEFz0qgAO4gIO/HvP+OAtjtxapDiqXeRdJsy0+5kuUboimTZJKHUiO5qi+A==
Received: from [192.168.86.110] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ty8-20020a170907c70800b00a3d09d09e90sm1278993ejc.59.2024.02.13.23.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Feb 2024 23:46:48 -0800 (PST)
Message-ID: <0e03d788-a4d1-494e-a103-9f57ad81b016@linaro.org>
Date: Wed, 14 Feb 2024 07:46:46 +0000
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 04/16] misc: fastrpc: Add fastrpc multimode invoke
 request support
Content-Language: en-US
To: Ekansh Gupta <quic_ekangupt@quicinc.com>, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org
References: <20240202064039.15505-1-quic_ekangupt@quicinc.com>
 <20240202064039.15505-5-quic_ekangupt@quicinc.com>
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
In-Reply-To: <20240202064039.15505-5-quic_ekangupt@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 02/02/2024 06:40, Ekansh Gupta wrote:
> Multimode invocation request is intended to support multiple
> different type of requests. This will include enhanced invoke
> request to support CRC check and performance counter enablement.
> This will also support few driver level user controllable
> mechanisms like usage of shared context banks, wakelock support,
> etc. This IOCTL is also added with the aim to support few
> new fastrpc features like DSP PD notification framework,
> DSP Signalling mechanism etc.
> 
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>   drivers/misc/fastrpc.c      | 176 ++++++++++++++++++++++++++----------
>   include/uapi/misc/fastrpc.h |  26 ++++++
>   2 files changed, 154 insertions(+), 48 deletions(-)
> 
...

> diff --git a/include/uapi/misc/fastrpc.h b/include/uapi/misc/fastrpc.h
> index f33d914d8f46..45c15be1de58 100644
> --- a/include/uapi/misc/fastrpc.h
> +++ b/include/uapi/misc/fastrpc.h
> @@ -16,6 +16,7 @@
>   #define FASTRPC_IOCTL_INIT_CREATE_STATIC _IOWR('R', 9, struct fastrpc_init_create_static)
>   #define FASTRPC_IOCTL_MEM_MAP		_IOWR('R', 10, struct fastrpc_mem_map)
>   #define FASTRPC_IOCTL_MEM_UNMAP		_IOWR('R', 11, struct fastrpc_mem_unmap)
> +#define FASTRPC_IOCTL_MULTIMODE_INVOKE	_IOWR('R', 12, struct fastrpc_ioctl_multimode_invoke)
>   #define FASTRPC_IOCTL_GET_DSP_INFO	_IOWR('R', 13, struct fastrpc_ioctl_capability)
>   
>   /**
> @@ -80,6 +81,31 @@ struct fastrpc_invoke {
>   	__u64 args;
>   };
>   
> +struct fastrpc_enhanced_invoke {
> +	struct fastrpc_invoke inv;
> +	__u64 crc;
> +	__u64 perf_kernel;
> +	__u64 perf_dsp;
> +	__u32 reserved[8];	/* keeping reserved bits for new requirements */
> +};
> +
> +struct fastrpc_ioctl_multimode_invoke {
This struct needs some documentation.

> +	__u32 req;
we use req here and then in next few lines we define the same as 
fastrpc_multimode_invoke_type. I would recommend to make this type 
instead of req.

> +	__u32 rsvd;		/* padding field */
reserved?

<---
> +	__u64 invparam;
> +	__u64 size;
-->
Isn't size obvious when we know request type?

This is also opening up a path for userspace to pass some random structures.

It makes more sense to have a union of all the request structures.

Why not add all the enhanced invoke uapi structures as part of this patch?

> +	__u32 reserved[8];	/* keeping reserved bits for new requirements */
> +};
> +
> +enum fastrpc_multimode_invoke_type {
> +	FASTRPC_INVOKE			= 1,
> +	FASTRPC_INVOKE_ENHANCED	= 2,
> +	FASTRPC_INVOKE_CONTROL = 3,
> +	FASTRPC_INVOKE_DSPSIGNAL = 4,
> +	FASTRPC_INVOKE_NOTIF = 5,
> +	FASTRPC_INVOKE_MULTISESSION = 6,

All of these needs a proper documentation. Its impossible to understand 
what they actually mean.

This applies to all the enums that are added as part of other patches to 
the uapi headers.

thanks,
Srini


> +};
> +
>   struct fastrpc_init_create {
>   	__u32 filelen;	/* elf file length */
>   	__s32 filefd;	/* fd for the file */

