Return-Path: <linux-arm-msm+bounces-51624-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 40956A652B5
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 15:19:29 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 627633B5176
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Mar 2025 14:18:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 96624242903;
	Mon, 17 Mar 2025 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="seHcm0PJ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65CCB241CB3;
	Mon, 17 Mar 2025 14:18:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742221115; cv=none; b=lAXNHUtNB72GXnWnLuAQV+JC/bVaxUewaUEHa3kaGfp+l2H4HcbCBiximGaOuC1ullmTPlevzA1nhZLeneX912UMJUTnypYWwlpzXNnIv56wxuHpLkD3wEtxFhEQ4dNjoszBr1gLjj1Z7u/srnQ9+IO5ZRu32oAUjhSvEL49Ijs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742221115; c=relaxed/simple;
	bh=tdxQTZrRgc3mlz+myXpPPoFEk1dsxHliy8RiXOrdono=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=L0KYM8Tm0l+aW2/tAm9tLuDTNPkM0LPxQxKBGAT+R83oESnB+PDAPtQNEN3KwU6PJGshI6H3IIVkJLdnDTpTUP8F6xYIM40rqgnipQE7u8z8IHJkHOyeBBrLH8RXABVhSOU/iy1yu2ySL3xQ2YHs6WGjM9NOex89YtuuFEJDoPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=seHcm0PJ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E97C4CEED;
	Mon, 17 Mar 2025 14:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742221114;
	bh=tdxQTZrRgc3mlz+myXpPPoFEk1dsxHliy8RiXOrdono=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=seHcm0PJa2FqSG5ipCCChaY6pVOGdWYyEKrZcSSQnchMPS9rLt/VKZ2r1wA6Nu6Og
	 OwZ8df8T9h1Gvb09HRK4ayq+HDHgXDtEQ9LUR/FKktkhiQyMEFXDdoFgCS0MDmm1JH
	 WSKH0ReYBRDsTKZCN9lemiIryaks5owBstQoE8CSzM3wPFNdw2xI/Jn50qvbiyQfYT
	 1ASTOkfjCdDBF8XJnm5PJjVeZYViuQBJMlgHAHxq71itjSFyTTeLLGiKdakM9ZHyV6
	 2czUHKacudytJubAqxZTQUv/I/FkhZDDdPsYtBJgGBPAwuDS5VK8CIuYdi2AitrNCw
	 X3fsryH02/VoA==
Date: Mon, 17 Mar 2025 09:18:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
 Ivan Belokobylskiy <belokobylskij@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz>
References: <20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz>
Message-Id: <174221818190.3957236.3364090534153729086.robh@kernel.org>
Subject: Re: [PATCH v5] ARM: dts: nexus4: Initial dts


On Sun, 16 Mar 2025 23:16:55 +0100, David Heidelberg wrote:
> From: Ivan Belokobylskiy <belokobylskij@gmail.com>
> 
> Add initial support for LG Nexus 4 (mako).
> 
> Features currently working: regulators, eMMC, and volume keys.
> 
> Signed-off-by: Ivan Belokobylskiy <belokobylskij@gmail.com>
> Co-developed-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
> Changes in v5:
> - Sorted nodes alphabetically.
> - Link to v4: https://lore.kernel.org/r/20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz
> 
> Changes in v4:
> - Sorted regulators and added regulators compatible.
> - Corrected pmic include and references.
> - Moved &rpm outside of / node.
> - Moved and simplify pm8921 keypad.
> - Added chasis-type.
> - Dropped incomplete WiFi node, will be provided in future
>   contributions.
> - Link to v3: https://lore.kernel.org/r/20250309-lg-nexus4-mako-v3-1-1dc2807df296@ixit.cz
> 
> Changes in v3:
> - rebased against next-20250307
> - dropped backlight until driver gets converted to DT
> 
> Changes in v2:
> - lge vendor doesn't exist anymore, rename to lg
> - sdcc@ to mmc@ to comply with dt-schema
> ---
>  arch/arm/boot/dts/qcom/Makefile                    |   1 +
>  .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 341 +++++++++++++++++++++
>  2 files changed, 342 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250316-lg-nexus4-mako-v5-1-79feae815a85@ixit.cz:

arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: hwmutex: 'syscon' does not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: soc: replicator: 'ranges' is a required property
	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: syscon@1200000: compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: timer@200a000: 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/watchdog/qcom-wdt.yaml#
arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: sps-sic-non-secure@12100000: compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: rpm@108000: 'clock-controller' does not match any of the regexes: '^regulators(-[01])?$', 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpm.yaml#
arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: syscon@5700000: compatible: ['syscon'] is too short
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
arch/arm/boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#






