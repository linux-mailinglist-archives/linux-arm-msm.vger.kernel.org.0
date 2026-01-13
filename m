Return-Path: <linux-arm-msm+bounces-88801-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [172.232.135.74])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AEBD199F4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 15:52:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 436673009D42
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jan 2026 14:52:06 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CDD932D4805;
	Tue, 13 Jan 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JrI5yQ3Q"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB1D42D3A93;
	Tue, 13 Jan 2026 14:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768315923; cv=none; b=Eq9cdaNRnf3l6ng7EtM3tro/s6vZVJ00iEFAvJcF8DCg5RqrzmdNEdn6B4JyH1Gis29MnXEOKCJXzqybZTSc9ts0U9h/gWPtsO1elJmnStjpFQZRmfKKhbWf8E1FhijIXARswBkY88xJoO12Ml17uGLsxrIrGnChucpsTxMb5Mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768315923; c=relaxed/simple;
	bh=kvlId5NM0l4ViurO0jCBcc4yqePaw9YJyCkPq/XY+Xc=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=dNS3TyPJz1pLsKnb/vvLrhFIYeQIAWBlyNK1wwl3hjDapsbygq+tneH7537DYl8gvx5Yq0wTKhytqJtwVt3ZmyZBGY1TsSwyjk+rmV51jKehRht8KlfYTHt0aRuRqFH5ARd+SS91vtgbf5aqrVVdEGdJxzrt//4AhEdC+9c9jME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JrI5yQ3Q; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35FC3C116C6;
	Tue, 13 Jan 2026 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768315923;
	bh=kvlId5NM0l4ViurO0jCBcc4yqePaw9YJyCkPq/XY+Xc=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=JrI5yQ3QG9o3JYptN5Kjy5lEHPiy711F+UVKiWRfw6NMygOJ3tFP9gmdAKtFWWjk8
	 EJIzGDR4CK21WZmnz40XfaKvchmxGA5ixjVeg25ryvKXaMeLSOwPsJHY2kPzENpBpX
	 m25+2f5lHhlKkxotPK0TosLWwI1i9oLzSTtMhkZ08n248CZLgLwdKSm42D4l99UH4v
	 mZj6MFSH4rsuOkWZhAZEDPxdF4Aqx+KXP2/IShdM+W3G9Wm01I/S+EAi6jVapR7Yif
	 iiZsmwtxSW6aWVoi27phAV9sHVdXycS2MaqbAwCWvnAFd8MBmHrUY2iQM5H+BdMNNw
	 bohblJPb6C72A==
From: Rob Herring <robh@kernel.org>
Date: Tue, 13 Jan 2026 08:52:02 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 krzk+dt@kernel.org, linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 konradybcio@kernel.org, conor+dt@kernel.org, andersson@kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: YijieYang <yijie.yang@oss.qualcomm.com>
In-Reply-To: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
References: <20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com>
Message-Id: <176831569115.3744422.15173874983797485239.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] Initial patch set for PURWA-IOT-EVK


On Tue, 13 Jan 2026 18:28:12 +0800, YijieYang wrote:
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
> 
> Signed-off-by: Yijie Yang <yijie.yang@oss.qualcomm.com>
> ---
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
> ---
> Yijie Yang (4):
>       dt-bindings: arm: qcom: Document PURWA-IOT-EVK board
>       firmware: qcom: scm: Allow QSEECOM on PURWA-IOT-EVK
>       arm64: dts: qcom: Add PURWA-IOT-SOM platform
>       arm64: dts: qcom: Add base PURWA-IOT-EVK board
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |    6 +
>  arch/arm64/boot/dts/qcom/Makefile               |    1 +
>  arch/arm64/boot/dts/qcom/purwa-iot-evk.dts      | 1539 +++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/purwa-iot-som.dtsi     |  685 ++++++++++
>  drivers/firmware/qcom/qcom_scm.c                |    1 +
>  5 files changed, 2232 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260113-purwa-v3-0-16eefacbdce9@oss.qualcomm.com:

arch/arm64/boot/dts/qcom/purwa-iot-evk.dtb: phy@1bd4000 (qcom,x1p42100-qmp-gen4x4-pcie-phy): 'qcom,4ln-config-sel' is a required property
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml






