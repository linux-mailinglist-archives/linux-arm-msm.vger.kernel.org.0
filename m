Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63F671C3297
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 May 2020 08:21:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726910AbgEDGUg (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 May 2020 02:20:36 -0400
Received: from alexa-out-sd-02.qualcomm.com ([199.106.114.39]:3330 "EHLO
        alexa-out-sd-02.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727790AbgEDGUe (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 May 2020 02:20:34 -0400
Received: from unknown (HELO ironmsg03-sd.qualcomm.com) ([10.53.140.143])
  by alexa-out-sd-02.qualcomm.com with ESMTP; 03 May 2020 23:20:31 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg03-sd.qualcomm.com with ESMTP; 03 May 2020 23:20:28 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id E7E742173C; Mon,  4 May 2020 11:50:26 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Sivaprakash Murugesan <sivaprak@codeaurora.org>
Subject: [PATCH V4 4/8] clk: qcom: Add DT bindings for ipq6018 apss clock controller
Date:   Mon,  4 May 2020 11:50:20 +0530
Message-Id: <1588573224-3038-5-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
References: <1588573224-3038-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

add dt-binding for ipq6018 apss clock controller

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
 include/dt-bindings/clock/qcom,apss-ipq.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,apss-ipq.h

diff --git a/include/dt-bindings/clock/qcom,apss-ipq.h b/include/dt-bindings/clock/qcom,apss-ipq.h
new file mode 100644
index 0000000..77b6e05
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,apss-ipq.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2018, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLOCK_QCA_APSS_IPQ6018_H
+#define _DT_BINDINGS_CLOCK_QCA_APSS_IPQ6018_H
+
+#define APCS_ALIAS0_CLK_SRC			0
+#define APCS_ALIAS0_CORE_CLK			1
+
+#endif
-- 
2.7.4

