Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CB64E25A3DE
	for <lists+linux-arm-msm@lfdr.de>; Wed,  2 Sep 2020 05:15:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbgIBDPA (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 1 Sep 2020 23:15:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726419AbgIBDOz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 1 Sep 2020 23:14:55 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E025C061244
        for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2020 20:14:55 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id m14so1600246qvt.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2020 20:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=marek-ca.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=+t3CtOzEXzKd9ngzhAxPof+bLlKadgwcq/2TMWIhXg0=;
        b=0nV3YimtDwOm57LodgeurSbPUlMittAm6DBRnDtpV7DhfMmNLhSHATGwXbv1TX5DXs
         ZDYtGA019IyPf5qN8RRs8jSmRCwyBD4dLUZFb6skuOeq9KkxFxWnvTnB89XTnEo9BTSi
         iT1Xbu5Z17OekTi6Om+bzus88MKeYPvJADuKd2odu9jLyiL1zrB5J9vU27bsV6maIWeH
         MPNjK5uWv1aBBVNvo/eit5myrGneLCFlFvvaSSm2oCVp6ll783Ls9GcP4L/HVTO/z3Z5
         v9CNIHrgSopexcnxFPcJhAUpc8zk7Ibdh84ufhP1s4d9nPTfuLR4s2f9nMZyuimOIHKB
         9EUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+t3CtOzEXzKd9ngzhAxPof+bLlKadgwcq/2TMWIhXg0=;
        b=hTu+zTeCusn7g26Rhlye4TH6kmBW9B4nyJltciFEz3z5dMKs96Pj07zNffHf3PMG7I
         peFeQoTWfMfmeYeq/uY9BsVuMOB68dH6+bBjhscz2SzFM/zbuNec/a4dsHOj6dk/atPc
         oI9ROM4Awk523ciKeIhyktHE4aXLA/0ulZ2PphBAOqZlkQicEUN/6ryl+LRmha9vsqpN
         RAq47HZcEPxKKGZk8karsCFap6orsf+uyf5wMZK18A5lpQKA+NzJ0KLKeCXa1CYQ5GSx
         1g4fqQJddRzM5kCAxJuf3uIYk2KjOEti0384OxAf75eOj480Co20G5m0syQ6h6s3CIls
         kDLw==
X-Gm-Message-State: AOAM530c9h8o04t7mn15Ij8gyl+baoS+O1m4B6pMXZzz67gb08VWO52g
        0A2XRJ8/3W2uUeF2oeQf0ftGdtrubiNGEkta0JY=
X-Google-Smtp-Source: ABdhPJwy9fAo2CXfJxCrL1La+C/zYqNfFksfxpZLsb6JZyMFmq8hNoL9pT5lAI+cRwJtLI+7U26GjQ==
X-Received: by 2002:a0c:8b51:: with SMTP id d17mr5044218qvc.107.1599016493650;
        Tue, 01 Sep 2020 20:14:53 -0700 (PDT)
Received: from localhost.localdomain ([147.253.86.153])
        by smtp.gmail.com with ESMTPSA id q35sm3755649qtd.75.2020.09.01.20.14.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2020 20:14:53 -0700 (PDT)
From:   Jonathan Marek <jonathan@marek.ca>
To:     linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
        devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED
        DEVICE TREE BINDINGS), linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 1/5] dt-bindings: clock: combine qcom,sdm845-videocc and qcom,sc7180-videocc
Date:   Tue,  1 Sep 2020 23:13:51 -0400
Message-Id: <20200902031359.6703-2-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20200902031359.6703-1-jonathan@marek.ca>
References: <20200902031359.6703-1-jonathan@marek.ca>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

These two bindings are almost identical, so combine them into one. This
will make it easier to add the sm8150 and sm8250 videocc bindings.

Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 .../bindings/clock/qcom,sc7180-videocc.yaml   | 65 -------------------
 ...,sdm845-videocc.yaml => qcom,videocc.yaml} | 14 ++--
 2 files changed, 9 insertions(+), 70 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
 rename Documentation/devicetree/bindings/clock/{qcom,sdm845-videocc.yaml => qcom,videocc.yaml} (76%)

diff --git a/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
deleted file mode 100644
index 2feea2b91aa9..000000000000
--- a/Documentation/devicetree/bindings/clock/qcom,sc7180-videocc.yaml
+++ /dev/null
@@ -1,65 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/clock/qcom,sc7180-videocc.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: Qualcomm Video Clock & Reset Controller Binding for SC7180
-
-maintainers:
-  - Taniya Das <tdas@codeaurora.org>
-
-description: |
-  Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SC7180.
-
-  See also dt-bindings/clock/qcom,videocc-sc7180.h.
-
-properties:
-  compatible:
-    const: qcom,sc7180-videocc
-
-  clocks:
-    items:
-      - description: Board XO source
-
-  clock-names:
-    items:
-      - const: bi_tcxo
-
-  '#clock-cells':
-    const: 1
-
-  '#reset-cells':
-    const: 1
-
-  '#power-domain-cells':
-    const: 1
-
-  reg:
-    maxItems: 1
-
-required:
-  - compatible
-  - reg
-  - clocks
-  - clock-names
-  - '#clock-cells'
-  - '#reset-cells'
-  - '#power-domain-cells'
-
-additionalProperties: false
-
-examples:
-  - |
-    #include <dt-bindings/clock/qcom,rpmh.h>
-    clock-controller@ab00000 {
-      compatible = "qcom,sc7180-videocc";
-      reg = <0x0ab00000 0x10000>;
-      clocks = <&rpmhcc RPMH_CXO_CLK>;
-      clock-names = "bi_tcxo";
-      #clock-cells = <1>;
-      #reset-cells = <1>;
-      #power-domain-cells = <1>;
-    };
-...
diff --git a/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
similarity index 76%
rename from Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
rename to Documentation/devicetree/bindings/clock/qcom,videocc.yaml
index f7a0cf53d5f0..17666425476f 100644
--- a/Documentation/devicetree/bindings/clock/qcom,sdm845-videocc.yaml
+++ b/Documentation/devicetree/bindings/clock/qcom,videocc.yaml
@@ -1,23 +1,27 @@
 # SPDX-License-Identifier: GPL-2.0-only
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/clock/qcom,sdm845-videocc.yaml#
+$id: http://devicetree.org/schemas/clock/qcom,videocc.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Qualcomm Video Clock & Reset Controller Binding for SDM845
+title: Qualcomm Video Clock & Reset Controller Binding
 
 maintainers:
   - Taniya Das <tdas@codeaurora.org>
 
 description: |
   Qualcomm video clock control module which supports the clocks, resets and
-  power domains on SDM845.
+  power domains on SDM845/SC7180.
 
-  See also dt-bindings/clock/qcom,videocc-sdm845.h.
+  See also:
+    dt-bindings/clock/qcom,videocc-sdm845.h
+    dt-bindings/clock/qcom,videocc-sc7180.h
 
 properties:
   compatible:
-    const: qcom,sdm845-videocc
+    enum:
+      - qcom,sdm845-videocc
+      - qcom,sc7180-videocc
 
   clocks:
     items:
-- 
2.26.1

