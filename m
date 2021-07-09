Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F1DF3C28AC
	for <lists+linux-arm-msm@lfdr.de>; Fri,  9 Jul 2021 19:43:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231487AbhGIRqA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 9 Jul 2021 13:46:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48072 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231453AbhGIRpz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 9 Jul 2021 13:45:55 -0400
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92A4DC0613EE
        for <linux-arm-msm@vger.kernel.org>; Fri,  9 Jul 2021 10:43:11 -0700 (PDT)
Received: by mail-oi1-x233.google.com with SMTP id l26so13124628oic.7
        for <linux-arm-msm@vger.kernel.org>; Fri, 09 Jul 2021 10:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=t+noCRKNuxgj94k9yRux6lWJbMi/RvWXTgfE54TN/88=;
        b=p/Vp0yMeaHv905rrc+hZ93HJe+AEatKJarCZtBFDi0XnqfiWrXn/CCS8LWQVRVczXz
         2/3wvgn7/1lSTkw/Q8wh3gbltpB+TfqisVu336hT2LBhNGJzpEKMRDO+SUUcdDDVJSNT
         fveakr82nLl6WtafKe4CEEdb8Fup4o3Envbf6EgQhxnAc/d3jr0i02XcDpJx+bVmq49l
         YeN75R5IMa5atFONCB+sHRRtzxx1+4eXEWXz3hQLHiR3YNkpbKVcqqNf6lPdmgwnMAlr
         63kMmmYLuMCpEWEX32JhbsS763KaTygg96f9LmD2Yy728psJQq7qa7ecBeUGz/1hFw0w
         oqaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=t+noCRKNuxgj94k9yRux6lWJbMi/RvWXTgfE54TN/88=;
        b=pgb3sjxu0tmtvyfFjX2fMcYlr533MKQcTLVE7WGGlnrvZr4IBrH5mQetAo/6kUvmhB
         4tFA/wxnsQg7cLYStK/8sdsbwkiG/rYsRJf5ieKfweTfL61JUK9XWJHvZ28xnvJW4Oz7
         0LPcTeCL8m50gF/dOV9G0x/dVAdN1+JEjA+GWssdmSVEgZ0V/mFELIu26oxTT9rS04cd
         +SNx44QJDpcH/AW/hkF60PTFES8Jmh2MfzFM3z1qwOU0g8A3ZTaGeRO48KV2R8602uvL
         dyPab/lqQDQtPfgZaBxZ1kqU14TJRIjYPpcSjRNmV43lw0ybjKyMFE/Mlhh/lbe9qhai
         LfOw==
X-Gm-Message-State: AOAM531xU9B0JEPl6i4O1ytymOP5YcY53+C00IxpJnrsKAkkrCBzUJhi
        ZfUR0E+9UFet1Nth3jwNZVXCcQ==
X-Google-Smtp-Source: ABdhPJxWoqYP392IA2o9iEpggUkzuVIAGw0yaqY4uqJpEwn7fykyON+X1r8AmkEqfgDGwID4PXhi0Q==
X-Received: by 2002:aca:f507:: with SMTP id t7mr19938344oih.42.1625852590922;
        Fri, 09 Jul 2021 10:43:10 -0700 (PDT)
Received: from localhost.localdomain (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 100sm1263446otv.32.2021.07.09.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jul 2021 10:43:10 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sibi S <sibis@codeaurora.org>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v2 2/3] dt-bindings: soc: qcom: aoss: Convert to YAML
Date:   Fri,  9 Jul 2021 10:41:41 -0700
Message-Id: <20210709174142.1274554-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210709174142.1274554-1-bjorn.andersson@linaro.org>
References: <20210709174142.1274554-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert to YAML in order to allow validation.

Reviewed-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Dropped qoutes around compatible strings
- Fixed indentation of the compatible enum members
- Picked up Rob's R-b

 .../bindings/soc/qcom/qcom,aoss-qmp.txt       |  90 --------------
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      | 114 ++++++++++++++++++
 2 files changed, 114 insertions(+), 90 deletions(-)
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
index 000000000000..93e4b737ee1b
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,aoss-qmp.yaml
@@ -0,0 +1,114 @@
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
+          - qcom,sc7180-aoss-qmp
+          - qcom,sc7280-aoss-qmp
+          - qcom,sc8180x-aoss-qmp
+          - qcom,sdm845-aoss-qmp
+          - qcom,sm8150-aoss-qmp
+          - qcom,sm8250-aoss-qmp
+          - qcom,sm8350-aoss-qmp
+      - const: qcom,aoss-qmp
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

