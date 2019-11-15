Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6B7EFDA1C
	for <lists+linux-arm-msm@lfdr.de>; Fri, 15 Nov 2019 10:57:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727316AbfKOJ5G (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 15 Nov 2019 04:57:06 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:56806 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725829AbfKOJ5G (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 15 Nov 2019 04:57:06 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 71A81616A6; Fri, 15 Nov 2019 09:57:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811825;
        bh=KwP5qzlOa48ca6fcsgwWOOPyejRC/96XdaosXzqxYSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=AtuRrBzjFxcaKiKPRv8nHlymRaDasOBTZD3Enz26ZzHi/4l577c9sWyUtlsZdAhz4
         m+GonsV2BzqQ6FiHiKSFHPGrZ5ChpU6hZvQg6w5ZqGiwuD2ZqU/pElNLYrQQNwBT21
         mHLkzFCfkNpLvEHUxYd5rg8mBCekIjyRpV9p65Ok=
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
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 535AA6127B;
        Fri, 15 Nov 2019 09:57:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1573811823;
        bh=KwP5qzlOa48ca6fcsgwWOOPyejRC/96XdaosXzqxYSc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FT5uLIniMDNdeS1ke1oAxyTlLAmCd7wK2nWFk3vK7qt2/Clpwf7FvJrKF1JcC4cco
         sY/AsenHAdlKgzwL3bKSbZGBUkaEslpYAobbtxoawBouvpNNzesmkO5+faL4TQyzad
         VmzAAxjKJOh283VQuxi6pW4CBt3blgPxfWpVboA8=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 535AA6127B
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
Subject: [PATCH v2 7/8] dt-bindings: clock: Introduce QCOM Video clock bindings
Date:   Fri, 15 Nov 2019 15:26:07 +0530
Message-Id: <1573811768-21462-8-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1573811768-21462-1-git-send-email-tdas@codeaurora.org>
References: <1573811768-21462-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for video clock controller for
Qualcomm Technology Inc's SC7180 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
---
 .../devicetree/bindings/clock/qcom,videocc.yaml    |  1 +
 include/dt-bindings/clock/qcom,videocc-sc7180.h    | 23 ++++++++++++++++++++++
 2 files changed, 24 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sc7180.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index fc3fcca..43cfc89 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -16,6 +16,7 @@ description: |
 properties:
   compatible:
     enum:
+      - qcom,sc7180-videocc
       - qcom,sdm845-videocc

   clocks:
diff --git a/include/dt-bindings/clock/qcom,videocc-sc7180.h b/include/dt-bindings/clock/qcom,videocc-sc7180.h
new file mode 100644
index 0000000..7acaf13
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,videocc-sc7180.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SC7180_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SC7180_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_PLL0				0
+#define VIDEO_CC_VCODEC0_AXI_CLK		1
+#define VIDEO_CC_VCODEC0_CORE_CLK		2
+#define VIDEO_CC_VENUS_AHB_CLK			3
+#define VIDEO_CC_VENUS_CLK_SRC			4
+#define VIDEO_CC_VENUS_CTL_AXI_CLK		5
+#define VIDEO_CC_VENUS_CTL_CORE_CLK		6
+#define VIDEO_CC_XO_CLK				7
+
+/* VIDEO_CC GDSCRs */
+#define VENUS_GDSC				0
+#define VCODEC0_GDSC				1
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.

