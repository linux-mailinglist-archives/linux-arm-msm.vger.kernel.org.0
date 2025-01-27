Return-Path: <linux-arm-msm+bounces-46293-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 67D41A200D9
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 23:46:53 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id A46D81884F34
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2025 22:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1BA121DB365;
	Mon, 27 Jan 2025 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b="2rKzb7d8"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from ahti.lucaweiss.eu (ahti.lucaweiss.eu [128.199.32.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A96B1EB2A;
	Mon, 27 Jan 2025 22:46:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.199.32.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738017999; cv=none; b=mIO1wL7IvlvcxOB6TyloqLtjXb59jfA5j42nJFhjRa6VX+UMAKRzKLX2uI2zT3zDcKlPhQiMg1qRZhNkCbnHkeHixTQpwIwipj0q/H13mwqPzexrIb2trVPwkRnbLNYo+MncFvXHu2Cw/FyOZFEOm5ccSy5tVB2Aut2sw3+toV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738017999; c=relaxed/simple;
	bh=mz4F9G5v+qaOh/zHTlbczsUUXskgo0bJ7o8PjuVuwx0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=nOlPd8S5hZn0V82KgDJuu/XGI8VcUgh9CPjbGdHhv7RvE36BKSDhAodvtEusjSNxnjXYZRg1DlLIQgD3IWke+SmlJv/6163h5onhMINjCrTVzkX4CKS7L3HMBnyXfFiKOELQoewgOzcUdWOHK/JSXkH8q8NK/lxxFDd/DzDxGKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu; spf=pass smtp.mailfrom=lucaweiss.eu; dkim=pass (1024-bit key) header.d=lucaweiss.eu header.i=@lucaweiss.eu header.b=2rKzb7d8; arc=none smtp.client-ip=128.199.32.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lucaweiss.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lucaweiss.eu
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1738017995; bh=mz4F9G5v+qaOh/zHTlbczsUUXskgo0bJ7o8PjuVuwx0=;
	h=From:Subject:Date:To:Cc;
	b=2rKzb7d8SNbexcj0m4iMahjyd3pyJKflVuFe5glK7knEexi7/7zeEiHacVXD9ahjn
	 en9aygW104jJi/SzT3PB6dGQoDhRXVUrUTSr2QklwF0aYc3Ea0n7V+Iu+56JbUyiOK
	 XqjcbrMWtkc7j+rZBXd3msUdJkCRk1F+h3WTXz9E=
From: Luca Weiss <luca@lucaweiss.eu>
Subject: [PATCH v3 00/13] Modem support for MSM8226
Date: Mon, 27 Jan 2025 23:45:32 +0100
Message-Id: <20250127-msm8226-modem-v3-0-67e968787eef@lucaweiss.eu>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAIwMmGcC/1XMQQ6CMBCF4auQWVvTVimNK+5hWDR0KpNYajqCG
 sLdLcSNy/8l71uAMRMyXKoFMs7ElMYSp0MF/eDGGwrypUFLXUslGxE5Wq2NiMljFEHVTqEJ1ts
 zlM8jY6D37l270gPxM+XPzs96W3/SJvxJsxZSoLW+Md54F0J7n3r3QmI+4gTduq5fT/Rpia0AA
 AA=
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
 Stephan Gerhold <stephan.gerhold@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3076; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=mz4F9G5v+qaOh/zHTlbczsUUXskgo0bJ7o8PjuVuwx0=;
 b=owEBbQKS/ZANAwAIAXLYQ7idTddWAcsmYgBnmAy7IdRHI7lK5mL2in7CNTqJHn2GGo77WTw6N
 It9HOK903OJAjMEAAEIAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCZ5gMuwAKCRBy2EO4nU3X
 VtVoEACb9IJHAm/d6rtu96UIxJtVVIS9HyvdU7TLWsW5ckZWIQ92MRSMehhcqyQX8fKmZVh94aP
 jpYd3nA9ZL8nEOIjlKciihbOhLzn7SXGj1aH0jGScmD+MOiSCKSQctYqXlBRcFTst37Jpw+W1zV
 yEiaC7JShp2lODUuF3wnLECyrxshSyaWfG1jq6hMpVpwWiT1x890Lh1fy/kdczNC3Kh4KfInCKL
 PQ1TTi7N0lTla1xzvnwktX9vTUsADLgB4Sg5JrS41saRZ1RiusoVl1Eldyb37+26THyfPWqmZ+o
 vXA//EahbYa0QdvcgN7COfyl+VwMQhHqvqxWNsrqZ8vAKks1x+Oz7y4PxzwIeilkSj9fYjvmq7U
 NWQO0gaZgZGbAOZPxlu14cIEQ7aZyrea9S4sSisQy8g56PRyZSLJTliBGXG2Q9dFwn8iqxmGCoJ
 sOY8T7E87mdPjgVuW8P+m6PYovudtbbcG4BFeFoV+f+lxASMNbLkFJsfM8uJjIxI32H5mGhIZpx
 OpZFW1qh8E5vO7sYqWI4EHGmNIZi2+TVBAg7tCOgFODjqqoe0GzinJvJVapGaaUE1Q7IjgTc1U/
 rsYuzEQudUrpnLPpMgvNRsHEOmqbFuWoGAUO2zYdGwRzWiBJzuK5MVnHANK/cmAGxW0j9OaMoMQ
 R0RaiyOdz6lhEZQ==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD

This series adds support for modem remoteproc found on MSM8226.
It also adds needed device tree nodes and enables modem used for
location service on matisse-wifi.

Also bam-dmux node is added for mobile data which is used on
3G/4G-enabled devices.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
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

 .../bindings/remoteproc/qcom,msm8916-mss-pil.yaml  |  64 +++++++-
 arch/arm/boot/dts/qcom/msm8926.dtsi                |  11 ++
 .../dts/qcom/qcom-apq8026-samsung-matisse-wifi.dts |   1 +
 .../dts/qcom/qcom-apq8026-samsung-milletwifi.dts   |   2 +
 .../dts/qcom/qcom-msm8226-microsoft-common.dtsi    |   6 +-
 .../dts/qcom/qcom-msm8226-microsoft-dempsey.dts    |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-makepeace.dts  |   1 +
 .../dts/qcom/qcom-msm8226-microsoft-moneypenny.dts |   1 +
 .../qcom/qcom-msm8226-samsung-matisse-common.dtsi  |  19 ++-
 arch/arm/boot/dts/qcom/qcom-msm8226.dtsi           | 147 +++++++++++++++++
 arch/arm/boot/dts/qcom/qcom-msm8926-htc-memul.dts  |  14 +-
 .../qcom/qcom-msm8926-microsoft-superman-lte.dts   |   1 +
 .../boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts |   1 +
 .../dts/qcom/qcom-msm8926-motorola-peregrine.dts   |   2 +-
 .../dts/qcom/qcom-msm8926-samsung-matisselte.dts   |   5 +
 drivers/remoteproc/qcom_q6v5_mss.c                 | 181 ++++++++++++++++++++-
 16 files changed, 443 insertions(+), 14 deletions(-)
---
base-commit: 15fbefd533c38e72315c25ae3746005fddb4b8e3
change-id: 20250107-msm8226-modem-f15a1e6f8d84

Best regards,
-- 
Luca Weiss <luca@lucaweiss.eu>


