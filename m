Return-Path: <linux-arm-msm+bounces-20052-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F1F5E8C9BCB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 13:02:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A63B328302B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 20 May 2024 11:02:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 13D14535A6;
	Mon, 20 May 2024 11:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="KS0tDeas"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1473E5337E
	for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 11:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716202970; cv=none; b=nvlshn7Ft08LrWZ4iQzLrDBXuqatAHgHS7+43OlTOJKPgw+9nl0Sqm8EdV9/IiL4/VwiqEOib/M/pFq7TCZvk7APHOZ8OrzIl10PioBik7HCtmNzHPEeUBNqzp1KiyglCmcbIkzS69NF7ETAzik7D+2N84vnF10hF6peruJA6tY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716202970; c=relaxed/simple;
	bh=aHXJgMMAWaYsM0kSRcC2/pcFvZd8v1mmzcvs6fKS26k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tb6TWZLFP4CFU+C5291+kb9MTdeEE/Wotj1RrcLMKylj8OHDDycxOOj55LJPC6iLKchpPndW4oBHeN647tIf9wUR5gcCQuz3KX3ACDho2WlPoQsv9GA1sFIAjJoAgyKiTb/yhtIgccdyQpMbCT/MgXbDHXVd0bAo82TrEVOxR10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=KS0tDeas; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-51f1e8eaee5so3642119e87.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 20 May 2024 04:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716202966; x=1716807766; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=SIDOKwIcUp4lPPO/PDmHDa/A/zxT15SPb9EQ0kHZyQI=;
        b=KS0tDeaswHLDsFQJ2dXVZEW00flrO7Yi+5XlZAyeYw70E8YM3gI3do48DJFdFznLqh
         ICnXfpB3tM9mUVTOkIC5V8UseJjuGYhmgy9zrSDeAoY2r4+OL/EizvOiPZfc47MqQIWN
         qMcw+Wq1nJ9Sn1hDSwW0ObUgqClllvbgXmZS5Y0G1paavKLBrcT/dhMGGW82p71m+XOo
         enoiKx/shfFRI+N/aaGrAAbQ4nW5KXP9QefFVq90sKxX+ju276KrJrfQuFrwjbp35FO1
         TzA0JAb1Us9FRiJev/r46ZitNpz957KyXRDCm18Q0QUAsw2KUqwV7MY5rkOCjSMrb6fp
         OOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716202966; x=1716807766;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SIDOKwIcUp4lPPO/PDmHDa/A/zxT15SPb9EQ0kHZyQI=;
        b=OJxjFR5PHM0b8RJozl8SXbFkmWs9vqKBlQ5tbtk9cbjETifN+bj6b7r+02rLyrqdiV
         xPe/P7auygsDtTo/OUwPIKsnD0cP17i+AC40pKzE+3F4nC/51uLg5M8U/NsmEPn/LHYI
         Z5lHIbRLN9IOec1G62UzC8uU5rBZsVkrBcpDb2vvPoVoWIX31dNqh/PF6ppwgoSofy2P
         XMZ+GjirO2CLQevtaaq+++uabqvvNxvlWpoRJr1Ch0blKRREMx1p3sJ3t9uRG1oYlVgc
         jrUucm8ktHFhLcrxWLWLUKjKKBggmUZe9iAtL3LruoMjqdTwTPHqBneaKXN3ixDZ8/Pu
         VkdQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWeHzheA6V5GQPere4E2NFz4m/zSB/Zo1bpzh3onH5qcufvuogLnIUkNdPBcgYtBz8wnWOyiBpiPm+le8pevhjiFNhWpGgMTKyNiscOg==
X-Gm-Message-State: AOJu0YzY4SLrq2z5PiolsatUquapFukkhPsRzkSd8jFMwA+/FFpE4Xfn
	8CXxT8gtdnWgFytlkGg/Gs08a51ESCnNj5a14PpyO6T3Nn061ITT53NsA3gWta8=
X-Google-Smtp-Source: AGHT+IHe2PgQwC1mRKPz+r1r564vDGsot6Gznz5gkwCdKTo8R1LGu6rQBjXQZQUxapTX0MQHaaP1KA==
X-Received: by 2002:ac2:44a8:0:b0:513:dbcd:7b8e with SMTP id 2adb3069b0e04-52407cdde08mr1551456e87.24.1716202966284;
        Mon, 20 May 2024 04:02:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5236e80e8c9sm2317384e87.238.2024.05.20.04.02.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 May 2024 04:02:45 -0700 (PDT)
Date: Mon, 20 May 2024 14:02:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] drm/ci: build virtual GPU driver as module
Message-ID: <elftuzsd7lhz6y5ow6rb5uu5fb5b5jcprxtvxtxtojo774rnyr@swpeg4vkgtnc>
References: <20240517092502.647420-1-vignesh.raman@collabora.com>
 <20240517092502.647420-4-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240517092502.647420-4-vignesh.raman@collabora.com>

On Fri, May 17, 2024 at 02:54:59PM +0530, Vignesh Raman wrote:
> With latest IGT, the tests tries to load the module and it
> fails. So build the virtual GPU driver for virtio as module.

Why? If the test fails on module loading (if the driver is built-in)
then it's the test that needs to be fixed, not the kerenel config.

It's fine as a temporal workaround, but please include a link to the
patch posted to fix the issue.

> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - No changes.
> 
> ---
>  drivers/gpu/drm/ci/build.sh       | 1 -
>  drivers/gpu/drm/ci/igt_runner.sh  | 6 +++---
>  drivers/gpu/drm/ci/image-tags.yml | 4 ++--
>  drivers/gpu/drm/ci/test.yml       | 1 +
>  drivers/gpu/drm/ci/x86_64.config  | 2 +-
>  5 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/build.sh b/drivers/gpu/drm/ci/build.sh
> index a67871fdcd3f..e938074ac8e7 100644
> --- a/drivers/gpu/drm/ci/build.sh
> +++ b/drivers/gpu/drm/ci/build.sh
> @@ -157,7 +157,6 @@ fi
>  
>  mkdir -p artifacts/install/lib
>  mv install/* artifacts/install/.
> -rm -rf artifacts/install/modules
>  ln -s common artifacts/install/ci-common
>  cp .config artifacts/${CI_JOB_NAME}_config
>  
> diff --git a/drivers/gpu/drm/ci/igt_runner.sh b/drivers/gpu/drm/ci/igt_runner.sh
> index 20026612a9bd..55532f79fbdc 100755
> --- a/drivers/gpu/drm/ci/igt_runner.sh
> +++ b/drivers/gpu/drm/ci/igt_runner.sh
> @@ -30,10 +30,10 @@ case "$DRIVER_NAME" in
>              export IGT_FORCE_DRIVER="panfrost"
>          fi
>          ;;
> -    amdgpu)
> +    amdgpu|virtio_gpu)
>          # Cannot use HWCI_KERNEL_MODULES as at that point we don't have the module in /lib
> -        mv /install/modules/lib/modules/* /lib/modules/.
> -        modprobe amdgpu
> +        mv /install/modules/lib/modules/* /lib/modules/. || true
> +        modprobe --first-time $DRIVER_NAME
>          ;;
>  esac
>  
> diff --git a/drivers/gpu/drm/ci/image-tags.yml b/drivers/gpu/drm/ci/image-tags.yml
> index 60323ebc7304..328f5c560742 100644
> --- a/drivers/gpu/drm/ci/image-tags.yml
> +++ b/drivers/gpu/drm/ci/image-tags.yml
> @@ -4,9 +4,9 @@ variables:
>     DEBIAN_BASE_TAG: "${CONTAINER_TAG}"
>  
>     DEBIAN_X86_64_BUILD_IMAGE_PATH: "debian/x86_64_build"
> -   DEBIAN_BUILD_TAG: "2023-10-08-config"
> +   DEBIAN_BUILD_TAG: "2024-05-09-virtio"
>  
> -   KERNEL_ROOTFS_TAG: "2023-10-06-amd"
> +   KERNEL_ROOTFS_TAG: "2024-05-09-virtio"
>  
>     DEBIAN_X86_64_TEST_BASE_IMAGE: "debian/x86_64_test-base"
>     DEBIAN_X86_64_TEST_IMAGE_GL_PATH: "debian/x86_64_test-gl"
> diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
> index 612c9ede3507..864ac3809d84 100644
> --- a/drivers/gpu/drm/ci/test.yml
> +++ b/drivers/gpu/drm/ci/test.yml
> @@ -350,6 +350,7 @@ virtio_gpu:none:
>    script:
>      - ln -sf $CI_PROJECT_DIR/install /install
>      - mv install/bzImage /lava-files/bzImage
> +    - mkdir -p /lib/modules

Is it necessary to create it manually here?

>      - mkdir -p $CI_PROJECT_DIR/results
>      - ln -sf $CI_PROJECT_DIR/results /results
>      - install/crosvm-runner.sh install/igt_runner.sh
> diff --git a/drivers/gpu/drm/ci/x86_64.config b/drivers/gpu/drm/ci/x86_64.config
> index 1cbd49a5b23a..78479f063e8e 100644
> --- a/drivers/gpu/drm/ci/x86_64.config
> +++ b/drivers/gpu/drm/ci/x86_64.config
> @@ -91,7 +91,7 @@ CONFIG_KVM=y
>  CONFIG_KVM_GUEST=y
>  CONFIG_VIRT_DRIVERS=y
>  CONFIG_VIRTIO_FS=y
> -CONFIG_DRM_VIRTIO_GPU=y
> +CONFIG_DRM_VIRTIO_GPU=m
>  CONFIG_SERIAL_8250_CONSOLE=y
>  CONFIG_VIRTIO_NET=y
>  CONFIG_VIRTIO_CONSOLE=y
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry

