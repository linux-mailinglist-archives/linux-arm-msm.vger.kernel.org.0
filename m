Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4BF9917F094
	for <lists+linux-arm-msm@lfdr.de>; Tue, 10 Mar 2020 07:35:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726385AbgCJGfM (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Tue, 10 Mar 2020 02:35:12 -0400
Received: from mail-pj1-f66.google.com ([209.85.216.66]:52500 "EHLO
        mail-pj1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725919AbgCJGfM (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Tue, 10 Mar 2020 02:35:12 -0400
Received: by mail-pj1-f66.google.com with SMTP id f15so8158pjq.2
        for <linux-arm-msm@vger.kernel.org>; Mon, 09 Mar 2020 23:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=R9+Cz75X2xC9BKj2OQiTJ8bjAVhl/I7+7z1qVqyLDrM=;
        b=V1jmB1G5Zlkt0ryXphg23tulWUgLBoqk2rhFKHNbVsBmULNHNahNbtQvfwHnQ4k5Cg
         suhvai42EuD2RVxCidOf0goKxu5QLX3VPPpFjGY9IjXUQiOF3zEpiGj2lb2ZFopnXm4/
         mGQOrOHJVNNheEpS+uI5Ebb4fE1YLY2FFxXnBb9xHHG0N1k6U0HTsSPTxsNgbGAsaEly
         dd2KEAmWEaygTR71maEKvGLDo+ljqPWuVVq3Msqy2b5Z+yPRfcP4zJhm/irYg9oECXSA
         N+GZBgEJp+tBRBeHNoiA+wtuNkgFX4IJdxDMgoeSwi0vvX1vp6MGq73YhqzG7mcLj6iJ
         VM7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=R9+Cz75X2xC9BKj2OQiTJ8bjAVhl/I7+7z1qVqyLDrM=;
        b=IYiIwTbAVUJIqY3au8VwngykLcad4ETlFvCygO/tI/SB5aDL4VKhLs/w0ZXVkrrtwC
         Wolw0cBie9KCKRnA7mo+RkSjPBZBDF0YqQ6Ofsynwmuh/Bvw58gSaLZO8wh7v7QiabcY
         iUVwqs3UIO8bfJQBgQIRX76ZlDDc8ncmszmI8YFfu7oaoybWOb9Pl7+c07lEd6YuemNH
         fwHkBcvgAKarpNJJzr2UB0cEnU7ZSfRMFmtS52IgQOFoWVWfCieXw7Z6f3tNoqMAMk1s
         qvJfxLk0vk/WQOwukrDqkqfD/Nvp9I+bxPOMsTMZdOnlJWxuQP1DXs/oBq+S1Fe5+lD/
         lKaA==
X-Gm-Message-State: ANhLgQ0Wj1SoOx5cxeYb54rt7rReO7zOPqygSsFdgC+TfgLHFpBFy4rt
        uUHduC9UIaPH2I9x4c7L1wpZq7h6q6w=
X-Google-Smtp-Source: ADFU+vsrwfcreJGQ+JSaDzsnazWGtLpAqzN4oLxDhrwI8e8/gJeU2YtogiZdY8SY5DsYgbH7uyK/gQ==
X-Received: by 2002:a17:902:d70e:: with SMTP id w14mr18532590ply.181.1583822111887;
        Mon, 09 Mar 2020 23:35:11 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id v8sm1388029pjr.10.2020.03.09.23.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2020 23:35:11 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Stephen Boyd <swboyd@chromium.org>
Subject: [PATCH v4 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info binding
Date:   Mon,  9 Mar 2020 23:33:34 -0700
Message-Id: <20200310063338.3344582-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
References: <20200310063338.3344582-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a devicetree binding for the Qualcomm peripheral image loader
relocation information region found in the IMEM.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Change since v3:
- Fixed spelling mistakes pointed out by Mathieu
- Fixed description as requested by Stephen
- Specify unit address in example
- Add missing ranges in example

 .../bindings/remoteproc/qcom,pil-info.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
new file mode 100644
index 000000000000..44d87fd2a07e
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
@@ -0,0 +1,44 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/qcom,pil-info.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm peripheral image loader relocation info binding
+
+maintainers:
+  - Bjorn Andersson <bjorn.andersson@linaro.org>
+
+description:
+  The Qualcomm peripheral image loader relocation memory region, in IMEM, is
+  used for communicating remoteproc relocation information to post mortem
+  debugging tools.
+
+properties:
+  compatible:
+    const: qcom,pil-reloc-info
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+examples:
+  - |
+    imem@146bf000 {
+      compatible = "syscon", "simple-mfd";
+      reg = <0 0x146bf000 0 0x1000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      ranges = <0 0 0x146bf000 0x1000>;
+
+      pil-reloc@94c {
+        compatible = "qcom,pil-reloc-info";
+        reg = <0x94c 0xc8>;
+      };
+    };
+...
-- 
2.24.0

