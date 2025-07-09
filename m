Return-Path: <linux-arm-msm+bounces-64285-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 122A2AFF1CC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 21:27:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 5DCC71755E1
	for <lists+linux-arm-msm@lfdr.de>; Wed,  9 Jul 2025 19:27:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 81FA52417D9;
	Wed,  9 Jul 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kKyUtC6v"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 511B323FC41;
	Wed,  9 Jul 2025 19:27:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752089230; cv=none; b=aT/QdTXYC1zclEzShQt9tleIXTjWnAgbe8Q7iWtqDeedUbjA9noYYn8K/jNXdQYf9VSYiVznMo6fUCeJzUxUDs9AdIX70UHfxPm3nGRzsh8rsVgtJZfUjZbYGtBRouheqkvfur5FtqmTjQvCdOEKe+LEp/S5XCeKyJMk3+rNDaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752089230; c=relaxed/simple;
	bh=/bybnvBFtX2+fXYdhDmptU6EGLVJUBZ8kV3amkynjpM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Aqh2pGAhGEVafFa2OUh4vy7HIvgrsWTPfm9KCWn++Vn40Ze7apVoeHqj7YQyzijqI4ZzFj6ix331TgPwJY6bY7wSUrk+LGWS83BsJSlNGUQil7wzDFG93i0EY1dVw/nzwhCIr8N7SdyeDB7ZtA4UrK2g+Tf44yNeyVxS/6wVvpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kKyUtC6v; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E151AC4CEF6;
	Wed,  9 Jul 2025 19:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752089229;
	bh=/bybnvBFtX2+fXYdhDmptU6EGLVJUBZ8kV3amkynjpM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=kKyUtC6v9Zo7QByn4WF9e3C/WWja4gjvlPTYulyF/+S5yXjjQSmXVT5OOXBWc3sLk
	 1BcoLtRBbfmnBEUTq5oAiMH57pzPLYUNncA8d7OPFirLTMJbsE9Wju6R2q/ct8U4Us
	 PGPG4kyIJMgPQPYsLUmGxg5p8qR+/dIXwNhB6iqS3cNq1rQZ1QXqX/ZjzMeVtXALBO
	 mIJr1Gcaw8koEGGcc9hpvZxD6Tgh1ziUrrvkgnSQf1tfYZ73kHxDEjeWmdcubGsupN
	 Vm6bbpq7TE7CBn4AH0QFOA/uhPxnnURwILLCVPrliun477l5B4jRWciCJhuXNjjt0k
	 h67+j8AJIbWYw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBBDEC83F16;
	Wed,  9 Jul 2025 19:27:09 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 09 Jul 2025 21:26:54 +0200
Subject: [PATCH v6 3/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250709-hp-x14-x1p-v6-3-f45cc186a62d@oldschoolsolutions.biz>
References: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
In-Reply-To: <20250709-hp-x14-x1p-v6-0-f45cc186a62d@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752089228; l=2750;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=XeWyde0EQd6QJ4vjTA5zQXj9V/7ihaMmWmMazAQc8g4=;
 b=NIvhcEizRT7tbWIUTI3DRVc8PDz8RbaRLYzoZPbI0iuNhol7iS/xQfl0ZJ9+mz0dm7mPzEp+m
 10P8IYdeDPRD4qAZCJyGBgCMbKZxpsDavKGAW0lLN11VVO4Lz4ATpOZ
X-Developer-Key: i=jens.glathe@oldschoolsolutions.biz; a=ed25519;
 pk=JcRJqJc/y8LsxOlPakALD3juGfOKmFBWtO+GfELMJVg=
X-Endpoint-Received: by B4 Relay for
 jens.glathe@oldschoolsolutions.biz/20240919 with auth_id=216
X-Original-From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Reply-To: jens.glathe@oldschoolsolutions.biz

From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>

These laptops are the same as the already known 14-fe0xxx models, but
with a Purwa SoC, SKU number 14-fe1xxx. [1]

The supported features are the same as for the original Omnibook X14:

- Keyboard (no function keys though)
- Display
- PWM brightness control
- Touchpad
- Touchscreen
- PCIe ports (pcie4, pcie6a)
- USB type-c, type-a
- WCN6855 Wifi-6E
- WCN6855 Bluetooth
- ADSP and CDSP
- X1 GPU
- GPIO Keys (Lid switch)
- Audio definition (works via USB and with internal speakers)

https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-next-gen-ai-pc-14-fe100-14-a4nd1av-1#techSpecs

Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 ++
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     | 33 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 4bfa926b6a0850c3c459bcba28129c559d50a7cf..63bf3ccc11124a70efb09782b57970b274d80d49 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -333,3 +333,5 @@ x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
 x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
+x1p42100-hp-omnibook-x14-el2-dtbs := x1p42100-hp-omnibook-x14.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-hp-omnibook-x14.dtb x1p42100-hp-omnibook-x14-el2.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
new file mode 100644
index 0000000000000000000000000000000000000000..6696cab2de3ec899d7ae5498f2f4b75e2131a19c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
@@ -0,0 +1,33 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "x1p42100.dtsi"
+#include "x1e80100-pmics.dtsi"
+#include "x1-hp-omnibook-x14.dtsi"
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+
+/ {
+	model = "HP Omnibook X 14-fe1";
+	compatible = "hp,omnibook-x14-fe1", "qcom,x1p42100";
+	chassis-type = "laptop";
+};
+
+&gpu_zap_shader {
+	firmware-name = "qcom/x1p42100/hp/omnibook-x14/qcdxkmsucpurwa.mbn";
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1p42100/hp/omnibook-x14/qcadsp8380.mbn",
+			"qcom/x1p42100/hp/omnibook-x14/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1p42100/hp/omnibook-x14/qccdsp8380.mbn",
+			"qcom/x1p42100/hp/omnibook-x14/cdsp_dtbs.elf";
+
+	status = "okay";
+};

-- 
2.48.1



