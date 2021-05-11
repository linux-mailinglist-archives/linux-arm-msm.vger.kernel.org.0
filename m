Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7B479379B69
	for <lists+linux-arm-msm@lfdr.de>; Tue, 11 May 2021 02:27:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230492AbhEKA2T (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 10 May 2021 20:28:19 -0400
Received: from alexa-out-sd-01.qualcomm.com ([199.106.114.38]:50573 "EHLO
        alexa-out-sd-01.qualcomm.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230357AbhEKA2Q (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 10 May 2021 20:28:16 -0400
Received: from unknown (HELO ironmsg04-sd.qualcomm.com) ([10.53.140.144])
  by alexa-out-sd-01.qualcomm.com with ESMTP; 10 May 2021 17:27:10 -0700
X-QCInternal: smtphost
Received: from gurus-linux.qualcomm.com ([10.46.162.81])
  by ironmsg04-sd.qualcomm.com with ESMTP; 10 May 2021 17:27:10 -0700
Received: by gurus-linux.qualcomm.com (Postfix, from userid 383780)
        id 233131F2B0; Mon, 10 May 2021 17:27:09 -0700 (PDT)
From:   Guru Das Srinagesh <gurus@codeaurora.org>
To:     Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org
Cc:     Mark Brown <broonie@kernel.org>,
        linux-arm-msm <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org,
        Guru Das Srinagesh <gurus@codeaurora.org>
Subject: [PATCH v4 1/3] dt-bindings: mfd: pm8008: Add IRQ listing
Date:   Mon, 10 May 2021 17:27:06 -0700
Message-Id: <9734ed8605ce319c92dd8a0d6dd85287f4bcfe23.1620690653.git.gurus@codeaurora.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1620690653.git.gurus@codeaurora.org>
References: <cover.1620690653.git.gurus@codeaurora.org>
In-Reply-To: <cover.1620690653.git.gurus@codeaurora.org>
References: <cover.1620690653.git.gurus@codeaurora.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a header file listing all of the IRQs that Qualcomm Technologies,
Inc. PM8008 supports. The constants defined in this file may be used in
the client device tree node to specify interrupts.

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Guru Das Srinagesh <gurus@codeaurora.org>
---
 include/dt-bindings/mfd/qcom-pm8008.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 include/dt-bindings/mfd/qcom-pm8008.h

diff --git a/include/dt-bindings/mfd/qcom-pm8008.h b/include/dt-bindings/mfd/qcom-pm8008.h
new file mode 100644
index 0000000..eca9448
--- /dev/null
+++ b/include/dt-bindings/mfd/qcom-pm8008.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 The Linux Foundation. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_MFD_QCOM_PM8008_H
+#define __DT_BINDINGS_MFD_QCOM_PM8008_H
+
+/* PM8008 IRQ numbers */
+#define PM8008_IRQ_MISC_UVLO	0
+#define PM8008_IRQ_MISC_OVLO	1
+#define PM8008_IRQ_MISC_OTST2	2
+#define PM8008_IRQ_MISC_OTST3	3
+#define PM8008_IRQ_MISC_LDO_OCP	4
+#define PM8008_IRQ_TEMP_ALARM	5
+#define PM8008_IRQ_GPIO1	6
+#define PM8008_IRQ_GPIO2	7
+
+#endif
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

