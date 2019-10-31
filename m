Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA94CEB009
	for <lists+linux-arm-msm@lfdr.de>; Thu, 31 Oct 2019 13:21:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbfJaMVu (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 31 Oct 2019 08:21:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:38378 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726462AbfJaMVu (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 31 Oct 2019 08:21:50 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 29FB660B67; Thu, 31 Oct 2019 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524508;
        bh=4+Y+g+VFxODKmdMcQt8tzbtJb8k29f+OXWKK88STmSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=bzcXNF8N+TEyEIbP8pTmuyG5ORrdhS46wFugnfNcUbG8E4D9SGPsuONoH7hD4pXdO
         4cAsXN0ibSi/2pEqs0W5/0Qg9PiCcPHtQNB8j9LxJ9idBQQxOTiJR6nfesq3WRht1S
         KaSMfbVHjWLAg+gf5NS44FpS/aPl2cAhOlZQV6Sw=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 3839C60B67;
        Thu, 31 Oct 2019 12:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1572524507;
        bh=4+Y+g+VFxODKmdMcQt8tzbtJb8k29f+OXWKK88STmSM=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=BMKeEDdDi6cG28UD6vA7x+SFwlGF9MJrDjbCOZcK26CMz5I75G5NjHJ/2v6iltRSA
         112WAtw8dsAlTYdf/epv9x7imPstkr9jrkkFwiBdj5BnnE+4OzeLRLi7M0AJyU9Dfm
         RkeYfwBzjRyDTTodJfQggN7YvhJ6Jp8bPzoDk1fc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3839C60B67
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, robh+dt@kernel.org,
        Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 3/7] dt-bindings: clock: Introduce QCOM Graphics clock bindings
Date:   Thu, 31 Oct 2019 17:51:09 +0530
Message-Id: <1572524473-19344-4-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
References: <1572524473-19344-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for graphics clock controller for
Qualcomm Technology Inc's SC7180 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,gpucc.yaml       |  1 +
 include/dt-bindings/clock/qcom,gpucc-sc7180.h       | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,gpucc-sc7180.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
index 96aaf36..140df91 100644
--- a/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,gpucc.yaml
@@ -18,6 +18,7 @@ properties:
     enum:
       - qcom,sdm845-gpucc
       - qcom,msm8998-gpucc
+      - qcom,sc7180-gpucc

   clocks:
     minItems: 1
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

