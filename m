Return-Path: <linux-arm-msm+bounces-63450-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 16386AF6227
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 20:59:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6B1311C44F30
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Jul 2025 18:59:42 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 54A4D2BE65E;
	Wed,  2 Jul 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rI+mAvpv"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD062BE652;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751482751; cv=none; b=RgL2USYlYeRVZDKV3jvvMFSNOvR5WKjhipqmbwhDVAbwvkl/RM7jXmiBt5gtUJ716rcl4iTonJZwf6Qv33Ggi0esKLpI70m6hLgRD+r4hQ6nfCTFQXLeaGL6nQeI1FHNODjot+LNCxIaIKEVhOeidosuK3xB0OASjTamurA8tc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751482751; c=relaxed/simple;
	bh=G9ajOubBK0mV1nv4EGWaDIXhIH3bnL8BAka8nigN7uQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pl2zrw8M6kVGk8p3vHQv9E6icBH7z3ghFzXbfAzgJKSpN2Cmp/P6emHQiCKFALjPIxKx6U0bXwK876aW+nUwHOk9+ZTnFW+fRCd2PDP013SbMjLO8dJe8W9MS6o9RL+V4Y1PTPIDxyFip4fS1N+kzL8yThIdH4cnekES0EQAapY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rI+mAvpv; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id A5D15C4CEF8;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751482750;
	bh=G9ajOubBK0mV1nv4EGWaDIXhIH3bnL8BAka8nigN7uQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=rI+mAvpvrft9HnBl0xgdMLu13XjHSyZsrQv/vTQtLUXnp24R4Bjfn883IdT3LjWYI
	 W88bLL5qbf351oioDpzVZv/SmNttP2ShipcJViIHH5riuylM6iIM2kBXeFt23q7Ebz
	 OjdlAa7RR0cvRAKtKOvmF/glWaxIqqklUJOU8oc/kNpUUr1JXegCk4Qq32IUno/wWv
	 6f+yQqZnn790RvezHvGxY5bEaNa68NF/OwsynWLgwIkVqOIUWAY2l1P07o8BO45JuZ
	 GnjxQj5XiVk2kt7hVd4hBcgTaulObqbfettMqRQ8vkNd1tETcIfPufo/TfwAGhEEM1
	 xomzR/VBmhXTQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98953C83038;
	Wed,  2 Jul 2025 18:59:10 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Wed, 02 Jul 2025 20:59:09 +0200
Subject: [PATCH 3/3] arm64: dts: qcom: x1-hp-x14: Add support for X1P42100
 HP Omnibook X14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-hp-x14-x1p-v1-3-219356e83207@oldschoolsolutions.biz>
References: <20250702-hp-x14-x1p-v1-0-219356e83207@oldschoolsolutions.biz>
In-Reply-To: <20250702-hp-x14-x1p-v1-0-219356e83207@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751482749; l=3024;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=4qMZRflZvpbOAQk9PzwxdZC2Sz1ND1a5zbEF77TvE3E=;
 b=PBDhD5Cmu3OX5b7d4hrsrMnIQPNHYlmcY7nT7/SGC8W4Wqjx2ZKP5ow6o9VKyuHJv3LXNDosI
 vuw0gwiiRtSArX/IfoSzbLSRijI01iO5TDbGun+44BfcpDJwiET6NyL
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
 arch/arm64/boot/dts/qcom/Makefile                  |  2 +
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     | 44 ++++++++++++++++++++++
 2 files changed, 46 insertions(+)

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
index 0000000000000000000000000000000000000000..a6b5faeae27aa69ef07d8b2846ff9e6ffb43c954
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1p42100-hp-omnibook-x14.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
+ * Copyright (c) 2024, Xilin Wu <wuxilin123@gmail.com>
+ * Copyright (c) 2025 Jens Glathe
+ */
+
+/dts-v1/;
+
+#include "x1p42100.dtsi"
+#include "x1e80100-pmics.dtsi"
+#include "x1-hp-omnibook-x14.dtsi"
+/delete-node/ &pmc8380_6;
+/delete-node/ &pmc8380_6_thermal;
+/delete-node/ &pm8010;
+/delete-node/ &pm8010_thermal;
+
+/ {
+	model = "HP Omnibook X 14-fe1";
+	compatible = "hp,omnibook-x14-fe1", "qcom,x1p42100";
+	chassis-type = "laptop";
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1p42100/hp/omnibook-x14/qcdxkmsucpurwa.mbn";
+	};
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



