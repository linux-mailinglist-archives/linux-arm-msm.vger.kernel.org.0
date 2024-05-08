Return-Path: <linux-arm-msm+bounces-19504-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DCD3B8BFFFB
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 16:31:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 946F7289970
	for <lists+linux-arm-msm@lfdr.de>; Wed,  8 May 2024 14:31:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9434D8625D;
	Wed,  8 May 2024 14:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Od71OBwu"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E38F86252;
	Wed,  8 May 2024 14:31:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715178684; cv=none; b=SkWFT3DPOS6V9EecwvDIsr7cc/XaIYt5k0/meLCkguwhAjGO/70NAgFDjOgBGPqpWtFe9NbEJHclrttgx7Ol3qkpaVEc/N5mUvD6u0j6jnLmmfhbbxHcazlV0t22dUCGgGfa/d3NoSQ5rdHH95P5DuzGYrF3+D9OJbF7BTpSju4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715178684; c=relaxed/simple;
	bh=l3f/ws0lAnQFX7fi5zKhN/N7k7akLLW3oktvLHkndTA=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=V5bEV02YnHKSKqr4UuqpvgTcLWpQLW1RS+onpzQFOTDnGDRJfdvmiBZlty5beQps823q78P3brYK8Z9W9kbnFPrQ6wFtAkBvAOrtsQvOUeyJ7s/U8ky44hCUUKrRu43T6YwtD58mERtlJoSx2GwNUF1SXCoyJPgpbRCaNf6ZjqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Od71OBwu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93F7BC113CC;
	Wed,  8 May 2024 14:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715178683;
	bh=l3f/ws0lAnQFX7fi5zKhN/N7k7akLLW3oktvLHkndTA=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=Od71OBwumJMdNg9G4/nMlIGfip/qwysMTJ0zOtNhuVoGw9eUrMijmCVyaZr5jYdzS
	 f13mYZDHGyUcZMrJ+76ZjYLOXuEdelJMp19KdBKJeSkzAYcP5qvvHaLPePxpp8A04H
	 O8zwEgAV7w0aPJgt6La6iYSIe5VTly9/tBqHsl7kSEKH55+GlTsN80VmTedvHPvr3C
	 XMDUbV7pDDTG72nC9nsA44krayZPnJ9m6wk5jnkOiwAZk5fprstlvn37kmtfC4FVM0
	 2VExf9DnkPzWJa4cxmpjyx8wVF5eJiQysFZCDtLFbh0zk/hzJHFIv1tWIwfz+dA9Nb
	 jnWTT++0NOZXQ==
Date: Wed, 08 May 2024 09:31:21 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Caleb Connolly <caleb.connolly@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Alexander Martinz <amartinz@shiftphones.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Luca Weiss <luca.weiss@fairphone.com>, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org>
References: <20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org>
Message-Id: <171517823322.1752992.3673180497140928107.robh@kernel.org>
Subject: Re: [PATCH 0/2] qcom: initial support for the SHIFTphone 8


On Wed, 08 May 2024 01:28:46 +0200, Caleb Connolly wrote:
> The SHIFTphone 8 is an upcoming QCM6490 smartphone, it has the following
> features:
> 
> * 12GB of RAM, 512GB UFS storage
> * 1080p display.
> * Hardware kill switches for cameras and microphones
> * UART access via type-c SBU pins (enabled by an internal switch)
> 
> Initial support includes:
> 
> * Framebuffer display
> * UFS and sdcard storage
> * Battery monitoring and USB role switching via pmic glink
> * Bluetooth
> * Thermals
> 
> Wifi is not yet functional due to a crash in the remoteproc
> firmware.
> 
> The serial port on the device can be accessed via the usb-cereal
> adapter, it must first be enabled by flipping the switch under the
> display. Additional info can be found on the postmarketOS wiki page.
> 
> https://wiki.postmarketos.org/wiki/SHIFT_SHIFTphone_8_(shift-otter)
> 
> ---
> Caleb Connolly (2):
>       dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
>       arm64: dts: qcom: add QCM6490 SHIFTphone 8
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 938 +++++++++++++++++++++++
>  3 files changed, 940 insertions(+)
> ---
> change-id: 20240507-otter-bringup-388cf3aa7ca5
> base-commit: dccb07f2914cdab2ac3a5b6c98406f765acab803
> 
> // Caleb (they/them)
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


New warnings running 'make CHECK_DTBS=y qcom/qcm6490-shift-otter.dtb' for 20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org:

arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c08000: interrupts: [[0, 307, 4], [0, 308, 4], [0, 309, 4], [0, 312, 4], [0, 313, 4], [0, 314, 4], [0, 374, 4], [0, 375, 4]] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c08000: interrupt-names:0: 'msi' was expected
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: pcie@1c08000: interrupt-names: ['msi0', 'msi1', 'msi2', 'msi3', 'msi4', 'msi5', 'msi6', 'msi7'] is too long
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc7280.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: phy@88e3000: 'orientation-switch' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: usb@8cf8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: video-codec@aa00000: iommus: [[65, 8576, 32]] is too short
	from schema $id: http://devicetree.org/schemas/media/qcom,sc7280-venus.yaml#






