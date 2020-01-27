Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68F9514AB8F
	for <lists+linux-arm-msm@lfdr.de>; Mon, 27 Jan 2020 22:23:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726173AbgA0VXs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 27 Jan 2020 16:23:48 -0500
Received: from mail-wm1-f41.google.com ([209.85.128.41]:53238 "EHLO
        mail-wm1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbgA0VXr (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 27 Jan 2020 16:23:47 -0500
Received: by mail-wm1-f41.google.com with SMTP id p9so142562wmc.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 27 Jan 2020 13:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n+X3gDNQCPJKis4fY2ahlPVwAEpWtIPaMVSozOCGWpU=;
        b=xO9CFYGbuZZyMYvlUiUddDbb8X1KDdpjBLARsr6R5jwOEnG5cW2+ey+teEmhJH6jog
         lhWvDreXRWJDexYpsuB5d8JiRulvuWBHLGhdV0TgjO4gwh4JXcM1PnIwTPI/YTTGJ/e7
         lcJthbp90SgSGEfb1al7qpMIcWTLqlD3UJlyPsOCf0gkv+47iQL2CfTcsUWeHZVvq8JO
         dVaHwYQ/TR5BsMOLb4N0SZKMr2Y6gHZlYpGnMo1OQswx8ad60K/r729QQR9APEbvohat
         aNsSft73ry80AohKqOFPB3iobxWsb8dX856PwZ5NADoqaJGb6swAjpSmnM3omBC+comX
         zPpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+X3gDNQCPJKis4fY2ahlPVwAEpWtIPaMVSozOCGWpU=;
        b=hbGKbMcYFaXBvpLV2HV4HXU7uO6bqzrxbmSN7q4ecpaugD+Dyc/Nzk48h80kdD3Ia5
         v7shiVAyjoH5+gVEsylNCNbUAOlSbP1ANS3bZ9wNEjtmH+RkZb56A5LlN+a7Lk56abR1
         UHA3bTTR2DULLZQqkzyaMZWHZI4qSi86dWv1fch5Zb50/zgEl8WqqDNx0/E0nK96rD0Y
         Ym38RxVSBq5N0KqpVVbGqPeaIT4WgFjFxecQVdWYNkgXvhcwIHXlQgigo7qBrW9O8MGi
         0j8fe4PFgovQOQIGI3Vpxq5II+YEIWOqex+67E0E7N23/kR5FuSOe4rcJaSLB3Z61PgS
         GKaw==
X-Gm-Message-State: APjAAAXCEBnoSE5FFCyIpuNRjKdulSDZoTIh4mHdlq3pt8kDJipkgVOd
        oHUnkqSPOyyC+KbMjvbxnh0Y4w==
X-Google-Smtp-Source: APXvYqyBiH5V9XHKcob40CAcp8LllVZh86U3J4kAvLuJrsEjR6W2l4N7ClVQnCd/OoKElUI0RIl8mw==
X-Received: by 2002:a7b:cf2d:: with SMTP id m13mr632564wmg.163.1580160226053;
        Mon, 27 Jan 2020 13:23:46 -0800 (PST)
Received: from localhost.localdomain ([188.252.202.167])
        by smtp.googlemail.com with ESMTPSA id x132sm683120wmg.0.2020.01.27.13.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2020 13:23:45 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     john@phrozen.org, agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v3 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Mon, 27 Jan 2020 22:23:20 +0100
Message-Id: <20200127212319.1544222-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200127212319.1544222-1-robert.marko@sartura.hr>
References: <20200127212319.1544222-1-robert.marko@sartura.hr>
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

