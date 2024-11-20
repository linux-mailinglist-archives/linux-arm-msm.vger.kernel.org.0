Return-Path: <linux-arm-msm+bounces-38538-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E4E9D4019
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 17:32:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id ACE46B2E45D
	for <lists+linux-arm-msm@lfdr.de>; Wed, 20 Nov 2024 16:03:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B7AA914831E;
	Wed, 20 Nov 2024 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SU9bZpZ+"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B6BA146A9B;
	Wed, 20 Nov 2024 16:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732118568; cv=none; b=dlVdDQtnpKvgUWCQEq7rOpeeCQX+O/BnE1DxJ1Vb/HgBqMxaMsqPqT/7oVK9Hjh9KedD/xZ7hi2YRsYuxZ69T8f0+mm6apt/Vc+H/5yjaCmL1OGhTdXUe90DN9ENk2j32TBzvIi7defRyoxw99mRPImy+0Zfgm0/Y/jYKfmi7nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732118568; c=relaxed/simple;
	bh=PMFde2Hq2i+TgUbDNQIDtNYq5XMpm5+v4VbsvocqAX8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iJ+RXoeR7qdPevV8U/FcGZCkMhpJomQLmnOOhVTkcFDLYRtvbSDXi4DOLYVuf3HD/tzizITWK+jIup14U1RNZpEkAlF5QK4Ndup2Ep+g30TavtDCS+HupLk+CIm6nN0Y0I0zrFwprr/hGzMiRILM7o1ELIS1p2948ZoaCiqkqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SU9bZpZ+; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0836FC4CED1;
	Wed, 20 Nov 2024 16:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732118568;
	bh=PMFde2Hq2i+TgUbDNQIDtNYq5XMpm5+v4VbsvocqAX8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=SU9bZpZ+RrT1XC5UWtLt+Fi86+EnVTQ1W9oDbsE7YSfbUZx7G25aln4c/HC36BPTv
	 bTmWfGN3BhVdbWnTW+sJbhDeAdSdulvNv49EsyLkrQjo9eCGeNqCk7uCjhOdQ5ceXI
	 8WJp/5i33rfet/iGuviOkVGi7wtaykY6G54MKhYl2MSCKbR/MQFOIqtHnvFJmHnh6S
	 6gyUly/P0cynMgY7enJ6b5qevBtG7I3x+8uwm8cXlUFL/KPn5FB6LS5ANX2OUbInbS
	 HwmWStVU7hQZW9lGm4Mcv932hR5j0CO//xTdRFBS3ASJX4BH1uaAcZ4WZQxvzt1lKy
	 ezFBvytJiAFKA==
Date: Wed, 20 Nov 2024 10:02:46 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 kernel@quicinc.com, linux-arm-msm@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
In-Reply-To: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
References: <20241119174954.1219002-1-quic_wasimn@quicinc.com>
Message-Id: <173211840430.1123906.4830016117974808926.robh@kernel.org>
Subject: Re: [PATCH v3 0/5] arm64: qcom: Add support for QCS9075 boards


On Tue, 19 Nov 2024 23:19:49 +0530, Wasim Nazir wrote:
> This series:
> 
> Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.
> 
> QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
> without safety monitorng feature of SAfetyIsLand subsystem.
> This subsystem continues to supports other features like built-in
> self-test, error-detection, reset-handling, etc.
> 
> Changelog:
> 
> v2:
>   - Remove unused dp nodes & update commit for ride vs ride-r3.
> 
> v1: https://lore.kernel.org/all/20241110145339.3635437-1-quic_wasimn@quicinc.com/
> 
> Wasim Nazir (5):
>   dt-bindings: arm: qcom,ids: add SoC ID for QCS9075
>   soc: qcom: socinfo: add QCS9075 SoC ID
>   dt-bindings: arm: qcom: Document rb8/ride/ride-r3 on QCS9075
>   arm64: dts: qcom: Add support for QCS9075 RB8
>   arm64: dts: qcom: Add support for QCS9075 Ride & Ride-r3
> 
>  .../devicetree/bindings/arm/qcom.yaml         |   9 +
>  arch/arm64/boot/dts/qcom/Makefile             |   3 +
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      | 281 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |  12 +
>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |  12 +
>  drivers/soc/qcom/socinfo.c                    |   1 +
>  include/dt-bindings/arm/qcom,ids.h            |   1 +
>  7 files changed, 319 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
> 
> 
> base-commit: 929beafbe7acce3267c06115e13e03ff6e50548a
> --
> 2.47.0
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


New warnings running 'make CHECK_DTBS=y qcom/qcs9075-rb8.dtb qcom/qcs9075-ride-r3.dtb qcom/qcs9075-ride.dtb' for 20241119174954.1219002-1-quic_wasimn@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-qce', 'qcom,qce'] is too long
	['qcom,sa8775p-qce', 'qcom,qce'] is too short
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,ipq4019-qce' was expected
	'qcom,sm8150-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-qce', 'qcom,qce'] is too long
	['qcom,sa8775p-qce', 'qcom,qce'] is too short
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,ipq4019-qce' was expected
	'qcom,sm8150-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: crypto@1dfa000: compatible: 'oneOf' conditional failed, one must be fixed:
	['qcom,sa8775p-qce', 'qcom,qce'] is too long
	['qcom,sa8775p-qce', 'qcom,qce'] is too short
	'qcom,crypto-v5.1' was expected
	'qcom,crypto-v5.4' was expected
	'qcom,sa8775p-qce' is not one of ['qcom,ipq4019-qce', 'qcom,sm8150-qce']
	'qcom,sa8775p-qce' is not one of ['qcom,ipq6018-qce', 'qcom,ipq8074-qce', 'qcom,ipq9574-qce', 'qcom,msm8996-qce', 'qcom,qcm2290-qce', 'qcom,sdm845-qce', 'qcom,sm6115-qce']
	'qcom,ipq4019-qce' was expected
	'qcom,sm8150-qce' was expected
	from schema $id: http://devicetree.org/schemas/crypto/qcom-qce.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: wcn6855-pmu: 'vddpmumx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: wcn6855-pmu: 'vddpmucx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: wcn6855-pmu: 'vddpmumx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: wcn6855-pmu: 'vddpmucx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml#






