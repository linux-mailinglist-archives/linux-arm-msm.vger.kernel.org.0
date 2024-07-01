Return-Path: <linux-arm-msm+bounces-24821-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id CB76291E72D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 20:10:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id EEF531C216EE
	for <lists+linux-arm-msm@lfdr.de>; Mon,  1 Jul 2024 18:10:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07E1616EC14;
	Mon,  1 Jul 2024 18:10:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SusoBvVD"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2C4916EC0E;
	Mon,  1 Jul 2024 18:10:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719857424; cv=none; b=SeZGrZ013J5x9Migu1NgWIhn3X+Eg2ZNgtoN2a2bLbKQBBFpX3dWgSnOUe75pcqHJbN1lmIA2ESE7KFR93/PFCQjspPEgzPamP9NysPER4J1ughcGlBRBo/RPgd8KhrjSo/Kx21MOrOdviutMhO2TTx1Q7pE1GghUYEU4pQOwbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719857424; c=relaxed/simple;
	bh=eVNbwkBJh9XuOU2A6GsGtGfEkDsOONhow0AIQJ9DdZk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=mOs/zy1R0ARS3Ji6/NKtVMm2YICmwIvs/iYkOG65IXr5a5hxvok3WQuB9xyGfQt+XKsdeH2kSUFr3A4hmwBnDspXtDtP4YjGqG+b+HZKowFoLNH15p1sgm9s+VXnU3F+OZhlPMa6fffMOV126+fS8iUsjg5ED7Hgx/h8mDrlHHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SusoBvVD; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C360C32781;
	Mon,  1 Jul 2024 18:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719857424;
	bh=eVNbwkBJh9XuOU2A6GsGtGfEkDsOONhow0AIQJ9DdZk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SusoBvVDgEe/XvEs1nZz2RoyTovRdI4a/gtIg41xDMCADAL1r61WIoIC9wtLoAVrX
	 VZox49pJolI7Tntkd2AkHsUdWAqJw7370uCEA5Mm+V9gej4Y9vG6g3HPpZPYK6/ew5
	 S/03vDS13nuW7j0z883CoXXFfNScb0SlUSn7AzXFasHNjqHnfTx3Pq8o2W8aSdwzfC
	 J5RV6g3offolmlDmLMXCHKVYhaidnFflSHd+nUtXVC7l8slZZGqeRA3cF/iyGJQu2S
	 SwALfD4hzBjoTnie2voI7cnAnDwKQ9k3wtkhJRkkgpVkd8JWQyi2vmk/vX49BztfLv
	 bNubrfL96avHw==
Date: Mon, 01 Jul 2024 12:10:23 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Xilin Wu <wuxilin123@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-kernel@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>
In-Reply-To: <20240701-asus-vivobook-s15-v4-0-ce7933b4d4e5@gmail.com>
References: <20240701-asus-vivobook-s15-v4-0-ce7933b4d4e5@gmail.com>
Message-Id: <171985715858.313715.1322433289382972795.robh@kernel.org>
Subject: Re: [PATCH v4 0/2] Introduce ASUS Vivobook S 15


On Mon, 01 Jul 2024 11:05:16 +0800, Xilin Wu wrote:
> ASUS Vivobook S 15 is a laptop based on the Qualcomm Snapdragon X Elite
> SoC (X1E78100). This series adds initial support for the device.
> 
> Currently working features:
> 
> - CPU frequency scaling up to 3.4GHz
> - NVMe storage on PCIe 6a (capable of Gen4x4, currently limited to Gen4x2)
> - Keyboard and touchpad
> - WCN7850 Wi-Fi
> - Two Type-C ports on the left side
> - internal eDP display
> - ADSP and CDSP remoteprocs
> 
> Some features which can get working with out of tree patches:
> 
> - GPU [1]
> - Bluetooth [2]
> 
> Notably not working features:
> 
> - Battery monitoring via battmgr
> - Orientation switching and altmode on the Type-C ports (USB4 retimer driver needed?)
> - Two USB Type-A ports on the right side (dwc3 multiport controller)
> - Front camera
> - SD card slot
> - HDMI connector (using a Parade PS186 DP 1.4 to HDMI 2.0 converter)
> - USB4 and the retimer (Parade PS8830?)
> - Anything using the EC
> 
> Dump of the ACPI tables could be found here: [3]
> 
> [1] https://lore.kernel.org/all/20240623110753.141400-1-quic_akhilpo@quicinc.com/
> [2] https://git.codelinaro.org/abel.vesa/linux/-/commits/topic/b4/x1e80100-bt
> [3] https://github.com/aarch64-laptops/build/pull/103
> 
> Signed-off-by: Xilin Wu <wuxilin123@gmail.com>
> ---
> Changes in v4:
> - Fix usb hsphy vdd-supply (Abel)
> - Link to v3: https://lore.kernel.org/r/20240630-asus-vivobook-s15-v3-0-bce7ca4d9683@gmail.com
> 
> Changes in v3:
> - Add comment detailing pmic-glink connector mapping (Konrad)
> - Minor changes in dts (Konrad)
> - Link to v2: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com
> 
> Changes in v2:
> - Fix accidentally changed Makefile
> - Link to v1: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com
> 
> ---
> Xilin Wu (2):
>       dt-bindings: arm: qcom: Add ASUS Vivobook S 15
>       arm64: dts: qcom: Add device tree for ASUS Vivobook S 15
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 616 +++++++++++++++++++++
>  3 files changed, 618 insertions(+)
> ---
> base-commit: 642a16ca7994a50d7de85715996a8ce171a5bdfb
> change-id: 20240628-asus-vivobook-s15-72a497863168
> 
> Best regards,
> --
> Xilin Wu <wuxilin123@gmail.com>
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


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-asus-vivobook-s15.dtb' for 20240701-asus-vivobook-s15-v4-0-ce7933b4d4e5@gmail.com:

arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: domain-idle-states: cluster-sleep-1: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: thermal-sensor@c271000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
	'qcom,tsens-v0_1' was expected
	'qcom,tsens-v1' was expected
	'qcom,ipq8074-tsens' was expected
	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/thermal-sensor@c271000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: thermal-sensor@c272000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
	'qcom,tsens-v0_1' was expected
	'qcom,tsens-v1' was expected
	'qcom,ipq8074-tsens' was expected
	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/thermal-sensor@c272000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: thermal-sensor@c273000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
	'qcom,tsens-v0_1' was expected
	'qcom,tsens-v1' was expected
	'qcom,ipq8074-tsens' was expected
	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/thermal-sensor@c273000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: thermal-sensor@c274000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,x1e80100-tsens', 'qcom,tsens-v2'] is too long
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8064-tsens', 'qcom,msm8960-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,mdm9607-tsens', 'qcom,msm8226-tsens', 'qcom,msm8909-tsens', 'qcom,msm8916-tsens', 'qcom,msm8939-tsens', 'qcom,msm8974-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,msm8956-tsens', 'qcom,msm8976-tsens', 'qcom,qcs404-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,msm8953-tsens', 'qcom,msm8996-tsens', 'qcom,msm8998-tsens', 'qcom,qcm2290-tsens', 'qcom,sa8775p-tsens', 'qcom,sc7180-tsens', 'qcom,sc7280-tsens', 'qcom,sc8180x-tsens', 'qcom,sc8280xp-tsens', 'qcom,sdm630-tsens', 'qcom,sdm845-tsens', 'qcom,sm6115-tsens', 'qcom,sm6350-tsens', 'qcom,sm6375-tsens', 'qcom,sm8150-tsens', 'qcom,sm8250-tsens', 'qcom,sm8350-tsens', 'qcom,sm8450-tsens', 'qcom,sm8550-tsens', 'qcom,sm8650-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq8074-tsens']
	'qcom,x1e80100-tsens' is not one of ['qcom,ipq9574-tsens']
	'qcom,tsens-v0_1' was expected
	'qcom,tsens-v1' was expected
	'qcom,ipq8074-tsens' was expected
	from schema $id: http://devicetree.org/schemas/thermal/qcom-tsens.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: /soc@0/thermal-sensor@c274000: failed to match any schema with compatible: ['qcom,x1e80100-tsens', 'qcom,tsens-v2']
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: pci@1bf8000: Unevaluated properties are not allowed ('vddpe-3v3-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie-x1e80100.yaml#
arch/arm64/boot/dts/qcom/x1e80100-asus-vivobook-s15.dtb: usb@a2f8800: interrupt-names: ['pwr_event', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#






