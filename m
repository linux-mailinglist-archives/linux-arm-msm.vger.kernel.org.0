Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 985AF3E3F3C
	for <lists+linux-arm-msm@lfdr.de>; Mon,  9 Aug 2021 07:10:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233017AbhHIFK7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 9 Aug 2021 01:10:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231793AbhHIFK7 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 9 Aug 2021 01:10:59 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 565ACC0613CF
        for <linux-arm-msm@vger.kernel.org>; Sun,  8 Aug 2021 22:10:38 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id w13-20020a17090aea0db029017897a5f7bcso4586626pjy.5
        for <linux-arm-msm@vger.kernel.org>; Sun, 08 Aug 2021 22:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=mzB5rukDdQ28T9D/iN7XrHADrrMb0C395X8edJsat90=;
        b=ZgtmhBdcYOqOj/+92KMz6b4Fh1E4950jVPK0MDSxi1k4f2PEqutWBMtIDVVaoxNffb
         avHFUoCKli6f7byYv6O+Hbk5aybJZiMmhdR8ebvgOR02Tw5zdhXs7DzjgFBjMO39VZxS
         FapPFbPHP23M7VEWjwjuYE4e+dy3X93e/7nD6cjTHqu2szyO5y+kwMaWYiu3D7Lp2nFL
         7o/0zF0y3zSQyQMLQ9/WH0BWJKhzWvRtocQ7+jC2W1UmaXZbk6EVHPhNGJgO0VuL3J+j
         rNonX1MV27XvoBSmTGnuCkOoxgLXCFqetllSQC2mInsd1oT0ZEkBhm7bkphnwvf3fIVA
         1QQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=mzB5rukDdQ28T9D/iN7XrHADrrMb0C395X8edJsat90=;
        b=fvVBGMiFRj2YaET1uuLpyQRW3mGY++QRUkd9ZUOlgffmffDYn70bcOBJomv+9f+hFA
         x/sSwTqxy0/eOwO3jBh0n9+q7SzweeD3cx8YLXUXf+ljztxdw/eazO+is3qEwQFOzoIE
         9IRl45Qs2yzI7H7ZKCM4PrWXSdo9HTlSZK9AUapltS0TvMoLlrKAEn/F2N10RgcEob2e
         MFgylQ9C6TX9KRdcj+6gRK14JlC71n/kDTI3u8u0Pf6eXZ8iui6xPKD5YEcqpcatSG+Y
         NMywlEB+OqKpG6WrHbD0e2d7ZuPjaZyqoEHUprigJu/CtWcFgRugkY1jjwNYIGF3QM5L
         INuA==
X-Gm-Message-State: AOAM5337fsWWBlN1WFebOeKa9dqWSUZwesl03cGw/Qf/9FL9jmB4E0+U
        aUIrfWFk0fpfRg7dC3w5HfJOjw==
X-Google-Smtp-Source: ABdhPJzwi+9ZQ7HmhjDWczc1PgAAzuaWyMlQKH609fsjupjHKCMGUf+/nbjA/6ocUHux/bOXk07C5Q==
X-Received: by 2002:a65:63d7:: with SMTP id n23mr291656pgv.46.1628485837946;
        Sun, 08 Aug 2021 22:10:37 -0700 (PDT)
Received: from localhost.localdomain (80.251.214.228.16clouds.com. [80.251.214.228])
        by smtp.gmail.com with ESMTPSA id e35sm20420219pjk.28.2021.08.08.22.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 22:10:37 -0700 (PDT)
From:   Shawn Guo <shawn.guo@linaro.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     Stephan Gerhold <stephan@gerhold.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Shawn Guo <shawn.guo@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: display: Add Sony Tulip Truly NT35521 panel support
Date:   Mon,  9 Aug 2021 13:10:07 +0800
Message-Id: <20210809051008.6172-2-shawn.guo@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210809051008.6172-1-shawn.guo@linaro.org>
References: <20210809051008.6172-1-shawn.guo@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

The Sony Tulip Truly NT35521 is a 5.24" 1280x720 DSI panel, which can
be found on Sony Xperia M4 Aqua phone.  The backlight is managed
through DSI link.

Signed-off-by: Shawn Guo <shawn.guo@linaro.org>
---
 .../panel/sony,tulip-truly-nt35521.yaml       | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml

diff --git a/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
new file mode 100644
index 000000000000..967972939598
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/panel/sony,tulip-truly-nt35521.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/panel/sony,tulip-truly-nt35521.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sony Tulip Truly NT35521 5.24" 1280x720 MIPI-DSI Panel
+
+maintainers:
+  - Shawn Guo <shawn.guo@linaro.org>
+
+description: |
+  The Sony Tulip Truly NT35521 is a 5.24" 1280x720 MIPI-DSI panel, which
+  can be found no Sony Xperia M4 phone.  The panel backlight is managed
+  through DSI link.
+
+allOf:
+  - $ref: panel-common.yaml#
+
+properties:
+  compatible:
+    const: sony,tulip-truly-nt35521
+
+  reg: true
+
+  positive5-supply:
+    description: Positive 5V supply
+
+  negative5-supply:
+    description: Negative 5V supply
+
+  reset-gpios: true
+
+  enable-gpios: true
+
+  port: true
+
+required:
+  - compatible
+  - reg
+  - positive5-supply
+  - negative5-supply
+  - reset-gpios
+  - enable-gpios
+  - port
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
+            compatible = "sony,tulip-truly-nt35521";
+            reg = <0>;
+            positive5-supply = <&positive5_reg>;
+            negative5-supply = <&negative5_reg>;
+            reset-gpios = <&msmgpio 25 GPIO_ACTIVE_LOW>;
+            enable-gpios = <&msmgpio 10 GPIO_ACTIVE_HIGH>;
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0_out>;
+                };
+            };
+        };
+    };
+...
-- 
2.17.1

