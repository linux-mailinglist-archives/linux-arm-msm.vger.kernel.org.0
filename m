Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E156612B108
	for <lists+linux-arm-msm@lfdr.de>; Fri, 27 Dec 2019 05:43:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727109AbfL0EnP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 26 Dec 2019 23:43:15 -0500
Received: from mail25.static.mailgun.info ([104.130.122.25]:36117 "EHLO
        mail25.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727215AbfL0EnP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 26 Dec 2019 23:43:15 -0500
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1577421794; h=References: In-Reply-To: Message-Id: Date:
 Subject: Cc: To: From: Sender;
 bh=5xyDFmD1Vva3Di3cXCRVvYhF/XCbKxx2YbgpgCNCBEM=; b=CDPvKjoYXDwTfsaOsSCTBVm6toxc6DpjR7EQN2ZV0Xb7LrB/+SRBxciGF+NpmTsxiPNiZsmR
 Tf9D44uJ7Jdr0XEsL79rJ6J0qUaxnllKadvEUJUIZeOvdqb5WCaQ7dKNyxsZufv8eEcSFph6
 zuGg2587FddbIMVYa1fkPvzSnBc=
X-Mailgun-Sending-Ip: 104.130.122.25
X-Mailgun-Sid: WyI1MzIzYiIsICJsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171])
 by mxa.mailgun.org with ESMTP id 5e058be1.7f828f46c928-smtp-out-n02;
 Fri, 27 Dec 2019 04:43:13 -0000 (UTC)
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 5CE7EC447A9; Fri, 27 Dec 2019 04:43:12 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from tdas-linux.qualcomm.com (blr-c-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.19.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: tdas)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 4D175C433A2;
        Fri, 27 Dec 2019 04:43:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 4D175C433A2
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
Subject: [PATCH v2 2/3] dt-bindings: clock: Introduce QCOM Modem clock bindings
Date:   Fri, 27 Dec 2019 10:12:39 +0530
Message-Id: <1577421760-1174-3-git-send-email-tdas@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
References: <1577421760-1174-1-git-send-email-tdas@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for modem clock controller for
Qualcomm Technology Inc's SC7180 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 include/dt-bindings/clock/qcom,gcc-sc7180.h |  5 +++++
 include/dt-bindings/clock/qcom,mss-sc7180.h | 12 ++++++++++++
 2 files changed, 17 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,mss-sc7180.h

diff --git a/include/dt-bindings/clock/qcom,gcc-sc7180.h b/include/dt-bindings/clock/qcom,gcc-sc7180.h
index e8029b2e..08c1a7b 100644
--- a/include/dt-bindings/clock/qcom,gcc-sc7180.h
+++ b/include/dt-bindings/clock/qcom,gcc-sc7180.h
@@ -132,6 +132,11 @@
 #define GCC_VIDEO_GPLL0_DIV_CLK_SRC				122
 #define GCC_VIDEO_THROTTLE_AXI_CLK				123
 #define GCC_VIDEO_XO_CLK					124
+#define GCC_MSS_CFG_AHB_CBCR					125
+#define GCC_MSS_MFAB_AXIS_CBCR					126
+#define GCC_MSS_NAV_AXI_CBCR					127
+#define GCC_MSS_Q6_MEMNOC_AXI_CBCR				128
+#define GCC_MSS_SNOC_AXI_CBCR					129

 /* GCC resets */
 #define GCC_QUSB2PHY_PRIM_BCR					0
diff --git a/include/dt-bindings/clock/qcom,mss-sc7180.h b/include/dt-bindings/clock/qcom,mss-sc7180.h
new file mode 100644
index 0000000..8ad63ed
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,mss-sc7180.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2019, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_MSS_SC7180_H
+#define _DT_BINDINGS_CLK_QCOM_MSS_SC7180_H
+
+#define MSS_AXI_CRYPTO_CLK	0
+#define MSS_AXI_NAV_CLK		1
+
+#endif
--
Qualcomm INDIA, on behalf of Qualcomm Innovation Center, Inc.is a member
of the Code Aurora Forum, hosted by the  Linux Foundation.
