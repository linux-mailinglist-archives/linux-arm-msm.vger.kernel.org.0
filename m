Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6EDD725CD81
	for <lists+linux-arm-msm@lfdr.de>; Fri,  4 Sep 2020 00:28:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729506AbgICW14 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 3 Sep 2020 18:27:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53388 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729311AbgICW1W (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 3 Sep 2020 18:27:22 -0400
Received: from mail-qt1-x844.google.com (mail-qt1-x844.google.com [IPv6:2607:f8b0:4864:20::844])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D978C061262
        for <linux-arm-msm@vger.kernel.org>; Thu,  3 Sep 2020 15:27:19 -0700 (PDT)
Received: by mail-qt1-x844.google.com with SMTP id z2so3197463qtv.12
        for <linux-arm-msm@vger.kernel.org>; Thu, 03 Sep 2020 15:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=dM7ktuvRnNDJhV9rKWL8APHzBx/AziZoIpWf8IG7AUI=;
        b=MR7WpCjTZzddZmNQKvfsltWEajGjdTbkA1/+wF9PTaKAtiCd5xCnEtnYhgETO34XLy
         xHY9mmqBJ1RE6Sf697zyATDLkqbn+VCofqJFNaVNI26sKSKHGmC6QqKBo+z94SOyRyzt
         Dan/u4PKnGmkKG2f5Xv39WAFTNUDPYNU0fQPleMw2UFJFmO+LL+DfUs97IrMFY7I1GtV
         3me3G48FcyCpqgt7f8ZSH7oDiIVJZE4h9/xRuSTf8D9+f2U3Gfv8Ke39saW+aIUOmpRw
         5kMxnuc/b0DLA9x6dH37fkMI7Hp2lRJ5uBCpcrYHU//ozVQdwsk4sNAThZP62jnsrvAT
         ZD+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=dM7ktuvRnNDJhV9rKWL8APHzBx/AziZoIpWf8IG7AUI=;
        b=pMJl2IHV6peVTxFItvwUx68NwuJp0SxSh9dmN9BVcdFezHBsYYfySPgsYoKQov9Os9
         hibJTVmyY2MQGtfmzI7yiCpYfKTh6TiY/OPHX/30c39hYAG3rkLC9lb44M0aYGJcw/Dz
         9oKXc0LDDn1Q4tYGaNvUHB0UoFchCPItlbdifyc80uhToxSK+6gnJlCFjJhOnfDwz2WU
         kn+u03rSj0QR34DSCaz8ppBebPFw1YB/RXU3hq/idO75Cw8Etl02gU/Wnr/i6WXE//Cc
         DaceSP4EudDf5EMtQqq0ascdTQeYfyPXCCsnn4vk0f0JCCDWbgjolb4aBumRoEc/0js2
         9Cqg==
X-Gm-Message-State: AOAM532KpaW1mu22YBVNfkXKwxEdIdCYztnAz7h9NaZbRa9RwLp1jE6U
        D6vw0JfHTN1QeB2hUGMJsOsGKR3HzDHE2u8nl2c=
X-Google-Smtp-Source: ABdhPJy3hT3bKfsBzrVnyvSooHde4Pibdbi7RBaW/h68H9MHxW0i1bqc5l2kZF4PP8jR2Jv+I4EZhA==
X-Received: by 2002:ac8:3836:: with SMTP id q51mr5924878qtb.41.1599172038100;
        Thu, 03 Sep 2020 15:27:18 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id y30sm3217157qth.7.2020.09.03.15.27.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2020 15:27:17 -0700 (PDT)
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
Subject: [PATCH v2 4/7] dt-bindings: clock: Introduce QCOM SM8150 display clock bindings
Date:   Thu,  3 Sep 2020 18:26:12 -0400
Message-Id: <20200903222620.27448-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200903222620.27448-1-jonathan@marek.ca>
References: <20200903222620.27448-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for display clock controller for
Qualcomm Technology Inc's SM8150 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/clock/qcom,dispcc.yaml           |  4 +-
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    | 69 +++++++++++++++++++
 2 files changed, 72 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8150.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
index ef0321ace786..5b5c7fa6375e 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
@@ -11,17 +11,19 @@ maintainers:
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180.
+  power domains on SDM845/SC7180/SM8150.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sdm845.h
     dt-bindings/clock/qcom,dispcc-sc7180.h
+    dt-bindings/clock/qcom,dispcc-sm8150.h
 
 properties:
   compatible:
     enum:
       - qcom,sdm845-dispcc
       - qcom,sc7180-dispcc
+      - qcom,sm8150-dispcc
 
   # NOTE: sdm845.dtsi existed for quite some time and specified no clocks.
   # The code had to use hardcoded mechanisms to find the input clocks.
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8150.h b/include/dt-bindings/clock/qcom,dispcc-sm8150.h
new file mode 100644
index 000000000000..2b96b0b4fe97
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8150.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8150_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8150_H
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
+#define DISP_CC_MDSS_DP_CRYPTO1_CLK		14
+#define DISP_CC_MDSS_DP_CRYPTO1_CLK_SRC		15
+#define DISP_CC_MDSS_DP_CRYPTO_CLK		16
+#define DISP_CC_MDSS_DP_CRYPTO_CLK_SRC		17
+#define DISP_CC_MDSS_DP_LINK1_CLK		18
+#define DISP_CC_MDSS_DP_LINK1_CLK_SRC		19
+#define DISP_CC_MDSS_DP_LINK1_INTF_CLK		20
+#define DISP_CC_MDSS_DP_LINK_CLK		21
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC		22
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK		23
+#define DISP_CC_MDSS_DP_PIXEL1_CLK		24
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC		25
+#define DISP_CC_MDSS_DP_PIXEL2_CLK		26
+#define DISP_CC_MDSS_DP_PIXEL2_CLK_SRC		27
+#define DISP_CC_MDSS_DP_PIXEL_CLK		28
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC		29
+#define DISP_CC_MDSS_ESC0_CLK			30
+#define DISP_CC_MDSS_ESC0_CLK_SRC		31
+#define DISP_CC_MDSS_ESC1_CLK			32
+#define DISP_CC_MDSS_ESC1_CLK_SRC		33
+#define DISP_CC_MDSS_MDP_CLK			34
+#define DISP_CC_MDSS_MDP_CLK_SRC		35
+#define DISP_CC_MDSS_MDP_LUT_CLK		36
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		37
+#define DISP_CC_MDSS_PCLK0_CLK			38
+#define DISP_CC_MDSS_PCLK0_CLK_SRC		39
+#define DISP_CC_MDSS_PCLK1_CLK			40
+#define DISP_CC_MDSS_PCLK1_CLK_SRC		41
+#define DISP_CC_MDSS_ROT_CLK			42
+#define DISP_CC_MDSS_ROT_CLK_SRC		43
+#define DISP_CC_MDSS_RSCC_AHB_CLK		44
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK		45
+#define DISP_CC_MDSS_VSYNC_CLK			46
+#define DISP_CC_MDSS_VSYNC_CLK_SRC		47
+#define DISP_CC_PLL0				48
+#define DISP_CC_PLL1				49
+
+/* DISP_CC Reset */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+#define DISP_CC_MDSS_SPDM_BCR			2
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC				0
+
+#endif
-- 
2.26.1

