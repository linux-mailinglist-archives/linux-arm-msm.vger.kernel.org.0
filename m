Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E537F2E8FB7
	for <lists+linux-arm-msm@lfdr.de>; Mon,  4 Jan 2021 05:12:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727590AbhADEMb (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Sun, 3 Jan 2021 23:12:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbhADEMb (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Sun, 3 Jan 2021 23:12:31 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBD73C061796
        for <linux-arm-msm@vger.kernel.org>; Sun,  3 Jan 2021 20:11:50 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id z12so9244445pjn.1
        for <linux-arm-msm@vger.kernel.org>; Sun, 03 Jan 2021 20:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=PHjS6xkWESihBsNq4qcCg6QnCMAV/jOfgOFiTrhYkeg=;
        b=ojLWO8FyubFM7XkK10yDB4nf18PdsRA4j20KJpqb7sZyXWBg+Imh2CYq1b2xz2HiuT
         pReMw2wYur8JpJQYL4tJZqrUTASGmB6XC4V+I1s7MKoGrrbwGMgOSNtlgIWGj/yJJyUf
         NCVvFeHp0W6pdtplPyMByVXjznPFk7LAX6Y23L1M8ad+7XUk1dZyIcJOoyvLim0JPmM0
         VS2CQ883Y7pKt0PiFN+ot1HpxB7FgzCrrTsgzMCQbxGBeJjLg/j2RiXaf/0MqaZBQq43
         /xFPn4ZNQ/dPunceMZ8nJo8xYzagA694x+bmAv/HGxH044bWMSWOju1iJfhNlX5PKS1d
         e9tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=PHjS6xkWESihBsNq4qcCg6QnCMAV/jOfgOFiTrhYkeg=;
        b=VSU1MJg6aPwByNHy3rQVTXgLQ1d2D+UJhoI+Pl94OIuup1823LRff5RHas8z5KvcgH
         8hsp/3rjZ30z2vU1lDGoW9zSnSlMIoWNS0PvWcCA3fSv1oyQyv4JYMgjN3/sjQk/fs2c
         O4C0XcsW75bUN6J7g+e7Sp4Fio+v/3clNlCyZZmS67MFs1kh+6ucf7VAYvvEXc6DD2RF
         MhdvHeGVIcuauVObfWluznEEXnn65PjJlygRdcragrbcFfdf98W2maY6xTarIlrVnYq7
         cuqhJIPZlmGzsAhE4KpfErjxpUpaRUktfmPkdRveGFsqapUQD1XHBQuzo/BsO0iqmSAn
         libQ==
X-Gm-Message-State: AOAM5308zOesFNlJI+I8jFvglWrjjSuDcZC65hGoVeABh3gFNnVLW2NC
        7prC5hdZCKOdJ4TV3BxMVRqe
X-Google-Smtp-Source: ABdhPJz0Oi/0MPLCjlzMY+GUjSg/QOVFyyIvUbsJ6BWQbQmvlVxkdTnsbTINJ0kBmzF60etyR05xSw==
X-Received: by 2002:a17:902:9a44:b029:da:3d4f:abe1 with SMTP id x4-20020a1709029a44b02900da3d4fabe1mr70159622plv.16.1609733510263;
        Sun, 03 Jan 2021 20:11:50 -0800 (PST)
Received: from localhost.localdomain ([103.77.37.160])
        by smtp.gmail.com with ESMTPSA id x22sm54899930pfc.19.2021.01.03.20.11.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Jan 2021 20:11:49 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v4 1/4] dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
Date:   Mon,  4 Jan 2021 09:41:34 +0530
Message-Id: <20210104041137.113075-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
References: <20210104041137.113075-1-manivannan.sadhasivam@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add YAML binding for Qualcomm Shared Memory (SMEM) Flash partition
parser.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
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
2.25.1

