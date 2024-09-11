Return-Path: <linux-arm-msm+bounces-31513-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5566597548B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 15:51:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 72FCB1C2311A
	for <lists+linux-arm-msm@lfdr.de>; Wed, 11 Sep 2024 13:51:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0229719F11E;
	Wed, 11 Sep 2024 13:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C9mLSEnF"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C984819F10A;
	Wed, 11 Sep 2024 13:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726062613; cv=none; b=fDEqzC8EZ4LD/JRrkn4ibJSO7vXnuQRkHuhqocr3nqvFrCRflvmy1bRClmPtEAscMvT2tPE3IVb/1fRc/sh35FlBdg3nVeuKktWJQzNiZ67hxbWpvnsNcL+aHOUrM4rwlyl5nPBAivBOwvq+CLWIJPvMdtOx3oOnXkaVGOhIcGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726062613; c=relaxed/simple;
	bh=wYsdocLzsrX8Sgm48gaz7cTnSul0At+itod/zabIoOU=;
	h=Date:Content-Type:MIME-Version:From:To:Cc:In-Reply-To:References:
	 Message-Id:Subject; b=aBU9nf/9tzNwPwwxrSPC8ZUHPWq1i+XzTcZz9gVg1q/W2zL18ndg5i8G3+mR9iEWJ5Qqif6vPFrUmE7Ix+XPM/cgRk13+J69UsHugYeOqNd9jIsFKJjFruWs7Ae0UOmpaNO1o8KqN/D+3ruS186O+JJC4NBjlm5kInqlpDQ5MgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C9mLSEnF; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B63C4CECE;
	Wed, 11 Sep 2024 13:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726062613;
	bh=wYsdocLzsrX8Sgm48gaz7cTnSul0At+itod/zabIoOU=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=C9mLSEnFhr+nx8dP8a7N7jr4B5FWnpm1pNgKZbvRR/SAVMO5WwJhZagTfehif0eSW
	 YdaOYbeguafk5SJQxOMB2uOmnPCMPLN1c1KC51RXMlJgBzYbRYDcAhZ9C19Na7B88H
	 h0w/v5Q5iffhYd44cmR+3Vhczin2G/aLrnGh6XH3NldK97dywbEFp/dOroq5aPR25N
	 Fnf0usfOFELuqbMvbbRyUGZAZQjrw1T4tRlBV5oLmgDXV6NCtSgEGGHLYt0G0pFxMf
	 YBB2AyQoVWGCNd9naFhCBl4SQUQvNmgrHrsPCP3+904UONphV2x6VO7pyoSeBXs6ZH
	 u/WTtJIdCVYVg==
Date: Wed, 11 Sep 2024 08:50:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org, 
 kernel@quicinc.com, Konrad Dybcio <konradybcio@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 devicetree@vger.kernel.org
In-Reply-To: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
References: <20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com>
Message-Id: <172606224532.90794.3646639531528428689.robh@kernel.org>
Subject: Re: [PATCH v2 0/4] arm64: dts: qcom: Add support for the QCS9100
 SoC and board


On Wed, 11 Sep 2024 19:10:54 +0800, Tengfei Fan wrote:
> Add QCS9100 SoC ID and board device trees support.
> QCS9100 is a variant of SA8775p, and they are fully compatible with each
> other.
> 
> Signed-off-by: Tengfei Fan <quic_tengfan@quicinc.com>
> ---
> Changes in v2:
> - Add SoC binding for add QCS9100 Ride and QCS9100 Ride Rev3
> - Update SoC binding patch commit message
> - Add QCS9100 Ride and Ride Rev3 board device tree patches
> - Link to v1: https://lore.kernel.org/r/20240806-add_qcs9100_soc_id-v1-0-04d14081f304@quicinc.com
> 
> ---
> Tengfei Fan (4):
>       dt-bindings: arm: qcom,ids: add SoC ID for QCS9100
>       soc: qcom: socinfo: add QCS9100 ID
>       dt-bindings: arm: qcom: Document qcs9100-ride and qcs9100-ride Rev3
>       arm64: dts: qcom: qcs9100: Add support for the QCS9100 Ride and Ride Rev3 boards
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml |  8 ++++++++
>  arch/arm64/boot/dts/qcom/Makefile               |  2 ++
>  arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dts    | 11 +++++++++++
>  arch/arm64/boot/dts/qcom/qcs9100-ride.dts       | 11 +++++++++++
>  drivers/soc/qcom/socinfo.c                      |  1 +
>  include/dt-bindings/arm/qcom,ids.h              |  1 +
>  6 files changed, 34 insertions(+)
> ---
> base-commit: 6708132e80a2ced620bde9b9c36e426183544a23
> change-id: 20240911-add_qcs9100_support-dbb22dd8b475
> 
> Best regards,
> --
> Tengfei Fan <quic_tengfan@quicinc.com>
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


New warnings running 'make CHECK_DTBS=y qcom/qcs9100-ride-r3.dtb qcom/qcs9100-ride.dtb' for 20240911-add_qcs9100_support-v2-0-e43a71ceb017@quicinc.com:

arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: rsc@18200000: 'power-domains' is a required property
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#






