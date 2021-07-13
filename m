Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EED4F3C72E7
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 17:13:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236980AbhGMPQd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 11:16:33 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:32998 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237007AbhGMPQc (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 11:16:32 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626189223; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=s++/QUIVL3KZ+iTLW/e/T5pip2moe8t8muJyjZ4XCM8=; b=EFZy+J/0HjVr2DJgq+HTmxC7sMBQZQV27XvjQ+K2OoUYq0Ih67fzK+qrvaf0fVs+D5hleTnp
 GOYk73dIPdkvBnHBz1UDTMIOyGzzNgdaExg89iVbuxB/ATt0Vng6Grdz/x1mhxbJx//90PMv
 5ChEzmPvUs/IJ23FxzEFYKh6C/Q=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n06.prod.us-west-2.postgun.com with SMTP id
 60edad8401dd9a9431ffeb9d (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 15:13:08
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 2CAB2C433D3; Tue, 13 Jul 2021 15:13:08 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 067DDC43460;
        Tue, 13 Jul 2021 15:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 067DDC43460
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v3 6/7] dt-bindings: clock: Add SC7280 VideoCC clock binding
Date:   Tue, 13 Jul 2021 20:42:22 +0530
Message-Id: <1626189143-12957-7-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for video clock subsystem clock
controller for Qualcomm Technology Inc's SC7280 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  6 +++--
 include/dt-bindings/clock/qcom,videocc-sc7280.h    | 27 ++++++++++++++++++++++
 2 files changed, 31 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7280.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 5672029..0d224f1 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
@@ -11,10 +11,11 @@ maintainers:

 description: |
   Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180/SM8150/SM8250.
+  power domains on Qualcomm SoCs.

   See also:
     dt-bindings/clock/qcom,videocc-sc7180.h
+    dt-bindings/clock/qcom,videocc-sc7280.h
     dt-bindings/clock/qcom,videocc-sdm845.h
     dt-bindings/clock/qcom,videocc-sm8150.h
     dt-bindings/clock/qcom,videocc-sm8250.h
@@ -23,6 +24,7 @@ properties:
   compatible:
     enum:
       - qcom,sc7180-videocc
+      - qcom,sc7280-videocc
       - qcom,sdm845-videocc
       - qcom,sm8150-videocc
       - qcom,sm8250-videocc
diff --git a/include/dt-bindings/clock/qcom,videocc-sc7280.h b/include/dt-bindings/clock/qcom,videocc-sc7280.h
new file mode 100644
index 0000000..9e00c3a
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,videocc-sc7280.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SC7280_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SC7280_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_PLL0				0
+#define VIDEO_CC_IRIS_AHB_CLK			1
+#define VIDEO_CC_IRIS_CLK_SRC			2
+#define VIDEO_CC_MVS0_AXI_CLK			3
+#define VIDEO_CC_MVS0_CORE_CLK			4
+#define VIDEO_CC_MVSC_CORE_CLK			5
+#define VIDEO_CC_MVSC_CTL_AXI_CLK		6
+#define VIDEO_CC_SLEEP_CLK			7
+#define VIDEO_CC_SLEEP_CLK_SRC			8
+#define VIDEO_CC_VENUS_AHB_CLK			9
+#define VIDEO_CC_XO_CLK				10
+#define VIDEO_CC_XO_CLK_SRC			11
+
+/* VIDEO_CC power domains */
+#define MVS0_GDSC				0
+#define MVSC_GDSC				1
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

