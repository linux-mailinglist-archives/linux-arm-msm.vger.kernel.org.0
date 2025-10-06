Return-Path: <linux-arm-msm+bounces-76052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D525BBDD6E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 06 Oct 2025 13:12:33 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 4E41818988CB
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Oct 2025 11:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 23661267B9B;
	Mon,  6 Oct 2025 11:12:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="T+7z9LOr"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE1E266B66
	for <linux-arm-msm@vger.kernel.org>; Mon,  6 Oct 2025 11:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759749150; cv=none; b=SIbvpucIlgKIrc4s8V1v0bfDJCiNfU2dtjQ1gDR2YEnVjDXyY611CjI5ke6iCNW5owZYmaNJZvnMt9Ya4QShorPI6MlqZZlk4K8EaAYw2CK+tcwZZ5i/+yjPq8Iwk52Pml9NCWr9jR+nB2VP3/50ZGJtHgNT24gwfct00DTykaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759749150; c=relaxed/simple;
	bh=zrJDYNSApTHnAaMQBJu4RPWao8aOd2DGCsXyTXRy5+c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n7Ihi5o2fOaTHSlwhdR80o/1owq9Lbcl0xCK4XVA8pEiJ0h1oCkx/knf8P1BDGzka7D2rT6NNJqOgkhlVcfqAHpxnH2lxsPRr5qs2TKbKR6c5DIl6WZiNb6yNXNybeUqfr7+594W4A54FcemOSloJ+2ymrqx54y/4wC8I37k4+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=T+7z9LOr; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-46e542196c7so32398585e9.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Oct 2025 04:12:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1759749146; x=1760353946; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/Y28niRMzt7DTJLvTv7YHssogiH+TYaxfjknJwt5S2c=;
        b=T+7z9LOredrA1PcznL/IGvcm/2pSpOsBwMPOyXdKqh12velTn9XgKrJS1xs63UQTpK
         xxlqrKurQs+z1nalf0+gsRhjqmzsAtHqsWbU+IR8QMzMhLUgkzPV8/WDHGoqKKyuzX+i
         alrNu2QgJiZNdrgqhFeR9ldSADPuhxKkqFdNCUgjVUShLRNE52vaVdpNosFUxiNctgX+
         PmpAHzPug4iL0O8C7SpXuNyVCVJlKzPhDNc4AslwXqYZ9inUsWblabxG0s3NBwDWHTEM
         A+ww1xj9rb5oOXlIG8VGSY/y7mvpxhswIAKrrXKL7PgAib/sT9VjGuhC55bnX8SxwqOY
         yr8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759749146; x=1760353946;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/Y28niRMzt7DTJLvTv7YHssogiH+TYaxfjknJwt5S2c=;
        b=LUr2rX0YyYSHVh/gc6NSczMsfq0+31mi8863vtvXGHeQKdnXTxtEVeaZpwTEZf2h2z
         nOksJqBbWU2Quiq0qr/lUig5wFsQhUQab2Tgm/oD51lYm/bs2oIFUKvayYSi5OgsyYmN
         RwWtW9A0DNeK7le3nPnYWYW2Tp+O80BSuGCZ5kONbisrBhE0E5fdq3+iSeNtSkVUDrDE
         naP/dIkndKbGz87CpntlMfKDmr2TUxAsgZb7N5V+ngdFieqYk905jLZNATWAHoD8Nwpa
         /FgqBPzww8RXnyaRZN6EzqzhlA9OrccBfguP6nwB2qb36YJyyEy50ONLNjV1xq8MmbCi
         QuZg==
X-Forwarded-Encrypted: i=1; AJvYcCXieUpOr7dsvfKqPPZcaWO0LIFwM65K6fwMulcsi/5DYNd+F4KGp1l0CzE8MwwJiZkZJ6ZfHAH0RD84eiwM@vger.kernel.org
X-Gm-Message-State: AOJu0YyoqmdE3Sxm6xiEqenzHlo/3JQmtBQGI8+ejbp38tvuKEijA9qf
	9yka6EPNUVJAxXHkLqbIDzYbcXVA2FUBoH5cNfq0BxxuM2yrbEpM28JutazTukx01vg=
X-Gm-Gg: ASbGncsieUh4ouW6Zr0aA7WNvMQsB0WtjxATxFFAKUhSKrb1BbYIVXMh4LrLMdp1hLj
	8hiiArQ7r8rf7oJ77F3fk/VzcAyuk1aa6KIfzBeU/lWXb5FQKh0fwokRdF6DEw3d9l8GJuGqbuu
	bEdx3Vp8LIfVZ8lHy86M7+FCfjnwl43zqpokKZucIfdgxcVXI43G5xUemBkK7hksBJ+Fol9qSx4
	t78tbgPKvuRNI+eidkJ38RLV9aOPxKMvdaxw1IALN3W4tTIijWH2Czxx3ytKq2AEfMPj7i3i8Qp
	kxFt+1vxFClwV7BJJFfn4g2KmeBqpL8DOpeN2I0kZ6Ko3SQvuWJBDYm4jQV/U1/ixYBPkvurLk8
	6gspi0erPziOOCtIiuzW8Ugs0/x/OjeB6mAIa+Kcty3tdZ3LL0E+a8vSRHQQVuBpHmmXvJHS+ss
	9ArbQxGyO5Wqf2ihAqNXUHjUiH0L4=
X-Google-Smtp-Source: AGHT+IED6zGsorMymWzXbyfZfVfZ17caCEuzSle55VwjdBVqw0LnTAkN02fIG8Fbsdt4Nd5VRu5UlQ==
X-Received: by 2002:a05:600c:920:b0:46e:74bb:6bd with SMTP id 5b1f17b1804b1-46e7760bed7mr42278615e9.4.1759749145876;
        Mon, 06 Oct 2025 04:12:25 -0700 (PDT)
Received: from [192.168.0.19] (188-141-3-146.dynamic.upc.ie. [188.141.3.146])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e5b622f37sm144432315e9.1.2025.10.06.04.12.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 04:12:25 -0700 (PDT)
Message-ID: <5ab4d0a3-6c58-49b1-93b8-7a69b150c1a9@linaro.org>
Date: Mon, 6 Oct 2025 12:12:23 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
To: Rob Clark <robin.clark@oss.qualcomm.com>, dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Stephan Gerhold <stephan.gerhold@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org
References: <zR1Ft0CGCZU6PwpoeaGHv9LDWAyJqqpAXhI25pUYMlRV1LfCJYhuDQVLkclBphRZkgcA-VrvHykxdchDBlzrmw==@protonmail.internalid>
 <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-US
In-Reply-To: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23/09/2025 15:04, Rob Clark wrote:
> Imported dma-bufs also have obj->resv != &obj->_resv.  So we should
> check both this condition in addition to flags for handling the
> _NO_SHARE case.
> 
> Fixes this splat that was reported with IRIS video playback:
> 
>      ------------[ cut here ]------------
>      WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
>      CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT
>      pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>      pc : msm_gem_free_object+0x1f8/0x264 [msm]
>      lr : msm_gem_free_object+0x138/0x264 [msm]
>      sp : ffff800092a1bb30
>      x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
>      x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
>      x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
>      x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
>      x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
>      x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>      x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
>      x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
>      x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
>      x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
>      Call trace:
>       msm_gem_free_object+0x1f8/0x264 [msm] (P)
>       drm_gem_object_free+0x1c/0x30 [drm]
>       drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
>       drm_gem_object_release_handle+0x5c/0xcc [drm]
>       drm_gem_handle_delete+0x68/0xbc [drm]
>       drm_gem_close_ioctl+0x34/0x40 [drm]
>       drm_ioctl_kernel+0xc0/0x130 [drm]
>       drm_ioctl+0x360/0x4e0 [drm]
>       __arm64_sys_ioctl+0xac/0x104
>       invoke_syscall+0x48/0x104
>       el0_svc_common.constprop.0+0x40/0xe0
>       do_el0_svc+0x1c/0x28
>       el0_svc+0x34/0xec
>       el0t_64_sync_handler+0xa0/0xe4
>       el0t_64_sync+0x198/0x19c
>      ---[ end trace 0000000000000000 ]---
>      ------------[ cut here ]------------
> 
> Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>
> Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>   drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
>   1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 9f0f5b77f1bd..3aea9b493375 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>   		put_pages(obj);
>   	}
> 
> -	if (obj->resv != &obj->_resv) {
> +	/*
> +	 * In error paths, we could end up here before msm_gem_new_handle()
> +	 * has changed obj->resv to point to the shared resv.  In this case,
> +	 * we don't want to drop a ref to the shared r_obj that we haven't
> +	 * taken yet.
> +	 */
> +	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv != &obj->_resv)) {
>   		struct drm_gem_object *r_obj =
>   			container_of(obj->resv, struct drm_gem_object, _resv);
> 
> -		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> -
>   		/* Drop reference we hold to shared resv obj: */
>   		drm_gem_object_put(r_obj);
>   	}
> --
> 2.51.0
> 
> 
Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # qrb5165-rb5

