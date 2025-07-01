Return-Path: <linux-arm-msm+bounces-63220-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 906F2AEF983
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 15:00:23 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id B27F01884636
	for <lists+linux-arm-msm@lfdr.de>; Tue,  1 Jul 2025 12:59:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2A40A27465A;
	Tue,  1 Jul 2025 12:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gHv/P0vY"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8ED2741D4;
	Tue,  1 Jul 2025 12:59:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374768; cv=none; b=Ij+H0IlK0N23bcYL96gvdBF7luTjWlWgzJTI44IH2zBKR5iO+MKAmwCTgcLkPbC8y2rMCMxz0wbl7nx5BEs6dgI1l9H9CZjxD+0z8ojLksUWGQCNOVlPx3V5LZZfWbhpBV2yJIZO5C1LrsUEzZvrN/rx+iC7fZcWjKHHWOcgfjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374768; c=relaxed/simple;
	bh=ODKLcadCQJuXUaB+xKl4kWRgLW9QEYQuw8fgYlVtLzQ=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=VBhO/cup8kgedaX04dD3dyF1pD8xPOpGg8qrZg5Yp/BBFVvxQAM6t/qXYEPbjpvRMO2Jk1rLSw2AQhHs2t6UvfK7oLgYQHbrrvgFwamxKOkiB7kS2Q5qp1wqggD6aQlj3a7X9CVpMeNhzlQ558Q6C/ewx/PGGwuCrwEYGb2+f2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gHv/P0vY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51C6DC4CEEB;
	Tue,  1 Jul 2025 12:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751374767;
	bh=ODKLcadCQJuXUaB+xKl4kWRgLW9QEYQuw8fgYlVtLzQ=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=gHv/P0vYqmalxdjJM2PUndIU4boEL9bHVENIlvixb8tnGwRg3z9k0/FIxNTfLmptf
	 q2EsRfOS1EJJsVBenK64J1MVX71iHJZ+Fo3RwV/cjxSEWVyLCp60hSAjf7seZ0BSBc
	 zk5csguY9Q9QXitU83bPJtLfxc9D1YDPGDFdLBOwaHFDVL3m1sjhbCkHSrZHpqip4S
	 XCbWsrwOsNmC4B6t9KGR8wfFE6UE2cmr98Wvux1x4aggtQu00OWRWn+Bc9JV2KffDw
	 oceLr3htLSboNqosZm1kfZImiOoCO9K+xvp+PBtXtJfpav8UHCd3v9Akrop0A5X9vb
	 l9vaIxuqz4iJw==
Date: Tue, 01 Jul 2025 07:59:26 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-usb@vger.kernel.org, 
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>, 
 linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Matthias Kaehlcke <mka@chromium.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
To: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
In-Reply-To: <20250630-tb16-dt-v8-0-cf42a396e736@oldschoolsolutions.biz>
References: <20250630-tb16-dt-v8-0-cf42a396e736@oldschoolsolutions.biz>
Message-Id: <175137472790.1294043.18011294938653738493.robh@kernel.org>
Subject: Re: [PATCH v8 0/4] arm64: dts: qcom: Add Lenovo ThinkBook 16
 device tree


On Mon, 30 Jun 2025 21:06:38 +0200, Jens Glathe wrote:
> Device tree for the Lenovo Thinkbook 16 G7 QOY
> 
> The Laptop is a Snapdragon X1 / X1 Plus (Purwa) based device [1].
> 
> Supported features:
> 
> - USB type-c and type-a ports
> - Keyboard
> - Touchpad (all that are described in the dsdt)
> - Touchscreen (described in the dsdt, no known SKUss)
> - Display including PWM backlight control
> - PCIe devices
> - nvme
> - SDHC card reader
> - ath12k WCN7850 Wifi and Bluetooth
> - ADSP and CDSP
> - GPIO keys (Lid switch)
> - Sound via internal speakers / DMIC / USB / headphone jack
> - DP Altmode with 2 lanes (as all of these still do)
> - Integrated fingerprint reader (FPC)
> - Integrated UVC camera
> - X1-45 GPU
> 
> Not supported yet:
> 
> - HDMI port.
> - EC and some fn hotkeys.
> 
> Limited support yet:
> 
> - SDHC card reader is based on the on-chip sdhc_2 controller, but the driver from
> the Snapdragon Dev Kit is only a partial match. It can do normal slow sd cards,
> but not UHS-I (SD104) and UHS-II.
> 
> Notes:
> 
> - Putting the camera behind usb_2_dwc3 results in the camera switched off after 30
> seconds. With the stand-alone node as previously defined it stays usable and
> suspends, as intended. Sincethe sole reason for the USB camera to be in the
> devicetree is the required extra supply (which is guessed, as mentioned), and
> its handling by power management, I would propose to keep it this way.
> 
> - The gpi_dma nodes appear to be implicitly enabled when a serial device is used.
> I added them, no change in behaviour, though. Since this would be the only X1
> device adding them afaik, I left them out.
> 
> - The cma-memory is removed, it is not on all x1 devices as I assumed.
> Haven't found a case where it is required.
> 
> - i2c2 defines the keyboard and 4 different touchpad interfaces. With the bundling
> of the pinctrl it seems to work better. I've had issues with only clock and touchpad
> pinctrl on the i2c2 node, and not keyboard.
> 
> This work was done without any schematics or non-public knowledge of the device.
> So, it is based on the existing x1 device trees, dsdt analysis, using HWInfo
> ARM64, and pure guesswork. It has been confirmed, however, that the device really
> has 4 NXP PTN3222 eUSB2 repeaters, one of which doesn't have a reset GPIO (eusb5
> @43).
> 
> I have brought up the Thinkbook over the last 5 months since the x1p42100-crd
> patches were available. The laptop is very usable now, and quite solid as a dev/
> test platform.
> 
> Big thanks to Aleksandrs Vinarskis for helping (and sort of persisting) on the
> fingerprint, camera and HDMI issues.
> 
> [1]: https://psref.lenovo.com/syspool/Sys/PDF/ThinkBook/ThinkBook_16_G7_QOY/ThinkBook_16_G7_QOY_Spec.pdf
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
> Changes in v8:
> - rebase to next-20250630
> - fix bleed-over of edp0_hpd_active - not in linux-next yet
> - fix bleed-over of hdmi definition
> - Link to v7: https://lore.kernel.org/r/20250629-tb16-dt-v7-0-35276341338f@oldschoolsolutions.biz
> 
> Changes in v7:
> - amended pinctrl order and indents where needed
> - interchanged enable-gpios and select-gpios for usb-sbu-mux as they are
>   defined in the dsdt - dp altmode function confirmed in both orientations
> - picked up reviewed-by and acked-by from Dmitry Baryshkob and Rob Herring
> - Link to v6: https://lore.kernel.org/r/20250607-tb16-dt-v6-0-61a31914ee72@oldschoolsolutions.biz
> 
> Changes in v6:
> - removed compatible for qcom,sm8550-pmic-glink" in pmic-glink
> - fixed malformed gpu node
> - Link to v5: https://lore.kernel.org/r/20250607-tb16-dt-v5-0-ae493364f525@oldschoolsolutions.biz
> 
> Changes in v5:
> - removed patch for the CMN N160JCE-ELL panel, got reviewed
> - re-ordered code in onboard_usb_dev as requested by Dmitry Baryshkov
> - amended device tree with review notes from Dmitry Baryshkov where possible
>   and resuting in a working laptop - added notes section
> - Link to v4: https://lore.kernel.org/r/20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz
> 
> Changes in v4:
> - squashed Makefile and dts commits to one
> - picked up r-b from Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> - Link to v3: https://lore.kernel.org/r/20250524-tb16-dt-v3-0-17e26d935e73@oldschoolsolutions.biz
> 
> Changes in v3:
> - removed changes in x1e80100.dtsi and x1p42100.dtsi - resolved with [2]
> - fixed schema errors with correct compatible string for the model
> - added power management for the camera via onboard_usb_dev.c
> - amended node ordering
> - changed the panel driver used to edp-panel, added panel in the driver
> - amended x1e80100.dtsi for exposing PM8010: This one is not present in the design,
>   added /delete-node/ for it.
> - removed commented-out lines for sdhc, specified which don't work.
> - corrected ZAP shader firmware name
> - Link to v2: https://lore.kernel.org/r/20250516-tb16-dt-v2-0-7c4996d58ed6@oldschoolsolutions.biz
> 
> Changes in v2:
> - removed nodes that gave DTC compile errors (pm8010_thermal, edp0_hpd_active)
> - amended qcom.yaml
> - shortened the commit titles to fit 75 chars
> - Link to v1: https://lore.kernel.org/r/20250515-tb16-dt-v1-0-dc5846a25c48@oldschoolsolutions.biz
> 
> [2]: 20250520-topic-x1p4_tsens-v2-1-9687b789a4fb@oss.qualcomm.com
> 
> ---
> Jens Glathe (4):
>       dt-bindings: arm: qcom: Add Lenovo TB16 support
>       usb: misc: onboard_usb_dev: Add Bison Electronics Inc. Integrated Camera
>       firmware: qcom: scm: Allow QSEECOM on Lenovo Thinkbook 16
>       arm64: dts: qcom: Add Lenovo ThinkBook 16 G7 QOY device tree
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |    1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |    2 +
>  arch/arm64/boot/dts/qcom/x1e80100-pmics.dtsi       |    2 +-
>  .../boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dts | 1656 ++++++++++++++++++++
>  drivers/firmware/qcom/qcom_scm.c                   |    1 +
>  drivers/usb/misc/onboard_usb_dev.c                 |    2 +
>  drivers/usb/misc/onboard_usb_dev.h                 |    8 +
>  7 files changed, 1671 insertions(+), 1 deletion(-)
> ---
> base-commit: 1343433ed38923a21425c602e92120a1f1db5f7a
> change-id: 20250511-tb16-dt-e84c433d87b1
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


This patch series was applied (using b4) to base:
 Base: using specified base-commit 1343433ed38923a21425c602e92120a1f1db5f7a

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250630-tb16-dt-v8-0-cf42a396e736@oldschoolsolutions.biz:

arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: pinctrl@f100000 (qcom,x1e80100-tlmm): usb-1-ss0-sbu-state: 'oneOf' conditional failed, one must be fixed:
	'function' is a required property
	'pins' is a required property
	Unevaluated properties are not allowed ('oe-n-pins', 'sel-pins' were unexpected)
	Unevaluated properties are not allowed ('bias-pul-up' was unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,x1e80100-tlmm.yaml#
arch/arm64/boot/dts/qcom/x1p42100-lenovo-thinkbook-16.dtb: pmic-glink (qcom,x1e80100-pmic-glink): compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-pmic-glink', 'qcom,pmic-glink'] is too short
	'qcom,x1e80100-pmic-glink' is not one of ['qcom,qcm6490-pmic-glink', 'qcom,sc8180x-pmic-glink', 'qcom,sc8280xp-pmic-glink', 'qcom,sm8350-pmic-glink', 'qcom,sm8450-pmic-glink', 'qcom,sm8550-pmic-glink']
	'qcom,x1e80100-pmic-glink' is not one of ['qcom,sm7325-pmic-glink']
	'qcom,qcm6490-pmic-glink' was expected
	'qcom,sm8550-pmic-glink' was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,pmic-glink.yaml#






