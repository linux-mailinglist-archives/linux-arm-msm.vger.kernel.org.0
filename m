Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B2B5E5121C0
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 Apr 2022 20:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231736AbiD0Szi (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 Apr 2022 14:55:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234085AbiD0Sy5 (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 Apr 2022 14:54:57 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33442EDB47
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 11:41:25 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id l62-20020a1c2541000000b0038e4570af2fso1723328wml.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 27 Apr 2022 11:41:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UNAQFZYH/igEDPdHL3ir2IRYt88PXPn3Q8Z0llJsjqM=;
        b=CyKF3Gtrgmb7DChTG3HlP4rJaP76kaU7Pyy88pG48AITBWCw6zfeggSjVMMbPXvRU1
         p5ujHRua3cun+gOuyUcEyDcPN1zcFVtvGCJfFoXZfQtm9Kqgt/EJulxsuJfWOLv6j7uO
         6Eva9zTK70UGMX0wQLYHXDLwSVrOawg5AbtUZz/mlDOiU0lvphnI9Y8P3ZMuFsUoHAC3
         npJergekPUXVOIYURxpSS4jKX1MF6oFivsSRx4AyDdr7PdOhS4BvpE6nRBAUmqXZOYtT
         AppTN7aVR9FE0XYXTikyT7vGkMMTZMaCdsXVO6ddal3pBOXQaqEf+dqYOqv77s9dLOR2
         kBXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UNAQFZYH/igEDPdHL3ir2IRYt88PXPn3Q8Z0llJsjqM=;
        b=EAlZVuY5b2opwo3K7PqZhkiTWehaHbG3Vvdo7fBJ9Eelhw+/wBbKRFtWjPAMXTLhW8
         S7TXnp9KNk+lzI2583TF6T9RoNkeSnomxotJsaQy4ejif6lMtn56UkWMJZ3RPTrHVbRb
         5COXkHMx1ARyw4Lip0wDrQOHLFillu2wK2+ipQAW+AmX4WunNJEbe4l5x//aSr8W7BTM
         6W9GtFVkFQpGB/ERuvfMgefKluSHzauAQWqHaYAVNI3wKm7z4VG9wVY/yswv3u6eHnpD
         HvsaWtlsSDOsmsCI5uoeiu/Whs65rtOVQHxMMVUSEbrMI+0ddgM5tysyK4HDMSS8znST
         61jQ==
X-Gm-Message-State: AOAM531d1c1cy1UCDGoNgLeg6y1nJO1LxpR58mSWWIgYpDSfK0z33ZCj
        XfhVV8pjalQYe5v0Lt9WFAH5/A==
X-Google-Smtp-Source: ABdhPJw3sVTSRGZWSYrRc79qfqdc3uTzShD8sEa4DX2AY7xFycIkSg4u3I0cKXiCbzqFYll7z/WcCA==
X-Received: by 2002:a05:600c:3b02:b0:393:e7d4:b660 with SMTP id m2-20020a05600c3b0200b00393e7d4b660mr18720272wms.183.1651084883538;
        Wed, 27 Apr 2022 11:41:23 -0700 (PDT)
Received: from localhost.localdomain (cpc78119-cwma10-2-0-cust590.7-3.cable.virginm.net. [81.96.50.79])
        by smtp.gmail.com with ESMTPSA id f3-20020a5d64c3000000b0020aef267950sm1992798wri.49.2022.04.27.11.41.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Apr 2022 11:41:22 -0700 (PDT)
From:   Caleb Connolly <caleb.connolly@linaro.org>
To:     caleb.connolly@linaro.org, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Amit Pundir <amit.pundir@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH 6/6] dt-bindings: power: supply: qcom,pmi8998-charger: add bindings for smb2 driver
Date:   Wed, 27 Apr 2022 19:40:31 +0100
Message-Id: <20220427184031.2569442-7-caleb.connolly@linaro.org>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220427184031.2569442-1-caleb.connolly@linaro.org>
References: <20220427184031.2569442-1-caleb.connolly@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add devicetree bindings for the Qualcomm PMI8998/PM660 SMB2 charger
driver.

Signed-off-by: Caleb Connolly <caleb.connolly@linaro.org>
---
 .../power/supply/qcom,pmi8998-charger.yaml    | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml

diff --git a/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
new file mode 100644
index 000000000000..41b471713364
--- /dev/null
+++ b/Documentation/devicetree/bindings/power/supply/qcom,pmi8998-charger.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/power/supply/qcom,pmi8998-charger.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm PMI8998/PM660 Switch-Mode Battery Charger "2"
+
+maintainers:
+  - Caleb Connolly <caleb.connolly@linaro.org>
+
+properties:
+  compatible:
+    enum:
+      - qcom,pmi8998-charger
+      - qcom,pm660-charger
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 4
+    maxItems: 4
+
+  interrupt-names:
+    items:
+      - const: usb-plugin
+      - const: bat-ov
+      - const: wdog-bark
+      - const: usbin-icl-change
+
+  io-channels:
+    items:
+      - description: USB in current in uA
+      - description: USB in voltage in uV
+
+  io-channel-names:
+    items:
+      - const: usbin_i
+      - const: usbin_v
+
+  monitored-battery:
+    description: phandle to the simple-battery node
+    $ref: /schemas/types.yaml#/definitions/phandle
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - interrupt-names
+  - io-channels
+  - io-channel-names
+  - monitored-battery
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    pmic {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      #interrupt-cells = <4>;
+
+      charger@1000 {
+        compatible = "qcom,pmi8998-charger";
+        reg = <0x1000>;
+
+        interrupts = <0x2 0x12 0x2 IRQ_TYPE_EDGE_BOTH>,
+                     <0x2 0x13 0x4 IRQ_TYPE_EDGE_BOTH>,
+                     <0x2 0x13 0x6 IRQ_TYPE_EDGE_RISING>,
+                     <0x2 0x16 0x1 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "usb-plugin", "bat-ov", "wdog-bark", "usbin-icl-change";
+
+        io-channels = <&pmi8998_rradc 3>,
+                      <&pmi8998_rradc 4>;
+        io-channel-names = "usbin_i",
+                           "usbin_v";
+
+        monitored-battery = <&battery>;
+      };
+    };
-- 
2.36.0

