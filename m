Return-Path: <linux-arm-msm+bounces-55177-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C85A9984A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 21:04:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A3C34923070
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Apr 2025 19:04:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CB11D29114C;
	Wed, 23 Apr 2025 19:04:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g1hYdR2C"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92F0128A1F7;
	Wed, 23 Apr 2025 19:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745435055; cv=none; b=FwV8MTi3bsqEKiuCfLB1QJEACWOWqoyOors0o5U1eH+9efuht2o7MWTsRgmstvHTzGdD8i/x9DWQPyl8XJoN5iHJVMdO8iXftZQRYL+LSWTAq2ISSUvo9WMJzu9UDDj42rvpRK7nTnvqzTyo9u+Nu1NekM+2Q+fuUYM4E7yFc/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745435055; c=relaxed/simple;
	bh=NbNA+WfAaYR2CiEjcAqMDmRiLUAaM5gJnWhVZ673qAI=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=H7uVnBh4rkiPy2V2oreST2zCb3zYOFTg2HV7BPZt/CUFYOg8aX8HDQI/Fpx1mXjFm7vyMz+KpzxmE98ox9Je3kBPD6Jnq91NOVUxQPN0XUS8vA6QmFRjyCXYvMR8ifrkX+sXa/i47wozVfCtOVkyVOIJTOapJMKsgZ3ErOBceuk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g1hYdR2C; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACD99C4CEEC;
	Wed, 23 Apr 2025 19:04:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745435054;
	bh=NbNA+WfAaYR2CiEjcAqMDmRiLUAaM5gJnWhVZ673qAI=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=g1hYdR2Cckvt9+gjrr4HlqibgjuiKGeJC+6lzi9WtlzvjrS5Esq5TCij9i/cDLrIH
	 6FhSzSMPqWnycO5cguRRPLRTyPO/yijsYUCFpE9jo1NkiHsa+puj/j0PkHBI6z2kOU
	 nTrEjiaM6ZrE2LLm3a/60OVWC57K21e+BlCJ7GyyX2la32VvQM+ztJcnnn+QkmE2U9
	 l6qvVcrwLKbZqx1G0AkC/YzurJHQhxUgRuTLBqi8sZBwU2MYpPh+dSIzUOQn1Av8rt
	 PZohfyjU1kHHPq7RcHkIOcxrw1gjOpvAUKxU05Dvbv7YWZ01mxqSoX3M7TVnC8qNMB
	 bBO13i7yOTlSQ==
Date: Wed, 23 Apr 2025 14:04:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, stable@vger.kernel.org, 
 devicetree@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>
To: Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org>
References: <20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org>
Message-Id: <174543497564.885521.12762260832342358735.robh@kernel.org>
Subject: Re: [PATCH] arm64: dts: qcom: x1e80100: Add GFX power domain to
 GPU clock controller


On Wed, 23 Apr 2025 15:58:52 +0300, Abel Vesa wrote:
> According to documentation, the VDD_GFX is powering up the whole GPU
> subsystem. The VDD_GFX is routed through the RPMh GFX power domain.
> 
> So tie the RPMh GFX power domain to the GPU clock controller.
> 
> Cc: stable@vger.kernel.org # 6.11
> Fixes: 721e38301b79 ("arm64: dts: qcom: x1e80100: Add gpu support")
> Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/x1e80100.dtsi | 1 +
>  1 file changed, 1 insertion(+)
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
 Base: using specified base-commit 2c9c612abeb38aab0e87d48496de6fd6daafb00b

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250423-x1e80100-add-gpucc-gfx-pd-v1-1-677d97f61963@linaro.org:

arch/arm64/boot/dts/qcom/x1e80100-dell-xps13-9345.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s-oled.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-lenovo-yoga-slim7x.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1p42100-crd.dtb: clock-controller@3d90000 (qcom,x1p42100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e001de-devkit.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-qcp.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-hp-omnibook-x14.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus15.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-crd.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#
arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus13.dtb: clock-controller@3d90000 (qcom,x1e80100-gpucc): Unevaluated properties are not allowed ('power-domains' was unexpected)
	from schema $id: http://devicetree.org/schemas/clock/qcom,sm8450-gpucc.yaml#






