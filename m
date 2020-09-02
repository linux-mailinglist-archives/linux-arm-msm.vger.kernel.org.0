Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4355425B3DC
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 20:40:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728234AbgIBSke (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 2 Sep 2020 14:40:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728193AbgIBSkP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 2 Sep 2020 14:40:15 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CFBC9C061231
        for <linux-arm-msm@vger.kernel.org>; Wed,  2 Sep 2020 11:40:08 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id n133so623607qkn.11
        for <linux-arm-msm@vger.kernel.org>; Wed, 02 Sep 2020 11:40:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=sLkAJMyvbVghRDtOO8Afw1g+rCDOLVswzkG/FBELZTg=;
        b=2QH0MNDJf3fa03hLOq+xmUxThMn3+ZlJFARVdr/eun9QY/GqiowsI4/2mzfuOwi4ak
         ZAnqdts0d5bJpskDBYKdPTGsXE+meaOXReXcj6+M0s5H733ZZCmgxMG56VEWAdnHa3yw
         qwNiDuHa+wrnHwPa/wo0ncDOvPgcFEgxvBYx2vXtDzs6LpWCOrq35UNB5jqETdQvAfy5
         WKMN3IJ/99NYjXayvzN+B5E4dnIAWKHxQMXBBkiPdIMMm1igfOdhunZpug2qaxRah5xL
         B0jL1oOpvoBetUYBw3JDdHIR0jz8MDv0MKGtRr4ZeSOIhUP3w92StWMoauOO9PrsUdQw
         4rlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=sLkAJMyvbVghRDtOO8Afw1g+rCDOLVswzkG/FBELZTg=;
        b=nGIcsR69eq35FciWymYRqTCDYh0FCDMn7oPrOzvsG1G/LS+ak1VBx78WiwYOSpImEB
         8Mz8+BhLYPnwkLs2LRO61uxuIuq5f/CNL9gxFSskomKH3ARIDLyhHNGsLqqNoqJrE8h6
         Dmkyy+BDAbH7KiWAMKbX5aM4DcWMHhI9HIAdtnNRFKV0b2pPCewnSh/8cpCbS0NPQUEJ
         JNOrI3EG9SgOF4FHXukfnBrEB7boJOQ26AvECD8r+elf5NbYIS9jkeAOHDA+OGzG+s9A
         9xZT6DJmuUIWPPanXS6bFcxFuLLebB0C+0GRHzK4PKS6La1evmlt+lercYFPJRJHqJ0D
         OErA==
X-Gm-Message-State: AOAM533lGlADPFtOc2Cru+LBbiYMMPr0Can4v8lhpSuE8akK7glc4uXN
        NTI1NDWCRumyIqQKPlCycX1yq4Ikbe9e93klhDU=
X-Google-Smtp-Source: ABdhPJyLkPKEVmFjLuet4jXKMkVcy4hE9BO3sxuksWjhXeXnkzXCTfLBfugemE0+omiTXKwh174fmw==
X-Received: by 2002:a05:620a:1381:: with SMTP id k1mr8282425qki.140.1599072007799;
        Wed, 02 Sep 2020 11:40:07 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id s47sm208004qtb.13.2020.09.02.11.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2020 11:40:07 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/7] dt-bindings: clock: Introduce QCOM SM8250 display clock bindings
Date:   Wed,  2 Sep 2020 14:38:45 -0400
Message-Id: <20200902183852.14510-6-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200902183852.14510-1-jonathan@marek.ca>
References: <20200902183852.14510-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for display clock controller for
Qualcomm Technology Inc's SM8250 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/clock/qcom,dispcc.yaml           |  4 +-
 .../dt-bindings/clock/qcom,dispcc-sm8250.h    | 66 +++++++++++++++++++
 2 files changed, 69 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8250.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
index 43efd451959a..216ab7732007 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
@@ -11,12 +11,13 @@ maintainers:
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180/SM8150.
+  power domains on SDM845/SC7180/SM8150/SM8250.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sdm845.h
     dt-bindings/clock/qcom,dispcc-sc7180.h
     dt-bindings/clock/qcom,dispcc-sm8150.h
+    dt-bindings/clock/qcom,dispcc-sm8250.h
 
 properties:
   compatible:
@@ -24,6 +25,7 @@ properties:
       - qcom,sdm845-dispcc
       - qcom,sc7180-dispcc
       - qcom,sm8150-dispcc
+      - qcom,sm8250-dispcc
 
   # NOTE: sdm845.dtsi existed for quite some time and specified no clocks.
   # The code had to use hardcoded mechanisms to find the input clocks.
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8250.h b/include/dt-bindings/clock/qcom,dispcc-sm8250.h
new file mode 100644
index 000000000000..fdaca6ad5c85
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8250.h
@@ -0,0 +1,66 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8250_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8250_H
+
+/* DISP_CC clock registers */
+#define DISP_CC_MDSS_AHB_CLK			0
+#define DISP_CC_MDSS_AHB_CLK_SRC		1
+#define DISP_CC_MDSS_BYTE0_CLK			2
+#define DISP_CC_MDSS_BYTE0_CLK_SRC		3
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC		4
+#define DISP_CC_MDSS_BYTE0_INTF_CLK		5
+#define DISP_CC_MDSS_BYTE1_CLK			6
+#define DISP_CC_MDSS_BYTE1_CLK_SRC		7
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC		8
+#define DISP_CC_MDSS_BYTE1_INTF_CLK		9
+#define DISP_CC_MDSS_DP_AUX1_CLK		10
+#define DISP_CC_MDSS_DP_AUX1_CLK_SRC		11
+#define DISP_CC_MDSS_DP_AUX_CLK			12
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC		13
+#define DISP_CC_MDSS_DP_LINK1_CLK		14
+#define DISP_CC_MDSS_DP_LINK1_CLK_SRC		15
+#define DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC	16
+#define DISP_CC_MDSS_DP_LINK1_INTF_CLK		17
+#define DISP_CC_MDSS_DP_LINK_CLK		18
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC		19
+#define DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC	20
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK		21
+#define DISP_CC_MDSS_DP_PIXEL1_CLK		22
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC		23
+#define DISP_CC_MDSS_DP_PIXEL2_CLK		24
+#define DISP_CC_MDSS_DP_PIXEL2_CLK_SRC		25
+#define DISP_CC_MDSS_DP_PIXEL_CLK		26
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC		27
+#define DISP_CC_MDSS_ESC0_CLK			28
+#define DISP_CC_MDSS_ESC0_CLK_SRC		29
+#define DISP_CC_MDSS_ESC1_CLK			30
+#define DISP_CC_MDSS_ESC1_CLK_SRC		31
+#define DISP_CC_MDSS_MDP_CLK			32
+#define DISP_CC_MDSS_MDP_CLK_SRC		33
+#define DISP_CC_MDSS_MDP_LUT_CLK		34
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		35
+#define DISP_CC_MDSS_PCLK0_CLK			36
+#define DISP_CC_MDSS_PCLK0_CLK_SRC		37
+#define DISP_CC_MDSS_PCLK1_CLK			38
+#define DISP_CC_MDSS_PCLK1_CLK_SRC		39
+#define DISP_CC_MDSS_ROT_CLK			40
+#define DISP_CC_MDSS_ROT_CLK_SRC		41
+#define DISP_CC_MDSS_RSCC_AHB_CLK		42
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK		43
+#define DISP_CC_MDSS_VSYNC_CLK			44
+#define DISP_CC_MDSS_VSYNC_CLK_SRC		45
+#define DISP_CC_PLL0				46
+#define DISP_CC_PLL1				47
+
+/* DISP_CC Reset */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC				0
+
+#endif
-- 
2.26.1

