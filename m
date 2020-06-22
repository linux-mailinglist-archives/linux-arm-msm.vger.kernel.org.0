Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0EDA20312B
	for <lists+linux-arm-msm@lfdr.de>; Mon, 22 Jun 2020 09:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgFVH7t (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Mon, 22 Jun 2020 03:59:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725981AbgFVH7r (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Mon, 22 Jun 2020 03:59:47 -0400
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87619C061794
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 00:59:47 -0700 (PDT)
Received: by mail-oi1-x241.google.com with SMTP id t25so14817174oij.7
        for <linux-arm-msm@vger.kernel.org>; Mon, 22 Jun 2020 00:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LJgqx0FElWYNHiKP6/azPu/efC7YRPz1t5jHiyjGX5I=;
        b=z7MEDIZWSm4dSLKud1tvjbVwKfWltkWrCH4cI0Tkv27wR37A8L2ku475Fi3XjSdQvj
         CeArAWZ4pkgSR63gpxUsc3v+ckNOEqxQvGSh1E8yLb1HfwlvU+W7IL0pBYfuefbu6Cmx
         6rmcNEcfUBSwkBYwRTg1eEMYPTQPh6LNl+lzeu/YVxaOzOEnWKQ88XEvTlZR5fzRIJ6R
         duHpT4zSmYtxBQB3VFWCXIKgNqGGrOVWDDYUp0lLkX5ZW/INsyNXxylmxAITP4xyzMGj
         MfMujM7d9BFW957Np/8UfJQjdk0eabxbd8FTR4lPZ0U3n5cIv0OEEHbGImVH4P1Np+Kw
         ZrpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LJgqx0FElWYNHiKP6/azPu/efC7YRPz1t5jHiyjGX5I=;
        b=E9niO06k1E5EDevmCHOGuB6ByNMTgztmrR8Wp+nDebVEba0BMrEqvrRYfPqW49fSjq
         F7uueO9Z4rmgtypCq+dKGHS6GqjRyk7kdz4yN12sQZ3EUhYWgws46NE4Q863yM/90QmO
         HxZFjuamdfg+OttHaUKjF6A/CVKiD6fk9jsNTbN4qoZkYTgxTjkbN9JsWzLb5DvcEMgL
         QcauUROsfJy9fygAv93CKT5ES1RbcQ6EheVGNzM8xpP8j5HXi7cnO+7FFx7N9B1EQh0H
         vE057vPS6d2JD3qdbLH8X0cCdwcvDInQISI8bce6lWvRjn9ScT3I8HELQNsTVLAfVRii
         Um9w==
X-Gm-Message-State: AOAM532cDt2rMfaKff0Lj/Vs6yZ+JNrqoA6dTp8ge+Npg0pRnhqy7zOz
        RiVz9RCWRrRT9H0y2TWEMDpK5Q==
X-Google-Smtp-Source: ABdhPJwW08awvSrcBH/moxNLMZgjj2yqEijNnETVIOc23GGyh5ogpgmPd3z8sHprGv6P1VAq01Xuiw==
X-Received: by 2002:aca:da44:: with SMTP id r65mr11144475oig.124.1592812786882;
        Mon, 22 Jun 2020 00:59:46 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id f7sm3135396otl.60.2020.06.22.00.59.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2020 00:59:46 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v2 1/4] dt-bindings: hwlock: qcom: Migrate binding to YAML
Date:   Mon, 22 Jun 2020 00:59:53 -0700
Message-Id: <20200622075956.171058-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200622075956.171058-1-bjorn.andersson@linaro.org>
References: <20200622075956.171058-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Migrate the Qualcomm TCSR mutex binding to YAML to allow validation.

Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v1:
- Actually remove the old binding doc

 .../bindings/hwlock/qcom-hwspinlock.txt       | 39 --------------
 .../bindings/hwlock/qcom-hwspinlock.yaml      | 51 +++++++++++++++++++
 2 files changed, 51 insertions(+), 39 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
 create mode 100644 Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml

diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
deleted file mode 100644
index 4563f524556b..000000000000
--- a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.txt
+++ /dev/null
@@ -1,39 +0,0 @@
-Qualcomm Hardware Mutex Block:
-
-The hardware block provides mutexes utilized between different processors on
-the SoC as part of the communication protocol used by these processors.
-
-- compatible:
-	Usage: required
-	Value type: <string>
-	Definition: must be one of:
-		    "qcom,sfpb-mutex",
-		    "qcom,tcsr-mutex"
-
-- syscon:
-	Usage: required
-	Value type: <prop-encoded-array>
-	Definition: one cell containing:
-		    syscon phandle
-		    offset of the hwmutex block within the syscon
-		    stride of the hwmutex registers
-
-- #hwlock-cells:
-	Usage: required
-	Value type: <u32>
-	Definition: must be 1, the specified cell represent the lock id
-		    (hwlock standard property, see hwlock.txt)
-
-Example:
-
-	tcsr_mutex_block: syscon@fd484000 {
-		compatible = "syscon";
-		reg = <0xfd484000 0x2000>;
-	};
-
-	hwlock@fd484000 {
-		compatible = "qcom,tcsr-mutex";
-		syscon = <&tcsr_mutex_block 0 0x80>;
-
-		#hwlock-cells = <1>;
-	};
diff --git a/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
new file mode 100644
index 000000000000..71e63b52edd5
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwlock/qcom-hwspinlock.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwlock/qcom-hwspinlock.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Hardware Mutex Block
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  The hardware block provides mutexes utilized between different processors on
+  the SoC as part of the communication protocol used by these processors.
+
+properties:
+  compatible:
+    enum:
+      - qcom,sfpb-mutex
+      - qcom,tcsr-mutex
+
+  '#hwlock-cells':
+    const: 1
+
+  syscon:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description:
+      Should be a triple of phandle referencing the TCSR mutex syscon, offset
+      of first mutex within the syscon and stride between each mutex.
+
+required:
+  - compatible
+  - '#hwlock-cells'
+  - syscon
+
+additionalProperties: false
+
+examples:
+  - |
+        tcsr_mutex_block: syscon@fd484000 {
+                compatible = "syscon";
+                reg = <0xfd484000 0x2000>;
+        };
+
+        hwlock {
+                compatible = "qcom,tcsr-mutex";
+                syscon = <&tcsr_mutex_block 0 0x80>;
+
+                #hwlock-cells = <1>;
+        };
+...
-- 
2.26.2

