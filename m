Return-Path: <linux-arm-msm+bounces-89432-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 73710D3349E
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 16:46:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 039063007CA1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 16 Jan 2026 15:41:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 869FD33986D;
	Fri, 16 Jan 2026 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CIgvdVvV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63CAE224AF7;
	Fri, 16 Jan 2026 15:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578058; cv=none; b=lg9IAcGGlEb3EzoMpXxTkwlltw+WdkKPQ44+/dqNRFt+8AkVFqI8Zg51yHw+aO233ZRMKwmPUWSE0mxccBPod7k36KR0Y2jsg5ghi9IthKlKHK9SLO1T4KeZUkl7dl+VyIdwNCh17B15dV/4i0popcHY7c1REXmOwVGQrCdSFk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578058; c=relaxed/simple;
	bh=WtIs3FcDmyrxk0DOGlKSJzS9A/nULl2iHqMvxL6q5Cg=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=oZARwzCJ13yddk2ktjSXicyvVsFcZY58a7E4E0U5LdHNNfIs8zKjbL3uUlQsiZ5a4Rq98oXFN+MiwKey4R89I1ILbMNaYUDcm07a5GuEsFbGtRBg27akArMk8G04FqGh13EDMdolLfbzx8OxF5TakJqZ/2dFIgcBq3ZJSpt956g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CIgvdVvV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB741C116C6;
	Fri, 16 Jan 2026 15:40:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768578057;
	bh=WtIs3FcDmyrxk0DOGlKSJzS9A/nULl2iHqMvxL6q5Cg=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=CIgvdVvVTIFRO8yQMlIIPqPl5gO4lrzXnpBreoSiYPb+pArFKoFmjVM8TYeL3ppmV
	 zYv+InmeyT3i6As0Q2JDDdN0kD20hykWnNxU/wHphDF7BZZzIKfG2Nb6shSmrEtlfA
	 OirZKs8IsWVdt64DCDReOKrm4CRaFkhap4bLV0QQIPsc5o8d9gMXsvqG2/Xj5rjfdq
	 /lUIW4e0fTC/roCYntzD6a6o8aSjw5MIOJ76Ia6mlVxVm9D4lq5nxqYPrDWyStQAgZ
	 1VvBjYiXZKCICmduPZ3NqATGX0+PAog0BeApCZt4NIG5D8fm97Njz7dCgwqfNI4WPB
	 lo54qrEBTPHCg==
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Jan 2026 09:40:57 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, konradybcio@kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 andersson@kernel.org, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org
To: YijieYang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
References: <20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com>
Message-Id: <176857775469.1631885.16133311938753588148.robh@kernel.org>
Subject: Re: [PATCH v4 0/4] Initial patch set for PURWA-IOT-EVK


On Fri, 16 Jan 2026 18:41:26 +0800, YijieYang wrote:
> From: Yijie Yang <yijie.yang@oss.qualcomm.com>
> 
> Introduce the device tree, DT bindings, and driver updates required to enable
> the bring-up of the PURWA-IOT-EVK evaluation board. Focus is on two key
> hardware components:
> 
> PURWA-IOT-SOM — A compact System-on-Module integrating the SoC, GPIOs, and
> PMICs. Designed for modularity, it can pair with various carrier boards to
> support diverse use cases.
> 
> PURWA-IOT-EVK — A carrier board tailored for IoT scenarios, providing
> essential peripherals such as UART, on-board PMICs, and USB components.
> 
> Together, these components form a flexible and scalable platform. Initial
> functionality is achieved through proper device tree configuration and driver
> support.
> 
> The PURWA-IOT-EVK/SOM shares most of its hardware design with
> HAMOA-IOT-EVK/SOM, differing primarily in the BOM. Consequently, the DTS files
> are largely similar. Both platforms belong to Qualcomm’s IQ-X family. For more
> details on the IQ-X series, see:
> https://www.qualcomm.com/internet-of-things/products/iq-x-series
> 
> Hardware differences between HAMOA-IOT and PURWA-IOT:
> - Display — PURWA uses a different number of clocks and frequency compared to
>   HAMOA.
> - GPU — PURWA integrates a different GPU.
> - USB0 — PURWA uses a PS8833 retimer, while HAMOA employs an FSUSB42 as the
>   SBU switch.
> 
> Features added and enabled:
> - UART
> - On-board regulators
> - Regulators on the SOM
> - PMIC GLINK
> - USB0 through USB6 and their PHYs
> - Embedded USB (eUSB) repeaters
> - USB Type-C mux
> - PCIe3, PCIe4, PCIe5, PCIe6a
> - Reserved memory regions
> - Pinctrl
> - NVMe
> - ADSP, CDSP
> - WLAN, Bluetooth (M.2 interface)
> - USB DisplayPort and eDP
> - Graphics
> - Audio
> - TPM
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
> Changes in v4:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v3: https://lore.kernel.org/r/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com
> 
> Changes in v2:
> - Update the GPU firmware path.
> - Update the description in the cover letter.
> - Reorder the patches.
> - Use separate DTS files for Purwa and Hamoa.
> - Update base commit.
> - Link to v1: https://lore.kernel.org/all/20251222-purwa-v1-0-14ab9316e5ff@oss.qualcomm.com/
> 
> Changes in v3:
> - Delete unused PMIC and thermal nodes.
> - Add WiFi node.
> - Add display backlight node.
> - Add connectors and VBUS regulators for USB3 and USB6.
> - Enable PCIe3 and PCIe5; add PCIe ports along with reset and wake-up GPIOs.
> - Link to v2: https://lore.kernel.org/r/20260109-purwa-v2-0-f39ee10684cb@oss.qualcomm.com
> 
> Changes in v4:
> - Enable TPM.
> - Update the descriptions for video and the USB OF graph.
> - Link to v3: https://lore.kernel.org/all/20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com/
> 
> ---
> Yijie Yang (4):
>       dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
>       firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
>       arm64: dts: qcom: Add PURWA-IOT-SOM platform
>       arm64: dts: qcom: Add base PURWA-IOT-EVK board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1549 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
>  drivers/firmware/qcom/qcom_scm.c                |    1 +
>  5 files changed, 2242 insertions(+)
> ---
> base-commit: 377054868ffa544991cc491ecc4016589fc58565
> change-id: 20251113-purwa-907ec75b4959
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
 Base: 377054868ffa544991cc491ecc4016589fc58565 (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260116-purwa-v4-0-89b2adae9f09@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml






