Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 79E84266349
	for <lists+linux-arm-msm@lfdr.de>; Fri, 11 Sep 2020 18:13:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726527AbgIKQNf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 11 Sep 2020 12:13:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726549AbgIKPg0 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 11 Sep 2020 11:36:26 -0400
Received: from mail-qt1-x843.google.com (mail-qt1-x843.google.com [IPv6:2607:f8b0:4864:20::843])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FF9C0617BC
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:35:39 -0700 (PDT)
Received: by mail-qt1-x843.google.com with SMTP id z2so8125877qtv.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 11 Sep 2020 08:35:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bchsK5WXQ8xp8RAbe8m3vqoKGIecIRopLTU6zvIOBbM=;
        b=kQRnSXhWGYmemxfMPgeIP3NLaUT+bZTIRPGCJs9EMCaSryfV/W1C4WEWlUBadtHJc1
         /k0H7GMO9Bspxb5h9sSRnwTaSNtsrBkJLliW58KifcRUetK6yc0ClxvznnqzybkjNc6K
         IewV0Hc4+NGK0Z3YZY7rpKZvI+ApogNe7riv8qm8Fz1LV12xpYNnEdjKpNgR5RALGHIM
         UAXkYYv0bQUlOjv0HDfspJJujddHRCx3OmBCFpuVzAtV4OoqcNLOLfDjS81s+5LvtYKZ
         9prmf5avDdtF2f1rk+QA7ra42TSetbQAc6EsPqBZDb8R6nFRMv7Gh8CmOY8WC0ek/xKk
         fmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bchsK5WXQ8xp8RAbe8m3vqoKGIecIRopLTU6zvIOBbM=;
        b=KyuWr0m0ljXQMHC9SgZaDcHNpTY6bC9kKll1dAlXlysshh8R5U9qtI5Vm9vd2A3Dsl
         mbMWooJtAzhf9x6pD0Dyk/5yNf/Dr4R4jFTfoDToyZxHAQJuaLmcJ9ryToxWmKFjTVJk
         VpIR+oyG6TWm26hVCkgsraP7yCb1asqlcD+Bz9DpkiRYNlCFt09bVlSLJdAqDrpzXnYg
         zu9vMHlVLfFk4WqpFKKrNG1sZubb2E7atumW6inhYTwOuetXKvYetnHb4Lo/eh16h6kk
         OrqVnbzshTksaeYlZcedkNuQ9OTZfPjDCQX4eZkR3FKaljsu6JNoWShAGLeLTFBSl94I
         KkTg==
X-Gm-Message-State: AOAM532S71sMuELV5DJKCiUE1xXUT0ITzGlSWMayRJHGxHU29lNjJ1tz
        Fv+RDxKeKdk2HdcrIC+7viVPEC4ntvAhcWMW1wI=
X-Google-Smtp-Source: ABdhPJy3NjpKwPLBHJFzg36fPKToAQQae7+lMRpHpkW6SePO5hy6NX6FO+8HIQ4GlK0z8aouERyDzg==
X-Received: by 2002:ac8:5057:: with SMTP id h23mr2501990qtm.219.1599838538758;
        Fri, 11 Sep 2020 08:35:38 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id v16sm3001744qkg.37.2020.09.11.08.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 08:35:38 -0700 (PDT)
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
Subject: [PATCH v3 4/7] dt-bindings: clock: Introduce QCOM SM8150 display clock bindings
Date:   Fri, 11 Sep 2020 11:34:04 -0400
Message-Id: <20200911153412.21672-5-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200911153412.21672-1-jonathan@marek.ca>
References: <20200911153412.21672-1-jonathan@marek.ca>
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
 .../bindings/clock/qcom,dispcc.yaml           | 10 +--
 .../dt-bindings/clock/qcom,dispcc-sm8150.h    | 69 +++++++++++++++++++
 2 files changed, 75 insertions(+), 4 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8150.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
index 7d5b25dfe0b1..9702066cda38 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
@@ -11,26 +11,28 @@ maintainers:
 
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
   # New dts files should have these clocks.
   clocks:
-    minItems: 8
+    minItems: 7
     items:
       - description: Board XO source
-      - description: GPLL0 source from GCC
+      - description: GPLL0 source from GCC (sdm845/sc7180 only)
       - description: GPLL0 div source from GCC (sdm845 only)
       - description: Byte clock from DSI PHY0
       - description: Pixel clock from DSI PHY0
@@ -40,7 +42,7 @@ properties:
       - description: VCO DIV clock from DP PHY
 
   clock-names:
-    minItems: 8
+    minItems: 7
     items:
       - const: bi_tcxo
       - const: gcc_disp_gpll0_clk_src
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

