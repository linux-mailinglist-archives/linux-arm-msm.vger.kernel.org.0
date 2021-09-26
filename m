Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EEE56418540
	for <lists+linux-arm-msm@lfdr.de>; Sun, 26 Sep 2021 02:10:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230157AbhIZALv (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 25 Sep 2021 20:11:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230175AbhIZALv (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 25 Sep 2021 20:11:51 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72FD2C061604
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 17:10:15 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id z24so58709107lfu.13
        for <linux-arm-msm@vger.kernel.org>; Sat, 25 Sep 2021 17:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wQ7XLvRIpTNyBxBWQkQCoLNOFtGjOh9e3PBhRdedrAA=;
        b=FPl8yjptljlW/qPrAwlhW1vx52iGXlpEkAxmY/9+qA9sTJiee9kQ/uapemrhC2EThb
         iWRsNXY9TmNvye7cvFzSSdB8AKepVflKkZ8Lo5TUpjYEFMokMiqYgYG8RUPwjBDBWNZA
         7xi44+ES5jlV0NiPvbEohu+bXfLq9w95hxMl1/qCxHu+E75/8h6ZlGFvPldrTA4Olyr1
         Ai0B59E5duQGNWpNbftIV64htBUEBo0spWF+G7gXrguwwXt0mItknU0UOCvk9Qet22s1
         +WM8OSw87T7a8OU/HZc7YVXH8zGaoWuYO7tOxDWroN3szTaPUMPUpKmq2N8xQ5Z2kh17
         4Pxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wQ7XLvRIpTNyBxBWQkQCoLNOFtGjOh9e3PBhRdedrAA=;
        b=bsrlS7Kw8jHuMLPeVFMzx8VGIBy3vz6fFkWjpxsvlLYMjbV2dkbwpxgmEsO9rG2Ffu
         SftJ5NSNPcn/SpL6oAsPitooThNxVeSZnckgMKoh8ZxN6p0mtlyTCIDFhmij2aEL50u7
         /k9S+eTXZ0OmCWKuXzxaVvGnP0KXS2kl582Mr0FUMFBUhuJqMdcpRpAYnmtvWPnBxYYA
         Zv+6OHCIVxfc4pLNkfSvra7CcJajGjwmochDGRldN0QXSdJBXGrZHFgNiKiQS9K5bAYT
         ua1Z3lvnzuDhyJRlSACNN8jhu3jc6M4puxpHBE1WuE6lKRRZZ+LcQJtLqy37yDAOsEJI
         O6Nw==
X-Gm-Message-State: AOAM531U6YW3ldzOzZy3VaOr3kgOoGA2uMPR0hAyTCv9cqtdLQXkOLsN
        ifpyKqP6r9LSR1ttvdU9EvnwVw==
X-Google-Smtp-Source: ABdhPJyK/qBjuYuB0MaOKAp7wB6gRYUwKmiERY0RB5lt/ohJM8e4UihePx3StGWHU6yanayxOkRkLw==
X-Received: by 2002:a05:6512:2210:: with SMTP id h16mr16625606lfu.621.1632615013770;
        Sat, 25 Sep 2021 17:10:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id s7sm1261878lfi.130.2021.09.25.17.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Sep 2021 17:10:13 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: [PATCH v3 1/2] dt-bindings: add bindings for the Sharp LS060T1SX01 panel
Date:   Sun, 26 Sep 2021 03:10:04 +0300
Message-Id: <20210926001005.3442668-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
References: <20210926001005.3442668-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree bindings for the Sharp LS060T1SX01 6.0" FullHD panel
using NT35695 driver. This panel can be found i.e. in the Dragonboard
Display Adapter bundle.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
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

