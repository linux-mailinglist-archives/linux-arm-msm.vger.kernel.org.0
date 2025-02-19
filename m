Return-Path: <linux-arm-msm+bounces-48429-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 94CCBA3AD31
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 01:42:36 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 98E0C1896E96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 19 Feb 2025 00:42:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0A9F31CF9B;
	Wed, 19 Feb 2025 00:42:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RfUZS6xx"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C64AE1C2BD;
	Wed, 19 Feb 2025 00:42:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739925735; cv=none; b=j0P9cBiWiEJwGNf1O1V9kXGCnNysmh+nJBp9V+u9s1A3vdiNP1ArncWRpEiMC7nn6rmjkpx6P5Lt9QHBH3o0oxTEB/ZdKwhp/uaYc4Tlu/GlipTIQ55DfMlPxT1AIFq+CcnN/MS+LO/Rzsi24GO44c6XlD5SE1UVd44j379n0uI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739925735; c=relaxed/simple;
	bh=ryEi3Gdxg4pkyjUwXvJjllTE/ArxaV03uCok4oi9M2I=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=psRBH5RmqgfAXAo/LavrO4VBP1PkJsXuzXlEhEk+xhzqAS0HQE0XT5/4Ez5SDk2RLiRrtPYrcCGWmVQxS23PWtYo2jg+EP3YEaEO3x64FLgp/D1WYuaAKi8KXfjQ+2eR+kCbThnyr1M/uEJbiIdaHqhArFMiC4Y1dqoudvfecHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RfUZS6xx; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F519C4CEE2;
	Wed, 19 Feb 2025 00:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739925735;
	bh=ryEi3Gdxg4pkyjUwXvJjllTE/ArxaV03uCok4oi9M2I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=RfUZS6xxt/XFwBFB0CzcvRedosRVvnPpr4gf0mAfSOTfWO0fKt17P1iH2BYpZKOls
	 6btRTVU6tJr3oufC1KauYg+ulZHe0JoZyAHJ5b0TW7oFF2WXillJoHz3R58+1A3qyx
	 VJD7TEtgjtJ1WNaC03EAKLkk6MvVe5bSRK/7SyXVHZrks3kZBSmO+jAGFqBSPq7NFs
	 NQ61sFztsHUeI3U52duGcJQ19KsNVrS55fd7v60Wq+8DiFyTSFFvfalol48xJ1qS13
	 XUStdKV5SHxmgeU4MPBsojOkAZ8/MHtbum419TqBATmyKUiV98LLx3/gFgxvEERO2w
	 6ygshi8BPjt+g==
Date: Tue, 18 Feb 2025 18:42:14 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Jie Zhang <quic_jiezh@quicinc.com>, Simona Vetter <simona@ffwll.ch>, 
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, dri-devel@lists.freedesktop.org, 
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Bjorn Andersson <andersson@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Maxime Ripard <mripard@kernel.org>
To: Akhil P Oommen <quic_akhilpo@quicinc.com>
In-Reply-To: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
References: <20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com>
Message-Id: <173992515318.2064841.13048632010447768805.robh@kernel.org>
Subject: Re: [PATCH 0/5] EDITME: Support for Adreno 623 GPU


On Thu, 13 Feb 2025 21:40:05 +0530, Akhil P Oommen wrote:
> This series adds support for A623 GPU found in QCS8300 chipsets. This
> GPU IP is very similar to A621 GPU, except for the UBWC configuration
> and the GMU firmware.
> 
> Both DT patches are for Bjorn and rest of the patches for Rob Clark to
> pick up.
> 
> ---
> Jie Zhang (5):
>       drm/msm/a6xx: Fix gpucc register block for A621
>       drm/msm/a6xx: Add support for Adreno 623
>       dt-bindings: display/msm/gmu: Add Adreno 623 GMU
>       arm64: dts: qcom: qcs8300: Add gpu and gmu nodes
>       arm64: dts: qcom: qcs8300-ride: Enable Adreno 623 GPU
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  1 +
>  arch/arm64/boot/dts/qcom/qcs8300-ride.dts          |  8 ++
>  arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 93 ++++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          | 29 +++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  8 ++
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        | 13 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        | 17 ++++
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  5 ++
>  8 files changed, 171 insertions(+), 3 deletions(-)
> ---
> base-commit: 6a25088d268ce4c2163142ead7fe1975bb687cb7
> change-id: 20250213-a623-gpu-support-f6698603fb85
> prerequisite-change-id: 20250131-b4-branch-gfx-smmu-b03261963064:v5
> prerequisite-patch-id: f8fd1a2020c940e595e58a8bd3c55d00d3d87271
> prerequisite-patch-id: 08a0540f75b0f95fd2018b38c9ed5c6f96433b4d
> 
> Best regards,
> --
> Akhil P Oommen <quic_akhilpo@quicinc.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250213-a623-gpu-support-v1-0-993c65c39fd2@quicinc.com:

arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:0: 'gcc_gpu_memnoc_gfx_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:1: 'gcc_gpu_snoc_dvm_gfx_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:2: 'gpu_cc_ahb_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:3: 'gpu_cc_hlos1_vote_gpu_smmu_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:4: 'gpu_cc_cx_gmu_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/qcs8300-ride.dtb: iommu@3da0000: clock-names:5: 'gpu_cc_hub_cx_int_clk' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#






