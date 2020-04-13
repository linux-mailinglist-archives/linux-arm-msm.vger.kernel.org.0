Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F8931A6A28
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 18:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731734AbgDMQpN (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 12:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1731726AbgDMQpL (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 12:45:11 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6CF6C0A3BE2;
        Mon, 13 Apr 2020 09:45:10 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id l14so2406510ljj.5;
        Mon, 13 Apr 2020 09:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7kUYnLw48Z85PQ8uY6UIk7TGH6ILbMun5ml8gDdgVg=;
        b=kIjWXjU5WmXkfLQkcf93yNgZ+kcchnSqyn+58IKkj0RLiXP+NVG51m9sJOKUiesGOy
         A1H2ikJrojbkLQHDkmY2lsQgrWlvVrrqchW3wFEv/SSWL6uBrIMaxstKKDG/k1MtzeEN
         ZF3Xc35vqiJHxUoQfgohOp7vJySod80mEwvCaOikV8nH6r3BF6PObJZhl3K3xCqynw5W
         wiL1P2dOL+bcE9e8q0sr5Nb0s905vuWQE1Bpq63BF66W12yRBBrN6YCVnnuSOiucENzq
         615WwuSt7/JrASy0Mj1Rg1hHzGECQWbeN6w0f9SDtIPpk9W+jDbpg7sRybGkiTluyMeO
         M2eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7kUYnLw48Z85PQ8uY6UIk7TGH6ILbMun5ml8gDdgVg=;
        b=TJcQrucsgfKTgB5u1Gm6GssJku2HhmkdGTdeDqw6QOkEtzZnC1sin1kJvpcreoI0kL
         EH6jpeif7GqbwG4kbuH7tcvhfFyOc/qHlzdjGOyV7QYdudB9nDOziqcEPlkqUjGcT8Xl
         QTi5D9hHiPsqxcVANvrenDnbXbCFvUh18fa2/beICYMDWZL7iKKPFk32RwHWsAGaFxug
         KsxwWikuzfBkpwIYJq2GdEMzV/ueuzBwWlsAt7YmbPONZgt40qcHhT5f0H++NzVHYWN/
         p083F6DBBlr+Do/i4G8at2+0ikPBvTw5VSU/ogRdFBzRjFx0c9jhBKQVr+tfUGIFmJ1U
         qs1w==
X-Gm-Message-State: AGi0PuZliYocTcOqBzNOzz1mOE9+cxB/STBw1xEUt9pFlaa2OdqDATb1
        7cOVPesb71F8MLEHjoMov/OLEWdOvIyhbQ==
X-Google-Smtp-Source: APiQypKdI1BIVT95Od4qBuWLIg3nszfcdvMkVM/Gq5JCv7Oq+2gD9SFq7K7jeOLERuYNzXT5c6/UQA==
X-Received: by 2002:a2e:7c1a:: with SMTP id x26mr10452532ljc.209.1586796308729;
        Mon, 13 Apr 2020 09:45:08 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id o17sm8389756lff.70.2020.04.13.09.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2020 09:45:08 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH 2/3] dt-bindings: regulator: Add document bindings for max77826
Date:   Mon, 13 Apr 2020 19:44:39 +0300
Message-Id: <20200413164440.1138178-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413164440.1138178-1-iskren.chernev@gmail.com>
References: <20200413164440.1138178-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree binding information for max77826 regulator driver.
Example bindings for max77826 are added.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../bindings/regulator/maxim,max77826.yaml    | 70 +++++++++++++++++++
 1 file changed, 70 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77826.yaml

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
new file mode 100644
index 000000000000..3cd449a746b0
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
@@ -0,0 +1,70 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/regulator/maxim,max77826.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Maxim Integrated MAX77826 PMIC
+
+maintainers:
+  - Iskren Chernev <iskren.chernev@gmail.com>
+
+properties:
+  $nodename:
+    pattern: "pmic@[0-9a-f]{1,2}"
+  compatible:
+    enum:
+      - maxim,max77826-regulator
+
+  reg:
+    maxItems: 1
+
+  regulators:
+    type: object
+    allOf:
+      - $ref: regulator.yaml#
+    description: |
+      list of regulators provided by this controller, must be named
+      after their hardware counterparts LDO[1-15], BUCK and BUCKBOOST
+
+    patternProperties:
+      "^LDO([1-9]|1[0-5])$":
+        type: object
+        allOf:
+          - $ref: regulator.yaml#
+
+      "^BUCK|BUCKBOOST$":
+        type: object
+        allOf:
+          - $ref: regulator.yaml#
+
+      additionalProperties: false
+    additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - regulators
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@69 {
+            compatible = "maxim,max77826-regulator";
+            reg = <0x69>;
+
+            regulators {
+                LDO2 {
+                    regulator-name = "ldo2";
+                    regulator-min-microvolt = <650000>;
+                    regulator-max-microvolt = <3587500>;
+                };
+            };
+       };
+     };
+...
-- 
2.26.0

