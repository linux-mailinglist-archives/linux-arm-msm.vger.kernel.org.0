Return-Path: <linux-arm-msm+bounces-62689-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B24EAEA768
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 21:53:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D008E17BF2A
	for <lists+linux-arm-msm@lfdr.de>; Thu, 26 Jun 2025 19:53:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67D112F0C5F;
	Thu, 26 Jun 2025 19:53:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lPaB/mxw"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363572F0055;
	Thu, 26 Jun 2025 19:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750967602; cv=none; b=KE+71AAZS49g+Qw4JTJLqWlK4Rim92mKHTLteVduPLJhtXHn/zus+aMjf83I3A8pzhpYCyp134p7SFsxAtZkDoEAPla1zWTec0xYcBjxU7jRjo41L5zYhQc4I/Zbs+FvHz7vt3pRHhGFL6TIbO5quSvwpgOy2mYKRcI8K0VyH5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750967602; c=relaxed/simple;
	bh=3102csKV0qk6voV51MLhEB4N+SYWBLbDze9z6LLrQTY=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=gX0046dEqoQslQA9vR0ownFPosL1r4ahzhRrvNa1Q2XQ3j2RUHNxR8+d2aY8hHanEn0JAquUNckhW3/vHcvQWNzOZFgJFEi1mnLJ+aCCbpAPcgo7rmvec5Ht56ndUTc8S/rS8eEEbBn02FbmyGfsBlGTXQqJlQ8dVwdWWrNwbcI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lPaB/mxw; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D454C4CEF0;
	Thu, 26 Jun 2025 19:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750967601;
	bh=3102csKV0qk6voV51MLhEB4N+SYWBLbDze9z6LLrQTY=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=lPaB/mxwZsS3UmvJMcbgXPS2qNa6wiA1EJFZDjqHTdz/53VQZXTRxKnNUwfqwTp4G
	 c/XA1T0jBjRx+neRvXbfmuZ9/yB6gP6T6U5rEiejOiJqXl/aSb0+Xvpgfbn+M9Bgi/
	 YpTyjhm8NpmUkoYwK0Hsyak4qwA4vidpDjfe8vVqIcg8VTOPOstl/xyo9+aVqcl+ef
	 yjgUpVAgeV+1f4JZv/GqKY9WpRqJCCLYbsuA8FvLDiPPQP0oqCliztZTV5Fblg37z1
	 j+AU8Z4CHtVAd2RWcI8Jsp9xuL42nf9O2YZgsNR0wUdzx39ts/kfjdyDYe2uMfg6qT
	 r4k5LVm9ANgwQ==
Date: Thu, 26 Jun 2025 14:53:20 -0500
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
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org
To: Cristian Cozzolino <cristian_ci@protonmail.com>
In-Reply-To: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
References: <20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com>
Message-Id: <175096753958.717956.3150907167726764280.robh@kernel.org>
Subject: Re: [PATCH v3 0/3] Add initial device tree for Billion Capture+


On Thu, 26 Jun 2025 00:04:25 +0200, Cristian Cozzolino wrote:
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
> Changes in v3:
> - (patch 3/3): pick up tag (Konrad);
> - Link to v2: https://lore.kernel.org/r/20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com
> 
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com:

arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dtb: gpu@1c00000 (qcom,adreno-506.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#






