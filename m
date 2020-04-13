Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8534C1A6ACB
	for <lists+linux-arm-msm@lfdr.de>; Mon, 13 Apr 2020 19:01:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732305AbgDMRBd (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 13 Apr 2020 13:01:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1732286AbgDMRBY (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 13 Apr 2020 13:01:24 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3889AC008749
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:01:23 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id o81so4369763wmo.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 13 Apr 2020 10:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=rKEIBuodM54/jIsOflqk2y5mQUf0xeA0ySBI7eRUbbA=;
        b=jPTarGOLBHICzFk/SWQUkgD3hCg8XcoDG7CXapZcDsRzSzijrqOD5k+F4T12xMaXyT
         qy3afrMlLzxdyUYDQD/VFUeJMY2vJM2FTJsF41V6LjKtYLUAGwWz+Dw5k35Jg8El7kjV
         oU4O7AnoWuRySOg/5UWGOjBJt6Z1eyKHu9iPB1RsBO+LoZ4Wf4XU7m4SpzwS12daXbNc
         uKitNPeGTVXI4iYSDyweG/hu7Zd/ijYe7VOdapbt43UJaQQ1Rj5C8VJUpIKWxPNPe3dS
         R9LkPX1l7cup7CDxcynh6qxvwLYesIfX632SKaVRI3CRV3eiQvMsNsigSIoejQ41TSVw
         qYNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=rKEIBuodM54/jIsOflqk2y5mQUf0xeA0ySBI7eRUbbA=;
        b=HnvvBvJH3VpTh8+WCqm9IBMY6cMAy6Ge3J1zRnET5NUhOX9N1+Emv8STd2lpgHntv+
         4TPnzLFsI2ugb5kZKzIGaPBeig2/ah8YbJtj82L6+O63sacmCZjCyjgEPfdH6SAZAfIi
         mo+iAalCQBD8n4RbxknuVWd+YGrYz1n126S6wuRAtTWIqrcdL24gGYISfbnqkfCPiKra
         vCnGQIqvujRV7PXfQwauCOotPKAchG0jXevgTGO44kGOD0R9agnpktqe3XF7chI04NAQ
         oeQY7IY2aP9j+ffgC09rsBpLgRnLHojjgeWgaFdoMBT1AarikftbRu5QptjLUb+wLTUg
         Wx1A==
X-Gm-Message-State: AGi0PuaobTNLSBIm6AHV5YBaMyGPAzAf8fd3rEHJ0HeUTl5oBrIa0YXV
        BQw4aIMH5eSceNmbm4/XndNY6Q==
X-Google-Smtp-Source: APiQypJ3/fefwpYozAGXpApn99Y34/0sqtBcP3vpsYtKnQrt+DmUza+fQ0CSr/nrIVqQOXBCqD3zSw==
X-Received: by 2002:a1c:bc05:: with SMTP id m5mr9645067wmf.143.1586797281510;
        Mon, 13 Apr 2020 10:01:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:1f1b:192:29fe:7bf:41fe:904d])
        by smtp.googlemail.com with ESMTPSA id q187sm15443268wma.41.2020.04.13.10.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2020 10:01:21 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     andrew@lunn.ch, f.fainelli@gmail.com, hkallweit1@gmail.com,
        linux@armlinux.org.uk, linux-kernel@vger.kernel.org,
        netdev@vger.kernel.org, agross@kernel.org,
        bjorn.andersson@linaro.org, robh+dt@kernel.org,
        mark.rutland@arm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 2/3] dt-bindings: add Qualcomm IPQ4019 MDIO bindings
Date:   Mon, 13 Apr 2020 19:01:06 +0200
Message-Id: <20200413170107.246509-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200413170107.246509-1-robert.marko@sartura.hr>
References: <20200413170107.246509-1-robert.marko@sartura.hr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

This patch adds the binding document for the IPQ40xx MDIO driver.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 .../bindings/net/qcom,ipq40xx-mdio.yaml       | 62 +++++++++++++++++++
 1 file changed, 62 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml

diff --git a/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
new file mode 100644
index 000000000000..3e2ccf417fb6
--- /dev/null
+++ b/Documentation/devicetree/bindings/net/qcom,ipq40xx-mdio.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/net/qcom,ipq40xx-mdio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm IPQ40xx MDIO Controller Device Tree Bindings
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+allOf:
+  - $ref: "mdio.yaml#"
+
+properties:
+  compatible:
+    const: qcom,ipq40xx-mdio
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+examples:
+  - |
+    mdio@90000 {
+      #address-cells = <1>;
+      #size-cells = <0>;
+      compatible = "qcom,ipq40xx-mdio";
+      reg = <0x90000 0x64>;
+      status = "disabled";
+
+      ethphy0: ethernet-phy@0 {
+        reg = <0>;
+      };
+
+      ethphy1: ethernet-phy@1 {
+        reg = <1>;
+      };
+
+      ethphy2: ethernet-phy@2 {
+        reg = <2>;
+      };
+
+      ethphy3: ethernet-phy@3 {
+        reg = <3>;
+      };
+
+      ethphy4: ethernet-phy@4 {
+        reg = <4>;
+      };
+    };
-- 
2.26.0

