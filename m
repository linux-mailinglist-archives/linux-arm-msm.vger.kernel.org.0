Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ABB5A275CDE
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Sep 2020 18:08:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726751AbgIWQIP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 23 Sep 2020 12:08:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726744AbgIWQIP (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 23 Sep 2020 12:08:15 -0400
Received: from mail-qv1-xf42.google.com (mail-qv1-xf42.google.com [IPv6:2607:f8b0:4864:20::f42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D4CCC0613D7
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:08:15 -0700 (PDT)
Received: by mail-qv1-xf42.google.com with SMTP id b13so265167qvl.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 23 Sep 2020 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=siNpN4JV7cwepJUeButrmGkXwgZ3uItysyqPhO+pNxM=;
        b=NJPaSSQa+aNx3rzKZYPt6wKLEqljgM8OAZ20SKsxQFGWgAFNgiLETr/snBxBXi9EoN
         UT1pVaiYsoWz1+rqkJj7e3gFBe6xj2CNRXETeC3Vb7z+Q1ADVolv4xuNiW+TN5hkpnB6
         wiXn57M6sfC+o5zF+qwJW1GAeQuwc1ja7iFgGQnZS1F9iOJhAJRfbrjk+VMXN8Q0ACSg
         /knlLFmlFprdevRN9LP/Ooz3UgPVx8jX+c+x49XQvwbxJHu1ucXOVLBxTwnWr8C0yS36
         5DTT4eq2xSbpkcx4LpyLcXICVZS2ow51RC2I5JRrMZ0+I0mqFmswqMst+mflUUnvIMgP
         7KOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=siNpN4JV7cwepJUeButrmGkXwgZ3uItysyqPhO+pNxM=;
        b=t2qljebNKvzBCxXqAtt5AgtUEkaZFBb/LyxcGHxNht4BC7XFJMBLjil7SIu0NtLmLJ
         Ml21voSR4gsE2rqBnyqVvNDYU32wZ1wUCDOCCh8sqNoYX1FsDUMhRWs6/C/2W8/vXl0D
         n7/Ta40Fv4+bWpndHoYJEpGN9kQBOYQKPrSq/27auNilqCv2INLOXVtIiiHKs+pD2duw
         8k+vp/egrXVo9GW2YtFoS9bNWpFcGBfoKyv7oGfEk7DIFKs3pMUMebVmNcO1wGakToUA
         BJ3v+lCzTriODQz94E5XFDqI6+nHXSVHv6bpg0H8uGhy8JLw4/uw3HnRguQiOSVF3Wj4
         PaMw==
X-Gm-Message-State: AOAM530sVwyPbEjxKio+M66GYnOdoGqWQuX9C4syLcuGlUjJWHHE4hdc
        Z0cfr2b2PHJHFniwMAWF3dZ+/FXh5UWhWNE0f0k=
X-Google-Smtp-Source: ABdhPJwSBFFz2sj75C3DZ9VY+StGyddr7faJdvsy2Oe9X8gb7DjOf/o/YiGdKt1urUKi95NqBcquYg==
X-Received: by 2002:a0c:f783:: with SMTP id s3mr711401qvn.57.1600877294206;
        Wed, 23 Sep 2020 09:08:14 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id 145sm279159qkf.18.2020.09.23.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Sep 2020 09:08:13 -0700 (PDT)
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
Subject: [PATCH v3 2/5] dt-bindings: clock: add SM8150 QCOM video clock bindings
Date:   Wed, 23 Sep 2020 12:06:28 -0400
Message-Id: <20200923160635.28370-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200923160635.28370-1-jonathan@marek.ca>
References: <20200923160635.28370-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree bindings for video clock controller for SM8150 SoCs.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/clock/qcom,videocc.yaml          |  4 ++-
 .../dt-bindings/clock/qcom,videocc-sm8150.h   | 25 +++++++++++++++++++
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 include/dt-bindings/clock/qcom,videocc-sm8150.h

diff --git a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index 874be03c33f5..bb1c1a841b68 100644
--- a/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -11,17 +11,19 @@ maintainers:
 
 description: |
   Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SDM845/SC7180.
+  power domains on SDM845/SC7180/SM8150.
 
   See also:
     dt-bindings/clock/qcom,videocc-sc7180.h
     dt-bindings/clock/qcom,videocc-sdm845.h
+    dt-bindings/clock/qcom,videocc-sm8150.h
 
 properties:
   compatible:
     enum:
       - qcom,sc7180-videocc
       - qcom,sdm845-videocc
+      - qcom,sm8150-videocc
 
   clocks:
     items:
diff --git a/include/dt-bindings/clock/qcom,videocc-sm8150.h b/include/dt-bindings/clock/qcom,videocc-sm8150.h
new file mode 100644
index 000000000000..e24ee840cfdb
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,videocc-sm8150.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2017-2020, The Linux Foundation. All rights reserved.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8150_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_SM8150_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_IRIS_AHB_CLK		0
+#define VIDEO_CC_IRIS_CLK_SRC		1
+#define VIDEO_CC_MVS0_CORE_CLK		2
+#define VIDEO_CC_MVS1_CORE_CLK		3
+#define VIDEO_CC_MVSC_CORE_CLK		4
+#define VIDEO_CC_PLL0			5
+
+/* VIDEO_CC Resets */
+#define VIDEO_CC_MVSC_CORE_CLK_BCR	0
+
+/* VIDEO_CC GDSCRs */
+#define VENUS_GDSC			0
+#define VCODEC0_GDSC			1
+#define VCODEC1_GDSC			2
+
+#endif
-- 
2.26.1

