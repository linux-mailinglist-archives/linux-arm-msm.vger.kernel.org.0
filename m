Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 796DB2A9FAC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 23:01:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728578AbgKFWBh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 6 Nov 2020 17:01:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58764 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728558AbgKFWBh (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 6 Nov 2020 17:01:37 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB7CDC0613D2
        for <linux-arm-msm@vger.kernel.org>; Fri,  6 Nov 2020 14:01:36 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id t22so1282776plr.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 06 Nov 2020 14:01:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+uIjFpomS32ORnnJTlJpgvJ2GUOPYTDFngxZooh9Yw=;
        b=mGHs4x96E40ceUJ1gHofW8EdE9O8zAMCLZ10G3TsbE1LbeOuFCV4hLxem3lTZsPaCO
         AC4QJ/Za62ydIR3ia+KD7GJJ2UbY6pEylwWZqABEB37Up8wJJn5Zz1LvU5CbzJnumit6
         rZ7/ZBBFkk6QlJG6Viib77aRN3YR+S4pKLXP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=W+uIjFpomS32ORnnJTlJpgvJ2GUOPYTDFngxZooh9Yw=;
        b=jsTjOVK63chtutgewvAhCBB4q20nvaew4EIjXGilRAfkYIqGrVtonGFqOmrg9bBbYy
         tbqlcah9paCNZZp43868v6P4faPzy/Xe0/I5xcHZAOqdmHfKPlZ7pP/sZokDWNO5OBDQ
         crpzFv+ZpzmwGR7u7krYiFodsHUVFQILHzQzuROep1FLkTWPn3/YdJ7XnGzAPy9Nrr8F
         lPqm5qD5ZXcIbDNDOfMLFmSorOfFQtoYK8W/ae6pCBWGWj6oUN/+weLYMP+b8Ao/BuNl
         6kHzPBbWogvOOMtGcxCInliU3vbwg3AH1zIY7BX2Supg4PgrehYcwvrCGOIOs19LJPOF
         GNEQ==
X-Gm-Message-State: AOAM531ilUmlRgFYLZagC0lXWbrdLk2nSqqApEfCyxaaiIch1oM3HkfA
        kHzfJVcmwiGTbgTDbspUCs6XS4lfslL+5g==
X-Google-Smtp-Source: ABdhPJxTtRLyN/KpvY0Uvm1maoJ87G0906yF1VT94dM7fgO3qTr7FAmQDfiNoP7FQTJTl5aU3BXrjg==
X-Received: by 2002:a17:902:8bc4:b029:d6:88c3:ea41 with SMTP id r4-20020a1709028bc4b02900d688c3ea41mr3182918plo.53.1604700096250;
        Fri, 06 Nov 2020 14:01:36 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id u5sm3389716pjn.15.2020.11.06.14.01.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2020 14:01:35 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v3 1/2] arm64: dts: qcom: sc7180: Add sc7180-lazor-r2/r3
Date:   Fri,  6 Nov 2020 14:01:32 -0800
Message-Id: <20201106140125.v3.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add configs for lazor rev2 and rev3. There are no relevant deltas
between rev1 and rev2, so just add the rev2 compatible string to the
rev1 config.

One important delta in rev3 is a switch of the power supply for the
onboard USB hub from 'pp3300_l7c' to 'pp3300_a' + a load switch. The
actual regulator switch is done by the patch 'arm64: dts: qcom:
sc7180-trogdor: Make pp3300_a the default supply for pp3300_hub',
since it affects the entire trogdor platform. Here we only add the
.dts files for lazor rev3 and replace the generic compatible entries
in the rev1 .dts files.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v3:
- rev3 switched the regulator, not rev2
- also handle rev2 in rev1 files
- fixed include in -r3-kb.dts

Changes in v2:
- patch added to the series

 arch/arm64/boot/dts/qcom/Makefile              |  3 +++
 .../dts/qcom/sc7180-trogdor-lazor-r1-kb.dts    |  4 ++--
 .../dts/qcom/sc7180-trogdor-lazor-r1-lte.dts   |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts  |  4 ++--
 .../dts/qcom/sc7180-trogdor-lazor-r3-kb.dts    | 17 +++++++++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r3-lte.dts   | 18 ++++++++++++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r3.dts  | 15 +++++++++++++++
 7 files changed, 59 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb4631f898fd..3573f7a7b762 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -26,6 +26,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-kb.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r3-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
index c3f426c3c30a..919bfaea6189 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
@@ -8,8 +8,8 @@
 #include "sc7180-trogdor-lazor-r1.dts"
 
 / {
-	model = "Google Lazor (rev1+) with KB Backlight";
-	compatible = "google,lazor-sku2", "qcom,sc7180";
+	model = "Google Lazor (rev1 - 2) with KB Backlight";
+	compatible = "google,lazor-rev1-sku2", "google,lazor-rev2-sku2", "qcom,sc7180";
 };
 
 &keyboard_backlight {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
index 73e59cf7752a..5a67e5baafec 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
@@ -9,8 +9,8 @@
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google Lazor (rev1+) with LTE";
-	compatible = "google,lazor-sku0", "qcom,sc7180";
+	model = "Google Lazor (rev1 - 2) with LTE";
+	compatible = "google,lazor-rev1-sku0", "google,lazor-rev2-sku0", "qcom,sc7180";
 };
 
 &keyboard_backlight {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index 3151ae31c1cc..9354d4c5ef7d 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -10,6 +10,6 @@
 #include "sc7180-trogdor-lazor.dtsi"
 
 / {
-	model = "Google Lazor (rev1+)";
-	compatible = "google,lazor", "qcom,sc7180";
+	model = "Google Lazor (rev1 - 2)";
+	compatible = "google,lazor-rev1", "google,lazor-rev2", "qcom,sc7180";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
new file mode 100644
index 000000000000..6985beb97e53
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-kb.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-lazor-r3.dts"
+
+/ {
+	model = "Google Lazor (rev3+) with KB Backlight";
+	compatible = "google,lazor-sku2", "qcom,sc7180";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
new file mode 100644
index 000000000000..43836fc4d403
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3-lte.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-lazor-r3.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor (rev3+) with LTE";
+	compatible = "google,lazor-sku0", "qcom,sc7180";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
new file mode 100644
index 000000000000..1b9d2f46359e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r3.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-lazor.dtsi"
+
+/ {
+	model = "Google Lazor (rev3+)";
+	compatible = "google,lazor", "qcom,sc7180";
+};
-- 
2.29.1.341.ge80a0c044ae-goog

