Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0D2883A9D26
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 16:11:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233898AbhFPONz (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 10:13:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233909AbhFPONi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 10:13:38 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9B3E0C0611C0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:31 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id c84so1352108wme.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=aRbYJUGxam0ZXnZju8D1LdlA08gQ1CtipJh7dYzRZxE=;
        b=URtkqzq7eQsvp+3xUM0c2/MZeKz+SptdZet/cNznMrs6vqH27HtAWuz+Z/IbDxAmka
         AWRKXt3iXoJonoq6qs1suYK4ABneq2pNs6thPhexYlnY8rgsoWnBQGN76zKqeVp+qta6
         C+U8aDzgk/4qoI/NDs7UsrZ7RbaIJtRRfboK6QFhjSqfgKpK/iPPdiKl7DYHfaMUad9y
         qyX9Ujlh+dwqZu+rm+gNmcR3vwabmR9dCHIvJpI4pi8rB5alHsoHCfScH46sGvcqrG4q
         rD7JyO9d7fYr951xDDNl9xqe8amkfvuFtI/DHm0oOMBT8SK6n+3nw/+cB6+ys+SfS6gG
         wGyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=aRbYJUGxam0ZXnZju8D1LdlA08gQ1CtipJh7dYzRZxE=;
        b=LAlX5ryejw6hrZkzcGq3gkTYxIei6YGeiiFxP5b3zwhk83Pm+QgglOr4q1yyd+Av5O
         TDhNKD5So0gnUKfFMXcnFp6nyBzEy89+X3L32ovRQyOVSrDiwmTLDsVpAL4O2MUVqrNo
         a47npkgDrtenUzF9Pluu7v+RHWzdfktidrfVJQDZkNa0pIBxgngZp44tulzq5dTS0chc
         vgBPYm+nrzeZwvh/CkWu8w8O58L+NKXZgfLRkcggZk4F6rJCe5idLirRBKSR9vXWiCyP
         SxVNpgqUAV8Of4jxARTJnygoZwllixo1oEelpAjhWXXEvJaKEoPzfp9l9EjBEroqhEl4
         3CFA==
X-Gm-Message-State: AOAM533cpC2sDqOHqIIct84CC28bhlOBkKhE/DpeuBa5bJAR9fyMLkTG
        dhurxOTp5WCvBTSWiUrGFgR6tg==
X-Google-Smtp-Source: ABdhPJzWJJRAfxGZjvjYyL36Dr7gT78Zyheq+JLOhfuiiXn5Ud8LAwP6cqdik5IJa6dv3g93om5JOw==
X-Received: by 2002:a05:600c:4f87:: with SMTP id n7mr121695wmq.9.1623852690211;
        Wed, 16 Jun 2021 07:11:30 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:29 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 07/11] dt-bindings: clock: Add SM8350 QCOM video clock bindings
Date:   Wed, 16 Jun 2021 16:11:03 +0200
Message-Id: <20210616141107.291430-8-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for video clock controller for SM8350 SoCs.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../bindings/clock/qcom,videocc.yaml          |  2 +
 .../dt-bindings/clock/qcom,videocc-sm8350.h   | 44 +++++++++++++++++++
 2 files changed, 46 insertions(+)
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 567202942b88..a1dfecbad5c9 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -18,6 +18,7 @@ description: |
     dt-bindings/clock/qcom,videocc-sdm845.h
     dt-bindings/clock/qcom,videocc-sm8150.h
     dt-bindings/clock/qcom,videocc-sm8250.h
+    dt-bindings/clock/qcom,videocc-sm8350.h
 
 properties:
   compatible:
@@ -26,6 +27,7 @@ properties:
       - qcom,sdm845-videocc
       - qcom,sm8150-videocc
       - qcom,sm8250-videocc
+      - qcom,sm8350-videocc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,videocc-sm8350.h b/include/dt-bindings/clock/qcom,videocc-sm8350.h
new file mode 100644
index 000000000000..531cad2b0ab5
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,videocc-sm8350.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8350_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8350_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0C_CLK					5
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				6
+#define VIDEO_CC_MVS1_CLK					7
+#define VIDEO_CC_MVS1_CLK_SRC					8
+#define VIDEO_CC_MVS1_DIV2_CLK					9
+#define VIDEO_CC_MVS1_DIV_CLK_SRC				10
+#define VIDEO_CC_MVS1C_CLK					11
+#define VIDEO_CC_MVS1C_DIV2_DIV_CLK_SRC				12
+#define VIDEO_CC_SLEEP_CLK					13
+#define VIDEO_CC_SLEEP_CLK_SRC					14
+#define VIDEO_CC_XO_CLK						15
+#define VIDEO_CC_XO_CLK_SRC					16
+#define VIDEO_PLL0						17
+#define VIDEO_PLL1						18
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
2.30.2

