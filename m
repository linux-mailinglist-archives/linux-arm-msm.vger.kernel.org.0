Return-Path: <linux-arm-msm+bounces-73498-lists+linux-arm-msm=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FEB5719D
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 09:35:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B3A6717C55E
	for <lists+linux-arm-msm@lfdr.de>; Mon, 15 Sep 2025 07:35:32 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9B0172D3218;
	Mon, 15 Sep 2025 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqWAwL3t"
X-Original-To: linux-arm-msm@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D87C2D6629;
	Mon, 15 Sep 2025 07:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757921717; cv=none; b=h4I1HUzsE9KEMZiM1OGIABozpYWrUFHG67X8dvm2coHHkKP/PgbP+C9qGIny4+y6c7Fy5wHnmTatFhM4jq/RQu98VeL3kF+dezMAUuppOmRpadJqNsET30Kna1FDKnRhPbVV9gCuL/HzSO+nHxN9gull7sjPI8GPu8PTcqzKqdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757921717; c=relaxed/simple;
	bh=mEeucCA69rzn4qS6ndoLYMMFhSSaDsALtVNp52DpmNo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MR5aU3FO3ZJDy0AA7xBhr6QyQE43F8IfJlhxNja2Rhpgb3X4kMr6xDz0aNUjFs6gwU1B7XPMMNn1f689VzoETxWxUNIk17WKgbQvKAeNB4Ir5RBeVFlLOTMA71DrsIfTqTCjl2lfNblXgfiQNvyLSGKnumLuRQawK78rjrW+Y0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqWAwL3t; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5719C4CEFD;
	Mon, 15 Sep 2025 07:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757921716;
	bh=mEeucCA69rzn4qS6ndoLYMMFhSSaDsALtVNp52DpmNo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=LqWAwL3tZMhJ3FpKRuA3XKUCGGQj1IkUxptAsFEdk5rHwL/SNwjxtlX9Z/RJxl9yi
	 wJVGN7ZljIyRjJU50A0ysGhu12YqDpuKi2xzC+F0TizDi2hK/qmys1fwNVHl+JTII/
	 6b4bhWqGUcdvvLX/GwM+S8tXJOOhaqNiJbrOved8+BlvXLW1KcTqnScz+/57iBIPaK
	 kJwFbQP4NxnfidLf/Uy/qxyCw1x6dAq8cEFKHoXOC7P29vz+V8XuPXxR3V1qmQ81zy
	 LUfv6vz8jq7ImMlD+ISAJdfCQIr47IBUT7CAgrGxn4H9EZzvAm8uRiiPr4quqxupwL
	 GzbrZhIQ9BAfQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A28CAC599;
	Mon, 15 Sep 2025 07:35:16 +0000 (UTC)
From: Jens Glathe via B4 Relay <devnull+jens.glathe.oldschoolsolutions.biz@kernel.org>
Date: Mon, 15 Sep 2025 09:35:06 +0200
Subject: [PATCH v9 3/3] arm64: dts: qcom: x1-hp-x14: Add support for
 X1P42100 HP Omnibook X14
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-hp-x14-x1p-v9-3-fa457ca30ffe@oldschoolsolutions.biz>
References: <20250915-hp-x14-x1p-v9-0-fa457ca30ffe@oldschoolsolutions.biz>
In-Reply-To: <20250915-hp-x14-x1p-v9-0-fa457ca30ffe@oldschoolsolutions.biz>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Stephan Gerhold <stephan.gerhold@linaro.org>, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757921715; l=3070;
 i=jens.glathe@oldschoolsolutions.biz; s=20240919;
 h=from:subject:message-id;
 bh=+BT4fsKiJVWxM7tmSzqIpmCAL57kITWb6Otasrz9a90=;
 b=CLSjXfOV6Yze+dg43nNL0rP0wYTQG4d4igf8FVp4yp+C/8W1E2l3e04G3fXSua53i3m/8N42S
 ALptVYLp3OCBy6dYu3YdU4/4uSuLXipSwPqX/6gGtcNpBsUc1UCsCw8
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

[1]: https://www.hp.com/us-en/shop/pdp/hp-omnibook-x-laptop-next-gen-ai-pc-14-fe100-14-a4nd1av-1#techSpecs

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
---
 arch/arm64/boot/dts/qcom/Makefile                  |  2 ++
 .../boot/dts/qcom/x1p42100-hp-omnibook-x14.dts     | 33 ++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 5b52f9e4e5f31ac5a398d0762337a0a31af1f4dd..0840ccf5c84795b5fdfe65db44bafc6984329847 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -339,5 +339,7 @@ x1p42100-asus-zenbook-a14-el2-dtbs	:= x1p42100-asus-zenbook-a14.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-asus-zenbook-a14.dtb x1p42100-asus-zenbook-a14-el2.dtb
 x1p42100-crd-el2-dtbs	:= x1p42100-crd.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-crd.dtb x1p42100-crd-el2.dtb
+x1p42100-hp-omnibook-x14-el2-dtbs := x1p42100-hp-omnibook-x14.dtb x1-el2.dtbo
+dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-hp-omnibook-x14.dtb x1p42100-hp-omnibook-x14-el2.dtb
 x1p42100-lenovo-thinkbook-16-el2-dtbs	:= x1p42100-lenovo-thinkbook-16.dtb x1-el2.dtbo
 dtb-$(CONFIG_ARCH_QCOM)	+= x1p42100-lenovo-thinkbook-16.dtb x1p42100-lenovo-thinkbook-16-el2.dtb
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



