Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C6A2A8B7E
	for <lists+linux-arm-msm@lfdr.de>; Fri,  6 Nov 2020 01:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732625AbgKFAhl (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 5 Nov 2020 19:37:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731965AbgKFAhl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 5 Nov 2020 19:37:41 -0500
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5444BC0613CF
        for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2020 16:37:41 -0800 (PST)
Received: by mail-pf1-x442.google.com with SMTP id 10so2729538pfp.5
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2020 16:37:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5MuI8Qs4lkXowxHJWul6F/YjG+hTgqCRcfYIjbc2Jg4=;
        b=aZuL6o4FbayZD7DPToh+OVzlT5x1xOHv/KN03Ykwjja7RrJQtAEZIjtL3xcBJJ8F7o
         7/ltjHeliUR1Jf0SNOFpXSK7Ero0wmDyCF2wXymPCJPSJtPCzqJ6LCqSkj7zQHOv0myT
         xInomtSzNtDaAmGuKx13WS6G/rlwrRpVroCnE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=5MuI8Qs4lkXowxHJWul6F/YjG+hTgqCRcfYIjbc2Jg4=;
        b=O6oDPYgX0PWuM4SzRiNzLSjIzFT4dSATA5Ks6h/dY+caX8nVe7a+XiqqTxxBHMM6XF
         epe7f852BKlnCJo8rn2AXvMC0kVrUzczWQM/tAtZUqjSH7EIUUhdpkL3sh6OirOQJond
         3CDO55iME+ENoezOz5CpSefcVcQRD4C1FkK1GZXEsyHROePhGVlqGBaKamne4aEgBowh
         7RRRKIy8AOhzuP6nsaFkBZdL9hwo2VlbUvQxXiJB44B/V0QosOTT0LjMv6PyZ7wBHM7m
         8EuRUotrbPC1iGnJYKO8wxRQrn1L2KmQZs5Ye50rZuMyO3XI9ec2EvweBsNvFUDJHFDy
         9+Ww==
X-Gm-Message-State: AOAM5323965OIMNZDp/tzeV8/sugJSTgLnbUsWv4/F7Jwdoqk+8cxF6B
        Q/ozBHMdQO6+OBEvsuaJdaa/Qw==
X-Google-Smtp-Source: ABdhPJyZjJ83frZH7+qZLKJIhk/MXBm42uU5sJRyHUlxop+HzuyXhSHAKNCu6KfUy2kHlRe3NJm4Ug==
X-Received: by 2002:a65:420c:: with SMTP id c12mr4591719pgq.53.1604623060800;
        Thu, 05 Nov 2020 16:37:40 -0800 (PST)
Received: from localhost ([2620:15c:202:1:f693:9fff:fef4:e70a])
        by smtp.gmail.com with ESMTPSA id x22sm3972259pfp.181.2020.11.05.16.37.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2020 16:37:40 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 1/2] arm64: dts: qcom: sc7180: Add sc7180-lazor-r2
Date:   Thu,  5 Nov 2020 16:37:32 -0800
Message-Id: <20201105163724.v2.1.I5a75056d573808f40fed22ab7d28ea6be5819f84@changeid>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

One important delta with respect to rev1 is a switch of the power
supply for the onboard USB hub from 'pp3300_l7c' to 'pp3300_a' + a
load switch. The actual regulator switch is done by the patch 'arm64:
dts: qcom: sc7180-trogdor: Make pp3300_a the default supply for
pp3300_hub', since it affects the entire trogdor platform. Here we
only add the .dts files for lazor rev2 and replace the generic
compatible entries in the rev1 .dts files.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- patch added to the series

 arch/arm64/boot/dts/qcom/Makefile              |  3 +++
 .../dts/qcom/sc7180-trogdor-lazor-r1-kb.dts    |  4 ++--
 .../dts/qcom/sc7180-trogdor-lazor-r1-lte.dts   |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-lazor-r1.dts  |  4 ++--
 .../dts/qcom/sc7180-trogdor-lazor-r2-kb.dts    | 17 +++++++++++++++++
 .../dts/qcom/sc7180-trogdor-lazor-r2-lte.dts   | 18 ++++++++++++++++++
 .../boot/dts/qcom/sc7180-trogdor-lazor-r2.dts  | 15 +++++++++++++++
 7 files changed, 59 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-kb.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index fb4631f898fd..3d72c7b63c79 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -26,6 +26,9 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r2.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r2-kb.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r2-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sdm630-sony-xperia-ganges-kirin.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
index c3f426c3c30a..99f2c240c339 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-kb.dts
@@ -8,8 +8,8 @@
 #include "sc7180-trogdor-lazor-r1.dts"
 
 / {
-	model = "Google Lazor (rev1+) with KB Backlight";
-	compatible = "google,lazor-sku2", "qcom,sc7180";
+	model = "Google Lazor (rev1) with KB Backlight";
+	compatible = "google,lazor-rev1-sku2", "qcom,sc7180";
 };
 
 &keyboard_backlight {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
index 73e59cf7752a..4074c62207ce 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1-lte.dts
@@ -9,8 +9,8 @@
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google Lazor (rev1+) with LTE";
-	compatible = "google,lazor-sku0", "qcom,sc7180";
+	model = "Google Lazor (rev1) with LTE";
+	compatible = "google,lazor-rev1-sku0", "qcom,sc7180";
 };
 
 &keyboard_backlight {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
index 3151ae31c1cc..f6ee1beba458 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r1.dts
@@ -10,6 +10,6 @@
 #include "sc7180-trogdor-lazor.dtsi"
 
 / {
-	model = "Google Lazor (rev1+)";
-	compatible = "google,lazor", "qcom,sc7180";
+	model = "Google Lazor (rev1)";
+	compatible = "google,lazor-rev1", "qcom,sc7180";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-kb.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-kb.dts
new file mode 100644
index 000000000000..7c3a702ef209
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-kb.dts
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-lazor-r1.dts"
+
+/ {
+	model = "Google Lazor (rev2+) with KB Backlight";
+	compatible = "google,lazor-sku2", "qcom,sc7180";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-lte.dts
new file mode 100644
index 000000000000..e19bdfd329be
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2-lte.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Lazor board device tree source
+ *
+ * Copyright 2020 Google LLC.
+ */
+
+#include "sc7180-trogdor-lazor-r2.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google Lazor (rev2+) with LTE";
+	compatible = "google,lazor-sku0", "qcom,sc7180";
+};
+
+&keyboard_backlight {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2.dts
new file mode 100644
index 000000000000..68c04f6dfc05
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-lazor-r2.dts
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
+	model = "Google Lazor (rev2+)";
+	compatible = "google,lazor", "qcom,sc7180";
+};
-- 
2.29.1.341.ge80a0c044ae-goog

