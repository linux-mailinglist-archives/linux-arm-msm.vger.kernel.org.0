Return-Path: <linux-arm-msm+bounces-18920-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7AF8B6F5F
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 12:15:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id CBDEB1F243ED
	for <lists+linux-arm-msm@lfdr.de>; Tue, 30 Apr 2024 10:15:22 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 26841129E75;
	Tue, 30 Apr 2024 10:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dix4eoYc"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E36E9129A70
	for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 10:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714472115; cv=none; b=h8l/9ElP69uwmd8GzhCV2oUoDqWhwPyBlxFzcuq1SgVjhZuQqeOY//qikuGPHMxcG5VxzcvBN7gBJRRCR6VIa6WDSKpwOipjK2OBhPTFXqfv8Nk0ZQC/36F5QNFeOUhR4e3dRbDULuJt4pTMK1ZaAS64RjVJHVPxgJZlTAtPcmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714472115; c=relaxed/simple;
	bh=EA/n+63aRQ+LX6Bo2tyrIJSDq4Fz8cHbko3pkS/8djE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UYbTmnnc4yjL2JfOaizo/53XNpNIdg5DAqVl6N0dWmsxWKnXe/npvbMRGkkYEy/P1npHHK2YrgP1aKrARbARM6vH30bBT/0fSgxArxILqFURaK4WL23M39jasR9PAsyQbkMKUwbsFxiE3HWk+0ULQsdrpYE+IZqKlGaCNmYJslA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dix4eoYc; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51bafbe7509so7718429e87.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 30 Apr 2024 03:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1714472110; x=1715076910; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dIx1dFfAcpeKO8TErHh7vGY1lorqPiA5UlnTCSzH2HY=;
        b=dix4eoYceTuyNB0FmVZtNw7MZVkMVzEfZpqPiZRw2VFI2A51tbeMYdjtIMWE+YzxP6
         e3Pkz6nv+bXy6MHWO+xqRe1K9soCMDfFfpsIze/WJqkLReQC/ViULkDh/DBvid5OMEUQ
         Njw9X7jgXgkns75gBlkiS7PgUt1Y+0BWPF5hkbbD59VOcp4U+4Fuc2FcZoH+yDkDv46g
         pKBNUP3SVpPKx+7/qTbYJM0st3JKTkYu2l+UdMiU/V86A6E6pt1BJDHulUTAwkwdCnEe
         ZDkvIomw9LHc5b9l1mMrkdnz2EN3IEAz7GEkJkNUAZUrgdKDCj1xZVmS8HhuRMpRPTOr
         noew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714472110; x=1715076910;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dIx1dFfAcpeKO8TErHh7vGY1lorqPiA5UlnTCSzH2HY=;
        b=c7NVPpLmgEMX3WQ0eNfXsoO4NtcPYEGZynRSDvLqvnGN2nu41OVpreVGxA2oUZQGBg
         4Vil+QG+Ektk6tEu5u0DDW56ccN5XTnNW93lXUMflPiwkCb9w/9Oocx3Lwh+/9zlM7l8
         EERAf/OvMa9tMXhiYkBsVoK5YQfGP8nK6C5eMq+MOmo3CqV58NG6Li7lHfDkOD3LFOP6
         hCpFarAV9B73xP4uGoLrqiyaHV2siResrl3IncpALjFzEd9rol8My5WGb3sch/S/BNj1
         rMlpl449zVu0haueMNlUPWtvwqrqeGn52OkRve+5efc7Q9DbK3i3cD3zjj8uFXcPebTi
         xsrA==
X-Forwarded-Encrypted: i=1; AJvYcCXpCyUtzShXdTLplRKgxqCUJeGG1ezufGRjZ0Y1ISEI60lPdcVoq3V+FD8MMiMspJF6nuM47I3rcXbWzJAG2cVIn8KEXX3DJbAYRC6pcQ==
X-Gm-Message-State: AOJu0YwmEvOv/xOyD9Dt3u0LnKFSL7Sxl95VrGaxa1tC2qZxlnPUzgiH
	2r0DLhnYcsk/NqYKOdl5ZhV0yiz3oiOchohZg++nGLLeQz5MpCcUJJM5hjDqMvw=
X-Google-Smtp-Source: AGHT+IEeZGVbkW3UvagFGYDQZ5bMmN4VdL24N9F8cduZig7xQbulffwe9LBCfuUp6MPaqlZqlp0YPw==
X-Received: by 2002:ac2:4945:0:b0:516:cf23:588 with SMTP id o5-20020ac24945000000b00516cf230588mr10156881lfi.27.1714472109993;
        Tue, 30 Apr 2024 03:15:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru (dzdbxzyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::227])
        by smtp.gmail.com with ESMTPSA id g29-20020a0565123b9d00b0051d807addd7sm884156lfv.60.2024.04.30.03.15.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Apr 2024 03:15:09 -0700 (PDT)
Date: Tue, 30 Apr 2024 13:15:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Vignesh Raman <vignesh.raman@collabora.com>
Cc: dri-devel@lists.freedesktop.org, daniels@collabora.com, 
	helen.koike@collabora.com, airlied@gmail.com, daniel@ffwll.ch, robdclark@gmail.com, 
	david.heidelberg@collabora.com, guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com, 
	mcanal@igalia.com, linux-mediatek@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org, 
	virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 5/5] drm/ci: update xfails for the new testlist
Message-ID: <hon4klkoaouuxhtvm3qb3qstsrdcibihksyrmvxkt3taijl6wb@ubitr6namryw>
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
 <20240430091121.508099-6-vignesh.raman@collabora.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240430091121.508099-6-vignesh.raman@collabora.com>

On Tue, Apr 30, 2024 at 02:41:21PM +0530, Vignesh Raman wrote:
> Now the testlist is used from IGT build, so update
> xfails with the new testlist.
> 
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
> ---
>  .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt | 47 +++++++----
>  .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  8 +-
>  .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt | 15 ++++
>  drivers/gpu/drm/ci/xfails/i915-amly-fails.txt | 22 ++++-
>  .../gpu/drm/ci/xfails/i915-amly-flakes.txt    |  8 ++
>  drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |  8 ++
>  drivers/gpu/drm/ci/xfails/i915-apl-fails.txt  | 45 +++++-----
>  drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt |  5 ++
>  drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  | 12 +++
>  drivers/gpu/drm/ci/xfails/i915-cml-fails.txt  | 26 +++++-
>  drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt |  6 ++
>  drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |  8 ++
>  drivers/gpu/drm/ci/xfails/i915-glk-fails.txt  | 28 +++++--
>  drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  | 12 +++
>  drivers/gpu/drm/ci/xfails/i915-kbl-fails.txt  | 39 ++++-----
>  drivers/gpu/drm/ci/xfails/i915-kbl-flakes.txt | 10 ++-
>  drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  | 21 +++++
>  drivers/gpu/drm/ci/xfails/i915-tgl-fails.txt  | 75 +++++++++--------
>  drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  | 13 +++
>  drivers/gpu/drm/ci/xfails/i915-whl-fails.txt  | 46 +++++------
>  drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |  8 ++
>  .../drm/ci/xfails/mediatek-mt8173-fails.txt   | 47 +++--------
>  .../drm/ci/xfails/mediatek-mt8183-fails.txt   | 17 +---
>  .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |  5 ++
>  .../gpu/drm/ci/xfails/meson-g12b-fails.txt    | 20 +----
>  .../gpu/drm/ci/xfails/meson-g12b-flakes.txt   |  5 ++
>  .../gpu/drm/ci/xfails/msm-apq8016-fails.txt   | 26 ++----
>  .../gpu/drm/ci/xfails/msm-apq8016-flakes.txt  |  5 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-fails.txt   |  5 +-
>  .../gpu/drm/ci/xfails/msm-apq8096-flakes.txt  |  5 ++
>  .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   | 67 +++++++++++++++
>  .../msm-sc7180-trogdor-kingoftown-fails.txt   | 34 ++++----
>  .../msm-sc7180-trogdor-kingoftown-flakes.txt  |  5 ++
>  ...sm-sc7180-trogdor-lazor-limozeen-fails.txt | 34 ++++----
>  ...m-sc7180-trogdor-lazor-limozeen-flakes.txt |  5 ++
>  .../gpu/drm/ci/xfails/msm-sdm845-fails.txt    | 75 ++++-------------
>  .../gpu/drm/ci/xfails/msm-sdm845-flakes.txt   | 26 ++----
>  .../drm/ci/xfails/rockchip-rk3288-fails.txt   | 54 ------------
>  .../drm/ci/xfails/rockchip-rk3399-fails.txt   | 80 ++----------------
>  .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  7 --
>  .../drm/ci/xfails/virtio_gpu-none-fails.txt   | 82 +++++++++++++------
>  .../drm/ci/xfails/virtio_gpu-none-skips.txt   |  3 +
>  42 files changed, 574 insertions(+), 495 deletions(-)
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-amly-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-apl-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/i915-cml-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8096-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-flakes.txt
>  create mode 100644 drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-flakes.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3288-fails.txt
>  delete mode 100644 drivers/gpu/drm/ci/xfails/rockchip-rk3399-flakes.txt
> 

[skipped]

> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> index 44a5c62dedad..96e9faf0e607 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-fails.txt
> @@ -1,19 +1,9 @@
> +core_setmaster_vs_auth,Fail
> +device_reset,Fail
> +dumb_buffer,Fail

This doesn't look correct, core tests should be passing.

>  kms_3d,Fail
> -kms_addfb_basic@addfb25-bad-modifier,Fail
> -kms_cursor_legacy@all-pipes-forked-bo,Fail
> -kms_cursor_legacy@all-pipes-forked-move,Fail
> -kms_cursor_legacy@all-pipes-single-bo,Fail
> -kms_cursor_legacy@all-pipes-single-move,Fail
> -kms_cursor_legacy@all-pipes-torture-bo,Fail
> -kms_cursor_legacy@all-pipes-torture-move,Fail
> -kms_cursor_legacy@pipe-A-forked-bo,Fail
> -kms_cursor_legacy@pipe-A-forked-move,Fail
> -kms_cursor_legacy@pipe-A-single-bo,Fail
> -kms_cursor_legacy@pipe-A-single-move,Fail
> -kms_cursor_legacy@pipe-A-torture-bo,Fail
> -kms_cursor_legacy@pipe-A-torture-move,Fail
> -kms_force_connector_basic@force-edid,Fail
> -kms_hdmi_inject@inject-4k,Fail
> -kms_selftest@drm_format,Timeout
> -kms_selftest@drm_format_helper,Timeout

Fine, kms_cursor_legacy tests were migrated to -flakes. But what
happened with the rest of the failures?

> -msm_mapping@ring,Fail
> +kms_force_connector_basic,Fail
> +kms_lease,Fail
> +msm_mapping,Fail
> +msm_submit,Fail
> +tools_test,Fail
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> new file mode 100644
> index 000000000000..3cc361b3d3b3
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-flakes.txt
> @@ -0,0 +1,5 @@
> +# Board Name: apq8016-sbc-usb-host
> +# Bug Report: TBD
> +# IGT Version: 1.28-gd2af13d9f
> +# Linux Version: 6.9.0-rc4
> +kms_cursor_legacy

It looks like one of the scripts has lost subtest granularity. It should
be fixed before the patchset can be merged.

-- 
With best wishes
Dmitry

