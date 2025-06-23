Return-Path: <linux-arm-msm+bounces-61989-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id CF755AE33AB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 04:39:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id B9A087A5C4C
	for <lists+linux-arm-msm@lfdr.de>; Mon, 23 Jun 2025 02:38:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E13831C4A2D;
	Mon, 23 Jun 2025 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZAV8Ynl"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF81D1C3C14;
	Mon, 23 Jun 2025 02:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750646350; cv=none; b=IMn4WrKb/WXLY8EhcKMoN9e5P4ELr43hqVozq5RJnQ5cDSNv1nKcNxMjHsnxGtSH18ce1RO/aTl2mCyQM7fBOiDpjmhrYZc91SLAuZeBGwWuKfXWKesXx9nSoXPIcotCYG4iSKGMJbEhLVgLg70uu7W6zvJtyx8G/KCiTErdpUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750646350; c=relaxed/simple;
	bh=fs84C1G1+FmNn+OVT0EMKnIbg+clqFSAAki5rRyzH5U=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=E7A1WlWeA0bJZ7abzyBJFQ62ZTHKNXl0EPOE0wEU9IruYhk5rSV1CfA08tNbG3jN7J8VhKTCn2B3/7WJtQjyp6FWSrENVZvMXEVM5pOOYG03/QfLuWhOQKPs20wIlBuLI2EmU5WoeOIx5OIFyA6vGn3CMS9ZpUgxBfxYfXR2++Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZAV8Ynl; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25FD8C4AF0B;
	Mon, 23 Jun 2025 02:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750646350;
	bh=fs84C1G1+FmNn+OVT0EMKnIbg+clqFSAAki5rRyzH5U=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lZAV8Ynl4FwWQyjryBNGwtOqvxp+ocDacsZzN2pRkLPXfpn70TBwnMzV/dUZbn1St
	 3cA4i3dOaPOxgFNXmgeWw5J5j2KoqfKiIxbuulcFFsCn7M2jBIppNI2Ck0iwenLaYV
	 NVhri0/5N3ykbbDVl6lnXWKT+rYIZn5ft+1Mn1y2aV2tzfO6s/wZfosLLAwRXrq0D7
	 4oeavTGJbPy6IcS1IFtQAJo4Fi7AbjNdNJYwrWYn9NSlrC91RlTwjE11WidDyu0ZS6
	 g1EBBNt9dpXWZ56FWc6T9wCLbs5nUF5xVEeqFnRqoC6bKOCLlaHxDa8FcAICAh28cu
	 kpY5oKVyRvUWg==
Date: Sun, 22 Jun 2025 21:39:09 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 ~postmarketos/upstreaming@lists.sr.ht, Conor Dooley <conor+dt@kernel.org>, 
 phone-devel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, linux-kernel@vger.kernel.org
To: Cristian Cozzolino <cristian_ci@protonmail.com>
In-Reply-To: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
References: <20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com>
Message-Id: <175064594803.881117.14325620699553640752.robh@kernel.org>
Subject: Re: [PATCH 0/3] Add initial device tree for Billion Capture+


On Fri, 20 Jun 2025 23:51:38 +0200, Cristian Cozzolino wrote:
> Billion Capture+ is a handset using the MSM8953 SoC released in 2017
> and sold by Flipkart.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
> Cristian Cozzolino (3):
>       dt-bindings: vendor-prefixes: Add Flipkart
>       dt-bindings: arm: qcom: Add Billion Capture+
>       arm64: dts: qcom: msm8953: Add device tree for Billion Capture+
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 251 +++++++++++++++++++++
>  4 files changed, 255 insertions(+)
> ---
> base-commit: 0ff41df1cb268fc69e703a08a57ee14ae967d0ca
> change-id: 20250620-rimob-initial-devicetree-da86a5bffc8b
> 
> Best regards,
> --
> Cristian Cozzolino <cristian_ci@protonmail.com>
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
 Base: using specified base-commit 0ff41df1cb268fc69e703a08a57ee14ae967d0ca

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com:

arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dtb: gpu@1c00000 (qcom,adreno-506.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#






