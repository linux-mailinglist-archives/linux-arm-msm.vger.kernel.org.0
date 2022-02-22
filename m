Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8FEBE4BFB79
	for <lists+linux-arm-msm@lfdr.de>; Tue, 22 Feb 2022 16:00:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233118AbiBVPAs (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 22 Feb 2022 10:00:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233029AbiBVPAj (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 22 Feb 2022 10:00:39 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 79E8110E074
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 06:59:54 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5FE4340295
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 14:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645541993;
        bh=arKzCg0MYWfR0buWW2cokaDng0neBp5ISe/OJX5gEOA=;
        h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=s79/HWjw0vltJG7esBPEesb9PGJmdud05s/1suoumwCsxcDpTrK3cVJNmIfinD40G
         GS6DW74tBHkQb2T+oyzJr/2wBMpC8rxZfeaCSK8pC7ee6G3B+jGyfsbyhRMyVA9/fJ
         j3Mx6fIHDQUqbJRcorO+L2pbi0DjA+pFkqTL3pW1W57cll0x221uz+dJdOjGOecSeq
         Zcd+YMaPoHCsw9BAOpWyCzqUz/S06RUWLfbmDmnjtuqEh7xSBcahtorqz7f5tnW9VP
         yC6WB318w+IVwh0SIEzKAsAl61s7Dag5OXBwdzeILsxv9i1vhb0G2dPJ+jDk3CQjlC
         2X1p7D4pxHj8Q==
Received: by mail-ej1-f70.google.com with SMTP id i20-20020a17090671d400b006d0ed9c68c1so2600532ejk.14
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Feb 2022 06:59:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=arKzCg0MYWfR0buWW2cokaDng0neBp5ISe/OJX5gEOA=;
        b=dH5VaSpOV79YmyyqVj2WEiH8Tx2YMmZ3v8VKCxcHIeBovmquBnbMuoNhwiwxuQDIMx
         UHC8kTf6fOZ2Zww6fp06zqlX+NvZ4MptSLGr4tpw8AXwH1iBBszAMKqUNZvnXiiz5r1b
         7Ee2Rizwnxn8ZRyYpOolAF7baXjebQOgA6vW5avE0YXYR5u83V5m4GLALKK1waP3lHFX
         mLBlJhy0Jwy26cAJM6rOcmGmhYuOoW+Cb/xsBNFfsNoOmMtsiY/bYk/JRiUq2ZMjmcAE
         DPR8oLJca9czxYTvtr3/3d9J8HkAw1ZeculwAiC5EvrtVhM8EbUWPhHFi8lP0lRJaZzs
         t/JA==
X-Gm-Message-State: AOAM530e5dKGhmZUcoYw/0DFsHNOuOVooYQl6pcOhJ+PpA9Jv2vIrXSX
        5UcbHLLBfXDZNvDq30imk+kMPezOZsaiyxaADD39de1EmwF4OG25Z6QG96jTecziPnvMa04Gzq5
        WL13NDESxrysWN58JCiqmPCcCMForf1sUTz/ksdsHyRg=
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id f1-20020a056402194100b004132b5f9074mr2026080edz.414.1645541992932;
        Tue, 22 Feb 2022 06:59:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyuGCh02ChhaQcgWP8AI9k0NhxlMiAPxSs3pga+zesBZndYOMg1ZtIGJuD44dDaZzrGAARhjg==
X-Received: by 2002:a05:6402:1941:b0:413:2b5f:9074 with SMTP id f1-20020a056402194100b004132b5f9074mr2026054edz.414.1645541992714;
        Tue, 22 Feb 2022 06:59:52 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id m2sm2467960ejb.20.2022.02.22.06.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 06:59:52 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>, Nishanth Menon <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Tero Kristo <kristo@kernel.org>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Yaniv Gardi <ygardi@codeaurora.org>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Subject: [PATCH v2 08/15] dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema
Date:   Tue, 22 Feb 2022 15:58:47 +0100
Message-Id: <20220222145854.358646-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
References: <20220222145854.358646-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the Synopsys Universal Flash Storage (UFS) Controller to DT
schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 .../bindings/ufs/snps,tc-dwc-g210.yaml        | 51 +++++++++++++++++++
 .../bindings/ufs/tc-dwc-g210-pltfrm.txt       | 26 ----------
 2 files changed, 51 insertions(+), 26 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
 delete mode 100644 Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt

diff --git a/Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml b/Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
new file mode 100644
index 000000000000..671a70d95138
--- /dev/null
+++ b/Documentation/devicetree/bindings/ufs/snps,tc-dwc-g210.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/ufs/snps,tc-dwc-g210.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Synopsys DesignWare Universal Flash Storage (UFS) Controller
+
+maintainers:
+  - Li Wei <liwei213@huawei.com>
+
+# Select only our matches, not all jedec,ufs
+select:
+  properties:
+    compatible:
+      contains:
+        enum:
+          - snps,dwc-ufshcd-1.40a
+  required:
+    - compatible
+
+allOf:
+  - $ref: ufs-common.yaml
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - snps,g210-tc-6.00-20bit
+          - snps,g210-tc-6.00-40bit
+      - const: snps,dwc-ufshcd-1.40a
+      - const: jedec,ufs-2.0
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    ufs@d0000000 {
+        compatible = "snps,g210-tc-6.00-40bit",
+                     "snps,dwc-ufshcd-1.40a",
+                     "jedec,ufs-2.0";
+        reg = <0xd0000000 0x10000>;
+        interrupts = <24>;
+    };
diff --git a/Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt b/Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt
deleted file mode 100644
index 71c0777960e9..000000000000
--- a/Documentation/devicetree/bindings/ufs/tc-dwc-g210-pltfrm.txt
+++ /dev/null
@@ -1,26 +0,0 @@
-* Universal Flash Storage (UFS) DesignWare Host Controller
-
-DWC_UFS nodes are defined to describe on-chip UFS host controllers and MPHY.
-Each UFS controller instance should have its own node.
-
-Required properties:
-- compatible	: compatible list must contain the PHY type & version:
-			"snps,g210-tc-6.00-20bit"
-			"snps,g210-tc-6.00-40bit"
-		  complemented with the Controller IP version:
-			"snps,dwc-ufshcd-1.40a"
-		  complemented with the JEDEC version:
-			"jedec,ufs-1.1"
-			"jedec,ufs-2.0"
-
-- reg		: <registers mapping>
-- interrupts	: <interrupt mapping for UFS host controller IRQ>
-
-Example for a setup using a 1.40a DWC Controller with a 6.00 G210 40-bit TC:
-	dwc-ufs@d0000000 {
-		compatible = "snps,g210-tc-6.00-40bit",
-			     "snps,dwc-ufshcd-1.40a",
-			     "jedec,ufs-2.0";
-		reg = < 0xd0000000 0x10000 >;
-		interrupts = < 24 >;
-	};
-- 
2.32.0

