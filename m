Return-Path: <linux-arm-msm+bounces-62225-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 3788AAE66F8
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 15:48:51 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 735AA167F0D
	for <lists+linux-arm-msm@lfdr.de>; Tue, 24 Jun 2025 13:48:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1F65B2C325C;
	Tue, 24 Jun 2025 13:47:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aq7N0ZLd"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCE982C325B;
	Tue, 24 Jun 2025 13:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772855; cv=none; b=bsvMxiL0qruqCMp778z5ycOnB/WP/5NFuQBGkVMHtjLl3ZrvQQ5FZFEZl/ZKp06+it6SPKz9LNQ3YTiFRuxvH8ZHuv7R7v2CrkjTd5ql9n4vHnQtr/izY6yFX6q0hqujyE0p45ePAJWNxtN/bGph0/CQpXB6BGjMExewDXNjmm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772855; c=relaxed/simple;
	bh=UEg6wQSAHePDtn5dg6MmJ4Z93KBz5q6wdT/Iwd0Dq8M=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=TOpnAt8s7K4/w3EhXllffEg/LZWUfopI1F+wB5O1u63ueQPv6cB/kMfWaJ5I2huqf6qAcpqddrlW6KqiZA4eXLdk9Jir6XwQBnyLq+301/mq1T1KdiIfh3QB8l0wwEbgB22GE5BR964xmltWVbH4snbLkd+zCxriJ+jwO+UmdQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aq7N0ZLd; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 674C5C4CEE3;
	Tue, 24 Jun 2025 13:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750772854;
	bh=UEg6wQSAHePDtn5dg6MmJ4Z93KBz5q6wdT/Iwd0Dq8M=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=aq7N0ZLd56t0DIMXduDxRGE2Ue3ycOz6dAm+8/tNr19JYWNOpvDVOQ4LmD9UDlX1W
	 trAKW2P54up6emSPMPVeyy0ez6xbBnrTzFBMoZlDoEc1+kdCQVsKjUtzeLj/Xe1Pws
	 iNmyZBtmGz/gRMNiQBmMt5d2e023yOLNhAL3PLJPv3i+EuP9XO14zICWwqZ968Qr1C
	 Bz6tWa2myoOHoso+kZvrt3zk1ClAJjqkmDvFqAZASEGxKliPtax1EKeml13ed4VPN6
	 +tshzurwrTD89fKRs+QTbIg89cdLCJnuMZRADsdPduQKrV3GocAaQcAAYl6IZ3ESZJ
	 nOvUzqqzf5flA==
Date: Tue, 24 Jun 2025 08:47:33 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Bjorn Andersson <andersson@kernel.org>, devicetree@vger.kernel.org
To: Cristian Cozzolino <cristian_ci@protonmail.com>
In-Reply-To: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
References: <20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com>
Message-Id: <175077273896.3865908.3372427223791553913.robh@kernel.org>
Subject: Re: [PATCH v2 0/3] Add initial device tree for Billion Capture+


On Tue, 24 Jun 2025 03:20:04 +0200, Cristian Cozzolino wrote:
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
> Changes in v2:
> - (patch 3/3):
>   - add unit address and label to qseecom (Luca);
>   - reorder properties alphabetically in gpio-keys node (Konrad);
>   - fix hex values in reg address and size cells: from 0x00 to 0x0 (Konrad);
>   - add regulator-allow-set-load property to regulators supplying sdhc1/sdhc2.
> - Link to v1: https://lore.kernel.org/r/20250620-rimob-initial-devicetree-v1-0-8e667ea21f82@protonmail.com
> 
> ---
> Cristian Cozzolino (3):
>       dt-bindings: vendor-prefixes: Add Flipkart
>       dt-bindings: arm: qcom: Add Billion Capture+
>       arm64: dts: qcom: msm8953: Add device tree for Billion Capture+
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   1 +
>  .../arm64/boot/dts/qcom/msm8953-flipkart-rimob.dts | 255 +++++++++++++++++++++
>  4 files changed, 259 insertions(+)
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com:

arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dtb: gpu@1c00000 (qcom,adreno-506.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#






