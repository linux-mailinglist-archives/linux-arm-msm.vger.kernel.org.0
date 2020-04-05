Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DC43219EAC6
	for <lists+linux-arm-msm@lfdr.de>; Sun,  5 Apr 2020 13:30:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgDELaI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 5 Apr 2020 07:30:08 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:7406 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726587AbgDELaH (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 5 Apr 2020 07:30:07 -0400
Received: from unknown (HELO ironmsg-SD-alpha.qualcomm.com) ([10.53.140.30])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 05 Apr 2020 04:30:07 -0700
Received: from sivaprak-linux.qualcomm.com ([10.201.3.202])
  by ironmsg-SD-alpha.qualcomm.com with ESMTP; 05 Apr 2020 04:30:04 -0700
Received: by sivaprak-linux.qualcomm.com (Postfix, from userid 459349)
        id A1C4621658; Sun,  5 Apr 2020 17:00:02 +0530 (IST)
From:   Sivaprakash Murugesan <sivaprak@codeaurora.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, sivaprak@codeaurora.org
Subject: [PATCH V2 4/8] clk: qcom: Add DT bindings for ipq6018 apss clock controller
Date:   Sun,  5 Apr 2020 16:59:21 +0530
Message-Id: <1586086165-19426-5-git-send-email-sivaprak@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
References: <1586086165-19426-1-git-send-email-sivaprak@codeaurora.org>
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

add dt-binding for ipq6018 apss clock controller

Signed-off-by: Sivaprakash Murugesan <sivaprak@codeaurora.org>
---
[V2]
  * Addressed review comments from Rob and Sibi
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

