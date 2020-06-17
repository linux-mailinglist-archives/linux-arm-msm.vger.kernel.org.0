Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3F06D1FD002
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 16:52:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726890AbgFQOwF (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 10:52:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726867AbgFQOvy (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 10:51:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EBCC061755
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:51:52 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id ga6so1119434pjb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=uQNrRwJqZFm26JwXJp03T56X5IKX8trjl7fZDLpzVTg=;
        b=j5cilfo02OZyPiNli2fKchLTe4cDTPoKnc6RugN2HRfcGC+a6woONHl7YkwnSJvVmW
         jGfznBcaPBTz+GX2L0FQF8hCHyIOjuCCScEsqECshm/MIEi7bKc6nk/h6NjLhzRqVgvw
         NtknhjCZYdOsh1x++jO+LchBSlXayjShKJ2a4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=uQNrRwJqZFm26JwXJp03T56X5IKX8trjl7fZDLpzVTg=;
        b=FHkSam1aexn/oCmCKexGnVdrREWOMMaq66MvyprevAVxgYmJTG5vF71wtraB1n8J8z
         7j+o3Vkfv6GoRU9DJbeL33iOT55m6pHWzAM9VbhCTlM+NQVr9Wu4r+dnYMt3ifuOFk9D
         uHFH/T6ju7HODu7EXTHxPhU2bGmlkQem1Ky0rLd1wp69/6nyGtlM76mIpr10ar3OHbSf
         vpZIaJJcYSZ1vga+QW1Tx9w7db/1GbsAi/qGXxLtQ2J5mIJc1vdk+futUyg3QpsAUZmD
         vFUFzDjPS8TaAICIiqUBXHb9G/fn09dCb22/ykrqmCZyFanbjfvejwvC1OhaIRrZL1x5
         QH+A==
X-Gm-Message-State: AOAM5312Uvaar2Yz91q2KivZJJZF5/FSRJ6rv8ksMnzdJJR9y+NG3AdY
        pQBHhUAUkVcFifThzf0hJ4OiXw==
X-Google-Smtp-Source: ABdhPJzvAKe+FEC96+3+A3FgPuJXrPvNuL6kGgmiv0tWmirzC3EusqI6ZRpN3aOnv3YcKJ5GBjDL6Q==
X-Received: by 2002:a17:902:7c96:: with SMTP id y22mr6727849pll.293.1592405512013;
        Wed, 17 Jun 2020 07:51:52 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id k18sm147040pfp.208.2020.06.17.07.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:51:51 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     dhavalp@codeaurora.org, mturney@codeaurora.org,
        rnayak@codeaurora.org, Ravi Kumar Bokka <rbokka@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, saiprakash.ranjan@codeaurora.org,
        sparate@codeaurora.org, mkurumel@codeaurora.org,
        Douglas Anderson <dianders@chromium.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/4] dt-bindings: nvmem: qfprom: Convert to yaml
Date:   Wed, 17 Jun 2020 07:51:13 -0700
Message-Id: <20200617074930.v3.1.Iea2704ec2cb40c00eca47781c310a6330ac5dd41@changeid>
X-Mailer: git-send-email 2.27.0.290.gba653c62da-goog
In-Reply-To: <20200617145116.247432-1-dianders@chromium.org>
References: <20200617145116.247432-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ravi Kumar Bokka <rbokka@codeaurora.org>

This switches the bindings over from txt to yaml.

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Split conversion to yaml into separate patch new in v3.
- Use 'const' for compatible instead of a 1-entry enum.
- Changed filename to match compatible string.
- Add #address-cells and #size-cells to list of properties.
- Fixed up example.

 .../bindings/nvmem/qcom,qfprom.yaml           | 45 +++++++++++++++++++
 .../devicetree/bindings/nvmem/qfprom.txt      | 35 ---------------
 2 files changed, 45 insertions(+), 35 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
 delete mode 100644 Documentation/devicetree/bindings/nvmem/qfprom.txt

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
new file mode 100644
index 000000000000..5efa5e7c4d81
--- /dev/null
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/nvmem/qcom,qfprom.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies Inc, QFPROM Efuse bindings
+
+maintainers:
+  - Ravi Kumar Bokka <rbokka@codeaurora.org>
+
+allOf:
+  - $ref: "nvmem.yaml#"
+
+properties:
+  compatible:
+    const: qcom,qfprom
+
+  reg:
+    items:
+      - description: The corrected region.
+
+  # Needed if any child nodes are present.
+  "#address-cells":
+    const: 1
+  "#size-cells":
+    const: 1
+
+required:
+   - compatible
+   - reg
+
+examples:
+  - |
+    efuse@784000 {
+      compatible = "qcom,qfprom";
+      reg = <0 0x00784000 0 0x8ff>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      hstx-trim-primary@1eb {
+        reg = <0x1eb 0x1>;
+        bits = <1 4>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/nvmem/qfprom.txt b/Documentation/devicetree/bindings/nvmem/qfprom.txt
deleted file mode 100644
index 26fe878d5c86..000000000000
--- a/Documentation/devicetree/bindings/nvmem/qfprom.txt
+++ /dev/null
@@ -1,35 +0,0 @@
-= Qualcomm QFPROM device tree bindings =
-
-This binding is intended to represent QFPROM which is found in most QCOM SOCs.
-
-Required properties:
-- compatible: should be "qcom,qfprom"
-- reg: Should contain registers location and length
-
-= Data cells =
-Are child nodes of qfprom, bindings of which as described in
-bindings/nvmem/nvmem.txt
-
-Example:
-
-	qfprom: qfprom@700000 {
-		compatible 	= "qcom,qfprom";
-		reg		= <0x00700000 0x8000>;
-		...
-		/* Data cells */
-		tsens_calibration: calib@404 {
-			reg = <0x4404 0x10>;
-		};
-	};
-
-
-= Data consumers =
-Are device nodes which consume nvmem data cells.
-
-For example:
-
-	tsens {
-		...
-		nvmem-cells = <&tsens_calibration>;
-		nvmem-cell-names = "calibration";
-	};
-- 
2.27.0.290.gba653c62da-goog

