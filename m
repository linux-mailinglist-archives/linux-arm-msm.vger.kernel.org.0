Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 214AB28392C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Oct 2020 17:11:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726730AbgJEPKz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 5 Oct 2020 11:10:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725970AbgJEPKl (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 5 Oct 2020 11:10:41 -0400
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com [IPv6:2a00:1450:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D5314C0613CE;
        Mon,  5 Oct 2020 08:10:40 -0700 (PDT)
Received: by mail-wr1-x444.google.com with SMTP id o5so9993491wrn.13;
        Mon, 05 Oct 2020 08:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=61sqlqf5DafArIIzaf0d46tvaomigu2E5aU6czoyheo=;
        b=fKPbnOC5Qfro2yRVg/8ttKDTcR68Xp1AFBF4tFOJcZpABp/DW1n4OBnHimGABy6goK
         weB/jWAdzvEGvcaWdZ4ncXiOXrVFSpDXHJKt+kFzRPK7woCFTxbUtBAMl2o+gyMoUjhV
         rg3My3copnFbsZG+Tw7vAPFHs2ONjkFQM9cxxaKCQtV2EzQV6nXx8UhMBR8wuFG1I7yb
         5thw9MACHLD9E2DOAbs3KI1IdgvDG6yXJ+4FNK3rvjDIWouW5tU9fMdyEspJj3a2Lwxy
         Mdek3/vEDHLjV9pVHzQX+hcpOHiZ2dm771+GnsL08iPCK8iOwaZSpzCYYvnTSslOMjRa
         T1IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=61sqlqf5DafArIIzaf0d46tvaomigu2E5aU6czoyheo=;
        b=sQ6rd1MGw26rimlB6uP4m7jYjoO3rjRnpJ4hmd3/uydq6nlH/hdoCYLbnKMFM3H09M
         bpRkmpIGcK2StEEfY3rMLT2oibvvgtcOZE/z0wu3RixptjIktQGjy1DzAbef68LShu3h
         4LUUV3HesABsku2WGamGTjFa8by++kAQXP8eYVRNl9SVQhG3RJqo2hMDjXbJ3Ol4NdbS
         ggWlLNOMLLpsj4SUgtga6WiTxkqYmP/v4+aFBlxVO9hcNj0JakFd7QwYn51KwoYZNokZ
         uiBNgQcBYzo8vuIsG6dp697JUeQgn1zNT23ruVH/SZH45SXwuckhfwGITeU85JMS+lgW
         s1hA==
X-Gm-Message-State: AOAM531qwzaJMgdLVquIeuuUnW424y44G9CDnyqzr9QD1Fjmeu3m7bhC
        Ly8LmrwpJbB4hCQ1wyxPaYQ=
X-Google-Smtp-Source: ABdhPJzefvGCaBYqbP/hvMMN1mJnJ/1FqfCGGlhKbYKSGmu5atq5gT6wCf4aE5JBGmiA9PmuaHMJKA==
X-Received: by 2002:adf:e7c4:: with SMTP id e4mr12076173wrn.113.1601910639541;
        Mon, 05 Oct 2020 08:10:39 -0700 (PDT)
Received: from localhost.localdomain (abab191.neoplus.adsl.tpnet.pl. [83.6.165.191])
        by smtp.googlemail.com with ESMTPSA id 67sm18077wmb.31.2020.10.05.08.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2020 08:10:38 -0700 (PDT)
From:   Konrad Dybcio <konradybcio@gmail.com>
To:     konradybcio@gmail.com
Cc:     ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: Add support for remaining Sony Kitakami boards
Date:   Mon,  5 Oct 2020 17:10:34 +0200
Message-Id: <20201005151035.150936-1-konradybcio@gmail.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds support for the following Xperias:

* Z3+ [aka Z4 in some regions] (Ivy)
* Z4 Tablet (Karin)
* Z5 Compact (Suzuran)
* Z5 Premium (Satsuki)

These devices are very similar in terms of hardware, with the main
differences being display and touch panels.

Signed-off-by: Konrad Dybcio <konradybcio@gmail.com>
---
 arch/arm64/boot/dts/qcom/Makefile                |  4 ++++
 .../qcom/msm8994-sony-xperia-kitakami-ivy.dts    | 16 ++++++++++++++++
 .../qcom/msm8994-sony-xperia-kitakami-karin.dts  | 16 ++++++++++++++++
 .../msm8994-sony-xperia-kitakami-satsuki.dts     | 15 +++++++++++++++
 .../msm8994-sony-xperia-kitakami-suzuran.dts     | 15 +++++++++++++++
 .../dts/qcom/msm8994-sony-xperia-kitakami.dtsi   |  2 +-
 6 files changed, 67 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
 create mode 100644 arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 030d9648fb11..88c0c9fd8495 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -13,7 +13,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-msft-lumia-talkman.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8992-xiaomi-libra.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-angler-rev-101.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-msft-lumia-cityman.dts
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-ivy.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-karin.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-satsuki.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-sumire.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= msm8994-sony-xperia-kitakami-suzuran.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8996-mtp.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-asus-novago-tp370ql.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= msm8998-hp-envy-x2.dtb
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
new file mode 100644
index 000000000000..ff631e5de257
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-ivy.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z3+/Z4";
+	compatible = "sony,ivy-row", "qcom,msm8994";
+
+	qcom,msm-id = <0xcf 0x00>, <0xcf 0x10000>, <0xcf 0x20000>;
+	qcom,board-id = <0x08 0x00>, <0x10008 0x00>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
new file mode 100644
index 000000000000..e46036daf817
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-karin.dts
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z4 Tablet";
+	compatible = "sony,karin-row", "qcom,msm8994";
+
+	qcom,msm-id = <0xcf 0x00>, <0xcf 0x10000>, <0xcf 0x20000>;
+	qcom,board-id = <0x08 0x00>, <0x10008 0x00>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
new file mode 100644
index 000000000000..3aa95e3474de
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-satsuki.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z5 Premium";
+	compatible = "sony,satsuki-row", "qcom,msm8994";
+
+	qcom,msm-id = <0xcf 0x20000>, <0xcf 0x20000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
new file mode 100644
index 000000000000..79c48a7bb8f9
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami-suzuran.dts
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2020, Konrad Dybcio
+ */
+
+/dts-v1/;
+
+#include "msm8994-sony-xperia-kitakami.dtsi"
+
+/ {
+	model = "Sony Xperia Z5 Compact";
+	compatible = "sony,suzuran-row", "qcom,msm8994";
+
+	qcom,msm-id = <0xcf 0x20000>;
+};
diff --git a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
index 791f254ac3f8..af1bbb0be1c5 100644
--- a/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi
@@ -11,7 +11,7 @@
 
 / {
 	/* required for bootloader to select correct board */
-	qcom,msm-id = <0xcf 0x20001>;
+	qcom,msm-id = <0xcf 0x20000>, <0xcf 0x20001>;
 	qcom,pmic-id = <0x10009 0x1000a 0x00 0x00>;
 	qcom,board-id = <8 0>;
 
-- 
2.28.0

