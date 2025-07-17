Return-Path: <linux-arm-msm+bounces-65506-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F96B09127
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 17:59:48 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 4D3733A3ADA
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jul 2025 15:59:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AC73301126;
	Thu, 17 Jul 2025 15:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SD7SaGo8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D33C22FBFEF;
	Thu, 17 Jul 2025 15:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752767764; cv=none; b=ZEFqdads025OBIGPKqpyFsIt+cYHMAkhhrLjraGFZdU8uYP3pz7WLH5h/aSxcpKoVQmO8YLLESL4zLBrBczTaTYVmMhsorMS5h1aQ8vLaqCEdQDzWYVYsPYlpQqj9ppcxpGrOS3RymLK1GnL65IQHsLQ4+OuLU8cpyXp5mdlFF8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752767764; c=relaxed/simple;
	bh=58Ch6N/T0uBrOymp1IsEXMy3U3ZkxGE98DTMQIyD4T8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=ggkMjAVvF9KSgajItNymL1taPYTcUFD5JUzvax/6Y0mM1Stgs62pNWe+Sv5nmJd1viPK3qSK8bmrRsILUpTa4S+xrV3oraTSkmk8QEV38f82QuRme2pJItD3x1L+CQgi8+FSaiFQfUlmGgazI3aUKx/iZ8+8QARgGeYwcLmNBsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SD7SaGo8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BBA1C4CEE3;
	Thu, 17 Jul 2025 15:56:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752767764;
	bh=58Ch6N/T0uBrOymp1IsEXMy3U3ZkxGE98DTMQIyD4T8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SD7SaGo8O2c0sORPQT5cu/MHQNPJKY37PCbm3Y74/EWvKbtI3KgvbS9PD/0+rLGX9
	 z6S94LCNg5KEQfn7UT9ZWYh1bb4E9h/SciOhJJYI1smIKM3kEiWloo7lYyXAF1Y8gp
	 weG8ob/Enb8IVKZ5f1RR/C3u+72III4a4eE/fziW+x/Mncujbwd5XPsL995YXyExy8
	 stSUm5ynZTQbtP4+q8ZXkoaXqkDZaChSWeCnerEIgs1FMnJCntklT3Kyics0mq92WY
	 cgBfxLTwykXU/f1Wjt+QjcnT7QfY0ltLWzBaV9Q82bdT/Q6h5DtjVhCRWkhd7sAVTO
	 Cj8jol4NCmLBQ==
Date: Thu, 17 Jul 2025 10:56:03 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 devicetree@vger.kernel.org
To: Yijie Yang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
References: <20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com>
Message-Id: <175276729811.3490972.13375146849378946012.robh@kernel.org>
Subject: Re: [PATCH 0/4] Initial support for Qualcomm Hamoa IOT EVK board


On Wed, 16 Jul 2025 17:08:38 +0800, Yijie Yang wrote:
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
> Yijie Yang (4):
>       dt-bindings: arm: qcom: Document HAMOA-IOT-EVK board
>       firmware: qcom: scm: Allow QSEECOM on HAMOA-IOT-EVK
>       arm64: dts: qcom: Add HAMOA-IOT-SOM platform
>       arm64: dts: qcom: Add base HAMOA-IOT-EVK board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |   9 +-
>  arch/arm64/boot/dts/qcom/Makefile               |   1 +
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts      | 835 ++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa-iot-som.dtsi     | 607 +++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c                |   1 +
>  5 files changed, 1451 insertions(+), 2 deletions(-)
> ---
> base-commit: bf66a1ba8e378d23fde984df2034d909215f5150
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
 Base: using specified base-commit bf66a1ba8e378d23fde984df2034d909215f5150

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250716-hamoa_initial-v1-0-f6f5d0f9a163@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/hamoa-iot-evk.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): Unevaluated properties are not allowed ('wcn_usb_sw_n_state' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#






