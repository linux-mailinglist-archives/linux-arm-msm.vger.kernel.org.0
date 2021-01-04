Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C48632E9186
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 09:13:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726236AbhADINA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 4 Jan 2021 03:13:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726026AbhADINA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 4 Jan 2021 03:13:00 -0500
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A338BC06179E
        for <linux-arm-msm@vger.kernel.org>; Mon,  4 Jan 2021 00:11:42 -0800 (PST)
Received: by mail-pf1-x42a.google.com with SMTP id w6so16043077pfu.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 04 Jan 2021 00:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CxihuApHeST5FtR1ic0MIOxlrYHGlIn3irwCDLvd5sM=;
        b=BpAHH4z7dBz+9MtlkHURf9h9Jom69vFHB+b4oROjoPES4tpnQZcIHzUGTYA6HA4we2
         NvQH40Hhy/8qTIFq89IboeKBQoo3kWTl4AZUy9cvRjjYzoTeCwqKGc+PTZELhs9DkJv4
         wSy6pyD6zbAg7cY5t/xJ769muFVFQUzII4m+WmHUdeGllqDotmtOr9Z3n7KrNC45FfPg
         tCLg8zSz56Pqqohri8sSaSxwdmTpb41Z8HozHaDHKwZ+pDfMv6GjBOLl+DvDWXmqdzk0
         PT4EEXLVxdhzMpeffC66L4pOMl/dbaMlcJbxT2UmoO+TEoR5og1/zpw8xVNpjJGwOMvR
         vGlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CxihuApHeST5FtR1ic0MIOxlrYHGlIn3irwCDLvd5sM=;
        b=thySmGn65bvlaq4ytJ5EG1O2Rb5Hb4HsvjuvSQ2n7s9zYn5HjcDiJXZeFSr1V0oLWa
         feitOvSuTQdzBE/vLAMIl69PFlCxHO8L0lRSLlqMecKVFaguL0sd9uIUkaJzuD6HVf+D
         ICuuDkjVmm5RDqQN6kEMm9zxlPAjfD9Sv/2J9R8LngPQkXl97YJt27IfQfRCVgvksxBS
         CNKdODDW1sf2aGpaDdbRGjzeNHQ6LG7nPTqp9+Oc3/iRw3dtZyK8SMxUSjrFBUiUL0L0
         DEmxxVg7qFtSqQ3yWyMnJ2VQwA9rPirWngi/gUiuhspeygxUs2IxuunMi62EmZma7d8B
         64hg==
X-Gm-Message-State: AOAM5303+UASPDQRBirj7LOljeRXde8CWDlRxSwOLpryGsKHA1gvD4uz
        oLefhBdgG1aMt6FDU3xwtK0+EyhpVtfG
X-Google-Smtp-Source: ABdhPJzsUzP25IuIbNHbmlezqcHXoggp/NpOFZ6YItSIZh0LEJkTFEBCupvJVazPbqroM29RL8ffzg==
X-Received: by 2002:a65:458e:: with SMTP id o14mr64244220pgq.444.1609747902114;
        Mon, 04 Jan 2021 00:11:42 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id n7sm55051339pfn.141.2021.01.04.00.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Jan 2021 00:11:41 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        jassisinghbrar@gmail.com
Cc:     viresh.kumar@linaro.org, ulf.hansson@linaro.org,
        bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH 1/5] dt-bindings: mailbox: Add binding for SDX55 APCS
Date:   Mon,  4 Jan 2021 13:41:21 +0530
Message-Id: <20210104081125.147300-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
References: <20210104081125.147300-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree YAML binding for SDX55 APCS GCC block. The APCS block
acts as the mailbox controller and also provides a clock output and
takes 3 clock sources (pll, aux, ref) as input.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../mailbox/qcom,apcs-kpss-global.yaml        | 59 ++++++++++++++++---
 1 file changed, 50 insertions(+), 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
index ffd09b664ff5..3c75ea0b6040 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom,apcs-kpss-global.yaml
@@ -27,26 +27,24 @@ properties:
       - qcom,sdm660-apcs-hmss-global
       - qcom,sdm845-apss-shared
       - qcom,sm8150-apss-shared
+      - qcom,sdx55-apcs-gcc
 
   reg:
     maxItems: 1
 
-  clocks:
-    description: phandles to the parent clocks of the clock driver
-    items:
-      - description: primary pll parent of the clock driver
-      - description: auxiliary parent
-
   '#mbox-cells':
     const: 1
 
   '#clock-cells':
     const: 0
 
+  clocks:
+    minItems: 2
+    maxItems: 3
+
   clock-names:
-    items:
-      - const: pll
-      - const: aux
+    minItems: 2
+    maxItems: 3
 
 required:
   - compatible
@@ -55,6 +53,49 @@ required:
 
 additionalProperties: false
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,ipq6018-apcs-apps-global
+            - qcom,ipq8074-apcs-apps-global
+            - qcom,msm8916-apcs-kpss-global
+            - qcom,msm8994-apcs-kpss-global
+            - qcom,msm8996-apcs-hmss-global
+            - qcom,msm8998-apcs-hmss-global
+            - qcom,qcs404-apcs-apps-global
+            - qcom,sc7180-apss-shared
+            - qcom,sdm660-apcs-hmss-global
+            - qcom,sdm845-apss-shared
+            - qcom,sm8150-apss-shared
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Primary PLL parent of the clock driver
+            - description: Auxiliary parent
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
+  - if:
+      properties:
+        compatible:
+          enum:
+            - qcom,sdx55-apcs-gcc
+    then:
+      properties:
+        clocks:
+          items:
+            - description: Primary PLL parent of the clock driver
+            - description: Auxiliary parent
+            - description: Reference clock
+        clock-names:
+          items:
+            - const: pll
+            - const: aux
+            - const: ref
 examples:
 
   # Example apcs with msm8996
-- 
2.25.1

