Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E032D1314F8
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:38:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726463AbgAFPim (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:38:42 -0500
Received: from mail-wm1-f43.google.com ([209.85.128.43]:37155 "EHLO
        mail-wm1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbgAFPim (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:38:42 -0500
Received: by mail-wm1-f43.google.com with SMTP id f129so15717224wmf.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 07:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n+X3gDNQCPJKis4fY2ahlPVwAEpWtIPaMVSozOCGWpU=;
        b=I/p05vqY/d+m+ES1DWifHh0SWvx7T9bm+8ivHsZvg9dIsyFpr7G0jnNA9w8yXUJu1Z
         VZoO3KG7jbiga2E/3+uiK8eo9cT+HMlQonSQPhuJWta7j2UTJP6RotsMcb4lEyF0X3Yr
         Q+MQUzSWMNZUYvPUt0CqutFM6E6DHG9YGbOoc8j1HkZ59dU3u8OOsKhapsTt/mAMrKfd
         Bkua9CUZ/98vwr27U+xP9WCAY05b+YE66+74c5PaeanJIDowYcdaafZjcNRAalqwu6nt
         sLIkZdNqs1P+8Akgktot8H7A0zatiBZspMgxlEDeP9lm1vPu9eBPaJyI9MllvWnIgJ1d
         Q/Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+X3gDNQCPJKis4fY2ahlPVwAEpWtIPaMVSozOCGWpU=;
        b=jwmp1ZiQ6qZlU6QI4VIKgLJR3SICh8hWE3K5h5lOH+07abHQ7Sd/x5f1uYvj9KGDtt
         cB7Z6uU0EbFf22VGI/1M08mB9uKARmi+8brW9N14p1x3vaBZgkqIDYX81nc5dqk7+T8y
         nMTTKqiuOmOsfX8RMZAesQ2rUnbRoZd9vqP+ksyaDthcQVXcAnK0UnBNnVGAZP1rHjPM
         xe61mHUhtbgxOcM8YRjg1Db/opcPSjNE48JR/LFgEuVR8Fy3HlbZctj2Vtx4Q5vRdpe7
         EeMvURP6ywGzzhx3n4XrgO3Tt9Slqasnh+f4asvHB6KAW8g6jiblRhOuQ1LUeilygJ0N
         H4BA==
X-Gm-Message-State: APjAAAUjtS76KKY1n0U3v3BNMAqe7eAhXk7tRhd394I9JJUO2reRXKyi
        DrkHd7DjG3LYgtJHepzVSp7nwQ==
X-Google-Smtp-Source: APXvYqyeVZuEmCqTdmr/EVwykjNQb2E1cRALAMj+ValrdO/y1tKcb2l99Bjlxd7h3kw40E4mZ3ydWg==
X-Received: by 2002:a7b:c19a:: with SMTP id y26mr34876167wmi.152.1578325120326;
        Mon, 06 Jan 2020 07:38:40 -0800 (PST)
Received: from localhost.localdomain (93-137-254-179.adsl.net.t-com.hr. [93.137.254.179])
        by smtp.googlemail.com with ESMTPSA id o1sm72661346wrn.84.2020.01.06.07.38.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:38:39 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v2 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Mon,  6 Jan 2020 16:37:12 +0100
Message-Id: <20200106153711.1282414-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106153711.1282414-1-robert.marko@sartura.hr>
References: <20200106153711.1282414-1-robert.marko@sartura.hr>
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
Cc: Luka Perkov <luka.perkov@sartura.hr>
---
 .../bindings/phy/qcom-usb-ipq4019-phy.yaml    | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
new file mode 100644
index 000000000000..6473731b07a1
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom-usb-ipq4019-phy.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/phy/qcom-usb-ipq4019-phy.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Qualcom IPQ40xx Dakota HS/SS USB PHY
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
+    hsphy@a8000 {
+	   compatible = "qcom,usb-hs-ipq4019-phy";
+	   phy-cells = <0>;
+	   reg = <0xa8000 0x40>;
+	   resets = <&gcc USB2_HSPHY_POR_ARES>,
+		   <&gcc USB2_HSPHY_S_ARES>;
+	   reset-names = "por_rst", "srif_rst";
+    };
-- 
2.24.1

