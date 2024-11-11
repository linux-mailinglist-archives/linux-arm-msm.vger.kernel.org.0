Return-Path: <linux-arm-msm+bounces-37480-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C8F9C41E2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 16:34:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 8497F286A0B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 11 Nov 2024 15:34:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DECC0189BAD;
	Mon, 11 Nov 2024 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A+sF+K/7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0B1A1A0AE9;
	Mon, 11 Nov 2024 15:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731339173; cv=none; b=ppHPTzqzYaPPyJCZMTY+625qpC3wBJ1WFqcMazavrAUoo9FfAt6q5SliWyVkGOnazpCKCYsyTzkSvduzwf/d3mu/Gy/ano0U9tuVmVTi0FASb2WQuWOJmS+eHRcYgEutlu97uGYxDBZ9iHCf6l/4biaeBC9uoo0DOFhEq2knwMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731339173; c=relaxed/simple;
	bh=JRCExL56hEso6nxlo5+9mWAiDru0uRJpvy6CKQe1Eyg=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=PXhYgrMS5pOZBtxizvXuVE5zqx8R59ayeCuFGdohawMDE5Z6Q4zM9CrbrcMaZhoqbQ6P/Ur1XpiewBEagU52Bk/d6XRd4vNmDKDwzwt7x/jFO+286T600NWRrc5223Mv92iCyvB1GJM3ZXkxZn9gO8r6tvSGyQiVlEDfda/1smI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A+sF+K/7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EDB9AC4CECF;
	Mon, 11 Nov 2024 15:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731339173;
	bh=JRCExL56hEso6nxlo5+9mWAiDru0uRJpvy6CKQe1Eyg=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=A+sF+K/739rUF8+V77C28gdkGMV5oHrmNnc4k7kfU6eTxp/miuOAyOKl8OuXhGzvi
	 nx/nSCMtEYIbgWXFtoLnyL5J+Pznt7UuCcQovRO4/k06/mXJpXLWlWgVVOyaHc2TL6
	 JKSamnnpjqmO+c2EW9Nw6SpB8gUTkV4TqzxybcQ6miqIPAHXuG+1OYppLghWn7wlFR
	 fHEfO4iEHMCwsugvW83DjMenqlX1mr7mA6WiaWRcDTJDhdoiots7DuLpwWR9V+hVAQ
	 REXMWMi8l9ofk9OYKJz4coBP6Yp4jWVjlnBzYtCuMEQ1RsZfZlYBRmkLaNwx/GjfkG
	 5B0oaDAk694tQ==
Date: Mon, 11 Nov 2024 09:32:50 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
Cc: linux-kernel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>
In-Reply-To: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
References: <20241110145339.3635437-1-quic_wasimn@quicinc.com>
Message-Id: <173133346523.1281746.5040282370031807643.robh@kernel.org>
Subject: Re: [PATCH 0/5] arm64: qcom: Add support for QCS9075 boards


On Sun, 10 Nov 2024 20:23:34 +0530, Wasim Nazir wrote:
> Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.
> 
> QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC
> without safety monitorng feature of SAfetyIsLand subsystem.
> This subsystem continues to supports other features like built-in
> self-test, error-detection, reset-handling, etc.
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
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      | 287 ++++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |  12 +
>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |  12 +
>  drivers/soc/qcom/socinfo.c                    |   1 +
>  include/dt-bindings/arm/qcom,ids.h            |   1 +
>  7 files changed, 325 insertions(+)
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


New warnings running 'make CHECK_DTBS=y qcom/qcs9075-rb8.dtb qcom/qcs9075-ride-r3.dtb qcom/qcs9075-ride.dtb' for 20241110145339.3635437-1-quic_wasimn@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: bluetooth: 'vddwlcx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: bluetooth: 'vddwlmx-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: bluetooth: 'vddrfa1p8-supply' is a required property
	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
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
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: rsc@18200000: 'power-domains' is a required property
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
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






