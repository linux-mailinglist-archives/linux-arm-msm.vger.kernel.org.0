Return-Path: <linux-arm-msm+bounces-42659-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9839F646D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 12:12:49 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 37F7D170799
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 11:12:47 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FA2719D090;
	Wed, 18 Dec 2024 11:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jDTSPr2j"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 260E319CC3C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 11:12:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734520367; cv=none; b=TXP+oxAS/PhmKiXR/HD3NJ2ZfLkHuLCKXErUQoRIxvoQu75jioFey4OYSkvO3tXz+pFK4bwmXNnyYbPmjYd3mOx1+TKHLBbdUDblVW2v+/6R1zliTnBmIZiw9k0iMP8Zzy2TJ/c+TZk4jKBrp5lY+rvPt2Me0CGWT7xfJwA012s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734520367; c=relaxed/simple;
	bh=NyHV2cSJOrLXqBx+s3p6gIFvX25PtHPCl3wcAnCLiPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tIxeujgQHQ5vV0gEf955VqxQlSvjrwx1tBmE3EC43buN64T7A8OKIeHZjxrPjHfNOtupNPojsYWuQ+agQCfpFJ8fFAOxCon84gzXGH6ArLvLYRz55g7X1HMDuBb6clSdUVHJTgXAa4K2AOn9sU/6VC2XgvSrBo2wVDq//G8+MNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=jDTSPr2j; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-2ffdbc0c103so56828511fa.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Dec 2024 03:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1734520363; x=1735125163; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M8fJWDW28aqL8+QYcN+FgyuL9HZ8n5LHNGBtm/RG46M=;
        b=jDTSPr2j3BAVooZSMV19DMp6vdzwKqmeCYigeKyb04Tv7bL56QIvmNO9C0ZGDme8Dz
         rBTBoT0+9g4zFSGxwLLuyLJDSnM9XiKYMt0vXu0iu50uHOWQXjXEVQCab1eWnh3A95r8
         wNZYXJm8K2vCKy7v/juKEQS9tmR5zrf18oEyv8A+Tf486L3E5xBvslNlQNXvvRdmVJPf
         cihpPeL9wurTnCoEl5cRvPESqYJ7tPY7CbqG/bNd++UsyFwAUXzq9kJiaymuXSxK41xu
         I8ZQEJlL52rDMLkxDQCCxJDqOQr/chXhwmcOKLiG/SFsh4MdAot0SOWb59UsSxZV/Y2P
         9Urw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734520363; x=1735125163;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8fJWDW28aqL8+QYcN+FgyuL9HZ8n5LHNGBtm/RG46M=;
        b=gF0pZwTx5D0uMgFxYCiEVkJInzByJfaPR69+e5y23pUM8UGZlXmqyrmHAzq3/ztFsi
         1CMOhn6jJg47xeIw80ZEinQTCfxCAEvR8GPRnIpojCWfAsNTQlx61InzqLeSm3Ty4xV9
         thoZ2ehRlnRdUKHzFchjC9zizlIN0GsgoX8ceJsiZtfMGGyd5oXMwgbNkXaLsv3MHNTB
         oJVHHmjncnJbrABZnQWqpP2g0xH0p4/POQx4BDUNnlqLXasK5r22+lx50oHvzdtpIkEq
         hfXfWCl3I/m4i+AgpZz6uT8/vuP5asO5BOwD5Ai1jNr6OH2GQSnElk6lrhn4+prW6A5N
         Fdiw==
X-Forwarded-Encrypted: i=1; AJvYcCWJjjzazVWOfLYu287g8vISDvw5dcrdpemnzLM4MiI58aSKXR/Z6FjoJi/VpCk/r9wPrvO7vgKsnHoOP9zJ@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/Cj66IxbhiuC7Um6Rf3eNma1Fo9zu19BZ8H2Cvkx0Xg3oZNy8
	xyc4dpq2/n5VYMs0S73KKSsnZwx2csOuf8X4UMhqNyUZXDcYFbVvMrGfAN0Loho=
X-Gm-Gg: ASbGncuhZjns7jGaAP8VQDAjSibP4CtKmar+S15/0bmc/fAzu3/MHySXEPw11vtHoQT
	yeClHJxaYgyr/63QI1CI/VCXLBZ6wHav+FTgC9xRtD1/3nHk1U/x3w5oBiorPMoov+y/dGHD3/F
	0E/HXxH1soIN7vrgnTOuLsJ+v5NhFKhhDwNrr1Bm6Q3LlYOGHknJdGidkuIO2W70lVEGJGYWhlE
	c6eqaFB2eHz7oxXBv3wKCIGcI2jUWRy+kujfpK9jYErU1vL80SZRLdeWu4cC0FLY+d8BHgPH4/n
	gyYHXw6/ykl/qcinZPI04NOZeYnDUxUvwztp
X-Google-Smtp-Source: AGHT+IFuXGztV8sXG+rRud35O75Nb0WUWHo3POitPYANEMAxnuB8yJlLwo5eYu7L75ovdSyOgRJzlw==
X-Received: by 2002:a2e:a7ca:0:b0:300:324e:3506 with SMTP id 38308e7fff4ca-3044daab8demr8003641fa.13.1734520363212;
        Wed, 18 Dec 2024 03:12:43 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-303440452a8sm15586311fa.40.2024.12.18.03.12.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 03:12:42 -0800 (PST)
Date: Wed, 18 Dec 2024 13:12:41 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, dri-devel@lists.freedesktop.org, arnd@arndb.de, 
	stable <stable@kernel.org>
Subject: Re: [PATCH v1 1/2] misc: fastrpc: Fix registered buffer page address
Message-ID: <rhy3yvsnhdud45mesempnwyv5faxfkbj2ba76k6dbm7krwl77y@mnpi5jzykjg3>
References: <20241218102429.2026460-1-quic_ekangupt@quicinc.com>
 <20241218102429.2026460-2-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241218102429.2026460-2-quic_ekangupt@quicinc.com>

On Wed, Dec 18, 2024 at 03:54:28PM +0530, Ekansh Gupta wrote:
> For registered  buffers, fastrpc driver sends the buffer information
> to remote subsystem. There is a problem with current implementation
> where the page address is being sent with an offset leading to
> improper buffer address on DSP. This is leads to functional failures
> as DSP expects base address in page information and extracts offset
> information from remote arguments. Mask the offset and pass the base
> page address to DSP.
> 
> Fixes: 80f3afd72bd4 ("misc: fastrpc: consider address offset before sending to DSP")

This was committed in 2019. Are you saying that the driver has been
broken since that time? If so, what is the impact? Because I've
definitely been running fastrpc workload after that moment.

Also, is there any reason for neglecting checkpatch warning?

> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 48d08eeb2d20..cfa1546c9e3f 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -992,7 +992,7 @@ static int fastrpc_get_args(u32 kernel, struct fastrpc_invoke_ctx *ctx)
>  			mmap_read_lock(current->mm);
>  			vma = find_vma(current->mm, ctx->args[i].ptr);
>  			if (vma)
> -				pages[i].addr += ctx->args[i].ptr -
> +				pages[i].addr += (ctx->args[i].ptr & PAGE_MASK) -
>  						 vma->vm_start;
>  			mmap_read_unlock(current->mm);
>  
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry

