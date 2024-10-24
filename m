Return-Path: <linux-arm-msm+bounces-35715-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1176E9AEC31
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 18:33:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C41EF283010
	for <lists+linux-arm-msm@lfdr.de>; Thu, 24 Oct 2024 16:33:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DB65A1F81B4;
	Thu, 24 Oct 2024 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JhS+crzC"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF5C11F81AC;
	Thu, 24 Oct 2024 16:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729787592; cv=none; b=iIv8YxCSffygIuDgAhcBVLvstH3GPYbHkw4gjS603tHXSNzlA4F+JOo/3Jp0eOyJltpl5IZjIQY3rTJk1EkMy10ntybMGdU3vJCo/5P91CtQsMrQj96cGnAt48Fw+dTYxmbWhe00DPV1L6QtSHLv2kjpJFNl9DUCwN3FlFAA74s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729787592; c=relaxed/simple;
	bh=XiSOQI9L3W8bBGL0+ZH+gBgnozd60J9irbYoRJGkyLk=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=jGg093C6I3IWT8fwOI86pCOkTn96D1xUu9PLetNnRL5KSwcFCdmklrqnSvhtiLmZkSyNkmW5glnzp4eRghAf00nJSymdbTIhPZDh/cNo1/TTHapiMs+x6ooI6yWH774W6TXt+cD8Q/PUdWTu8TJDvueV4KL4RwzF8fwpUp3bed4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JhS+crzC; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 174A4C4CEE5;
	Thu, 24 Oct 2024 16:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729787592;
	bh=XiSOQI9L3W8bBGL0+ZH+gBgnozd60J9irbYoRJGkyLk=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=JhS+crzC5WjZ1bk/8YkaW/80btpbgEu6tt+Z8a0GtYnHpqIplmBm8HP5h7aUUK8JH
	 7iAreT41hkYbg33PFRyTSBIOlX+zN8csId5C6S4ebR3sT6BBX3Gpf2iu7BffzvQfCq
	 u/YDzmEx0lGQxjTRSTK35qAM+wktKlC5NMY41o5tTaL2QWN5K8RFyiHDHj2A2mKFzV
	 j+G+jSeXtJS+/OzndZwACoCsXB6d7QjG+MEPpprZQ7/G9vmUOS0ZzUEzDGmCgwZCvq
	 SOKLGsfsb+VNy1vNc+Cj1Dp9djGXQvXqSPSAIIYpKdV8kQblHU/gKicCIarun3lpkx
	 CoIRnlsevEGSQ==
Date: Thu, 24 Oct 2024 11:33:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Melody Olvera <quic_molvera@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 =?utf-8?q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Satya Durga Srinivasu Prabhala <quic_satyap@quicinc.com>, 
 Trilok Soni <quic_tsoni@quicinc.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Lee Jones <lee@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, Will Deacon <will@kernel.org>
In-Reply-To: <20241021232114.2636083-1-quic_molvera@quicinc.com>
References: <20241021232114.2636083-1-quic_molvera@quicinc.com>
Message-Id: <172978739477.623395.5604249801475913676.robh@kernel.org>
Subject: Re: [PATCH 0/5] dts: qcom: Introduce SM8750 device trees


On Mon, 21 Oct 2024 16:21:09 -0700, Melody Olvera wrote:
> This series adds the initial device tree support for the SM8750 SoCs
> needed to boot to shell. This specifically adds support for clocks,
> pinctrl, rpmhpd, regulators, interconnects, and SoC and board
> compatibles.
> 
> The Qualcomm Technologies, Inc. SM8750 SoC is the latest in the line of
> consumer mobile device SoCs. See more at:
> https://www.qualcomm.com/content/dam/qcomm-martech/dm-assets/images/company/news-media/media-center/press-kits/snapdragon-summit-2024/day-1/documents/Snapdragon8EliteProductBrief.pdf
> 
> Dependencies:
> clks: https://lore.kernel.org/all/20241021230359.2632414-1-quic_molvera@quicinc.com/
> interconnects: https://lore.kernel.org/all/20241021231823.2635534-1-quic_molvera@quicinc.com/
> pinctrl: https://lore.kernel.org/all/20241021230414.2632428-1-quic_molvera@quicinc.com/
> regulators: https://lore.kernel.org/all/20241021230348.2632381-1-quic_molvera@quicinc.com/
> power domains: https://lore.kernel.org/all/20241021230333.2632368-1-quic_molvera@quicinc.com/
> misc bindings:
> - https://lore.kernel.org/all/20241021230427.2632466-1-quic_molvera@quicinc.com/
> - https://lore.kernel.org/all/20241021230500.2632527-1-quic_molvera@quicinc.com/
> - https://lore.kernel.org/all/20241021230439.2632480-1-quic_molvera@quicinc.com/
> - https://lore.kernel.org/all/20241021230449.2632493-1-quic_molvera@quicinc.com/
> 
> Jishnu Prakash (2):
>   dt-bindings: mfd: qcom,spmi-pmic: Document PMICs added in SM8750
>   arm64: dts: qcom: Add pmd8028 and pmih0108 PMIC dtsi files
> 
> Melody Olvera (3):
>   dt-bindings: arm: qcom: Document sm8750 SoC and boards
>   arm64: dts: qcom: Add base sm8750 dtsi and mtp and qrd dts
>   arm64: defconfig: Enable SM8750 SoC base configs
> 
>  .../devicetree/bindings/arm/qcom.yaml         |    7 +
>  .../bindings/mfd/qcom,spmi-pmic.yaml          |    2 +
>  arch/arm64/boot/dts/qcom/Makefile             |    2 +
>  arch/arm64/boot/dts/qcom/pmd8028.dtsi         |   56 +
>  arch/arm64/boot/dts/qcom/pmih0108.dtsi        |   62 +
>  arch/arm64/boot/dts/qcom/sm8750-mtp.dts       |  968 ++++++
>  arch/arm64/boot/dts/qcom/sm8750-qrd.dts       |  965 ++++++
>  arch/arm64/boot/dts/qcom/sm8750.dtsi          | 2903 +++++++++++++++++
>  arch/arm64/configs/defconfig                  |    4 +
>  9 files changed, 4969 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/pmd8028.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/pmih0108.dtsi
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-mtp.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750-qrd.dts
>  create mode 100644 arch/arm64/boot/dts/qcom/sm8750.dtsi
> 
> 
> base-commit: 63b3ff03d91ae8f875fe8747c781a521f78cde17
> prerequisite-patch-id: 5a4ad7a91dffc1c63a6513736cab88404937bbc5
> prerequisite-patch-id: f98e160b22d065fef3919e807102619ef80a63fd
> prerequisite-patch-id: 9df63975d51d61db536e843f261f837de613c0bb
> prerequisite-patch-id: dca6974344b25b6160e6a2680c438bc59da33374
> prerequisite-patch-id: 36ad7b3a06074897abcbe9521452ed0ec632e2eb
> prerequisite-patch-id: 255b9f24b2765ad6bb8fd5213b620ba2263d48f7
> prerequisite-patch-id: f458aa6a3d53924449be96609a0d1e65ec9f4854
> prerequisite-patch-id: 5bc1ec8226b52170508fd5ac30e31fec72e86f5a
> prerequisite-patch-id: 2b556803a12148cc12c1edcb5e143a454679a047
> prerequisite-patch-id: 0924872ce84c0f0011d53e98e58bf61213e9df43
> prerequisite-patch-id: 3a6538f98c3ce876d8acf3a0c55ac04897cfaf43
> prerequisite-patch-id: 7e047c63eff592833642eae37492b09e1ea7ed2d
> prerequisite-patch-id: cf8bef95f79c460b5b1c231a1122aa0173807a4d
> prerequisite-patch-id: ba4dd339acd73f885fe3d5f018ac620997583599
> prerequisite-patch-id: 5b930049e39fbd1ace2562d7870c2af764fe4cd4
> prerequisite-patch-id: 58acef79b9bf6c2e7d69d598d24502787eddc910
> prerequisite-patch-id: 369d52ee563f34eeca4a9c36e6d2b36b24eac635
> prerequisite-patch-id: e02a35925d37a2e61abbf240cc8963208f54e1c0
> prerequisite-patch-id: e4bf91d9a22d34c567eeab5b0f6fb90913ee908b
> --
> 2.46.1
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


New warnings running 'make CHECK_DTBS=y qcom/sm8750-mtp.dtb qcom/sm8750-qrd.dtb' for 20241021232114.2636083-1-quic_molvera@quicinc.com:

arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0: 'idle-state-name' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: domain-idle-states: cluster-sleep-0:compatible:0: 'domain-idle-state' was expected
	from schema $id: http://devicetree.org/schemas/power/domain-idle-state.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: pmic@7: 'eusb2-repeater@fd00' does not match any of the regexes: '(.*)?(wled|leds)@[0-9a-f]+$', '^adc-tm@[0-9a-f]+$', '^adc@[0-9a-f]+$', '^audio-codec@[0-9a-f]+$', '^battery@[0-9a-f]+$', '^charger@[0-9a-f]+$', '^led-controller@[0-9a-f]+$', '^mpps@[0-9a-f]+$', '^nvram@[0-9a-f]+$', '^pbs@[0-9a-f]+$', '^rtc@[0-9a-f]+$', '^temp-alarm@[0-9a-f]+$', '^typec@[0-9a-f]+$', '^usb-detect@[0-9a-f]+$', '^usb-vbus-regulator@[0-9a-f]+$', '^vibrator@[0-9a-f]+$', 'gpio@[0-9a-f]+$', 'phy@[0-9a-f]+$', 'pinctrl-[0-9]+', 'pon@[0-9a-f]+$'
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: rsc@16500000: 'qcom,drv-count' does not match any of the regexes: '^regulators(-[0-9])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l10-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: regulators-0: Unevaluated properties are not allowed ('vdd-l10-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: rsc@16500000: 'qcom,drv-count' does not match any of the regexes: '^regulators(-[0-9])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: regulators-0: Unevaluated properties are not allowed ('vdd-l1-supply', 'vdd-l10-supply', 'vdd-l4-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: regulators-0: Unevaluated properties are not allowed ('vdd-l10-supply' was unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: regulators-4: Unevaluated properties are not allowed ('vdd-s7-supply', 'vdd-s8-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/regulator/qcom,rpmh-regulator.yaml#
arch/arm64/boot/dts/qcom/sm8750-mtp.dtb: timer@16800000: #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#
arch/arm64/boot/dts/qcom/sm8750-qrd.dtb: timer@16800000: #size-cells: 1 was expected
	from schema $id: http://devicetree.org/schemas/timer/arm,arch_timer_mmio.yaml#






