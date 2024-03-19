Return-Path: <linux-arm-msm+bounces-14576-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id AC57A88026D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 17:35:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 66599282913
	for <lists+linux-arm-msm@lfdr.de>; Tue, 19 Mar 2024 16:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62BB1F503;
	Tue, 19 Mar 2024 16:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b38QZMhE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBCD5DDBD
	for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 16:35:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710866150; cv=none; b=Bvp6lKKrM5sci2Trdq7ObUYasMgrgedsafyf6f1j98p6zgZt6TvrBYklaRjFqd3kTNZa6DFryY5eUxszf+qnJLgngGbwiYaLdLleyEkk6wKoQxROImeBogxAG7KUvhGlJbMjdeWksNgfpzCy3UgI6fyYzvXzbkO2WCQx5jhz4kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710866150; c=relaxed/simple;
	bh=q9uBXXkF/Mg0O6HtdHWp+kni+gGwOkJTVLcjuy2q/UA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=shFxZA1MlV/9baA73IqsgkGeld+3Yz8CzBz8r2YEBrYwx1+tD8RZX8hNkAU2UlvsT2PMNSVCyFkdv64LBkp/4ErHt/DoHIJSE7xsdb8BQCAGjHDbsPQfrwD76VpmNXPn04SquAoZIi96n9pnm/fpZOQlcExizfRmqp9+0Rm1ts8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b38QZMhE; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-6e6aa5c5a6fso5520972b3a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 19 Mar 2024 09:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710866148; x=1711470948; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w96SEqzYAbTpf966liJXQFnSoV9Z+YW1Z6ZiFx4qEQs=;
        b=b38QZMhE8jZ03+6rwp10aiCumqH/zxyRsYN7tRnUkECxAiI0fOgJm23/emDql7ikbP
         htkFYgIb0d1ESFGqhCugKuVSNgiUKbtd1k6QjbWx9cv0ZmUfDr/wFEYevgSXzMl5kPBo
         ir5iw+u3D3ShKPDTtfff/fdIPiQ2JQRKWubHlrvNjYNL2x0ib/fZeTzrTFxuEEQNWXSL
         C2Y7Ayix1ArWJ2b/TiVe4A9p57kkdIkn1fsNc36n9FQ0u59V8IaECXzX3Vu0MQLZ6j36
         f2+jeOma3JMHzow8c8jWEH3VKM8ThTR7KEgxE6P9gQeKNmq6sebtU6HRXUFtNdhGxNR2
         zfAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710866148; x=1711470948;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=w96SEqzYAbTpf966liJXQFnSoV9Z+YW1Z6ZiFx4qEQs=;
        b=Uhh+vXG8Bjw4v9z30d+iTaJUPuf+K89BXE1ZXXjkzwslFJNpT5er3bAoP0hLc5oF5c
         7O9yZLqqhiVPqh/yB1BKZbQ2HOehInqdpES25lxqyaHOJKGsDZkYdLYrnF6jUPYMFiCV
         SRkfBcrp9SHmW4ujAJVhnswW6qs96vXXSUWpLpUE0o9QNDAbsyxJjKS2zOPssbw/9XWP
         vAPPPeOvCQYmPYOupEmpRdHBSoGN9X8xjv8o7UJGAeIxmO1NU4vGv7sxTH8YxBhWFtrj
         2N9NYgH1dKW2l8Z18knhQplDUxod8gU8QQzDtkyOtuwAe427AY3wn7GJEziiDqX9dmN6
         uUyA==
X-Forwarded-Encrypted: i=1; AJvYcCX1BpeR3wjJ0tszhNYabLv/FzLFh6puXX5Bt+f02lJW+7ARIW6lMsq/0sEvtOv1SV5tF+u6ZeAWYYVL7/N+9m45hUyhyjMV2Jukb/YFHw==
X-Gm-Message-State: AOJu0YydVVBvIKNftEHXkw+o/EZRoRQGa78GWQgHJwMCHjzRVTga2GWE
	2PSiYZi6N9LXHxRW/l/lzkzBq0QW/tc6DRnZy9zNmNpt99ZLDRgV8mch7MnuGA==
X-Google-Smtp-Source: AGHT+IHUQM6pzUf/IP4HxZ2Ij8eYMGp3z1k0Y4oBtNyrAeqJ6GDq1SULh4emJAASSYdl6qKHg7E2/w==
X-Received: by 2002:a05:6a21:3406:b0:1a3:6940:82ea with SMTP id yn6-20020a056a21340600b001a3694082eamr5204737pzb.31.1710866147866;
        Tue, 19 Mar 2024 09:35:47 -0700 (PDT)
Received: from thinkpad ([120.56.201.52])
        by smtp.gmail.com with ESMTPSA id y31-20020a056a00181f00b006e61b0a4b17sm9923587pfa.185.2024.03.19.09.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 09:35:47 -0700 (PDT)
Date: Tue, 19 Mar 2024 22:05:44 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Kunwu Chan <chentao@kylinos.cn>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] bus: mhi: ep: Simplify the allocation of slab caches
 in mhi_ep_register_controller
Message-ID: <20240319163544.GE3297@thinkpad>
References: <20240228030056.509994-1-chentao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240228030056.509994-1-chentao@kylinos.cn>

On Wed, Feb 28, 2024 at 11:00:56AM +0800, Kunwu Chan wrote:
> Use the new KMEM_CACHE() macro instead of direct kmem_cache_create
> to simplify the creation of SLAB caches.
> 

There are 3 kmem caches in this driver. Please change all of them.

- Mani

> Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> ---
> v2:
>     - Simplify the allocations of mhi_ring_element slab caches
> ---
>  drivers/bus/mhi/ep/main.c | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/bus/mhi/ep/main.c b/drivers/bus/mhi/ep/main.c
> index 65fc1d738bec..795611482f16 100644
> --- a/drivers/bus/mhi/ep/main.c
> +++ b/drivers/bus/mhi/ep/main.c
> @@ -1478,9 +1478,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>  		goto err_free_ch;
>  	}
>  
> -	mhi_cntrl->ev_ring_el_cache = kmem_cache_create("mhi_ep_event_ring_el",
> -							sizeof(struct mhi_ring_element), 0,
> -							SLAB_CACHE_DMA, NULL);
> +	mhi_cntrl->ev_ring_el_cache = KMEM_CACHE(mhi_ring_element, SLAB_CACHE_DMA);
>  	if (!mhi_cntrl->ev_ring_el_cache) {
>  		ret = -ENOMEM;
>  		goto err_free_cmd;
> @@ -1493,9 +1491,7 @@ int mhi_ep_register_controller(struct mhi_ep_cntrl *mhi_cntrl,
>  		goto err_destroy_ev_ring_el_cache;
>  	}
>  
> -	mhi_cntrl->ring_item_cache = kmem_cache_create("mhi_ep_ring_item",
> -							sizeof(struct mhi_ep_ring_item), 0,
> -							0, NULL);
> +	mhi_cntrl->ring_item_cache = KMEM_CACHE(mhi_ep_ring_item, 0);
>  	if (!mhi_cntrl->ev_ring_el_cache) {
>  		ret = -ENOMEM;
>  		goto err_destroy_tre_buf_cache;
> -- 
> 2.39.2
> 

-- 
மணிவண்ணன் சதாசிவம்

