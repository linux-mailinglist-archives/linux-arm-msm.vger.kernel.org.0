Return-Path: <linux-arm-msm+bounces-81037-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ams.mirrors.kernel.org (ams.mirrors.kernel.org [213.196.21.55])
	by mail.lfdr.de (Postfix) with ESMTPS id D66BDC473A6
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 15:34:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.mirrors.kernel.org (Postfix) with ESMTPS id 550D33490AC
	for <lists+linux-arm-msm@lfdr.de>; Mon, 10 Nov 2025 14:34:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7F3431355A;
	Mon, 10 Nov 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rpDFkjrN"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C940313547;
	Mon, 10 Nov 2025 14:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762785273; cv=none; b=Vs2U/8MU9kAINTKXK89S+CaprAaaQS9OJS/6JfdtRrSIix5Kau1diaMdrS5lDFXGD2gNcF1dkeZAE9h5s5FviV2gHGudCdMwxhVvPrfZF00ZjxCvdm2PwzQkZq3FVhIeRhW1Vi4ms1/Y90RrhjhRJusqZRaE/U/zw4aFGmlxhS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762785273; c=relaxed/simple;
	bh=QwWdaSFRpsrMkAfDVcCa6YyWRZmei08Q/wtKeOJql/Y=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=CIi3GGHF+IDvaD0FsFaBZIyZ3QsHEfj4Ta5D9xPCw89+CES9pWfTAaXzkIisi9tpWC8mHVaqg2QIZ4CCw19LDNoryBxSmTTzv5lTjRFDMwmknq7NEru/7wUIdo/0N0XDJXvZSuAv44E8yb9haPgnovYmS5yU+GBbxoNLE/8ttY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rpDFkjrN; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C10DEC16AAE;
	Mon, 10 Nov 2025 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762785273;
	bh=QwWdaSFRpsrMkAfDVcCa6YyWRZmei08Q/wtKeOJql/Y=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=rpDFkjrNAqvhPN9E4Z09RAKHhO5aprki9jUFwe2e/KFJUaxOlfE9Zw9cga/ImWv1M
	 041C3Wp9dIvLAh885i/vkNCgT+xbuYmU6ceRmSgiFlqdgeIjWowQBILWGBtjQ11cC+
	 9Ww807nhC7g8DF1hp72g47Bzyl2u3Og25W7xFydk6OdRl4eDy1MfLPpawg3LnYgcfJ
	 7Bf1JONW/QgzIkQ6XLzwKw6rFfiCOqrZkFMvPY3EHrmXBMNaZzZRTzaaxz6bt8pehK
	 JnDmYtMhosNwd9FmpBKxNazPQ76j+v267XcucKgF6EMX6H1d8D5+a7H5fw0CboLa4y
	 sRPRZLTRxTujA==
Date: Mon, 10 Nov 2025 08:34:31 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Jie Zhang <jie.zhang@oss.qualcomm.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Maxime Ripard <mripard@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jie Zhang <quic_jiezh@quicinc.com>, 
 dri-devel@lists.freedesktop.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>, linux-kernel@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, freedreno@lists.freedesktop.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Qingqing Zhou <quic_qqzhou@quicinc.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
References: <20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com>
Message-Id: <176278493240.154578.17616368030607174523.robh@kernel.org>
Subject: Re: [PATCH v2 0/6] Support for Adreno 612 GPU - Respin


On Fri, 07 Nov 2025 02:20:05 +0530, Akhil P Oommen wrote:
> This is a respin of an old series [1] that aimed to add support for
> Adreno 612 GPU found in SM6150/QCS615 chipsets. In this version, we
> have consolidated the previously separate series for DT and driver
> support, along with some significant rework.
> 
> Regarding A612 GPU, it falls under ADRENO_6XX_GEN1 family and is a cut
> down version of A615 GPU. A612 has a new IP called Reduced Graphics
> Management Unit or RGMU, a small state machine which helps to toggle
> GX GDSC (connected to CX rail) to implement the IFPC feature. Unlike a
> full-fledged GMU, the RGMU does not support features such as clock
> control, resource voting via RPMh, HFI etc. Therefore, we require linux
> clock driver support similar to gmu-wrapper implementations to control
> gpu core clock and GX GDSC.
> 
> In this series, the description of RGMU hardware in devicetree is more
> complete than in previous version. However, the RGMU core is not
> initialized from the driver as there is currently no need for it. We do
> perform a dummy load of RGMU firmware (now available in linux-firmware)
> to ensure that enabling RGMU core in the future won't break backward
> compatibility for users.
> 
> Due to significant changes compared to the old series, all R-b tags have
> been dropped. Please review with fresh eyes.
> 
> Last 3 patches are for Bjorn and the rest are for Rob Clark for pick up.
> 
> [1] Driver: https://lore.kernel.org/lkml/20241213-a612-gpu-support-v3-1-0e9b25570a69@quicinc.com/
>     Devicetree: https://lore.kernel.org/lkml/fu4rayftf3i4arf6l6bzqyzsctomglhpiniljkeuj74ftvzlpo@vklca2giwjlw/
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v2:
> - Rebased on next-20251105
> - Fix hwcg configuration (Dan)
> - Reuse a few gmu-wrapper routines (Konrad)
> - Split out rgmu dt schema (Krzysztof/Dmitry)
> - Fixes for GPU dt binding doc (Krzysztof)
> - Removed VDD_CX from rgmu dt node. Will post a separate series to
> address the gpucc changes (Konrad)
> - Fix the reg range size for adreno smmu node and reorder the properties (Konrad)
> - Link to v1: https://lore.kernel.org/r/20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com
> 
> ---
> Akhil P Oommen (1):
>       dt-bindings: display/msm: gpu: Document A612 GPU
> 
> Jie Zhang (4):
>       drm/msm/a6xx: Add support for Adreno 612
>       dt-bindings: display/msm/rgmu: Document A612 RGMU
>       arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
>       arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
> 
> Qingqing Zhou (1):
>       arm64: dts: qcom: sm6150: add the GPU SMMU node
> 
>  .../devicetree/bindings/display/msm/gpu.yaml       |  32 ++++-
>  .../devicetree/bindings/display/msm/rgmu.yaml      | 131 +++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
>  arch/arm64/boot/dts/qcom/talos.dtsi                | 138 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  16 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  23 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  45 +++++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   3 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 ++-
>  11 files changed, 398 insertions(+), 16 deletions(-)
> ---
> base-commit: 185cd3dc1a12b97194a62eba9d217d280ef74135
> change-id: 20251015-qcs615-spin-2-ed45b0deb998
> 
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
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


This patch series was applied (using b4) to base:
 Base: base-commit 185cd3dc1a12b97194a62eba9d217d280ef74135 not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20251107 (best guess, 9/10 blobs matched)
 Base: tags/next-20251107 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[89, 13], [89, 4], [2, 150], [2, 76], [89, 7], [89, 10]]
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): False schema does not allow [[90, 8], [90, 0], [31, 19], [31, 87], [90, 3], [90, 6]]
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/qrb4210-rb2.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[111, 13], [111, 4], [48, 150], [48, 76], [111, 7], [111, 10]]
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/sm6115-fxtec-pro1x.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[101, 13], [101, 4], [2, 150], [2, 76], [101, 7], [101, 10]]
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/sm4250-oneplus-billie2.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[87, 13], [87, 4], [44, 150], [44, 76], [87, 7], [87, 10]]
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml






