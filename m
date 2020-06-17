Return-Path: <linux-arm-msm-owner@vger.kernel.org>
X-Original-To: lists+linux-arm-msm@lfdr.de
Delivered-To: lists+linux-arm-msm@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 109861FCFFD
	for <lists+linux-arm-msm@lfdr.de>; Wed, 17 Jun 2020 16:52:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726896AbgFQOv5 (ORCPT <rfc822;lists+linux-arm-msm@lfdr.de>);
        Wed, 17 Jun 2020 10:51:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726878AbgFQOvz (ORCPT
        <rfc822;linux-arm-msm@vger.kernel.org>);
        Wed, 17 Jun 2020 10:51:55 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 48D8CC0613ED
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:51:55 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id z63so1261128pfb.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 17 Jun 2020 07:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3UqoEHyclqWTZ6o9P2bVTaRwTAG/SUOq+WEpN17DlXI=;
        b=Y9OrDC9hmnaZiWZ03awQhEvSEjE+uRuTYpf6VJ3V4kdyWqzAzoewW0MqirwTRACtwb
         Z8ydiqwUnj99tTs5JBdt4fcU5vXzr54yADGIOv/3pWK9zGlWl54589kDU9/bwNgm0JZw
         ofNSDYACtqdkjl5eimB61JEWjAyg0eYOOH0jU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3UqoEHyclqWTZ6o9P2bVTaRwTAG/SUOq+WEpN17DlXI=;
        b=fbMSAIJNJXPDag+/dbYUhozq18LQmAJvfGk5wNO41TmUjkL0fyj7LdL2PBghVmk85W
         mmHmKBaWfho8y3hXG7iR6+sof3OBx2z1CQ0DRG0DrgfPOzuvVgkn4Opg8vWf51bfp69T
         20Hgtu3amUgaOY6cwoB0dg+btGoyrxgGBace1HntrNxYKWjeBpebO10Tmxap6fAZoHGg
         73wMaX/HvxBEM1a/IyvRKAOvGpOpHC1QyS3/sTZLqJ+NsL0dZxiX+xHq/D36+mDdz+SX
         CvxXSlTYukJlii4VtdDeOg+G5RJ1EjfeqLAyj7GrYBHXtQzFt5LKi57RSjRQcGRaGeiT
         Nlmw==
X-Gm-Message-State: AOAM533TLjZ09mJbjUS5b8OzJmMgKugtvR/lSCOgmgAvCTZEsk5FHNaO
        e7ia002kXgt5n1RB/JvEftcsQQ==
X-Google-Smtp-Source: ABdhPJwZuUJa5t0PDpcdBoO4yQcCP6aoTAXHLpNeKnYlVkvVd6NZvxEFFbYGHs9XYEoQBDCvij/dug==
X-Received: by 2002:a63:1b20:: with SMTP id b32mr6694782pgb.39.1592405513440;
        Wed, 17 Jun 2020 07:51:53 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com ([2620:15c:202:1:24fa:e766:52c9:e3b2])
        by smtp.gmail.com with ESMTPSA id k18sm147040pfp.208.2020.06.17.07.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2020 07:51:52 -0700 (PDT)
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
Subject: [PATCH v3 2/4] dt-bindings: nvmem: Add properties needed for blowing fuses
Date:   Wed, 17 Jun 2020 07:51:14 -0700
Message-Id: <20200617074930.v3.2.I3b5c3bfaf5fb2d28d63f1b5ee92980900e3f8251@changeid>
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

On some systems it's possible to actually blow the fuses in the qfprom
from the kernel.  Add properties to support that.

NOTE: Whether this is possible depends on the BIOS settings and
whether the kernel has permissions here, so not all boards will be
able to blow fuses in the kernel.

Signed-off-by: Ravi Kumar Bokka <rbokka@codeaurora.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v3:
- Add an extra reg range (at 0x6000 offset for SoCs checked)
- Define two options for reg: 1 item or 4 items.
- No reg-names.
- Add "clocks" and "clock-names" to list of properties.
- Clock is now "sec", not "secclk".
- Add "vcc-supply" to list of properties.
- Fixed up example.

 .../bindings/nvmem/qcom,qfprom.yaml           | 45 ++++++++++++++++++-
 1 file changed, 43 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 5efa5e7c4d81..b195212c6193 100644
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
+    const: sec
+
+  # Supply reference must be provided if QFPROM is writable from the OS image.
+  vcc-supply:
+    description: Our power supply.
 
   # Needed if any child nodes are present.
   "#address-cells":
@@ -31,6 +50,28 @@ required:
    - reg
 
 examples:
+  - |
+    #include <dt-bindings/clock/qcom,gcc-sc7180.h>
+
+    efuse@784000 {
+      compatible = "qcom,qfprom";
+      reg = <0 0x00784000 0 0x8ff>,
+            <0 0x00780000 0 0x7a0>,
+            <0 0x00782000 0 0x100>,
+            <0 0x00786000 0 0x1fff>;
+      clocks = <&gcc GCC_SEC_CTRL_CLK_SRC>;
+      clock-names = "sec";
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      vcc-supply = <&vreg_l11a_1p8>;
+
+      hstx-trim-primary@25b {
+        reg = <0x25b 0x1>;
+        bits = <1 3>;
+      };
+    };
+
   - |
     efuse@784000 {
       compatible = "qcom,qfprom";
-- 
2.27.0.290.gba653c62da-goog

