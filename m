Return-Path: <linux-arm-msm+bounces-19288-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6878BDB11
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 08:05:21 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 36D891F21C59
	for <lists+linux-arm-msm@lfdr.de>; Tue,  7 May 2024 06:05:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1FCE6D1CC;
	Tue,  7 May 2024 06:05:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="1rhG4H0i"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from madrid.collaboradmins.com (madrid.collaboradmins.com [46.235.227.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969026BFD5;
	Tue,  7 May 2024 06:05:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.227.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715061918; cv=none; b=qNI+6JFe5d/97knAUBSefd4302LEq4cFyLLSZloBHag68n2/lebOuX13D+rXGtsHD1wvE6yaRJK9lZsmz8pyMaNPaYxT91QZdn4zLTjLcBAzvCNcKHrQCnN3xFf8wtDEwsnv7+5g7+Pksw82atEoGSPR00k4fIWs5hehw/srptQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715061918; c=relaxed/simple;
	bh=XaJZC5PL1T4P8BdZuPh4ToU1OjptKCbM97Ct2QTMfyI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=G8KDIIpDBQ9qd3/AXWYvIoqbTM/Yf6Li88b8rkHr42GDkTtqTn0wmtjimfvhccz9pKj3Mwttwc8SdoziOLR63GzXJv284bNdscdsrFtx5a0TasOGgBQMA9dDwAunekdRVVLI/AFD1H/82bVJOpd8n1rkW4jI/qO2OfjnVKP82Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=1rhG4H0i; arc=none smtp.client-ip=46.235.227.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1715061914;
	bh=XaJZC5PL1T4P8BdZuPh4ToU1OjptKCbM97Ct2QTMfyI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=1rhG4H0ioEk6/d1h8UdHEzCjmn/pGlvnSAlOaXvcLhzET8elIGJ9z3q+10yZplMjK
	 HNGpwaluEKtnfVa68Sts8ACiILAo9b0SdCwORGlU+PprjN/QdtNvEoz+EWj0cl4Zx4
	 kmzxDdRQZ+T1YpBjTk4SCsyHPiq+VOIJ72f8OUHWVFdUVEF4lA6F/jmMSNk8wPTbWi
	 SAI+dJM41Y+DJlwbdAAQyDbmjOr0Bmp+XqzNDsSFMG4FsjarJagikMH95y+ytUhFmN
	 rd8dK2pG7al4+1qmNttfGZhvvjkbdKZdqx1KDc93aJnz2BJQ/SXlaJgjWek3J0M1wF
	 hBtdgJNLMETSA==
Received: from [100.66.96.193] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2C32B3782112;
	Tue,  7 May 2024 06:05:10 +0000 (UTC)
Message-ID: <c5e7f5a1-48e7-4f8d-821b-50d94931fc4b@collabora.com>
Date: Tue, 7 May 2024 11:35:04 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/5] drm/ci: skip driver specific tests
Content-Language: en-US
To: Helen Koike <helen.koike@collabora.com>, dri-devel@lists.freedesktop.org
Cc: daniels@collabora.com, airlied@gmail.com, daniel@ffwll.ch,
 robdclark@gmail.com, david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 dmitry.baryshkov@linaro.org, mcanal@igalia.com,
 linux-mediatek@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-kernel@vger.kernel.org
References: <20240430091121.508099-1-vignesh.raman@collabora.com>
 <20240430091121.508099-5-vignesh.raman@collabora.com>
 <9cfcc12f-1261-4865-930b-d0355da0e818@collabora.com>
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <9cfcc12f-1261-4865-930b-d0355da0e818@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Helen,

On 30/04/24 20:01, Helen Koike wrote:
> 
> 
> On 30/04/2024 06:11, Vignesh Raman wrote:
>> Skip driver specific tests and skip kms tests for
>> panfrost driver since it is not a kms driver.
>>
>> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>
>> ---
>>   .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt   | 14 +++++++++++++-
>>   drivers/gpu/drm/ci/xfails/i915-amly-skips.txt   | 14 +++++++++++++-
>>   drivers/gpu/drm/ci/xfails/i915-apl-skips.txt    | 14 +++++++++++++-
>>   drivers/gpu/drm/ci/xfails/i915-cml-skips.txt    | 12 ++++++++++++
>>   drivers/gpu/drm/ci/xfails/i915-glk-skips.txt    | 14 +++++++++++++-
>>   drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt    | 14 +++++++++++++-
>>   drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt    | 14 +++++++++++++-
>>   drivers/gpu/drm/ci/xfails/i915-whl-skips.txt    | 14 +++++++++++++-
>>   .../gpu/drm/ci/xfails/mediatek-mt8173-skips.txt | 12 ++++++++++++
>>   .../gpu/drm/ci/xfails/mediatek-mt8183-skips.txt | 14 ++++++++++++++
>>   drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt  | 14 ++++++++++++++
>>   drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt | 14 ++++++++++++++
>>   drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt | 14 +++++++++++++-
>>   .../msm-sc7180-trogdor-kingoftown-skips.txt     | 15 +++++++++++++++
>>   .../msm-sc7180-trogdor-lazor-limozeen-skips.txt | 15 +++++++++++++++
>>   drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt  | 15 +++++++++++++++
>>   .../gpu/drm/ci/xfails/rockchip-rk3288-skips.txt | 17 ++++++++++++++++-
>>   .../gpu/drm/ci/xfails/rockchip-rk3399-skips.txt | 15 +++++++++++++++
>>   .../gpu/drm/ci/xfails/virtio_gpu-none-skips.txt | 15 ++++++++++++++-
>>   19 files changed, 260 insertions(+), 10 deletions(-)
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>>   create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
>>
>> diff --git a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>> index e2c538a0f954..70e2f925d06f 100644
>> --- a/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/amdgpu-stoney-skips.txt
>> @@ -1,2 +1,14 @@
>>   # Suspend to RAM seems to be broken on this machine
>> -.*suspend.*
>> \ No newline at end of file
>> +.*suspend.*
>> +
>> +# Skip driver specific tests
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>> index fe55540a3f9a..59f8acfaa5ba 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-amly-skips.txt
>> @@ -1,4 +1,16 @@
>>   # Suspend to RAM seems to be broken on this machine
>>   .*suspend.*
>>   # This is generating kernel oops with divide error
>> -kms_plane_scaling@invalid-parameters
>> \ No newline at end of file
>> +kms_plane_scaling@invalid-parameters
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# GEM tests takes ~1000 hours, so skip it
>> +gem_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>> index 3430b215c06e..d97bc038b63a 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-apl-skips.txt
>> @@ -3,4 +3,16 @@
>>   # This is generating kernel oops with divide error
>>   kms_plane_scaling@invalid-parameters
>>   # This is cascading issues
>> -kms_3d
>> \ No newline at end of file
>> +kms_3d
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# GEM tests takes ~1000 hours, so skip it
>> +gem_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
>> index 6d3d7ddc377f..92c0ffee8283 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-cml-skips.txt
>> @@ -1,2 +1,14 @@
>>   # This is generating kernel oops with divide error
>>   kms_plane_scaling@invalid-parameters
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# GEM tests takes ~1000 hours, so skip it
>> +gem_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>> index 4c7d00ce14bc..a168722caf13 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-glk-skips.txt
>> @@ -2,4 +2,16 @@
>>   .*suspend.*
>>   # This is generating kernel oops with divide error
>> -kms_plane_scaling@invalid-parameters
>> \ No newline at end of file
>> +kms_plane_scaling@invalid-parameters
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# GEM tests takes ~1000 hours, so skip it
>> +gem_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>> index 4c7d00ce14bc..a168722caf13 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt
>> @@ -2,4 +2,16 @@
>>   .*suspend.*
>>   # This is generating kernel oops with divide error
>> -kms_plane_scaling@invalid-parameters
>> \ No newline at end of file
>> +kms_plane_scaling@invalid-parameters
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# GEM tests takes ~1000 hours, so skip it
>> +gem_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>> index 1d0621750b14..d41344627261 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt
>> @@ -8,4 +8,16 @@ gem_eio.*
>>   kms_flip@absolute-wf_vblank@a-edp1
>>   # This is generating kernel oops with divide error
>> -kms_plane_scaling@invalid-parameters
>> \ No newline at end of file
>> +kms_plane_scaling@invalid-parameters
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# GEM tests takes ~1000 hours, so skip it
>> +gem_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
>> index f3be0888a214..92c0ffee8283 100644
>> --- a/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/i915-whl-skips.txt
>> @@ -1,2 +1,14 @@
>>   # This is generating kernel oops with divide error
>> -kms_plane_scaling@invalid-parameters
>> \ No newline at end of file
>> +kms_plane_scaling@invalid-parameters
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# GEM tests takes ~1000 hours, so skip it
>> +gem_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>> new file mode 100644
>> index 000000000000..db0c9dbbeb61
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
>> @@ -0,0 +1,12 @@
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>> new file mode 100644
>> index 000000000000..7a1c8be89e5b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
>> @@ -0,0 +1,14 @@
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +
>> +# Panfrost is not a KMS driver, so skip the KMS tests
>> +kms_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>> new file mode 100644
>> index 000000000000..7a1c8be89e5b
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
>> @@ -0,0 +1,14 @@
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +
>> +# Panfrost is not a KMS driver, so skip the KMS tests
>> +kms_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
>> new file mode 100644
>> index 000000000000..cc0c2f1ecca7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
>> @@ -0,0 +1,14 @@
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +
>> +# Skip these tests as core_getrevision fails
> 
> DO you mean core_hotunplug in the comments?

No. core_hotunplug fails and the machine is a bad state. So 
core_getrevision test also fails and other tests are not run.
Will update the comment section.

Regards,
Vignesh

> 
>> +core_hotunplug.*
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>> index cd49c8ce2059..9ab2177df1ab 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-apq8096-skips.txt
>> @@ -1,2 +1,14 @@
>>   # Whole machine hangs
>> -kms_cursor_legacy@all-pipes-torture-move
>> \ No newline at end of file
>> +kms_cursor_legacy@all-pipes-torture-move
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>> index 327039f70252..053810a24691 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-kingoftown-skips.txt
>> @@ -1,2 +1,17 @@
>>   # Suspend to RAM seems to be broken on this machine
>>   .*suspend.*
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +
>> +# Skip these tests as core_getrevision fails
>> +core_hotunplug.*
>> diff --git 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
>> index 327039f70252..053810a24691 100644
>> --- 
>> a/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
>> +++ 
>> b/drivers/gpu/drm/ci/xfails/msm-sc7180-trogdor-lazor-limozeen-skips.txt
>> @@ -1,2 +1,17 @@
>>   # Suspend to RAM seems to be broken on this machine
>>   .*suspend.*
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +
>> +# Skip these tests as core_getrevision fails
>> +core_hotunplug.*
>> diff --git a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>> index 618e3a3a7277..871110845b52 100644
>> --- a/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/msm-sdm845-skips.txt
>> @@ -5,3 +5,18 @@ kms_bw.*
>>   # 
>> https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/4b49f902ec6f2bb382cbbf489870573f4b43371e
>>   # 
>> https://gitlab.freedesktop.org/gfx-ci/linux/-/commit/38cdf4c5559771e2474ae0fecef8469f65147bc1
>>   msm_mapping@*
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +
>> +# Skip these tests as core_getrevision fails
>> +core_hotunplug.*
>> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>> index f20c3574b75a..c33dc95b7fc1 100644
>> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3288-skips.txt
>> @@ -49,4 +49,19 @@ kms_plane_lowres@pipe-F-tiling-y
>>   kms_cursor_crc.*
>>   # Machine is hanging in this test, so skip it
>> -kms_pipe_crc_basic@disable-crc-after-crtc
>> \ No newline at end of file
>> +kms_pipe_crc_basic@disable-crc-after-crtc
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +
>> +# Panfrost is not a KMS driver, so skip the KMS tests
>> +kms_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>> index 10c3d81a919a..8a7c9464b30d 100644
>> --- a/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/rockchip-rk3399-skips.txt
>> @@ -3,3 +3,18 @@
>>   # Too unstable, machine ends up hanging after lots of Oopses
>>   kms_cursor_legacy.*
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*
>> +
>> +# Panfrost is not a KMS driver, so skip the KMS tests
>> +kms_.*
>> diff --git a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt 
>> b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>> index 78be18174012..6f00d3670530 100644
>> --- a/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>> +++ b/drivers/gpu/drm/ci/xfails/virtio_gpu-none-skips.txt
>> @@ -3,4 +3,17 @@
>>   kms_cursor_legacy.*
>>   # Job just hangs without any output
>> -kms_flip@flip-vs-suspend.*
>> \ No newline at end of file
>> +kms_flip@flip-vs-suspend.*
>> +
>> +# Skip driver specific tests
>> +^amdgpu.*
>> +msm_.*
>> +nouveau_.*
>> +panfrost_.*
>> +^v3d.*
>> +^vc4.*
>> +^vmwgfx*
>> +
>> +# Skip intel specific tests
>> +gem_.*
>> +i915_.*

