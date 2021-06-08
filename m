Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9219B3A04CB
	for <lists+linux-arm-msm@lfdr.de>; Tue,  8 Jun 2021 21:58:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234618AbhFHT6i (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 8 Jun 2021 15:58:38 -0400
Received: from mail-qk1-f169.google.com ([209.85.222.169]:34803 "EHLO
        mail-qk1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235034AbhFHT61 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 8 Jun 2021 15:58:27 -0400
Received: by mail-qk1-f169.google.com with SMTP id k11so19834395qkk.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 08 Jun 2021 12:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=zFpLFKwnnwm0v+NfjRrYrippm6tYEqwT/Uhc6jwTJ8w=;
        b=b0oPOrNo+272HFqMy8yfisgYJbkEi9xugRr+3TQwP35XzlQTKJPjFtV/nXZ9Dc9k45
         I00qaWcsJkvoAJjbFkUdCKVQIrtxCjt4gxFoCGs8ZLlYojDW3pFiqko1/gwW2Cxql1XZ
         pijnlAtH+m0eF1zZzOxTKmM1lJQcl9onaNuiOuIz/2LdI09pcxIwkVQes9Y51XxgeoKT
         nQZqxpJBAh9rFUBn2q6mV07oqQ4NRNZ8y5cxlEo412V6n+HIxvNNDiQNuARju6qAYth4
         96cjvgZyrsxvAyLeLBh4SnlW22dmLSfSX4vjBYmRZFb+s6mzLTorovZvFuI8k2Mh9Thg
         MbuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=zFpLFKwnnwm0v+NfjRrYrippm6tYEqwT/Uhc6jwTJ8w=;
        b=iA0m/5yGjxPtCiwZDdn2sGbCP4PoUINVyh+ErAoq4IlqjbbSx/5cLkaDPBByhZlrzi
         5TgJTXy0sThbtVnWDX4Y7txuFm6k/u6z75ungURfDefSNrSc192WzF83z/xh4pnkPvBj
         3rS/GXSs3kS50WukjSWZbzhZgsy/8XEPA841M4ls7P9SDJqZfqqH+ncU2sCVjMsrZbXV
         t1olhqt6zjxtlvOMLO1aSSfOksN5O5BdvKQ3afZT9FrmieI4gbrroAQMt/WRiYSJ6Apb
         mtxc+4y+y8sWw6XUy3hYMKjMBIkK2Xq+bpqyFn0XX3CrEkCP1mThwIPUiZQm4lkGaFOb
         fCQw==
X-Gm-Message-State: AOAM530F2HndDUO04O9zjXSbQ8CxJmXzlr/2+Dx2XGZ8OzI7hcWQBvqJ
        bgWdK2SKufZOsWz9EtgKpXXjDw==
X-Google-Smtp-Source: ABdhPJzYaRdFTlAOd4uLx+ty4mPjYDj5n0p9y4JDG0llRCv/4CexdXu+QJN2N5fMSfqvkuPcfAeTBA==
X-Received: by 2002:a05:620a:1675:: with SMTP id d21mr22993674qko.390.1623182133954;
        Tue, 08 Jun 2021 12:55:33 -0700 (PDT)
Received: from localhost.localdomain (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
        by smtp.gmail.com with ESMTPSA id l141sm643687qke.48.2021.06.08.12.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 12:55:33 -0700 (PDT)
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
Subject: [PATCH v3 1/3] dt-bindings: msm: dsi: add missing 7nm bindings
Date:   Tue,  8 Jun 2021 15:53:27 -0400
Message-Id: <20210608195342.18269-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210608195342.18269-1-jonathan@marek.ca>
References: <20210608195342.18269-1-jonathan@marek.ca>
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
index 000000000000..bf16b1c65e10
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
+               <0x0ae94900 0x260>;;
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

