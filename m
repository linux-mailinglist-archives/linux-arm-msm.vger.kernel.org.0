Return-Path: <linux-arm-msm+bounces-89485-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [IPv6:2600:3c04:e001:36c::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F90ED38B88
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 03:20:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 95494302DB29
	for <lists+linux-arm-msm@lfdr.de>; Sat, 17 Jan 2026 02:20:56 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4E25D2D9EC4;
	Sat, 17 Jan 2026 02:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ly19mmnz"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C571DED4C;
	Sat, 17 Jan 2026 02:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768616454; cv=none; b=QpnZzfSNE4odnv41dswQOdEljkUlE3HayJnIFH8xuvvozUhKTAllY19e5ZQc3WayqAhTU8CbZA7ZwjxwUxLy/cfpQIRWCdkchRiS5YPruNc/PKuxo86QdZHCcx5UsaqITBrSVOnNXptQ3ivFE993DFnLKe/vupIfUszkq0Jm0wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768616454; c=relaxed/simple;
	bh=INs+6hwwqSyR6Q/SwGX7iuQFBsJkkf6pJ1jUIyZQ6iw=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=slo4ZApyZulzOPw/5QbxYq6l5UORMKikPqz3bHICMb7G8nWL9s1ZhuJxQjHc8ry1eE0RiefPWAT5i2jvSwlQDmfZpVVvxrq/u5BHZNK6PJRNuNKYV6NEwMSllr60+2QQgNkfmkhGeouKO8hWWXU9hXm/9Bvze6rsp4g2v5ZygjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ly19mmnz; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9BB6DC116C6;
	Sat, 17 Jan 2026 02:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768616453;
	bh=INs+6hwwqSyR6Q/SwGX7iuQFBsJkkf6pJ1jUIyZQ6iw=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=Ly19mmnzSKl5PrNFIkOUwNJwbNc5gOxdZhJ95MGtchDMfarRg+N9NsbHKT8pKcRUF
	 bbnqUt6eGXwJHhsFwQi2eTavB2oK7SDSrVLIFP5jtilvBrIX1zFLQx63daovDsvcv9
	 xp1xYqCbCA0zU+HrKqZUurtCJ9sGH8yuslG38KPgKTzg+BisdwMcpZgQJiA/2Gtg42
	 a+6LarLDL40yUOe59X+AK6DG3wYl7PBXcMlvfTRQN+eZJQMwM79Nusk2ppnArkv9uM
	 DTe4shc831UISeo7tnJuN3dRkF+AKYKM33UL8oTBy6HV+feZnPRuoyQRTEg1wh0AV8
	 bAlG7TeVrZeSQ==
From: Rob Herring <robh@kernel.org>
Date: Fri, 16 Jan 2026 20:20:52 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: phone-devel@vger.kernel.org, Tony Luck <tony.luck@intel.com>, 
 devicetree@vger.kernel.org, Kees Cook <kees@kernel.org>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Gabriel Gonzales <semfault@disroot.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux@mainlining.org, Konrad Dybcio <konradybcio@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-hardening@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Biswapriyo Nath <nathbappai@gmail.com>
To: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
In-Reply-To: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
References: <20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org>
Message-Id: <176861636288.2528721.260536635040675678.robh@kernel.org>
Subject: Re: [PATCH v2 0/7] Initial Redmi Note 8T support and more


On Fri, 16 Jan 2026 16:54:42 +0100, Barnabás Czémán wrote:
> Redmi Note 8 and 8T are sibling devices the only difference
> is Redmi Note 8T have NFC.
> This patch series is commonizing Redmi Note 8 devicetree
> for a base for both devices.
> 
> The patch series also contains some fixes for Redmi Note 8:
> - Fix reserved memory ranges, they were wrongly defined.
> - Remove board-id, board-id is not neccessary for the bootloader.
> - Fix reserved-gpio-ranges the reserved ranges was wrongly
> defined what caused the device crash on the boot.
> - Remove unnecessary usb-extcon, gpio102 is related to DisplayPort
> what is not supported by these devices.
> - Use memory-region property for framebuffer.
> 
> Depends on:
> [1] https://lore.kernel.org/all/20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com/
> 
> Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
> ---
> Changes in v2:
> - Fix copyright in sm6125-xiaomi-ginkgo.dts as requested.
> - Use memory-region property for the framebuffer.
> - Add comment about the NFC.
> - Remove msm-id change in favor of [1].
> - Link to v1: https://lore.kernel.org/r/20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org
> 
> ---
> Barnabás Czémán (7):
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove board-id
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ranges
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Set memory-region for framebuffer
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
>       arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
>       dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
>       arm64: dts: qcom: Add Redmi Note 8T
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
>  arch/arm64/boot/dts/qcom/Makefile                  |   3 +-
>  .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 301 +++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 285 +------------------
>  arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  15 +
>  5 files changed, 320 insertions(+), 285 deletions(-)
> ---
> base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
> change-id: 20260111-xiaomi-willow-448552f02762
> prerequisite-message-id: <20251229142806.241088-2-krzysztof.kozlowski@oss.qualcomm.com>
> prerequisite-patch-id: 1bc49c0e2bec1a47667df776e1ab265b0699ea35
> 
> Best regards,
> --
> Barnabás Czémán <barnabas.czeman@mainlining.org>
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
 Deps: looking for dependencies matching 1 patch-ids
 Deps: Applying prerequisite patch: [PATCH RFT] arm64: dts: qcom: sm6125-ginkgo: Fix missing msm-id subtype
 Base: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)

Warnings in base: 266
Warnings after series: 272
New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/qcom/' for 20260116-xiaomi-willow-v2-0-4694feb70cdb@mainlining.org:

arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4ac0000 (qcom,geni-se-qup): #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #address-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml
arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dtb: geniqup@4cc0000 (qcom,geni-se-qup): #size-cells: 2 was expected
	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,geni-se.yaml






