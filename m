Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 435011A8766
	for <lists+linux-arm-msm@lfdr.de>; Tue, 14 Apr 2020 19:24:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2407651AbgDNRXk (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 14 Apr 2020 13:23:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S2407646AbgDNRXi (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 14 Apr 2020 13:23:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B735AC061A0C;
        Tue, 14 Apr 2020 10:23:37 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id v9so609022ljk.12;
        Tue, 14 Apr 2020 10:23:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=au2Gtmdu0v0Pt8Xr13H6lym+qwkio4MwypyhGvVFv6g=;
        b=YAm9XnTHosp0VuZPRSUKtt67AvsbOa+OReVcbZDq2kdPx3gOTCCSFxp89yJtB8qpx2
         x3mhlqpHZU4u+nEYaY9qWRVhWEHpzQAuhWuK35mo/xeSm0hd8b6ufSsibrrdWBD+zgn6
         XF27omCVxMng00O+BG0578dSfRkrkjI20FJ4Of3GvB3tBveUZBEAq/EP60TMwPA0uZDg
         eWaR++2Fi6NlU99udZhNXKe2aCYV3s7+BeLVBMKf1oMf1eXiSeRYhf1k0oD+5oasXWNX
         r4+/K1dUYXF7BvgJrq71E0jTYty05xMvtwCoDFVfbIsmN2v4FLPSYTcA3EA/erBBEk2b
         +AjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=au2Gtmdu0v0Pt8Xr13H6lym+qwkio4MwypyhGvVFv6g=;
        b=shdQwiKYCuaOSEEVTQThKjugWAS2CvG+dJrTX4J7UJYaO+nv2/VJ4/54BniqXu1LcC
         sHbaghnC0PiEoh62YR2mC1xx9LcrzU2fnO1TwjirHGZRSdJWvUxnePR4yMzEG7tRFfP6
         sujas6p+trrwVd4m7xJoplkqe8/Pmx2Q5TRpYpe1nKqMGsaRKDgoBNMSy9CrIXQ5nm0f
         Ag+151xKxq5dC+LYxQpPBMlQdB24l+5O/9g/qVVTnfoluvkdvUj+S88LVQwqLKFXSDgf
         uGiQGnHtKxzdwkRSpkVHbR57CFmRZYK9HA9sagjmhJaOz1GcDJKATnr9PTyMpwcgom/p
         Ehbg==
X-Gm-Message-State: AGi0Pua9hVuSGotUEGO9K7DaQxQOj9Vk4JSn+SFw7YjF93vMmiEhy3+2
        7vS5Ga/vTpdq9HeQewP7ea642fMUNcHfNg==
X-Google-Smtp-Source: APiQypJyv7zZf7QoaIGfzrjmLhKjKCJSjybQm7FkVZBtvvikg1bsBufsoXZntqjo3xDCVxj7WitmYQ==
X-Received: by 2002:a2e:3507:: with SMTP id z7mr751989ljz.111.1586885015586;
        Tue, 14 Apr 2020 10:23:35 -0700 (PDT)
Received: from localhost ([213.191.183.145])
        by smtp.gmail.com with ESMTPSA id a11sm5225745lji.62.2020.04.14.10.23.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 10:23:34 -0700 (PDT)
From:   Iskren Chernev <iskren.chernev@gmail.com>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Iskren Chernev <iskren.chernev@gmail.com>
Subject: [PATCH v2 2/3] regulator: Document bindings for max77826
Date:   Tue, 14 Apr 2020 20:22:49 +0300
Message-Id: <20200414172250.2363235-3-iskren.chernev@gmail.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200414172250.2363235-1-iskren.chernev@gmail.com>
References: <20200414172250.2363235-1-iskren.chernev@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add device tree binding information for max77826 regulator driver.

Signed-off-by: Iskren Chernev <iskren.chernev@gmail.com>
---
 .../bindings/regulator/maxim,max77826.yaml    | 69 +++++++++++++++++++
 1 file changed, 69 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/regulator/maxim,max77826.yaml

diff --git a/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
new file mode 100644
index 000000000000..d4f0f958385a
--- /dev/null
+++ b/Documentation/devicetree/bindings/regulator/maxim,max77826.yaml
@@ -0,0 +1,69 @@
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
+      - maxim,max77826
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
+            compatible = "maxim,max77826";
+            reg = <0x69>;
+
+            regulators {
+                LDO2 {
+                    regulator-min-microvolt = <650000>;
+                    regulator-max-microvolt = <3587500>;
+                };
+            };
+       };
+     };
+...
-- 
2.26.0

