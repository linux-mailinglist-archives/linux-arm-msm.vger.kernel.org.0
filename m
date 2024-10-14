Return-Path: <linux-arm-msm+bounces-34346-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id BF58799CC31
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 16:05:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 25BC8B20EBA
	for <lists+linux-arm-msm@lfdr.de>; Mon, 14 Oct 2024 14:05:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F1D481AB538;
	Mon, 14 Oct 2024 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uILUJIA8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C85491AB530;
	Mon, 14 Oct 2024 14:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728914728; cv=none; b=dPc7owiPWZXS4EY1Ly0ZhOJOLZjU8e+9LjuYf7ZOf9g53wLxFsPIbvt/d1zC6QcavWptCF8cRKcP8Gloev5mt9L2y8G8g0dnv0dAcK4YfowSgQber+YeBDgWJMeYzBV+NRrmQJYblvTxfy/vZa8+BkZk8iGpItpbXtkVxX7MwPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728914728; c=relaxed/simple;
	bh=U9yr8Pjh7+zdDin22W1g4KIEH+hpah5+WgErTQWQbV8=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=o20GzbQ7Ul+Ur7371M6pUdWX1X85uWf7SVjbMvn3J8A6mdsVQOwGr4CPfqvVnIfeGxoJo0qAWqUkNTQs5C+CvsA0l1nHQ+fsipmVurk+Epqzo3sJJpl9vjuqM84q5txSvQQzjDuuIviDvTu3gEg166evugK/t2Mh2BNgKZ3j6QQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uILUJIA8; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C3C7C4CEC3;
	Mon, 14 Oct 2024 14:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728914728;
	bh=U9yr8Pjh7+zdDin22W1g4KIEH+hpah5+WgErTQWQbV8=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=uILUJIA84SZCyP3FBaV9BAplX1AmMs93g/la8JRMzGU0iM+Se2/kgKxmwD0+TbFE/
	 lHdhspk+wxoZh3Ap3DlJktkl3FhASopPVegWcG6k4aPdy9d/0yLmn1HRip+pqacM3w
	 ryxREmLsKveGW6JszIxAtRjp7qndYaa1lsP9h3KJFa3xSNrkCh+0+TfdO/hp9XmZsk
	 3kpWGROqXRYxvYvMOnYKy/SxJKPX0eheIVxdI1ez+KpbyvB8lIWeCv7i+y62hmVzl/
	 swMmYt664SBal4hXUSSHEmSUlgz3h/siOGPDckShVZxc4eyk12ZZI9dH9cDFn76RjW
	 uNJTaQSN8qzRA==
Date: Mon, 14 Oct 2024 09:05:27 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Cc: linux-kernel@vger.kernel.org, Merck Hung <merckhung@gmail.com>, 
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
References: <20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz>
Message-Id: <172891445148.1127256.11191328895998063274.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for Windows Dev Kit 2023


On Sun, 13 Oct 2024 13:54:02 +0200, Jens Glathe wrote:
> "Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"
> 
> Device tree for the Microsoft Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
> 
> The Windows Dev Kit 2023 is a nice little desktop based on sc8280xp.
> Link: https://learn.microsoft.com/en-us/windows/arm/dev-kit/
> 
> Supported features:
> - USB type-c and type-a ports
> - minidp connector
> - built-in r8152 Ethernet adapter
> - PCIe devices
> - nvme
> - ath11k WiFi (WCN6855)
> - WCN6855 Bluetooth
> - A690 GPU
> - Venus codec
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Merck Hung <merckhung@gmail.com>
> 
> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
> 
> This dt is more or less deducted from the Thinkpad X13s.
> It contains a lot of guesswork, and also a lot of research on
> what works with the Windows Dev Kit.
> 
> The WiFi definition references qcom,ath11k-calibration-variant = "volterra"
> which is unfortunately not yet in the linux-firmware. You can leave it out,
> and the ath11k driver finds the default one for
> "bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2|18,qmi-board-id=255"
> which is quite sub-optimal. I have placed a pr on github/qca-swiss-army-knife:
> https://github.com/qca/qca-swiss-army-knife/pull/9 that provides an amended
> board-2.bin and a board-2.json to generate it.
> 
> pcie2 (nvme) is intentionally specified as max-link-speed = <16>. The
> interface is capable of it, most current nvme ssds are capable of it,
> but the physical slot isn't. This leads to a silent downgrade to <8> instead
> of the "device is limited by bus, capable of..." message.
> 
> It is in use and under development since May 2023, pretty stable now.
> 
> ---
> Changes in v3:
> - tried to heed all advice and comments given - thank you
> - re-ordered patches to definition before use
> - added "microsoft,blackrock" as compatible in QSEECOM driver
> - removed the qseecom node
> - ordered nodes alphabetically {address, node name, label}
> - amended indentation
> - consistently used blackrock as identifier / directory name
> - sorted identifiers by the same order for multiple instances
> - added some explanation re WiFi
> - added definition for PMU on the WCN6855
> - added some explanation for pcie2 max-link-speed
> - Link to v2: https://lore.kernel.org/r/20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz
> 
> Changes in v2:
> - removed whitespaces and breaks
> - added compatibility binding
> - added feature list
> - reformatted Signed-off list
> - Link to v1: https://lore.kernel.org/r/5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz
> 
> ---
> Jens Glathe (3):
>       dt-bindings: arm: qcom: Add Microsoft Windows Dev Kit 2023
>       firmware: qcom: scm: Allow QSEECOM for Windows Dev Kit 2023
>       arm64: dts: qcom: sc8280xp-blackrock: dt definition for WDK2023
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1397 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c                   |    1 +
>  4 files changed, 1400 insertions(+)
> ---
> base-commit: d61a00525464bfc5fe92c6ad713350988e492b88
> change-id: 20240920-jg-blackrock-for-upstream-7c7aca20e832
> 
> Best regards,
> --
> Jens Glathe <jens.glathe@oldschoolsolutions.biz>
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


New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-microsoft-blackrock.dtb' for 20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz:

arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: pcie@1c00000: Unevaluated properties are not allowed ('pcie-vdda-supply', 'vdda-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8280xp.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@1c06000: 'phy-supply', 'pll-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: pcie@1c20000: max-link-speed: 16 is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8280xp.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: pcie@1c20000: Unevaluated properties are not allowed ('#address-cells', '#interrupt-cells', '#size-cells', 'aspm-no-l0s', 'bus-range', 'device_type', 'dma-coherent', 'interconnect-names', 'interconnects', 'interrupt-map', 'interrupt-map-mask', 'linux,pci-domain', 'max-link-speed', 'msi-map', 'num-lanes', 'pcie-vdda-supply', 'pcie@0', 'perst-gpios', 'phy-names', 'phys', 'power-domains', 'ranges', 'required-opps', 'vdda-supply', 'vddpe-3v3-supply', 'wake-gpios' were unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-sc8280xp.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: pcie@1c20000: max-link-speed: 16 is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pci/pci-bus-common.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@1c24000: 'phy-supply', 'pll-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@88e5000: 'phy-supply', 'vdda-phy-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@88e7000: 'phy-supply', 'vdda-phy-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@88e8000: 'phy-supply', 'vdda-phy-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@88e9000: 'phy-supply', 'vdda-phy-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@88ea000: 'phy-supply', 'vdda-phy-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@88ef000: 'phy-supply', 'pll-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@88f1000: 'phy-supply', 'pll-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@88eb000: 'phy-supply', 'pll-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@8902000: 'phy-supply', 'vdda-phy-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,usb-snps-femto-v2.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@8903000: 'phy-supply', 'pll-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a4f8800: usb@a400000:phy-names: 'oneOf' conditional failed, one must be fixed:
	'usb2-port0' is not one of ['usb2-phy', 'usb3-phy']
	'usb2-port0' does not match '^usb(2-([0-9]|1[0-4])|3-[0-3])$'
	'usb3-port0' is not one of ['usb2-phy', 'usb3-phy']
	'usb3-port0' does not match '^usb(2-([0-9]|1[0-4])|3-[0-3])$'
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: usb@a400000: phy-names: 'oneOf' conditional failed, one must be fixed:
	'usb2-port0' is not one of ['usb2-phy', 'usb3-phy']
	'usb2-port0' does not match '^usb(2-([0-9]|1[0-4])|3-[0-3])$'
	'usb3-port0' is not one of ['usb2-phy', 'usb3-phy']
	'usb3-port0' does not match '^usb(2-([0-9]|1[0-4])|3-[0-3])$'
	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: phy@aec2a00: 'phy-supply', 'pll-supply' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml#






