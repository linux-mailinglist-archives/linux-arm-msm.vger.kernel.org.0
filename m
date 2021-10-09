Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B98B6427D0D
	for <lists+linux-arm-msm@lfdr.de>; Sat,  9 Oct 2021 21:11:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229722AbhJITNQ (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 9 Oct 2021 15:13:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37180 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229676AbhJITNQ (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 9 Oct 2021 15:13:16 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08523C061570
        for <linux-arm-msm@vger.kernel.org>; Sat,  9 Oct 2021 12:11:19 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id r19so51754801lfe.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 09 Oct 2021 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQPUEa8OvCosmaFsM7/Dz8Pb+7os83Bmi+8K2CLkYuQ=;
        b=VGwxz6gzbWGSGZmtOYK1BmEe3iR+X8spc/jQIjgXQMYmao91eBnwxtx4a7mJLuncTx
         IXJ0d4EDel2ySkKCjDLbZZa0p0h2r59jN8rk4yEPJQXo11OU5O56uvzOnZ249E1a8ZI2
         lwUUtuha7dSAWi7s+XHYR5pZIDN8okr9NLhed/+/ME4ZHbde76awBOryXmCu9P/yEA+5
         AR1wlFNxbENI3jTQqu9KifBuWiFujP4F0Q9aGTydpvWYG6ykCnPbNIdFIPmbMLYHOriI
         uJ88gi30CbSUH8hjOWiC/WpttXImYlwd7h1ngmqRuD/kI8Zu82QS4DfklgrO8nky2RZ/
         a18g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQPUEa8OvCosmaFsM7/Dz8Pb+7os83Bmi+8K2CLkYuQ=;
        b=kT7kDwoEwTMUyF2WZEinWYmQuQ30ww1vwZ6gkXk/9+/znJzn5M1GY+Wi3SpdoWWFwb
         nQfq/Y0MVnndMI6i/Zu4dY6izL7NjoJGP53OKQ0Hxxrp+L/2qkQrUwXK3g4EBHdMYBlB
         j1ZfJKFLfGW8/MTLt7rw1XY0tHTxjxUR280gq2+HVCu4QizarpSqQu1DMrFbYBMUENMv
         pNOBl9T2mG8927Qsm0OW9skFKIdrYxLLY1mhBjOHvYO8LOka764NlATRLHTYxBllGu1Z
         00v5hVBkdfb1zo+68pT2eQClom9vPR0vHi6dyqdhYJvFfAuuXuXu5oDsvXkrnieQ0gJA
         3CpA==
X-Gm-Message-State: AOAM530jMV7ckBGdxLRusYUiRWGods2qU84320ZZys2W/1ctROcwqAK4
        7x6tVR7BnJNT+W4ZOZVzT/gy+w==
X-Google-Smtp-Source: ABdhPJwGxLj5GT+fssvKxAdyKbPQHQZ3z4Edjs4zJv44xtSEvfUeyiQ534wCcbUd9pY3mo+BgigfSA==
X-Received: by 2002:a19:7b05:: with SMTP id w5mr17507378lfc.212.1633806677302;
        Sat, 09 Oct 2021 12:11:17 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id r3sm272311lfc.114.2021.10.09.12.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 12:11:16 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: add bindings for the Sharp LS060T1SX01 panel
Date:   Sat,  9 Oct 2021 22:11:13 +0300
Message-Id: <20211009191114.45900-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211009191114.45900-1-dmitry.baryshkov@linaro.org>
References: <20211009191114.45900-1-dmitry.baryshkov@linaro.org>
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

