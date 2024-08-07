Return-Path: <linux-arm-msm+bounces-28107-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E9D294ACC1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 17:23:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 5E753B22DB1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  7 Aug 2024 15:22:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABB01127E3A;
	Wed,  7 Aug 2024 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GAsphRfe"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DB4984E04;
	Wed,  7 Aug 2024 15:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723044027; cv=none; b=kV9Wj87SFDohqh+1t848y7nI/vkTm6AIVjs6+kMqP9lqEqdcpm2hob+xArHu8Nx70IkY5WZuQd14YOey5W0L4rxAX6uGOQnjpziWVtIzOqiMQntMGb3L66JCBmDPrZy61047bodoM8RCnb+HGnisL3p8RzuICGTZfdjVq12byW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723044027; c=relaxed/simple;
	bh=xERSTfQqUvdd2k3tAtUqyYEs/LVRZsmS4yVoWayUT+E=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ljtqXhMy1CiUv/fv1nm7ckYmeE3C9+iw7i6mcIyff1gjHo72e/n6fHyiG9NQx3+9a+YAZraIR+h8pVHVD3ctRH7ZZ3OnjDXu4VfLoXN1J/hpXxvn81jdwfs8p+2kUkXxZNWHLiyW5q+Gb9uMGc5fWVuascaTK7pSATDRryC8/HE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GAsphRfe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE2BCC32781;
	Wed,  7 Aug 2024 15:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723044027;
	bh=xERSTfQqUvdd2k3tAtUqyYEs/LVRZsmS4yVoWayUT+E=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=GAsphRfeDUfnMH1Vai3L+59Pwz/5hOlhZEhnZy+82Suaphx0tjjim+AGlEAmMYCPd
	 Y3X2HhARfVMOiaCGSNUbBGPn9+xxpJbiUhPx9/ENpXhS5XAI4DwQYIFQu1OFpvV3aP
	 IKtlwiR2xXYrj6+pX6aJjJFYCCaF+smjFYI3M6EoE8Ov/w1HzlvfJsZPUomkJtmnnW
	 jvFCjYz5BPtoRVAb9a+lZjpNrKp55P6oxsN5dZgGmEw7rbUUZPmb7sSn6U1IzfsKse
	 YHho8C49xpNHhT3yZBexGxnwtfdWptmblEY1ST+dRHAQ+r/vELsBXhMovmXw+/C7BV
	 VHzNOJNBio1Rg==
Date: Wed, 07 Aug 2024 09:20:25 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Richard Acayan <mailingradian@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Daniel Vetter <daniel@ffwll.ch>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Ripard <mripard@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 freedreno@lists.freedesktop.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org, 
 Sean Paul <sean@poorly.run>
In-Reply-To: <20240806214452.16406-7-mailingradian@gmail.com>
References: <20240806214452.16406-7-mailingradian@gmail.com>
Message-Id: <172304385687.2508167.11953351079557363254.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] drm/msm/adreno: Add A615 GPU for SDM670 and
 Pixel 3a


On Tue, 06 Aug 2024 17:44:54 -0400, Richard Acayan wrote:
> This adds support for the speed-binned A615 GPU on SDM670.
> 
> Changes since v1 (20240730013844.41951-6-mailingradian@gmail.com):
> - add Acked-by tag (1/4)
> - add OPPs exclusive to some speed bins (3/4)
> - enable GMU by default (3/4)
> 
> Richard Acayan (4):
>   dt-bindings: display/msm/gmu: Add SDM670 compatible
>   drm/msm/adreno: add a615 support
>   arm64: dts: qcom: sdm670: add gpu
>   arm64: dts: qcom: sdm670-google-sargo: enable gpu
> 
>  .../devicetree/bindings/display/msm/gmu.yaml  |   1 +
>  .../boot/dts/qcom/sdm670-google-sargo.dts     |   9 +
>  arch/arm64/boot/dts/qcom/sdm670.dtsi          | 180 ++++++++++++++++++
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c     |  27 +++
>  4 files changed, 217 insertions(+)
> 
> --
> 2.46.0
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


New warnings running 'make CHECK_DTBS=y qcom/sdm670-google-sargo.dtb' for 20240806214452.16406-7-mailingradian@gmail.com:

arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: iommu@5040000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2'] is too long
	['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2'] is too short
	'qcom,sdm670-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,msm8998-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sm6375-smmu-v2']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,qdu1000-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm670-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sdx55-smmu-500', 'qcom,sdx65-smmu-500', 'qcom,sdx75-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sc7180-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sdm845-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6350-smmu-500', 'qcom,sm6375-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,qcm2290-smmu-500', 'qcom,sa8775p-smmu-500', 'qcom,sc7280-smmu-500', 'qcom,sc8180x-smmu-500', 'qcom,sc8280xp-smmu-500', 'qcom,sm6115-smmu-500', 'qcom,sm6125-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500', 'qcom,sm8350-smmu-500', 'qcom,sm8450-smmu-500', 'qcom,sm8550-smmu-500', 'qcom,sm8650-smmu-500', 'qcom,x1e80100-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,sc7280-smmu-500', 'qcom,sm8150-smmu-500', 'qcom,sm8250-smmu-500']
	'qcom,sdm670-smmu-v2' is not one of ['qcom,msm8996-smmu-v2', 'qcom,sc7180-smmu-v2', 'qcom,sdm630-smmu-v2', 'qcom,sdm845-smmu-v2', 'qcom,sm6350-smmu-v2', 'qcom,sm7150-smmu-v2']
	'qcom,sdm845-smmu-v2' was expected
	'marvell,ap806-smmu-500' was expected
	'qcom,sdm670-smmu-v2' is not one of ['nvidia,tegra186-smmu', 'nvidia,tegra194-smmu', 'nvidia,tegra234-smmu']
	'arm,mmu-500' was expected
	'qcom,sdm670-smmu-v2' is not one of ['arm,mmu-400', 'arm,mmu-401']
	'qcom,sdm670-smmu-v2' is not one of ['arm,smmu-v1', 'arm,smmu-v2', 'arm,mmu-400', 'arm,mmu-401', 'arm,mmu-500', 'cavium,smmu-v2']
	'qcom,smmu-v2' was expected
	'qcom,smmu-500' was expected
	'nvidia,smmu-500' was expected
	'arm,smmu-v2' was expected
	'arm,smmu-v1' was expected
	from schema $id: http://devicetree.org/schemas/iommu/arm,smmu.yaml#
arch/arm64/boot/dts/qcom/sdm670-google-sargo.dtb: /soc@0/iommu@5040000: failed to match any schema with compatible: ['qcom,sdm670-smmu-v2', 'qcom,adreno-smmu', 'qcom,smmu-v2']






