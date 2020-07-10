Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CD5F621B8CA
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 16:36:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727101AbgGJOfn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 10:35:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727086AbgGJOfm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 10:35:42 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC0D0C08C5DC
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 07:35:41 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id b92so2695123pjc.4
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 07:35:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bODYGHLC6MZR+Rjqv/EUaGax653HSp2R2TKnjf4fGNA=;
        b=kPl1qs3naQM7x5e0WjOSYrSLtL8FSOz3kWbLMMK4G8Ir4br/2IeX9LRuCCSlU8O0AL
         kWvTjW91WvXaIe7KMVasARj8XEu8mwYmFutG0PTa3tMEqHze5zEX7HIZsoC8E6IxQOuT
         M/bwg4BjrbMxljyTq1+VK/4rZT2xlFVLqupSs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bODYGHLC6MZR+Rjqv/EUaGax653HSp2R2TKnjf4fGNA=;
        b=ALWv+LtTecFI6DCzc/LzSYg1YbB4ZwNfWCixsJO1bPmItFf6KTgx/1xigMpWTr2P8R
         hR2wgdVJNkg+6r4KJ16/YmMBMt0aLupzm1mOGWtXDYu21AVbicylhgnp4v/yd2d2jJIp
         yS/fN5memDG6H+snSD3wWg8Piop5KX2KQy8koWe8BhseLijV2ofMxSKgzS7iIAthr17+
         16qYzIyXleKFVi0As1GRTw/BS4jLES21Tu0XP4DorzRLFbuSjor1QK+lak29kA6HPkIL
         KWjTZhBji6jrYrJ+E4MzgPr8COIbhp6nVhPLIp+IT9VxAJSDQcLJJngQLGwcOSr2Yudi
         DCEA==
X-Gm-Message-State: AOAM530FTvOmzHnw1zyfFaFhUbudLeNODhQ6d1BriSOKgOpCVFUfZCJF
        XOxbPv7Wj6rxXN6Rz+VPt0GEwQ==
X-Google-Smtp-Source: ABdhPJxpp+nbu7eRbdqK2N0St4+5wSOQq16+pd1cQzP4+S4V94bNvZ4oM1y5pPTHnZ7W7L2HrPXW9g==
X-Received: by 2002:a17:90a:a68:: with SMTP id o95mr6637503pjo.64.1594391741434;
        Fri, 10 Jul 2020 07:35:41 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id gn5sm5951284pjb.23.2020.07.10.07.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 07:35:40 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     sparate@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        mturney@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>, dhavalp@codeaurora.org,
        rnayak@codeaurora.org, mkurumel@codeaurora.org,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/4] dt-bindings: nvmem: qfprom: Convert to yaml
Date:   Fri, 10 Jul 2020 07:35:17 -0700
Message-Id: <20200710073439.v5.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710143520.1206846-1-dianders@chromium.org>
References: <20200710143520.1206846-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ravi Kumar Bokka <rbokka@codeaurora.org>

This switches the bindings over from txt to yaml.

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v5: None
Changes in v4:
- Maintainer now listed as Srinivas.
- Example under "soc" to get #address-cells and #size-cells.

Changes in v3:
- Split conversion to yaml into separate patch new in v3.
- Use 'const' for compatible instead of a 1-entry enum.
- Changed filename to match compatible string.
- Add #address-cells and #size-cells to list of properties.
- Fixed up example.

 .../bindings/nvmem/qcom,qfprom.yaml           | 50 +++++++++++++++++++
 .../devicetree/bindings/nvmem/qfprom.txt      | 35 -------------
 2 files changed, 50 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
new file mode 100644
index 000000000000..39f97c1c83a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc, QFPROM Efuse bindings
+
+maintainers:
+  - Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    const: qcom,qfprom
+
+  reg:
+    items:
+      - description: The corrected region.
+
+  # Needed if any child nodes are present.
+  "#address-cells":
+    const: 1
+  "#size-cells":
+    const: 1
+
+required:
+   - compatible
+   - reg
+
+examples:
+  - |
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      efuse@784000 {
+        compatible = "qcom,qfprom";
+        reg = <0 0x00784000 0 0x8ff>;
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        hstx-trim-primary@1eb {
+          reg = <0x1eb 0x1>;
+          bits = <1 4>;
+        };
+      };
+    };
diff --git a/Documentation/devicetree/bindings/nvmem/qfprom.txt b/Documentation/devicetree/bindings/nvmem/qfprom.txt
deleted file mode 100644
index 26fe878d5c86..000000000000
--- a/Documentation/devicetree/bindings/nvmem/qfprom.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-= Qualcomm QFPROM device tree bindings =
-
-This binding is intended to represent QFPROM which is found in most QCOM SOCs.
-
-Required properties:
-- compatible: should be "qcom,qfprom"
-- reg: Should contain registers location and length
-
-= Data cells =
-Are child nodes of qfprom, bindings of which as described in
-bindings/nvmem/nvmem.txt
-
-Example:
-
-	qfprom: qfprom@700000 {
-		compatible 	= "qcom,qfprom";
-		reg		= <0x00700000 0x8000>;
-		...
-		/* Data cells */
-		tsens_calibration: calib@404 {
-			reg = <0x4404 0x10>;
-		};
-	};
-
-
-= Data consumers =
-Are device nodes which consume nvmem data cells.
-
-For example:
-
-	tsens {
-		...
-		nvmem-cells = <&tsens_calibration>;
-		nvmem-cell-names = "calibration";
-	};
-- 
2.27.0.383.g050319c2ae-goog

