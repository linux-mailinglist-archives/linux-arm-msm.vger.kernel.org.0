Return-Path: <linux-arm-msm+bounces-24654-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DC391C2D1
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 17:42:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 114A91C22638
	for <lists+linux-arm-msm@lfdr.de>; Fri, 28 Jun 2024 15:42:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 227E11CB301;
	Fri, 28 Jun 2024 15:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mtExm6gk"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB7291C9ED8;
	Fri, 28 Jun 2024 15:41:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719589320; cv=none; b=jQALLH7qoMgvu8nC2zSYditikeI2yBVFQbnddx4BV1XkyDZ131KIxkTyTpoviNWoB+jmV174nAZ4S3hDeiIUgqWWez9OswXIF7TgdWMJXoedSVT7E1sqhezp0zgoBFvg1BXr965SyX1oBK5gQsDoVnqTfJp7QgBwlFJcD4StJJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719589320; c=relaxed/simple;
	bh=G38+k3BVa6YCeaehiQF1OAIDCC053l6ZWu3ZUmml0NY=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=ujj2jCPXohEAVMFaFGo8dpCKPHz8sRrCg34jQzEAu2S7V9QG7yw2ToNg+o96CwhdNsRUs1pR5LfnMOARvVpkfGIva7Ul+sBOnbjsJvF1nmgVn146Oy+ITP0C1fByyfgpNgPc1Nv7XtCN5wOd3XBP3SciLu0zs8wyugfKdXxY6/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mtExm6gk; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 350F2C116B1;
	Fri, 28 Jun 2024 15:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719589319;
	bh=G38+k3BVa6YCeaehiQF1OAIDCC053l6ZWu3ZUmml0NY=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=mtExm6gkdi65UD89ZhcHb8ePMuFBqdJ/EGAyZMTtkN8TrzXXC1Py933+Mkp5ruhN+
	 Tr7oj15qki6hWcqmC6NZ4dstcEYkxRACh02ihulmScXrqQ42kcQqgBupT/cfAJnzqq
	 UCmWOjKPjh8G0gYFpbB8txUeTcIJXq6Lqr0IedVb7wknzMwtwDPkBrD7XWte1LyLya
	 Ld91r+HKvNu5HnXr9iuqroxcftVyYq6i0cAXdQCbze7RPglSZ9f7GSToTZEMf6Be8h
	 apX0KVy30TFceGrpBpuCIPchFibOQ9MOxrHj6kai/a929y8kwUxb1xDiSk9Tm2rIC8
	 S7IR+LSEpAdKg==
Date: Fri, 28 Jun 2024 09:41:58 -0600
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
Cc: Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Abel Vesa <abel.vesa@linaro.org>, Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
In-Reply-To: <20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com>
References: <20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com>
Message-Id: <171958905236.3123036.1526837699366043080.robh@kernel.org>
Subject: Re: [PATCH RESEND 0/2] Introduce ASUS Vivobook S 15


On Fri, 28 Jun 2024 19:49:33 +0800, Xilin Wu wrote:
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
> Changes in v2:
> - EDITME: describe what is new in this series revision.
> - EDITME: use bulletpoints and terse descriptions.
> - Link to v1: https://lore.kernel.org/r/20240628-asus-vivobook-s15-v1-0-2a1e4571b8ab@gmail.com
> 
> ---
> Xilin Wu (2):
>       dt-bindings: arm: qcom: Add ASUS Vivobook S 15
>       arm64: dts: qcom: Add device tree for ASUS Vivobook S 15
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../boot/dts/qcom/x1e80100-asus-vivobook-s15.dts   | 613 +++++++++++++++++++++
>  3 files changed, 615 insertions(+)
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


New warnings running 'make CHECK_DTBS=y qcom/x1e80100-asus-vivobook-s15.dtb' for 20240628-asus-vivobook-s15-v1-0-92cb39f3f166@gmail.com:

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






