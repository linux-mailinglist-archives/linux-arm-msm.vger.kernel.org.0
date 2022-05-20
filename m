Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0386E52F2D8
	for <lists+linux-arm-msm@lfdr.de>; Fri, 20 May 2022 20:32:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232346AbiETSce (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 20 May 2022 14:32:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350103AbiETSb5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 20 May 2022 14:31:57 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82D804C7A8
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:31:32 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id u30so15741108lfm.9
        for <linux-arm-msm@vger.kernel.org>; Fri, 20 May 2022 11:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5FZ3X9pyACFPn7qxDpNcYlsLDiN9axBa1lcjcR2eStw=;
        b=hdczd8Cwb0mgdDGQ11Ih2/DGqWB6Bc9f3PzTxKyx14nXGUBxsZePQptaEoNMDM8jLB
         dIRDk7EggIMk/agdJy8ujcU535QSooPkeDVjnKlyFRIlcoJc8/SzACBCDNuSArMDLjd2
         vI5w7UCykpaihPScOuO4K2OP1bHHc4AiDTeqZsx1OzGQxvJUtG3KBwVgBqHMc/dZCAok
         +Vk8RuhFFUQINg+jVZlN403TkGX+xHFyVxGKZSRbEu7bMt1OOynjASKFZVUk1ayELQRQ
         cgiE9I5hGFN4+aOYd15fauB79FtoVb1suKWqElDIiZrOhHNEiGVVvwFlfxpzNDELmHQ6
         6yuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5FZ3X9pyACFPn7qxDpNcYlsLDiN9axBa1lcjcR2eStw=;
        b=QB/M//IqyycR1PQbhkPyO6TtuDsuebhw0heDCzTL3QoDwX7jgdFceiAqP/FvzroNNP
         98/AJF0BeSKM9NgaYO8e5q6awmC8PmVdjQCZQlKefLZm14TiAgov7zmp2QcfXPNbAPy4
         jk5MhG5hiGIeRO8cmtBZoJv/GgrSWIVzmFJ4wZ+0j2/z3Cm+ngxNVD72S2IUDJ5WYgYi
         zBdqXZWlEShUgZ8amElsCI090QEjsTk7BzXasLr1moHWqqe4/WAXs/mjNcFyQtGjL3st
         0MkKTVqNmks/+px3MGgFnKJsx99W0lui9CTQtTkRinFXCfjYlMD0ZW+QhfabFUQFORPL
         iUAw==
X-Gm-Message-State: AOAM532DF8EfaObwtG5r+v0w1PvVy01nW6I2IOqZ7r2K24g6BsVAO695
        XROMEzcpXo9DFQq4ocdMIQt+dOjEm+ZPXg==
X-Google-Smtp-Source: ABdhPJwTmIcrpw8gZc+R7s1tSYDqwRsexgK/B4TQTuUZcczwTh5FqdQcprp9UFbtVLez7gflypTlpw==
X-Received: by 2002:a05:6512:2347:b0:478:5a69:6dc4 with SMTP id p7-20020a056512234700b004785a696dc4mr1492837lfu.478.1653071489912;
        Fri, 20 May 2022 11:31:29 -0700 (PDT)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
        by smtp.gmail.com with ESMTPSA id t22-20020a2e9556000000b0024f3d1daef4sm392951ljh.124.2022.05.20.11.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 May 2022 11:31:29 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Cc:     Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
        Johan Hovold <johan@kernel.org>
Subject: [PATCH v11 7/7] dt-bindings: mfd: qcom,qca639x: add binding for QCA639x defvice
Date:   Fri, 20 May 2022 21:31:14 +0300
Message-Id: <20220520183114.1356599-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220520183114.1356599-1-dmitry.baryshkov@linaro.org>
References: <20220520183114.1356599-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Qualcomm QCA639x is a family of WiFi + Bluetooth SoCs, with BT part
being controlled through the UART and WiFi being present on PCIe bus.
Both blocks share common power sources. Add binding to describe power
sequencing required to power up this device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/mfd/qcom,qca639x.yaml | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml

diff --git a/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml b/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
new file mode 100644
index 000000000000..d43c75da136f
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/qcom,qca639x.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/mfd/qcom,qca639x.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcomm QCA639x WiFi + Bluetoot SoC bindings
+
+maintainers:
+  - Andy Gross <agross@kernel.org>
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description: |
+  This binding describes thes Qualcomm QCA6390 or QCA6391 power supplies and
+  enablement pins.
+
+properties:
+  compatible:
+    const: qcom,qca639x
+
+  '#power-domain-cells':
+    const: 0
+
+  pinctrl-0: true
+  pinctrl-1: true
+
+  pinctrl-names:
+    items:
+      - const: default
+      - const: active
+
+  vddaon-supply:
+    description:
+      0.95V always-on LDO power input
+
+  vddpmu-supply:
+    description:
+      0.95V LDO power input to PMU
+
+  vddrfa1-supply:
+    description:
+      0.95V LDO power input to RFA
+
+  vddrfa2-supply:
+    description:
+      1.25V LDO power input to RFA
+
+  vddrfa3-supply:
+    description:
+      2V LDO power input to RFA
+
+  vddpcie1-supply:
+    description:
+      1.25V LDO power input to PCIe part
+
+  vddpcie2-supply:
+    description:
+      2V LDO power input to PCIe part
+
+  vddio-supply:
+    description:
+      1.8V VIO input
+
+additionalProperties: false
+
+examples:
+  - |
+    qca639x: qca639x {
+      compatible = "qcom,qca639x";
+      #power-domain-cells = <0>;
+
+      vddaon-supply = <&vreg_s6a_0p95>;
+      vddpmu-supply = <&vreg_s2f_0p95>;
+      vddrfa1-supply = <&vreg_s2f_0p95>;
+      vddrfa2-supply = <&vreg_s8c_1p3>;
+      vddrfa3-supply = <&vreg_s5a_1p9>;
+      vddpcie1-supply = <&vreg_s8c_1p3>;
+      vddpcie2-supply = <&vreg_s5a_1p9>;
+      vddio-supply = <&vreg_s4a_1p8>;
+      pinctrl-names = "default", "active";
+      pinctrl-0 = <&wlan_default_state &bt_default_state>;
+      pinctrl-1 = <&wlan_active_state &bt_active_state>;
+    };
+...
-- 
2.35.1

