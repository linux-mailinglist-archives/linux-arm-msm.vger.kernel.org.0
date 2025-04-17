Return-Path: <linux-arm-msm+bounces-54637-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 8868DA91C57
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 14:34:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFF2119E6069
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Apr 2025 12:34:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A407C238C07;
	Thu, 17 Apr 2025 12:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SM0nEeY7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73D6A1C27;
	Thu, 17 Apr 2025 12:33:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744893216; cv=none; b=Aqpsl7m1AAzO2slYLwWbLPj2ip0mpFH2awY75hwWv4Lvt3KgN2H8GnNUlMh69b5n9R+Kfv3Qztj08uhRxiwAjuVePCOpNCToJcJxNW40UE/LaZ6wfNucUUl0oRnY40VbqrXRgORjdIEJuzT+DlQVlfmXxelLUbcjFrXHP5QHe60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744893216; c=relaxed/simple;
	bh=FDErxuFL1wK6kbPUAEjtU+rfiDMxx23rRpdS+uMtd/w=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=YSLL6sloqkwM53hGV8G2VCtpKj/SZJmiQuQJrBrBX8i3MnShBdGC4lXK24sfWfXsh6e7h6FfJseIgr7j9TzOKrNF8SMrjz6GI1J/o8Qqm/pKtEWw882rBn3IhSSQ7/wDv7oKivNnWVRd0cnJdykiX9S5eRLTBxSBPDH2Tgjuv4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SM0nEeY7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA465C4CEE4;
	Thu, 17 Apr 2025 12:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744893214;
	bh=FDErxuFL1wK6kbPUAEjtU+rfiDMxx23rRpdS+uMtd/w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SM0nEeY7jvsOvq/cHvFBCTnXMjgpLsUEv0R7oN3PuA2Ciojm8VCh8NdVId+ddg7ep
	 qN1zatvbev/E/8h43ut2tuWPL4d/5h4VABXPVF5RIlJ5wwyccV3dGrkQh0xrPp9BgQ
	 t4urY7eXJpYxwovCAkFYix+S05yaZ7fta7IU73o2p1IBTSTb1FoJcV6JK9WZhzwdwE
	 u8rgJNkw/bwOW6wNoAqJTzOgb9IhTkevdSLgZe70eAyOZK7dNIKV8fSNMXnxU9yF2t
	 YGUxBaLL5Da8I9XMuiMPA1AE+zJfwkStduak8uM3/Ki9NObMcYKGSppkp6Rk6Ed3tD
	 8LuzLSgdzFX5A==
Date: Thu, 17 Apr 2025 07:33:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, maud_spierings@hotmail.com, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com, 
 linux-usb@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250416232345.5240-1-alex.vinarskis@gmail.com>
References: <20250416232345.5240-1-alex.vinarskis@gmail.com>
Message-Id: <174489319505.1442449.5614787992702738392.robh@kernel.org>
Subject: Re: [PATCH v3 0/4] X1E Asus Zenbook A14 support


On Thu, 17 Apr 2025 01:20:47 +0200, Aleksandrs Vinarskis wrote:
> Introduce support for the mentioned laptop.
> 
> Particular device exists in two model numbers:
> * UX3407QA: X1P-42-100 or X1-26-100 (as tested)
> * UX3407RA: X1E-78-100
> 
> Mostly similar to other X1-based laptops. Notable differences are:
> * Wifi/Bluetooth combo being Qualcomm FastConnect 6900 on UX3407QA
>   and Qualcomm FastConnect 7800 on UX3407RA
> * USB Type-C retimers are Parade PS8833, appear to behave identical
>   to Parade PS8830
> * gpio90 is TZ protected
> 
> When comparing device firmware between UX3407QA, UX3407RA, it seems
> that only ADSP firmware is different, CDSP and GPU firmware appears to
> be the same. (At least assuming the GPU firmware name in both cases is
> `qcdxkmsuc8380.mbn`). Since at least some blobs are different betweeen
> X1E and X1/X1P, define new firmware directory for `qcom/x1p42100`. This
> also makes it easier for distros to automatically extract firmware from
> Windows and place all blobs for the model under the same path. If/When
> firmware blobs make it to linux-firmware, same blobs can be easily
> symlinked between `qcom/x1e80100` and `qcom/x1p42100`.
> 
> NVMe SSD depends on [1]. USB Type-A over USB MP controller  depends on
> [2], or equivalent proposed solution.
> 
> Qualcomm FastConnect 6900 on UX3407QA did not work out of the box, and
> additionally required both newer firmware and patches to `board-2.bin`.
> I added a short how-to [3], as it is not exactly trivial.
> 
> ACPI dumps can be found on aarch64-laptops' github [4]. HWids on
> dtbloader's github [5].
> 
> [1] https://lore.kernel.org/linux-arm-msm/20250319094544.3980357-1-quic_wenbyao@quicinc.com/
> [2] https://lore.kernel.org/all/20250318-xps13-fingerprint-v1-1-fbb02d5a34a7@oss.qualcomm.com/
> [3] https://github.com/alexVinarskis/linux-x1e80100-zenbook-a14?tab=readme-ov-file#wcn688x-wifi
> [4] https://github.com/aarch64-laptops/build/pull/134/files
> [5] https://github.com/TravMurav/dtbloader/pull/4/files
> 
> Changes to v1:
> * Fix/re-add PS8833 as fallback
> * Add EC's i2c address
> * Add pwrseq for wcn6855, placeholder for wcn7850 until its tested
> * Rename x1-zenbook.dtsi to x1-asus-zenbook.dtsi
> Link to v2: https://lore.kernel.org/all/20250402084646.10098-1-alex.vinarskis@gmail.com/
> 
> Changes to v1:
> * Drop PS8833 variant, fallback to PS8830 as they behave the same
> * Drop wrong pcie6a_phy compatible revert
> * Drop redundant comments, fix order of properties in the device-tree
> * Fix device name bindings, express in model names instead of the soc
> * Fix GPU firmware name for UX3407QA
> * Fix model string, enclose variant in parenthesis
> * Added missing new lines before 'status = "okay";'
> * Updated cover letter to reflect some of the above changes
> * Left SPI10 disabled as it is unknown how/what for to use it as of now
> Link to v1: https://lore.kernel.org/all/20250331215720.19692-1-alex.vinarskis@gmail.com/
> 
> Aleksandrs Vinarskis (4):
>   dt-bindings: usb: Add Parade PS8833 Type-C retimer variant
>   dt-bindings: arm: qcom: Add Asus Zenbook A14
>   firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
>   arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
> 
>  .../devicetree/bindings/arm/qcom.yaml         |    2 +
>  .../bindings/usb/parade,ps8830.yaml           |    7 +-
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  .../boot/dts/qcom/x1-asus-zenbook-a14.dtsi    | 1307 +++++++++++++++++
>  .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   44 +
>  .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |  137 ++
>  drivers/firmware/qcom/qcom_scm.c              |    2 +
>  7 files changed, 1499 insertions(+), 2 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-asus-zenbook-a14.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dts
> 
> --
> 2.45.2
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
 Base: attempting to guess base-commit...
 Base: tags/next-20250416 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250416232345.5240-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth (qcom,wcn7850-bt): 'vddrfacmn-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth (qcom,wcn7850-bt): 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth (qcom,wcn7850-bt): 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth (qcom,wcn7850-bt): 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth (qcom,wcn7850-bt): 'vddrfa0p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth (qcom,wcn7850-bt): 'vddrfa1p2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth (qcom,wcn7850-bt): 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#






