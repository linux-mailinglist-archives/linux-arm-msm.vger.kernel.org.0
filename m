Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 444673BB54D
	for <lists+linux-arm-msm@lfdr.de>; Mon,  5 Jul 2021 04:50:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229760AbhGECxc (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 4 Jul 2021 22:53:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229744AbhGECxb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 4 Jul 2021 22:53:31 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4480C061762
        for <linux-arm-msm@vger.kernel.org>; Sun,  4 Jul 2021 19:50:54 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id w15so16928368pgk.13
        for <linux-arm-msm@vger.kernel.org>; Sun, 04 Jul 2021 19:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=BVkVvoLhlvv3KppO1b0TRg6fddRYWUrnF61FALx2Tlg=;
        b=RLMt+5SGRUMwjcxTeILVJP0YqCzVQGNhwSlb7M1kOV12rHTmadCBJTIMw9keQJpKtM
         te5EyOcJv5Hhtw/VzLQ0WQ/SfMchIiYf0akkEUWulD68s1lj/rWCanhMI7DcKDGUJ5RM
         c3WmV3+OKUy4E5eA5vxDpHl+HJLRBJH1D6zFpvsTr6DnJj8AJhzsWWMdQHhhM4rz763o
         /K8V40tpnHRMo+HAOZTjf472ihe0bZwAeoUqeOHm//CkTMTtWY5RbH1HT0uirq/rl36V
         mTnHkUhxHi+fsaB5AhaebK9+aWUv4BgPTSaH6buwSL4g9PRFpDL+dxQ0+fPRfuJXmaBe
         fTpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=BVkVvoLhlvv3KppO1b0TRg6fddRYWUrnF61FALx2Tlg=;
        b=r6ihUeRcN8ZG3rVmx4Kw7PMhkFujKNzlO+XtbXpXOc51OrDalj/RfF0z0r0rtqXWY+
         sYN6iHmwZNwA95PEpSnIrxGWW9y0OAr2BhjXBDq/4Sl0nTVumrnXBzW1uk/ncbRhreHw
         FBdqoFWiJke3/1WdBllF5p/JLnBfcspl3huntx50XXivCz+ucggctMcZcbZVhN+yikwo
         ZIpeQ1bOHjL86t6UnURUts17a7uDCArTtDAYp6tGLHp4IFS9B4rlICR7L+oCPFad7LA0
         mpLWtzHIa/lFuoANhJ1jx2xFtmR5s/cdzhZddrJZku0zAV5zhzHuE0jbKXt2GbI612j+
         v91Q==
X-Gm-Message-State: AOAM533WU5DII3J1MQ3vEJsjYm/BbYbf5XNijjut73nKF5GdkJyiLHpG
        F7llzLMZgZWJp8ehQ56F803UqA==
X-Google-Smtp-Source: ABdhPJy2wxkmR9njdKtQHvZAuf5Z8esv5vUXz+zBwMP32HUxP1F5FUGrVZJDfmyfKZa2xtORNFJonw==
X-Received: by 2002:a63:5117:: with SMTP id f23mr13113629pgb.200.1625453454408;
        Sun, 04 Jul 2021 19:50:54 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id i13sm11891041pgm.26.2021.07.04.19.50.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 19:50:53 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Sebastian Reichel <sre@kernel.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Rob Herring <robh+dt@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-pm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH 1/3] dt-bindings: power: reset: Convert qcom,pon to DT schema
Date:   Mon,  5 Jul 2021 10:50:30 +0800
Message-Id: <20210705025032.12804-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210705025032.12804-1-shawn.guo@linaro.org>
References: <20210705025032.12804-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

It converts qcom,pon DT bindings from legacy bare text to YAML format.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../bindings/power/reset/qcom,pon.txt         | 49 -------------------
 .../bindings/power/reset/qcom,pon.yaml        | 49 +++++++++++++++++++
 2 files changed, 49 insertions(+), 49 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.txt
 create mode 100644 Documentation/devicetree/bindings/power/reset/qcom,pon.yaml

diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt b/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
deleted file mode 100644
index 0c0dc3a1e693..000000000000
--- a/Documentation/devicetree/bindings/power/reset/qcom,pon.txt
+++ /dev/null
@@ -1,49 +0,0 @@
-Qualcomm PON Device
-
-The Power On device for Qualcomm PM8xxx is MFD supporting pwrkey
-and resin along with the Android reboot-mode.
-
-This DT node has pwrkey and resin as sub nodes.
-
-Required Properties:
--compatible: Must be one of:
-	"qcom,pm8916-pon"
-	"qcom,pms405-pon"
-	"qcom,pm8998-pon"
-
--reg: Specifies the physical address of the pon register
-
-Optional subnode:
--pwrkey: Specifies the subnode pwrkey and should follow the
- qcom,pm8941-pwrkey.txt description.
--resin: Specifies the subnode resin and should follow the
- qcom,pm8xxx-pwrkey.txt description.
-
-The rest of the properties should follow the generic reboot-mode description
-found in reboot-mode.txt
-
-Example:
-
-	pon@800 {
-		compatible = "qcom,pm8916-pon";
-
-		reg = <0x800>;
-		mode-bootloader = <0x2>;
-		mode-recovery = <0x1>;
-
-		pwrkey {
-			compatible = "qcom,pm8941-pwrkey";
-			interrupts = <0x0 0x8 0 IRQ_TYPE_EDGE_BOTH>;
-			debounce = <15625>;
-			bias-pull-up;
-			linux,code = <KEY_POWER>;
-		};
-
-		resin {
-			compatible = "qcom,pm8941-resin";
-			interrupts = <0x0 0x8 1 IRQ_TYPE_EDGE_BOTH>;
-			debounce = <15625>;
-			bias-pull-up;
-			linux,code = <KEY_VOLUMEDOWN>;
-		};
-	};
diff --git a/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
new file mode 100644
index 000000000000..7764c804af1d
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/reset/qcom,pon.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/reset/qcom,pon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PON Device
+
+maintainers:
+  - Vinod Koul <vkoul@kernel.org>
+
+description: |
+  The Power On device for Qualcomm PM8xxx is MFD supporting pwrkey
+  and resin along with the Android reboot-mode.
+
+properties:
+  compatible:
+    enum:
+      - qcom,pm8916-pon
+      - qcom,pms405-pon
+      - qcom,pm8998-pon
+
+  reg:
+    maxItems: 1
+
+patternProperties:
+  "^mode-.+":
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: Vendor-specific mode value written to the mode register
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    pmic {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pon@800 {
+            compatible = "qcom,pm8916-pon";
+            reg = <0x800>;
+            mode-bootloader = <0x2>;
+            mode-recovery = <0x1>;
+        };
+    };
-- 
2.17.1

