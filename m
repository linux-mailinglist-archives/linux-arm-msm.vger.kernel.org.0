Return-Path: <linux-arm-msm+bounces-46166-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 6007EA1CEA3
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 22:05:08 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 89C5518833F0
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Jan 2025 21:05:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 013111714D0;
	Sun, 26 Jan 2025 21:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="0jA/omaX"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ACF8157A5A;
	Sun, 26 Jan 2025 21:05:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737925503; cv=none; b=ZaVKyoTzI0a5ztDvmzcx0wNNk0eWJjOHR3GHht5RbQ7NoXAPTEHw8NEx3dJ/pvVAkZGq/XFF8x2+krNdG+PAlYTpLfruTN5x10uE73LvPyfJtbysB5sddhMlxOjFL2/AQlKuKnzf5g0ABFhKQd3CUqyilNg77AC4SNw9p3skC/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737925503; c=relaxed/simple;
	bh=u+e85PHR3has84qaHwnhrApZSQVXpmMUWcLKP264w0M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tlgkTL8R0jPm+JXKmpJtu1hQbDk0IhJtEs0Zxk1xv3l4yVA/iCEHxvM1ZdkmrlQZ4ro1SfiF3lbibYe/zePc+ntnwAbeegBndcFnrpwUxlnxKZ+aQIroG0OEXlVxPILGKFRkH4bAQpc8g2ZjEJI+sKPLPwdB9EWt4bkPwdb95BM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=0jA/omaX; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1737925053; bh=u+e85PHR3has84qaHwnhrApZSQVXpmMUWcLKP264w0M=;
	h=From:Subject:Date:To:Cc;
	b=0jA/omaXCMocnIvCA3cBQkuXJx2iwe43HsGFAEM96JcnoNPp7veSASgTzYBLLsvhj
	 ZRp8B1ySMHSdJygalD2t9szrH39I+NC8ysEVWW9e/DbsPqiIFjZNJG76QTAPmvR5le
	 pBXuKWG08R6Z4xDfT1GK3/evb5vysG8lejhYGvcI=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v2 0/9] Modem support for MSM8226
Date: Sun, 26 Jan 2025 21:57:19 +0100
Message-Id: <20250126-msm8226-modem-v2-0-e88d76d6daff@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIALChlmcC/x3MQQqAIBBA0avIrBN0KJOuEi0ix5qFGgoRiHdPW
 r7F/xUKZaYCi6iQ6eHCKXbgIOC49niSZNcNqHBSWs0ylGARjQzJUZBeT7sm462zI/TmzuT5/X/
 r1toHQwYXtF8AAAA=
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
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2112; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=u+e85PHR3has84qaHwnhrApZSQVXpmMUWcLKP264w0M=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnlqGx2067slOjfwLO1qTNQ9OByxrI+bOIw/flQ
 fHhHHZ4fAmJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5ahsQAKCRBy2EO4nU3X
 VmlND/9x1WdlfOA7LCL6LN9vCA3VP9kFJNi5bcyTLlMAqbmuMx/D5UBC/CC1fwlcDuI/lmJX6Fq
 AsXD4TDPCsjWuk5FHYDDqTGM6do52EJn5ZDDbAYM12iSHWW3UkLyi5OvtVjrMEFTnHd9/r97mcd
 ItIaQmxPTz6Ob2ukUVRkuiV8M2uknA9BU6fhTtl9nH4A2KPgo9ulSzpiwhvwksWEzXm8l2x5RpW
 3iRNeilsvkVNSDE0g2QzxkrqV//pdVtSVeDt/PCGLmdEXc2tc9JgzAi6sEP2jpqr4X2jBLsQlXE
 SQnbB28bYFrkctnW1lB2P8/S++3CnOTBFdR8XuzPzwNXtEnUY42U8riYykuHx/7uqcnFuFNexUS
 V3jX8JRVt4Q4nAkCFKHpYgibnPkza06UFQtjjzrfrzgs3s2cLI6URRDvktmFhxk7pF2BUYEvps+
 h/dHBdWV3jCfpbhgJvx44sNGZW67IV0ZnJPxLX4jWDmCCeschv3kg0vcsXucbF8h1uvliqXOJw6
 b2CyLgxJ2HS9IuHp7726LhALxsDt4/bzr92oDSrNv1A13/rcXsgTMbmHdRA8rViU+QIv+fLsJZT
 ypE+zQVKPN+mnvGAxhhROp/bWK5TZrSZ5GB2DGYtPEvWP5gr3g1kPSo+bumdDrgd22hbXocByJP
 hp+Rq4fYsw4WHrA==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

This series adds support for modem remoteproc found on MSM8226.
It also adds needed device tree nodes and enables modem used for
location service on matisse-wifi.

Also bam-dmux node is added for mobile data which is used on
3G/4G-enabled devices.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
Changes in v2:
- Drop applied tcsr-msm8226 dt-bindings patch
- Replace qcom,ipc-* with mboxes in smsm node
- Replace qcom,ipc with mboxes in smp2p nodes
- Drop mba & mpss subnodes in modem dts
- Disable added modem in apq8026 smartwatches due to lack of any useful
  modem firmware
- Add patch for bam-dmux
- See individual patches for more!

---
Luca Weiss (4):
      remoteproc: qcom_q6v5_mss: Handle platforms with one power domain
      remoteproc: qcom_q6v5_mss: Add modem support on MSM8226
      ARM: dts: qcom: msm8226: Add modem remoteproc node
      ARM: dts: qcom: msm8226: Add BAM DMUX Ethernet/IP device

Matti Lehtimäki (5):
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Support platforms with one power domain
      dt-bindings: remoteproc: qcom,msm8916-mss-pil: Add MSM8226
      ARM: dts: qcom: msm8226: Add node for TCSR halt regs
      ARM: dts: qcom: msm8226: Add smsm node
      ARM: dts: qcom: msm8226-samsung-matisse-common: Enable modem

 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |  56 +++++++-
 .../boot/dts/qcom/qcom-apq8026-asus-sparrow.dts    |   7 +
 .../boot/dts/qcom/qcom-apq8026-huawei-sturgeon.dts |   7 +
 arch/arm/boot/dts/qcom/qcom-apq8026-lg-lenok.dts   |   7 +
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |   2 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  13 +-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 145 +++++++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |   2 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 137 ++++++++++++++++++-
 9 files changed, 367 insertions(+), 9 deletions(-)
---
base-commit: 15fbefd533c38e72315c25ae3746005fddb4b8e3
change-id: 20250107-msm8226-modem-f15a1e6f8d84

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


