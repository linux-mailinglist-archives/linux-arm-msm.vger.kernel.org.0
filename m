Return-Path: <linux-arm-msm+bounces-77840-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [IPv6:2605:f480:58:1:0:1994:3:14])
	by mail.lfdr.de (Postfix) with ESMTPS id DD3CEBEBD9B
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 23:53:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 216BE4E31A4
	for <lists+linux-arm-msm@lfdr.de>; Fri, 17 Oct 2025 21:53:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A29E62D63F2;
	Fri, 17 Oct 2025 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fL7PBinz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75D2D274B23;
	Fri, 17 Oct 2025 21:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760737986; cv=none; b=b4FYa94mhqrhLz69P0AqeBAsrcwlqE21ftStH/g8SiJtCjMJMFiMi/n2oUlV3NU4dVZX4jqjGLJlR+hVaAUMqRF0mwT/f6hxb8jBTXkQc20yzJ27L6kbkC4mE/Queu0XVt4EKA9sfzEX6rZ/Bmp5wzExVozBm/sHX/VW/MUhiX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760737986; c=relaxed/simple;
	bh=zyGbZ1+GnK72NuqMDFHhZ9T6LjTvTkdjx+8fwG4y/SE=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=Npbjz7T6P5lbPh2pWgUa4EW+KQPrgNxxLnKjEZKoYC9z5RqRr2ZCnyVWMuORnHvFlZg7Yp5ndaUeE1O7Z8gTd5Dvw0ttNp58evTb9WLUPCGsFs6j3vl0in/cmwRzdQwnH59MSv3HwlU4D/8BqPmUyRTHUvPf1hNcv4Yeb02Sk2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fL7PBinz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F19C4CEF9;
	Fri, 17 Oct 2025 21:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760737986;
	bh=zyGbZ1+GnK72NuqMDFHhZ9T6LjTvTkdjx+8fwG4y/SE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=fL7PBinzUgT69Wen5GTnUelk0bmeINX+aPph4Hfz1n7kg5W2N5sAPHs1i+ogfYceE
	 P903tkxmaW+1wySVKjrdIeWF1ZpGRAijLbflTXFenLqTkZ//PjVA+LKRYCXY0CfykQ
	 tlGU3zy/QKtU4lQa/ktNZXOma+tJVtIFeTo76PVlw4g8uRSHe0AupSVdxYvxqVisRd
	 f/cPIVHII04Sq4PzsKFW3VmyvC+m5Q03l+atCIXOUta9u7XAQgNYtNAKUChTK4hxBt
	 ey8h0/uVhW0eyNICKNrg8gchtexer2yBmmvRFH7VzykSkK+wnOQN3qF83bjv9Jcxlu
	 1/tsErfVSxiQg==
Date: Fri, 17 Oct 2025 16:53:04 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 devicetree@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>, 
 Jie Zhang <quic_jiezh@quicinc.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Qingqing Zhou <quic_qqzhou@quicinc.com>, David Airlie <airlied@gmail.com>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 Bjorn Andersson <andersson@kernel.org>, freedreno@lists.freedesktop.org, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Conor Dooley <conor+dt@kernel.org>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
References: <20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com>
Message-Id: <176073765649.419746.11033982562850186565.robh@kernel.org>
Subject: Re: [PATCH 0/6] Support for Adreno 612 GPU - Respin


On Fri, 17 Oct 2025 22:38:28 +0530, Akhil P Oommen wrote:
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
> To: Rob Clark <robin.clark@oss.qualcomm.com>
> To: Sean Paul <sean@poorly.run>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Dmitry Baryshkov <lumag@kernel.org>
> To: Abhinav Kumar <abhinav.kumar@linux.dev>
> To: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> To: Marijn Suijten <marijn.suijten@somainline.org>
> To: David Airlie <airlied@gmail.com>
> To: Simona Vetter <simona@ffwll.ch>
> To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> To: Maxime Ripard <mripard@kernel.org>
> To: Thomas Zimmermann <tzimmermann@suse.de>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Bjorn Andersson <andersson@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: freedreno@lists.freedesktop.org
> Cc: linux-kernel@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> 
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Akhil P Oommen (2):
>       dt-bindings: display/msm: gpu: Document A612 GPU
>       dt-bindings: display/msm/gmu: Document A612 RGMU
> 
> Jie Zhang (3):
>       drm/msm/a6xx: Add support for Adreno 612
>       arm64: dts: qcom: qcs615: Add gpu and rgmu nodes
>       arm64: dts: qcom: qcs615-ride: Enable Adreno 612 GPU
> 
> Qingqing Zhou (1):
>       arm64: dts: qcom: qcs615: add the GPU SMMU node
> 
>  .../devicetree/bindings/display/msm/gmu.yaml       |  98 +++++++++++---
>  .../devicetree/bindings/display/msm/gpu.yaml       |  31 ++++-
>  arch/arm64/boot/dts/qcom/qcs615-ride.dts           |   8 ++
>  arch/arm64/boot/dts/qcom/sm6150.dtsi               | 139 ++++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  16 +++
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  87 ++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              | 143 ++++++++++++++++++++-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   1 +
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |   3 +-
>  drivers/gpu/drm/msm/adreno/adreno_gpu.c            |   1 +
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |  16 ++-
>  11 files changed, 511 insertions(+), 32 deletions(-)
> ---
> base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
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
 Base: cb6649f6217c0331b885cf787f1d175963e2a1d2 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20251017-qcs615-spin-2-v1-0-0baa44f80905@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/sm6115p-lenovo-j606f.dtb: gpu@5900000 (qcom,adreno-610.0): False schema does not allow [[89, 13], [89, 4], [2, 150], [2, 76], [89, 7], [89, 10]]
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): False schema does not allow ['core', 'iface', 'mem_iface', 'alt_mem_iface', 'gmu', 'xo']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml
arch/arm64/boot/dts/qcom/qrb2210-rb1.dtb: gpu@5900000 (qcom,adreno-07000200): False schema does not allow [[86, 8], [86, 0], [29, 19], [29, 87], [86, 3], [86, 6]]
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






