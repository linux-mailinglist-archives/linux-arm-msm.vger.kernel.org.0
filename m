Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E525419B1C7
	for <lists+linux-arm-msm@lfdr.de>; Wed,  1 Apr 2020 18:38:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733156AbgDAQiD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 1 Apr 2020 12:38:03 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:38859 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389050AbgDAQiD (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 1 Apr 2020 12:38:03 -0400
Received: by mail-wr1-f67.google.com with SMTP id c7so841191wrx.5
        for <linux-arm-msm@vger.kernel.org>; Wed, 01 Apr 2020 09:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura-hr.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=43B7TmRxwbH0Kz6LfG5BTdU1pIGsf8HgKKgz0zV5YhQ=;
        b=t8g4lRjSFxlPhffn+KF0Ov/OJ/X7NMp1BBL1XTnFSCRAblSqCw30mm2ZCXiWToI5/u
         uQ55QeaBYfR5L8Ro9yETs+vvD2EZc4MyexeAo9U+xh4HovklHxTMo4IUQmEq9BII33W+
         JtYHbcfmo6dqCOIq42B4xFAUjDUVtSuA+walfIpUwiYy+a5rbDUxgCLqNf6Ms8IxPSFg
         7gz5vOE57n0jBIJoDROV8lC70N840KzNOxETp1MobF1bbVEDJ2Ork6pr/LsMsvsRT+OI
         ZwGZ/y9D3xDcD5hAgtc6cz+kdelAI7iLrhzMTNe7jghavldhQgy9VCOlYkRd3SdD+ffL
         DkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=43B7TmRxwbH0Kz6LfG5BTdU1pIGsf8HgKKgz0zV5YhQ=;
        b=RaQvH8KlhEBfTPd63EIblI2c5T4aAumL5tY1IENVJuehWylJXfr/acX27Jf/LZPOcb
         7wtDxTVVvHevDzthhW1idLDVoxXRaGriCYknN0R7v1+gRNyUoVal7AmL5gd+BGenU3/U
         dhK/M7Rs89T3tTDnn8EXSsDje0RLyw/xikKHU3NcbrvtLJFEYf+O4wDJGgwcr6t+D2Q0
         OGRGJTMcpw1YAxylo8CUmVLVV/NDwgjin1Us5BCPkm8Fv05h1922uZAtGsa+61QNWEMg
         aJp085t0roPnLYe39GfzTwev58HzX08mi5J7q2OVsO98aOuuc+nguA2RiQDmhJsPuLkR
         BZMQ==
X-Gm-Message-State: ANhLgQ3MukN0sE/nFGiQhmrGWNjxQBoHb3X4OTnQnjDz8ROyHgfQjdxX
        CHuKy7rhmfP+NSWYRXOgrz+QEA==
X-Google-Smtp-Source: ADFU+vsttNZ8z9NKrPfiUCeOaS/Ky/EMaV1rDxbRCMDp1ELAHbDOcyAhwSzyVU7DFhRG3mSKbgXBwg==
X-Received: by 2002:a05:6000:1251:: with SMTP id j17mr26858172wrx.228.1585759081007;
        Wed, 01 Apr 2020 09:38:01 -0700 (PDT)
Received: from localhost.localdomain (dh207-97-209.xnet.hr. [88.207.97.209])
        by smtp.googlemail.com with ESMTPSA id t5sm3763573wrr.93.2020.04.01.09.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2020 09:38:00 -0700 (PDT)
From:   Robert Marko <robert.marko@sartura.hr>
To:     agross@kernel.org, bjorn.andersson@linaro.org, kishon@ti.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com,
        devicetree@vger.kernel.org
Cc:     Robert Marko <robert.marko@sartura.hr>,
        John Crispin <john@phrozen.org>,
        Luka Perkov <luka.perkov@sartura.hr>
Subject: [PATCH v6 2/3] dt-bindings: phy-qcom-ipq4019-usb: add binding document
Date:   Wed,  1 Apr 2020 18:35:43 +0200
Message-Id: <20200401163542.83278-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <20200401163542.83278-1-robert.marko@sartura.hr>
References: <20200401163542.83278-1-robert.marko@sartura.hr>
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
2.26.0

