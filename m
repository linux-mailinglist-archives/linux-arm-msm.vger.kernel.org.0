Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BC36221B8CC
	for <lists+linux-arm-msm@lfdr.de>; Fri, 10 Jul 2020 16:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727907AbgGJOgD (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Fri, 10 Jul 2020 10:36:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44940 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727768AbgGJOfn (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Fri, 10 Jul 2020 10:35:43 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8CBC2C08C5CE
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 07:35:43 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id k71so2705653pje.0
        for <linux-arm-msm@vger.kernel.org>; Fri, 10 Jul 2020 07:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lq4oKWfRzmN7qYUZamWAxkeEC7peEArNT9jhGOd6XaU=;
        b=NaDgU9xjbrlzCKuKJKXUa4/036wod7bsLL843LABpUNpZ9hn5vjjvgRHACaR4a8GcL
         b7y0M8WVL7PDBnebIdQ0LUQe6Wto8vjM0creMFPDPQfbBzDJdCaMpslbkS4qx2K7sp1d
         FbyRfvfKP4sIi7Nt/k2pOR2XxRCdy9w4hedZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lq4oKWfRzmN7qYUZamWAxkeEC7peEArNT9jhGOd6XaU=;
        b=fxu1qH3b1Y+jTfNu05lNzM6/e8JRMv6X4P8+XoJ8YnDqUnR8JgyXh28FrFVq8YEgRF
         r2E0RVOSrK8E71o2sZ/DttVtzNaqEB/UD2I/EWSqmoAkpJqGklInAIY4T9QQWzzQCp2r
         PPleGWFXlgYxNQPF4onYecMZF+XPzA+8uGCPnqt8h2KxJjWOdHqp8V7p23DkhpsjOAov
         FGPfmPFZgg8LqZr/kVnc4e55HqFOEbCMbMm5SQPAwlDOA55EO46jc00opGmjZsVvinVJ
         EVm3PqDKdK853HE+KHavLvSCdqbzLqiXD+AGxnPPEeEHFHJ/xRTBgijPtj19vAPKjubW
         b45Q==
X-Gm-Message-State: AOAM531lBpXZEBU+AG3M5vX5bnpaT0Q4FvJIhYSzA/lKzEQt/GfodpGV
        G9LtuJWsptTe3FRmjxNrFnJsDw==
X-Google-Smtp-Source: ABdhPJwxyfxYTqDVoC8g4o6KDNQGSf+I8n8Z/XaZn+3Etw91zJzhun1XTgFSfAfcWUW4FGpeyWZxNA==
X-Received: by 2002:a17:90a:21c3:: with SMTP id q61mr6098550pjc.207.1594391743034;
        Fri, 10 Jul 2020 07:35:43 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:42b0:34ff:fe3d:58e6])
        by smtp.gmail.com with ESMTPSA id gn5sm5951284pjb.23.2020.07.10.07.35.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2020 07:35:42 -0700 (PDT)
From:   Douglas Anderson <dianders@chromium.org>
To:     Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>
Cc:     sparate@codeaurora.org, saiprakash.ranjan@codeaurora.org,
        mturney@codeaurora.org, linux-arm-msm@vger.kernel.org,
        Jeffrey Hugo <jhugo@codeaurora.org>, dhavalp@codeaurora.org,
        rnayak@codeaurora.org, mkurumel@codeaurora.org,
        Ravi Kumar Bokka <rbokka@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 2/4] dt-bindings: nvmem: Add properties needed for blowing fuses
Date:   Fri, 10 Jul 2020 07:35:18 -0700
Message-Id: <20200710073439.v5.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200710143520.1206846-1-dianders@chromium.org>
References: <20200710143520.1206846-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-arm-msm-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-arm-msm.vger.kernel.org>
X-Mailing-List: linux-arm-msm@vger.kernel.org

From: Ravi Kumar Bokka <rbokka@codeaurora.org>

On some systems it's possible to actually blow the fuses in the qfprom
from the kernel.  Add properties to support that.

NOTE: Whether this is possible depends on the BIOS settings and
whether the kernel has permissions here, so not all boards will be
able to blow fuses in the kernel.

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---

Changes in v5: None
Changes in v4:
- Clock name is "core", not "sec".
- Example under "soc" to get #address-cells and #size-cells.

Changes in v3:
- Add an extra reg range (at 0x6000 offset for SoCs checked)
- Define two options for reg: 1 item or 4 items.
- No reg-names.
- Add "clocks" and "clock-names" to list of properties.
- Clock is now "sec", not "secclk".
- Add "vcc-supply" to list of properties.
- Fixed up example.

 .../bindings/nvmem/qcom,qfprom.yaml           | 50 ++++++++++++++++++-
 1 file changed, 48 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 39f97c1c83a4..d10a0cf91ba7 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -17,8 +17,27 @@ properties:
     const: qcom,qfprom
 
   reg:
-    items:
-      - description: The corrected region.
+    # If the QFPROM is read-only OS image then only the corrected region
+    # needs to be provided.  If the QFPROM is writable then all 4 regions
+    # must be provided.
+    oneOf:
+      - items:
+          - description: The corrected region.
+      - items:
+          - description: The corrected region.
+          - description: The raw region.
+          - description: The config region.
+          - description: The security control region.
+
+  # Clock must be provided if QFPROM is writable from the OS image.
+  clocks:
+    maxItems: 1
+  clock-names:
+    const: core
+
+  # Supply reference must be provided if QFPROM is writable from the OS image.
+  vcc-supply:
+    description: Our power supply.
 
   # Needed if any child nodes are present.
   "#address-cells":
@@ -31,6 +50,33 @@ required:
    - reg
 
 examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      efuse@784000 {
+        compatible = "qcom,qfprom";
+        reg = <0 0x00784000 0 0x8ff>,
+              <0 0x00780000 0 0x7a0>,
+              <0 0x00782000 0 0x100>,
+              <0 0x00786000 0 0x1fff>;
+        clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
+        clock-names = "core";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        vcc-supply = <&vreg_l11a_1p8>;
+
+        hstx-trim-primary@25b {
+          reg = <0x25b 0x1>;
+          bits = <1 3>;
+        };
+      };
+    };
+
   - |
     soc {
       #address-cells = <2>;
-- 
2.27.0.383.g050319c2ae-goog

