Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5387431D6F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 18 Oct 2021 15:50:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233469AbhJRNv0 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 18 Oct 2021 09:51:26 -0400
Received: from mo4-p02-ob.smtp.rzone.de ([81.169.146.170]:16751 "EHLO
        mo4-p02-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231893AbhJRNtZ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 18 Oct 2021 09:49:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1634564830;
    s=strato-dkim-0002; d=gerhold.net;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=1mMw6YuDELOq6zOK2SjiTcuTtmZUdFxJCRNKU8bgwTg=;
    b=EVeGBcLZsGBFaLjq8B11jXZNXNuhZgv5iPBTZa4pPya9errCkdlg31jzBl29JFKSM1
    iRFDWOxIfG0oyI3flKXzOnjM9BltGWdegmA/tI2j7wS5o40xZyE6OyyV62TzWuGIn63T
    YJcAT+KIc/qaXNfMlwB2HFI1xEG3zcPieU5Fcc3WFwm6oIu+8M5zm2QW5jOWY/onPoGu
    fxrXXcNDp3WPO8ZnNc1WiakXAzQ4bWe430On1HVuroz2QOuA5DhPoVW80AnLPbrO4er1
    i+OeX8okYPSnHJ0TUqLnnjFF4VClhU9vl7dJarNSdFqXSSp6fAZR4MnKZgSmPB2a+EWe
    qtRw==
Authentication-Results: strato.com;
    dkim=none
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVORvLd4SsytBXQ7UOGqRde+a0fiL1OfxR"
X-RZG-CLASS-ID: mo00
Received: from droid..
    by smtp.strato.de (RZmta 47.33.8 AUTH)
    with ESMTPSA id 301038x9IDlAWs1
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
    Mon, 18 Oct 2021 15:47:10 +0200 (CEST)
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Stephan Gerhold <stephan@gerhold.net>
Subject: [PATCH] arm64: dts: qcom: Drop unneeded extra device-specific includes
Date:   Mon, 18 Oct 2021 15:36:56 +0200
Message-Id: <20211018133656.32649-1-stephan@gerhold.net>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

For some reason apq8016-sbc, apq8096-db820c, msm8916-mtp and msm8996-mtp
were added as separate .dts and .dtsi files where the first only contains
the model name and the latter contains most of the actual definitions.
Perhaps this was done with the expectation that there would be other
devices also making use of exactly the same. However, this has not
been the case until now and it also seems unlikely in the future.
Having the extra .dtsi only clutters the file list and provides
little benefit.

Move the contents of the .dtsi into the .dts file to make this consistent
with most other devices that simply define everything in the .dts.

There are no functional changes introduced by this patch:
The compiled ".dtb"s are completely identical.

Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
---
Note that Git generates a terrible diff by default for this patch.
(It tries to move the contents of the much longer .dtsi into the .dts
 rather than the other way around...)

I had to use some magic to get a properly readable diff, let me know
if this causes any problems for some reason.
---
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts            | 13 -------------
 .../dts/qcom/{apq8016-sbc.dtsi => apq8016-sbc.dts}  |  5 +++++
 arch/arm64/boot/dts/qcom/apq8096-db820c.dts         | 13 -------------
 .../{apq8096-db820c.dtsi => apq8096-db820c.dts}     |  5 +++++
 arch/arm64/boot/dts/qcom/msm8916-mtp.dts            | 13 -------------
 .../dts/qcom/{msm8916-mtp.dtsi => msm8916-mtp.dts}  |  5 +++++
 arch/arm64/boot/dts/qcom/msm8996-mtp.dts            | 13 -------------
 .../dts/qcom/{msm8996-mtp.dtsi => msm8996-mtp.dts}  |  5 +++++
 8 files changed, 20 insertions(+), 52 deletions(-)
 delete mode 100644 arch/arm64/boot/dts/qcom/apq8016-sbc.dts
 rename arch/arm64/boot/dts/qcom/{apq8016-sbc.dtsi => apq8016-sbc.dts} (99%)
 delete mode 100644 arch/arm64/boot/dts/qcom/apq8096-db820c.dts
 rename arch/arm64/boot/dts/qcom/{apq8096-db820c.dtsi => apq8096-db820c.dts} (99%)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8916-mtp.dts
 rename arch/arm64/boot/dts/qcom/{msm8916-mtp.dtsi => msm8916-mtp.dts} (68%)
 delete mode 100644 arch/arm64/boot/dts/qcom/msm8996-mtp.dts
 rename arch/arm64/boot/dts/qcom/{msm8996-mtp.dtsi => msm8996-mtp.dts} (78%)

diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
deleted file mode 100644
index f3c0dbfd0a23..000000000000
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2015, The Linux Foundation. All rights reserved.
- */
-
-/dts-v1/;
-
-#include "apq8016-sbc.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. APQ 8016 SBC";
-	compatible = "qcom,apq8016-sbc", "qcom,apq8016";
-};
diff --git a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
similarity index 99%
rename from arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
rename to arch/arm64/boot/dts/qcom/apq8016-sbc.dts
index 1c097098f1e0..a5320d6d30e7 100644
--- a/arch/arm64/boot/dts/qcom/apq8016-sbc.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8016-sbc.dts
@@ -3,6 +3,8 @@
  * Copyright (c) 2015, The Linux Foundation. All rights reserved.
  */
 
+/dts-v1/;
+
 #include "msm8916-pm8916.dtsi"
 #include <dt-bindings/gpio/gpio.h>
 #include <dt-bindings/input/input.h>
@@ -11,6 +13,9 @@
 #include <dt-bindings/sound/apq8016-lpass.h>
 
 / {
+	model = "Qualcomm Technologies, Inc. APQ 8016 SBC";
+	compatible = "qcom,apq8016-sbc", "qcom,apq8016";
+
 	aliases {
 		serial0 = &blsp1_uart2;
 		serial1 = &blsp1_uart1;
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
deleted file mode 100644
index 757afa27424d..000000000000
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2014-2016, The Linux Foundation. All rights reserved.
- */
-
-/dts-v1/;
-
-#include "apq8096-db820c.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. DB820c";
-	compatible = "arrow,apq8096-db820c", "qcom,apq8096-sbc", "qcom,apq8096";
-};
diff --git a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
similarity index 99%
rename from arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
rename to arch/arm64/boot/dts/qcom/apq8096-db820c.dts
index eca428ab2517..d01a512634cf 100644
--- a/arch/arm64/boot/dts/qcom/apq8096-db820c.dtsi
+++ b/arch/arm64/boot/dts/qcom/apq8096-db820c.dts
@@ -3,6 +3,8 @@
  * Copyright (c) 2014-2016, The Linux Foundation. All rights reserved.
  */
 
+/dts-v1/;
+
 #include "msm8996.dtsi"
 #include "pm8994.dtsi"
 #include "pmi8994.dtsi"
@@ -40,6 +42,9 @@
  */
 
 / {
+	model = "Qualcomm Technologies, Inc. DB820c";
+	compatible = "arrow,apq8096-db820c", "qcom,apq8096-sbc", "qcom,apq8096";
+
 	aliases {
 		serial0 = &blsp2_uart2;
 		serial1 = &blsp2_uart3;
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
deleted file mode 100644
index d66c15538785..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
- */
-
-/dts-v1/;
-
-#include "msm8916-mtp.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. MSM 8916 MTP";
-	compatible = "qcom,msm8916-mtp", "qcom,msm8916-mtp/1", "qcom,msm8916";
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
similarity index 68%
rename from arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
rename to arch/arm64/boot/dts/qcom/msm8916-mtp.dts
index 1bd05046cdeb..7c0ceb3cff45 100644
--- a/arch/arm64/boot/dts/qcom/msm8916-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8916-mtp.dts
@@ -3,9 +3,14 @@
  * Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
  */
 
+/dts-v1/;
+
 #include "msm8916-pm8916.dtsi"
 
 / {
+	model = "Qualcomm Technologies, Inc. MSM 8916 MTP";
+	compatible = "qcom,msm8916-mtp", "qcom,msm8916-mtp/1", "qcom,msm8916";
+
 	aliases {
 		serial0 = &blsp1_uart2;
 		usid0 = &pm8916_0;
diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
deleted file mode 100644
index 45ed594c1b9c..000000000000
--- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
+++ /dev/null
@@ -1,13 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
- */
-
-/dts-v1/;
-
-#include "msm8996-mtp.dtsi"
-
-/ {
-	model = "Qualcomm Technologies, Inc. MSM 8996 MTP";
-	compatible = "qcom,msm8996-mtp";
-};
diff --git a/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
similarity index 78%
rename from arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
rename to arch/arm64/boot/dts/qcom/msm8996-mtp.dts
index ac43a91f1104..7d9fc35bc7a0 100644
--- a/arch/arm64/boot/dts/qcom/msm8996-mtp.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8996-mtp.dts
@@ -3,9 +3,14 @@
  * Copyright (c) 2014-2015, The Linux Foundation. All rights reserved.
  */
 
+/dts-v1/;
+
 #include "msm8996.dtsi"
 
 / {
+	model = "Qualcomm Technologies, Inc. MSM 8996 MTP";
+	compatible = "qcom,msm8996-mtp";
+
 	aliases {
 		serial0 = &blsp2_uart2;
 	};
-- 
2.33.0-magic42

