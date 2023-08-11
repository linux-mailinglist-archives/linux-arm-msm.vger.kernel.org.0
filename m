Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6B667799CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Aug 2023 23:44:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237034AbjHKVoV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Aug 2023 17:44:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43096 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236941AbjHKVoU (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Aug 2023 17:44:20 -0400
Received: from out-108.mta0.migadu.com (out-108.mta0.migadu.com [IPv6:2001:41d0:1004:224b::6c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54F0E30C8
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Aug 2023 14:44:17 -0700 (PDT)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ansari.sh; s=key1;
        t=1691789889;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=RoNMB1AGdAqOSSsaEsJB8ba51EXHJnG0OfEBx58fsNI=;
        b=GCaFEHpNq9ixasH0GRWwEIns6jus/IVUO2CkK8Z4La5hA6rxpCd0Gu69oSkRo2CVKpSeaM
        86ZQgYQrw5NMHqp8cGVdQGBRg2K3mrsQ4i5BfY199wK96us8m/0woYO3Ne8eFax574W3Wu
        +DMQQq3bi6+jlYiwOXKQZuS3gUvebc8=
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
Subject: [PATCH 3/7] ARM: dts: qcom: add device tree for Nokia Lumia 630
Date:   Fri, 11 Aug 2023 22:35:20 +0100
Message-ID: <20230811213728.23726-4-rayyan@ansari.sh>
In-Reply-To: <20230811213728.23726-1-rayyan@ansari.sh>
References: <20230811213728.23726-1-rayyan@ansari.sh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add an initial device tree for the Nokia Lumia 630, codenamed
"moneypenny".

Co-authored-by: Dominik Kobinski <dominikkobinski314@gmail.com>
Co-authored-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Co-authored-by: Jack Matthews <jm5112356@gmail.com>
Signed-off-by: Dominik Kobinski <dominikkobinski314@gmail.com>
Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
Signed-off-by: Jack Matthews <jm5112356@gmail.com>
Signed-off-by: Rayyan Ansari <rayyan@ansari.sh>
---
 arch/arm/boot/dts/qcom/Makefile               |  1 +
 .../qcom-msm8226-microsoft-moneypenny.dts     | 23 +++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts

diff --git a/arch/arm/boot/dts/qcom/Makefile b/arch/arm/boot/dts/qcom/Makefile
index 3dfb1c8cefb8..b2569059ce8d 100644
--- a/arch/arm/boot/dts/qcom/Makefile
+++ b/arch/arm/boot/dts/qcom/Makefile
@@ -23,6 +23,7 @@ dtb-$(CONFIG_ARCH_QCOM) += \
 	qcom-ipq4019-ap.dk07.1-c2.dtb \
 	qcom-ipq8064-ap148.dtb \
 	qcom-ipq8064-rb3011.dtb \
+	qcom-msm8226-microsoft-moneypenny.dtb \
 	qcom-msm8226-samsung-s3ve3g.dtb \
 	qcom-msm8660-surf.dtb \
 	qcom-msm8916-samsung-e5.dtb \
diff --git a/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
new file mode 100644
index 000000000000..e13e018a6759
--- /dev/null
+++ b/arch/arm/boot/dts/qcom/qcom-msm8226-microsoft-moneypenny.dts
@@ -0,0 +1,23 @@
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
+	model = "Nokia Lumia 630";
+	compatible = "microsoft,moneypenny", "qcom,msm8226";
+	chassis-type = "handset";
+};
+
+&framebuffer0 {
+	width = <480>;
+	height = <854>;
+	stride = <(480 * 4)>;
+};
-- 
2.41.0

