Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C20FA3C72E2
	for <lists+linux-arm-msm@lfdr.de>; Tue, 13 Jul 2021 17:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236987AbhGMPQV (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 13 Jul 2021 11:16:21 -0400
Received: from m43-7.mailgun.net ([69.72.43.7]:31550 "EHLO m43-7.mailgun.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236981AbhGMPQU (ORCPT <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 13 Jul 2021 11:16:20 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1626189210; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=zEAotMEdGYHLag8lAdVetL4yrxh6lR0r4Ujoz4x++KY=; b=gON7iyUOj/FnlHDvXXEZpGhmV+SBiMS40iUrI7aUy52WuSKGKnhoi/s/QGzpjqdYIWxjpR2m
 WQMpGp76CGZWdkUIDNHv1xCbgEd9BpwUSMVQ18TdZCsftOSlVtAG1uvqkef5jRDRzyXAUN1t
 W8N2yUuJnAe96bBD7qckKpjrwPc=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n02.prod.us-west-2.postgun.com with SMTP id
 60edad7c3a8b6d0a45a529e5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 13 Jul 2021 15:13:00
 GMT
Sender: tdas=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 28CB5C43217; Tue, 13 Jul 2021 15:13:00 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00,SPF_FAIL
        autolearn=no autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (unknown [202.46.22.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 42E83C43460;
        Tue, 13 Jul 2021 15:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 42E83C43460
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
Subject: [PATCH v3 4/7] dt-bindings: clock: Add SC7280 GPUCC clock binding
Date:   Tue, 13 Jul 2021 20:42:20 +0530
Message-Id: <1626189143-12957-5-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
References: <1626189143-12957-1-git-send-email-tdas@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock subsystem clock
controller for Qualcomm Technology Inc's SC7280 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml      |  6 ++--
 include/dt-bindings/clock/qcom,gpucc-sc7280.h      | 35 ++++++++++++++++++++++
 2 files changed, 39 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7280.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index df943c4..ecfe212 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -1,4 +1,4 @@
-# SPDX-License-Identifier: GPL-2.0-only
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
 $id: http://devicetree.org/schemas/clock/qcom,gpucc.yaml#
@@ -11,11 +11,12 @@ maintainers:

 description: |
   Qualcomm graphics clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180/SM8150/SM8250.
+  power domains on Qualcomm SoCs.

   See also:
     dt-bindings/clock/qcom,gpucc-sdm845.h
     dt-bindings/clock/qcom,gpucc-sc7180.h
+    dt-bindings/clock/qcom,gpucc-sc7280.h
     dt-bindings/clock/qcom,gpucc-sm8150.h
     dt-bindings/clock/qcom,gpucc-sm8250.h

@@ -24,6 +25,7 @@ properties:
     enum:
       - qcom,sdm845-gpucc
       - qcom,sc7180-gpucc
+      - qcom,sc7280-gpucc
       - qcom,sm8150-gpucc
       - qcom,sm8250-gpucc

diff --git a/include/dt-bindings/clock/qcom,gpucc-sc7280.h b/include/dt-bindings/clock/qcom,gpucc-sc7280.h
new file mode 100644
index 0000000..669b23b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sc7280.h
@@ -0,0 +1,35 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SC7280_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SC7280_H
+
+/* GPU_CC clocks */
+#define GPU_CC_PLL0				0
+#define GPU_CC_PLL1				1
+#define GPU_CC_AHB_CLK				2
+#define GPU_CC_CB_CLK				3
+#define GPU_CC_CRC_AHB_CLK			4
+#define GPU_CC_CX_GMU_CLK			5
+#define GPU_CC_CX_SNOC_DVM_CLK			6
+#define GPU_CC_CXO_AON_CLK			7
+#define GPU_CC_CXO_CLK				8
+#define GPU_CC_GMU_CLK_SRC			9
+#define GPU_CC_GX_GMU_CLK			10
+#define GPU_CC_HLOS1_VOTE_GPU_SMMU_CLK		11
+#define GPU_CC_HUB_AHB_DIV_CLK_SRC		12
+#define GPU_CC_HUB_AON_CLK			13
+#define GPU_CC_HUB_CLK_SRC			14
+#define GPU_CC_HUB_CX_INT_CLK			15
+#define GPU_CC_HUB_CX_INT_DIV_CLK_SRC		16
+#define GPU_CC_MND1X_0_GFX3D_CLK		17
+#define GPU_CC_MND1X_1_GFX3D_CLK		18
+#define GPU_CC_SLEEP_CLK			19
+
+/* GPU_CC power domains */
+#define GPU_CC_CX_GDSC				0
+#define GPU_CC_GX_GDSC				1
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

