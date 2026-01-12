Return-Path: <linux-arm-msm+bounces-88620-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DFF9D15294
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 21:14:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 811F7303E403
	for <lists+linux-arm-msm@lfdr.de>; Mon, 12 Jan 2026 20:13:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C600632D422;
	Mon, 12 Jan 2026 20:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="srsdFf7y";
	dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b="8UkXZsci"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CFD832B9A2;
	Mon, 12 Jan 2026 20:13:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=5.75.144.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768248838; cv=none; b=nBVHvm5LVqGSfRbduKGA2Suq90hndr/+CihwsjivCwNLQ4DKfFMXvyHwMTR5rCnB7lcwHB9o53lXwsfaMP3ZoR+daC/SoPm89Ckrr/q221iV/sHygaVvJS+kiQjj+Nn+zpp4A4hyWR1YIsTP594DRiYVVOudadWGcOrhVtopgBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768248838; c=relaxed/simple;
	bh=llQc7V0Zs7DL/iz8nU/dhM41OW2SMa7CYw2K9d9w/pQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=OxOYV9J9zER3WT8aDWm+nRO6iZiJQ8OPouVTKP5MoRKm4WNVY+d1stSkA/flq4wI32k79Y5U7PkaFPHJ7ZTX1u4ZF9voEE39jUl4tWHAM5uwL4vQfW0f4NYRdw33Yz7VEXu54lmTZ07Lvz5v8lnU3PqNU1dN4CWD/IzGYSXKBWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org; spf=pass smtp.mailfrom=mainlining.org; dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=srsdFf7y; dkim=permerror (0-bit key) header.d=mainlining.org header.i=@mainlining.org header.b=8UkXZsci; arc=none smtp.client-ip=5.75.144.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1768248814; bh=4bW11u95KX08C+OMgjgtiKz
	F+ITZerhLKulxVrH9D4U=; b=srsdFf7yHyMlS8tQVDlfj4ACa7xaTYnZKnVbL7B/1I9KxM9cuw
	52jHjJ0F9RDbOqQmv5l9f4To5cyYdoKN5X+n57xELSn1l8XBbG32bAa0B4WDE0CeN8M04RFsuJb
	Ds/VTFrC8+Qi8ilpEy8zsrYJP9ByrdM1YHuXrlueQ+8B6tuhaudv3oe3qKl2UlJH0xreU6Sv6Bt
	WJrpdRMUJSHnJBXnUl4wJySKZoeij3Cy9q/sclp2aUlWrtTGI1YMVm66TW6apeD8kSMM6hgy0C+
	DwLZyDRjbvgd81UZGPs7o3E6nrUQsWOaIOS5/RnWTqMkZwAOwz+x6Cq2xHDI7YfHv8w==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Date:Subject:From; t=1768248814; bh=4bW11u95KX08C+OMgjgtiKz
	F+ITZerhLKulxVrH9D4U=; b=8UkXZsciYMcv2RypcpDUVa2sLc9rjKgVj6nSYCgShNz11cjdkf
	zHe0fA/dqxEcEVQsMHgtubn32lXr4jgUleBw==;
From: =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
Subject: [PATCH 0/6] Initial Redmi Note 8T support and more
Date: Mon, 12 Jan 2026 21:13:23 +0100
Message-Id: <20260112-xiaomi-willow-v1-0-8e4476897638@mainlining.org>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDQ0ND3YrMxPzcTN3yzJyc/HJdExMLU1OjNAMjczMjJaCegqLUtMwKsHn
 RsbW1AEtN0lpfAAAA
X-Change-ID: 20260111-xiaomi-willow-448552f02762
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Gabriel Gonzales <semfault@disroot.org>, 
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>, 
 Biswapriyo Nath <nathbappai@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
 phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht, 
 linux@mainlining.org, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1768248812; l=1673;
 i=barnabas.czeman@mainlining.org; s=20240730; h=from:subject:message-id;
 bh=llQc7V0Zs7DL/iz8nU/dhM41OW2SMa7CYw2K9d9w/pQ=;
 b=KsozJuwNsnZ61hcY2e2+SrRpBh0JeUTWHDpas+EXd0+qRMsAfYfKVA+gxnObYOB7vdaEQTydt
 8LxzmRKiSFaBuuBCJLrLRu7Q7ar8KM/oPWRLj2ODO29F5TC1fFwO6Jy
X-Developer-Key: i=barnabas.czeman@mainlining.org; a=ed25519;
 pk=TWUSIGgwW/Sn4xnX25nw+lszj1AT/A3bzkahn7EhOFc=

Redmi Note 8 and 8T are sibling devices the only difference
is Redmi Note 8T have NFC.
This patch series is commonizing Redmi Note 8 devicetree
for a base for both devices.

The patch series also contains some fixes for Redmi Note 8:
- Fix reserved memory ranges, they were wrongly defined.
- Fix msm-id and remove board-id, board-id is not neccessary
for the bootloader.
- Fix reserved-gpio-ranges the reserved ranges was wrongly
defined what caused the device crash on the boot.
- Remove unnecessary usb-extcon, gpio102 is related to DisplayPort
what is not supported by these devices.

Signed-off-by: Barnabás Czémán <barnabas.czeman@mainlining.org>
---
Barnabás Czémán (6):
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix msm-id and remove board-id
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Correct reserved memory ranges
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Remove extcon
      arm64: dts: qcom: sm6125-xiaomi-ginkgo: Fix reserved gpio ranges
      dt-bindings: arm: qcom: Add Xiaomi Redmi Note 8T
      arm64: dts: qcom: Add Redmi Note 8T

 Documentation/devicetree/bindings/arm/qcom.yaml    |   1 +
 arch/arm64/boot/dts/qcom/Makefile                  |   1 +
 .../boot/dts/qcom/sm6125-xiaomi-ginkgo-common.dtsi | 302 +++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-ginkgo.dts  | 287 +-------------------
 arch/arm64/boot/dts/qcom/sm6125-xiaomi-willow.dts  |  13 +
 5 files changed, 319 insertions(+), 285 deletions(-)
---
base-commit: f417b7ffcbef7d76b0d8860518f50dae0e7e5eda
change-id: 20260111-xiaomi-willow-448552f02762

Best regards,
-- 
Barnabás Czémán <barnabas.czeman@mainlining.org>


