Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9F2A7339698
	for <lists+linux-arm-msm@lfdr.de>; Fri, 12 Mar 2021 19:33:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233507AbhCLScy (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 12 Mar 2021 13:32:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233439AbhCLScn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 12 Mar 2021 13:32:43 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3C4C061761
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 10:32:43 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id t18so5556874pjs.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 12 Mar 2021 10:32:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0I3DtXSbVjxMHtTFTJIXAlEnDZYc1xykz6UdSiaQCOw=;
        b=oNkKYyG/QsuZKArEA8O8Z5QEThmmXalEZVsYheMKKAgn1e0LJUZbEGmxIaKMfVWrVG
         Jsu3I8hA2gZZF+ZU8RNpnfbqVDwkPYSYkIZQ9jtl7C0WnP61Cc4gA4GD11uXQliAPBNK
         aj+yFTqPBK2q0B2y1OufV0lK7HbZGFRo7aTtM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0I3DtXSbVjxMHtTFTJIXAlEnDZYc1xykz6UdSiaQCOw=;
        b=bJLfWU/d7pPx8IOEiouQv4jWH8P7LVZ9QJ3qzE+dK81msBz2nfkX4MdeGS7gQqvm3v
         12dvWyhjHEI+ntmxqfK++Eee5f1caKxHKsxj7ibO3wbN6SEV8ObmG6yw2Z91LyJnteIa
         BmFWhTLHX1eKibXv5kMHpl4k0V7EjAPBJ3Xt+mtGEdMGIBStkxq8SnMmyyB3rZLdQHGx
         UV4ddJYu75g3Fz70e4Vm7RKil5veDK7W1ZlbSkLZOqr+feDgFFdh+MKFlggGzxbpaw8D
         AdHNNWh9lZ20jk0aXMuh+Zlx31nizOKyxj3rmUHGKgzYj1UYqD4OiWOM/YZyDutklfUF
         HXGA==
X-Gm-Message-State: AOAM533SaUDBtW5gJkpUJW+MSNtIU2l4gCslCEGnIbaXYF22qKOji8+X
        lnFRUIp/p3YHZmnDkOoKM8M8bWOfBYdMCw==
X-Google-Smtp-Source: ABdhPJx7jw6HjWIzh3kR22Y3MbkO+ihO0jNSScjXTYDAzjkkCOL1wqPjzWoYiOJY7bLdnG+hqr+lJg==
X-Received: by 2002:a17:90a:e50c:: with SMTP id t12mr15106321pjy.138.1615573963179;
        Fri, 12 Mar 2021 10:32:43 -0800 (PST)
Received: from localhost ([2620:15c:202:1:914f:6483:1dc:1bba])
        by smtp.gmail.com with UTF8SMTPSA id ge16sm2851947pjb.43.2021.03.12.10.32.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Mar 2021 10:32:42 -0800 (PST)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org,
        Douglas Anderson <dianders@chromium.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 3/3] arm64: dts: qcom: sc7180: Add CoachZ rev3
Date:   Fri, 12 Mar 2021 10:32:28 -0800
Message-Id: <20210312103211.v2.3.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210312183228.550779-1-mka@chromium.org>
References: <20210312183228.550779-1-mka@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

CoachZ rev3 uses a 100k NTC thermistor for the charger temperatures,
instead of the 47k NTC that is stuffed in earlier revisions. Add .dts
files for rev3.

The 47k NTC currently isn't supported by the PM6150 ADC driver.
Disable the charger thermal zone for rev1 and rev2 to avoid the use
of bogus temperature values.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---

Changes in v2:
- added CoachZ rev3
- updated subject and commit message

 arch/arm64/boot/dts/qcom/Makefile              |  2 ++
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts |  9 +++++++++
 .../dts/qcom/sc7180-trogdor-coachz-r2-lte.dts  |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-coachz-r2.dts | 13 +++++++++++--
 .../dts/qcom/sc7180-trogdor-coachz-r3-lte.dts  | 18 ++++++++++++++++++
 .../boot/dts/qcom/sc7180-trogdor-coachz-r3.dts | 15 +++++++++++++++
 6 files changed, 57 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 11aa83ca798f..ffb6d662754a 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -35,6 +35,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r2.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r2-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
index 86619f6c1134..c6b078e70d31 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -14,6 +14,15 @@ / {
 	compatible = "google,coachz-rev1", "qcom,sc7180";
 };
 
+/*
+ * CoachZ rev1 is stuffed with a 47k NTC as charger thermistor which currently
+ * is not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
+};
+
 &tlmm {
 	gpio-line-names = "HUB_RST_L",
 			  "AP_RAM_ID0",
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
index 6e7745801fae..5d92309af091 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
@@ -9,8 +9,8 @@
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google CoachZ (rev2+) with LTE";
-	compatible = "google,coachz-sku0", "qcom,sc7180";
+	model = "Google CoachZ (rev2) with LTE";
+	compatible = "google,coachz-rev2-sku0", "qcom,sc7180";
 };
 
 &cros_ec_proximity {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
index 4f69b6ba299f..6ce2b1534a68 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
@@ -10,6 +10,15 @@
 #include "sc7180-trogdor-coachz.dtsi"
 
 / {
-	model = "Google CoachZ (rev2+)";
-	compatible = "google,coachz", "qcom,sc7180";
+	model = "Google CoachZ (rev2)";
+	compatible = "google,coachz-rev2", "qcom,sc7180";
+};
+
+/*
+ * CoachZ rev2 is stuffed with a 47k NTC as charger thermistor which currently
+ * is not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
 };
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
new file mode 100644
index 000000000000..d23409034e8c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google CoachZ board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+#include "sc7180-trogdor-coachz-r3.dts"
+#include "sc7180-trogdor-lte-sku.dtsi"
+
+/ {
+	model = "Google CoachZ (rev3+) with LTE";
+	compatible = "google,coachz-sku0", "qcom,sc7180";
+};
+
+&cros_ec_proximity {
+	label = "proximity-wifi-lte";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts
new file mode 100644
index 000000000000..a02d2d57c78c
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google CoachZ board device tree source
+ *
+ * Copyright 2021 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7180-trogdor-coachz.dtsi"
+
+/ {
+	model = "Google CoachZ (rev3+)";
+	compatible = "google,coachz", "qcom,sc7180";
+};
-- 
2.31.0.rc2.261.g7f71774620-goog

