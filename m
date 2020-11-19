Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 273F92B8C14
	for <lists+linux-arm-msm@lfdr.de>; Thu, 19 Nov 2020 08:14:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725816AbgKSHNb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Thu, 19 Nov 2020 02:13:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725915AbgKSHNb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Thu, 19 Nov 2020 02:13:31 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEBDFC0613D4
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 23:13:30 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id 62so3388522pgg.12
        for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2020 23:13:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jVl81ZS9fFrGd+ufPYRPV6WNHXbkD50mNDrAZQnv39A=;
        b=fF2c5BlBENboF8Y1Nu+N/7xWoSQULa2VjGFTzkM/PYZUg9jiRfN5JYusVOEWtV9MPl
         jJYZmS5J/IlXmMNYIuXyb4V/n5xXtnf38pU9c4PJe4GeKYVCVvQgNz75dWekVZZNX+6o
         eprwSUaJ7Ouz1qi/CaVZ3on68RVP1ntMBe+7+00OyIW0/m2t7EnL1JRgLPKsvyae9K6H
         ckDeHn+mGx9YaSAe9sYoxmEPsIYolSMkg3ccFTNiYHlLeWAd79KOw/Ses7BqCK05kjSD
         qRae4SK6ns5N+JKHV4+bdFF1oyoso50x9fKdpCKBiwMrqyXG7TEJ5klCi1US9VVr5G0H
         AsXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jVl81ZS9fFrGd+ufPYRPV6WNHXbkD50mNDrAZQnv39A=;
        b=lcjArNf279bRUpjO1/18zSJl/1QaIfM37JyTSooYP0RlwdIr4OnlDNWpvTMkxkP19u
         pDCYvwmicq13e8s7zbhQg/mtwT+O/o5/lPhIEiSmeNcNfakMqFFTGwxtXBpGvLepmdzP
         taS6+hYenNkK/HS3vfotTdEa3BxS9rn4d8jlrpHIpG1RU1X+Z7JPKC9wvwZUrUyyI3PC
         4e9LZiJhpS+nWzF/127/aEb0Tf3BciTt8TQ3PYjo+wJuLkEZEIf0WKLK7ndFsada6B50
         wyj3Tq6EaRqohU5PVDHCy5GZoaoaJXt1U+mDW5jlNh+EYWc34nAiQCoHxsqxa/KAn1sW
         fx7A==
X-Gm-Message-State: AOAM532V7LEJv4drXn5kyKngZ5tLmYfzZaO9YvU47o+bsH8Xv9CXIZod
        qMyaRFoi2c2zvntrqtAkfqWk
X-Google-Smtp-Source: ABdhPJy2OIX2ioBGmz//Ste9wS23OQDzJmRj//wqH1/EVhXbCvQefRNgQX340DjN0ZtVUT25ucLIXg==
X-Received: by 2002:a17:90b:ec6:: with SMTP id gz6mr1192362pjb.142.1605770010350;
        Wed, 18 Nov 2020 23:13:30 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 12sm5491577pjt.25.2020.11.18.23.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2020 23:13:29 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 1/4] dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
Date:   Thu, 19 Nov 2020 12:43:05 +0530
Message-Id: <20201119071308.9292-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
References: <20201119071308.9292-1-manivannan.sadhasivam@linaro.org>
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
parser.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 .../mtd/partitions/qcom,smem-part.yaml        | 33 +++++++++++++++++++
 1 file changed, 33 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml

diff --git a/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
new file mode 100644
index 000000000000..cf3f8c1e035d
--- /dev/null
+++ b/Documentation/devicetree/bindings/mtd/partitions/qcom,smem-part.yaml
@@ -0,0 +1,33 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mtd/partitions/qcom,smem-part.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SMEM NAND flash partition parser binding
+
+maintainers:
+  - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
+
+description: |
+  The Qualcomm SoCs supporting the NAND controller interface features a Shared
+  Memory (SMEM) based partition table scheme. The maximum partitions supported
+  varies between partition table revisions. V3 supports maximum 16 partitions
+  and V4 supports 48 partitions.
+
+properties:
+  compatible:
+    const: qcom,smem-part
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+    flash {
+        partitions {
+            compatible = "qcom,smem-part";
+        };
+    };
-- 
2.17.1

