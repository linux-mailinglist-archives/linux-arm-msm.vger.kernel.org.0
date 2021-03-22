Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F4127344C23
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Mar 2021 17:47:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231719AbhCVQrX (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Mar 2021 12:47:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231148AbhCVQqr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Mar 2021 12:46:47 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A15BC061762
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:46:46 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id kk2-20020a17090b4a02b02900c777aa746fso8830291pjb.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Mar 2021 09:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=OIhzGD6weism7EEZJmrFjVrI+R4NmB79ezAybkk6vX8=;
        b=VGrzFuAtWqr69r687nj09FF8EZQY7OuiTw9ckFwvcIqns4FFze7kCFF8h9dLtp8+FA
         n+4VbhKsIeepLppDhoUocsU4poxMDzAv7PWOaa/P0cyWiAfRyWRV1JTGgTs5Rj7MGw89
         MJA0Lg1VzuatgE3wr7nirN5s8xSZRuwMivxHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OIhzGD6weism7EEZJmrFjVrI+R4NmB79ezAybkk6vX8=;
        b=m+sP/ouq09QkwDcY4CAfbTEc7dUkgL9uSqDlIEeVv04hvjMYgdeZdmphItKOfz3SEG
         lGu2+8P1DxnCo+L6p083JODC3louX7Iyy8Os5RE8IE3f4CaZbPinNo0S8hduvMJH64bS
         CYCq8rosAVqXjg8BbKQwa1+B6oP1p77J5bPGT6bxoJreDjpRGLc/RpvCOeK78Bgr60fm
         xSuicNCeVFtzBRbw0QZhXhuTpDbkpDo8+5LaoYDwUu/3oAik4pSA5DDI8W+2zNo6hguX
         x0gNDEmTyRJV1NuW/9jv6D8PXJpXXTXoVyQ7VK1giE2o6UKLXz3RImJAIBnJfHTyW4cg
         IHpg==
X-Gm-Message-State: AOAM53269ezervPExzDSX6UN9oIODG07BWzij8E0qIUT4OIy3bYdk1ic
        LFKk0atvBD/pUqcLGJvGsnX40g==
X-Google-Smtp-Source: ABdhPJxHqpyeMWUORP/mRnaO5qLyqlLLPZ2Netpk6XmSZOMFoNF1fZ4prJFCiourxpObJ0nkwWVmbQ==
X-Received: by 2002:a17:902:c94c:b029:e6:cd16:24ec with SMTP id i12-20020a170902c94cb02900e6cd1624ecmr512095pla.27.1616431605565;
        Mon, 22 Mar 2021 09:46:45 -0700 (PDT)
Received: from localhost ([2620:15c:202:1:90a9:b908:f93a:2f78])
        by smtp.gmail.com with UTF8SMTPSA id d124sm14289179pfa.149.2021.03.22.09.46.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 09:46:45 -0700 (PDT)
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Douglas Anderson <dianders@chromium.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v4 3/3] arm64: dts: qcom: sc7180: Add CoachZ rev3
Date:   Mon, 22 Mar 2021 09:46:35 -0700
Message-Id: <20210322094628.v4.3.I95b8a63103b77cab6a7cf9c150f0541db57fda98@changeid>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
In-Reply-To: <20210322164635.273729-1-mka@chromium.org>
References: <20210322164635.273729-1-mka@chromium.org>
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

This also gets rid of the explicit DT files for rev2 and handles
rev2 in the rev1 .dts instead. There was some back and forth
downstream involving the 'dmic_clk_en' pin, after that was sorted
out the DT for rev1 and rev2 is the same.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v4:
- added Reviewed-by tag from Doug

Changes in v3:
- get rid of separate .dts for rev2

Changes in v2:
- added CoachZ rev3
- updated subject and commit message

 arch/arm64/boot/dts/qcom/Makefile                   |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts  |  4 ++--
 .../boot/dts/qcom/sc7180-trogdor-coachz-r1.dts      | 13 +++++++++++--
 ...-r2-lte.dts => sc7180-trogdor-coachz-r3-lte.dts} |  6 +++---
 ...r-coachz-r2.dts => sc7180-trogdor-coachz-r3.dts} |  4 ++--
 5 files changed, 20 insertions(+), 11 deletions(-)
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-coachz-r2-lte.dts => sc7180-trogdor-coachz-r3-lte.dts} (69%)
 rename arch/arm64/boot/dts/qcom/{sc7180-trogdor-coachz-r2.dts => sc7180-trogdor-coachz-r3.dts} (75%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 11aa83ca798f..39db370cf1a4 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -33,8 +33,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= qrb5165-rb5.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-idp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r1-lte.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r2.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r2-lte.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-coachz-r3-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-lazor-r1-kb.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
index 533c048903ea..82dc00cc7fb9 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1-lte.dts
@@ -9,8 +9,8 @@
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google CoachZ (rev1) with LTE";
-	compatible = "google,coachz-rev1-sku0", "qcom,sc7180";
+	model = "Google CoachZ (rev1 - 2) with LTE";
+	compatible = "google,coachz-rev1-sku0", "google,coachz-rev2-sku0", "qcom,sc7180";
 };
 
 &cros_ec_proximity {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
index 86619f6c1134..b9c252df9fa1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r1.dts
@@ -10,8 +10,17 @@
 #include "sc7180-trogdor-coachz.dtsi"
 
 / {
-	model = "Google CoachZ (rev1)";
-	compatible = "google,coachz-rev1", "qcom,sc7180";
+	model = "Google CoachZ (rev1 - 2)";
+	compatible = "google,coachz-rev1", "google,coachz-rev2", "qcom,sc7180";
+};
+
+/*
+ * CoachZ rev1 is stuffed with a 47k NTC as charger thermistor which currently
+ * is not supported by the PM6150 ADC driver. Disable the charger thermal zone
+ * to avoid using bogus temperature values.
+ */
+&charger_thermal {
+	status = "disabled";
 };
 
 &tlmm {
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
similarity index 69%
rename from arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
rename to arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
index 6e7745801fae..d23409034e8c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2-lte.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3-lte.dts
@@ -2,14 +2,14 @@
 /*
  * Google CoachZ board device tree source
  *
- * Copyright 2020 Google LLC.
+ * Copyright 2021 Google LLC.
  */
 
-#include "sc7180-trogdor-coachz-r2.dts"
+#include "sc7180-trogdor-coachz-r3.dts"
 #include "sc7180-trogdor-lte-sku.dtsi"
 
 / {
-	model = "Google CoachZ (rev2+) with LTE";
+	model = "Google CoachZ (rev3+) with LTE";
 	compatible = "google,coachz-sku0", "qcom,sc7180";
 };
 
diff --git a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts
similarity index 75%
rename from arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
rename to arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts
index 4f69b6ba299f..a02d2d57c78c 100644
--- a/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r2.dts
+++ b/arch/arm64/boot/dts/qcom/sc7180-trogdor-coachz-r3.dts
@@ -2,7 +2,7 @@
 /*
  * Google CoachZ board device tree source
  *
- * Copyright 2020 Google LLC.
+ * Copyright 2021 Google LLC.
  */
 
 /dts-v1/;
@@ -10,6 +10,6 @@
 #include "sc7180-trogdor-coachz.dtsi"
 
 / {
-	model = "Google CoachZ (rev2+)";
+	model = "Google CoachZ (rev3+)";
 	compatible = "google,coachz", "qcom,sc7180";
 };
-- 
2.31.0.rc2.261.g7f71774620-goog

