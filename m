Return-Path: <linux-arm-msm+bounces-48285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C6AA38E7B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 23:06:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 066253B0EE2
	for <lists+linux-arm-msm@lfdr.de>; Mon, 17 Feb 2025 22:05:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BE7F61A8F68;
	Mon, 17 Feb 2025 22:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="jcNLYGo7"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A219E999;
	Mon, 17 Feb 2025 22:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739829957; cv=none; b=hjInwDEj4jNPNZZ3btS/nUFHnZEqhjzf6GYew/Ukcjz4JLeBThTeFItck2MfjfKTphimeJqePKdjq4ulJyiMt0PnBZAG9JKC5L6gPai+rXBViT2WXcuZPBTTacQQRk0bzS8DRn0b2WF9EVDr9S5CXeISbwXoTMZMwGMwqx0zLEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739829957; c=relaxed/simple;
	bh=/qaJsStPtUj7Dtxjelp0zf9wVWGxYbmiDlfb9PgmI9M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=q1k6B+kdyr7ohlt/qfyvIfIE8xta2l+Q1Ww9EVejT+uUDsq5naJ3MuFhNF//jK+FxTbW/SqyDJpSnJFR2YAJ/BqjdKnqSF1Bzm8wEt8BWmFxtro6mXM0yXZW4yiG0S9UQZcfm6DwFrPflcu7DI3PNOkhMaMrByhTNMWLJCD9oU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=jcNLYGo7; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1739829948; bh=/qaJsStPtUj7Dtxjelp0zf9wVWGxYbmiDlfb9PgmI9M=;
	h=From:Subject:Date:To:Cc;
	b=jcNLYGo7cV4HC4Kfj6L3ydJiPzBJ9E9bsBbaflZ41L56UOA6dywKg3M4PRYVUhyWZ
	 VKs4gzPpacJ8qgaXCzte9fbVia8YO4braqe0o/eEBLyH8B6kFS5NcXzfGDFKMN9fcp
	 BaV9GIF6q9Wv51eWaBGUCQQGDfrqlKbUBXn75t9o=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v5 00/13] Modem support for MSM8226
Date: Mon, 17 Feb 2025 23:05:14 +0100
Message-Id: <20250217-msm8226-modem-v5-0-2bc74b80e0ae@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJqys2cC/23OQQ6CMBCF4auYrq1pB2iLK+9hXBQ6lSYCppWqI
 dzdQlwgcfm/ZL7MSAJ6h4EcdyPxGF1wfZei2O9I3ejuitSZ1AQYFIwzSdvQKgBB295gSy0vNEd
 hlVE5STd3j9a9Fu98Sd248Oj9e+EjzOtXmoUfKQJlFJUyUhhhtLWn21DrJ7oQDjiQGYvZGti+E
 rMECImlUFJJxH9AvgbKLZAnACoGaGQlLa83wDRNH9/USeEvAQAA
X-Change-ID: 20250107-msm8226-modem-f15a1e6f8d84
To: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephan Gerhold <stephan@gerhold.net>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 =?utf-8?q?Matti_Lehtim=C3=A4ki?= <matti.lehtimaki@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca@lucaweiss.eu>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Stephan Gerhold <stephan.gerhold@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3863; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=/qaJsStPtUj7Dtxjelp0zf9wVWGxYbmiDlfb9PgmI9M=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBns7Ki2dMZmP7kneJGVFMIjVn+chD02F+5dBekW
 COsFwYlmleJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ7OyogAKCRBy2EO4nU3X
 ViIwEACquEC1CDHx0kvtplJyUIoSdp+Y4qZtD8GaCh/LGxCNyv/7ShGraqSYMnfPH123YXk4wyc
 yocyqIuMhqkQIu2tVRZoFKx5nr3ruj7qSDJYMqQmbBfar/niK+ADA27cskYwG/pG+kA2a9sMQSy
 bCNxTSv0cgXODv8UybYbTmKLNQVHHaiAX/XyG8KQCj6fCQseuxRGf4U047T8sIEO/y9IcA38n3Z
 bgyUBZGFyQ2+Z/BycfultZVC250RrOJhGD8Kn964BKwVGHVGe9Cl3M5/ImZ8N7FGm8YkH249X/G
 6AtpByZxTfHB5iPVI3g4lLXoDIFf6GT3Mx1RhvTexKCu15RTW3K9fPmS73nHGly4f1IgQoGtH/o
 b8ArZnguJ8zC5g5LxgNSP06rf0K8lvpca07UXy0eWVhKdQUdAqIXmDT+nhzNNDzWbqOjKwO4hY+
 ZklILebwX+nHH2lPDZ4NYuUhmHDNEGvFVQFZi4FTl1ozsRVik3Jx6NthjxMQgRRPUjXVRlgC/zH
 Fzi9lKK0NwzOhL1oWd16azwmt+7bG8xvnWk7u/XpDrNzoRyBfYcGGEK5fSLour2wl49y6wZWHm9
 /LQT/jVU1MJaNOHUU5tmHpy7lLH0V+m/5ey45AYGCtW87+nW3BDTDdI3euAQQFOmTsoK8rvGhgs
 x6ZR3YhraPVX9rg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

This series adds support for modem remoteproc found on MSM8226.
It also adds needed device tree nodes and enables modem used for
location service on matisse-wifi.

Also bam-dmux node is added for mobile data which is used on
3G/4G-enabled devices.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v5:
- Correct size of register areas for modem (Konrad)
- Use XO from rpmcc for modem (Konrad)
- Make reg-names & interrupt-names & clock-names be 1 per line, just
  like the base properties (Konrad)
- Pick up tags for PATCH 5/13
- Link to v4: https://lore.kernel.org/r/20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu

Changes in v4:
- Drop mx from .proxy_pd_names for msm8974 as it's always a regulator
  @Stephan: Please check that one also since I still picked up your R-b
- Move q6v5_external_bhs_enable to just after regulator enable and
  _disable to just before regulator disable, instead of them being in
  _probe and _remove (Stephan)
- Pick up tags
- Link to v3: https://lore.kernel.org/r/20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu

Changes in v3:
- Include dt-bindings & driver patch for MSM8926 modem which is slightly
  different
- Include patch to add msm8926.dtsi with modified modem
- Include patch to enable modem on MSM8926 HTC memul
- In single-pd driver patch modify if conditions to only trigger for
  8226, even for misconfigured dts (Stephan)
- Don't /delete-node/ & /delete-property/ for no-modem smartwatches,
  just make mpss_region & mba_region be disabled by default (Stephan)
- Configure matisselts mss-supply correctly (Stephan)
- Pick up tags
- Link to v2: https://lore.kernel.org/r/20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu

---
Luca Weiss (8):
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8926
      remoteproc: qcom_q6v5_mss: Handle platforms with one power domain
      remoteproc: qcom_q6v5_mss: Add modem support on MSM8226
      remoteproc: qcom_q6v5_mss: Add modem support on MSM8926
      ARM: dts: qcom: msm8226: Add modem remoteproc node
      ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP device
      ARM: dts: qcom: Introduce dtsi for LTE-capable MSM8926
      ARM: dts: qcom: msm8926-htc-memul: Enable modem

Matti Lehtimäki (5):
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Support platforms with one power domain
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8226
      ARM: dts: qcom: msm8226: Add node for TCSR halt regs
      ARM: dts: qcom: msm8226: Add smsm node
      ARM: dts: qcom: msm8226-samsung-matisse-common: Enable modem

 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |  64 ++++++-
 arch/arm/boot/dts/qcom/msm8926.dtsi                |  11 ++
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |   1 +
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |   2 +
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |   6 +-
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |   1 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  19 ++-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 155 +++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  14 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |   1 +
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |   1 +
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   |   2 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |   5 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 186 ++++++++++++++++++++-
 16 files changed, 454 insertions(+), 16 deletions(-)
---
base-commit: 30e923ec5b1c3e4f8f2ee8967db4907d36be8c00
change-id: 20250107-msm8226-modem-f15a1e6f8d84

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


