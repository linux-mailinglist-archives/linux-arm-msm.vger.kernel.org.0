Return-Path: <linux-arm-msm+bounces-46430-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C17F0A21519
	for <lists+linux-arm-msm@lfdr.de>; Wed, 29 Jan 2025 00:37:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id EC7677A4793
	for <lists+linux-arm-msm@lfdr.de>; Tue, 28 Jan 2025 23:36:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55E0E1F5600;
	Tue, 28 Jan 2025 23:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="x5Q+gJec"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6FE7EAF6;
	Tue, 28 Jan 2025 23:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738107390; cv=none; b=Agn+i6d3TVw47ow7PQmJFSBl1BRj2qNf66qfi3Ww1eEwJ5nw8eFoFwuSLaTFzmPA4x/ZRC8jCeGY2a3rp16+amTqPXP4cgHz/xRVAHfBotD95+immKCn/NR0svyXpJXvGzx/32x07Spb2/Lp22pbpwp0oWR1LA1CiU9zNqyMzEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738107390; c=relaxed/simple;
	bh=x6gQkQ4gVXHmFdfMkn1LTVVuiTDOy4PcZeJYpn2+DLY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=u19hDvjSOHBo0dfYNuAs19HevsH21pTU5MMzza0U0V49Lc9ND9S27uAsFhpCAUqK5eb1cB3E2FuecpEGcbnZ2HMCGI/R4rKmJ9mRGD8ip6tqVn0fqylm9Cb9dCFE4SSAAu+zSZMNpZXkToBk3e01rFN182bCcggy0+F1ovr3lt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=x5Q+gJec; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738107378; bh=x6gQkQ4gVXHmFdfMkn1LTVVuiTDOy4PcZeJYpn2+DLY=;
	h=From:Subject:Date:To:Cc;
	b=x5Q+gJecCy5iVMeg3ZmY9StkQcYk5j2LyjR2Nk+nesPg88sc+G+0UbRo6yhlLJSCN
	 IsRzpCLYlAE/0xv7khGOMNACEHrZKPrDuhBge1jLm/gxstaT289KfYQcDlMGiIMUFc
	 ooNXSu+W+uwBF8TuLJ2XiuEbgkadZp2BZSORc+TQ=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v4 00/13] Modem support for MSM8226
Date: Wed, 29 Jan 2025 00:35:32 +0100
Message-Id: <20250129-msm8226-modem-v4-0-2b02ed7b7f1c@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMRpmWcC/13OQQ6CMBCF4auQWVtTCrTVlfcwLho6lSYWTEeqh
 nB3C3GhLP+XzJeZgDB6JDgWE0RMnvzQ56h3BbSd6a/IvM0NgouGl1yxQEELIVkYLAbmysaUKJ2
 2uoZ8c4/o/Gv1zpfcnafHEN8rn8SyfqVF+JOSYJyh1lZJK61x7nQbW/NET7THERYsVb/A9pVUZ
 UAqPEittELcAvM8fwDgtgm97gAAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3518; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=x6gQkQ4gVXHmFdfMkn1LTVVuiTDOy4PcZeJYpn2+DLY=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmWnTIxBi0vijtcDpq4QcN+UZHQRIBOBQk20Qj
 LyMULlWQqKJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5lp0wAKCRBy2EO4nU3X
 VgJeD/9u4b8tOfdaKFIEnVtU/jLNZWoviNWVJdxLO5cBfePgqde6wLsiUuq3bUZovqoVr97Mj/I
 TGZUwtNF4HlpgHmXL4E2sFWCuHos2Hw3T85kaP0eVgNKGAzJiKcMvqyK0fYiucnG8d5jaZHHboy
 oO077l1ju1mu55NqDtjSbJL8sbYNJmryx68DUr1jRLpdkulTeedmeMP9LYFYhGHmCkbYHJo1RAv
 K3Otw92dppABo6oAXrao5p+r2RikZALHU+jBj3f7n/K1f4459nf3j4Yr6FkswlPmlh99E+GnVv6
 BqNI3IjjTdXqdVXQaajMRvEbv1s+EkEsfFf7c2FpTES8eQ42FnlNqGV6cklbvJz4TRRRAovo7c/
 ymxgVFyhkJAuscmS0XsdAn9L/zShGaFbnkUVo5ArPE9hCyHCA8W0pc7rbwpj4+z1/zDSSNvKjni
 nZWYo7YWvXdjMC8aMOSfe6OvI26tn76u+NYRwsh+9RQ+TUn365EAtlTKDUC1BSM08b0Eavxa4/b
 f1JbaWtNjwlN6USNJrPeWuqmRRWxDswAJCgmfZYcQtkAfqSFXKonQYBiCIOjZ4xYzCZCunC+0q/
 NekXvdjge64D9CAoPADMcMyGDL4sD7jIVRYusckJZMNHRNsvxEb4NWuFfwW+t/q2W3gk4KTaWhx
 mLdT6NuadtRpeMg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

This series adds support for modem remoteproc found on MSM8226.
It also adds needed device tree nodes and enables modem used for
location service on matisse-wifi.

Also bam-dmux node is added for mobile data which is used on
3G/4G-enabled devices.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
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
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 147 ++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  14 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |   1 +
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |   1 +
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   |   2 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |   5 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 186 ++++++++++++++++++++-
 16 files changed, 446 insertions(+), 16 deletions(-)
---
base-commit: 15fbefd533c38e72315c25ae3746005fddb4b8e3
change-id: 20250107-msm8226-modem-f15a1e6f8d84

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


