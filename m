Return-Path: <linux-arm-msm+bounces-66643-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BB14B116FD
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 05:20:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 0C5391894E72
	for <lists+linux-arm-msm@lfdr.de>; Fri, 25 Jul 2025 03:20:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B8BE2242909;
	Fri, 25 Jul 2025 03:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CH8Se7+s"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CE3424169D;
	Fri, 25 Jul 2025 03:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753413570; cv=none; b=tpGATm3KZ4pMGuwBJc+7TzHYUlNXSwzBxZdDDZKWU5/vbC4u5t+Ty3UYZOjeOlJjCmfPUd/m8ngbylUqRoUvglRtf37vSYzGaDGYIwjt+V3RC0iV2RD2ZTPjFDzEC0A8zuXNGIoJ1UEdyRCSBde1+tSfPKxixKwMjMwNJTzq/eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753413570; c=relaxed/simple;
	bh=K3SBDIp7j42YsE2v+szYFgUG5hcIUyMTSfKVVg3jL1c=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=T1UkjISCUMQCXAV2maAjf/ETUA7ksOjgeNh16xQfE0U0A4FO9o3KNmOMkZ1z5bwAOa8m8Jt+MGw3QkTxIWSS1UOb1sniiTnaWNcoqmvJIqavcRHHIziwiCnnu/eODVWiLooZzGVeV69sSyzwinvWHdX34/c/cb85OglqNpCj0mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CH8Se7+s; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 094CEC4CEF8;
	Fri, 25 Jul 2025 03:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753413570;
	bh=K3SBDIp7j42YsE2v+szYFgUG5hcIUyMTSfKVVg3jL1c=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CH8Se7+sv/PQu+1DH2NmptHaSxd5gue1dZqlob5Pay3O1cORSyGN4EpsXFKAXBbmu
	 N2MhwgYekjC/X4pRpzi/FdCxJszRNl19HrsrcsgOfDXaKeTr8bW2xLqe7zANhjU4Mc
	 UehXml4Jope73zcU3G7MWNc/VBrJCZ/KRm8VJVaJ1v7e0fi7UEuHC1vuY8MS9HtDMX
	 xh9lCKZ/AzcjJdmTYv7IC0L4CnsmQC2KbA04c/OsCPFXCV3pQeCWcA31vQdiI56IZZ
	 ddYGLXAGeVcBS1LU21u27WJAKWvHPM52Fy5nB/rKjqbXbuP4TeSzcXkQstWSnqiO9q
	 2485iCIb0KBNQ==
Date: Thu, 24 Jul 2025 22:19:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
References: <20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com>
Message-Id: <175341328532.3754847.3393249180802713461.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] Initial support for Qualcomm Hamoa IOT EVK
 board


On Thu, 24 Jul 2025 16:15:22 +0800, Yijie Yang wrote:
> Introduce the device tree, DT bindings, and driver modifications required
> to bring up the HAMOA-IOT-EVK evaluation board—based on the X1E80100 SoC—to
> a UART shell.
> This patch set focuses on two key hardware components: the HAMOA-IOT-SOM
> and the HAMOA-IOT-EVK carrier board.
> The HAMOA-IOT-SOM is a compact System on Module that integrates the SoC,
> GPIOs, and PMICs. It is designed to be modular and can be paired with
> various carrier boards to support different use cases.
> The HAMOA-IOT-EVK is one such carrier board, designed for IoT scenarios.
> It provides essential peripherals such as UART, on-board PMICs, and
> USB-related components.
> Together, these components form a flexible and scalable platform, and this
> patch set enables their initial bring-up through proper device tree
> configuration and driver support.
> 
> Qualcomm SoCs often have multiple product variants, each identified by a
> different SoC ID. For instance, the x1e80100 SoC has closely related
> variants such as x1e78100 and x1e001de. This diversity in SoC identifiers
> can lead to confusion and unnecessary maintenance complexity in the device
> tree and related subsystems.
> To address this, code names offer a more consistent and project-agnostic
> way to represent SoC families. They tend to remain stable across
> development efforts.
> This patch series introduces "hamoa" as the codename for the x1e80100 SoC.
> Going forward, all x1e80100-related variants—including x1e81000 and others
> in the same family—will be represented under the "hamoa" designation in the
> device tree.
> This improves readability, streamlines future maintenance, and aligns with
> common naming practices across Qualcomm-based platforms.
> 
> Features added and enabled:
> - UART
> - On-board regulators
> - Regulators on the SOM
> - PMIC GLINK
> - USB0 through USB6 and their PHYs
> - Embedded USB (eUSB) repeaters
> - USB Type-C mux
> - PCIe6a and its PHY
> - PCIe4 and its PHY
> - Reserved memory regions
> - Pinctrl
> - NVMe
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> - USB DisplayPort
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> To: Bjorn Andersson <andersson@kernel.org>
> To: Konrad Dybcio <konradybcio@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> Cc: linux-arm-msm@vger.kernel.org
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> 
> ---
> Changes in v2:
> - Merge the compatible rules and remove the compatible string map.
> - Align the ADSP and CDSP firmware paths with other x1e80100 platforms.
> - Remove the regulators on the M.2 card, as well as those managed by UEFI on this board.
> - Merge another patch series that enables USB DisplayPort functionality on this platform: https://lore.kernel.org/all/20250723-x1e-evk-dp-v1-1-be76ce53b9b8@quicinc.com/
> - Link to v1: https://lore.kernel.org/r/20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com
> 
> ---
> Yijie Yang (4):
>       dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
>       firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
>       arm64: dts: qcom: Add HAMOA-IOT-SOM platform
>       arm64: dts: qcom: Add base HAMOA-IOT-EVK board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |   1 +
>  arch/arm64/boot/dts/qcom/Makefile               |   1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 915 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     | 607 ++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c                |   1 +
>  5 files changed, 1525 insertions(+)
> ---
> base-commit: 4d088c49d1e49e0149aa66908c3e8722af68ed07
> change-id: 20250604-hamoa_initial-0cd7036d7271
> 
> Best regards,
> --
> Yijie Yang <yijie.yang@oss.qualcomm.com>
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
 Base: using specified base-commit 4d088c49d1e49e0149aa66908c3e8722af68ed07

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250724-hamoa_initial-v2-0-91b00c882d11@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('wcn_usb_sw_n_state' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: wcn7850-pmu (qcom,wcn7850-pmu): 'vdd-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: wcn7850-pmu (qcom,wcn7850-pmu): 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: wcn7850-pmu (qcom,wcn7850-pmu): 'vdddig-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: wcn7850-pmu (qcom,wcn7850-pmu): 'vddrfa1p2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: wcn7850-pmu (qcom,wcn7850-pmu): 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#






