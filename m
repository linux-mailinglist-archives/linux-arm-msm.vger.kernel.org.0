Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8BE083B4B05
	for <lists+linux-arm-msm@lfdr.de>; Sat, 26 Jun 2021 01:41:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229956AbhFYXnx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 25 Jun 2021 19:43:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229940AbhFYXnw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 25 Jun 2021 19:43:52 -0400
Received: from mail-oi1-x229.google.com (mail-oi1-x229.google.com [IPv6:2607:f8b0:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AEBB1C061766
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:41:29 -0700 (PDT)
Received: by mail-oi1-x229.google.com with SMTP id 84so13267848oie.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 25 Jun 2021 16:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xXMgn3VYcZ/fjrwGFskgXEFTFnNjWzpzusEfJ9+1fAs=;
        b=upH+GipOhPusTnfa8NnUKPzsKUoeQYOqAaLefYqjtRLhiR3/WaYEaAP0ha/bqOX/Qt
         N5oVbPBNJzYnJ9R1w5JTRlTpL3mmMMqatY4e7a+C6IF20VsF6J8L6GZhXTDJQy+M+Rqq
         duMVJtwnrHtg1WmD9WoIYiCuqufza5qimWG+z402EW1zRNNhVoTSUyCmoHEIkj5odZCm
         BUnSAPa+2j4/GGjPVCOX3eOeZfRjD9lc2UaMLCtsJisK4IzpchXfFbGxWMAUDErkHgoa
         rDDiZW6Y6tC6ovqDKzCly9W44dkYV/mxG0ZqE9lo+icAqImZBXYlM5e1j/fOmZvIhgOD
         ReUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xXMgn3VYcZ/fjrwGFskgXEFTFnNjWzpzusEfJ9+1fAs=;
        b=lCSLSTtQCnKh6x+EUWlcK1mTEO1NHbcTgu+5YRDYcQOX5NP1ranuBbX9xPoqo6XSAg
         sKeNHzxfZZhEKH+eHuGl0M1PcZ09DEcXQpeKLKrkP/TPvpKk+ZkR3LnXoTuGwNpqqCE2
         R/5Yj6SKetiiGkWxpkDvYNuo5Z7z7nkTVlLau1LC6CNlSJjJi+CG+9V3gZHgB6Dh9o3Q
         Wx7D6JuUJr8dYeXs86EAoP60c9tHLJxxa1FQW6QmyUuZyMOM/oZSBAdmH70zYQBl/JYt
         71t/gVpqygbVlP/GTA7frvqcdfneoBdA7AWKk0RJ0VFTyj+pIh/VAwfT1v0718M/OaUz
         xvdQ==
X-Gm-Message-State: AOAM532LDLBFemoAuRWYvZC3qnCocgAc2cizRLrI70LUa8VrU7bfw+0y
        2EdrelonKbF1KJelj07xRhZ4Hg==
X-Google-Smtp-Source: ABdhPJxmWcCTXAEVZCGzhtvGKykECeK8FkZ0mlncvEFhuTBKq+HdwH/+YpPv5YM6oCN6hFPYxgSELQ==
X-Received: by 2002:aca:1c1a:: with SMTP id c26mr9714671oic.39.1624664489009;
        Fri, 25 Jun 2021 16:41:29 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id u10sm1844267otj.75.2021.06.25.16.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Jun 2021 16:41:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, Sibi S <sibis@codeaurora.org>
Cc:     linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dt-bindings: soc: qcom: aoss: Convert to YAML
Date:   Fri, 25 Jun 2021 16:40:17 -0700
Message-Id: <20210625234018.1324681-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
References: <20210625234018.1324681-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert to YAML in order to allow validation.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

I'm aware that this conflicts with Sibi's removal of '#power-domain-cells', but
that's a trivial change regardless of which of the two patches gets in first.

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  90 --------------
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      | 115 ++++++++++++++++++
 2 files changed, 115 insertions(+), 90 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
 create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
deleted file mode 100644
index 3747032311a4..000000000000
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.txt
+++ /dev/null
@@ -1,90 +0,0 @@
-Qualcomm Always-On Subsystem side channel binding
-
-This binding describes the hardware component responsible for side channel
-requests to the always-on subsystem (AOSS), used for certain power management
-requests that is not handled by the standard RPMh interface. Each client in the
-SoC has it's own block of message RAM and IRQ for communication with the AOSS.
-The protocol used to communicate in the message RAM is known as Qualcomm
-Messaging Protocol (QMP)
-
-The AOSS side channel exposes control over a set of resources, used to control
-a set of debug related clocks and to affect the low power state of resources
-related to the secondary subsystems. These resources are exposed as a set of
-power-domains.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,sc7180-aoss-qmp"
-		    "qcom,sc7280-aoss-qmp"
-		    "qcom,sc8180x-aoss-qmp"
-		    "qcom,sdm845-aoss-qmp"
-		    "qcom,sm8150-aoss-qmp"
-		    "qcom,sm8250-aoss-qmp"
-		    "qcom,sm8350-aoss-qmp"
-		    and:
-		    "qcom,aoss-qmp"
-
-- reg:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: the base address and size of the message RAM for this
-		    client's communication with the AOSS
-
-- interrupts:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: should specify the AOSS message IRQ for this client
-
-- mboxes:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: reference to the mailbox representing the outgoing doorbell
-		    in APCS for this client, as described in mailbox/mailbox.txt
-
-- #clock-cells:
-	Usage: optional
-	Value type: <u32>
-	Definition: must be 0
-		    The single clock represents the QDSS clock.
-
-- #power-domain-cells:
-	Usage: optional
-	Value type: <u32>
-	Definition: must be 1
-		    The provided power-domains are:
-		    CDSP state (0), LPASS state (1), modem state (2), SLPI
-		    state (3), SPSS state (4) and Venus state (5).
-
-= SUBNODES
-The AOSS side channel also provides the controls for three cooling devices,
-these are expressed as subnodes of the QMP node. The name of the node is used
-to identify the resource and must therefor be "cx", "mx" or "ebi".
-
-- #cooling-cells:
-	Usage: optional
-	Value type: <u32>
-	Definition: must be 2
-
-= EXAMPLE
-
-The following example represents the AOSS side-channel message RAM and the
-mechanism exposing the power-domains, as found in SDM845.
-
-  aoss_qmp: qmp@c300000 {
-	  compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
-	  reg = <0x0c300000 0x100000>;
-	  interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
-	  mboxes = <&apss_shared 0>;
-
-	  #power-domain-cells = <1>;
-
-	  cx_cdev: cx {
-		#cooling-cells = <2>;
-	  };
-
-	  mx_cdev: mx {
-		#cooling-cells = <2>;
-	  };
-  };
diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
new file mode 100644
index 000000000000..1b9de8e49356
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -0,0 +1,115 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/qcom/qcom,aoss-qmp.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Always-On Subsystem side channel binding
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  This binding describes the hardware component responsible for side channel
+  requests to the always-on subsystem (AOSS), used for certain power management
+  requests that is not handled by the standard RPMh interface. Each client in the
+  SoC has it's own block of message RAM and IRQ for communication with the AOSS.
+  The protocol used to communicate in the message RAM is known as Qualcomm
+  Messaging Protocol (QMP)
+
+  The AOSS side channel exposes control over a set of resources, used to control
+  a set of debug related clocks and to affect the low power state of resources
+  related to the secondary subsystems. These resources are exposed as a set of
+  power-domains.
+
+properties:
+  compatible:
+    items:
+      - enum:
+        - "qcom,sc7180-aoss-qmp"
+        - "qcom,sc7280-aoss-qmp"
+        - "qcom,sc8180x-aoss-qmp"
+        - "qcom,sdm845-aoss-qmp"
+        - "qcom,sm8150-aoss-qmp"
+        - "qcom,sm8250-aoss-qmp"
+        - "qcom,sm8350-aoss-qmp"
+      - const: "qcom,aoss-qmp"
+
+  reg:
+    maxItems: 1
+    description:
+      The base address and size of the message RAM for this client's
+      communication with the AOSS
+
+  interrupts:
+    maxItems: 1
+    description:
+      Should specify the AOSS message IRQ for this client
+
+  mboxes:
+    maxItems: 1
+    description:
+      Reference to the mailbox representing the outgoing doorbell in APCS for
+      this client, as described in mailbox/mailbox.txt
+
+  "#clock-cells":
+    const: 0
+    description:
+      The single clock represents the QDSS clock.
+
+  "#power-domain-cells":
+    const: 1
+    description: |
+        The provided power-domains are:
+        CDSP state (0), LPASS state (1), modem state (2), SLPI
+        state (3), SPSS state (4) and Venus state (5).
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - mboxes
+  - "#clock-cells"
+  - "#power-domain-cells"
+
+additionalProperties: false
+
+patternProperties:
+  "^(cx|mx|ebi)$":
+    type: object
+    description:
+      The AOSS side channel also provides the controls for three cooling devices,
+      these are expressed as subnodes of the QMP node. The name of the node is
+      used to identify the resource and must therefor be "cx", "mx" or "ebi".
+
+    properties:
+      "#cooling-cells":
+        const: 2
+
+    required:
+      - "#cooling-cells"
+
+    additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    aoss_qmp: qmp@c300000 {
+      compatible = "qcom,sdm845-aoss-qmp", "qcom,aoss-qmp";
+      reg = <0x0c300000 0x100000>;
+      interrupts = <GIC_SPI 389 IRQ_TYPE_EDGE_RISING>;
+      mboxes = <&apss_shared 0>;
+
+      #clock-cells = <0>;
+      #power-domain-cells = <1>;
+
+      cx_cdev: cx {
+        #cooling-cells = <2>;
+      };
+
+      mx_cdev: mx {
+        #cooling-cells = <2>;
+      };
+    };
+...
-- 
2.29.2

