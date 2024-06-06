Return-Path: <linux-arm-msm+bounces-21952-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 331718FEE32
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 16:43:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B058B2819F0
	for <lists+linux-arm-msm@lfdr.de>; Thu,  6 Jun 2024 14:43:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82ED019FA99;
	Thu,  6 Jun 2024 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="A+XoPbr+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63FCE1991A9;
	Thu,  6 Jun 2024 14:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717683631; cv=none; b=XCmkHzPG27Ddi+ljVVOXK42cD+/U+hCJ1KZ2T5AJN1UkWIyZbdwoLYqQzQYDs5s4vAhlNRoJvydWDJ0jcGDFGPcWDnlsV30VqhryDJL4CiOseJzbScyAFePEW2splriT/2SNv1HbZc1OFvefbNLbA3qSwEqXkDUzP4r7XeVxXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717683631; c=relaxed/simple;
	bh=t26eK8iAOvFeErE38CO00Q1xylyCBDVL58iRDj5aS6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u3le/6d0x8z0hfQN4ODQQZv0ddsHyjur6qgMmiQpQKV9C1dy/nWZ9ODDYBUDJXwoBAVmh0glA0yS/E1dsacJFmeXMme3idIOq5GiLXp3BdcTKlkYJWCF0NQeo90lVzJkiMdqDJUgPQNp4omhr3I+HqcJIEMBhm+NtAVuHRRFnA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=A+XoPbr+; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1717683627;
	bh=t26eK8iAOvFeErE38CO00Q1xylyCBDVL58iRDj5aS6U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=A+XoPbr+9tKKRIzja8HOvDDurXlSQtQwP9T79wOAMuHvUy2Ju0AgFWFIbbMFg85Ib
	 Oj/w1eyFdYmDCBPKS9zaY5AICKrBFh85XtV7xeE1uDcUIoLivrnzl9hcuvilkErU/U
	 qIM27HLVw6qBy9TeAV2rEL38lYXVhzrtEZ/q2Lk3YKetkHpo3AkthNwa3ufEv0Goxe
	 4R7wLI4dcTqajA/9NaKcXApXzUAuohe9xBQ1sndOoJmjl+dOxJBuTiqUU+yn+uOEXd
	 WD3mN3ZPhvEGt879nhI2S9erpBrQhbtaf6YJ77b4J6lwFCUnwVnQqQojFM6Fvu5Caq
	 Ht2NHcGrA3j0g==
Received: from [100.95.196.25] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: koike)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 422F437821E6;
	Thu,  6 Jun 2024 14:20:21 +0000 (UTC)
Message-ID: <65b6be43-ed81-4864-8849-ecc0c3a31e6d@collabora.com>
Date: Thu, 6 Jun 2024 11:20:20 -0300
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/ci: skip driver specific tests
To: Vignesh Raman <vignesh.raman@collabora.com>,
 dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-6-vignesh.raman@collabora.com>
Content-Language: en-US
From: Helen Koike <helen.koike@collabora.com>
In-Reply-To: <20240529024049.356327-6-vignesh.raman@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 28/05/2024 23:40, Vignesh Raman wrote:
> Skip driver specific tests and skip kms tests for
> panfrost driver since it is not a kms driver.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Acked-by: Helen Koike <helen.koike@collabora.com>


> ---
> 
> v2:
>    - Skip xe tests for amdgpu and virtio.
> 
> v3:
>    - No changes.
> 
> ---
>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt   | 15 ++++++++++++++-
>   drivers/gpu/drm/ci/xfails/i915-amly-skips.txt   | 11 ++++++++++-
>   drivers/gpu/drm/ci/xfails/i915-apl-skips.txt    | 11 ++++++++++-
>   drivers/gpu/drm/ci/xfails/i915-cml-skips.txt    |  9 +++++++++
>   drivers/gpu/drm/ci/xfails/i915-glk-skips.txt    | 11 ++++++++++-
>   drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt    | 11 ++++++++++-
>   drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt    | 11 ++++++++++-
>   drivers/gpu/drm/ci/xfails/i915-whl-skips.txt    | 11 ++++++++++-
>   .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt | 12 ++++++++++++
>   .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt | 14 ++++++++++++++
>   drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt  | 14 ++++++++++++++
>   drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt | 11 +++++++++++
>   drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt | 14 +++++++++++++-
>   .../msm-sc7180-trogdor-kingoftown-skips.txt     | 12 ++++++++++++
>   .../msm-sc7180-trogdor-lazor-limozeen-skips.txt | 12 ++++++++++++
>   drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt  | 12 ++++++++++++
>   .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt | 17 ++++++++++++++++-
>   .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt | 15 +++++++++++++++
>   .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt | 16 +++++++++++++++-
>   19 files changed, 229 insertions(+), 10 deletions(-)
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> 
> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> index e2c538a0f954..21d26d5e67c2 100644
> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
> @@ -1,2 +1,15 @@
>   # Suspend to RAM seems to be broken on this machine
> -.*suspend.*
> \ No newline at end of file
> +.*suspend.*
> +
> +# Skip driver specific tests
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> index fe55540a3f9a..1e80987cf584 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
> @@ -1,4 +1,13 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> index 3430b215c06e..0104f2ffa8ba 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
> @@ -3,4 +3,13 @@
>   # This is generating kernel oops with divide error
>   kms_plane_scaling@invalid-parameters
>   # This is cascading issues
> -kms_3d
> \ No newline at end of file
> +kms_3d
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> index 6d3d7ddc377f..398ebe163ad0 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
> @@ -1,2 +1,11 @@
>   # This is generating kernel oops with divide error
>   kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> index 4c7d00ce14bc..4f5419d62170 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
> @@ -2,4 +2,13 @@
>   .*suspend.*
>   
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> index 4c7d00ce14bc..4f5419d62170 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
> @@ -2,4 +2,13 @@
>   .*suspend.*
>   
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> index 1d0621750b14..b0372c239b93 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
> @@ -8,4 +8,13 @@ gem_eio.*
>   kms_flip@absolute-wf_vblank@a-edp1
>   
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> index f3be0888a214..398ebe163ad0 100644
> --- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
> @@ -1,2 +1,11 @@
>   # This is generating kernel oops with divide error
> -kms_plane_scaling@invalid-parameters
> \ No newline at end of file
> +kms_plane_scaling@invalid-parameters
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> new file mode 100644
> index 000000000000..db0c9dbbeb61
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> @@ -0,0 +1,12 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> new file mode 100644
> index 000000000000..7a1c8be89e5b
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> @@ -0,0 +1,14 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> new file mode 100644
> index 000000000000..7a1c8be89e5b
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> @@ -0,0 +1,14 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> new file mode 100644
> index 000000000000..7fea49ec6b8f
> --- /dev/null
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> @@ -0,0 +1,11 @@
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> index cd49c8ce2059..9ab2177df1ab 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
> @@ -1,2 +1,14 @@
>   # Whole machine hangs
> -kms_cursor_legacy@all-pipes-torture-move
> \ No newline at end of file
> +kms_cursor_legacy@all-pipes-torture-move
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> index 327039f70252..edf64057f866 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
> @@ -1,2 +1,14 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> index 327039f70252..edf64057f866 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
> @@ -1,2 +1,14 @@
>   # Suspend to RAM seems to be broken on this machine
>   .*suspend.*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> index 618e3a3a7277..dd24dc190db0 100644
> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
> @@ -5,3 +5,15 @@ kms_bw.*
>   # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/4b49f902ec6f2bb382cbbf489870573f4b43371e
>   # https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/38cdf4c5559771e2474ae0fecef8469f65147bc1
>   msm_mapping@*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> index f20c3574b75a..c33dc95b7fc1 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
> @@ -49,4 +49,19 @@ kms_plane_lowres@pipe-F-tiling-y
>   kms_cursor_crc.*
>   
>   # Machine is hanging in this test, so skip it
> -kms_pipe_crc_basic@disable-crc-after-crtc
> \ No newline at end of file
> +kms_pipe_crc_basic@disable-crc-after-crtc
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> index 10c3d81a919a..8a7c9464b30d 100644
> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
> @@ -3,3 +3,18 @@
>   
>   # Too unstable, machine ends up hanging after lots of Oopses
>   kms_cursor_legacy.*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +
> +# Panfrost is not a KMS driver, so skip the KMS tests
> +kms_.*
> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> index 78be18174012..59d390d6856f 100644
> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
> @@ -3,4 +3,18 @@
>   kms_cursor_legacy.*
>   
>   # Job just hangs without any output
> -kms_flip@flip-vs-suspend.*
> \ No newline at end of file
> +kms_flip@flip-vs-suspend.*
> +
> +# Skip driver specific tests
> +^amdgpu.*
> +msm_.*
> +nouveau_.*
> +panfrost_.*
> +^v3d.*
> +^vc4.*
> +^vmwgfx*
> +
> +# Skip intel specific tests
> +gem_.*
> +i915_.*
> +xe_.*

