Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D4324A2B69
	for <lists+linux-arm-msm@lfdr.de>; Sat, 29 Jan 2022 04:27:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240864AbiA2D1m (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 28 Jan 2022 22:27:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343752AbiA2D1l (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 28 Jan 2022 22:27:41 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 148D8C061748
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 19:27:41 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id m14so14156242wrg.12
        for <linux-arm-msm@vger.kernel.org>; Fri, 28 Jan 2022 19:27:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=te0K3WpKS1oYJs60/rbk8rBt4gf1geFoDm7ZbwUb5UY=;
        b=FquCcRMes8tBUm5WPkzS/b92mI6ok7nCYD01c5XsI8cVCaiQwCqf4cRKDJthOkSg40
         2NoJr536vaw1/HHn4iKT4+/GZtGt0/sB4jqH1iQKgzGgKmcEDvAUsYyGqhXZvZ9k01Z7
         eDZXYR60c/vreBJeSK/4N1yx/D4ZlQ2h5JdQWbjMc9MkSmVfCriuUHOFit0VRxpeb2Ax
         KNiU3gcEOd7P5HD28zNCoIaMI63QAPV+4rzI9mc7R8DncpSXYqpAMAPL+absrK1U7q/a
         Zp/l/HoSvCohwILxmRvOIvHk30ITcxaWDYS5X++bPHCLtBz2pdrIPfYohOG5gnJAL7x6
         6PTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=te0K3WpKS1oYJs60/rbk8rBt4gf1geFoDm7ZbwUb5UY=;
        b=yXM8w1JjZiwYCSqM5fd9PLYsvKve2VcknX98ZiKmMCz+xSAcuHjDT9edqyObHyGSHs
         EMxP5u1lcuJEaoGWsMBuxaFj0b1Q+a3UkXLGlfuvT80mPZtfJK67MBrsUlQUW01ARLGP
         PZaqIrZuquDxRRyEMDIoHBn+fZkn5SXlUn+fApKzOcv34H495n3K+Adgiktp8l4McHTI
         5qXIlofVrWzLdkSgqlCyr4W+lsYH9DFxtlbnogaxXTlPCGbj04o/wb1WL4HNeksAB0pO
         Ph2iuG9D+6gkbVh6M9lL5BH5Xq1TMCpgqesCZp0tsuQxJnT2MI+MPSd6WriIs7P/XVcf
         7Dmg==
X-Gm-Message-State: AOAM530FXHPhk7bEAq2hx7boeCJaYoFXpwjBku7yGm0rksmcGENEZq78
        GwYJOzASkSzPLHI157k3zkPicQ==
X-Google-Smtp-Source: ABdhPJyITeNrj/XnQlaQLDo+uFI8qtKFu3fddYrQnNz4z/Hv1JEhXSilezCjqCB3E+iy5mpp8xCBxg==
X-Received: by 2002:a05:6000:144e:: with SMTP id v14mr2458431wrx.153.1643426859658;
        Fri, 28 Jan 2022 19:27:39 -0800 (PST)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id o12sm7365477wry.115.2022.01.28.19.27.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jan 2022 19:27:39 -0800 (PST)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     djakov@kernel.org, bjorn.andersson@linaro.org, agross@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org
Cc:     jun.nie@linaro.org, shawn.guo@linaro.org, benl@squareup.com,
        dmitry.baryshkov@linaro.org, bryan.odonoghue@linaro.org,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH v2 1/2] dt-bindings: interconnect: Convert snoc-mm to a sub-node of snoc
Date:   Sat, 29 Jan 2022 03:27:34 +0000
Message-Id: <20220129032735.2410936-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220129032735.2410936-1-bryan.odonoghue@linaro.org>
References: <20220129032735.2410936-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

snoc and snoc-mm in downstream use the same address space a mistake which
we have carried over into upstream. In silicon terms snoc-mm has been
tacked on to the original snoc which came from msm8916.

Convert to a better description where snoc-mm is a sub-node of snoc, thus
avoiding a mmio remap collision when using the RPM interconnect driver.

Cc: Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 .../bindings/interconnect/qcom,rpm.yaml       | 33 +++++++++++++++++--
 1 file changed, 31 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
index e4c3c2818119e..89853b4825133 100644
--- a/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
+++ b/Documentation/devicetree/bindings/interconnect/qcom,rpm.yaml
@@ -26,7 +26,6 @@ properties:
       - qcom,msm8939-bimc
       - qcom,msm8939-pcnoc
       - qcom,msm8939-snoc
-      - qcom,msm8939-snoc-mm
       - qcom,msm8996-a0noc
       - qcom,msm8996-a1noc
       - qcom,msm8996-a2noc
@@ -80,7 +79,6 @@ allOf:
               - qcom,msm8939-bimc
               - qcom,msm8939-pcnoc
               - qcom,msm8939-snoc
-              - qcom,msm8939-snoc-mm
               - qcom,msm8996-a1noc
               - qcom,msm8996-a2noc
               - qcom,msm8996-bimc
@@ -107,6 +105,37 @@ allOf:
               - description: Bus Clock
               - description: Bus A Clock
 
+        # Child node's properties
+        patternProperties:
+          '^interconnect-[a-z0-9]+$':
+            type: object
+            description:
+              snoc-mm is a child of snoc, sharing snoc's register address space.
+
+            properties:
+              compatible:
+                enum:
+                  - qcom,msm8939-snoc-mm
+
+              '#interconnect-cells':
+                const: 1
+
+              clock-names:
+                items:
+                  - const: bus
+                  - const: bus_a
+
+              clocks:
+                items:
+                  - description: Bus Clock
+                  - description: Bus A Clock
+
+            required:
+              - compatible
+              - '#interconnect-cells'
+              - clock-names
+              - clocks
+
   - if:
       properties:
         compatible:
-- 
2.33.0

