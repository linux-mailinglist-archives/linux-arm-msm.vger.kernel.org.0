Return-Path: <linux-arm-msm+bounces-26154-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FC309313BE
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 14:12:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 96662B21DEB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Jul 2024 12:12:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F252518C17B;
	Mon, 15 Jul 2024 12:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G5x5sluz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C666D23BF;
	Mon, 15 Jul 2024 12:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721045567; cv=none; b=eVo337pLHvWT1zJ5j+ueFo2Y9NqjuWZjbPRT9AFbYRg+mHuajgjduErEw913UW8xEpB2mISjbgkAdbammfdMG+0RljPcq2BsOgqCShexgV8TWwG0MAIbBpVTKNSFAdxLnOj2kAPr828alyI0k75nwrKzYNGp/10qls1jviUPLsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721045567; c=relaxed/simple;
	bh=/OnM7ZCRFYAu/jdydn+sRukAdfE1atcPBWpj0LzRqIQ=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=skuZJFiI/6LZXeZx/FO4I+FLyfIOkqoTT8U42PekiaTsisugyNOLTpPM+0UqnbsC4AMOZImjdVR1UQ2ZSo9WADPba3EA2q//QGnsB3jzeywThLc5IecSAvQTROZPcVLp0bcS+x2Uklia1URpmtmIiKUYnBZ30gE/t+EgJDmmcbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G5x5sluz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22D40C32782;
	Mon, 15 Jul 2024 12:12:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721045567;
	bh=/OnM7ZCRFYAu/jdydn+sRukAdfE1atcPBWpj0LzRqIQ=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=G5x5sluzL5X1rJDutcP1VZ0E+9syzWlk2iCVHrCOTaQyAiZ8RJJ6IWy/wRj5h2a6A
	 AO2bfci4BVcBJIH4xVcU2/zY5Cflk/Ysu599Jx4AhZFwZJUdlu5CvKl+so4fWN7aRX
	 VQdjNRbFoPooQkhspLCvtc3ekMmUqypSsFiWwY60hoXc+ZkYVkGsXFrterwbLBvNgN
	 FcAvorT2A5tzZhwaQo9zUTCjXfo6wbsAycI7MfeAphI2dfBEoypmOe3RfQLPdUnXMB
	 ytMgiy0wNr9Pqampj+ZH4spc5QfOOowNdcynysdr/Zw7EcaSUOwNfKQkdwUUZrln9w
	 P70z+ADibi+jA==
Date: Mon, 15 Jul 2024 06:12:45 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Nikita Travkin <nikita@trvn.ru>
Cc: Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Anton Bambura <jenneron@postmarketos.org>, 
 =?utf-8?q?Adam_S=C5=82abo=C5=84?= <asaillen@protonmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 ~postmarketos/upstreaming@lists.sr.ht, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
References: <20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru>
Message-Id: <172104541138.3725354.18402389823221515808.robh@kernel.org>
Subject: Re: [PATCH 0/3] Introduce msm8916/39 based Lenovo devices


On Fri, 12 Jul 2024 21:04:05 +0500, Nikita Travkin wrote:
> Continuing the work of upstreaming the various msm8916 devices from the
> backlog, this series introduces few 8916 and 8939 Lenovo/Wingtech
> devices (where Wingtech is the ODM for these designs).
> 
> Included devices are:
> 
> - Lenovo A6000 (Wingtech WT86518)
> - Lenovo A6010 (Wingtech WT86528)
> - Lenovo Vibe K5 (Wingtech WT82918)
> - Lenovo Vibe K5 (HD) (Wingtech WT82918hd)
> 
> Note that "HD" variant of K5 is based on msm8929 which is a lower bin
> of msm8939 SoC. A simple dtsi is added for this soc along with the new
> devices.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> Adam Słaboń (1):
>       arm64: dts: qcom: msm8939-wingtech-wt82918: Add Lenovo Vibe K5 devices
> 
> Anton Bambura (1):
>       arm64: dts: qcom: msm8916-wingtech-wt865x8: Add Lenovo A6000/A6010
> 
> Nikita Travkin (1):
>       dt-bindings: arm: qcom: Add msm8916/39 based Lenovo devices
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   9 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   5 +
>  .../boot/dts/qcom/msm8916-wingtech-wt86518.dts     |  89 ++++++++
>  .../boot/dts/qcom/msm8916-wingtech-wt86528.dts     | 160 +++++++++++++
>  .../boot/dts/qcom/msm8916-wingtech-wt865x8.dtsi    | 216 ++++++++++++++++++
>  .../boot/dts/qcom/msm8929-wingtech-wt82918hd.dts   |  17 ++
>  arch/arm64/boot/dts/qcom/msm8929.dtsi              |   5 +
>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dts     |  16 ++
>  .../boot/dts/qcom/msm8939-wingtech-wt82918.dtsi    | 254 +++++++++++++++++++++
>  .../boot/dts/qcom/msm8939-wingtech-wt82918hd.dts   |  16 ++
>  10 files changed, 787 insertions(+)
> ---
> base-commit: 3fe121b622825ff8cc995a1e6b026181c48188db
> change-id: 20240710-msm89xx-wingtech-init-e07095e2b2ec
> 
> Best regards,
> --
> Nikita Travkin <nikita@trvn.ru>
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


New warnings running 'make CHECK_DTBS=y qcom/msm8916-wingtech-wt86518.dtb qcom/msm8916-wingtech-wt86528.dtb qcom/msm8929-wingtech-wt82918hd.dtb qcom/msm8939-wingtech-wt82918.dtb qcom/msm8939-wingtech-wt82918hd.dtb' for 20240712-msm89xx-wingtech-init-v1-0-64f4aa1870bd@trvn.ru:

arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: iommu@1f08000: clocks: [[31, 129], [31, 140], [31, 175]] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: iommu@1f08000: clock-names: ['iface', 'bus', 'tbu'] is too long
	from schema $id: http://devicetree.org/schemas/iommu/qcom,iommu.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: pmic@0: mpps@a000:mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: mpps@a000: mpp4-state: 'oneOf' conditional failed, one must be fixed:
	'function', 'output-low', 'pins', 'power-source', 'qcom,dtest' do not match any of the regexes: '-pins$', 'pinctrl-[0-9]+'
	[1] is not of type 'integer'
	[1] is not one of [1, 2, 3, 4]
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,pmic-mpp.yaml#
arch/arm64/boot/dts/qcom/msm8929-wingtech-wt82918hd.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b088000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b098000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8939-wingtech-wt82918hd.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86518.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b0a8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /soc@0/power-manager@b0b8000: failed to match any schema with compatible: ['qcom,msm8916-acc']
arch/arm64/boot/dts/qcom/msm8916-wingtech-wt86528.dtb: /usb-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']






