Return-Path: <linux-arm-msm+bounces-22054-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 242BB900247
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 13:36:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A12C6287690
	for <lists+linux-arm-msm@lfdr.de>; Fri,  7 Jun 2024 11:36:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDFEE18735C;
	Fri,  7 Jun 2024 11:36:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="R1jDKiWt"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B051188CBB
	for <linux-arm-msm@vger.kernel.org>; Fri,  7 Jun 2024 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717760188; cv=none; b=qS4okc0A9czoNgIjx4AF88ItEbjt2D0FVOYu0NhHSNiSbMngUoJtIo668TAnsoJIG7sYfza5etGRRfvrHGOxjh0Q1I9zHx0H5Q7pYFT1s8+jg2ykYYABT06RMwm+31LLXGhKRdLCF6GGNZjzJGFIMbLyhvtejuwIWo/fRLIF/7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717760188; c=relaxed/simple;
	bh=1igZTYjDPXjCcCgy+nI5U257Gn4g4WLUSFaInx/hv2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GGyXA0MJHuWZalzU5ZWJTLmYij3Og6Q8pBXJg7mzLFcupTPDTFULGbfQQCF2TRM5VVeQk6ZUZ/eIH0EQxcfM+KSVgWa5GfxuQmXyegdrqPkz3LoHQQoliEfVCBotJp2iwNVxPVnCE9iCitjvsahv5yDdtSCR3TMoEXQ3uuP0ImU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=R1jDKiWt; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-52b962c4bb6so2913550e87.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 07 Jun 2024 04:36:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1717760185; x=1718364985; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=H1mui+HBDxQUFLppGRIOuzCMTBMXzF+PVJZ3OkaVODY=;
        b=R1jDKiWtU+lV54BMnt1Zcuivxy8lZEWiYbJ3kGCl1zjVP0y/YxHNd0479hzQ8IOkEM
         WrQVGMKKBYGI8XrB4TwfgSTpXfdu0BHHJr/FyB99YLK1Swr3i1MKBcFI4eF6am3eCC33
         zzs7kXHXiQplThCVR4m0RManiE1NuzDBPx+Vp+HtZExGITKaI++RlpskRHZBdeHEV+/o
         VLTaoIilJgPH4tiIsjQ7uyP1LYCboJUOD1eYCPhoMAwKDLVwEBw6U08kXgsEBsrzyE/A
         4+95MAVbi7RQvS2fLV4gfLSYCqrLQYvs7n2WRMnU103ATMFOdhj9OnxIQk7k8OlbKgw9
         AFrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717760185; x=1718364985;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H1mui+HBDxQUFLppGRIOuzCMTBMXzF+PVJZ3OkaVODY=;
        b=RWbyUdU7yt5bjhkesflsfoXwaEJ/OuvsgCFcIhoAfm30ZZ3B6RGe09L3mb5Kck0K69
         pJe/02Cc9yQsIH6L82UurTx4ZgQPAMk6zl8BbTIxLmKmMcJRQAiTQ4s1ZcsmeVgnNgL8
         KmzF3KqRc6IGooJvs+JZ5HhZCuPq/nrQqxdlV3/LtzvHv/rVot7YmZOY9gIaSpFtdaui
         BVE8rUs6uA4s3d9eTnzFmllAKbVF0MJC720jbAKWiItUIduK3WGnMqvz/ptp7Xq6td+8
         vtG88Z+UnO76cOBFkf9jKzg0jjXmhdbzBdEyFNQ90147BcDtCboPnz4ah99ARoP8tjSJ
         sJFg==
X-Forwarded-Encrypted: i=1; AJvYcCXe+inlBDphtKj3BMGEiUu0xH9PCj1mVoPoJztimdNShkAhqWwKK8k4SCvswCQbCKktu9zMzvLBNfzzI86eiXL67Td77hkUxXV4LzBL4w==
X-Gm-Message-State: AOJu0YwT0RQxUnw8PILriIp6o1D725aPU7lEY6R00JN80BWP47/dVuX8
	EJXEKP7xw6NKsA9k0rmp7+LOakRkJ2xp+af7DfXxAtDUi1/tjL/Qft9x4AUOEPw=
X-Google-Smtp-Source: AGHT+IGM/8XZd+a4grzjTEledb54wxf8n6pUQ5sZVQn1MV8kXi0PBuKaZ5LPBD39hh9yVO3xSnEBEw==
X-Received: by 2002:a05:6512:1308:b0:521:cc8a:46dd with SMTP id 2adb3069b0e04-52bb9f6275fmr2450550e87.11.1717760185284;
        Fri, 07 Jun 2024 04:36:25 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-52bb41ee3eesm502556e87.74.2024.06.07.04.36.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jun 2024 04:36:24 -0700 (PDT)
Date: Fri, 7 Jun 2024 14:36:22 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Ekansh Gupta <quic_ekangupt@quicinc.com>
Cc: srinivas.kandagatla@linaro.org, linux-arm-msm@vger.kernel.org, 
	gregkh@linuxfoundation.org, quic_bkumar@quicinc.com, linux-kernel@vger.kernel.org, 
	quic_chennak@quicinc.com, stable <stable@kernel.org>
Subject: Re: [PATCH v4 08/11] misc: fastrpc: Fix ownership reassignment of
 remote heap
Message-ID: <7yogq6uxespor2vjzwu5fdw33aahhkep4dmpmjzkinke6deg4j@x6gmcyuotsex>
References: <20240606165939.12950-1-quic_ekangupt@quicinc.com>
 <20240606165939.12950-9-quic_ekangupt@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606165939.12950-9-quic_ekangupt@quicinc.com>

On Thu, Jun 06, 2024 at 10:29:28PM +0530, Ekansh Gupta wrote:
> Audio PD daemon will allocate memory for audio PD dynamic loading
> usage when it is attaching for the first time to audio PD. As
> part of this, the memory ownership is moved to the VM where
> audio PD can use it. In case daemon process is killed without any
> impact to DSP audio PD, the daemon process will retry to attach to
> audio PD and in this case memory won't be reallocated. If the invoke
> fails due to any reason, as part of err_invoke, the memory ownership
> is getting reassigned to HLOS even when the memory was not allocated.
> At this time the audio PD might still be using the memory and an
> attemp of ownership reassignment would result in memory issue.
> 
> Fixes: 0871561055e6 ("misc: fastrpc: Add support for audiopd")

Fixes before functional changes.

> Cc: stable <stable@kernel.org>
> Signed-off-by: Ekansh Gupta <quic_ekangupt@quicinc.com>
> ---
>  drivers/misc/fastrpc.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 3686b2d34741..68c1595446d5 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1334,6 +1334,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  	u64 phys = 0, size = 0;
>  	char *name;
>  	int err;
> +	bool scm_done = false;
>  	struct {
>  		int pgid;
>  		u32 namelen;
> @@ -1398,6 +1399,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  					phys, size, err);
>  				goto err_map;
>  			}
> +			scm_done = true;
>  		}
>  	}
>  
> @@ -1439,7 +1441,7 @@ static int fastrpc_init_create_static_process(struct fastrpc_user *fl,
>  
>  	return 0;
>  err_invoke:
> -	if (fl->cctx->vmcount) {
> +	if (fl->cctx->vmcount && scm_done) {
>  		u64 src_perms = 0;
>  		struct qcom_scm_vmperm dst_perms;
>  		u32 i;
> -- 
> 2.43.0
> 

-- 
With best wishes
Dmitry

