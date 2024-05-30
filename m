Return-Path: <linux-arm-msm+bounces-21101-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 34ED88D4BD9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 14:45:54 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 817681F22CE9
	for <lists+linux-arm-msm@lfdr.de>; Thu, 30 May 2024 12:45:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 899A61E521;
	Thu, 30 May 2024 12:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FOApEJQs"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8181E492;
	Thu, 30 May 2024 12:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717073146; cv=none; b=BAZOPFgcrXq1oEHpb0lh9cDSl3WDZZietdqnPHj9IU3MDhImcsEmzZgdVoNY4LbmOvirA2gASjwB7oJCUFLQ1S825uMU5vGmc+wQumKHuIvN9uH7PMj/UIusU7p+X7IbZI7BFtbzN+1R3EnRSwmSeOtoBiLGNRuLtUh2Vg1b87M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717073146; c=relaxed/simple;
	bh=xoXwZ15smUADprLqqulMhMKFFHjrjeZ9K2+p6YC1+Rg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=bS0caGtfyTyMyAQvSdNFp0WSCAV/hNIIxeYN7/c6IhWBIhTtEf9+qttx7Xc8uurNRgFBQ+CiA2nnO6fsp5cZiyeifNEcPn8PGg48BZDSaPwBlF4WHdziXj5g5aNbVYZNgHcGx3/2z72ic15gtPhrg65EG4o9IMHaRKct83tbkcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FOApEJQs; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9828AC2BBFC;
	Thu, 30 May 2024 12:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717073145;
	bh=xoXwZ15smUADprLqqulMhMKFFHjrjeZ9K2+p6YC1+Rg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FOApEJQs2hHMKxXHGrdoiYlgsX6GLgB4214MgH+NPEpdd0GtjCjSlalQkK+0mGdMj
	 RNVMfU3fs3+gI2QAn2cAD8+JrVAEjDBqm2L03X9dJcwUX6Kb1CO4rG3fPduOP7w/SR
	 iidY/r1I1FYZv63t2JCd5MdpfU4XYgodNAsSsSHs3XgwhJmsQyWKlGDEIm9+r1WPwO
	 uIpC878tWZM4076plTEeaRUdSEafv1GDJlvX1M24f8H5+SHkSpnVAuCkzW4DaEvslk
	 Cmo7wPzpJbAR/gugFqGc2WQevrZxwZ2I1yQUQ22gaEGH0EMtsNZpID+pjj9XSd+wJH
	 UE3dlObiaKmWA==
Date: Thu, 30 May 2024 07:45:44 -0500
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
Cc: devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Luca Weiss <luca.weiss@fairphone.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, Caleb Connolly <caleb@postmarketos.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexander Martinz <amartinz@shiftphones.com>, linux-arm-msm@vger.kernel.org
In-Reply-To: <20240530-otter-bringup-v3-0-79e7a28c1b08@linaro.org>
References: <20240530-otter-bringup-v3-0-79e7a28c1b08@linaro.org>
Message-Id: <171707307103.1811716.12806393621772090873.robh@kernel.org>
Subject: Re: [PATCH v3 0/2] qcom: initial support for the SHIFTphone 8


On Thu, 30 May 2024 01:39:15 +0200, Caleb Connolly wrote:
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
> Wifi works but requires some commits to be reverted to prevent a
> firmware crash.
> 
> The serial port on the device can be accessed via the usb-cereal
> adapter, it must first be enabled by flipping the switch under the
> display. Additional info can be found on the postmarketOS wiki page.
> 
> https://wiki.postmarketos.org/wiki/SHIFT_SHIFTphone_8_(shift-otter)
> 
> ---
> Changes in v3:
> - Enable wifi
> - Fix protected-clocks indentation in gcc
> - Link to v2: https://lore.kernel.org/r/20240520-otter-bringup-v2-0-d717d1dab6b8@linaro.org
> 
> Changes in v2:
> - Fix authorship
> - Address Luca's feedback
> - Link to v1: https://lore.kernel.org/r/20240508-otter-bringup-v1-0-c807d3d931f6@linaro.org
> 
> ---
> Caleb Connolly (2):
>       dt-bindings: arm: qcom: Add QCM6490 SHIFTphone 8
>       arm64: dts: qcom: add QCM6490 SHIFTphone 8
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml  |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                |   1 +
>  arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dts | 926 +++++++++++++++++++++++
>  3 files changed, 928 insertions(+)
> ---
> change-id: 20240507-otter-bringup-388cf3aa7ca5
> base-commit: 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0
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


New warnings running 'make CHECK_DTBS=y qcom/qcm6490-shift-otter.dtb' for 20240530-otter-bringup-v3-0-79e7a28c1b08@linaro.org:

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






