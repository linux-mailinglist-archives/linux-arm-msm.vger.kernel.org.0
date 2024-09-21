Return-Path: <linux-arm-msm+bounces-32126-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DB70D97DAFA
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 02:25:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CAC091C20D74
	for <lists+linux-arm-msm@lfdr.de>; Sat, 21 Sep 2024 00:25:07 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1258115C3;
	Sat, 21 Sep 2024 00:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FZDJ9VnZ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C0110E6;
	Sat, 21 Sep 2024 00:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726878304; cv=none; b=eAQOhdeI4XDAqxZCGx+Tfi8ztzkwpP8ZsbTsUM4jExR/Tqpn9c3JtLOWeTYF23rmMnD3mdIumQYUbUY3ZorN6kMDmkwrWS3UpoZ9nN1pfcQC9UqMTbeniR2DGEjKzfqiK1V8JHzclrGSy8SrRoCK6NcwVdWEOU3wBtN36ulOyNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726878304; c=relaxed/simple;
	bh=myBcqF/KQGuPoP9RYMYc2B6DAYHbjrD3pZNXUMO3jpw=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ml+PdrxoUNDB+TUKPa4TzLj7d0tUumFAA1oLWtuHJ68vzigXOcjm4+LPVXpMR/xyzIKVu2ilIhueC/lT0SVMLtsfDr/RwmwVy+Bmg1sZ6Vy1IxMfKU1eVz87mPDiBDU6G81J0YYIQiZV0uhiNzZ5Yg+yvTtFSYsZaGCC9UZemFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FZDJ9VnZ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2684AC4CEC3;
	Sat, 21 Sep 2024 00:25:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726878303;
	bh=myBcqF/KQGuPoP9RYMYc2B6DAYHbjrD3pZNXUMO3jpw=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=FZDJ9VnZisFBe1oIcyZ+weuArltlrJaTUECWdhP6bAXFe04J6o6R9KSytJ3okPWFf
	 bEo1Fwy+eItZgDFTShbHZTr8lf9sppNeBCxQVt6kTHMppMpqU3NjTXfOfsYbK4opNX
	 nWbJMLwEbFo+L4T/sRZ/fl2dMYAGK/Fa4xkz6HaXIND0lOBrrQN/efUxPc4zc/cK2E
	 I1xbfrnwzYT7YVtH2/qThCv1Rp5YsDscQ0NdFpsFsZmn5RKPH/yLkiXW9QxQllgrR5
	 ULSY57dB5x/KvNvsGLWAMvlvZmWQbv4x20N+CgV7L+ddDJtaUY9ZLl6XiAD9fCEbD5
	 ZddGdzrlAIfuQ==
Date: Fri, 20 Sep 2024 19:25:02 -0500
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
Cc: Merck Hung <merckhung@gmail.com>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
References: <20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz>
Message-Id: <172687817265.147669.10724647062896729336.robh@kernel.org>
Subject: Re: [PATCH v2 0/2] arm64: dts: qcom: sc8280xp-wdk2023: dt
 definition for WDK2023


On Fri, 20 Sep 2024 19:47:23 +0200, Jens Glathe wrote:
> "Microsoft Windows Dev Kit 2023" aka "Blackrock" aka "Project Volterra"
> 
> Device tree for the Windows Dev Kit 2023. This work
> is based on the initial work of Merck Hung <merckhung@gmail.com>.
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
> It is in use and under development since May 2023, pretty stable now.
> 
> ---
> Changes in v2:
> - removed whitespaces and breaks
> - added compatibility binding
> - added feature list
> - reformatted Signed-off list
> - Link to v1: https://lore.kernel.org/r/5f5487e1-e458-4a3a-af02-c52e50ca1964@oldschoolsolutions.biz
> 
> ---
> Jens Glathe (2):
>       arm64: dts: qcom: sc8280xp-wdk2023: dt definition for WDK2023
>       dt-bindings: arm: qcom: Add Microsoft Windows Dev Kit 2023
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    1 +
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1332 ++++++++++++++++++++
>  3 files changed, 1334 insertions(+)
> ---
> base-commit: 98f7e32f20d28ec452afb208f9cffc08448a2652
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


New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-microsoft-blackrock.dtb' for 20240920-jg-blackrock-for-upstream-v2-0-9bf2f1b2191c@oldschoolsolutions.biz:

arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /: dp1-connector@0: 'anyOf' conditional failed, one must be fixed:
	'reg' is a required property
	'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/root-node.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /firmware/qseecom: failed to match any schema with compatible: ['qcom,qseecom-sc8280xp', 'qcom,qseecom']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: /firmware/qseecom: failed to match any schema with compatible: ['qcom,qseecom-sc8280xp', 'qcom,qseecom']
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: bluetooth: 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: bluetooth: 'vddbtcmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
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






