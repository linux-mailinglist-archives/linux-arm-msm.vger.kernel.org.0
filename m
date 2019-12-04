Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5DC6E1124A2
	for <lists+linux-arm-msm@lfdr.de>; Wed,  4 Dec 2019 09:22:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727592AbfLDIWJ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 4 Dec 2019 03:22:09 -0500
Received: from a27-55.smtp-out.us-west-2.amazonses.com ([54.240.27.55]:43002
        "EHLO a27-55.smtp-out.us-west-2.amazonses.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727554AbfLDIWH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 4 Dec 2019 03:22:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=zsmsymrwgfyinv5wlfyidntwsjeeldzt; d=codeaurora.org; t=1575447726;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References;
        bh=Dq97TvmgaKZQ1oiFU/swup0kCMjgQ3PAvX8O6jTarTQ=;
        b=Zaj+n2q2i0DsZZ5/DW/O58OQ1OPPII10jRnyin3pRGFAOJMohM5jlr6uVJh3d1g3
        maUe4YdN7kHuNefxw9zbN5dKawNfcDM1wPw1nKMm9yLtlPvy1xoegHyKfFyOCEyORsc
        vQj6QgcfdpCOIlFRkX21Ak+y7ZRZmFTB0n+CwpZE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
        s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1575447726;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:Feedback-ID;
        bh=Dq97TvmgaKZQ1oiFU/swup0kCMjgQ3PAvX8O6jTarTQ=;
        b=HaQ7ApvHWQb2wUU7bfmdKJShLtRX2G23tgFtUr5uSU6k6T7mdarot/7nuqj3jdS0
        5Uq/63IPy9ayHL0YklHEPYdMN+txv0w0MNCzXENWkrJPjVt3nniL9Hp8yZJ9taKy2hf
        HBYduBVTIpky+PaZX83zZo7XQjFvhwkuaykHOzsU=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
        aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=2.0 tests=ALL_TRUSTED,SPF_NONE,
        URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 12FD6C447B5
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=none smtp.mailfrom=tdas@codeaurora.org
From:   Taniya Das <tdas@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        =?UTF-8?q?Michael=20Turquette=20=C2=A0?= <mturquette@baylibre.com>,
        robh+dt@kernel.org
Cc:     David Brown <david.brown@linaro.org>,
        Rajendra Nayak <rnayak@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
        robh@kernel.org, Taniya Das <tdas@codeaurora.org>
Subject: [PATCH v1 2/3] dt-bindings: clock: Introduce QCOM Modem clock  bindings
Date:   Wed, 4 Dec 2019 08:22:06 +0000
Message-ID: <0101016ed0008a4d-e7c6d3fc-1020-48e6-a515-762c71bcedff-000000@us-west-2.amazonses.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
References: <1575447687-9296-1-git-send-email-tdas@codeaurora.org>
X-SES-Outgoing: 2019.12.04-54.240.27.55
Feedback-ID: 1.us-west-2.CZuq2qbDmUIuT3qdvXlRHZZCpfZqZ4GtG9v3VKgRyF0=:AmazonSES
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for modem clock controller for
Qualcomm Technology Inc's SC7180 SoCs.

Signed-off-by: Taniya Das <tdas@codeaurora.org>
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

