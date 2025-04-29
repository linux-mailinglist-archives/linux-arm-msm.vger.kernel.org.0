Return-Path: <linux-arm-msm+bounces-56150-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEE2AA0F59
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 16:44:56 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 517FD16EC6E
	for <lists+linux-arm-msm@lfdr.de>; Tue, 29 Apr 2025 14:44:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 91DE921A94D;
	Tue, 29 Apr 2025 14:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U3qkU+K7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6552E21A458;
	Tue, 29 Apr 2025 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937863; cv=none; b=PHWEfXPaWXA74dYKiP/jgxfxGL677rfpdSmoxJETj0s276byxvU2q0FPCcWRnrSxJ2IwRKHRJH51/iZk2X0SQ7gOe/JeSl6TbteMBGBeRtMPM/3sRJzd1iNp9kavrfuqfBNoYVJSqEh9h5D7ZMVZ/uPJjneHDZE1H3egDY/gmzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937863; c=relaxed/simple;
	bh=R4vOR05JknVZs/NEdQonvDnMNWYntCOc6VcKMtVxqJw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=GJBDBgYrufFKJQx13f+7UXO6JWH4DQpl/AaCllvmOPHkM7v580FANwGOzJdcvqgCoAwv1S3a7kgisKglYGstVDMu6PMQrc5iajgtUvIjnOChdNHCTKeXt4mGLBRLDSaWhoSLbU5au4Df6SIxq/SmyhviEr3tPZ7kFTvQqOqHT3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U3qkU+K7; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C433C4CEED;
	Tue, 29 Apr 2025 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745937862;
	bh=R4vOR05JknVZs/NEdQonvDnMNWYntCOc6VcKMtVxqJw=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=U3qkU+K79naAJmFuz8MJ7r/8S9hiBRyd+TL5eht1RwfKDkdD23ArvXkdt+U6bwYrr
	 ybALSM986SrUyaFvADhc89prDZDiGrgeeuC8Qg3NyxWu7dRtmEKmgy7Dn4mbGddzqq
	 iQGIEAbrJNKD6bQilKdUBwBz9tqUrUHag8w6sXnnO/sDy/vyFm7dVR8bIMTqtQLOdz
	 Gm2S8rzlM55t6jCuSDNgFgr5VRlUtjTyM0xNxei2uL8ijRXYL+Rx0VqqdQ17kCpxG2
	 yZtz3VLfojWL5VLB+aFAn7dAOYMeS+wGXztSDin4FCE+D2Ljyq+AZiZrt1i/uvUJSW
	 lMYl9UkMGeCsw==
Date: Tue, 29 Apr 2025 09:44:21 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, cros-qcom-dts-watchers@chromium.org, 
 linux-arm-msm@vger.kernel.org, kernel@oss.qualcomm.com, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
References: <20250429092430.21477-1-quic_pkumpatl@quicinc.com>
Message-Id: <174593770466.4057779.8829493778157292892.robh@kernel.org>
Subject: Re: [PATCH v2 0/7] Enable audio on qcs6490-RB3Gen2 and qcm6490-idp
 boards


On Tue, 29 Apr 2025 14:54:23 +0530, Prasad Kumpatla wrote:
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
> The updates include adding the necessary audio device tree support and the required
> dependencies.
> 
> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC
> platform. Therefore, the audio support changes are included in a single patch
> set for consistency and ease of maintenance.
> 
> Changes in [v2]:
> 	- Created dtsi file to handle common audio nodes to support Audioreach.
> 	- Addressed the review comments.
> 	- Link to V1 : https://lore.kernel.org/linux-arm-msm/20250317054151.6095-2-quic_pkumpatl@quicinc.com/
> 
> Mohammad Rafi Shaik (7):
>   arm64: dts: qcom: qcs6490-audioreach: Add gpr node
>   arm64: dts: qcom: sc7280: Add WSA SoundWire and LPASS support
>   arm64: dts: qcom: qcs6490-audioreach: Modify LPASS macros clock
>     settings for audioreach
>   arm64: dts: qcom: qcs6490-rb3gen2: Add WSA8830 speakers amplifier
>   arm64: dts: qcom: qcs6490-rb3gen2: Add sound card
>   arm64: dts: qcom: qcm6490-idp: Add WSA8830 speakers and WCD9370
>     headset codec
>   arm64: dts: qcom: qcm6490-idp: Add sound card
> 
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 250 ++++++++++++++++++
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     |  99 +++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  | 119 +++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  70 ++++-
>  4 files changed, 537 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> 
> 
> base-commit: 33035b665157558254b3c21c3f049fd728e72368
> --
> 2.17.1
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
 Base: using specified base-commit 33035b665157558254b3c21c3f049fd728e72368

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250429092430.21477-1-quic_pkumpatl@quicinc.com:

arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[224, 8], [224, 7], [225]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[224, 8], [224, 7], [225]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[224, 56, 1], [224, 102, 1], [224, 103, 1]] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[203, 56, 1], [203, 102, 1], [203, 103, 1]] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[221, 8], [221, 7], [222]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[221, 8], [221, 7], [222]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[360, 361]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[360, 361]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: sound (qcom,qcm6490-idp-sndcard): '#address-cells', '#size-cells' do not match any of the regexes: '.*-dai-link$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: sound (qcom,qcs6490-rb3gen2-sndcard): '#address-cells', '#size-cells' do not match any of the regexes: '.*-dai-link$', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/sound/qcom,sm8250.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[216, 8], [216, 7], [217]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[216, 8], [216, 7], [217]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: audio-codec-0 (qcom,wcd9370-codec): 'qcom,micbias4-microvolt' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: audio-codec-0 (qcom,wcd9370-codec): Unevaluated properties are not allowed ('qcom,micbias1-microvolt', 'qcom,micbias2-microvolt', 'qcom,micbias3-microvolt', 'qcom,rx-device', 'qcom,tx-device', 'reset-gpios', 'vdd-buck-supply', 'vdd-mic-bias-supply', 'vdd-rxtx-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[235, 8], [235, 7], [236]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[235, 8], [235, 7], [236]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[232, 8], [232, 7], [233]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[218, 8], [218, 7], [219]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[218, 8], [218, 7], [219]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[224, 8], [224, 7], [225]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[224, 8], [224, 7], [225]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[223, 8], [223, 7], [224]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[223, 8], [223, 7], [224]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#






