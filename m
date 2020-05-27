Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C79201E3881
	for <lists+linux-arm-msm@lfdr.de>; Wed, 27 May 2020 07:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726678AbgE0Ftx (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 27 May 2020 01:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726638AbgE0Ftw (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 27 May 2020 01:49:52 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6325AC03E97A
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 22:49:52 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id nu7so1078438pjb.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 26 May 2020 22:49:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6+dxUIMKQyAy42JBGRTdVZGwXErKP5C2qIWqyTzCWlw=;
        b=AinJ5BZdSrzd+mqf3e3TrKJ/RNxB4EpQKs3USnJ4HMNONq6kXq+IHalLSvmSioC2n5
         IOI30WTz7y4sjD8yg0VZecK93wmNY7SovmM5O+UwPjmndzMmELDVJXCXEJtIuzsf0NPz
         iPN8iJ4ZZbawoSEE5M/BfN5RC25bt1lrdMI7L9zQJi7UrlJYkE9u7i3AX8w4pGAQZJE9
         tFfNYCuA0NNZnlWO+cgPG5oQVEVCTK59WoxoRU0Q0qBD5j7wB7DhwgFHyfXoMRigEoTn
         rQDEMIej3kdjwE/UFeaH1Taes8njY4ZhB1Y8P+6919JBNuKrloxXHdWDxZ68xPme6ZKQ
         ZwkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6+dxUIMKQyAy42JBGRTdVZGwXErKP5C2qIWqyTzCWlw=;
        b=cKo3Fe63LwC/YELfxoV/moSQGYbmr+w2E8DIZGcwqXRsQexz4IV3Es8QAF2JpYhETp
         dgax9Hebl0dOBMb3fS5jcdCMQWBUOv97/7nxuzeDwJnLtCEVH/RelI6ixiLoCdqnEaQ4
         HtR5Z5V6e1y2scXdETWjL+C5u0Cml9Vz1VFIltJXcqfWujgUB2+GvBJXjLY4Z5lYjcol
         pSMfI/Kalg19zOG20VTc2tcr9g5hiqdKfrS+QSL6GFkamHrcxLc9OBd3RgbIRiHnPNS8
         iZYqLYXLnDH0H6H3VtXiYGAAxBsnDpM2P3mOBwsRpB3jvKH0Vn6tkdDQ2FHKRAUOHKfT
         fuCg==
X-Gm-Message-State: AOAM531ffqnI3/q0bvQsyI1xUlgDWR434Shmg8eZdxu6enAl2GjqAo8m
        KI5HWaWdI+YXQlMRJM/NrHG7UA==
X-Google-Smtp-Source: ABdhPJwHDrxBY9CDpCjhMdKuXpvS3HOC+JAK91j6QON6YO393fqoeurzBFq9A3gzs5voZpgS6sbQxg==
X-Received: by 2002:a17:90a:c791:: with SMTP id gn17mr3183530pjb.46.1590558591829;
        Tue, 26 May 2020 22:49:51 -0700 (PDT)
Received: from localhost.localdomain (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 206sm1015873pfy.97.2020.05.26.22.49.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2020 22:49:51 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Rob Herring <robh+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Vinod Koul <vkoul@kernel.org>
Subject: [PATCH v6 1/5] dt-bindings: remoteproc: Add Qualcomm PIL info binding
Date:   Tue, 26 May 2020 22:48:45 -0700
Message-Id: <20200527054850.2067032-2-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
References: <20200527054850.2067032-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

Add a devicetree binding for the Qualcomm peripheral image loader
relocation information region found in the IMEM.

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v5:
- Picked up reviewed-bys

 .../bindings/remoteproc/qcom,pil-info.yaml    | 44 +++++++++++++++++++
 1 file changed, 44 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,pil-info.yaml
new file mode 100644
index 000000000000..87c52316ddbd
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
+      reg = <0x146bf000 0x1000>;
+
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      ranges = <0 0x146bf000 0x1000>;
+
+      pil-reloc@94c {
+        compatible = "qcom,pil-reloc-info";
+        reg = <0x94c 0xc8>;
+      };
+    };
+...
-- 
2.26.2

