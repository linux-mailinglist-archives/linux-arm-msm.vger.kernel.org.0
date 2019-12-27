Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6EA4612B1FF
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 07:39:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbfL0GjW (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 27 Dec 2019 01:39:22 -0500
Received: from mail26.static.mailgun.info ([104.130.122.26]:49553 "EHLO
        mail26.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727235AbfL0GjV (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 27 Dec 2019 01:39:21 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577428761; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=ED19oCczwV2UFlfq68R6UTeBcqLK3BJjh4lx+T2hwAc=; b=xA+IvecVb3psl11jqTzBhfs9MxNfyQ3ouxKzEsz76gK5VZWc1+RxewbTod9cc44+c8ngG5SE
 VEmPVvW1T+ogqcF5SA0jNB1iYbsBcrdOzFCPaNG4xEPlOq6JHss6pRKa6XJg3Sef/OV7Cf8a
 ECURjEFY3y99FjR3PJJgzWWHacw=
X-Mailgun-Sending-Ip: 104.130.122.26
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e05a718.7f1a79e28378-smtp-out-n03;
 Fri, 27 Dec 2019 06:39:20 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5B7A1C433A2; Fri, 27 Dec 2019 06:39:19 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6A21AC43383;
        Fri, 27 Dec 2019 06:39:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 6A21AC43383
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
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
Subject: [PATCH v3 5/6] dt-bindings: clock: Introduce SC7180 QCOM Video clock bindings
Date:   Fri, 27 Dec 2019 12:08:33 +0530
Message-Id: <1577428714-17766-6-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
References: <1577428714-17766-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for video clock controller for
Qualcomm Technology Inc's SC7180 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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
