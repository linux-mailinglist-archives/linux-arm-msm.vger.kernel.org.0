Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C4751314D9
	for <lists+linux-arm-msm@lfdr.de>; Mon,  6 Jan 2020 16:33:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726437AbgAFPdh (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 6 Jan 2020 10:33:37 -0500
Received: from mail-wr1-f43.google.com ([209.85.221.43]:38627 "EHLO
        mail-wr1-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbgAFPdg (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 6 Jan 2020 10:33:36 -0500
Received: by mail-wr1-f43.google.com with SMTP id y17so50107030wrh.5
        for <linux-arm-msm@vger.kernel.org>; Mon, 06 Jan 2020 07:33:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n+X3gDNQCPJKis4fY2ahlPVwAEpWtIPaMVSozOCGWpU=;
        b=TiSNucAbK8HTdF/NmzYXvU0hVWh7Gf/Fv7zigyDlBxzS3EFf+jZ+3x3TUSjdB8xUlx
         pJkaKP53JNY0MdCtw5roaAbNn3wuqvyCvMqorcVR0ordzsf0JOujNVWbIhM2BSNuJnqU
         izzkUV7ZOjLWsHnzkm+IvvHubZQFGPqygnxqwr+QdGJYbHx4PNR1dVNF6oXjtJd/B9Jl
         AuMngFn8cPy5wixprHTGA5bYTDIckkBNCsKCDrRZ1X+uIjtxtuns/ZcKHvDU4Mhpr14x
         zrnjpWHA7jwwGRtw2k14in55vjl0NBPK7KDnjt247xUocbJJ23LMP6Tvk0dHfW9b0g5u
         G6lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n+X3gDNQCPJKis4fY2ahlPVwAEpWtIPaMVSozOCGWpU=;
        b=kWXocEPCOQPbqBofCIBwgtEc1WRztY1zx6XLxmkriVoCGH4gxqc9Ke9gPrUIP+gBw3
         UCtyWonGoVY5Zq4I0s2xSCQAklh3aEHZIzdOxLcLFEj97QowF1/U3mCruCUsnFnGnDdf
         V4hRyeoJ5AOpbxUT6OvwiO3EmqbROZTP7sZ5afqYxRfg8vWXmVd9zWNBYJWfF47leC5s
         czsJ7lBQ8UMyI+0v7Faev1ce7AJxmY9suD8ks3JOZlA21QDmh7QAO04jizwVxB97VuYj
         KwbgPotoU4LFujuRPlmBBYag76jALpScxaHRwzG3v+YWYJtIADeDC/s7v1KnfEg1orgM
         0rzw==
X-Gm-Message-State: APjAAAXZHBqyfL5eNXHdF2ndWyq4ea99fQEEdCtZIaOcJZWo1XGdRhTC
        Dbo5RfPd8DA+e0vSQ+XulqHpLg==
X-Google-Smtp-Source: APXvYqzKlHSXjewZUhF+sJW3lif4mWCDu5Ye9GYdlEISUJUs1vYvDGDGI7VBrNzLS46xveCF2q8K2Q==
X-Received: by 2002:a05:6000:12c9:: with SMTP id l9mr109002301wrx.304.1578324815418;
        Mon, 06 Jan 2020 07:33:35 -0800 (PST)
Received: from localhost.localdomain (93-137-254-179.adsl.net.t-com.hr. [93.137.254.179])
        by smtp.googlemail.com with ESMTPSA id m10sm73578046wrx.19.2020.01.06.07.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2020 07:33:35 -0800 (PST)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, linux-arm-msm@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Mon,  6 Jan 2020 16:33:24 +0100
Message-Id: <20200106153325.1281420-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200106153325.1281420-1-robert.marko@sartura.hr>
References: <20200106153325.1281420-1-robert.marko@sartura.hr>
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

