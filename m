Return-Path: <linux-arm-msm+bounces-25259-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8239C9273C9
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 12:16:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D969D28A287
	for <lists+linux-arm-msm@lfdr.de>; Thu,  4 Jul 2024 10:15:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0EA6D174EC0;
	Thu,  4 Jul 2024 10:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="xMtmQhpK"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14D29A41
	for <linux-arm-msm@vger.kernel.org>; Thu,  4 Jul 2024 10:15:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720088157; cv=none; b=YIBHCRLdyFIUKSMZ3UBQiKlYILLOsVyedGKefWBjht+Fi9987p30m06zeexw8+KiP+7I+nrK7SPN9qrgao8Go1ORju31Cb0fza+mBMiIXv3MoXXv6qYxVsSbOHlRQV2hMkgsTU3iRs6+oQI2XT/wNu/jlmrOJGMR99sRBjoAJqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720088157; c=relaxed/simple;
	bh=Vwgi1lg2CshzOJbmksugK2R0s08lIGSQYEuCi3ab+VE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GO8K5CC6NP63eeXSYX05y2XkDb/63jxZVvWYdd9rQD3aoyYdmdyNg7gFZMHzwvQGkB4TMX7bWRmWtMg5o656EnNm1RjYZgZ4yfC9T/JskQLhLza1guxVnBkKlYTIEjl85frMOegrliMQESTHwUxkkoSVHrgfc7CPd8+/GCpA/Fs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=xMtmQhpK; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2ec52fbb50cso4289911fa.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 04 Jul 2024 03:15:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1720088154; x=1720692954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1nvqcTE+d+I6/PYlZYlUrN3ZSE7/0dbyWuREcOgf8aA=;
        b=xMtmQhpKH8yis6k5eTQ9IrVE8WUrbXKkIK6eH5KG8bP23Px2hJmToSS48/mlWn0tas
         pqA4iJ4Rfua5muqmVhZU73nO6sXzVQgSHOj5hPGCIGZxZGHEZrbyLfiwMKKYTPEoeBkk
         vGTiaj96TaAYsIQL0pA/gjnWIkcBqeA3zAJ8G3anN/SAUlcjvEbvh5cvzvEgSEWqRl1M
         NXks+qsAATAu4TN3PHlhqHCoR833UR1uJn7o/P5Nhf1J2A6f1BVRX7GdeBFxyA0tUp9h
         bV0Fk1PUEkK93MoY2TrJpTsJXyWyvVrzIc6ihSq1SNq9NTp++03bS0e2wwSVvnkqjJHP
         JtSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720088154; x=1720692954;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1nvqcTE+d+I6/PYlZYlUrN3ZSE7/0dbyWuREcOgf8aA=;
        b=GtMmODUI86o+HMeafX+eR0Ktl5U3+hyjOpbd+yIxK89j4DS0yvRYEyAvK9hCOANRvo
         L7JauT4vEyecO+70FUMGYB/tNT97djjyioq7wQR0ZZ73GTCxSoI25iXl7NzceOrRLADp
         jpXcoKBXMo5VVZkCxqq9yIe+oQV9rOJrDjgUxqELeP2s9WZBzvkVLE3VO4JT4QNQaBRb
         aj/9SwSIVeDcvdo+MSalnyDAUnrVDkSZTaO8T1xeDvr9T0+gwg2a7j0aqlP0CCvZcCSj
         VSgdsOJYyLy2K/Ck3+gVpfxBPZUtsLRrDhoc/wMGMmVR/ICwT0LB4AXtvm3jK/RsdK7y
         lJjA==
X-Forwarded-Encrypted: i=1; AJvYcCXj06UNDW7Gt0vvtajQWj0A6rYfCEjcjUn290i8IkzNnJ7y0V4+y1JG50yf+e+kP51L9gAvxQD5PcsUOxQ3OKLsR4rTEeqtH2rf5EMDKw==
X-Gm-Message-State: AOJu0YwLNXd7JqyGx1BDuUL80dhfeDBFbQachODlDk9H7Ot0bZ0Ikxbx
	2zsgooj81ow5TQa5xRzDpwySAYsjoFiFawKziawByhMh9k6CnKQGS/js9Wm0C+8=
X-Google-Smtp-Source: AGHT+IFjFbE6dWkiueh16FP2N9UOEw13MN12/uduae8Rfkcs3JR/7QPB7Yfqddj+KjB9xdjW8KZcuw==
X-Received: by 2002:a2e:98c3:0:b0:2ec:5200:a935 with SMTP id 38308e7fff4ca-2ee8edc2d45mr8049801fa.40.1720088154177;
        Thu, 04 Jul 2024 03:15:54 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyybrhy-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ee5168cf1fsm22523201fa.116.2024.07.04.03.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 03:15:53 -0700 (PDT)
Date: Thu, 4 Jul 2024 13:15:52 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, mcanal@igalia.com, 
	linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	intel-gfx@lists.freedesktop.org, virtualization@lists.linux-foundation.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] drm/ci: uprev IGT
Message-ID: <ojnz5hjfht6gwouphvmvizb2udlz2wvwnsj4vgosp3chrhsmcv@c7cxscdyxtsn>
References: <20240704092202.75551-1-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240704092202.75551-1-vignesh.raman@collabora.com>

On Thu, Jul 04, 2024 at 02:52:02PM GMT, Vignesh Raman wrote:
> Uprev IGT to the latest version, which includes a fix for the
> writeback tests issue on MSM devices. Enable debugging for
> igt-runner to log output such as 'Begin test' and 'End test'.
> This will help identify which test causes system freeze or hangs.
> Update xfails and add metadata header for each flake test.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
> 
> v1:
>   - https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1216850
> 
> ---
>  drivers/gpu/drm/ci/gitlab-ci.yml              |   2 +-
>  drivers/gpu/drm/ci/igt_runner.sh              |   1 +
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |   1 +
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  14 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt |  12 +-
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  41 ++++-
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  |  14 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |   9 +-
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   5 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  |  24 +--
>  drivers/gpu/drm/ci/xfails/i915-glk-flakes.txt |   8 +-
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  |   2 +
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  |  25 +--
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   4 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  |  17 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-flakes.txt |   2 +-
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   5 +-
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   |   9 +-
>  .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  32 +++-
>  .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   4 +-
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   |   2 +-
>  .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   2 +-
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   2 +-
>  .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   |   5 +-
>  .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |   2 +-
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   4 +-

Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # msm tests


>  .../msm-sc7180-trogdor-kingoftown-fails.txt   | 145 ------------------
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  18 ++-
>  .../msm-sc7180-trogdor-kingoftown-skips.txt   |   5 +-
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 145 ------------------
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |  11 +-
>  ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   2 +-
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 105 ++++++++++++-
>  .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   4 +-
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3288-skips.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   |   2 +-
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |   4 +-
>  .../drm/ci/xfails/rockchip-rk3399-skips.txt   |   2 +-
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   |  64 ++++++++
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   4 +-
>  drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |   4 -
>  .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  21 +++
>  drivers/gpu/drm/ci/xfails/vkms-none-skips.txt | 105 ++++++++++++-
>  53 files changed, 527 insertions(+), 395 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ci/gitlab-ci.yml b/drivers/gpu/drm/ci/gitlab-ci.yml
> index 80fb0f57ae46..b09976c3d2c2 100644
> --- a/drivers/gpu/drm/ci/gitlab-ci.yml
> +++ b/drivers/gpu/drm/ci/gitlab-ci.yml
> @@ -5,7 +5,7 @@ variables:
>    UPSTREAM_REPO: git://anongit.freedesktop.org/drm/drm
>    TARGET_BRANCH: drm-next
>  
> -  IGT_VERSION: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56
> +  IGT_VERSION: f13702b8e4e847c56da3ef6f0969065d686049c5
>  
>    DEQP_RUNNER_GIT_URL: https://gitlab.freedesktop.org/anholt/deqp-runner.git
>    DEQP_RUNNER_GIT_TAG: v0.15.0


-- 
With best wishes
Dmitry

