Return-Path: <linux-arm-msm+bounces-58718-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 03B60ABD9A1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 15:37:59 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id DBE0E3AD7C3
	for <lists+linux-arm-msm@lfdr.de>; Tue, 20 May 2025 13:37:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4C042242922;
	Tue, 20 May 2025 13:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eLFwR5IV"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221922417F8;
	Tue, 20 May 2025 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747748262; cv=none; b=mUEiLtqACSG6TcYdq7XfgQxY/exDAbgPmmymydkizoVXIZFWlZm/jgGGGGJDaoNVdeN8vCdu0T//35ZMyleTef+KGFMYpLsrWh0tg/IyAhYCOTI+FByw4LkWhr9wwZ9acdbTbsQ3NDm5rKgn1CF3S9jGGMHHyMBgZPUVW7/qNsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747748262; c=relaxed/simple;
	bh=OoqTGaPDafd3Z5+WzKWI3+FAV5zGs4917GkPx9Qt/3s=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=iIjWgtTy1mo8BvBW4c73u6fUDduhwkcDT7BdQTjrNyKo+UiMJb+Cn1JfxdbSu/0Tth04a1LDFGrakKrqcAyci2IyTQCfgO1r6TWTXvPWxE/V0acMmOSA0lBb4NxiI15UYDAzQjmluJmHl9gqAQEYOFVZO/PgZyr8Be69XPix37U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eLFwR5IV; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 578D4C4CEE9;
	Tue, 20 May 2025 13:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747748259;
	bh=OoqTGaPDafd3Z5+WzKWI3+FAV5zGs4917GkPx9Qt/3s=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=eLFwR5IVB2yw+V2/E1V33hsvGbtKMsIVNviBcn5qFZS07SKPiyLUornMtOqulfRcz
	 PO9CgLaMSzlMcPeH8rrGatG79lxhZX5TU2ZHQSbzJkrB+m4S9kGFRvC8st9YkI9VXc
	 8IQDUcUOdfl4SNKsZVaINWl71bOIKOWkxNoUJce+hNF2/gz+HZwkmpjxnlgcylc62F
	 Y6VZ4EWJ/XMNaj9ZUb0tMPge7C3TspvKU/cCEV5wg9dODVS0FaPIWiPrzNksrkuh5h
	 rPsQRLuqh6bugy3sdzBCOSFN8UDcoxMtY0/KRSgRcgz97F7SWTeavbdjFhTSv3mmXV
	 JWE8r0p0ykZ+A==
Date: Tue, 20 May 2025 08:37:37 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, kernel@oss.qualcomm.com, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 cros-qcom-dts-watchers@chromium.org, devicetree@vger.kernel.org, 
 Mohammad Rafi Shaik <quic_mohs@quicinc.com>
To: Prasad Kumpatla <quic_pkumpatl@quicinc.com>
In-Reply-To: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
References: <20250520062618.2765109-1-quic_pkumpatl@quicinc.com>
Message-Id: <174774807358.443838.11357806964410009443.robh@kernel.org>
Subject: Re: [PATCH v3 0/7]  Enable audio on qcs6490-RB3Gen2 and
 qcm6490-idp boards


On Tue, 20 May 2025 11:56:11 +0530, Prasad Kumpatla wrote:
> From: Mohammad Rafi Shaik <quic_mohs@quicinc.com>
> 
> Audio support is now enabled on the qcs6490-RB3Gen2 and qcm6490-idp boards.
> The updates include adding the necessary audio device tree support and the required
> dependencies.
> 
> Both the qcs6490-RB3Gen2 and qcm6490-idp boards are derived from the same SoC
> platform. Therefore, the audio support changes are included in a single patch
> set for consistency and ease of maintenance.
> 
> Changes in [v3]:
> 	- Added protection-domain in gpr services.
> 	- Addressed the review commnets from Konrad Dybcio.
> 	- Fix DT binding errors reported by Rob Herring.
> 	- Link to V2 : https://lore.kernel.org/linux-arm-msm/20250429092430.21477-1-quic_pkumpatl@quicinc.com/
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
>  arch/arm64/boot/dts/qcom/qcm6490-idp.dts      | 179 ++++++++++++++++++
>  .../boot/dts/qcom/qcs6490-audioreach.dtsi     | 158 ++++++++++++++++
>  arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dts  |  80 ++++++++
>  arch/arm64/boot/dts/qcom/sc7280.dtsi          |  78 +++++++-
>  4 files changed, 494 insertions(+), 1 deletion(-)
>  create mode 100644 arch/arm64/boot/dts/qcom/qcs6490-audioreach.dtsi
> 
> 
> base-commit: 484803582c77061b470ac64a634f25f89715be3f
> --
> 2.34.1
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
 Base: using specified base-commit 484803582c77061b470ac64a634f25f89715be3f

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250520062618.2765109-1-quic_pkumpatl@quicinc.com:

arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[225, 8], [225, 7], [226]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sm7325-nothing-spacewar.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[225, 8], [225, 7], [226]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd-pro.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[225, 56, 1], [225, 102, 1], [225, 103, 1]] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clock-names: ['mclk', 'macro', 'dcodec'] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: codec@3370000 (qcom,sc7280-lpass-va-macro): clocks: [[204, 56, 1], [204, 102, 1], [204, 103, 1]] is too long
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-va-macro.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: pinctrl@33c0000 (qcom,sc7280-lpass-lpi-pinctrl): Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
	from schema $id: http://devicetree.org/schemas/pinctrl/qcom,sc7280-lpass-lpi-pinctrl.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-crd.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[237, 8], [237, 7], [238]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[237, 8], [237, 7], [238]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[222, 8], [222, 7], [223]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp2.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[222, 8], [222, 7], [223]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[237, 8], [237, 7], [238]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[237, 8], [237, 7], [238]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pmic@2 (qcom,pm8350c): pwm:nvmem: [[359, 360]] is too short
	from schema $id: http://devicetree.org/schemas/mfd/qcom,spmi-pmic.yaml#
arch/arm64/boot/dts/qcom/qcs6490-rb3gen2.dtb: pwm (qcom,pm8350c-pwm): nvmem: [[359, 360]] is too short
	from schema $id: http://devicetree.org/schemas/leds/leds-qcom-lpg.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[217, 8], [217, 7], [218]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-idp.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[217, 8], [217, 7], [218]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: audio-codec-0 (qcom,wcd9370-codec): 'qcom,micbias4-microvolt' is a required property
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
arch/arm64/boot/dts/qcom/qcm6490-idp.dtb: audio-codec-0 (qcom,wcd9370-codec): Unevaluated properties are not allowed ('qcom,micbias1-microvolt', 'qcom,micbias2-microvolt', 'qcom,micbias3-microvolt', 'qcom,rx-device', 'qcom,tx-device', 'reset-gpios', 'vdd-buck-supply', 'vdd-mic-bias-supply', 'vdd-rxtx-supply' were unexpected)
	from schema $id: http://devicetree.org/schemas/sound/qcom,wcd937x.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-herobrine-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[236, 8], [236, 7], [237]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-zombie-nvme.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[233, 8], [233, 7], [234]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[225, 8], [225, 7], [226]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-crd-r3.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[225, 8], [225, 7], [226]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[219, 8], [219, 7], [220]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-shift-otter.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[219, 8], [219, 7], [220]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r1-lte.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/sc7280-herobrine-villager-r0.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[234, 8], [234, 7], [235]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names:2: 'macro' was expected
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[228, 8], [228, 7], [229]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clock-names: ['mclk', 'npl', 'fsgen'] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
arch/arm64/boot/dts/qcom/qcm6490-fairphone-fp5.dtb: codec@3240000 (qcom,sc7280-lpass-wsa-macro): clocks: [[228, 8], [228, 7], [229]] is too short
	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#






