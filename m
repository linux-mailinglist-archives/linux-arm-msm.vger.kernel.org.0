Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 002AB275CE4
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 18:08:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgIWQIc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 12:08:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726808AbgIWQIR (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 12:08:17 -0400
Received: from mail-qk1-x744.google.com (mail-qk1-x744.google.com [IPv6:2607:f8b0:4864:20::744])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94018C0613D3
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:08:17 -0700 (PDT)
Received: by mail-qk1-x744.google.com with SMTP id v123so167995qkd.9
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:08:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PBSiG7ruCWqF/AnvxWCWflqPnOSBDvyOBd/TuCScP+8=;
        b=dWs3AgfCfQi0b7NxAbznlPRYQAXy+ceSERbZTtoEMa61kW+6k894zsUGPmydYB7WXD
         b7V2r7m/uvD7lPD9xgCgsYzhEgiGI+TUEFQaBmchmtk6pZh21hd+9bahyniGhCydmi1q
         g2JRYUBtLq+G83nHerCYqT3nfP194le9oMeeESFQJCmPI+/F88EAwlvrLu3iU9wS+f4I
         WDCiZyOwS2vWt/tuOJRd8vCj76pX449gssi8bKLl91TuAhpyo5hXtgLKeJxodtvCJo+v
         1IGVq+LNEW952+t0KRkvrag+oaMWWK9NdHzRyFOUhF2ljJGZNePatAwepxRLciMUKXau
         kE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PBSiG7ruCWqF/AnvxWCWflqPnOSBDvyOBd/TuCScP+8=;
        b=UzsktSQzPj2UbyuT7BbLFVtDildRt6YvZIjktXcBGt/cnp9v4ZwgUTtvVhGRdCMG+Z
         yG7rZJibX43k2GSgZRezO9g4/beKqRRoM6v8J1JwZVzpNLaPaEhLUN/F86wqJkb5WhwU
         DkajfGBlsAho6hyG5nK5Km5YfHP1ARwGC3IgdbZfQs5ELg7/ufd3gDR9WZ/TRFC5KTmL
         kD0wKu2gr05Jv8nmGh7vsIc12q1mY9lj3pm7jsopzXHr1yTTrhGSXfE4ekLp2qbhq9w8
         0dNuk2gvIp8lKSdYigVGQABf2xiKv+lmM3/ReucexdARMMxbL62DNgThzX/KvjVo9bz5
         epHA==
X-Gm-Message-State: AOAM530TXbL/432x86klnIjz3vb+C2tqPJ9FbnbLIXh76tXcZm6QzIAU
        Yeg7CCTWAtOiRhgvUUktXB8b5SybZ1KOG2GQlqI=
X-Google-Smtp-Source: ABdhPJwc7fOelnpsSkhRbpYXa7Kfw+oxo/+DFy5ail7EiuQ4mmzuagEJ7RPFYChPwovYv34QVz1VWg==
X-Received: by 2002:ae9:de85:: with SMTP id s127mr555980qkf.59.1600877296552;
        Wed, 23 Sep 2020 09:08:16 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 145sm279159qkf.18.2020.09.23.09.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 09:08:16 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Rob Herring <robh@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 3/5] dt-bindings: clock: add SM8250 QCOM video clock bindings
Date:   Wed, 23 Sep 2020 12:06:29 -0400
Message-Id: <20200923160635.28370-4-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200923160635.28370-1-jonathan@marek.ca>
References: <20200923160635.28370-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for video clock controller for SM8250 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,videocc.yaml          |  4 ++-
 .../dt-bindings/clock/qcom,videocc-sm8250.h   | 34 +++++++++++++++++++
 2 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8250.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index bb1c1a841b68..567202942b88 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -11,12 +11,13 @@ maintainers:
 
 description: |
   Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180/SM8150.
+  power domains on SDM845/SC7180/SM8150/SM8250.
 
   See also:
     dt-bindings/clock/qcom,videocc-sc7180.h
     dt-bindings/clock/qcom,videocc-sdm845.h
     dt-bindings/clock/qcom,videocc-sm8150.h
+    dt-bindings/clock/qcom,videocc-sm8250.h
 
 properties:
   compatible:
@@ -24,6 +25,7 @@ properties:
       - qcom,sc7180-videocc
       - qcom,sdm845-videocc
       - qcom,sm8150-videocc
+      - qcom,sm8250-videocc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,videocc-sm8250.h b/include/dt-bindings/clock/qcom,videocc-sm8250.h
new file mode 100644
index 000000000000..2b2b3867af25
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,videocc-sm8250.h
@@ -0,0 +1,34 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2018-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8250_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8250_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_MVS0_CLK_SRC		0
+#define VIDEO_CC_MVS0C_CLK		1
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC	2
+#define VIDEO_CC_MVS1_CLK_SRC		3
+#define VIDEO_CC_MVS1_DIV2_CLK		4
+#define VIDEO_CC_MVS1C_CLK		5
+#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC	6
+#define VIDEO_CC_PLL0			7
+#define VIDEO_CC_PLL1			8
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_CVP_INTERFACE_BCR	0
+#define VIDEO_CC_CVP_MVS0_BCR		1
+#define VIDEO_CC_MVS0C_CLK_ARES		2
+#define VIDEO_CC_CVP_MVS0C_BCR		3
+#define VIDEO_CC_CVP_MVS1_BCR		4
+#define VIDEO_CC_MVS1C_CLK_ARES		5
+#define VIDEO_CC_CVP_MVS1C_BCR		6
+
+#define MVS0C_GDSC			0
+#define MVS1C_GDSC			1
+#define MVS0_GDSC			2
+#define MVS1_GDSC			3
+
+#endif
-- 
2.26.1

