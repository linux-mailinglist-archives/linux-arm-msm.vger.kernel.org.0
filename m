Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 36B042E14EA
	for <lists+linux-arm-msm@lfdr.de>; Wed, 23 Dec 2020 03:48:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729720AbgLWCpp (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Dec 2020 21:45:45 -0500
Received: from mailgw01.mediatek.com ([210.61.82.183]:33207 "EHLO
        mailgw01.mediatek.com" rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org
        with ESMTP id S1730242AbgLWCpo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Dec 2020 21:45:44 -0500
X-UUID: b3dd22b5826046ac9f935a8dc06a1885-20201223
X-UUID: b3dd22b5826046ac9f935a8dc06a1885-20201223
Received: from mtkcas10.mediatek.inc [(172.21.101.39)] by mailgw01.mediatek.com
        (envelope-from <hsin-hsiung.wang@mediatek.com>)
        (Cellopoint E-mail Firewall v4.1.14 Build 0819 with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
        with ESMTP id 1559041122; Wed, 23 Dec 2020 10:44:35 +0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs05n2.mediatek.inc (172.21.101.140) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 23 Dec 2020 10:44:33 +0800
Received: from mtksdaap41.mediatek.inc (172.21.77.4) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 23 Dec 2020 10:44:34 +0800
From:   Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
To:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Mark Brown <broonie@kernel.org>
CC:     Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-mediatek@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <srv_heupstream@mediatek.com>,
        <Project_Global_Chrome_Upstream_Group@mediatek.com>
Subject: [PATCH v5 2/4] dt-bindings: spmi: document binding for the Mediatek SPMI controller
Date:   Wed, 23 Dec 2020 10:44:27 +0800
Message-ID: <1608691469-20919-3-git-send-email-hsin-hsiung.wang@mediatek.com>
X-Mailer: git-send-email 2.6.4
In-Reply-To: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
References: <1608691469-20919-1-git-send-email-hsin-hsiung.wang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-MTK:  N
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This adds documentation for the SPMI controller found on Mediatek SoCs.

Signed-off-by: Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
---
 .../bindings/spmi/mtk,spmi-mtk-pmif.yaml      | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml

diff --git a/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
new file mode 100644
index 000000000000..a43b0302d503
--- /dev/null
+++ b/Documentation/devicetree/bindings/spmi/mtk,spmi-mtk-pmif.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spmi/mtk,spmi-mtk-pmif.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek SPMI Controller Device Tree Bindings
+
+maintainers:
+  - Hsin-Hsiung Wang <hsin-hsiung.wang@mediatek.com>
+
+description: |+
+  On MediaTek SoCs the PMIC is connected via SPMI and the controller allows
+  for multiple SoCs to control a single SPMI master.
+
+allOf:
+  - $ref: "spmi.yaml"
+
+properties:
+  compatible:
+    const: mediatek,mt6873-spmi
+
+  reg:
+    maxItems: 2
+
+  reg-names:
+    items:
+      - const: pmif
+      - const: spmimst
+
+  clocks:
+    minItems: 3
+    maxItems: 3
+
+  clock-names:
+    items:
+      - const: pmif_sys_ck
+      - const: pmif_tmr_ck
+      - const: spmimst_clk_mux
+
+  assigned-clocks:
+    maxItems: 1
+
+  assigned-clock-parents:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - clocks
+  - clock-names
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8192-clk.h>
+
+    spmi: spmi@10027000 {
+        compatible = "mediatek,mt6873-spmi";
+        reg = <0 0x10027000 0 0x000e00>,
+              <0 0x10029000 0 0x000100>;
+        reg-names = "pmif", "spmimst";
+        clocks = <&infracfg CLK_INFRA_PMIC_AP>,
+                 <&infracfg CLK_INFRA_PMIC_TMR>,
+                 <&topckgen CLK_TOP_SPMI_MST_SEL>;
+        clock-names = "pmif_sys_ck",
+                      "pmif_tmr_ck",
+                      "spmimst_clk_mux";
+        assigned-clocks = <&topckgen CLK_TOP_PWRAP_ULPOSC_SEL>;
+        assigned-clock-parents = <&topckgen CLK_TOP_OSC_D10>;
+    };
+...
-- 
2.18.0

