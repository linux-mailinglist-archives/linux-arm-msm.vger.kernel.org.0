Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 77958FDA67
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 11:04:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727483AbfKOKEf (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 05:04:35 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:34080 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727122AbfKOKEe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 05:04:34 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4BF4E6179B; Fri, 15 Nov 2019 10:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812272;
        bh=Ii/F/tmDcx7GLOsjHqfirdwhtUrFXyfg5XVHO1ivZBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=kiR97swz3hyoXhxBingLuoaE7e4H+98C586ZLwqQV4MGuS1/lUFhImbhRsMhoGb09
         +jwzqVp4w4gKTH4O/MBtOmzaSPz5+/VW3oeVrLBSvREVG0KUkr4bfd7lEKvu3HeID4
         dsMt7eaNbstzuzagRH+gPEFghEZAnueQM9WKQB98=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
        DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
        version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1C596611A7;
        Fri, 15 Nov 2019 10:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573812270;
        bh=Ii/F/tmDcx7GLOsjHqfirdwhtUrFXyfg5XVHO1ivZBg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=TWZQ/ueR9W9JDZ0crTtQpLVh0rqwJlD9TnhMmGy1QxEr+65rDRLOLPX+CAXHUeD0Q
         d0wXgnIoWXnJhmQJjh1QoJ7d0If3HdIPJ/D58cp1EID+HI1nErQM+DhTrnXCzsU5U7
         Rx6iXF9McGKfse+13ORHzIPegK0EnDryklBknmLI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1C596611A7
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 2/3] dt-bindings: clock: Introduce QCOM Display clock bindings
Date:   Fri, 15 Nov 2019 15:34:04 +0530
Message-Id: <1573812245-23827-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573812245-23827-1-git-send-email-tdas@codeaurora.org>
References: <1573812245-23827-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for display clock controller for
Qualcomm Technology Inc's SC7180 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,dispcc.yaml     |  1 +
 include/dt-bindings/clock/qcom,dispcc-sc7180.h     | 46 ++++++++++++++++++++++
 2 files changed, 47 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sc7180.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
index 1185e49..9c58e02 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sc7180-dispcc
       - qcom,sdm845-dispcc

   clocks:
diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7180.h b/include/dt-bindings/clock/qcom,dispcc-sc7180.h
new file mode 100644
index 0000000..b9b51617
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7180.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7180_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SC7180_H
+
+#define DISP_CC_PLL0				0
+#define DISP_CC_PLL0_OUT_EVEN			1
+#define DISP_CC_MDSS_AHB_CLK			2
+#define DISP_CC_MDSS_AHB_CLK_SRC		3
+#define DISP_CC_MDSS_BYTE0_CLK			4
+#define DISP_CC_MDSS_BYTE0_CLK_SRC		5
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC		6
+#define DISP_CC_MDSS_BYTE0_INTF_CLK		7
+#define DISP_CC_MDSS_DP_AUX_CLK			8
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC		9
+#define DISP_CC_MDSS_DP_CRYPTO_CLK		10
+#define DISP_CC_MDSS_DP_CRYPTO_CLK_SRC		11
+#define DISP_CC_MDSS_DP_LINK_CLK		12
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC		13
+#define DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC	14
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK		15
+#define DISP_CC_MDSS_DP_PIXEL_CLK		16
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC		17
+#define DISP_CC_MDSS_ESC0_CLK			18
+#define DISP_CC_MDSS_ESC0_CLK_SRC		19
+#define DISP_CC_MDSS_MDP_CLK			20
+#define DISP_CC_MDSS_MDP_CLK_SRC		21
+#define DISP_CC_MDSS_MDP_LUT_CLK		22
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		23
+#define DISP_CC_MDSS_PCLK0_CLK			24
+#define DISP_CC_MDSS_PCLK0_CLK_SRC		25
+#define DISP_CC_MDSS_ROT_CLK			26
+#define DISP_CC_MDSS_ROT_CLK_SRC		27
+#define DISP_CC_MDSS_RSCC_AHB_CLK		28
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK		29
+#define DISP_CC_MDSS_VSYNC_CLK			30
+#define DISP_CC_MDSS_VSYNC_CLK_SRC		31
+#define DISP_CC_XO_CLK				32
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC				0
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

