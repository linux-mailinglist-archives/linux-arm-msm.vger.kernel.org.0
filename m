Return-Path: <linux-arm-msm+bounces-21016-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8426D8D4079
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 23:47:19 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E569C1F223F3
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 May 2024 21:47:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C1B16169AD7;
	Wed, 29 May 2024 21:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="PI6e89Ul"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E60DD139588;
	Wed, 29 May 2024 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717019235; cv=none; b=mbXLEIQyac6pLak5zHx/vck/lBSO1xCdd8K4LqqyqV6UAiypK0rEQ+zCAN+dR087EvP4DBDpNeu5GI2wC7a3av0xOB6nR+GDbLwWuFJbsPtjNSq8qeuTgjFdc3mtMIvYqiFjQXOJqDBgEyqpRoYqfU8YwMUTVaJVCMxiHjUbW44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717019235; c=relaxed/simple;
	bh=I7jpNw5HWKXgN02+Og8143WPLnygMpQygj4av5BGEl0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HQvXfOuKREuQtUPriroFZgsPz46bHGgbNVeQSOO8taWa7cwEnboroLxKXas0YFnJp1THAKSUAA8SliX0QcecpOTWSmsjkObMUKD/q9Ar8HdCqYJpYZpHtiLTneKwi5y2CFzqjGj2abuZSdDz5fBj9LrfGWl93KT13dX5MDKhGyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=PI6e89Ul; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TJPGrq017183;
	Wed, 29 May 2024 21:46:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gK1kam6vuq9+vcdsWDyIbKSVLMePMif+Lmv6f9E0aRw=; b=PI6e89UlObe6OltA
	wPGSynpbKnPMVJoa9Q/34KrW8KCzbi7NNzFCWZh8gCTfZYcaTyo0UibGuhDzxmHk
	vTxR412upCJ5zKbyM6WUb55St+e9rWdAKaMLw98nTAQOXOuKPFKcsERrYAFvV/6k
	jVIz2GtlgYYyy2WVmrOs8XX8V3V0t5ydQDFFus6z8cPkYZNUzsz3gcSPnjRNlMnd
	bpbQInAk8V2ItDzG71R7M5LPTCEvuPYOZwRXfteBR3exBWh+uUkaNfnSm5aSYLNH
	KYuFbPlFisHRiPj55XKHMi+XBtELswLaEa0gbDK6ye9yRk2GA8xwCjXthw2nBxg1
	eRHldw==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba2njf5r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 21:46:58 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TLkv3R014965
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 21:46:57 GMT
Received: from [10.71.108.229] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 14:46:56 -0700
Message-ID: <b7010617-873b-4a4d-909e-77b45d2cee90@quicinc.com>
Date: Wed, 29 May 2024 14:46:56 -0700
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] drm/ci: skip driver specific tests
Content-Language: en-US
To: Vignesh Raman <vignesh.raman@collabora.com>,
        <dri-devel@lists.freedesktop.org>
CC: <daniels@collabora.com>, <helen.koike@collabora.com>, <airlied@gmail.com>,
        <daniel@ffwll.ch>, <robdclark@gmail.com>,
        <david.heidelberg@collabora.com>, <guilherme.gallo@collabora.com>,
        <sergi.blanch.torne@collabora.com>, <dmitry.baryshkov@linaro.org>,
        <mcanal@igalia.com>, <linux-mediatek@lists.infradead.org>,
        <linux-amlogic@lists.infradead.org>,
        <linux-rockchip@lists.infradead.org>, <amd-gfx@lists.freedesktop.org>,
        <linux-arm-msm@vger.kernel.org>, <intel-gfx@lists.freedesktop.org>,
        <virtualization@lists.linux-foundation.org>,
        <linux-kernel@vger.kernel.org>
References: <20240529024049.356327-1-vignesh.raman@collabora.com>
 <20240529024049.356327-6-vignesh.raman@collabora.com>
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <20240529024049.356327-6-vignesh.raman@collabora.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HDZlth4svdujOStFJLF-vhwH63eH43n4
X-Proofpoint-GUID: HDZlth4svdujOStFJLF-vhwH63eH43n4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_16,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 phishscore=0 suspectscore=0 mlxlogscore=999 malwarescore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405170001
 definitions=main-2405290155



On 5/28/2024 7:40 PM, Vignesh Raman wrote:
> Skip driver specific tests and skip kms tests for
> panfrost driver since it is not a kms driver.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Vignesh Raman <vignesh.raman@collabora.com>

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>

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
> -- 
> 2.40.1
> 

