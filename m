Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2BCF52B6C36
	for <lists+linux-arm-msm@lfdr.de>; Tue, 17 Nov 2020 18:49:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730187AbgKQRtB (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 17 Nov 2020 12:49:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730182AbgKQRtA (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 17 Nov 2020 12:49:00 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A349C0613CF
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:49:00 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id t18so10647149plo.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2020 09:49:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=jVl81ZS9fFrGd+ufPYRPV6WNHXbkD50mNDrAZQnv39A=;
        b=hkLaoiz2lCG8tln82zm7qfOl0cDYLureyURBuaXH0PW+24+gvVK577hO5cNqI/F2aV
         +GzMDYmWlne/pkBM+dzDfJnQpgrLbniED7sUDitRpnxxKZjuzR8aLV0dYiozsnsOmwn1
         9UHgFxx1EGsPczmBiB4PDynbbKEf8EDnIK5/jsO+eUuGGwO2CW6vU/uolWJExRUfW0Ig
         G4Fn3d8qgVU/z/93B6Yaq4oInZigk7lXpZpyUcXiaajbhasY2FeLedNhRlai/r3pYYrb
         XXb4u2iaMe7ReCIl9scVlGdGRvnn7UWb7invf8vBpD0I8VswVGhoBQLc5gUaHPzdyVph
         yqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=jVl81ZS9fFrGd+ufPYRPV6WNHXbkD50mNDrAZQnv39A=;
        b=KdRragbPIS699MYmmp/k+1/fnA1dwwjQIAKaD6h9VqNrWL5TTNGdZ/Enz/v6R99b/O
         sxkGV+rS+2RpY/ze3qoYZikRquULyCit99KxbCEfqnberSZ4kv1i6sMx2kN5yCcAy22v
         g1/0E1Oy9p6HUK+MvBWn6JbkNWAAxw2XFHGJTvaZzfX4GdaziPZM1vPM8NxKZDzVmFL1
         5iE5YpBPZpaYKZ8ZtlL3kwxObXaoAl6+aRhLPtkIp190KlAnh6hm9Ee9mNaEljhiIO+F
         tyMZTvxioX1VSzk/Tm1LTP7XUny/IU9TPfEFKI+TV/sqi/3ZtK4nwbODqtv78aDwJ+L3
         yBjA==
X-Gm-Message-State: AOAM532xlrAIOKlL8yfT5RMyFo7kmjZjOXh1LrvsilzYbJsl/ibnNlzX
        /m9D1NNEUKyecimMetWheoSh
X-Google-Smtp-Source: ABdhPJxZXnb+Y1pWwUT4dnxesIRY7MEakGxf2a8hxor9743lNW9sz1zrysWJ+bDn30ZzJWekwpI2UA==
X-Received: by 2002:a17:90a:1b44:: with SMTP id q62mr201421pjq.59.1605635340003;
        Tue, 17 Nov 2020 09:49:00 -0800 (PST)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id 192sm22222810pfz.200.2020.11.17.09.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 09:48:59 -0800 (PST)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     miquel.raynal@bootlin.com, richard@nod.at, vigneshr@ti.com,
        robh+dt@kernel.org
Cc:     bjorn.andersson@linaro.org, linux-mtd@lists.infradead.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v2 1/4] dt-bindings: mtd: partitions: Add binding for Qcom SMEM parser
Date:   Tue, 17 Nov 2020 23:18:42 +0530
Message-Id: <20201117174845.28684-2-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
References: <20201117174845.28684-1-manivannan.sadhasivam@linaro.org>
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

