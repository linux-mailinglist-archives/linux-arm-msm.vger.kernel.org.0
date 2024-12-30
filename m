Return-Path: <linux-arm-msm+bounces-43678-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7059FE9BD
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 19:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 41EDF188057F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 30 Dec 2024 18:17:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C459F1ACEC4;
	Mon, 30 Dec 2024 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMhQlS/d"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94BDC370;
	Mon, 30 Dec 2024 18:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735582631; cv=none; b=mp41KM1P4vlfaR6kqWlrlUtqs8AzHpWajLiWkXhu/EJimvIDOFX5PblxaUhSINNPYV6oAbol4ytxW1PcVuofzW9Q4wo//kuNeKg17iPO+A4IKNNDjAiHJuAC95INzDEN28g8OLwhfyHH40Rr4QPv2ZHgX9Q6BhXtAux9cPPbktQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735582631; c=relaxed/simple;
	bh=gadcNFAMzDYpIBeEDEvbs02/41H7xBNN8EUvUyqMWjU=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=MFDmuZw0cjKE6EAhS1yuSvsVinvuVB9hePyctxKuL4Y/A8Pi4D3qsbvxifd30TphbB2TAOqQvdlMgTbkaqDFaUDJvH8n7jKTMAoOxuJ5FgbYKPQLh4CDNXCc6CXU7I88ucxs5nY5M9A+MY2Qp11yTjsPV7xADACC/bhL/j0lfjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMhQlS/d; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD6AFC4CED0;
	Mon, 30 Dec 2024 18:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735582631;
	bh=gadcNFAMzDYpIBeEDEvbs02/41H7xBNN8EUvUyqMWjU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=CMhQlS/dlxlWpojfCI9JgSTkQbHl4CVJjt68F7Ftw2RSU5t1Xze3KSvIPAY1AO/hU
	 kVOc4M2W2DeXbqzO3tllW7HHm9Lx+Ajeh7JF6dhGXzhzy+5/leEwjdfBB3AJBxmFql
	 5jcmPR0OrjhO7AkxRiHJWnKGLRDcvVI7zHK2Pbr9J7jhz1+5IknGPU39PjhWsazQBd
	 spvpFmKEYUQzYR14KhG6/ULnFGPeRuUNitmCaSObP4d6M6g6syHdO1KSCV/nVf6bgK
	 ZGysOjIBA24MbXmSJVYfrMB9TOx/t/1sf4zdsgJnwoSSSxnkO3c6gMJRVm4nsBGghx
	 d8xyhOE+X79OA==
Date: Mon, 30 Dec 2024 12:17:09 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 kernel@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>, 
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
In-Reply-To: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
References: <20241229152332.3068172-1-quic_wasimn@quicinc.com>
Message-Id: <173558214125.2262345.4160009716608920196.robh@kernel.org>
Subject: Re: [PATCH v5 0/6] arm64: qcom: Add support for QCS9075 boards


On Sun, 29 Dec 2024 20:53:26 +0530, Wasim Nazir wrote:
> This series:
> 
> Add support for Qualcomm's rb8, ride/ride-r3 boards using QCS9075 SoC.
> 
> QCS9075 is compatible IoT-industrial grade variant of SA8775p SoC.
> Unlike QCS9100, it doesn't have safety monitoring feature of
> Safety-Island(SAIL) subsystem, which affects thermal management.
> 
> In QCS9100 SoC, the safety subsystem monitors all thermal sensors and
> does corrective action for each subsystem based on sensor violation
> to comply safety standards. But as QCS9075 is non-safe SoC it requires
> conventional thermal mitigation for thermal management.
> 
> Difference between Ride & ride-r3 boards is ethernet phy,
> ride uses 1G ethernet phy while ride-r3 uses 2.5G ethernet phy.
> 
> This series depends on [1] for thermal functionality to work.
> 
> [1]: https://lore.kernel.org/all/20241112-sa8775p_cpuidle-v1-1-66ff3ba72464@quicinc.com/
> 
> ---
> Changelog:
> 
> v5:
>   - Remove defconfig patch as the config is product specific.
>   - v4: https://lore.kernel.org/all/20241217064856.2772305-1-quic_wasimn@quicinc.com/
> 
> v4:
>   - Replace dts to dtsi in Ride/Ride-r3 platform files.
>   - Add thermal patch to differentiate between 9100 vs 9075.
>   - Add proper abbreviation and update commit for 9100 vs 9075.
>   - v3: https://lore.kernel.org/all/20241119174954.1219002-1-quic_wasimn@quicinc.com/
> 
> v3:
>   - Fix RB8 board compatible string.
>   - v2: https://lore.kernel.org/all/20241115225152.3264396-1-quic_wasimn@quicinc.com/
> 
> v2:
>   - Remove unused dp nodes & update commit for ride vs ride-r3.
>   - v1: https://lore.kernel.org/all/20241110145339.3635437-1-quic_wasimn@quicinc.com/
> 
> Manaf Meethalavalappu Pallikunhi (1):
>   arm64: dts: qcom: Enable cpu cooling devices for QCS9075 platforms
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
>  arch/arm64/boot/dts/qcom/qcs9075-rb8.dts      | 282 +++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts  |  47 +++
>  arch/arm64/boot/dts/qcom/qcs9075-ride.dts     |  47 +++
>  arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi | 287 ++++++++++++++++++
>  drivers/soc/qcom/socinfo.c                    |   1 +
>  include/dt-bindings/arm/qcom,ids.h            |   1 +
>  8 files changed, 677 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> 
> 
> base-commit: 8155b4ef3466f0e289e8fcc9e6e62f3f4dceeac2
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


New warnings running 'make CHECK_DTBS=y qcom/qcs9075-rb8.dtb qcom/qcs9075-ride-r3.dtb qcom/qcs9075-ride.dtb' for 20241229152332.3068172-1-quic_wasimn@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@800000: $nodename:0: 'qcom,gpi-dma@800000' does not match '^dma-controller(@.*)?$'
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
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@900000: $nodename:0: 'qcom,gpi-dma@900000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@b00000: $nodename:0: 'qcom,gpi-dma@b00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
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
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs9075-ride.dtb: rsc@18200000: 'power-domains' is a required property
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






