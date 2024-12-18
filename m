Return-Path: <linux-arm-msm+bounces-42697-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC4A9F6DC2
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 20:05:27 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A414E16399A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 18 Dec 2024 19:05:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54BD21FBCA6;
	Wed, 18 Dec 2024 19:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="acKc9oco"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213CD1FA828;
	Wed, 18 Dec 2024 19:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734548724; cv=none; b=US/sOyLrbBagFIEwmypzrqrL/lV7OyprVUEP6dWGNM0GLGPfrJH/tz/5U72ITYO2u9X9/xi1g31d0iUd7QUzz96fBi0QsPMZzFZCJ1QWYXEclp7aUY++AKDj/2mG5xp3hOJYvxqE8ViCS/VTLRCgww/PVf20nl4afIYKyIa5CpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734548724; c=relaxed/simple;
	bh=M+CL49EgE9Yah/DzNEo18PKR2SXlGp+eNDAr3EsAFik=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=OuPx0S3/gdk8yk6MA1oV2UdU3TbSv06bxDzP2FKkouquY/njTEFxW9Eoj5eEZlotxRbRxmonNy+ZhDQer+sQ3VGSgjpkn9Uj93ynDsThcB3n9lTXPUgn7gZ8L9C27/+0TW788OqusRqKz2pQn5IyavgSPknFTo+rGNhECwoeEa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=acKc9oco; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D703C4CECD;
	Wed, 18 Dec 2024 19:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734548723;
	bh=M+CL49EgE9Yah/DzNEo18PKR2SXlGp+eNDAr3EsAFik=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=acKc9ocoU33QzqEeQWNLzm5aWw4LICdrJWuslUIstDYxvPmj1cTn8CWVyy9hcqcoH
	 3iJhAhZU/557qjFPrUM/wnAxrNMxoI5QDjxlZ3TlUFXDEtfsTb0d08GbELyCGfEMhJ
	 16f1eQbG6SgYQWWx4yrOOOwKuzWgMjfxj/HWIbWXsbloz/hpRrqBk7PKyB7kQaisgH
	 KEiJUJN9vHry01crcCsEyLQw1oQtbXxuU/RTJV7qzvVkcb8+19aHOuFw2VQfgDp3HS
	 DSdQjthz3JQuGkVv1u1AWPSUv+joFFELHFAXE5E+FlYVGo47h4iAvs8dVJCzP4HU9m
	 INH5A1qR7hmuQ==
Date: Wed, 18 Dec 2024 13:05:17 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, kernel@quicinc.com, 
 Will Deacon <will@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Wasim Nazir <quic_wasimn@quicinc.com>
In-Reply-To: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
References: <20241217064856.2772305-1-quic_wasimn@quicinc.com>
Message-Id: <173454864189.2147955.17810187271585604985.robh@kernel.org>
Subject: Re: [PATCH v4 0/7] arm64: qcom: Add support for QCS9075 boards


On Tue, 17 Dec 2024 12:18:49 +0530, Wasim Nazir wrote:
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
> v4:
>   - Replace dts to dtsi in Ride/Ride-r3 platform files
>   - Add thermal patch to differentiate between 9100 vs 9075
>   - Add proper abbreviation and update commit for 9100 vs 9075
>   - v3: https://lore.kernel.org/all/20241119174954.1219002-1-quic_wasimn@quicinc.com/
> 
> v3:
>   - Fix RB8 board compatible string
>   - v2: https://lore.kernel.org/all/20241115225152.3264396-1-quic_wasimn@quicinc.com/
> 
> v2:
>   - Remove unused dp nodes & update commit for ride vs ride-r3.
>   - v1: https://lore.kernel.org/all/20241110145339.3635437-1-quic_wasimn@quicinc.com/
> 
> Manaf Meethalavalappu Pallikunhi (2):
>   arm64: defconfig: enable cpu idle injection and cpu idle cooling
>     device
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
>  arch/arm64/configs/defconfig                  |   3 +
>  drivers/soc/qcom/socinfo.c                    |   1 +
>  include/dt-bindings/arm/qcom,ids.h            |   1 +
>  9 files changed, 680 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-rb8.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-ride.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs9075-thermal.dtsi
> 
> 
> base-commit: 4176cf5c5651c33769de83bb61b0287f4ec7719f
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


New warnings running 'make CHECK_DTBS=y qcom/qcs9075-rb8.dtb qcom/qcs9075-ride-r3.dtb qcom/qcs9075-ride.dtb' for 20241217064856.2772305-1-quic_wasimn@quicinc.com:

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
arch/arm64/boot/dts/qcom/qcs9075-ride-r3.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
arch/arm64/boot/dts/qcom/qcs9075-rb8.dtb: qcom,gpi-dma@a00000: $nodename:0: 'qcom,gpi-dma@a00000' does not match '^dma-controller(@.*)?$'
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






