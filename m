Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A3D83A9D22
	for <lists+linux-arm-msm@lfdr.de>; Wed, 16 Jun 2021 16:11:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233942AbhFPONp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 16 Jun 2021 10:13:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233893AbhFPONg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 16 Jun 2021 10:13:36 -0400
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7389C06124A
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:28 -0700 (PDT)
Received: by mail-wm1-x335.google.com with SMTP id y13-20020a1c4b0d0000b02901c20173e165so1830461wma.0
        for <linux-arm-msm@vger.kernel.org>; Wed, 16 Jun 2021 07:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=cxk0+wVQB5HblxQhN+0OZpVOyii+2f7oNmTqsu1uOb8=;
        b=cVLiTKluo955zKPJew/I26t1QSEvjrtMFJro2u0VrWsFa6aHK1uJZW+iqwYX1RwCQG
         SHotaF2+WvJ9GPLBm3HmBmx7hjSoCk3dVFKnQodd+s2lpEbpgniQrN0OV5oL0ix++rPM
         yKDeSyXgd/Z/rvUl8MLuR0aXoeNumKpCxm/3A2WGx8uzEK4xrmB/ysXcSDAfPlNKrDt4
         1zwwQrf5SdCJwpE2quu/fXT0CQf9wixLnmo0AyUsa5IjIxhVLRfaZYtcmOWTBcUHmJr0
         QZWKKhwvjlmbT+mCFw58pu3SZixy2a07CHbLWas72bA2qNTjQnRqqKEBChpCFziyWwiM
         QzCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=cxk0+wVQB5HblxQhN+0OZpVOyii+2f7oNmTqsu1uOb8=;
        b=CgleV41gwePHhOzBvkiagzktb5vPI7OMFE8XG7cheUuviAf0ZUMqViw3QfcFHA9Xvh
         sj6HOIyeJdyqbYiJRO4vbW9Pf0D5BrJDCT9px1GfPEID6VUQAe3V1+wzGSh0dJWlj5k8
         OrH53c0mbP7ItBPPPqm6XFPLGlUpCvSmMaMk5qdl6vKpciRDTrwMe87FasklNK+PmK5i
         JhzVxTBLXL0QPQP7thqFgTQpWvzP1/UkbbymbJab57Kcby2e5PRpv8qKAKSe8ocHJ6fm
         b6eJQE8F95cx6sztbIswQ11VkoTHNUJviM43X9s9JyjRJ2zCrl5/SS1cy3G6ty/pFQWN
         krwA==
X-Gm-Message-State: AOAM5301q4p5fZe1xNnQkN4deyZ8D1XOqEwB29fRFt/wr4HFkAbuiDhL
        hdEaKk3+Li8Dm2xARj9COi1+dg==
X-Google-Smtp-Source: ABdhPJwntzNaJeX5LVvYLveGJeY0XTHAahbWlsyX+eYGFsw+31WR+M7sFiYkCr63zXqyP/ByWHQfag==
X-Received: by 2002:a05:600c:4f0c:: with SMTP id l12mr11547307wmq.93.1623852687441;
        Wed, 16 Jun 2021 07:11:27 -0700 (PDT)
Received: from xps7590.fritz.box ([2a02:2454:3e5:b700:9df7:76e5:7e94:bf1e])
        by smtp.gmail.com with ESMTPSA id g83sm1968375wma.10.2021.06.16.07.11.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 07:11:26 -0700 (PDT)
From:   Robert Foss <robert.foss@linaro.org>
To:     agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jonathan@marek.ca, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vinod.koul@linaro.org>
Cc:     Robert Foss <robert.foss@linaro.org>
Subject: [RFC v1 05/11] dt-bindings: clock: Add QCOM SM8350 display clock bindings
Date:   Wed, 16 Jun 2021 16:11:01 +0200
Message-Id: <20210616141107.291430-6-robert.foss@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210616141107.291430-1-robert.foss@linaro.org>
References: <20210616141107.291430-1-robert.foss@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for display clock controller for
Qualcomm Technology Inc's SM8350 SoC.

Signed-off-by: Robert Foss <robert.foss@linaro.org>
---
 .../bindings/clock/qcom,dispcc-sm8x50.yaml    |  6 +-
 .../dt-bindings/clock/qcom,dispcc-sm8350.h    | 77 +++++++++++++++++++
 2 files changed, 81 insertions(+), 2 deletions(-)
 create mode 100644 include/dt-bindings/clock/qcom,dispcc-sm8350.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
index 0cdf53f41f84..c10eefd024f6 100644
--- a/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,dispcc-sm8x50.yaml
@@ -4,24 +4,26 @@
 $id: http://devicetree.org/schemas/clock/qcom,dispcc-sm8x50.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250
+title: Qualcomm Display Clock & Reset Controller Binding for SM8150/SM8250/SM8350
 
 maintainers:
   - Jonathan Marek <jonathan@marek.ca>
 
 description: |
   Qualcomm display clock control module which supports the clocks, resets and
-  power domains on SM8150 and SM8250.
+  power domains on SM8150, SM8250 and SM8350.
 
   See also:
     dt-bindings/clock/qcom,dispcc-sm8150.h
     dt-bindings/clock/qcom,dispcc-sm8250.h
+    dt-bindings/clock/qcom,dispcc-sm8350.h
 
 properties:
   compatible:
     enum:
       - qcom,sm8150-dispcc
       - qcom,sm8250-dispcc
+      - qcom,sm8350-dispcc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,dispcc-sm8350.h b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
new file mode 100644
index 000000000000..361ef27de585
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,dispcc-sm8350.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021, Linaro Limited
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8350_H
+#define _DT_BINDINGS_CLK_QCOM_DISP_CC_SM8350_H
+
+/* DISP_CC clock registers */
+#define DISP_CC_MDSS_AHB_CLK			0
+#define DISP_CC_MDSS_AHB_CLK_SRC		1
+#define DISP_CC_MDSS_BYTE0_CLK			2
+#define DISP_CC_MDSS_BYTE0_CLK_SRC		3
+#define DISP_CC_MDSS_BYTE0_DIV_CLK_SRC		4
+#define DISP_CC_MDSS_BYTE0_INTF_CLK		5
+#define DISP_CC_MDSS_BYTE1_CLK			6
+#define DISP_CC_MDSS_BYTE1_CLK_SRC		7
+#define DISP_CC_MDSS_BYTE1_DIV_CLK_SRC		8
+#define DISP_CC_MDSS_BYTE1_INTF_CLK		9
+#define DISP_CC_MDSS_DP_AUX1_CLK		10
+#define DISP_CC_MDSS_DP_AUX1_CLK_SRC		11
+#define DISP_CC_MDSS_DP_AUX_CLK			12
+#define DISP_CC_MDSS_DP_AUX_CLK_SRC		13
+#define DISP_CC_MDSS_DP_LINK1_CLK		14
+#define DISP_CC_MDSS_DP_LINK1_CLK_SRC		15
+#define DISP_CC_MDSS_DP_LINK1_DIV_CLK_SRC	16
+#define DISP_CC_MDSS_DP_LINK1_INTF_CLK		17
+#define DISP_CC_MDSS_DP_LINK_CLK		18
+#define DISP_CC_MDSS_DP_LINK_CLK_SRC		19
+#define DISP_CC_MDSS_DP_LINK_DIV_CLK_SRC	20
+#define DISP_CC_MDSS_DP_LINK_INTF_CLK		21
+#define DISP_CC_MDSS_DP_PIXEL1_CLK		22
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC		23
+#define DISP_CC_MDSS_DP_PIXEL2_CLK		24
+#define DISP_CC_MDSS_DP_PIXEL2_CLK_SRC		25
+#define DISP_CC_MDSS_DP_PIXEL_CLK		26
+#define DISP_CC_MDSS_DP_PIXEL_CLK_SRC		27
+#define DISP_CC_MDSS_EDP_AUX_CLK		28
+#define DISP_CC_MDSS_EDP_AUX_CLK_SRC		29
+#define DISP_CC_MDSS_EDP_LINK_CLK		30
+#define DISP_CC_MDSS_EDP_LINK_CLK_SRC		31
+#define DISP_CC_MDSS_EDP_LINK_DIV_CLK_SRC	32
+#define DISP_CC_MDSS_EDP_LINK_INTF_CLK		33
+#define DISP_CC_MDSS_EDP_PIXEL_CLK		34
+#define DISP_CC_MDSS_EDP_PIXEL_CLK_SRC		35
+#define DISP_CC_MDSS_ESC0_CLK			36
+#define DISP_CC_MDSS_ESC0_CLK_SRC		37
+#define DISP_CC_MDSS_ESC1_CLK			38
+#define DISP_CC_MDSS_ESC1_CLK_SRC		39
+#define DISP_CC_MDSS_MDP_CLK			40
+#define DISP_CC_MDSS_MDP_CLK_SRC		41
+#define DISP_CC_MDSS_MDP_LUT_CLK		42
+#define DISP_CC_MDSS_NON_GDSC_AHB_CLK		43
+#define DISP_CC_MDSS_PCLK0_CLK			44
+#define DISP_CC_MDSS_PCLK0_CLK_SRC		45
+#define DISP_CC_MDSS_PCLK1_CLK			46
+#define DISP_CC_MDSS_PCLK1_CLK_SRC		47
+#define DISP_CC_MDSS_ROT_CLK			48
+#define DISP_CC_MDSS_ROT_CLK_SRC		49
+#define DISP_CC_MDSS_RSCC_AHB_CLK		50
+#define DISP_CC_MDSS_RSCC_VSYNC_CLK		51
+#define DISP_CC_MDSS_VSYNC_CLK			52
+#define DISP_CC_MDSS_VSYNC_CLK_SRC		53
+#define DISP_CC_PLL0				54
+#define DISP_CC_PLL1				55
+#define DISP_CC_SLEEP_CLK			56
+#define DISP_CC_SLEEP_CLK_SRC			57
+#define DISP_CC_XO_CLK_SRC			58
+
+/* DISP_CC Reset */
+#define DISP_CC_MDSS_CORE_BCR			0
+#define DISP_CC_MDSS_RSCC_BCR			1
+
+/* DISP_CC GDSCR */
+#define MDSS_GDSC				0
+
+#endif
-- 
2.30.2

