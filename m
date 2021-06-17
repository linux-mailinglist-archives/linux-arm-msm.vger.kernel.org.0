Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCFD3AB6FE
	for <lists+linux-arm-msm@lfdr.de>; Thu, 17 Jun 2021 17:09:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233175AbhFQPL7 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 17 Jun 2021 11:11:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233172AbhFQPL6 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 17 Jun 2021 11:11:58 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66379C061574
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 08:09:50 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id if15so1831699qvb.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 17 Jun 2021 08:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6CZoxO79EUCj+uToMmmQ6lVMzE5TA3o7zrKqj4+S9KI=;
        b=ZrxvbUOIUHyCiVrYQYrgOpLGX9jlC28Ynxxg3p4qz0YhokhE+x9bkteQs6WqGC1hQg
         7i5bIyDasHmkWLZVP65g3IqUqiNaRB4220pMbWj4+DL+fD9l7/wwf/5eKNyAW0IUxmup
         53oja1wU6sNp+3+uPTk+Au/Gb83w4ninPOIqQtJgpFZo4Kn8YUj0bVqYEna6SHsG/82U
         6EVOMr8OeYo5OugWAuaFQHHN37jvTqM/cJd6kJHVD3s1l4hPc4b8fmbGmNPeJphuCpVU
         kBALGLBZAdUphN6cg2rVtBdn4Fgw8wkoHteU5G8GXu/dEJpTRMEAqMDbmE6mjD5AlOgE
         GHig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6CZoxO79EUCj+uToMmmQ6lVMzE5TA3o7zrKqj4+S9KI=;
        b=b4b1u1d7UhbQFFXlZRe3YxCFGyAuD/v7nXzVKAENEgg7+jDtSPYOKCAo1UkkrWS7jR
         DHjSVMExyOFIKCFSw9tQMYbIWzmJJPQcy+xVhhaMTa7d7V8GgsOXpQtMTMdu+eM7BqPn
         QUdM0CjWFrkZ+p4THt5pduY2YPo0VJ1aJMd9hBwR9cTITT+vx3kgUvfWLTPfx/Qlnc56
         OVjyVO+sOOFMWJenEnBIUMj/AtYihBVa20J2dXh39JUDDG1aO/vOmHGxjg32HVwebE4f
         Qk8HRcno18jE6gQh0ZPIqKgbpzCaeGgLTuiC+LQlLKcnjKj3C8Fksp5+RoJTXYiv603b
         pZWQ==
X-Gm-Message-State: AOAM530rmsZj3gE8qbwQBWG0zDVDpNGM1B4hQIvCbgmCpJXXWytpOAFT
        YBD5koZK8yyG52dnc4HiHU/bnw==
X-Google-Smtp-Source: ABdhPJwqlTnyC6ehAuzvmqugicCKmU0UrwJ2sXGVdmGn/AoPR8lWetbs/2NzMSuB8dsbFuyO/q7mzw==
X-Received: by 2002:a05:6214:80a:: with SMTP id df10mr300267qvb.8.1623942589661;
        Thu, 17 Jun 2021 08:09:49 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id g82sm1915427qke.119.2021.06.17.08.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jun 2021 08:09:49 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     freedreno@lists.freedesktop.org
Cc:     Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-msm@vger.kernel.org (open list:DRM DRIVER FOR MSM ADRENO GPU),
        dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR MSM ADRENO
        GPU),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v4 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Date:   Thu, 17 Jun 2021 10:43:33 -0400
Message-Id: <20210617144349.28448-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210617144349.28448-1-jonathan@marek.ca>
References: <20210617144349.28448-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These got lost when going from .txt to .yaml bindings, add them back.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/display/msm/dsi-phy-7nm.yaml     | 66 +++++++++++++++++++
 1 file changed, 66 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
new file mode 100644
index 000000000000..c0077ca7e9e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -0,0 +1,66 @@
+# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/dsi-phy-7nm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Display DSI 7nm PHY
+
+maintainers:
+  - Jonathan Marek <jonathan@marek.ca>
+
+allOf:
+  - $ref: dsi-phy-common.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - const: qcom,dsi-phy-7nm
+      - const: qcom,dsi-phy-7nm-8150
+
+  reg:
+    items:
+      - description: dsi phy register set
+      - description: dsi phy lane register set
+      - description: dsi pll register set
+
+  reg-names:
+    items:
+      - const: dsi_phy
+      - const: dsi_phy_lane
+      - const: dsi_pll
+
+  vdds-supply:
+    description: |
+      Connected to VDD_A_DSI_PLL_0P9 pin (or VDDA_DSI{0,1}_PLL_0P9 for sm8150)
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - vdds-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+     #include <dt-bindings/clock/qcom,dispcc-sm8250.h>
+     #include <dt-bindings/clock/qcom,rpmh.h>
+
+     dsi-phy@ae94400 {
+         compatible = "qcom,dsi-phy-7nm";
+         reg = <0x0ae94400 0x200>,
+               <0x0ae94600 0x280>,
+               <0x0ae94900 0x260>;
+         reg-names = "dsi_phy",
+                     "dsi_phy_lane",
+                     "dsi_pll";
+
+         #clock-cells = <1>;
+         #phy-cells = <0>;
+
+         vdds-supply = <&vreg_l5a_0p88>;
+         clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
+                  <&rpmhcc RPMH_CXO_CLK>;
+         clock-names = "iface", "ref";
+     };
-- 
2.26.1

