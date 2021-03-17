Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 984CF33E614
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Mar 2021 02:29:58 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhCQB2V (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 16 Mar 2021 21:28:21 -0400
Received: from a0.mail.mailgun.net ([198.61.254.59]:51958 "EHLO
        a0.mail.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230359AbhCQB17 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 16 Mar 2021 21:27:59 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1615944479; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=37Lq06s3g+b8PSQN+S/QrlFkk9CR1C0E/BlAVdOu0es=; b=MusyGQwX7ftBY2HnzJMOVOxD5iAuxC4lW7HHzqDr9WXbibHYzgXCJqttAcAkN4zceJZMS6Vy
 unTsk8euqJFlDzIAGTu2+PJLdUGtVilwOEEffDomHimReToYuZV13dVNgfqU6hti58N95qI5
 0ovd1AybpiflUPR2ZpXBwbJNCNo=
X-Mailgun-Sending-Ip: 198.61.254.59
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 605159f121031618f693abf6 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 17 Mar 2021 01:22:57
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id DCF8EC43467; Wed, 17 Mar 2021 01:22:57 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id C9B1FC433C6;
        Wed, 17 Mar 2021 01:22:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org C9B1FC433C6
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
Subject: [PATCH v1 5/6] dt-bindings: clock: Add SC7280 VideoCC clock binding
Date:   Wed, 17 Mar 2021 06:52:21 +0530
Message-Id: <1615944142-12171-6-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615944142-12171-1-git-send-email-tdas@codeaurora.org>
References: <1615944142-12171-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for video clock subsystem clock
controller for Qualcomm Technology Inc's SC7280 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  4 +++-
 include/dt-bindings/clock/qcom,videocc-sc7280.h    | 27 ++++++++++++++++++++++
 2 files changed, 30 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7280.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 5672029..dc90d82 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -11,10 +11,11 @@ maintainers:

 description: |
   Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180/SM8150/SM8250.
+  power domains on SDM845/SC7180/SC7280/SM8150/SM8250.

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
index 0000000..c976d85
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,videocc-sc7280.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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

