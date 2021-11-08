Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A305449A17
	for <lists+linux-arm-msm@lfdr.de>; Mon,  8 Nov 2021 17:45:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236528AbhKHQrn (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 8 Nov 2021 11:47:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241324AbhKHQrm (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 8 Nov 2021 11:47:42 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48419C061570;
        Mon,  8 Nov 2021 08:44:58 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id r28so15662128pga.0;
        Mon, 08 Nov 2021 08:44:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ln7wLqfjj3SCv5nMka9QlzmkRJFJWPr6pWa84armks8=;
        b=oIdRjzIuPlMdkqhr1Rzmsgr/hv3tRPKMlEL4GGXBjn0bRMyjkEAQCFCha3JUNFb8B8
         QWr1IEok6g28eWi+RhfllkHe3oWFz7HyGhAN66l2Aygr0y/puQlbKPB+ZPNa7BsRMGWu
         sq/T+6KTxoP0YaRF4h6duAAAsMyA90fvf9mLS6oncJPZAVnB9sf0aU2XxCYENQ2iisHf
         N/2m6SgoKw0cgmtcCmdHCsxqF8YDPQdxwvaHhrWevgcpYgsVRZaLVd4LBPQSBskTwxqW
         Y+oDlcmaWove7ld8tK+cpXTaf9AN2/sDF8ak6KIDWzN7vxiXWjSJjh/H9xuV33ygDriC
         7/RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ln7wLqfjj3SCv5nMka9QlzmkRJFJWPr6pWa84armks8=;
        b=sIePPiMPjzWTbCeIuW0TbTndKGXBVPcQ9CUtve3poNOF+7Y9JtslNe7Orw2kuoUTph
         FdfWUSD9JD9A3WNP1+yF2O25azdQY0hxC9kXtMjTCBk9yUdm4jgNxNIGWl2a9jdaQmgi
         xctR622oxO3gDQHYrgFFSsP+bS8rC7uSYIpLjrYg1Qg5AzcMH0BUtKxYY/6KEgBp1u83
         99UarNOjRnkFVt1JhbrnFXr9LbkTVc3vrvXlXmwG+1paY1Cmm7b3Ro5BiT5GnsIuTi17
         4Dp4uwUCGWeB5Zyn0mzqHk6jbtFLUir2hOIUzZj48W/S+3OX4Y+ZBV8EZUQIQfGm0iZP
         Io0Q==
X-Gm-Message-State: AOAM530ffG75dO0xPEpKGqeQyHc8GxaIQ4gjw29dCL8i5kcQRSWGpIui
        h9kMOZr8T2VGmQqkIYKjOoiCMwZBy7w=
X-Google-Smtp-Source: ABdhPJwbm5HMSMNJV4d1p5aIQFcSzI/iXaeG025iYb1RDA2d3hagIR7O9FqMQBmT7xQp+qn0kdW22Q==
X-Received: by 2002:aa7:808e:0:b0:493:f071:274f with SMTP id v14-20020aa7808e000000b00493f071274fmr609461pff.37.1636389897866;
        Mon, 08 Nov 2021 08:44:57 -0800 (PST)
Received: from jaschultz-Thelio-Major.corp.microsoft.com ([2001:4898:80e8:36:87e1:381d:5b89:8aef])
        by smtp.gmail.com with ESMTPSA id 145sm15980974pfx.87.2021.11.08.08.44.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 08:44:57 -0800 (PST)
From:   Jarrett Schultz <jaschultzms@gmail.com>
X-Google-Original-From: Jarrett Schultz <jaschultz@microsoft.com>
To:     Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Felipe Balbi <balbi@kernel.org>,
        Jarrett Schultz <jaschultzMS@gmail.com>,
        Jarrett Schultz <jaschultz@microsoft.com>
Subject: [PATCH v2 1/5] dt-bindings: platform: microsoft: Document surface xbl
Date:   Mon,  8 Nov 2021 08:44:45 -0800
Message-Id: <20211108164449.3036210-2-jaschultz@microsoft.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108164449.3036210-1-jaschultz@microsoft.com>
References: <20211108164449.3036210-1-jaschultz@microsoft.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Introduce yaml for surface xbl driver.

Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>

---

Changes in v2:
 - Removed json-schema dependence
 - Elaborated on description of driver
 - Updated example

---

 .../platform/microsoft/surface-xbl.yaml       | 57 +++++++++++++++++++
 MAINTAINERS                                   |  7 +++
 2 files changed, 64 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml

diff --git a/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
new file mode 100644
index 000000000000..09f806f373bd
--- /dev/null
+++ b/Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
@@ -0,0 +1,57 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/platform/microsoft/surface-xbl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Surface Extensible Bootloader for Microsoft Surface Duo
+
+maintainers:
+  - Jarrett Schultz <jaschultzMS@gmail.com>
+
+description: |
+  Exposes the following device information to user space via sysfs -
+    * board_id
+    * battery_present
+    * hw_init_retries
+    * is_customer_mode
+    * is_act_mode
+    * pmic_reset_reason
+    * touch_fw_version
+    * ocp_error_location
+  See sysfs documentation for more information.
+
+properties:
+  compatible:
+    const: microsoft,sm8150-surface-duo-xbl
+
+  reg:
+    maxItems: 1
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+examples:
+  - |
+    xbl@146bfa94 {
+      compatible = "microsoft,sm8150-surface-duo-xbl";
+      reg = <0x00 0x146bfa94 0x00 0x100>;
+    };
+  - |
+    imem@146bf000 {
+      compatible = "simple-mfd";
+      reg = <0x0 0x146bf000 0x0 0x1000>;
+      ranges = <0x0 0x0 0x146bf000 0x1000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      xbl@a94 {
+        compatible = "microsoft,sm8150-surface-duo-xbl";
+        reg = <0xa94 0x100>;
+      };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index eeb4c70b3d5b..8643546f8fab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12423,6 +12423,13 @@ F:	Documentation/driver-api/surface_aggregator/clients/dtx.rst
 F:	drivers/platform/surface/surface_dtx.c
 F:	include/uapi/linux/surface_aggregator/dtx.h
 
+MICROSOFT SURFACE DUO XBL DRIVER
+M:	Jarrett Schultz <jaschultz@microsoft.com>
+L:	linux-arm-msm@vger.kernel.org
+L:	platform-driver-x86@vger.kernel.org
+S:	Supported
+F:	Documentation/devicetree/bindings/platform/microsoft/surface-xbl.yaml
+
 MICROSOFT SURFACE GPE LID SUPPORT DRIVER
 M:	Maximilian Luz <luzmaximilian@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.25.1

