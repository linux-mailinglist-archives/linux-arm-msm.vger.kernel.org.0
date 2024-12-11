Return-Path: <linux-arm-msm+bounces-41571-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 67ACF9ED8C9
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 22:40:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 72CEC2832DB
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Dec 2024 21:40:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BE011F0E44;
	Wed, 11 Dec 2024 21:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kcTa9VjI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283051E9B3E
	for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 21:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733953166; cv=none; b=aLHzoo8shT3wgFr3f+KPcA6eKVCgI3CgKXc1dZGwl9t9ejEQbADgACx1+O73BPJuOr8YI/qulQt6n6QM4L8EZQXMNDeASIkDOuMIuqS+QFus048tWdA0ioWWa/f44UitpQal71hQnogOkkyxETymX+TwqAnwaMhupyW/OEOgCTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733953166; c=relaxed/simple;
	bh=pkO0NUO4KcmCdWJAVRuetRjrcwB/yqLWaknBzus0A9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z+eRUTBDgxl18EYGoSnT6ZyeSU0HneFLfJWZNL+qo/KxSirDGnGkNL8bapmTlWuQ1nTpD2OmNsvHhCGCsfI/IB7jFT8oaTyZtmWMsuUe6rl+VW8ttQhgiUuW080OzPmPVdrfWwphJsctUsjd34D5RWKoptNEBjncDi29J2dGihQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kcTa9VjI; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-30225b2586cso11501001fa.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 11 Dec 2024 13:39:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733953162; x=1734557962; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZDpO8QRKSrhxInawg6iB7aAV8UI5ptwurUWyv3YKDbc=;
        b=kcTa9VjIE4Y6KntabKE42beW8v6q/3Tj+pMK7tmHDfaongQM6zi5WQ6wRsS414kGQ0
         k20flIcbHnAXlxS4SHTemCngben+X5+k02mOSmWL6ym2lgmO6bVadgvI+TcJQvzEHZ1q
         nj3qG1c0yiNrxVSV0JpERImAQISXSrIgV57o+g2334s0WInbPbwyr5o1HbY7rO7auz7K
         r+CpR7ntNqBL/d/rHJRJAB0M6Dq6eeVGGK/h6d/6Rjzilrqd3AhsoHh9fJGJ2U6P7zz4
         ODfp7pKyyaMcyimaBvMNaOpisrW53Nj2KSdbULm0Oux8umg8J2eym0qLPcAtNZnRRlSJ
         1qjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733953162; x=1734557962;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZDpO8QRKSrhxInawg6iB7aAV8UI5ptwurUWyv3YKDbc=;
        b=LHDPTtauVrLXz6F3HXsqDLC61cevMGn0dtn6Sr3m2QGJHZn6xUafd8lM5UXwOVHVsF
         M31eg1/TA8u5OwEKmgKOGLYXABBKdv7shYtOPDKT+IjEmQlZq5mVDS81UfECFai2cO12
         xCYom9gQ2dRpfcA/uIpST9U8T0yZ18o2iOi6WvmOFVMMo9lmAM43/hSFpf1m6SZvH4Yk
         PLelxGs3KDK11ACt6+0jPpZtWOGuhbg8dDJhMCGO4AZRg5mEWaxFUQ09DCYKyskICGTc
         hPfKVR4DpW9oShJy117WwbdujuPmQYia5el2Q9IOCBWgmCmGR6TJJ0INp1d5AcaC5OfX
         xV2A==
X-Forwarded-Encrypted: i=1; AJvYcCXkOXm4MbM0bIz2T1NCph9iSSqTy8MukiPdTSLKKBPHjn8XFeZqCHS6XE3dZU8cIzhT91goR4VklSFJe6yr@vger.kernel.org
X-Gm-Message-State: AOJu0YxgoMy1GqqEHu9/CR3LOrf7q2qTnrkCMVwCyJNhQTFME3Cs7D+a
	62p+WcypH5oN82PL7UaVTXMSzGSvncXN+0ODSaKwoCo+UWZ5MwTChEzJ6lWzPn0=
X-Gm-Gg: ASbGncugwfVuyLPne2ROmA+YwKoTviVHtqk9h08JsO5u3GitFUjz/+W7JSqmJ80sWiV
	uKRUgqXsfblWDXdU9ZGrCqpCSmathsRxh7yXg6Xnht6O6Xq/Hv8l7IykA031r51uMJVtav7SpQ1
	xebTqmXSVYmbV+ex5Z36NfEOuX9/U0l9e76X63L0xKt2VCA+3axutZYEQ/Q2ggueoABjPTUcaHR
	UTw/v+/U40kpiRB864ZRlMkhAZT5xj24zyq53SXGoEapErbsa8xNv3gk+rwC6Mr1N7jkPzfX30W
	yATsRUhWtbAmUA+RYd6XimZrdVGRXtoZDQ==
X-Google-Smtp-Source: AGHT+IEOt4HIvzifdLCP3vt6tvdn0+DmYG+k9uGFplaWP19t7GtD1er9r2IS8lIHB30alIfkyzyt9Q==
X-Received: by 2002:a05:651c:54b:b0:302:49f7:1d72 with SMTP id 38308e7fff4ca-3024a5fa7d4mr2138761fa.9.1733953162278;
        Wed, 11 Dec 2024 13:39:22 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-300419ae090sm14289721fa.8.2024.12.11.13.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Dec 2024 13:39:20 -0800 (PST)
Date: Wed, 11 Dec 2024 23:39:18 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: uprev IGT
Message-ID: <f2dac4eatkajw633ksnnb3nfq7zop2l4ux2euj6jqg4hg3soqt@sv7p2r6xk7fz>
References: <20241211142806.1824961-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241211142806.1824961-1-vignesh.raman@collabora.com>

On Wed, Dec 11, 2024 at 07:58:05PM +0530, Vignesh Raman wrote:
> Uprev IGT to the latest version and update expectation files.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - Pipeline link - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1327810
>     Will update the flake bug report link after v1 is reviewed.
> 
> ---
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 066d24ee3e08..7752adff05c1 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,4 +1,7 @@
>  kms_3d,Fail
> +kms_cursor_legacy@forked-bo,Fail
> +kms_cursor_legacy@forked-move,Fail
> +kms_cursor_legacy@single-bo,Fail
>  kms_cursor_legacy@torture-bo,Fail

Interesting, DRM_MODE_CURSOR_BO tests fail

>  kms_force_connector_basic@force-edid,Fail
>  kms_hdmi_inject@inject-4k,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> index 6dbc2080347d..581d0aa33b4f 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-fails.txt
> @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_display_modes@extended-mode-basic,Fail
> +kms_display_modes@mst-extended-mode-negative,Fail

This is a bug in 5f7cde6a9878 ("tests/kms_display_modes: Skip test if
joiner display is connected"), the driver unconditionally calls
is_joiner_mode(), or in 88abc2d2c646 ("lib/igt_kms: Add is_joiner_mode
function"), the is_joiner_mode() should return false for non-Intel
hardware. Please fix it in the IGT instead.

>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
> @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> -kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> index d74e04405e65..5122233b9941 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
> @@ -18,3 +18,10 @@ msm/msm_shrink@copy-gpu-oom-32
>  # IGT Version: 1.28-g0df7b9b97
>  # Linux Version: 6.9.0-rc7
>  msm/msm_shrink@copy-gpu-oom-8
> +
> +# Board Name: sc7180-trogdor-kingoftown
> +# Bug Report:
> +# Failure Rate: 50
> +# IGT Version: 1.29-g33adea9eb
> +# Linux Version: 6.13.0-rc2
> +kms_lease@page-flip-implicit-plane

Do you have a failure log?

> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> index 6dbc2080347d..581d0aa33b4f 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-fails.txt
> @@ -8,6 +8,8 @@ kms_color@ctm-red-to-blue,Fail
>  kms_color@ctm-signed,Fail
>  kms_cursor_legacy@cursor-vs-flip-toggle,Fail
>  kms_cursor_legacy@cursor-vs-flip-varying-size,Fail
> +kms_display_modes@extended-mode-basic,Fail
> +kms_display_modes@mst-extended-mode-negative,Fail

Again, the same IGT issue.

>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
> @@ -15,4 +17,3 @@ kms_pipe_crc_basic@compare-crc-sanitycheck-nv12,Fail
>  kms_plane_alpha_blend@alpha-7efc,Fail
>  kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
> -kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> index fa8c7e663858..69076751af24 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-fails.txt
> @@ -1,4 +1,3 @@
> -drm_read@invalid-buffer,Fail
>  kms_color@ctm-0-25,Fail
>  kms_color@ctm-0-50,Fail
>  kms_color@ctm-0-75,Fail
> @@ -19,6 +18,8 @@ kms_cursor_legacy@flip-vs-cursor-atomic,Fail
>  kms_cursor_legacy@flip-vs-cursor-crc-atomic,Fail
>  kms_cursor_legacy@flip-vs-cursor-crc-legacy,Fail
>  kms_cursor_legacy@flip-vs-cursor-legacy,Fail
> +kms_display_modes@extended-mode-basic,Fail
> +kms_display_modes@mst-extended-mode-negative,Fail

The same IGT error

>  kms_flip@flip-vs-modeset-vs-hang,Fail
>  kms_flip@flip-vs-panning-vs-hang,Fail
>  kms_lease@lease-uevent,Fail
> @@ -28,4 +29,3 @@ kms_plane_alpha_blend@coverage-7efc,Fail
>  kms_plane_alpha_blend@coverage-vs-premult-vs-constant,Fail
>  kms_plane_cursor@overlay,Fail
>  kms_plane_cursor@viewport,Fail
> -kms_rmfb@close-fd,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> index 4892c0c70a6d..8d26b23133aa 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-fails.txt
> @@ -7,9 +7,4 @@ kms_cursor_legacy@torture-bo,Fail
>  kms_cursor_legacy@torture-move,Fail
>  kms_hdmi_inject@inject-4k,Fail
>  kms_lease@lease-uevent,Fail
> -kms_plane_alpha_blend@alpha-7efc,Fail
> -kms_plane_alpha_blend@alpha-basic,Fail
> -kms_plane_alpha_blend@alpha-opaque-fb,Fail
> -kms_plane_alpha_blend@alpha-transparent-fb,Fail
> -kms_plane_alpha_blend@constant-alpha-max,Fail
>  msm/msm_recovery@gpu-fault-parallel,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
> deleted file mode 100644
> index c1859d9b165f..000000000000
> --- a/drivers/gpu/drm/ci/xfails/msm-sm8350-hdk-flakes.txt
> +++ /dev/null
> @@ -1,6 +0,0 @@
> -# Board Name: sm8350-hdk
> -# Bug Report: https://gitlab.freedesktop.org/drm/msm/-/issues/65
> -# Failure Rate: 100
> -# IGT Version: 1.28-ga73311079
> -# Linux Version: 6.12.0-rc1
> -msm/msm_recovery@gpu-fault

-- 
With best wishes
Dmitry

