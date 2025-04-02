Return-Path: <linux-arm-msm+bounces-53043-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C71CA7905C
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 15:54:17 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id BC4243B7E18
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Apr 2025 13:49:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2AA5A23BCEE;
	Wed,  2 Apr 2025 13:49:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OnVPKf7H"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29AE1EF38D;
	Wed,  2 Apr 2025 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743601755; cv=none; b=M9LQJPdYkEWkmCl5duGmQG4UlIeFqoJDvHBVwuzT23Ih/SluNejW9K68qeJ6DAtC9opaK0ccCwuEYGhTAdY+45uPyDsa2KhNhqSzh9sQ7P1UMb4M1mUcEqkFBF+2BzN3gQf/qrpq8aldvtC8+ciTYk5ToD71aTU24p7FVn0MYK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743601755; c=relaxed/simple;
	bh=oFf412cXfutRgSqUrPxli9S1At7qotc4OCtaaSVbMx0=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=HDSL7Gm4ec99fisoUwZItSrYQgf1dAI/M8aFd15TgQxebcxm+pkLtDPrmL0p+s+GP0hVpHaYXrE7za2F8tU4fCZMbLH01qL7GBAkE+Xhohk1RMwyLVuewJwjJhrQG02rNYHf20v6A+H850YwxqGv7AmGPW9at3xi7gmcMIpjwm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OnVPKf7H; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A0EAC4CEDD;
	Wed,  2 Apr 2025 13:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743601754;
	bh=oFf412cXfutRgSqUrPxli9S1At7qotc4OCtaaSVbMx0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=OnVPKf7Hf27t39Fk86fdhNvv2xsitnH01gic5nravAkyQCE1LyW01hiL2NTvzTlW5
	 MI3s1G0pcHByRfp+4R1v6wdcX4cyXoia6wJ/uEeraShkuasUPpuodm+C3ykkcFam/9
	 BbiWr+tDRx5d3GtH2nFaKJ7LPQUEuh1K0B8m3p9NRskT88tz74cQZ1PREtWkhzLMJd
	 65hfrZoKVxR3WVEhka9ljpmWnBrDbN6YG0BKboziI9pGTaW1PcLfFlPSdg4QUbhRHk
	 LLfoTH9gpPp36Z4qjmvXSHtXR4zBn6UwVEvRW24o2QQKe+4DoQq+S3M1/iSnMMefyg
	 KhUQf2d/YbARQ==
Date: Wed, 02 Apr 2025 08:49:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, Dmitry Baryshkov <lumag@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 maud_spierings@hotmail.com, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, dmitry.baryshkov@oss.qualcomm.com, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250402084646.10098-1-alex.vinarskis@gmail.com>
References: <20250402084646.10098-1-alex.vinarskis@gmail.com>
Message-Id: <174360168717.154053.3856433383315659237.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] X1E Asus Zenbook A14 support


On Wed, 02 Apr 2025 10:44:01 +0200, Aleksandrs Vinarskis wrote:
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
> Aleksandrs Vinarskis (3):
>   dt-bindings: arm: qcom: Add Asus Zenbook A14
>   firmware: qcom: scm: Allow QSEECOM on Asus Zenbook A14
>   arm64: dts: qcom: Add support for X1-based Asus Zenbook A14
> 
>  .../devicetree/bindings/arm/qcom.yaml         |    2 +
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  arch/arm64/boot/dts/qcom/x1-zenbook-a14.dtsi  | 1258 +++++++++++++++++
>  .../dts/qcom/x1e80100-asus-zenbook-a14.dts    |   45 +
>  .../dts/qcom/x1p42100-asus-zenbook-a14.dts    |   48 +
>  drivers/firmware/qcom/qcom_scm.c              |    2 +
>  6 files changed, 1357 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/x1-zenbook-a14.dtsi
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
 Base: tags/next-20250401 (exact match)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250402084646.10098-1-alex.vinarskis@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddrfacmn-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa0p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa1p2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-zenbook-a14.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddrfacmn-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddaon-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddbtcmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa0p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa1p2-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/x1p42100-asus-zenbook-a14.dtb: pinctrl@f100000: Unevaluated properties are not allowed ('bt-en-sleep' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#






