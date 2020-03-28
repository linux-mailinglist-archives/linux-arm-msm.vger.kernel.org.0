Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1B2EB196677
	for <lists+linux-arm-msm@lfdr.de>; Sat, 28 Mar 2020 14:57:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726225AbgC1N5I (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sat, 28 Mar 2020 09:57:08 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:43598 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbgC1N5I (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sat, 28 Mar 2020 09:57:08 -0400
Received: by mail-wr1-f52.google.com with SMTP id m11so9287367wrx.10
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Mar 2020 06:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xIqHE13U/i0v3PqXW0HmQsSKVk6SvsqXk09Jrzg6L0=;
        b=0BsbxrJ+iM9J49VyyuaHhYXq7/hF14OBAD3duC00VAV1CIIYLQGd9AGObfmdQijemc
         X1I2dPUorSAOvW+A66rorHMZS9bknQAsEsMX6CF9uSvX6TftZNC2Fhg0z4npUgsqD3e+
         WbYyrQrFhDDMctyY5X/L4mCe7K5lCwmfii0Q66HXm9h6VuQhtTYeYbtkNCr7A+/RZ3Fw
         /F/5oY/WXc/KIaoLulEAu6sEBz6ixoUybFPJvofj7Nx7NgJLIUT53RAOcZ9a75Xbh6/H
         7R8cmtFK59gECqWViOn+qIq5kcutBpakSrRZ2zj0Gtm9PWWQ0x7Ibqs3Ttn18Egr2fxo
         nVkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xIqHE13U/i0v3PqXW0HmQsSKVk6SvsqXk09Jrzg6L0=;
        b=hpiktV7hvcxWeOBNbLRtENrM6wfzrXFMLyDs4vikTu/rH5XChIRhriSqiht31Z/jeu
         nmD/4hHSJ3NQA/pJx0HTs1+9PL/73Bj7ytgCVlp5pKGjuKXGdvZF7LeCcijbOL1uj4Nd
         4CE1jJP0trcqmDt5ZQWFGhmGuko5rTVol+3EXLetZWR8S6chN24dQAZ/q0MNUkZAFMT9
         qDNqI0ot50mnA6B5Zo9HoS7LsEKzeNGk4WyB936rs9IKNxgKlyrA/DRZP4NK+5FS44Cv
         BIhYKmq+JAxS+odYSCuUt6FekoJEfzRdatKcSGL3cqq9jaa40BXzZGNNwAUeiJjiJeke
         I44w==
X-Gm-Message-State: ANhLgQ0CKIJEcU07SQw1IfVhjXzYwQJW6uoXd+BQG8CYviRj4taTZ+oJ
        MaFluLLEeGViU6HmRLUTXWYtfA==
X-Google-Smtp-Source: ADFU+vuQg0QSZwrB3cqzvruejikf5pzIwdAEuCgJfOCdbhAHtF7zjb0P3ymSOuXcBoEW7bF6hKhOUw==
X-Received: by 2002:adf:f88b:: with SMTP id u11mr4911276wrp.84.1585403825769;
        Sat, 28 Mar 2020 06:57:05 -0700 (PDT)
Received: from localhost.localdomain (dh207-96-177.xnet.hr. [88.207.96.177])
        by smtp.googlemail.com with ESMTPSA id f12sm8461975wrm.94.2020.03.28.06.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Mar 2020 06:57:05 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v4 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Sat, 28 Mar 2020 14:53:49 +0100
Message-Id: <20200328135345.695622-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200328135345.695622-1-robert.marko@sartura.hr>
References: <20200328135345.695622-1-robert.marko@sartura.hr>
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
2.26.0

