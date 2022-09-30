Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 80A6D5F05D6
	for <lists+linux-arm-msm@lfdr.de>; Fri, 30 Sep 2022 09:38:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231149AbiI3HiU (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 30 Sep 2022 03:38:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231156AbiI3HiS (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 30 Sep 2022 03:38:18 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D33D11F9CA1
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 00:38:10 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id io19so219515plb.10
        for <linux-arm-msm@vger.kernel.org>; Fri, 30 Sep 2022 00:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=quanta-corp-partner-google-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=K8IxDNB/5u3rlFY8uT/hAiU++pvG5ZUPWxmw8WKVt/o=;
        b=rncaVYhlJtyxNbA2+PsxPsWwgCNiYKxzUeKvol97lIrnzw18ELTRB7nFmsHdf+m8+l
         0I+60uX3jzXaoetO1Rq8sYb1sBMGaoUEvY5D6Pb70ZIo5YtCiMUpcOQwCBw70gY2eR23
         km0EKh3XTrWJGeFg9qJPfbCLGr/KYpgKjQuujlYevj1kKgQ7P4wlcVqB2LuYvvvAo0zK
         7yVQLSMZVIe68FBoNpsD7rVQNnJ0WTEA4Xe7mLCdBDe/8GlrHSsCKdwG/aMtXofyVD6Z
         SzqBTdLBhmCtHgODRQ4mkDuI87k8y9OAsuxNaw1hZ/h/5DQna2YVSNLxK47vq9yqXHCo
         E0fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=K8IxDNB/5u3rlFY8uT/hAiU++pvG5ZUPWxmw8WKVt/o=;
        b=XLk3yuDNQf+98OUsqnMrs97HmmLpg6chqo8Oe/PyOFfgs5N0DGYd7fQ8pK7BWYEj2D
         k1iQH4zBqrCFQD4AEHo6v0nYmilX2fVW3YoRdTnxnf1G8HhqpsIOPddR8cCn4hdEFkaz
         ocVSJlXA/n8UozDhXHrTS+/XwaOZHMPLmBzBDBvhA4wvVw5D8Lj2nWsAmcqwOjvkGo5F
         y/ruqPOzVOyOxuVn0LG3qU46q+/7aSgGJZjhEZ3UfRPDH+YricNcQOWrFN5oamkgyxQC
         cl5z/QI+/OfeC/cu4vYoGqlDUg0Dkkx7782QUrtRxLNmTzrsmfleHjssZlq/iT9/5N4T
         uybA==
X-Gm-Message-State: ACrzQf1N6CIyc0WVX/jZHz1SsTxmwmZ5Jj74Auxc4XAXMZf/fk8niyk5
        7o1dMe8ureRSE1hBC6oVoj5SDQ==
X-Google-Smtp-Source: AMsMyM7A6LcK5I9C0kxAsIXqeXkx5bs1Q2070FWwJDDV0efwSJu9B7CHKhxNbPDTH57q+ci2n9o57w==
X-Received: by 2002:a17:90b:4c8a:b0:202:b3cd:f960 with SMTP id my10-20020a17090b4c8a00b00202b3cdf960mr8173898pjb.129.1664523489638;
        Fri, 30 Sep 2022 00:38:09 -0700 (PDT)
Received: from liang-Predator-PH517-52.. (60-250-232-247.hinet-ip.hinet.net. [60.250.232.247])
        by smtp.gmail.com with ESMTPSA id e8-20020a170902ef4800b0017ba371b0a9sm1166132plx.167.2022.09.30.00.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Sep 2022 00:38:09 -0700 (PDT)
From:   Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
To:     LKML <linux-kernel@vger.kernel.org>
Cc:     dianders@chromium.org,
        Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: [PATCH v5 2/3] arm64: dts: qcom: Add LTE SKU for sc7280-evoker family
Date:   Fri, 30 Sep 2022 15:37:53 +0800
Message-Id: <20220930153538.v5.2.I1454364ac3d8ecc64677884d6b7d2f3e334e4b4a@changeid>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220930073754.1391044-1-sheng-liang.pan@quanta.corp-partner.google.com>
References: <20220930073754.1391044-1-sheng-liang.pan@quanta.corp-partner.google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

evoker have wifi/lte sku, add different dts for each sku.

Signed-off-by: Sheng-Liang Pan <sheng-liang.pan@quanta.corp-partner.google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v5:
- remove unnecessary whitespace

Changes in v4:
- remove change for trackpad and touchscreen

 arch/arm64/boot/dts/qcom/Makefile                 |  3 ++-
 .../boot/dts/qcom/sc7280-herobrine-evoker-lte.dts | 14 ++++++++++++++
 .../boot/dts/qcom/sc7280-herobrine-evoker.dts     | 15 +++++++++++++++
 ...evoker-r0.dts => sc7280-herobrine-evoker.dtsi} |  7 -------
 4 files changed, 31 insertions(+), 8 deletions(-)
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
 create mode 100644 arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
 rename arch/arm64/boot/dts/qcom/{sc7280-herobrine-evoker-r0.dts => sc7280-herobrine-evoker.dtsi} (98%)

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 65cb0f714ed6b..91153baeeffae 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -95,7 +95,8 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-wormdingler-rev1-boe-rt5682s.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7180-trogdor-r1-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-crd.dtb
-dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-evoker-r0.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-evoker.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-evoker-lte.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-herobrine-r1.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-villager-r0.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= sc7280-herobrine-villager-r1.dtb
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
new file mode 100644
index 0000000000000..3af9224a7492e
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-lte.dts
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Evoker board device tree source
+ *
+ * Copyright 2022 Google LLC.
+ */
+
+#include "sc7280-herobrine-evoker.dts"
+#include "sc7280-herobrine-lte-sku.dtsi"
+
+/ {
+	model = "Google Evoker with LTE";
+	compatible = "google,evoker-sku512", "qcom,sc7280";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
new file mode 100644
index 0000000000000..dcdd4eecfe670
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Google Evoker board device tree source
+ *
+ * Copyright 2022 Google LLC.
+ */
+
+/dts-v1/;
+
+#include "sc7280-herobrine-evoker.dtsi"
+
+/ {
+	model = "Google Evoker";
+	compatible = "google,evoker", "qcom,sc7280";
+};
diff --git a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
similarity index 98%
rename from arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
rename to arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
index ccbe50b6249ab..e78072159d54b 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker-r0.dts
+++ b/arch/arm64/boot/dts/qcom/sc7280-herobrine-evoker.dtsi
@@ -5,15 +5,8 @@
  * Copyright 2022 Google LLC.
  */
 
-/dts-v1/;
-
 #include "sc7280-herobrine.dtsi"
 
-/ {
-	model = "Google Evoker";
-	compatible = "google,evoker", "qcom,sc7280";
-};
-
 /*
  * ADDITIONS TO FIXED REGULATORS DEFINED IN PARENT DEVICE TREE FILES
  *
-- 
2.34.1

