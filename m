Return-Path: <linux-arm-msm+bounces-20905-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2FF8D30D1
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 10:18:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D97AF28A5FD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 08:18:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46125181CF7;
	Wed, 29 May 2024 08:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iv3lSvSC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759E3169360
	for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 08:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716970199; cv=none; b=HSJBu0BNVrEWA7Qm+grasA9dflGE7BWfTJDo+6JnBhEy81qTx9l6SlrAeNCgpjjhLaXImTnaX1PgSbfOwMLW2FOSJoqi3MZ2FiDX+Fw4vsTtbwM120bihpMsHnKwRChrBiSm/Fsu90VIQOAWOXUJNzwyEiFkCVxYT6Tbv6gtKsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716970199; c=relaxed/simple;
	bh=WgixO3taSRbE0QziVmAcwTsoz8TFfpyR0rpCo3iNMFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cQO76pn4P6Goe7BWRtdz54VX0awYoC0t1TEI+z8Ge4CRhDzB90AEV/jg7fBS/5StGcX+lxP67RVwZ3+U/3NfYBVJw0wZdrqIvdReKQAASpftycF++RKJh0xy8R7UZVubDybdKm3NB+L8N43Xe4F2d4YKFsr9q7p3cWjdObthHYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iv3lSvSC; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-52ac99930c6so611595e87.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 29 May 2024 01:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1716970195; x=1717574995; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=enlxS5GkWub7qfeq6FBQU5uJl3JqVotYfwFdD9Rt9Ng=;
        b=iv3lSvSC/z0PFnpTx+FY84lC5mmepLlw6H3HBuPcbKK930vVA/rqavJdWTabZGWQar
         IHk5doCbVcTe0ptr6zcfrXgn6jJxgBu9Fjf54q2QwAftBM9f4orRnObqO092JvqzOeBh
         Ae6cgYHfSkydMYo0uM+fMXIROAOI1En1hhYC0noPG9JL8pCQkencdfbZ5rVQcQZjkBWg
         /yJhpgsul0atSYcirNwVqYsftr5afBhO/E8nu48+JS7OfW8dMnqBFJ0CPdqAvFewlnOE
         kjlDXluHm/Y4zIA/VkyWtHvSrsTMmbb5RScCFGutCQVOMS0+9Vhy7WRBVCRoX2BdBJM2
         5p2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716970195; x=1717574995;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=enlxS5GkWub7qfeq6FBQU5uJl3JqVotYfwFdD9Rt9Ng=;
        b=mm8DHYk+M0jTceCTMOQ5wcREFns2YtEJgByE7as4RwI+gEEEjb6aqFbGhyQ3kgTxTY
         eaE5JYmU7CfV/d1P07eiBjH5RswqrEEyAjVbgFaHsz2jt52STAVAGZWfwIpYHmoIRrY6
         uwVAR29USBY6v7c1LQYdfKm+I0Ra/mQrbOuUnaVr6XWbcoOEIUWDE9tzcd3s70RwhAKo
         psswhVbGg9Bt3HhpXw9CEzOfPs/U7rZ3yFpuH60rj66ApG4096kd2WycUNT4jUKAli0k
         k5UO91qQ3ncC74HKL4HKU0dF7NCxkM/S4NerdxeBVQNSfYv5/n5buGhiv4rOMiDireYX
         H9ow==
X-Forwarded-Encrypted: i=1; AJvYcCXshqHrF5trmuxqgmUeqZuYK5qIyNpDtLASlmCQPFA7OvLO7HZPx2pGDZ7XJA6eSm6hfnvlvvQkR6eD1lU+BZUpqRQtWKyDt0GXT4t/sg==
X-Gm-Message-State: AOJu0YyCcyW7yUrT0gyoAb2L3XV+4AhmSYk3FPbnhGc7WxLeW1+CIhSX
	n2Guzh5BW6Nsgq/sY1DwC2Z9eYeVolacihW+FynD5AhnxZZutoAt1RREQvlTzQc=
X-Google-Smtp-Source: AGHT+IHAAOSe1YF9ohma3qLilcNBhTgUrp5XW+R17Dfxhf/XQBKuTb9CXtbrrq9LBMBwT336LwrXXQ==
X-Received: by 2002:a05:6512:3128:b0:522:33cd:64bd with SMTP id 2adb3069b0e04-52964aba466mr8988769e87.27.1716970195416;
        Wed, 29 May 2024 01:09:55 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-529aa049e3csm859093e87.167.2024.05.29.01.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 May 2024 01:09:55 -0700 (PDT)
Date: Wed, 29 May 2024 11:09:53 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 4/6] drm/ci: uprev IGT
Message-ID: <bj6mpegmxo6i5o34xyxwiytdaokv2u6p5iu4eoek3ctqimwviy@jbo5aw7gy4ue>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-5-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240529024049.356327-5-vignesh.raman@collabora.com>

On Wed, May 29, 2024 at 08:10:47AM +0530, Vignesh Raman wrote:
> test-list.txt and test-list-full.txt are not generated for
> cross-builds and they are required by drm-ci for testing
> arm32 targets. This is fixed in igt-gpu-tools. So uprev
> IGT to include the commit which fixes this issue. Also
> disable building xe driver tests for non-intel platforms.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v2:
>   - Split IGT uprev to seperate patch.
> 
> v3:
>   - No changes.
> 
> ---
>  drivers/gpu/drm/ci/build-igt.sh  | 4 ++++
>  drivers/gpu/drm/ci/gitlab-ci.yml | 2 +-
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/ci/build-igt.sh b/drivers/gpu/drm/ci/build-igt.sh
> index b7d2a49a6db3..eddb5f782a5e 100644
> --- a/drivers/gpu/drm/ci/build-igt.sh
> +++ b/drivers/gpu/drm/ci/build-igt.sh
> @@ -45,6 +45,10 @@ MESON_OPTIONS="-Doverlay=disabled                    \
>                 -Dlibunwind=enabled                   \
>                 -Dprefix=/igt"
>  
> +if [[ "$KERNEL_ARCH" = "arm64" ]] || [[ "$KERNEL_ARCH" = "arm" ]]; then
> +    MESON_OPTIONS="$MESON_OPTIONS -Dxe_driver=disabled"
> +fi
> +
>  mkdir -p /igt
>  meson build $MESON_OPTIONS $EXTRA_MESON_ARGS
>  ninja -C build -j${FDO_CI_CONCURRENT:-4} || ninja -C build -j 1
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 8f32de63d92e..1b29c3b6406b 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>    UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>    TARGET_BRANCH: drm-next
>  
> -  IGT_VERSION: d2af13d9f5be5ce23d996e4afd3e45990f5ab977
> +  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56

Let's land this, then I'll ask to uprev to
dc2d7fb4f978048b87707ea9ec32da748b01b378, which fixes an issue with the
writeback tests on MSM devices.

>  
>    DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>    DEQP_RUNNER_GIT_TAG: v0.15.0
> -- 
> 2.40.1
> 

-- 
With best wishes
Dmitry

