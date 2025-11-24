Return-Path: <linux-arm-msm+bounces-83079-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 91071C81050
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 15:30:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CA0C83AD6AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 24 Nov 2025 14:28:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90CC4311948;
	Mon, 24 Nov 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT6UkIwQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BBF3101C9;
	Mon, 24 Nov 2025 14:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763994523; cv=none; b=MkrO3yuUXJoG2mUjX55NkVTNNnz6CbdXBfwLi0VG7nPdqqmpy/znJcsUpVPZLBbKVahbAHHTtSwOqKuMhPHL22P99hSjlMODT7CkPjIEUhxH4WGb1tjHE4yLKUVVp2oWW/LJ23L/AEpenhpcQcuaRXaVXvO06VjLprDQmFxyaLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763994523; c=relaxed/simple;
	bh=IkhDMrDr0BAzrfYI2t03yhO42TtyLpU3vVZ0p4zaEnA=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YfnbmXxKMYK7f6PxKviQBUJTlz4vin8Q1xRd9aM0hdKH+h8nFTNI2gdKbRwuu2xbrHEi+U4nh9iOvxhFXMA4Ao4D8Ara2QLQOKzJIh9FXMdU4vZQSvukzWfpPBWrmca8ZdkBsnLvzvN+3JqTocUhXu0kh0zNBIBZs46Rn0O/nWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT6UkIwQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBC4AC116D0;
	Mon, 24 Nov 2025 14:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763994523;
	bh=IkhDMrDr0BAzrfYI2t03yhO42TtyLpU3vVZ0p4zaEnA=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=NT6UkIwQzHmcu/1edaia0yvod5417Q5NLAiHAUvu4kDFo+aiBKYqZELpWyOoBzC1a
	 lE84bVAgrCdStxsnAociF+ghnDPcqHAx772v4Arrt2rJB0taGA7lAyX9Rp2CNsQ1kG
	 a0ajyVS7scRTeqUCrixfhFmRGePtO9yFYsM+IQO/gacY6j9936tBoaLlqiRrCLdX6a
	 fAOsao9Ke9mrwGNuk3GsTWI6+6Sdhi1A5D4g0YAmVMFPATLiuKF4cZQ3k7BdKg8FIU
	 9xNdnTvzV0nIfVzlk/f3EGdcvH31666iwUKY+YYTwO0QChY9wSY6cgzvjLfL5dfAWA
	 qouNrrhGjK20g==
From: Rob Herring <robh@kernel.org>
Date: Mon, 24 Nov 2025 08:28:41 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Jie Zhang <jie.zhang@oss.qualcomm.com>, 
 Konrad Dybcio <konradybcio@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, Conor Dooley <conor+dt@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>, 
 Sean Paul <sean@poorly.run>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, Jie Zhang <quic_jiezh@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Maxime Ripard <mripard@kernel.org>, Qingqing Zhou <quic_qqzhou@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Dan Carpenter <dan.carpenter@linaro.org>, freedreno@lists.freedesktop.org
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
References: <20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com>
Message-Id: <176399402060.138883.16966313752531744933.robh@kernel.org>
Subject: Re: [PATCH v3 0/6] Support for Adreno 612 GPU - Respin


On Sat, 22 Nov 2025 03:22:14 +0530, Akhil P Oommen wrote:
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
> Changes in v3:
> - Rebased on top of next-20251121 tag
> - Drop a612 driver support patch as it got picked up
> - Rename rgmu.yaml -> qcom,adreno-rgmu.yaml (Krzysztof)
> - Remove reg-names property for rgmu node (Krzysztof)
> - Use 'gmu' instead of 'rgmu' as node name (Krzysztof)
> - Describe cx_mem and cx_dgc register ranges (Krzysztof)
> - A new patch to retrieve gmu core reg resource by id
> - Link to v2: https://lore.kernel.org/r/20251107-qcs615-spin-2-v2-0-a2d7c4fbf6e6@oss.qualcomm.com
> 
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
> Akhil P Oommen (2):
>       drm/msm/a6xx: Retrieve gmu core range by index
>       dt-bindings: display/msm: gpu: Document A612 GPU
> 
> Jie Zhang (3):
>       dt-bindings: display/msm/rgmu: Document A612 RGMU
>       arm64: dts: qcom: sm6150: Add gpu and rgmu nodes
>       arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
> 
> Qingqing Zhou (1):
>       arm64: dts: qcom: sm6150: add the GPU SMMU node
> 
>  .../devicetree/bindings/display/msm/gpu.yaml       |  24 +++-
>  .../bindings/display/msm/qcom,adreno-rgmu.yaml     | 126 ++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
>  arch/arm64/boot/dts/qcom/talos.dtsi                | 141 +++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  14 +-
>  6 files changed, 304 insertions(+), 10 deletions(-)
> ---
> base-commit: e93f8002e4d244f0642224635f457bc8b135c98b
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
 Base: base-commit e93f8002e4d244f0642224635f457bc8b135c98b not known, ignoring
 Base: attempting to guess base-commit...
 Base: tags/next-20251120 (best guess, 4/5 blobs matched)
 Base: tags/next-20251120 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251122-qcs615-spin-2-v3-0-9f4d4c87f51d@oss.qualcomm.com:

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






