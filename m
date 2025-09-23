Return-Path: <linux-arm-msm+bounces-74543-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D70FB975D8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 21:35:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 4AC654E1033
	for <lists+linux-arm-msm@lfdr.de>; Tue, 23 Sep 2025 19:35:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0598C27B4E5;
	Tue, 23 Sep 2025 19:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g5UVmDA9"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E04B6304BDF
	for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 19:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758656139; cv=none; b=Kdq27Zvw8fwZFnkyHB1hmBUAvmy3MjuQghPnBGd8EWAneDQuxfP5qtKi9a95SI81FbIIi4buApriwq4FtSIF+LxD7YcaD3pH7IaiNZlmY7TPp2eE9L4OXRAQI9OToF3XhAXkCIngxMMMJ/Sz0AycW9kbhBB0YxpYe9bx12+pXtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758656139; c=relaxed/simple;
	bh=gQhVQ/hOCkTcdnwSSz2KO4lLuFDJKV9Qc89qI1845po=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I91+0E1wbTG2/m78DJnbp83HEM1/JbvoGVuMdmkf0MW/mtJoWkuY9EgnTBw5/TLDQyKKRmXw9eS9SKTABU1TZRx1edgc5g6+2s9NR5mJ3nrY4rV623DPylBc2BiovoCT239nJJtFfA0ZCRFZ18KL8Wkpijh+nnc1pVqCJFZGWaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g5UVmDA9; arc=none smtp.client-ip=209.85.218.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-ej1-f65.google.com with SMTP id a640c23a62f3a-b0787fdb137so934294766b.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 23 Sep 2025 12:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758656136; x=1759260936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qdwjSx6yqDrwznedzComO+rifSLut17oWkmQ13N72Tc=;
        b=g5UVmDA9yezndhgzwoHmBRrm0163Hcji8O4wzBRk6mh7nMds20k7ZeXdVj8hAaUEYY
         1D2xbG0A+2d8o+TLaW0pPemXx7U9jor8B6HRmObb9qh5WpxLFq9x1Of51TTDN8VHMYNg
         Bi34B8XXpYqaXff0EmeVgE9l1gTCHiHv2U8RI1/GaGFKYtN6bEbG2WPa75c9Fa6djjvS
         Uu1Ke9/E268rk5NLtZFE0BxDlyUQZH3TcM//EBq5Se+zfs0zGy2UjLUYENGSk7E3BCGg
         AodEZaUuHyTUjbo067a1ZWkMSCQdaL9xCZCEgW5412nEDz8dPM/P0Hkz5mWy1DQW28I6
         jfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758656136; x=1759260936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qdwjSx6yqDrwznedzComO+rifSLut17oWkmQ13N72Tc=;
        b=TZ/jJiqOh/HZY35Q6tK810ue6pvqv9cV25R0u3jawlxJMG4//UCoabkt2g6LrbhI37
         bFM5gdOEKrA18HDLvHjWiCECYZND7ujKhsTnGz5Z6yIyanqd0aKOeodeNM1UtHZljfw1
         nubThkOnAjFrV8V7CBe/vIQ4m9wsdyqDxhY9O2KCO4JkVCL7r8jRXZR2kOD5wxId7O7y
         YCy/io6q6E7CjfTTArgj/NFCaVrds/w/GhBhYFxNuYMrb3cQu1lY8uCXmUW7rb8kYosc
         bIZ2nc3S3PMll3YZ1ie9ARqrH9v4noAiD8O4+c14MFXsGdLO/PnwbE6I8ASSEG0OUqdu
         jOxA==
X-Forwarded-Encrypted: i=1; AJvYcCXeKKT53GenM23P3qraQm7aYKN+dod1l3z+WvCv4DDNaVf5prmxvgrUC7lE8EQs5KXYgEfdgwCeOt2gCFLS@vger.kernel.org
X-Gm-Message-State: AOJu0YzXQnw11/b8vxlS3v8+/uDnFDKeCHSLsse0l+I8GpLTpVt8aTV9
	TvjJUc4o3ey+LKvvmmKvivI+Nk4MMh6qPXuOBAILBwXqYiRkkR8xx+Mdb6cTZOkhu+o=
X-Gm-Gg: ASbGncscqq8JnJXndga1h6vd80wgZm5P1G8bpCz68isZBHh1w4JjE5t4efTOZZaWLJz
	LuEDu6NYIk6cGfQJoocXm8Pi6faUPXZNAHahztc6QYyYRG/fFsVWHYMlbhuZOBARbUwWHFuIrNj
	94FzOQnIstx6e5cmINYYaLvU0fr/HTwefzUwhT2KNm6UCs5bzrtR/KWR7vwurgP04AMOpxz8twO
	3/s82RHoZArxghfxnwa9ovj/bl1oU8Ocw0IFuqbwDMPFruNQyPc0oNcmChQcp3vcx9ECDFSpFNk
	PdJ9hfGId8dHKIiKIJ765oAcR7HDjDfrODfT+kUPTdevPw4j6soWnljGe33CpQajAf7V1Am5eJZ
	Dww66u+TBTr9S1Y86p6BOCybphQlzEZeH
X-Google-Smtp-Source: AGHT+IGlCvK6yuqIUQUFOgGwHK0uqqneA6mTN1hmeGJkoLmdyjKHvGizIk+emNFkQbBfTqMzUbXl5A==
X-Received: by 2002:a17:907:d25:b0:b0e:8cd4:e2d3 with SMTP id a640c23a62f3a-b302705ebc2mr337045066b.19.1758656136185;
        Tue, 23 Sep 2025 12:35:36 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:30:bd4e:c20d:5910:982f])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b27217f616esm995766666b.72.2025.09.23.12.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 12:35:35 -0700 (PDT)
Date: Tue, 23 Sep 2025 21:35:31 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Rob Clark <robin.clark@oss.qualcomm.com>
Cc: dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
	linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>,
	Abhinav Kumar <abhinav.kumar@linux.dev>,
	Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] drm/msm: Fix GEM free for imported dma-bufs
Message-ID: <aNL2g40S03YUs9wR@linaro.org>
References: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250923140441.746081-1-robin.clark@oss.qualcomm.com>

On Tue, Sep 23, 2025 at 07:04:40AM -0700, Rob Clark wrote:
> Imported dma-bufs also have obj->resv != &obj->_resv.  So we should
> check both this condition in addition to flags for handling the
> _NO_SHARE case.
> 
> Fixes this splat that was reported with IRIS video playback:
> 
>     ------------[ cut here ]------------
>     WARNING: CPU: 3 PID: 2040 at drivers/gpu/drm/msm/msm_gem.c:1127 msm_gem_free_object+0x1f8/0x264 [msm]
>     CPU: 3 UID: 1000 PID: 2040 Comm: .gnome-shell-wr Not tainted 6.17.0-rc7 #1 PREEMPT
>     pstate: 81400005 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
>     pc : msm_gem_free_object+0x1f8/0x264 [msm]
>     lr : msm_gem_free_object+0x138/0x264 [msm]
>     sp : ffff800092a1bb30
>     x29: ffff800092a1bb80 x28: ffff800092a1bce8 x27: ffffbc702dbdbe08
>     x26: 0000000000000008 x25: 0000000000000009 x24: 00000000000000a6
>     x23: ffff00083c72f850 x22: ffff00083c72f868 x21: ffff00087e69f200
>     x20: ffff00087e69f330 x19: ffff00084d157ae0 x18: 0000000000000000
>     x17: 0000000000000000 x16: ffffbc704bd46b80 x15: 0000ffffd0959540
>     x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
>     x11: ffffbc702e6cdb48 x10: 0000000000000000 x9 : 000000000000003f
>     x8 : ffff800092a1ba90 x7 : 0000000000000000 x6 : 0000000000000020
>     x5 : ffffbc704bd46c40 x4 : fffffdffe102cf60 x3 : 0000000000400032
>     x2 : 0000000000020000 x1 : ffff00087e6978e8 x0 : ffff00087e6977e8
>     Call trace:
>      msm_gem_free_object+0x1f8/0x264 [msm] (P)
>      drm_gem_object_free+0x1c/0x30 [drm]
>      drm_gem_object_handle_put_unlocked+0x138/0x150 [drm]
>      drm_gem_object_release_handle+0x5c/0xcc [drm]
>      drm_gem_handle_delete+0x68/0xbc [drm]
>      drm_gem_close_ioctl+0x34/0x40 [drm]
>      drm_ioctl_kernel+0xc0/0x130 [drm]
>      drm_ioctl+0x360/0x4e0 [drm]
>      __arm64_sys_ioctl+0xac/0x104
>      invoke_syscall+0x48/0x104
>      el0_svc_common.constprop.0+0x40/0xe0
>      do_el0_svc+0x1c/0x28
>      el0_svc+0x34/0xec
>      el0t_64_sync_handler+0xa0/0xe4
>      el0t_64_sync+0x198/0x19c
>     ---[ end trace 0000000000000000 ]---
>     ------------[ cut here ]------------
> 
> Reported-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Tested-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Perhaps also add

Closes: https://lore.kernel.org/r/aNF6N8u1VIFSTaRM@linaro.org/

when applying.

Thanks!
Stephan

> Fixes: de651b6e040b ("drm/msm: Fix refcnt underflow in error path")
> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
> ---
>  drivers/gpu/drm/msm/msm_gem.c | 10 +++++++---
>  1 file changed, 7 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
> index 9f0f5b77f1bd..3aea9b493375 100644
> --- a/drivers/gpu/drm/msm/msm_gem.c
> +++ b/drivers/gpu/drm/msm/msm_gem.c
> @@ -1121,12 +1121,16 @@ static void msm_gem_free_object(struct drm_gem_object *obj)
>  		put_pages(obj);
>  	}
>  
> -	if (obj->resv != &obj->_resv) {
> +	/*
> +	 * In error paths, we could end up here before msm_gem_new_handle()
> +	 * has changed obj->resv to point to the shared resv.  In this case,
> +	 * we don't want to drop a ref to the shared r_obj that we haven't
> +	 * taken yet.
> +	 */
> +	if ((msm_obj->flags & MSM_BO_NO_SHARE) && (obj->resv != &obj->_resv)) {
>  		struct drm_gem_object *r_obj =
>  			container_of(obj->resv, struct drm_gem_object, _resv);
>  
> -		WARN_ON(!(msm_obj->flags & MSM_BO_NO_SHARE));
> -
>  		/* Drop reference we hold to shared resv obj: */
>  		drm_gem_object_put(r_obj);
>  	}
> -- 
> 2.51.0
> 

