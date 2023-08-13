Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79F6277A782
	for <lists+linux-arm-msm@lfdr.de>; Sun, 13 Aug 2023 17:34:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230341AbjHMPeW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 13 Aug 2023 11:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjHMPeV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 13 Aug 2023 11:34:21 -0400
Received: from out-74.mta1.migadu.com (out-74.mta1.migadu.com [IPv6:2001:41d0:203:375::4a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CE4BE75
        for <linux-arm-msm@vger.kernel.org>; Sun, 13 Aug 2023 08:34:22 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1691940438;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IIuwhn3i6+/moKJjJktNoI5iLw0p9vrOyKGlGtABqcM=;
        b=hHyLgu67rxl8wMDv5jSrJUbu4vLN4iwC8c7ssqveDMNb19aSAJOpV7TfrjAh4MvUUE3k0A
        baSBrmo4yWYfE9yYR/r3PCEgJ+fBIEfFaAAc00G53SZTPXH6gsX+rhmpgh7hpM+wR3HO/k
        HpDDqzPKkpHYt13V9Tt9HwGD7+/8H8A=
From:   Rayyan Ansari <rayyan@ansari.sh>
To:     linux-arm-msm@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Rayyan Ansari <rayyan@ansari.sh>,
        Dominik Kobinski <dominikkobinski314@gmail.com>,
        Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
        Jack Matthews <jm5112356@gmail.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 6/6] ARM: dts: qcom: add device tree for Nokia Lumia 830
Date:   Sun, 13 Aug 2023 16:23:15 +0100
Message-ID: <20230813152623.64989-7-rayyan@ansari.sh>
In-Reply-To: <20230813152623.64989-1-rayyan@ansari.sh>
References: <20230813152623.64989-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an initial device tree for the Nokia Lumia 830, codenamed
"tesla".

Co-authored-by: Dominik Kobinski <dominikkobinski314@gmail.com>
Co-authored-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Co-authored-by: Jack Matthews <jm5112356@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Jack Matthews <jm5112356@gmail.com>
Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 arch/arm/boot/dts/qcom/Makefile               |  1 +
 .../dts/qcom/qcom-msm8926-microsoft-tesla.dts | 66 +++++++++++++++++++
 2 files changed, 67 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 7982620ec9f9..a3d293e40820 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -33,6 +33,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-msm8916-samsung-grandmax.dtb \
 	qcom-msm8916-samsung-serranove.dtb \
 	qcom-msm8926-microsoft-superman-lte.dtb \
+	qcom-msm8926-microsoft-tesla.dtb \
 	qcom-msm8960-cdp.dtb \
 	qcom-msm8960-samsung-expressatt.dtb \
 	qcom-msm8974-lge-nexus5-hammerhead.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
new file mode 100644
index 000000000000..6979c09d4a0f
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-msm8926-microsoft-tesla.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2023, Jack Matthews <jm5112356@gmail.com>
+ * Copyright (c) 2023, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
+ * Copyright (c) 2023, Dominik Kobinski <dominikkobinski314@gmail.com>
+ * Copyright (c) 2023, Rayyan Ansari <rayyan@ansari.sh>
+ */
+
+/dts-v1/;
+
+#include "qcom-msm8226-microsoft-common.dtsi"
+
+/ {
+	model = "Nokia Lumia 830";
+	compatible = "microsoft,tesla", "qcom,msm8926", "qcom,msm8226";
+	chassis-type = "handset";
+};
+
+&blsp1_i2c1 {
+	status = "okay";
+
+	touchscreen@4b {
+		compatible = "syna,rmi4-i2c";
+		reg = <0x4b>;
+
+		interrupts-extended = <&tlmm 17 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&pm8226_l15>;
+		vio-supply = <&pm8226_l6>;
+
+		pinctrl-0 = <&touchscreen_default>;
+		pinctrl-names = "default";
+
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		rmi4-f01@1 {
+			reg = <0x01>;
+			syna,nosleep-mode = <1>;
+		};
+
+		rmi4-f12@12 {
+			reg = <0x12>;
+			syna,sensor-type = <1>;
+		};
+	};
+};
+
+&blsp1_i2c5 {
+	status = "disabled";
+
+	/delete-node/ touchscreen@4b;
+};
+
+&gpio_keys {
+	key-camera-snapshot {
+		label = "Camera Snapshot";
+		gpios = <&tlmm 107 GPIO_ACTIVE_LOW>;
+		linux,code = <KEY_CAMERA>;
+	};
+
+	key-camera-focus {
+		label = "Camera Focus";
+		gpios = <&tlmm 108 GPIO_ACTIVE_LOW>;
+		linux,code = <KEY_CAMERA_FOCUS>;
+	};
+};
-- 
2.41.0

