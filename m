Return-Path: <linux-arm-msm+bounces-32939-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B55AA98D4DA
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 15:25:00 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E6EE21C21C0E
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Oct 2024 13:24:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 020751D0794;
	Wed,  2 Oct 2024 13:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b="r4y8rZGE"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from layka.disroot.org (layka.disroot.org [178.21.23.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF5F1D042F;
	Wed,  2 Oct 2024 13:24:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.21.23.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727875475; cv=none; b=CC2jYHvJ2ABcrpmtLOvXXvPZXdhpEoDqIQEbMai500hna1GUn4EffVYEBQvnXjuAebUrheWtiRSSKcaC0Nf8fU1YjT8u2aJlFf+lAALjhBSJvr0XcbKDhsqnlg9oZrW9AiXkXLkwGp/DOuMu6Ux2uuooyKQOhBfxjLn9SZZYYDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727875475; c=relaxed/simple;
	bh=Wz6iTSruwnHAAEBk/YB3ed7RP9KTWXX2AA+VGefohIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=itoYXF1zX7+jAVb4PapB3JSZFsiMu0/PxuN12MExvj1W/ZUVg+rwUsRpYQ3Ex18ToNIfWySGTriEceJwu8lzkBymHx+woeGD/sJXyo2DXBZdRbPL6/LNREAzepOgNsu2WHBrq1/nBL4UsS27npCgKzlV9DW1wNc9MFPNIV6rfdM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me; spf=pass smtp.mailfrom=getgoogleoff.me; dkim=pass (2048-bit key) header.d=getgoogleoff.me header.i=@getgoogleoff.me header.b=r4y8rZGE; arc=none smtp.client-ip=178.21.23.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=getgoogleoff.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=getgoogleoff.me
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6606B23DBB;
	Wed,  2 Oct 2024 15:24:30 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9hcqAOSySv0C; Wed,  2 Oct 2024 15:24:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=getgoogleoff.me;
	s=mail; t=1727875469;
	bh=Wz6iTSruwnHAAEBk/YB3ed7RP9KTWXX2AA+VGefohIQ=;
	h=From:To:Cc:Subject:Date;
	b=r4y8rZGEQBrA6YITwcgXb8GgbbyeBCaERDbNl3TUBYG2A44H+uMSPWbBmOkdb4ZX9
	 eId8I+vhcKTjf18XIQZi57sumUUX5+CkVThwC9aa1VHq/rLNwobfz078VQ8WJEPiSH
	 GU50+XJdOL+jUZfGO+HYPzL++J9uz6jVJb/ruifdZAQsEm1LMVG/hpgR40Mqr4NXcX
	 M9/6ZXyVHbPi2pmo5GFtyTWtATw4afdqGig9NxvFnDIINDx6MKhm/iXswMlUdKknu2
	 YIOGPgZpl5dxV0qZEthqXMJGy6wzJ1a0QZi63TWI+i6wS8L2ND1f1LMNw4qxrNLQ3y
	 fXwmu7OjJQNBQ==
From: Karl Chan <exxxxkc@getgoogleoff.me>
To: linux-arm-msm@vger.kernel.org
Cc: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Karl Chan <exxxxkc@getgoogleoff.me>
Subject: [PATCH v2 0/3] Initial Support for Linksys EA9350 V3 (linksys-jamaica)
Date: Wed,  2 Oct 2024 21:22:59 +0800
Message-ID: <20241002132302.31608-1-exxxxkc@getgoogleoff.me>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree source for Linksys EA9350 V3 which is a WiFi router based on the IPQ5018 SoC.

As of now , only the UART,USB,USB LED,buttons is working.The front PWM LED require the IPQ PWM driver.Therefore the PWM LED isn't configed in the tree.

Also The original firmware from Linksys can only boot ARM32 kernels.

As of now There seems to be no way to boot ARM64 kernels on those device.

However, it is possible to use this device tree by compiling an ARM32 kernel instead.

Signed-off-by: Karl Chan <exxxxkc@getgoogleoff.me>
---
Changes in v2:
  - reorder the properties in the tree to follow the
    usual order pointed out by Krzysztof Kozlowski
  - Add the missing word to the cover letter
  - Link to v1: https://lore.kernel.org/linux-arm-msm/20241002120804.25068-1-exxxxkc@getgoogleoff.me/T/#t
---
Karl Chan (3):
  dt-bindings: arm: qcom: add Linksys EA9350 V3
  arm64: dts: qcom: add Linksys EA9350 V3
  arm: dts: qcom-ipq5018-linksys-jamaica: Include dts from arm64

 .../devicetree/bindings/arm/qcom.yaml         |   1 +
 arch/arm/boot/dts/qcom/Makefile               |   1 +
 .../dts/qcom/qcom-ipq5018-linksys-jamaica.dts |   2 +
 arch/arm64/boot/dts/qcom/Makefile             |   1 +
 .../boot/dts/qcom/ipq5018-linksys-jamaica.dts | 107 ++++++++++++++++++
 5 files changed, 112 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-ipq5018-linksys-jamaica.dts
 create mode 100644 arch/arm64/boot/dts/qcom/ipq5018-linksys-jamaica.dts

-- 
2.46.1


