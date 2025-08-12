Return-Path: <linux-arm-msm+bounces-68768-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 615A4B22666
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 14:12:16 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 19E1D3A80D1
	for <lists+linux-arm-msm@lfdr.de>; Tue, 12 Aug 2025 12:12:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 503872EF662;
	Tue, 12 Aug 2025 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIRdm9aQ"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2F22EF656;
	Tue, 12 Aug 2025 12:12:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755000732; cv=none; b=a2GiHzEGvsh+be/cxYuUvK8TW/agL5kW9qpB+pl8LqXLInn6e3d4v0Kn3nT8P0t+ieoU0/RbxujvF3rO3bNA4y6djazRNsR6D0RNmKLqFUM0EmabA6lukDSOCzrBcw8wQ3gYEZj3bdMjzGmeREyYDQqbmQD/aVbGE217EUB7Rdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755000732; c=relaxed/simple;
	bh=iWEGZNePX3dcvoxdhsYKOr/evXy1Bi/gWovD04hMcT4=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=QLpjT4W+jwmcvIMqfIjvMfJrFgCyWXB6WWqZrIpM8/uEhQW+mgC93hwxj4WYm7nQBOOXhAPGZvAMXwi+dJfwav+Lt9j+a2RzGR95wZH2j89I5L6YuAZROsESwZUlqm86CEMgW0DveeGfv0XeIKWrKTZ7oTLAIY1Jw28IjP6WCfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIRdm9aQ; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 18391C4CEF0;
	Tue, 12 Aug 2025 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755000731;
	bh=iWEGZNePX3dcvoxdhsYKOr/evXy1Bi/gWovD04hMcT4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=tIRdm9aQ+lbOitXgVRW5ZlfMf287CXLopaS9ckwK0Oj1GEv2XUKNfvgJNkUU0/m8/
	 3UQrWIMA/2Ri0Sx3o393SwP2x59ijs2FLXRtXEV9ydCJM4+EkYq09WaXIcJoJcmrRn
	 JcGOetzpzvwPH0+PFldss+o4Wn9XhHi7DUDrOvKvozPycAm2jLqTxs2ncLOnU0FOHx
	 pxL45edtldj8hdkf38g7NIc4VRRURRqjQ4yJJrEJh7YpMCzJqRCYUOZzmeD0xiCSEu
	 a7W3QzR8muRDWt19fPV7UkENuOstU8X9I1U/2U29Wqt9qQnPTJd19LszILFS4ScRvz
	 QQ7o7y6WHsUMw==
Date: Tue, 12 Aug 2025 07:12:10 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, devicetree@vger.kernel.org, 
 phone-devel@vger.kernel.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
To: Cristian Cozzolino <cristian_ci@protonmail.com>
In-Reply-To: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
References: <20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com>
Message-Id: <175500063389.2957146.14812918350034377091.robh@kernel.org>
Subject: Re: [PATCH RESEND v4 0/3] Add initial device tree for Billion
 Capture+


On Mon, 11 Aug 2025 23:08:08 +0200, Cristian Cozzolino wrote:
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
> Changes in v4:
> - pick up tags (Rob);
> - Link to v3: https://lore.kernel.org/r/20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com
> 
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

New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20250811-rimob-initial-devicetree-v4-0-b3194f14aa33@protonmail.com:

arch/arm64/boot/dts/qcom/msm8953-flipkart-rimob.dtb: gpu@1c00000 (qcom,adreno-506.0): clock-names:5: 'alwayson' is not one of ['core', 'iface', 'mem', 'mem_iface', 'alt_mem_iface', 'gfx3d', 'rbbmtimer', 'rbcpr']
	from schema $id: http://devicetree.org/schemas/display/msm/gpu.yaml#






