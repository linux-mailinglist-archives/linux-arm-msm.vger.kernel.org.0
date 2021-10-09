Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E27F2427D5B
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 22:38:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230116AbhJIUkI (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 16:40:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbhJIUkI (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 16:40:08 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D17D6C061764
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Oct 2021 13:38:10 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id y15so54459298lfk.7
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Oct 2021 13:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQPUEa8OvCosmaFsM7/Dz8Pb+7os83Bmi+8K2CLkYuQ=;
        b=XZNLFqDtLHyAt0u7ubWFUXHSZxiW4SFeSMa51typpx5XhAF0iV6eOIJY/JAD7YPLzj
         PTXEEXhXY8SwXbE0HXi59GBE6Bop1i2ZZpVYP/6YynUA0nmPU8pZEdJzQ1+At1pOp/ga
         9oVa1bE7E3RT9Gapt1f/GddcWDRQQNLzgE/4qgEjuaHbqxcK56kqXSw0g0M6VaQDeq6v
         C7efmxHNIirle4sKsmJetqOozE6KyFRchB9p4V/eLe/0kSGjbkMwIvRcaQFNkb+WLULO
         qXkqTIdzEEuqrk+G/HU8HuV7ruxK+AmA1Tm8c7LxENMmMeOORO/fymJWUGpxJXTRXfrA
         WdxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQPUEa8OvCosmaFsM7/Dz8Pb+7os83Bmi+8K2CLkYuQ=;
        b=n3JiWH/meIAJTUGgKFqSaD9bUJ3TKC+9O19rDRQs98Jus1gxBGtZGyCO7BmiYbpM3z
         CvUkZMxVX27w0vNJnFBujusiLlaBpaoGofDTUpQOsIynylh/FHGbDv3ABABIGA1HXCin
         bpGkdfawHLTP7RmVUlwqO2jJSJYYWJ7Sa/tRvunys49snmYzPRPNAVMth8CZG39/30JN
         Pa1YSuC+QzF2ZcF7LngosE42IYP5yez8gL4bQ9YrvGw8KB9JnobKZjmFHl4pPZWdhqIj
         hkPJM1z4SCtRBA2bwlDwPjMiFV1ftY/RSOHfwZfoAqKqOjNmb0fL7GAyen2AmQ9giDve
         nwDQ==
X-Gm-Message-State: AOAM530VRtVUJ2YkJe9O+P2dVpuN6qamwQpPANZxMvYQbMNySeK3Y3S2
        7N3prEGCQw3j0Mbj9gHv2CfNJQ==
X-Google-Smtp-Source: ABdhPJxQEFHB6g1MJrKY8GcRZK2unqUnU6fzHUKuONkab4hwflHH3zsN4HGL6SDN/2JwxC9ky5MD9w==
X-Received: by 2002:a2e:9097:: with SMTP id l23mr12710117ljg.416.1633811889174;
        Sat, 09 Oct 2021 13:38:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id q187sm303794ljb.6.2021.10.09.13.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 13:38:08 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v5 1/2] dt-bindings: add bindings for the Sharp LS060T1SX01 panel
Date:   Sat,  9 Oct 2021 23:38:05 +0300
Message-Id: <20211009203806.56821-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009203806.56821-1-dmitry.baryshkov@linaro.org>
References: <20211009203806.56821-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
using NT35695 driver. This panel can be found i.e. in the Dragonboard
Display Adapter bundle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../display/panel/sharp,ls060t1sx01.yaml      | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
new file mode 100644
index 000000000000..271c097cc9a4
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sharp,ls060t1sx01.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sharp,ls060t1sx01.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sharp Microelectronics 6.0" FullHD TFT LCD panel
+
+maintainers:
+  - Dmitry Baryskov <dmitry.baryshkov@linaro.org>
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sharp,ls060t1sx01
+
+  reg: true
+  backlight: true
+  reset-gpios: true
+  port: true
+
+  avdd-supply:
+    description: handle of the regulator that provides the positive supply voltage
+  avee-supply:
+    description: handle of the regulator that provides the negative supply voltage
+  vddi-supply:
+    description: handle of the regulator that provides the I/O supply voltage
+  vddh-supply:
+    description: handle of the regulator that provides the analog supply voltage
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    dsi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        panel@0 {
+            compatible = "sharp,ls060t1sx01";
+            reg = <0>;
+            avdd-supply = <&pm8941_l22>;
+            backlight = <&backlight>;
+            reset-gpios = <&pm8916_gpios 25 GPIO_ACTIVE_LOW>;
+        };
+    };
+
+...
-- 
2.33.0

