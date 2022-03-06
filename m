Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA324CEAE5
	for <lists+linux-arm-msm@lfdr.de>; Sun,  6 Mar 2022 12:13:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233446AbiCFLOP (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 6 Mar 2022 06:14:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52328 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231466AbiCFLNo (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 6 Mar 2022 06:13:44 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB961369DF
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 03:12:33 -0800 (PST)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 902A33F5F2
        for <linux-arm-msm@vger.kernel.org>; Sun,  6 Mar 2022 11:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1646565133;
        bh=ooKaXowXEnZxahywb1wfZAg4AWHbsKObfN/Ew6XXXRw=;
        h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
         MIME-Version;
        b=EC71rq/Id2kaQN8wEJUIlU6QDOWC9QJgq6gLV0UnGk/VdKt5036DX1yK46OZPFnhm
         8frvGuNTWB/JJyxGBbfFSJakd2KZxx2RmYtt4dth6m3Dy11OjnFksh6EyNMD/hsfyi
         Wwyddi6ZYdZA8ORIAjMRx+q8LdZlNVwtysi4siVfSbHLK7mj76Rw8NJk5A9zm5ZH39
         rRtVhwws/VUavPNurOLPrCTDB2oOQZuxC6m2iwUM4PJNPd6o8rEPGSaYSzeW3YeBgw
         yGJ4QakfVppK/QRNosncNXm6CsfdyQGTCOdiGyKbMCmEXNFK/bDoghrcVakMpxeqJU
         l/N0KC52+qSVg==
Received: by mail-ed1-f69.google.com with SMTP id da28-20020a056402177c00b00415ce4b20baso5844154edb.17
        for <linux-arm-msm@vger.kernel.org>; Sun, 06 Mar 2022 03:12:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ooKaXowXEnZxahywb1wfZAg4AWHbsKObfN/Ew6XXXRw=;
        b=eRK7avpukBcKZJsKkgqcmNUzSkXeUkLLDeaz2IObbbjramdpj3os6bACrfiesUFRCM
         1sGdUyMcHG4LosYhDvwcNN0KlfDV8Ee10WfcmYqx5ichjm2yg7Eg22gisgx1C0whAVhG
         mfcCtq7FRAF1AeZTptkV+a7og4mylzJ/109RZZBJdzFL6vXt4Las4/b4WBYdyJePX/c4
         +VEriph2CcS/nnCzMdjKtExW/ZUSTWqKo475ula3vqtlKSrNZYNX1j2Lky4taVmrpzBR
         TGNPTOZSx1n65mwKWJgDaBRYd2OsnHAXUrFN6Vlq6DURCHBMdacAfbtAlNnYE9xSOkSn
         Dqnw==
X-Gm-Message-State: AOAM533eXpFW5dhn+sdQUWyAqv0bxkZ+UBFZkYuYiVIZ4diXot8xyC9d
        BgTW5kdQfRlRK5niLtNRfZbgF0vlBqJ5oHaXLlIUk1Qg2RnYKRP/85lkvAyfSx9ICRhPo55mUHZ
        BNC8OuGCQv8UOfnj+BEmcp25XH0+9gqVEfa8b3Vi9i20=
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id m3-20020a1709061ec300b006cfd11859e2mr5452632ejj.767.1646565103211;
        Sun, 06 Mar 2022 03:11:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyZ1ed4qzxBbYzHrlnD8XX/sT7klp5jhLS9V8sQLJhk1P830VQKhrTEknvYCZVGqRqW8eDEQg==
X-Received: by 2002:a17:906:1ec3:b0:6cf:d118:59e2 with SMTP id m3-20020a1709061ec300b006cfd11859e2mr5452623ejj.767.1646565102968;
        Sun, 06 Mar 2022 03:11:42 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id a9-20020a1709066d4900b006da888c3ef0sm3720444ejt.108.2022.03.06.03.11.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Mar 2022 03:11:42 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        Avri Altman <avri.altman@wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Wei Xu <xuwei5@hisilicon.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        Jan Kotas <jank@cadence.com>, Li Wei <liwei213@huawei.com>,
        Stanley Chu <stanley.chu@mediatek.com>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-scsi@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-mediatek@lists.infradead.org
Cc:     Rob Herring <robh@kernel.org>
Subject: [PATCH v3 08/12] dt-bindings: ufs: snps,tc-dwc-g210: convert to dtschema
Date:   Sun,  6 Mar 2022 12:11:21 +0100
Message-Id: <20220306111125.116455-9-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
References: <20220306111125.116455-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Convert the Synopsys Universal Flash Storage (UFS) Controller to DT
schema format.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Reviewed-by: Rob Herring <robh@kernel.org>
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

