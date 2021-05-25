Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7CC7A38F6A4
	for <lists+linux-arm-msm@lfdr.de>; Tue, 25 May 2021 02:02:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230031AbhEYAET (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 24 May 2021 20:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhEYAEM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 24 May 2021 20:04:12 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE05C06138A
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:43 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id 69so15445936plc.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 24 May 2021 17:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=W9Fdpfj9PL4rvEigmb2QGhmwBANHPAlZSGnNvCdFiZM=;
        b=ZPl93bbbxQFUkDwjKcmU98GmeBrylXCNPRli/XHIx3pbVK62kq/iQdMuWLu6LZFEnf
         zRqfB+dYNMxsnhABbMeRlPT4j9wT29e5h54MD2dwAa9cZptK1E98OWj9Td7NExrV0yJM
         IktKCVr6X1wGQXA9YvDNTr6sDvOI8BYtm1Jlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=W9Fdpfj9PL4rvEigmb2QGhmwBANHPAlZSGnNvCdFiZM=;
        b=BeQ1dcHkLa6/TKsNvEGYGe04QsdP8MWIVEwxHuz+YS8c96o1nkeSuHZlcQls0ADvO5
         x5fp5ywm4JSLOTmPyHMKW3+iHqpCU673aBS+Dc4dw8GoomV6uVnaKIZHYd67JTW64Xgl
         regOq+jfMJPT8lIhMmpwKfZ4yDXB6zXjooMkZ6+N0LJ3qhRmQ/2YycXCESyrb3IGESY6
         z8rixP8ZH3T7+NkYqnni+n5FVua/kVhW7Lxo5iMjv5hmPOcUhHKOaiaPPYbBLZxE93d8
         tnJz0lLF0K67YSDtMX2sJtE1oyu4bSDvP9s1ER4b1QkWzwTAytZJMVp+lc6KFpEPrbuI
         ik/Q==
X-Gm-Message-State: AOAM531BnWYOSpXoPa3L0r11eY0S2KA/LscMqYru6YpRwe5bDBpWbnn5
        BIIcNGLmLGMRhKupkygSIRDung==
X-Google-Smtp-Source: ABdhPJzEA6lrzK1TzhErfu2B21yXgIxTQg8HxrClwB7kEktuahte8BwRcwy/TibwPGUVkNDM7PvZAw==
X-Received: by 2002:a17:902:d643:b029:ef:62cd:eeed with SMTP id y3-20020a170902d643b02900ef62cdeeedmr28061200plh.42.1621900963170;
        Mon, 24 May 2021 17:02:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:201:26d1:4df0:7cdf:ce13])
        by smtp.gmail.com with ESMTPSA id f18sm10696741pjh.55.2021.05.24.17.02.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 May 2021 17:02:42 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Andrzej Hajda <a.hajda@samsung.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Sam Ravnborg <sam@ravnborg.org>
Cc:     linux-arm-msm@vger.kernel.org, Linus W <linus.walleij@linaro.org>,
        Lyude Paul <lyude@redhat.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Steev Klimaszewski <steev@kali.org>, robdclark@chromium.org,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Thierry Reding <treding@nvidia.com>,
        dri-devel@lists.freedesktop.org,
        Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v8 04/11] dt-bindings: drm/aux-bus: Add an example
Date:   Mon, 24 May 2021 17:01:52 -0700
Message-Id: <20210524165920.v8.4.I79c7ed8815a07d285dd3b38e680e980d1024dbf1@changeid>
X-Mailer: git-send-email 2.31.1.818.g46aad6cb9e-goog
In-Reply-To: <20210525000159.3384921-1-dianders@chromium.org>
References: <20210525000159.3384921-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Now that we have an eDP controller that lists aux-bus, we can safely
add an example to the aux-bus bindings.

NOTE: this example is just a copy of the one in the 'ti-sn65dsi86'
one. It feels useful to have the example in both places simply because
it's important to document the interaction between the two bindings in
both places.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v8:
- Separate DP AUX bus binding is new for v8.

 .../bindings/display/dp-aux-bus.yaml          | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/dp-aux-bus.yaml b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
index 5e4afe9f98fb..43494d2a32a1 100644
--- a/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
+++ b/Documentation/devicetree/bindings/display/dp-aux-bus.yaml
@@ -35,3 +35,68 @@ additionalProperties: false
 
 required:
   - panel
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      bridge@2d {
+        compatible = "ti,sn65dsi86";
+        reg = <0x2d>;
+
+        interrupt-parent = <&tlmm>;
+        interrupts = <10 IRQ_TYPE_LEVEL_HIGH>;
+
+        enable-gpios = <&tlmm 102 GPIO_ACTIVE_HIGH>;
+
+        vpll-supply = <&src_pp1800_s4a>;
+        vccio-supply = <&src_pp1800_s4a>;
+        vcca-supply = <&src_pp1200_l2a>;
+        vcc-supply = <&src_pp1200_l2a>;
+
+        clocks = <&rpmhcc RPMH_LN_BB_CLK2>;
+        clock-names = "refclk";
+
+        no-hpd;
+
+        ports {
+          #address-cells = <1>;
+          #size-cells = <0>;
+
+          port@0 {
+            reg = <0>;
+            endpoint {
+              remote-endpoint = <&dsi0_out>;
+            };
+          };
+
+          port@1 {
+            reg = <1>;
+            sn65dsi86_out: endpoint {
+              remote-endpoint = <&panel_in_edp>;
+            };
+          };
+        };
+
+        aux-bus {
+          panel {
+            compatible = "boe,nv133fhm-n62";
+            power-supply = <&pp3300_dx_edp>;
+            backlight = <&backlight>;
+            hpd-gpios = <&sn65dsi86_bridge 2 GPIO_ACTIVE_HIGH>;
+
+            port {
+              panel_in_edp: endpoint {
+                remote-endpoint = <&sn65dsi86_out>;
+              };
+            };
+          };
+        };
+      };
+    };
-- 
2.31.1.818.g46aad6cb9e-goog

