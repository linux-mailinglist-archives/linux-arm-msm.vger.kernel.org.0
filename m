Return-Path: <linux-arm-msm+bounces-51084-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 64683A5D430
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 02:47:19 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 30168189AC3B
	for <lists+linux-arm-msm@lfdr.de>; Wed, 12 Mar 2025 01:47:27 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 314C813C9D4;
	Wed, 12 Mar 2025 01:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K9XtLSkI"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02C6D13B58A;
	Wed, 12 Mar 2025 01:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741744034; cv=none; b=InDkSzaXC70Gb0nqnTTcWI6fLPnX+70o2amTYlAVJPTBT8UfbiBSPoOM3Lz3mNIqa19MM3Ad+HspgTJ2/DAmuhRE91Cuqr3N/OrkVkhhj+tXxT3FsnuD6mv9iAhfwInT6nxQG7sfOWpIpCdnK5KScrFP+LwM87DzjgKfPakXIhw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741744034; c=relaxed/simple;
	bh=SnkbAMpzp9910fdInL477n0gyulfqfI41ZGog+JM9A8=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=a4ZdSEGPtasp8cMdIZuqd4NOsuv2cVPP1J2lNNGc17Nvdwp0mNclSzSJAXx6hWHKFKOyWGlCpw6RvKXwGVhqp1QINUcA33Da1fMwq1EZ5fbqlkWWFEzeCR+gN5I1uz+j14bYCtSgA1CgLwCTTd9iTcua7tEU8y/6wblL0jh/pHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K9XtLSkI; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 543E6C4CEED;
	Wed, 12 Mar 2025 01:47:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741744033;
	bh=SnkbAMpzp9910fdInL477n0gyulfqfI41ZGog+JM9A8=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=K9XtLSkIAAkkmMMbkpC+eN7MsCEL5wkZK+GQE7KhFNaJI/+b/H3ALzPnRaafKCTCs
	 FzSYts4NTlyKO7ktquUmErIjAwAg348ax8jZEWZhnkgcZGe7d6y8b+RedUe0qhZwOh
	 vBex57VaYRjjSBGIWOFnTcjp9/1Cavg9K21ksjMTWN/wFo1G4RI4O6kRtUTCF1qev5
	 Y9Uoy0hWiynEV14IXCXQwq5LBNuK9NlQ54EMb2NNYx5FgyZW7u0gYLQPaFXJ79U+5O
	 8vtwSvHSxbdN0yE2ctqy2YdDh54D3S6KJYwjO+STxLniC3L4wubI4JhJ0C9hDwwtbA
	 T/ubrT4+iDi+g==
Date: Tue, 11 Mar 2025 20:47:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-hardening@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, linux-arm-msm@vger.kernel.org, 
 Ivan Belokobylskiy <belokobylskij@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 devicetree@vger.kernel.org
To: David Heidelberg <david@ixit.cz>
In-Reply-To: <20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz>
References: <20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz>
Message-Id: <174174398220.182780.15077964368844189000.robh@kernel.org>
Subject: Re: [PATCH v4] ARM: dts: nexus4: Initial dts


On Tue, 11 Mar 2025 17:10:02 +0100, David Heidelberg wrote:
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
>  .../boot/dts/qcom/qcom-apq8064-lg-nexus4-mako.dts  | 344 +++++++++++++++++++++
>  2 files changed, 345 insertions(+)
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


New warnings running 'make CHECK_DTBS=y for arch/arm/boot/dts/qcom/' for 20250311-lg-nexus4-mako-v4-1-3916c8ec7edb@ixit.cz:

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






