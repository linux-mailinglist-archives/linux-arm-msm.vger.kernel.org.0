Return-Path: <linux-arm-msm+bounces-36472-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A3839B6A96
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 18:15:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CE106282BEF
	for <lists+linux-arm-msm@lfdr.de>; Wed, 30 Oct 2024 17:15:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B286822ADE9;
	Wed, 30 Oct 2024 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DiAdPcLy"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877C322ADE4;
	Wed, 30 Oct 2024 17:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730307890; cv=none; b=Kb0oTXnP6L12aqNfZX80ZSJpx4yrBu+/K5uRFGB1hlBF450RPV2Ly/hnvA8LbyYMEXSvUIdam7SrBobV+EKhTQSrN+Jgntnb+pLRHqgoAIAB/YRec2McZJ8zWDsQm7BdZSoHthtOD4le0XQxwhXQ68osxO5/H99ByzGpE3vA0n4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730307890; c=relaxed/simple;
	bh=hlQJtBZeGNfc14au6EbGe4mUML0LVwnAGHKUANIlHi4=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=eZsHWoO944TZBq7IkeqtZ2lQ2LJfMk1PGoIczaXmze+y8gBKQ0ptdk6vPr4Te/S8zHDktoKnbEOMzsubV4LwgkXq6N3huWAz8rxnbGM1CrkpX+dXXaUGHmZR0nMchymGnb3ddtGeJLtcXL9zb6P7FyY1FTVQgxmSzPg7Z2APr/0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DiAdPcLy; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9074C4CECE;
	Wed, 30 Oct 2024 17:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730307890;
	bh=hlQJtBZeGNfc14au6EbGe4mUML0LVwnAGHKUANIlHi4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=DiAdPcLyAbKFeZufen6GaZyl103DpyD2ASWZMOFfR0BOMv2e+u+86ljSpfZvVZTKW
	 Ll7FWhFG+DKwuos2eSFUKnUug1XEpN6kFZC8vYs5pGryZmpGs8sYYYvk0c4NRJfm8S
	 NC0dcIVfsLhsfZpTtOKDTvbvNTp0V+6sA7MFi3wTkzdgyciEHSWcOW5sbd8fmr3xdd
	 kIuhCc5DUHIgB4NyeeKZnJSXkWldWBeFoGg8Y7KrMbPs6ohHRYfCzSPEKNRqyjDZtZ
	 bXNw1SLDzioWcXdzydSr8c1OO3lV09jd2ONLgm4q96y8/efk28zhaptGXrU5xFsWgx
	 3wG/sCFuRw3MA==
Date: Wed, 30 Oct 2024 12:04:48 -0500
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
Cc: Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Merck Hung <merckhung@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Kalle Valo <kvalo@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
References: <20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz>
Message-Id: <173030775190.1269155.1213030473924284384.robh@kernel.org>
Subject: Re: [PATCH v6 0/3] arm64: dts: qcom: sc8280xp-blackrock: dt
 definition for Windows Dev Kit 2023


On Wed, 30 Oct 2024 12:02:00 +0100, Jens Glathe wrote:
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
> - ADSP and CDSP
> - GPIO keys
> - Audio definition (works via USB)
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> Original work: https://github.com/merckhung/linux_ms_dev_kit/blob/ms-dev-kit-2023-v6.3.0/arch/arm64/boot/dts/qcom/sc8280xp-microsoft-dev-kit-2023.dts
> 
> This dt is more or less deducted from the Thinkpad X13s.
> It contains a lot of guesswork, and also a lot of research on
> what works with the Windows Dev Kit.
> 
> The WiFi definition references qcom,ath11k-calibration-variant = "MS_Volterra"
> which is unfortunately not yet in the linux-firmware. The ath11k driver finds
> the default one for
> "bus=pci,vendor=17cb,device=1103,subsystem-vendor=17cb,subsystem-device=0108,qmi-chip-id=2|18,qmi-board-id=255"
> when the entry with the variant is not found which is quite sub-optimal. I
> have placed a pr on github/qca-swiss-army-knife:
> https://github.com/qca/qca-swiss-army-knife/pull/9 that provides an amended
> board-2.bin and a board-2.json to generate it.
> 
> pcie2 (nvme) is intentionally specified as max-link-speed = <4>. The
> interface is capable of it, most current nvme ssds are capable of it,
> but the physical slot isn't. This leads to a silent downgrade to <3> instead
> of the "device is limited by bus, capable of..." message.
> 
> It is in use and under development since May 2023, pretty stable now.
> 
> ---
> Changes in v6:
> - added missing acked-by tag from Krzysztof
> - removed aspm-no-l0s from the PCIe ports as suggested by Johan
> - corrected max-link-speed to <4> on PCIe2 as suggested by Johan
> - changed WLAN variant description to "MS_Volterra", added Kalle Valo
>   for approval / guidance
> - trimmed the supply statements on hsphy and other pcie ports for what
>   is known and defined on the Thinkpad X13s
> - Link to v5: https://lore.kernel.org/r/20241030-jg-blackrock-for-upstream-v5-0-830c938437ad@oldschoolsolutions.biz
> 
> Changes in v5:
> - removed s-o-b from Merck Hung as suggested by Bjorn Andersson. The credits
>   for the original work are in the cover letter and in the dts commit
> - removed Venus codec from the list of supported features. It is, but that
>   part is not in this patch set.
> - Link to v4: https://lore.kernel.org/r/20241027-jg-blackrock-for-upstream-v4-0-703b254fc95f@oldschoolsolutions.biz
> 
> Changes in v4:
> - removed the redundant regulator definitions
> - changed the pinctrl property order
> - use microsoft instead of MICROSOFT as subdirectory and device name component
> - amend spacing in audio nodes
> - change external connector dp1 for mini-dp to DP-3 for consistency
> - Link to v3: https://lore.kernel.org/r/20241013-jg-blackrock-for-upstream-v3-0-839d3483a8e7@oldschoolsolutions.biz
> 
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
>  .../boot/dts/qcom/sc8280xp-microsoft-blackrock.dts | 1373 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c                   |    1 +
>  4 files changed, 1376 insertions(+)
> ---
> base-commit: 6fb2fa9805c501d9ade047fc511961f3273cdcb5
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


New warnings running 'make CHECK_DTBS=y qcom/sc8280xp-microsoft-blackrock.dtb' for 20241030-jg-blackrock-for-upstream-v6-0-7cd7f7d8d97c@oldschoolsolutions.biz:

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
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: wcn6855-pmu: 'vddpmumx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/sc8280xp-microsoft-blackrock.dtb: wcn6855-pmu: 'vddpmucx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#






