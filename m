Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4855AFDA13
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 10:56:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727279AbfKOJ4q (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 04:56:46 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56344 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOJ4q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 04:56:46 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 7214861664; Fri, 15 Nov 2019 09:56:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811805;
        bh=4SlmhU6WRIr98hQL6poIv27oSnY4aNZwOdyF5gnFHnA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BHJ2L28RUt6R6O0wEcg/vMlW7CyczDDKxEsrbCcqk2/rqFMmzp7RuBsvz18ttehmU
         9ho4AtVFdK7WuW/GA68Q3UikjIJy4XV6ybr3sU+RdGHhbDVnIJPH6QU7EzZ5cFObv3
         /QVWH3B4cZAe40rrfWyOOLpXKrhv4WTJgVDUipsw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1512361657;
        Fri, 15 Nov 2019 09:56:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811803;
        bh=4SlmhU6WRIr98hQL6poIv27oSnY4aNZwOdyF5gnFHnA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bAIVAl0x6Cqhko6NK5TX8LUNzSGZNAAdhlo1LX/Z6gc1mtNDkzYRtBg+ZCzAGN/4b
         IVliW3D4mn2eIa+NZ5Fmyyc6MBkJv5o01gYRQNzC7LujIXwxfw8C1rBgraYKDeUhul
         Dpp6GOhnOUQoeOJD8OoRx8QHrIdL3+76jRay88HI=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 1512361657
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v2 4/8] dt-bindings: clock: Introduce QCOM Graphics clock bindings
Date:   Fri, 15 Nov 2019 15:26:04 +0530
Message-Id: <1573811768-21462-5-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573811768-21462-1-git-send-email-tdas@codeaurora.org>
References: <1573811768-21462-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SC7180 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml       |  1 +
 include/dt-bindings/clock/qcom,gpucc-sc7180.h       | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7180.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index c2d6243..7486368 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -17,6 +17,7 @@ properties:
   compatible:
     enum:
       - qcom,msm8998-gpucc
+      - qcom,sc7180-gpucc
       - qcom,sdm845-gpucc

   clocks:
diff --git a/include/dt-bindings/clock/qcom,gpucc-sc7180.h b/include/dt-bindings/clock/qcom,gpucc-sc7180.h
new file mode 100644
index 0000000..0e4643b
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,gpucc-sc7180.h
@@ -0,0 +1,21 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_GPU_CC_SC7180_H
+#define _DT_BINDINGS_CLK_QCOM_GPU_CC_SC7180_H
+
+#define GPU_CC_PLL1			0
+#define GPU_CC_AHB_CLK			1
+#define GPU_CC_CRC_AHB_CLK		2
+#define GPU_CC_CX_GMU_CLK		3
+#define GPU_CC_CX_SNOC_DVM_CLK		4
+#define GPU_CC_CXO_AON_CLK		5
+#define GPU_CC_CXO_CLK			6
+#define GPU_CC_GMU_CLK_SRC		7
+
+/* CAM_CC GDSCRs */
+#define CX_GDSC				0
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

