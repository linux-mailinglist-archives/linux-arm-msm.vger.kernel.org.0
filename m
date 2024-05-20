Return-Path: <linux-arm-msm+bounces-20051-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id CA4468C9BBE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 13:00:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 839C728174B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 11:00:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 734E551C54;
	Mon, 20 May 2024 11:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="eo6BjmTf"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C182F14AA9
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 11:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716202847; cv=none; b=VDm50BWF6lmA77lyMSId0Bb/udVogZW/dvn1n361doH+bdYHwiW37UP7wlMCCr0GBGJJl2SlUpBylniUB5E0Fdm2Lslc36n6DFirVyqFw+SpCMItZ9Ppd55L95BjAzfmQ2K32x803piECEQXPMV5yLxVtfhmGnIFWGCLBmPDYqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716202847; c=relaxed/simple;
	bh=opqwwImqcKJM//Av+ypRrBQEF3Ht3H8zS8zbCZiPUdY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H6Bezdm/8oCa8LEYd7T1wTqPOWBLf5jhnIG6rbMVPlZQVXBY3TdztkOVvTYBP6kRGyMN0In/lue0FnHyu6dt6m38bheXRQBzFd0BOHx1fv7L1ynC4YN1CWcljUlPEeiPCH+bnaoiQyCNshJKBhXqMZHu1Y3HY7nsZvO39T0LRYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=eo6BjmTf; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-51ffff16400so6604168e87.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 04:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716202843; x=1716807643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zbU3zeRUyfJhQipGYR6FKYCuEp6+mBicTADebou1jyQ=;
        b=eo6BjmTfYsOE7E8NlZiKcPiegr9iaMzhPcVRP4+8vX1xsKfu/MoBv5bq//lMUJyN54
         zbVpbVdh7cmkFuuLdOtSQLrAnnarYO66zMJUpgNCiDhH+4U1/3y62TkWCVIUQKXAjIoZ
         tuhS0gNZA8sIkiUvFd+rX6vQiJPAxqEUcD4H/FqPqK1nvIt6wO80bHUrVhYqFCpmzRKN
         XyCeKmJM1vfWokhGTGxpx35I7PEMv5oj816hlCrZcdSyAffzb7E1eL+n2niuEeKtDBeR
         c/R0xUwV5MAhJnwbgcfoKij1YEhKdZ0HmE0lt3n1eQGkZqnOCjAwmC+VONFPYokuP4dl
         8VQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716202843; x=1716807643;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zbU3zeRUyfJhQipGYR6FKYCuEp6+mBicTADebou1jyQ=;
        b=ntRMd919fH4cIVskpBgHQcxTff14txSgrJrq7HpCI/EEA0V6E6ZQf70+X9i65Qg2EG
         8EWFhnGgi0/5DBedBnjMvnlSftaHrjsBGVVgcoturG2OnswwRI5uiI4cJMGjxkta0pep
         6MMxcn81Q4GbZ55zQJqx/OAGAl56FcuB9AOD8Qi5SVsvaVJWh0b9Y2ROY6opLy+F+TwA
         d/POXpnGAJxK+vmbrfwoEz7ZAo7J7oVBnBtlACPFahyxhlQ8wxxosNL1w3RL1kgBEoKe
         pDJd+4PDemF6UQ1J3EdEVj+q5G/AbEAyQxqAL1tfRfUEqepwIluKa23bY/nJI+tVtTQs
         AdPg==
X-Forwarded-Encrypted: i=1; AJvYcCU4O/1xwYjYNsCNLHd8A0Mv3Quo3/nyzK6m+WVLSc0KXyKL96pYhEROVt9wMzcHRxwxa75OX5S+qsiEM7nO93bUbHHf7uvDC+QIXTW+nA==
X-Gm-Message-State: AOJu0Yw6UVdUODjP6H7hpT3m3lGdh4YwyuWtxWusZn9KxDY1mntYOs3N
	jXYFbKGrwWKrFSxT4gpJ1sygpnBDUTdIlsQCXHygy0O5Hdwq8h8a8arFwU2mmWE=
X-Google-Smtp-Source: AGHT+IEoP2+bL0oMFj4P0Aa7CMuek/Wx23WK1fJZHUBxVQUK6n4Or8upEK0eOTuockV49z8ZJoyWZA==
X-Received: by 2002:ac2:504c:0:b0:51a:df97:cc8d with SMTP id 2adb3069b0e04-5220fd7cc70mr18338046e87.26.1716202842997;
        Mon, 20 May 2024 04:00:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-521f35ad5fdsm4253446e87.24.2024.05.20.04.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:00:42 -0700 (PDT)
Date: Mon, 20 May 2024 14:00:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] drm/ci: generate testlist from build
Message-ID: <o363vir3dqz2znrnifo6enbdwudalmxqbigdkci2ykxf5qjbnx@2ngllflxotgk>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-3-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-3-vignesh.raman@collabora.com>

On Fri, May 17, 2024 at 02:54:58PM +0530, Vignesh Raman wrote:
> Stop vendoring the testlist into the kernel. Instead, use the
> testlist from the IGT build to ensure we do not miss renamed
> or newly added tests.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Fix testlist generation for arm and arm64 builds.
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh  |   34 +
>  drivers/gpu/drm/ci/igt_runner.sh |    9 +-
>  drivers/gpu/drm/ci/testlist.txt  | 2761 ------------------------------
>  3 files changed, 39 insertions(+), 2765 deletions(-)
>  delete mode 100644 drivers/gpu/drm/ci/testlist.txt
> 
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> index 7859554756c4..e62244728613 100644
> --- a/drivers/gpu/drm/ci/build-igt.sh
> +++ b/drivers/gpu/drm/ci/build-igt.sh

[...]

> @@ -26,6 +50,16 @@ meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>  ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
>  ninja -C build install
>  
> +if [[ "$KERNEL_ARCH" = "arm64" ]]; then
> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib/aarch64-linux-gnu
> +elif [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib
> +else
> +    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/igt/lib64

Could you please clarify this part? The arm64 vs arm don't look logical
from my point of view.

The rest LGTM.

> +fi
> +
> +generate_testlist
> +
>  mkdir -p artifacts/
>  tar -cf artifacts/igt.tar /igt
>  
-- 
With best wishes
Dmitry

