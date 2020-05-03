Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7AFC31C2F28
	for <lists+linux-arm-msm@lfdr.de>; Sun,  3 May 2020 22:18:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729119AbgECUSs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 May 2020 16:18:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729118AbgECUSr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 May 2020 16:18:47 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68941C061A0F
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 May 2020 13:18:46 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id z6so6481550wml.2
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 May 2020 13:18:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=bfHcjYUyv6MlZjyzplfB3ZgEKhqt/zyKo76QSHG3/MM=;
        b=vZXEB2epbIpVoA+BJfCm5fftLKSMUAJoOEtMs+B3adMDm9Pk9iaLOXSP4BpUSRDhgY
         b0+J+0VKPdfzIYDLCjf8fJL+CyoDkP1Dr2+y4aILDjIX4MxBBwixSWipfWBwfh5bl9ND
         VDu6Ntrp+NbDoDH688XyXKM8wOoKpk81Z1IqX4+fDzrGTfujw+LhSHsyR2mWQFMl/ckZ
         QOTyvOZuSpCXYbffGEpy14W9z+4dE21oV00zBErgFfvwvr0A9gQ+XEYucs3BXHePYsAx
         PxU+aQ3eqJHblN0nyJJBatw3tbnlgMXW28m0zeK//j4IwG8uLhL7S7rc6IwnG2yOxfO0
         gtiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=bfHcjYUyv6MlZjyzplfB3ZgEKhqt/zyKo76QSHG3/MM=;
        b=SSrVBHQh4Q4fLt/TmcvBzpL/HVfpcRFgJ0F7PcWsA3JnTrqNvGem8ROcH70Z2/Nzkp
         4+oHy/HSt+DH7t2J+yfv1O7Jsfdkv/es8Z5pAFtupit2JGRtUgUcCeDlXYMn3nRiieOR
         L9/p1HFFhs5+c7CsyVrqW3BoBz90YHXCL6DkOTAlIA3vKaHjoTp65SP35WmD20SpChp9
         2X7eP7uXe+TFmqw3N0xbAzWSYTpPF8eGqcYteJnl94RzcbwIvMG2V3DK+XFnP5VOpUAq
         shkfUqmzk0v5ron+seDPXXFwddywHPQdqk9fcaV00oLIMHGdl5ro+fepNIxlp8yQ/xuC
         78kA==
X-Gm-Message-State: AGi0PuafbHUpxXV1MLmH3r3/UBkUEOp2cEZiTQk3MhCcIRBH3yKDEm0U
        e0gSpmLtojwhoXYSgguJptwvQQ==
X-Google-Smtp-Source: APiQypKPS6+yrTNC5H6IvaJjOVpmEIfDVxxBojWQFu13ZzdiP+seVuc9KUSfKstPbNbzdF0774wd3g==
X-Received: by 2002:a1c:e087:: with SMTP id x129mr11207769wmg.127.1588537125147;
        Sun, 03 May 2020 13:18:45 -0700 (PDT)
Received: from localhost.localdomain ([2a0e:b107:830:0:47e5:c676:4796:5818])
        by smtp.googlemail.com with ESMTPSA id 19sm9891624wmo.3.2020.05.03.13.18.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2020 13:18:44 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org, vkoul@kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>, Rob Herring <robh@kernel.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v7 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Sun,  3 May 2020 22:18:23 +0200
Message-Id: <20200503201823.531757-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200503201823.531757-1-robert.marko@sartura.hr>
References: <20200503201823.531757-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the binding documentation for the HS/SS USB PHY found
inside Qualcom Dakota SoCs.

Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Reviewed-by: Rob Herring <robh@kernel.org>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
Changes from v5 to v6:
* Add missing include for reset defines in example
* Fix warning for missing # in #phy-cells

Changes from v4 to v5:
* Replace tabs with whitespaces
* Add maintainer property

 .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
new file mode 100644
index 000000000000..1118fe69b611
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom-usb-ipq4019-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcom IPQ40xx Dakota HS/SS USB PHY
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+properties:
+  compatible:
+    enum:
+      - qcom,usb-ss-ipq4019-phy
+      - qcom,usb-hs-ipq4019-phy
+
+  reg:
+    maxItems: 1
+
+  resets:
+    maxItems: 2
+
+  reset-names:
+    items:
+      - const: por_rst
+      - const: srif_rst
+
+  "#phy-cells":
+    const: 0
+
+required:
+  - compatible
+  - reg
+  - resets
+  - reset-names
+  - "#phy-cells"
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-ipq4019.h>
+
+    hsphy@a8000 {
+      #phy-cells = <0>;
+      compatible = "qcom,usb-hs-ipq4019-phy";
+      reg = <0xa8000 0x40>;
+      resets = <&gcc USB2_HSPHY_POR_ARES>,
+               <&gcc USB2_HSPHY_S_ARES>;
+      reset-names = "por_rst", "srif_rst";
+    };
-- 
2.26.2

